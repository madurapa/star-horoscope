#!/usr/bin/env python3
"""Exp B driver: instrument the Real-write rounder to record its guard digit.
Usage: expB.py NAME "Y M D" "H M" CITY
- Lua-A: full inputs + method(N), exit (program waiting, code resident).
- Host: search CS for rounder site bytes, verify, write 9-byte recorder.
- Lua-B: 25 Enters to end.
- Snapshot dseg -> report scratch byte at 0x7900.
"""
import json
import os
import subprocess
import sys
import time
import urllib.request

API = "http://localhost:8386"
TOKEN = open(os.path.expanduser("~/.config/dosbox-automation/webserver/api_token")).read().strip()


def api(method, path, data=None, ctype=None):
    headers = {"Authorization": "Bearer " + TOKEN}
    if ctype:
        headers["Content-Type"] = ctype
    req = urllib.request.Request(API + path, data=data, headers=headers,
                                 method=method)
    with urllib.request.urlopen(req, timeout=15) as r:
        return r.read()


def lua_run(script, name):
    open("/tmp/expB.lua", "w").write(script)
    api("POST", "/api/v1/script/stop")
    time.sleep(0.5)
    r = api("POST", "/api/v1/script/load?name=%s&debug=false" % name,
            open("/tmp/expB.lua", "rb").read(), "text/plain")
    print("load:", r[:80])
    api("POST", "/api/v1/script/start")
    time.sleep(3)


def lua_status():
    return json.loads(api("GET", "/api/v1/script/status"))


def screen():
    import urllib.parse
    t = api("GET", "/api/v1/video/text")
    return json.loads(t).get("text", "")


def mem_read(seg, off, ln):
    return api("GET", "/api/v1/memory/%s/0x%x/0x%x" % (seg, off, ln))


def mem_write(seg, off, data):
    return api("PUT", "/api/v1/memory/%s/0x%x" % (seg, off), data,
               "application/octet-stream")


def main():
    name, bdate, btime, city = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
    lua_a = """dosbox.wait_for_text("C:", 3600)
dosbox.wait_frames(30)
dosbox.type("STAR.EXE\\n")
dosbox.wait_for_text("YOUR STARS", 600)
dosbox.type("\\n")
dosbox.wait_for_text("Name ?", 600)
dosbox.type("%s\\n")
dosbox.wait_for_text("Birth date", 600)
dosbox.type("%s\\n")
dosbox.wait_for_text("Birth time", 600)
dosbox.type("%s\\n")
dosbox.wait_for_text("Closest city", 600)
dosbox.type("%s\\n")
dosbox.wait_frames(30)
dosbox.type("\\n")
dosbox.wait_frames(60)
dosbox.output["stage"] = "inputs-done"
""" % (name, bdate, btime, city)
    lua_run(lua_a, "expB_A")
    # wait for stage
    for _ in range(60):
        st = lua_status()
        if st.get("output", {}).get("stage") == "inputs-done" or st.get("state") == "completed":
            break
        time.sleep(2)
    print("stage A done; screen head:")
    print(screen()[:300].replace("\n", " | "))
    # live CS + search rounder site: bytes 80 7A EC 35 C6 42 EC 00 (dword search on first 4)
    regs = json.loads(api("GET", "/api/v1/cpu/state"))["registers"]
    print("CS=%d(0x%x) DS=%d IP=%d" % (regs["cs"], regs["cs"], regs["ds"], regs["eip"]))
    # search whole conventional RAM for dword 0x35EC7A80
    import struct
    body = json.dumps({"value": 0x35EC7A80, "width": 4, "start": 0, "end": 0xA0000}).encode()
    hits = json.loads(api("POST", "/api/v1/memory/search", body, "application/json"))["matches"]
    print("pattern hits:", [hex(h) for h in hits[:10]])
    cands = []
    for h in hits[:10]:
        ctx = api("GET", "/api/v1/memory/0x%x/0x10" % h)
        # ctx may be raw bytes
        if ctx[0:10] == bytes([0x80, 0x7A, 0xEC, 0x35, 0xC6, 0x42, 0xEC, 0x00, 0x72, 0x1A]):
            cands.append(h)
            print("  CANDIDATE %#x ctx=%s" % (h, ctx[:12].hex()))
    if not cands:
        print("NO CANDIDATE FOUND")
        return
    mode = sys.argv[5] if len(sys.argv) > 5 else "guard"
    if mode == "si":
        # si recorder (6B + nops): observes rounding index (expect 10 for JD)
        patch = bytes([0x56, 0x89, 0x36, 0x00, 0x79, 0x5E, 0x90, 0x90, 0x90, 0x90])
    else:
        # guard recorder, CORRECT [BP+SI] form (8A 42 EC): observes the
        # rounding digit at the live si (expect buffer[10] for JD ties)
        patch = bytes([0x56, 0x89, 0x36, 0x00, 0x79, 0x5E, 0x90, 0x90, 0x90, 0x90])
    # linear-form write at physical hit address
    r = api("PUT", "/api/v1/memory/0x%x" % h, patch, "application/octet-stream")
    print("patch resp:", r[:120])
    # verify
    back = api("GET", "/api/v1/memory/0x%x/0xA" % h)
    print("verify:", back.hex(), "OK" if back == patch else "MISMATCH")
    # Lua-B: advance to screen13 (KALA HORAVA) and HOLD: screen12's JD print
    # is complete, and no later Real prints have run yet (dasa/kendra are
    # ints/names). dseg scratch therefore holds JD's guard.
    lua_b = """for i = 1, 40 do
    if dosbox.screen_match("KALA HORAVA") then break end
    dosbox.wait_frames(60)
    dosbox.type("\\n")
end
if dosbox.screen_match("KALA HORAVA") then
    dosbox.output["stage"] = "screen13"
else
    dosbox.output["stage"] = "run-done"
end
"""
    lua_run(lua_b, "expB_B")
    segs = {}
    for _ in range(120):
        st = lua_status()
        try:
            regs2 = json.loads(api("GET", "/api/v1/cpu/state"))["registers"]
            segs[(regs2["cs"], regs2["ds"])] = regs2["eip"]
        except Exception:
            pass
        if st.get("output", {}).get("stage") in ("screen13", "run-done") or st.get("state") == "completed":
            print("stage B:", st.get("output", {}).get("stage"), st.get("state"))
            break
        time.sleep(2)
    print("stage B done")
    # discover STAR's segments: tight poll DURING execution (screens render
    # = STAR code running; idle = BIOS). Collect distinct (CS,DS) pairs.
    segs = {}
    import datetime
    t0 = time.time()
    while time.time() - t0 < 45:
        try:
            regs2 = json.loads(api("GET", "/api/v1/cpu/state"))["registers"]
            segs[(regs2["cs"], regs2["ds"])] = regs2["eip"]
        except Exception:
            pass
        time.sleep(0.05)
    print("seen segs:", {("%#x" % c, "%#x" % d): e for (c, d), e in segs.items()})
    star = [(c, d) for (c, d) in segs if c not in (0xF000, 0)]
    if not star:
        # fall back: locate dseg via entered name string
        import struct
        body = json.dumps({"value": 0, "width": 1, "start": 0, "end": 0xA0000}).encode()
        ds = regs["ds"]
        print("DS fallback:", ds)
    raw = api("GET", "/api/v1/memory/DS/0x7900/0x10")
    print("scratch[0x7900]:", raw.hex(), "ascii:", raw[:8])


if __name__ == "__main__":
    main()

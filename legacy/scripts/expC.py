#!/usr/bin/env python3
"""Exp C (clean): record rounder guard/si for the JD print via 10-byte patch.
Usage: expC.py NAME "Y M D" "H M" CITY {guard|si}
- Lua-A: full inputs + method(N), exit (program waiting).
- Host: verify rounder site bytes at 0x18F68, write 10B recorder patch.
- Lua-B: advance until screen12 (JULIAN DATE) shows, HOLD (no more Enters).
  screen12 renders atomically; its later lines are int/DMS formats, so the
  scratch unambiguously holds the JD print's guard/si. No later Real prints.
- Snapshot DS:0x7900 -> decode. Cleanup: restore code, zero scratch, exit.
Token is re-read every launch (it recreates per launch).
"""
import json
import os
import sys
import time
import urllib.request

API = "http://localhost:8386"
SITE = bytes([0x80, 0x7A, 0xEC, 0x35, 0xC6, 0x42, 0xEC, 0x00, 0x72, 0x1A])
SITE_ADDR = 0x18F68


def token():
    return open(os.path.expanduser("~/.config/dosbox-automation/webserver/api_token")).read().strip()


def api(method, path, data=None, ctype=None):
    for _ in range(3):
        try:
            headers = {"Authorization": "Bearer " + token()}
            if ctype:
                headers["Content-Type"] = ctype
            req = urllib.request.Request(API + path, data=data, headers=headers,
                                         method=method)
            with urllib.request.urlopen(req, timeout=20) as r:
                return r.read()
        except Exception as e:
            print("api retry", path, str(e)[:80])
            time.sleep(2)
    raise RuntimeError("api failed " + path)


def lua_run(script, name):
    open("/tmp/expC.lua", "w").write(script)
    api("POST", "/api/v1/script/stop")
    time.sleep(0.5)
    r = api("POST", "/api/v1/script/load?name=%s&debug=false" % name,
            open("/tmp/expC.lua", "rb").read(), "text/plain")
    api("POST", "/api/v1/script/start")
    time.sleep(3)


def lua_status():
    return json.loads(api("GET", "/api/v1/script/status"))


def mem_read(addr, ln):
    return api("GET", "/api/v1/memory/0x%x/0x%x" % (addr, ln))


def mem_write(addr, data):
    return api("PUT", "/api/v1/memory/0x%x" % addr, data, "application/octet-stream")


def main():
    name, bdate, btime, city = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
    mode = sys.argv[5] if len(sys.argv) > 5 else "guard"
    # nopatch: verify site only, write nothing (clean-history control run).
    if mode == "nopatch":
        patch = None
    # forcetrunc2: flip ONLY the jb (72 1A -> EB 1A, 2 bytes). Terminator,
    # registers, stack, flags all identical; only branch direction changes
    # (always truncate). Minimal possible perturbation.
    if mode == "forcetrunc2":
        patch = bytes([0xEB, 0x1A])
    # cleanrun: NO dseg writes at all (tests Heisenberg effect of scratch
    # recorder): null-terminate + skip to output, 4 nops
    if mode == "cleanrun":
        patch = bytes([0xC6, 0x42, 0xEC, 0x00, 0xEB, 0x1E, 0x90, 0x90, 0x90, 0x90])
    # forcetrunc: null-terminate at live si + skip to output (reveals buffer
    # digits verbatim on screen12's JD line; garbage tail possible)
    if mode == "forcetrunc":
        patch = bytes([0xC6, 0x42, 0xEC, 0x00, 0xEB, 0x1E, 0x90, 0x90, 0x90, 0x90])
    if mode == "si":
        # si recorder (6B + nops): observes rounding index (expect 10 for JD)
        patch = bytes([0x56, 0x89, 0x36, 0x00, 0x79, 0x5E, 0x90, 0x90, 0x90, 0x90])
        assert len(patch) == 10
    elif mode == "guard":
        # guard recorder, CORRECT [BP+SI] form (8A 42 EC) + skip-jb (EB 00):
        # observes the rounding digit at the live si (falls into carry code)
        patch = bytes([0x50, 0x8A, 0x42, 0xEC, 0xA2, 0x00, 0x79, 0x58, 0xEB, 0x00])
    else:
        raise SystemExit("unknown mode %s" % mode)
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
    lua_run(lua_a, "expC_A")
    for _ in range(60):
        st = lua_status()
        if st.get("output", {}).get("stage") == "inputs-done" or st.get("state") == "completed":
            break
        time.sleep(2)
    ctx = mem_read(SITE_ADDR, 12)
    if ctx[:10] != SITE:
        print("ABORT: site bytes changed: %s" % ctx[:12].hex())
        return
    print("site verified")
    mem_write(SITE_ADDR, patch)
    back = mem_read(SITE_ADDR, 10)
    print("patch verify:", "OK" if back == patch else "MISMATCH " + back.hex())
    # zero scratch via DS form (else stale reads from previous runs confuse)
    api("PUT", "/api/v1/memory/DS/0x7900", bytes(16), "application/octet-stream")
    print("scratch zeroed:", api("GET", "/api/v1/memory/DS/0x7900/0x10").hex() == "0" * 32)
    pause_at = sys.argv[6] if len(sys.argv) > 6 else "JULIAN DATE"
    pause_stage = "screen11" if pause_at != "JULIAN DATE" else "screen12"
    lua_b = """for i = 1, 40 do
    if dosbox.screen_match("%s") then break end
    dosbox.wait_frames(60)
    dosbox.type("\\n")
end
if dosbox.screen_match("%s") then
    dosbox.output["stage"] = "%s"
else
    dosbox.output["stage"] = "run-done"
end
""" % (pause_at, pause_at, pause_stage)
    lua_run(lua_b, "expC_B")
    for _ in range(120):
        st = lua_status()
        if st.get("output", {}).get("stage") in ("screen12", "screen11", "run-done") or \
                st.get("state") == "completed":
            print("stage B:", st.get("output", {}).get("stage"), st.get("state"))
            break
        time.sleep(2)
    raw = api("GET", "/api/v1/memory/DS/0x7900/0x10")
    print("scratch:", raw.hex())
    try:
        jd = api("GET", "/api/v1/memory/DS/0x300/0x6")
        print("27BE0:", jd.hex())
    except Exception as e:
        print("27BE0 read fail", str(e)[:60])
    try:
        txt = api("GET", "/api/v1/video/text")
        open("/tmp/expC_screen.json", "wb").write(txt)
        print("screen saved")
    except Exception as e:
        print("screen cap fail", str(e)[:60])
    if mode == "si":
        print("si=%d" % (raw[0] | (raw[1] << 8)))
    else:
        g = raw[0]
        print("guard=%r" % (chr(g) if 32 <= g < 127 else g))
    # cleanup + exit to prompt
    if patch is not None:
        mem_write(SITE_ADDR, SITE)
        print("restored:", mem_read(SITE_ADDR, 10).hex() == SITE.hex())
    api("POST", "/api/v1/input/type", b'{"text": "\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n"}',
        "application/json")
    time.sleep(6)


if __name__ == "__main__":
    main()

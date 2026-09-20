#!/usr/bin/env python3
"""r2pipe dumping pipeline for STAR.EXE (16-bit MZ).
Stage 1: function inventory (addr, size, nbbs, cc) -> tools/r2_out/functions.json
Keeps one r2 session open via r2pipe for all stages.
"""
import json
import r2pipe

R2 = None


def session():
    global R2
    if R2 is None:
        R2 = r2pipe.open("STAR.EXE", flags=["-2"])
        R2.cmd("e anal.hasnext=true; e anal.depth=64")
        R2.cmd("aaa")
    return R2


if __name__ == "__main__":
    r = session()
    funcs = json.loads(r.cmd("aflj"))
    out = [{"addr": f["offset"], "size": f["size"], "nbbs": f.get("nbbs", 0),
            "cc": f.get("cc", 0), "name": f["name"]} for f in funcs]
    out.sort(key=lambda f: -f["size"])
    json.dump(out, open("tools/r2_out/functions.json", "w"), indent=1)
    print("functions: %d, largest:" % len(out))
    for f in out[:15]:
        print("  0x%08x size=%6d bbs=%3d %s" % (f["addr"], f["size"], f["nbbs"], f["name"]))

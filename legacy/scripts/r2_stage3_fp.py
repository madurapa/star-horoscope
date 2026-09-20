#!/usr/bin/env python3
"""Stage 3: rank functions by FP-conversion likeness.
Real-Write helper profile: medium size, loops (nbbs), integer mul/div ops,
few calls, no string refs. Print top candidates with disasm stats."""
import json
import r2pipe

r = r2pipe.open("STAR.EXE", flags=["-2"])
r.cmd("e anal.hasnext=true; e anal.depth=64")
r.cmd("aaa")
funcs = json.loads(r.cmd("aflj"))
rows = []
for f in funcs:
    try:
        ops = json.loads(r.cmd("pdfj @ %d" % f["offset"]))["ops"]
    except Exception:
        continue
    n = len(ops)
    if n < 30 or n > 800:
        continue
    txt = " ".join(o.get("opcode", "") for o in ops)
    nmul = txt.count("mul") + txt.count("imul")
    ndiv = sum(1 for o in ops if o.get("opcode", "").split()[0] in ("div", "idiv") if o.get("opcode"))
    ncall = txt.count("call")
    # loops ~= back edges: count jmp with negative displacement is hard; use nbbs/size ratio
    if nmul + ndiv >= 4:
        rows.append((f["offset"], f["size"], n, nmul, ndiv, ncall, f["name"]))
print("FP-conversion-like candidates (size 30-800, mul+div>=4):")
for x in sorted(rows, key=lambda r: -(r[3] + r[4]))[:20]:
    print("  %#08x size=%4d ops=%4d mul=%2d div=%2d calls=%2d %s" % x)

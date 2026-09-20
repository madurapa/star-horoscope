#!/usr/bin/env python3
"""Stage 2 (fixed): izzj strings + xrefs on anchors + digit-loop hunt."""
import json
import r2pipe

r = r2pipe.open("STAR.EXE", flags=["-2"])
r.cmd("e anal.hasnext=true; e anal.depth=64")
r.cmd("aaa")

strings = json.loads(r.cmd("izzj"))
json.dump(strings, open("tools/r2_out/strings.json", "w"))
print("strings:", len(strings))

anchors = ["JULIAN DATE", "KALA HORAVA", "TRISHANSAKA", "GANA  :", "SHAD VARGA",
           "AYANAMSA", "KARANAYA", "Mushikadena"]
for s in strings:
    txt = s.get("string", "")
    for a in anchors:
        if a in txt:
            print("## %s @ %#x : %s" % (a, s["vaddr"], txt[:50]))
            try:
                x = json.loads(r.cmd("axtj %d" % s["vaddr"]))
                for h in x[:8]:
                    print("    from=%#x type=%s" % (h.get("from"), h.get("type")))
            except Exception as e:
                print("    xref-err", str(e)[:100])
            break

funcs = json.loads(r.cmd("aflj"))
hits = []
for f in funcs:
    try:
        ops = json.loads(r.cmd("pdfj @ %d" % f["offset"]))["ops"]
    except Exception:
        continue
    ndiv = sum(1 for o in ops if o.get("opcode", "").startswith(("div", "idiv")))
    nascii = sum(1 for o in ops if "0x30" in o.get("opcode", "") or "0x3a" in o.get("opcode", ""))
    if ndiv and nascii:
        hits.append((f["offset"], f["size"], ndiv, nascii))
print("digit-loop candidates:")
for h in sorted(hits, key=lambda x: -x[2])[:15]:
    print("  %#08x size=%d divs=%d ascii=%d" % h)

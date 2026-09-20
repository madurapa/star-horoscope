import re
import sys, json
SRC = sys.argv[1] if len(sys.argv) > 1 else "STAR.EXE.asm"  # was an absolute upload path
lines = open(SRC, encoding="latin-1").read().split("\n")

# Turbo Pascal ShortString literal: db <len>,'text'  possibly continued by
# further "db 'text'" lines (IDA wraps at ~60 chars).
lit = re.compile(r"^(?P<label>\w*)\s+db\s+(?P<len>\d+),(?P<rest>'.*)$")
cont = re.compile(r"^\s+db\s+(?P<rest>'.*)$")

def unquote(rest):
    # strip trailing comment, join quoted runs and numeric escapes
    out, i, n = [], 0, len(rest)
    while i < n:
        c = rest[i]
        if c == "'":
            j = i+1
            buf = []
            while j < n:
                if rest[j] == "'":
                    if j+1 < n and rest[j+1] == "'":
                        buf.append("'"); j += 2; continue
                    break
                buf.append(rest[j]); j += 1
            out.append("".join(buf)); i = j+1
        elif c == ";":
            break
        elif c.isdigit():
            m = re.match(r"(\d+)", rest[i:])
            out.append(chr(int(m.group(1)) & 0xFF)); i += m.end()
        else:
            i += 1
    return "".join(out)

strings, i = [], 0
while i < len(lines):
    m = lit.match(lines[i])
    if m:
        ln = int(m.group("len"))
        txt = unquote(m.group("rest"))
        j = i+1
        while len(txt) < ln and j < len(lines):
            c = cont.match(lines[j])
            if not c: break
            txt += unquote(c.group("rest")); j += 1
        if abs(len(txt) - ln) <= 1 and ln > 0:
            strings.append({"label": m.group("label") or "", "len": ln,
                            "text": txt[:ln], "line": i+1})
            i = j; continue
    i += 1
json.dump(strings, open("strings.json","w"), indent=0)
print(f"{len(strings)} Pascal literals recovered")

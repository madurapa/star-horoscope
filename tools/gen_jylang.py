#!/usr/bin/env python3
"""Single-source language merge: core concept rows -> jyotichart tables.

The .inc translator files (src/locale_si.inc / src/locale_ta.inc) are the
master store. This script regenerates the si/ta *sign-name* blocks inside
third_party/jyotichart/support/languages.py from the Rasi* concepts, so the
two files can never disagree. Everything else in languages.py (planet
symbols, UI labels, varga names, kannada/hindi/english) has no core
counterpart and stays hand-maintained — see the documented split below.

Usage: ./tools/gen_jylang.py [--check]   (check exits 1 on drift)
"""
import re
import sys

ROOT = __import__("pathlib").Path(__file__).resolve().parent.parent
LANG = ROOT / "third_party" / "jyotichart" / "support" / "languages.py"

# (concept, classical key used by jyotichart) — stable mapping.
SIGNS = [
    ("RasiMesha", "Aries"), ("RasiVrishabha", "Taurus"),
    ("RasiMithuna", "Gemini"), ("RasiKataka", "Cancer"),
    ("RasiSimha", "Leo"), ("RasiKanya", "Virgo"),
    ("RasiTula", "Libra"), ("RasiVrishchika", "Scorpio"),
    ("RasiDhanu", "Saggitarius"), ("RasiMakara", "Capricorn"),
    ("RasiKumbha", "Aquarius"), ("RasiMeena", "Pisces"),
]


def load_inc(path):
    txt = "\n".join(
        l for l in open(path, encoding="utf-8").read().split("\n")
        if not l.strip().startswith("//"))
    return {m.group(1): m.group(2) for m in re.finditer(
        r'\{Concept::([A-Za-z0-9_]+),\s*"((?:[^"\\]|\\.)*)",', txt)}


def block(rows):
    lines = []
    for eng, val in rows:
        lines.append('        %-15s : "%s",' % ('"%s"' % eng, val))
    return "\n".join(lines)


def main():
    si = load_inc(ROOT / "src" / "locale_si.inc")
    ta = load_inc(ROOT / "src" / "locale_ta.inc")
    text = open(LANG, encoding="utf-8").read()
    changed = False
    for lang, store in (("sinhala", si), ("tamil", ta)):
        rows = []
        for concept, eng in SIGNS:
            if concept not in store:
                print("missing %s in %s" % (concept, lang))
                return 2
            rows.append((eng, store[concept]))
        pat = ('(# BEGIN GENERATED sign-names %s\\n)(.*?)(\\n    # END GENERATED)'
               % lang)
        m = re.search(pat, text, re.S)
        if not m:
            print("markers missing for %s" % lang)
            return 2
        new = m.group(1) + block(rows) + m.group(3)
        if new != m.group(0):
            changed = True
            text = text[:m.start()] + new + text[m.end():]
    if "--check" in sys.argv:
        if changed:
            print("drift: run tools/gen_jylang.py")
        return 1 if changed else 0
    if changed:
        open(LANG, "w", encoding="utf-8").write(text)
        print("regenerated")
    else:
        print("in sync")
    return 0


if __name__ == "__main__":
    sys.exit(main())

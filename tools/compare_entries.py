#!/usr/bin/env python3
"""compare_entries.py — differential check: modern_star vs DOS transcripts.
Usage: ./compare_entries.py [--modern /path/to/modern_star] [--entries tests/screen_test/entries.txt] [--out output]
For each non-comment entry it runs modern_star with the same inputs and
compares field-by-field (house table, shadvarga, screen12 block, dasa
mahaboundaries, screen13 block) against output/<slug>.txt.
Exit 0 iff zero mismatches.
"""
import re
import subprocess
import sys
import os

MODERN = "/tmp/modern_star"
ENTRIES = "tests/screen_test/entries.txt"
OUTDIR = "tests/screen_test/output"

PLANETS = ["Lagna", "Sandu", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
           "Shani", "Raahu", "Kethu", "Urenus", "Neptun", "Pluto"]
SHAD_KEYS = ["Lagna", "Chandra", "Rav1", "Budha", "Sikuru", "Kuja", "Guru",
             "Shani", "Raahu", "Kethu", "Urenes", "Neptune", "Pluuto"]


def slugify(name):
    s = re.sub(r"\s+", "_", name.strip())
    s = re.sub(r"[^A-Za-z0-9_-]", "", s)
    return s or "entry"


def parse_house(text):
    out = {}
    pat = re.compile(
        r"^(Lagna|Sandu|Ravi|Budha|Sikuru|Kuja|Guru|Shani|Raahu|Kethu|Urenus|Neptun|Pluto)"
        r"\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)"
        r"(?:\s+(\S+)\s+(\d+)\s+(\S+)\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)\s*(.*))?$")
    for line in text.split("\n"):
        m = pat.match(line.rstrip())
        if m:
            g = list(m.groups())
            out[g[0]] = tuple(g[1:])
    return out


RASI_NAMES = {"Mesha", "Wrushaba", "Mituna", "Mithuna", "Kataka", "Sinha",
               "Kanya", "Thula", "Wrschika", "Dhanu", "Makara", "Kumba", "Meena"}


def parse_shadvarga(text):
    out = {}
    for line in text.split("\n"):
        s = line.rstrip()
        for k in SHAD_KEYS:
            if re.match(r"^" + k + r"\s*\|", s):
                parts = [p.strip() for p in s.split("|")]
                if len(parts) >= 2 and any(
                        any(r == c or r in c.split() for r in RASI_NAMES)
                        for c in parts[1:]):
                    out[k] = parts[1:]
                break
    return out


def parse_shadnumbers(text):
    out = {}
    for line in text.split("\n"):
        s = line.rstrip()
        for k in SHAD_KEYS:
            if re.match(r"^" + k + r"\s*\|", s):
                parts = [p.strip() for p in s.split("|")]
                if len(parts) >= 2 and all(
                        re.fullmatch(r"\d+", c) for c in parts[1:] if c):
                    out[k] = [int(c) for c in parts[1:] if c]
                break
    return out


def parse_screen12(text):
    out = {}
    m = re.search(r"JULIAN DATE\s*:\s*([\d.]+)", text)
    if m:
        out["jd"] = m.group(1)
    m = re.search(r"LAGNA\s*:\s*(\S+)\s*\(\s*(-?\d+)\s+(-?\d+)\s+(-?\d+)\)\s*NAVAMSAKA\s*:\s*(\S+)", text)
    if m:
        out["lagna"] = m.groups()
    m = re.search(r"DAY\s*:\s*(\S+)\s*NEKATHA\s*:\s*(\S+)\s*PADAYA\s*:\s*(\d+)", text)
    if m:
        out["panch1"] = m.groups()
    m = re.search(r"THITIYA:\s*(.*?)\s*YOGAYA\s*:\s*(.*?)\s*KARANAYA:\s*(.*)", text)
    if m:
        out["panch2"] = tuple(x.strip() for x in m.groups())
    for label in ["Birth   time", "Sinhala time", "True local mean time",
                  "Universal  time", "Universal  Siderial     time",
                  "Local  mean   siderial   time", "Sun rise time", "Sun set time"]:
        mm = re.search(r"^" + re.escape(label) + r"\s+-\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)",
                       text, re.M)
        if mm:
            out[label.strip()] = mm.groups()
    m = re.search(r"DASA BALANCE\s*:\s*(\S+)\s+(\d+)\s+Years\s+(\d+)\s+Months\s+(\d+)\s+Days", text)
    if m:
        out["dasa"] = m.groups()
    m = re.search(r"AYANAMSA\(Arc-Ray\):\s*(-?\d+)\s+(-?\d+)\s+(-?\d+)", text)
    if m:
        out["ayanamsa"] = m.groups()
    return out


def parse_maha(text):
    out = []
    pat = re.compile(r"^(\w+)\s+Maha\s+dasava from\s+(\d+)-(\d+)-\s*(\d+)\s+to\s+"
                     r"(\d+)-(\d+)-\s*(\d+)", re.M)
    for m in pat.finditer(text):
        out.append(m.groups())
    return out


def parse_screen13(text):
    out = {}
    m = re.search(r"KALA HORAVA\s*:\s*(\S+)\s*PANCHAMA HORAVA\s*:\s*(\S+)\s*SUKSHAMA HORAVA\s*:\s*(\S+)", text)
    if m:
        out["hora"] = m.groups()
    for label in ["GANA", "LINGA", "GOTHRA", "BHUTHA"]:
        mm = re.search(r"^" + label + r"\s*:?\s*(.*)$", text, re.M)
        # keep full row rstrip'd for exact compare
    rows = {}
    for line in text.split("\n"):
        s = line.rstrip()
        for label in ["GANA  :", "LINGA :", "GOTHRA:", "BHUTHA:"]:
            if s.startswith(label):
                rows[label.strip()] = s
    out["rows"] = rows
    return out


def load_entries(path):
    entries = []
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = [p.strip() for p in line.split("|")]
            if len(parts) != 4:
                print(f"WARN: skipping malformed entry: {line!r}")
                continue
            entries.append(parts)
    return entries


def main():
    global MODERN, ENTRIES, OUTDIR
    args = sys.argv[1:]
    while args:
        if args[0] == "--modern":
            MODERN = args[1]; args = args[2:]
        elif args[0] == "--entries":
            ENTRIES = args[1]; args = args[2:]
        elif args[0] == "--out":
            OUTDIR = args[1]; args = args[2:]
        else:
            print("unknown arg", args[0]); return 2

    fails = 0
    checks = 0

    def check(tag, got, exp):
        nonlocal fails, checks
        checks += 1
        if got != exp:
            fails += 1
            print(f"  MISMATCH {tag}: modern={got!r} dos={exp!r}")

    for name, bdate, btime, city in load_entries(ENTRIES):
        slug = slugify(name)
        dos_path = os.path.join(OUTDIR, slug + ".txt")
        if not os.path.exists(dos_path):
            print(f"SKIP {name}: {dos_path} missing")
            continue
        y, mo, d = bdate.split()
        hh, mm = btime.split()
        cmd = [MODERN, "--name", name, "--year", y, "--month", mo, "--day", d,
               "--hour", hh, "--minute", mm, "--city", city]
        try:
            ours = subprocess.run(cmd, capture_output=True, text=True, timeout=60).stdout
        except Exception as e:
            print(f"ERROR running modern_star for {name}: {e}")
            fails += 1
            continue
        with open(dos_path, encoding="utf-8", errors="replace") as f:
            dos = f.read()
        print(f"=== {name} | {bdate} | {btime} | city {city} ===")
        oh, dh = parse_house(ours), parse_house(dos)
        for p in PLANETS:
            if p in dh:
                if p not in oh:
                    check(f"{slug} house:{p}", "<missing>", dh[p])
                else:
                    # numeric cols exact, neketh/pada/rasi exact, avastha exact-or-blank
                    check(f"{slug} house:{p}", oh[p], dh[p])
        os_, ds_ = parse_shadvarga(ours), parse_shadvarga(dos)
        for k in SHAD_KEYS:
            if k in ds_:
                check(f"{slug} varga:{k}", os_.get(k), ds_[k])
        on_, dn_ = parse_shadnumbers(ours), parse_shadnumbers(dos)
        for k in SHAD_KEYS:
            if k in dn_:
                check(f"{slug} vnum:{k}", on_.get(k), dn_[k])
        o1, d1 = parse_screen12(ours), parse_screen12(dos)
        for k in set(o1) | set(d1):
            check(f"{slug} s12:{k}", o1.get(k), d1.get(k))
        om, dm = parse_maha(ours), parse_maha(dos)
        check(f"{slug} maha-count", len(om), len(dm))
        for i, (a, b) in enumerate(zip(om, dm)):
            check(f"{slug} maha[{i}]", a, b)
        o3, d3 = parse_screen13(ours), parse_screen13(dos)
        if "hora" in d3:
            check(f"{slug} hora", o3.get("hora"), d3["hora"])
        for r in d3.get("rows", {}):
            check(f"{slug} s13:{r}", o3.get("rows", {}).get(r), d3["rows"][r])

    print(f"\nTOTAL: {checks} checks, {fails} mismatches")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())

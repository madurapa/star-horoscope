#!/usr/bin/env python3
"""Dump exact (karana k, trishansa cells, sunrise) from DOS machine captures."""
import re, os, math

OUTDIR = "tests/screen_test/output"
PLANETS = ["Lagna", "Sandu", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
           "Shani", "Raahu", "Kethu", "Urenus", "Neptun", "Pluto"]

def house_rows(text):
    out = {}
    pat = re.compile(
        r"^(Lagna|Sandu|Ravi|Budha|Sikuru|Kuja|Guru|Shani|Raahu|Kethu|Urenus|Neptun|Pluto)"
        r"\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)"
        r"(?:\s+(\S+)\s+(\d+)\s+(\S+)\s+(-?\d+)\s+(-?\d+)\s+(-?\d+)\s*(.*))?$")
    for line in text.split("\n"):
        m = pat.match(line.rstrip())
        if m:
            g = m.groups()
            out[g[0]] = g[1:]
    return out

def dms(d, m, s):
    return d + m / 60.0 + s / 3600.0

print("=== KARANA: entry tithi karana sun moon elong k ===")
for fn in sorted(os.listdir(OUTDIR)):
    if not fn.endswith(".txt"):
        continue
    text = open(os.path.join(OUTDIR, fn), encoding="utf-8", errors="replace").read()
    h = house_rows(text)
    m2 = re.search(r"THITIYA:\s*(.*?)\s*YOGAYA\s*:\s*(.*?)\s*KARANAYA:\s*(.*)", text)
    if "Ravi" in h and "Sandu" in h and h["Ravi"][3] and h["Sandu"][3]:
        sun = dms(*map(float, h["Ravi"][:3]))
        moon = dms(*map(float, h["Sandu"][:3]))
        e = (moon - sun) % 360.0
        k = int(e // 6)
        t = int(e // 12) + 1
        kar = m2.group(3).strip() if m2 else "?"
        print(f"{fn}: t={t} kar={kar} sun={sun:.4f} moon={moon:.4f} elong={e:.4f} k={k} cell_k-1={(k-1)%7} cell_t-1={(t-1)%7}")

print("=== TRISHANSA: entry planet sign rem dosV ===")
RASI = ["Mesha", "Wrushaba", "Mituna", "Mithuna", "Kataka", "Sinha",
        "Kanya", "Thula", "Wrschika", "Dhanu", "Makara", "Kumba", "Meena"]
for fn in sorted(os.listdir(OUTDIR)):
    if not fn.endswith(".txt"):
        continue
    text = open(os.path.join(OUTDIR, fn), encoding="utf-8", errors="replace").read()
    h = house_rows(text)
    # names section: "Key   | Rashi Navamsa Hora Desh Dvad Trish"
    for line in text.split("\n"):
        s = line.rstrip()
        m = re.match(r"^-?(Lagna|Chandra|Rav1|Budha|Sikuru|Kuja|Guru|Shani|Raahu|Kethu|Urenes|Neptune|Pluuto)\s*\|\s*(.*)$", s)
        if not m:
            continue
        cols = m.group(2).split()
        if len(cols) != 6 or not all(c in RASI or c == "**" for c in cols):
            continue
        kk = m.group(1)
        pl = key2planet.get(kk, kk) if (key2planet := {"Chandra": "Sandu", "Rav1": "Ravi", "Urenes": "Urenus",
                  "Neptune": "Neptun", "Pluuto": "Pluto"}) else kk
        if pl in h and h[pl][3]:
            lon = dms(*map(float, h[pl][:3]))
            lonw = lon % 360.0
            sign = int(lonw // 30) + 1
            rem = lonw - (sign - 1) * 30
            print(f"{fn} {pl}: sign={sign} rem={rem:.4f} trish={cols[5]}")

print("=== TRANSCRI TRISHANSA ===")
RASI = ["Mesha", "Wrushaba", "Mituna", "Mithuna", "Kataka", "Sinha",
        "Kanya", "Thula", "Wrschika", "Dhanu", "Makara", "Kumba", "Meena"]
import glob
for path in sorted(glob.glob("tests/screens/TRANSCRI*.TXT")):
    try:
        text = open(path, encoding="utf-8", errors="replace").read()
    except FileNotFoundError:
        continue
    h = house_rows(text)
    if not h:
        continue
    for line in text.split("\n"):
        s = line.rstrip()
        m = re.match(r"^-?(Lagna|Chandra|Rav1|Sandu|Budha|Sikuru|Kuja|Guru|Shani|Raahu|Kethu|Urenes|Neptun|Urenus|Neptune|Pluuto)\s*\|\s*(.*)$", s)
        if not m:
            continue
        cols = m.group(2).split()
        if len(cols) != 6 or not all(c in RASI or c == "**" for c in cols):
            continue
        kk = m.group(1)
        pl = {"Chandra": "Sandu", "Rav1": "Ravi", "Sandu": "Sandu", "Urenes": "Urenus",
              "Urenus": "Urenus", "Neptune": "Neptun", "Neptun": "Neptun", "Pluuto": "Pluto"}.get(kk, kk)
        if pl in h and h[pl][3]:
            lon = dms(*map(float, h[pl][:3]))
            lonw = lon % 360.0
            sign = int(lonw // 30) + 1
            rem = lonw - (sign - 1) * 30
            print(f"{path} {pl}: lon={lon:.4f} sign={sign} rem={rem:.4f} trish={cols[5]}")

print("=== AVASTHA CELLS: entry planet lon_deg rasi rel_deg avastha ===")
for path in sorted(glob.glob("tests/screen_test/output/*.txt")) + sorted(glob.glob("tests/screens/TRANSCRI*.TXT")) + ["tests/screens/screen05.txt"]:
    try:
        text = open(path, encoding="utf-8", errors="replace").read()
    except FileNotFoundError:
        continue
    h = house_rows(text)
    for pl, g in h.items():
        if g[3]:
            lon = dms(*map(float, g[:3]))
            print(f"{path} {pl}: lon={lon:.4f} rasi={g[5]} rel={g[6]}:{g[7]}:{g[8]} av={g[9]}")

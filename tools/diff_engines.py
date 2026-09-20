#!/usr/bin/env python3
"""L1 differential harness: DOS vs SwissEphemeris engines over a frozen grid.

Methodology (frozen; see docs/phase2_design.md section 4):
  Nirayana: monthly 1900-01-01 .. 2100-12-01, day=1, 12:00, cities 1-15.
  Sayana:   yearly 1900 .. 2100, day=1, 12:00, cities 1, 7, 12 (spot-check).
  Metric: max absolute per-body difference in arcseconds (+ ayanamsa).
  Disagreement is EXPECTED (different models); this harness reports and
  checks against frozen bounds — it never auto-relaxes them.

Usage:
  ./tools/diff_engines.py [--binary PATH] [--jobs N] [--record] [--quick]
    --record  write tools/diff_bounds.json from this run (re-baselining:
              needs recorded justification, never routine)
    --quick   smoke grid only (yearly x cities 1,7,12, Nirayana)
  Exit 0 iff every body is within tools/diff_bounds.json (or --record).
"""
import concurrent.futures
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__))
                       ) if "__file__" in globals() else "."
BIN_CANDIDATES = ["/tmp/star-build/modern_star", "./modern_star",
                  "build/modern_star"]
BOUNDS = os.path.join(ROOT, "tools", "diff_bounds.json")
BODIES = ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
          "Shani", "Raahu", "Kethu", "Urenus", "Neptune", "Pluto"]


def find_binary(cli):
    if cli and os.path.isfile(cli):
        return cli
    for c in BIN_CANDIDATES:
        if os.path.isfile(c):
            return c
    sys.exit("! no modern_star binary found (build first)")


def dms_to_arcsec(s):
    s = s.strip()
    d, m, sec = s.split(":")
    return ((abs(int(d)) * 60 + int(m)) * 60 + int(sec)) * (
        -1 if d.strip().startswith("-") else 1)


def run_case(binary, year, month, city, sayana):
    base = [binary, "--name", "L1 Probe", "--year", str(year),
            "--month", str(month), "--day", "1", "--hour", "12",
            "--minute", "0", "--city", str(city), "--format", "json"]
    if sayana:
        base.append("--sayana")
    else:
        base.append("--nirayana")
    out = {}
    for eng in ("dos", "swisseph"):
        p = subprocess.run(base + ["--engine", eng], capture_output=True,
                           text=True, timeout=120)
        if p.returncode != 0:
            return None
        out[eng] = json.loads(p.stdout)
    return out


def cases(quick):
    if quick:
        for y in range(1900, 2101):
            for c in (1, 7, 12):
                yield (y, 1, c, False)
        return
    for y in range(1900, 2101):
        for m in range(1, 13):
            for c in range(1, 16):
                yield (y, m, c, False)
    for y in range(1900, 2101):
        for c in (1, 7, 12):
            yield (y, 1, c, True)


def main():
    args = sys.argv[1:]
    binary = None
    jobs = 8
    record = "--record" in args
    quick = "--quick" in args
    for i, a in enumerate(args):
        if a == "--binary" and i + 1 < len(args):
            binary = args[i + 1]
        if a == "--jobs" and i + 1 < len(args):
            jobs = int(args[i + 1])
    binary = find_binary(binary)
    work = list(cases(quick))
    print("L1 grid: %d cases x 2 engines (%s)" %
          (len(work), "quick" if quick else "full"))
    worst = {b: 0.0 for b in BODIES + ["ayanamsa"]}
    worst_at = {b: "" for b in BODIES + ["ayanamsa"]}
    nfail = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as ex:
        futs = {ex.submit(run_case, binary, y, m, c, s): (y, m, c, s)
                for (y, m, c, s) in work}
        for fut in concurrent.futures.as_completed(futs):
            y, m, c, s = futs[fut]
            tag = "%d-%02d city=%d %s" % (y, m, c, "S" if s else "N")
            try:
                r = fut.result()
            except Exception as e:  # noqa: BLE001 - harness must report, not die
                print("! case %s failed: %s" % (tag, e))
                nfail += 1
                continue
            if r is None:
                print("! case %s engine error" % tag)
                nfail += 1
                continue
            for b in BODIES:
                d = abs(dms_to_arcsec(r["dos"]["longitudes"][b]) -
                        dms_to_arcsec(r["swisseph"]["longitudes"][b]))
                if d > 648000.0:  # circular wrap (e.g. 359.9 vs 0.1)
                    d = 1296000.0 - d
                if d > worst[b]:
                    worst[b] = d
                    worst_at[b] = tag
            da = abs(r["dos"]["ayanamsa_deg"] -
                     r["swisseph"]["ayanamsa_deg"]) * 3600.0
            if da > worst["ayanamsa"]:
                worst["ayanamsa"] = da
                worst_at["ayanamsa"] = tag
    print("--- max abs diff (arcsec) ---")
    for b in BODIES + ["ayanamsa"]:
        print("%-9s %10.2f  at %s" % (b, worst[b], worst_at[b]))
    if nfail:
        print("! %d case failures" % nfail)
        return 1
    if record:
        with open(BOUNDS, "w") as f:
            json.dump({"meta": {
                "methodology": "monthly 1900-01..2100-12 d=1 12:00 x "
                               "cities 1-15 Nirayana; yearly x 1,7,12 Sayana",
                "cases": len(work), "quick": quick},
                "max_abs_arcsec": worst, "worst_at": worst_at}, f, indent=1)
        print("recorded %s" % BOUNDS)
        return 0
    if not os.path.isfile(BOUNDS):
        print("! no %s; run with --record first" % BOUNDS)
        return 1
    with open(BOUNDS) as f:
        bounds = json.load(f)["max_abs_arcsec"]
    bad = 0
    for b in BODIES + ["ayanamsa"]:
        if worst[b] > bounds.get(b, float("inf")) + 1e-9:
            print("! OVER BOUND %-9s %.2f > %.2f" % (b, worst[b], bounds[b]))
            bad += 1
    print("L1_BOUND_CHECK_%s" % ("FAIL" if bad else "GREEN"))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())

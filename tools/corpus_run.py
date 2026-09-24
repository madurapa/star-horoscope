#!/usr/bin/env python3
"""Data-driven corpus runner: tests/corpus/<name>/input.ini + expect.txt.

Adding a capture = dropping a folder. Each expect.txt line is a literal
substring that must appear in `modern_star <flags> --screen <n>` output.
Loop: build once, run every case, diff. Exit non-zero on any miss.
"""
import subprocess
import sys
import tempfile
from pathlib import Path
import os

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "modern_star"
if not (BIN.exists() or (ROOT / "/tmp/modern_star").exists()):
    pass  # built by CMake/CTest or the g++ loop; resolved per-case below


def find_binary():
    names = (["modern_star", "modern_star.exe"] if os.name == "nt"
             else ["modern_star"])
    cands = ([ROOT / n for n in names] +
             [ROOT / "build" / n for n in names] +
             [Path("/tmp/modern_star"), Path("/tmp/modern_star.exe"),
              Path("/tmp/build/modern_star"),
              Path("/tmp/build/modern_star.exe")])
    for c in cands:
        if c.exists():
            return str(c)
    # fall back to building (keep in sync with the CMake modern_star target)
    # NOTE: tempfile, not /tmp — test processes run native on Windows.
    tmpbase = Path(tempfile.gettempdir()) / "star_corpus_build"
    out = str(tmpbase) + (".exe" if os.name == "nt" else "")
    cmd = ["g++", "-std=c++20", "-O2", "-Wall", "-Wextra", "-Isrc",
           "-Ithird_party/swisseph",
           "src/main.cpp", "src/CLI.cpp", "src/VargaEngine.cpp",
           "src/SwissFeed.cpp"] + \
        sorted(str(p) for p in
               (ROOT / "third_party" / "swisseph").glob("swe*.c")) + \
        ["-o", out, "-lm"] + (["-ldl"] if sys.platform.startswith("linux")
                              else [])
    r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    if r.returncode != 0:
        print(r.stderr[-3000:])
        sys.exit("corpus: build failed")
    return out


def main():
    binary = find_binary()
    corpus = ROOT / "tests" / "corpus"
    cases = sorted(p for p in corpus.iterdir() if p.is_dir())
    if not cases:
        sys.exit("corpus: no cases (tests/corpus/<name>/)")
    fails = 0
    for case in cases:
        ini = case / "input.ini"
        exp = case / "expect.txt"
        scr = (case / "screen").read_text().strip() if (case / "screen").exists() else "12"
        flags = []
        keymap = {"name": "--name", "birth_year": "--year", "birth_month": "--month",
                  "birth_day": "--day", "birth_hour": "--hour",
                  "birth_minute": "--minute", "city_index": "--city"}
        for line in ini.read_text().splitlines():
            line = line.strip()
            if not line or line.startswith(("#", ";")) or "=" not in line:
                continue
            k, v = [t.strip() for t in line.split("=", 1)]
            if k in keymap:
                flags += [keymap[k], v]
            elif k == "nirayana":
                flags += ["--nirayana"] if v in ("true", "1", "yes") else ["--sayana"]
            elif k == "thathkala" and v in ("true", "1", "yes"):
                flags += ["--thathkala"]
        # R1: legacy display removed; corpus runs the modern layer until R3
        # rewrites the golden expects (legacy literals no longer emitted).
        cmd = [binary] + flags + ["--screen", scr]
        r = subprocess.run(cmd, capture_output=True, text=True)
        out = r.stdout + r.stderr
        cur_fail = 0
        for want in exp.read_text().splitlines():
            want = want.rstrip("\n")
            if not want or want.startswith("#"):
                continue
            if want not in out:
                cur_fail += 1
                print(f"FAIL {case.name}: missing {want!r}")
        if cur_fail == 0:
            print(f"ok   {case.name}")
        fails += cur_fail
    print(f"corpus: {len(cases)} cases, {fails} misses")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())

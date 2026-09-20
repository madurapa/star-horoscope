#!/usr/bin/env python3
"""resume_list.py — print entries from ENTRIES whose output file is missing
or thin (<MIN_LINES), for resuming an interrupted fuzz run.
Usage: ./resume_list.py [entries-file] [output-dir] [min-lines]
Writes the subset to stdout in entries-file format ( caller redirects ).
Example: ./resume_list.py entries_fuzz.txt output_fuzz 200 > entries_todo.txt
"""
import os
import re
import sys


def slugify(name):
    s = re.sub(r"\s+", "_", name.strip())
    return re.sub(r"[^A-Za-z0-9_-]", "", s) or "entry"


def main():
    entries = sys.argv[1] if len(sys.argv) > 1 else "tests/screen_test/entries_fuzz.txt"
    outdir = sys.argv[2] if len(sys.argv) > 2 else "tests/screen_test/output_fuzz"
    min_lines = int(sys.argv[3]) if len(sys.argv) > 3 else 200
    n_todo, n_ok = 0, 0
    with open(entries, encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            if not s or s.startswith("#"):
                continue
            parts = [p.strip() for p in s.split("|")]
            if len(parts) != 4:
                continue
            slug = slugify(parts[0])
            path = os.path.join(outdir, slug + ".txt")
            thin = True
            if os.path.exists(path):
                with open(path, encoding="utf-8", errors="replace") as rf:
                    thin = sum(1 for _ in rf) < min_lines
            if thin:
                print(line.rstrip("\n"))
                n_todo += 1
            else:
                n_ok += 1
    sys.stderr.write("resume: %d todo, %d ok\n" % (n_todo, n_ok))


if __name__ == "__main__":
    sys.exit(main())

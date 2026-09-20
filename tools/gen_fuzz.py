#!/usr/bin/env python3
"""gen_fuzz.py — generate a coverage-matrix entries file for differential
fuzzing (DOS STAR.EXE vs modern_star). Valid dates only (day<=28, plus two
leap-day specials); hours 0-23, minutes 0-59, cities 1-15.
Usage: ./gen_fuzz.py [seed] > entries_fuzz.txt   (default seed 20260916)
Matrix (~106 cases):
  SEAS m01-12 : 2000, day 15, 12:00, cities cycle 1-15 (seasonal sunrise)
  MOON d01-28 : 2000-01, 12:00, city 2 (Moon/nakshatra/tithi sweep)
  LAGNA h00-23: 2000-06-15, city 7 (ascendant sweep)
  RND  40      : seeded random 1950-2030 valid dates/times/cities
  LEAP x2      : 2000-02-29 + 2024-02-29 (valid leap days)
"""
import random
import sys

seed = int(sys.argv[1]) if len(sys.argv) > 1 else 20260916
rng = random.Random(seed)

out = []


def emit(name, y, mo, d, hh, mm, city):
    out.append("%s|%d %d %d|%d %d|%d" % (name, y, mo, d, hh, mm, city))


for m in range(1, 13):
    emit("Seas%02d" % m, 2000, m, 15, 12, 0, ((m - 1) % 15) + 1)
for d in range(1, 29):
    emit("Moon%02d" % d, 2000, 1, d, 12, 0, 2)
for h in range(0, 24):
    emit("Lagna%02d" % h, 2000, 6, 15, h, 0, 7)
for i in range(1, 41):
    y = rng.randint(1950, 2030)
    mo = rng.randint(1, 12)
    d = rng.randint(1, 28)
    hh = rng.randint(0, 23)
    mm = rng.choice([0, 5, 15, 30, 44, 59])
    city = rng.randint(1, 15)
    emit("Rnd%02d" % i, y, mo, d, hh, mm, city)
emit("LeapA", 2000, 2, 29, 23, 59, 1)
emit("LeapB", 2024, 2, 29, 10, 30, 7)

print("# fuzz matrix seed=%d (%d cases)" % (seed, len(out)))
for line in out:
    print(line)

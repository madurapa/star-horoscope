#!/usr/bin/env python3
"""Extraction smoke check (suggestion Phase C, minimal): run
legacy/scripts/extract_strings.py over legacy/STAR.EXE.asm and assert the
ported table spellings exist in the binary (padding-stripped). Any mismatch
is either a transcription bug or an extraction bug — both worth knowing.
"""
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = Path("/tmp/strings_check.json")
r = subprocess.run([sys.executable, str(ROOT / "legacy" / "scripts" / "extract_strings.py"),
                    str(ROOT / "legacy" / "STAR.EXE.asm"), str(OUT)],
                   capture_output=True, text=True)
print(r.stdout.strip())
if r.returncode != 0:
    sys.exit(f"extractor failed:\n{r.stderr[-2000:]}")

import json
texts = {row["text"].strip() for row in json.load(open(OUT))}

YOGAS = ["Vishkamba", "Preethi", "Aaushmaan", "Savbhagya", "Shobhana",
         "Athiganda", "Sukarna", "Drathi", "Shula", "Ganda",
         "Wruddhi", "Drava", "Vyaghatha", "Harshana", "Vajra",
         "Siddi", "Vyathipatha", "Varyayan", "Parigha", "Shiva",
         "Sidda", "Saadaya", "Shubha", "Shubra", "Brahhma",
         "Mahendra", "Vydruthi"]
LIMBS = ["Pelaviya", "Diyawaka", "Thiyawaka", "Jalawaka", "Visheniya",
         "Shatawaka", "Sathawaka", "Atawaka", "Navawaka", "Dasawaka",
         "Ekoloswaka", "Doloswaka", "Theleswaka", "Thuduswaka", "Pasaloswaka"]
KARANAS = ["Kinsthugana", "Bava", "Baalava", "Kavlava", "Thithila", "Garaja",
           "Vanija", "Vishti", "Shakuna", "Chathuppada", "Naaga"]

fails = 0
for name in YOGAS + LIMBS + KARANAS + ["Mushikadena*"]:
    if name not in texts:
        fails += 1
        print(f"MISS {name}")
print(f"extraction check: {27 + 15 + 11 + 1 - fails}/{27 + 15 + 11 + 1}")
sys.exit(1 if fails else 0)

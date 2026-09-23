"""Center-Lagna flag: two-line rising-sign + Lagna label in the middle square.

The centre label is OFF by default in every language. Opt in for any
South/East family chart via updatechartcfg(show_center_lagna=True).
North charts have no centre square, so the flag does not apply to them.

Run:
    python3 examples/center_lagna_flag.py
Output:
    ./output/center_default_<lang>.svg  (no centre label unless opted in)
    ./output/center_optin_<lang>.svg    (sign + Lagna in the centre)
    ./output/center_optout_sinhala.svg  (no centre label)
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jyotichart as chart

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(OUTPUT_DIR, exist_ok=True)

PLANETS = [chart.SUN, chart.MOON, chart.MARS, chart.MERCURY,
           chart.JUPITER, chart.VENUS, chart.SATURN, chart.RAHU, chart.KETU]
HOUSES = [1, 4, 10, 1, 9, 2, 7, 12, 6]


def make_south(lang, asc="Leo", **cfg_kwargs):
    c = chart.SouthChart("D1", "Test User", language=lang)
    c.set_birth_details("15 Aug 1990", "08:30", "Colombo")
    c.set_ascendantsign(asc)
    for planet, house in zip(PLANETS, HOUSES):
        c.add_planet(planet, chart.get_planet_symbol(planet, lang), house)
    c.updatechartcfg(aspect=False, **cfg_kwargs)
    return c


# 1. Defaults: OFF in every language (no centre label).
for lang in ["english", "kannada", "hindi", "sinhala", "tamil"]:
    c = make_south(lang)
    result = c.draw(OUTPUT_DIR + "/", f"center_default_{lang}", "svg")
    print(f"default {lang} -> {result}: center_default_{lang}.svg")

# 2. Opt in: any language shows its localized equivalent
#    ("Leo" + "Asc", "සිංහ" + "ලග්න", "சிம்மம்" + "லக்னம்", ...).
for lang in ["english", "sinhala", "tamil"]:
    c = make_south(lang, show_center_lagna=True)
    result = c.draw(OUTPUT_DIR + "/", f"center_optin_{lang}", "svg")
    print(f"opt-in {lang} -> {result}: center_optin_{lang}.svg")

# 3. Opt back out again.
c = make_south("sinhala", show_center_lagna=False)
print("opt-out sinhala ->", c.draw(OUTPUT_DIR + "/", "center_optout_sinhala", "svg"))

"""Shodashavarga division labels in all 5 languages.

Run:
    python3 examples/varga_labels.py
Output:
    ./output/varga_d9_sinhala.svg  (centre: සිංහ / නවාංශ)
    ./output/varga_d10_tamil.svg   (centre: சிம்மம் / தசாம்சம்)

Pass an English division name (or alias like "D9") as show_center_lagna and
it is auto-translated; unknown strings pass through unchanged. Use
chart.get_varga_name() directly for labels anywhere else.
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

print("Navamsa ->", [chart.get_varga_name("Navamsa", lang)
                     for lang in chart.SUPPORTED_LANGUAGES])
print("D10     ->", [chart.get_varga_name("D10", lang)
                     for lang in chart.SUPPORTED_LANGUAGES])

# Sinhala D9: English "Navamsa" is auto-translated to නවාංශ in the centre.
c = chart.EastChart("D9 Navamsha", "Kamal", language="sinhala")
c.set_birth_details("15 Aug 1990", "08:30", "Colombo")
c.set_ascendantsign("Leo")
for planet, house in zip(PLANETS, HOUSES):
    c.add_planet(planet, chart.get_planet_symbol(planet, "sinhala"), house)
c.updatechartcfg(aspect=False, show_center_lagna="Navamsa")
print("sinhala D9 ->", c.draw(OUTPUT_DIR + "/", "varga_d9_sinhala", "svg"))

# Tamil D10 via alias: "D10" is auto-translated to தசாம்சம்.
c = chart.SouthChart("D10 Dasamsa", "Murugan", language="tamil")
c.set_birth_details("15 Aug 1990", "08:30", "Chennai")
c.set_ascendantsign("Leo")
for planet, house in zip(PLANETS, HOUSES):
    c.add_planet(planet, chart.get_planet_symbol(planet, "tamil"), house)
c.updatechartcfg(aspect=False, show_center_lagna="D10")
print("tamil D10 ->", c.draw(OUTPUT_DIR + "/", "varga_d10_tamil", "svg"))

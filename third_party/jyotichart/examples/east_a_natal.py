"""A. East Indian Natal Chart (fixed-sign, anti-clockwise).

Run:
    python3 examples/east_a_natal.py
Output:
    ./output/east_natal.svg
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jyotichart as chart

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(OUTPUT_DIR, exist_ok=True)

# 1. Initialize the East Indian chart
east = chart.EastChart("D1 Natal", "John Doe")
east.set_ascendantsign("Aries")

# 2. Birth details appear in the centre square
east.set_birth_details("08 October 1991", "14:47", "New York")

# 3. Add planets by house counted anti-clockwise from Lagna
#    housenum=1 is always the ascendant sign.
east.add_planet(chart.SUN, "Su", 1)
east.add_planet(chart.MOON, "Mo", 2)
east.add_planet(chart.MARS, "Ma", 3)
east.add_planet(chart.MERCURY, "Me", 4)
east.add_planet(chart.JUPITER, "Ju", 5, retrograde=True)
east.add_planet(chart.VENUS, "Ve", 6)
east.add_planet(chart.SATURN, "Sa", 7)
east.add_planet(chart.RAHU, "Ra", 8)
east.add_planet(chart.KETU, "Ke", 2)

east.updatechartcfg(aspect=False)
result = east.draw(OUTPUT_DIR + "/", "east_natal", "svg")
print(f"A. East natal -> {result}: {OUTPUT_DIR}/east_natal.svg")

"""C. East Indian Transit Chart (natal + transit overlay).

Run:
    python3 examples/east_c_transit.py
Output:
    ./output/east_transit.svg
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jyotichart as chart

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(OUTPUT_DIR, exist_ok=True)

# 1. Base natal chart (fixed signs, anti-clockwise)
base = chart.EastChart("D1 Natal", "John Doe")
base.set_ascendantsign("Aries")
base.add_planet(chart.SUN, "Su", 1)
base.add_planet(chart.MOON, "Mo", 2)
base.add_planet(chart.MARS, "Ma", 3)
base.add_planet(chart.MERCURY, "Me", 4)
base.add_planet(chart.JUPITER, "Ju", 5)
base.add_planet(chart.VENUS, "Ve", 6)
base.add_planet(chart.SATURN, "Sa", 7)
base.add_planet(chart.RAHU, "Ra", 8)
base.add_planet(chart.KETU, "Ke", 2)
base.updatechartcfg(aspect=False)

# 2. Transit overlay — natal planets stay at base coords,
#    transit planets are shifted (+20,+15) so both remain visible.
transit = chart.EastTransitChart("Transit", "John Doe", base)
#transit.set_transit_details("12 Jan 2026", "10:00")
transit.add_planet(chart.SUN, "Su", 10)
transit.add_planet(chart.MOON, "Mo", 12)
transit.add_planet(chart.MARS, "Ma", 1)
transit.add_planet(chart.MERCURY, "Me", 2)
transit.add_planet(chart.JUPITER, "Ju", 3)
transit.add_planet(chart.VENUS, "Ve", 4)
transit.add_planet(chart.SATURN, "Sa", 5)
transit.add_planet(chart.RAHU, "Ra", 6)
transit.add_planet(chart.KETU, "Ke", 12)
transit.updatechartcfg(aspect=False)

result = transit.draw(OUTPUT_DIR + "/", "east_transit", "svg")
print(f"C. East transit -> {result}: {OUTPUT_DIR}/east_transit.svg")

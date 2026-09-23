"""Light theme + custom fonts + SVG-string embedding.

White background, gray borders/grid, black sign numbers and planet text,
serif font family with larger sizes. Also shows to_svg_string() by
inlining a chart into an HTML report (no SVG file needed for that part).

Run:
    python3 examples/styled_light.py
Output:
    ./output/light_south.svg
    ./output/light_east.svg
    ./output/light_report.html  (charts embedded as SVG strings)
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

LIGHT = dict(
    aspect=False,
    clr_background="white",   # white page and centre box
    clr_outbox="gray",        # gray border ...
    clr_inbox="gray",
    clr_line="gray",          # ... and gray grid
    clr_Asc="black",          # black sign numbers / Asc marker
    clr_houses=["white"] * 12,  # white house boxes (default is black!)
    clr_details="black",      # black centre text (default is white!)
    font_family="Georgia, serif",
    font_sizes={"sign": 24, "planet": 17, "aspect": 18, "details": 14},
)


def add_all_planets(c, lang="english", colour="black"):
    for planet, house in zip(PLANETS, HOUSES):
        c.add_planet(planet, chart.get_planet_symbol(planet, lang), house,
                     colour=colour)


# South Indian light chart (black text needs explicit planet colour).
south = chart.SouthChart("D1 Natal", "John Doe", language="english")
south.set_birth_details("08 October 1991", "14:47", "New York")
south.set_ascendantsign("Aries")
add_all_planets(south)
south.updatechartcfg(**LIGHT)
print("light south ->", south.draw(OUTPUT_DIR + "/", "light_south", "svg"))

# East Indian light chart.
east = chart.EastChart("D1 Natal", "John Doe", language="english")
east.set_birth_details("08 October 1991", "14:47", "New York")
east.set_ascendantsign("Aries")
add_all_planets(east)
east.updatechartcfg(**LIGHT)
print("light east ->", east.draw(OUTPUT_DIR + "/", "light_east", "svg"))

# Embedding: render straight to strings, inline them in HTML.
south_svg = south.to_svg_string()
east_svg = east.to_svg_string()
assert south_svg.startswith("<svg") and east_svg.startswith("<svg")
html = """<!DOCTYPE html>
<html><head><meta charset="utf-8"><title>Light charts</title></head>
<body style="background:white;color:black;font-family:Georgia,serif">
<h1>South Indian (light)</h1>
%s
<h1>East Indian (light)</h1>
%s
</body></html>
""" % (south_svg, east_svg)
report = os.path.join(OUTPUT_DIR, "light_report.html")
with open(report, "w", encoding="utf-8") as f:
    f.write(html)
print("light report -> Success:", report)

"""B. East Indian Charts in Sinhala / Tamil.

Run:
    python3 examples/east_b_languages.py
Output:
    ./output/east_sinhala.svg
    ./output/east_tamil.svg
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


CONFIGS = [
    ("sinhala", "", "", "Colombo"),
    ("tamil", "", "", "Chennai"),
    ("english", "D9 Navamsha", "Kamal", "Chennai"),
]

for lang, chartname, person, pob in CONFIGS:
    # Asc -> "ලග්න" (sinhala) / "லக்னம்" (tamil),
    # centre labels translated automatically.
    east = chart.EastChart(chartname, person, language=lang)
    #east.set_birth_details("15 Aug 1990", "08:30", pob)
    east.set_ascendantsign("Leo")
    for planet, house in zip(PLANETS, HOUSES):
        status = east.add_planet(planet, chart.get_planet_symbol(planet, lang), house,
                                 colour="black")  # default is white -> invisible on white!
        assert status == "Success", f"{lang} {planet}: {status}"
    east.updatechartcfg(show_center_lagna="Hora", **LIGHT)
    result = east.draw(OUTPUT_DIR + "/", f"east_{lang}", "svg")
    print(f"B. East {lang} -> {result}: {OUTPUT_DIR}/east_{lang}.svg")

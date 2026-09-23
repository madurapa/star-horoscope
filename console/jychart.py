"""Bridge: schema documents -> jyotichart SVG (vendored, MIT, pure stdlib).

East Indian fixed-sign anti-clockwise charts (and South squares) with
Sinhala/Tamil/English rendering. House numbers from chart_data() map 1:1
onto add_planet() housenums (both count anti-clockwise from Lagna as 1).
Traditional 9 grahas only — Uranus/Neptune/Pluto have no place in these
frames and are skipped. Terminal text charts (kendra.py/south.py) stay
for terminal output; this module feeds HTML export.
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                "third_party", "jyotichart"))

import jyotichart as chart  # noqa: E402

from kendra import RASIS  # noqa: E402
from render import CHART_DEFS, chart_data  # noqa: E402

MODERN_TO_CLASSICAL = {
    "Mesha": "Aries", "Vrishabha": "Taurus", "Mithuna": "Gemini",
    "Kataka": "Cancer", "Simha": "Leo", "Kanya": "Virgo",
    "Tula": "Libra", "Vrishchika": "Scorpio", "Dhanu": "Saggitarius",
    "Makara": "Capricorn", "Kumbha": "Aquarius", "Meena": "Pisces",
}

PLANET_CONST = {
    "Ravi": chart.SUN, "Chandra": chart.MOON, "Kuja": chart.MARS,
    "Budha": chart.MERCURY, "Guru": chart.JUPITER, "Sikuru": chart.VENUS,
    "Shani": chart.SATURN, "Raahu": chart.RAHU, "Kethu": chart.KETU,
}

LOCALE = {"en": "english", "si": "sinhala", "ta": "tamil"}


def _house_of(houses: dict, planet: str) -> int:
    for h, ps in houses.items():
        if planet in ps:
            return h
    return 1


def east_svg(doc, varga: int, lagna_planet, locale: str, title: str) -> str:
    lang = LOCALE.get(locale, "english")
    houses, _, lagna_seat = chart_data(doc, varga, lagna_planet)
    c = chart.EastChart(title, doc["name"], language=lang)
    c.set_birth_details(doc["birth_date"], doc["birth_time"], doc["place"]["city"])
    c.set_ascendantsign(MODERN_TO_CLASSICAL[RASIS[lagna_seat - 1]])
    for p, const in PLANET_CONST.items():
        c.add_planet(const, chart.get_planet_symbol(const, lang), _house_of(houses, p))
    c.updatechartcfg(aspect=False)
    return c.to_svg_string()


def south_svg(doc, varga: int, lagna_planet, locale: str, title: str) -> str:
    lang = LOCALE.get(locale, "english")
    houses, _, lagna_seat = chart_data(doc, varga, lagna_planet)
    c = chart.SouthChart(title, doc["name"], language=lang)
    c.set_birth_details(doc["birth_date"], doc["birth_time"], doc["place"]["city"])
    c.set_ascendantsign(MODERN_TO_CLASSICAL[RASIS[lagna_seat - 1]])
    for p, const in PLANET_CONST.items():
        c.add_planet(const, chart.get_planet_symbol(const, lang), _house_of(houses, p))
    c.updatechartcfg(aspect=False)
    return c.to_svg_string()


def gallery(doc, style: str, locale: str) -> str:
    parts = ["<h2>Charts (SVG)</h2>"]
    make = south_svg if style == "south" else east_svg
    for title, varga, lagna_planet in CHART_DEFS:
        parts.append(make(doc, varga, lagna_planet, locale, title))
    return "\n".join(parts)

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
from i18n import tr  # noqa: E402
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

# SL glyph convention: DOS-style abbreviations in English; first-akshara
# abbreviations in si/ta (Draft for translator review — all distinct,
# compartments are slot-positioned so narrower glyphs cannot collide).
GLYPHS = {
    "Ravi": "Rv", "Chandra": "Ch", "Kuja": "Ku", "Budha": "Bu",
    "Guru": "Gu", "Sikuru": "Si", "Shani": "Sh", "Raahu": "Ra",
    "Kethu": "Ke",
}
GLYPH_LOCALE = {
    "si": {"Ravi": "ර", "Chandra": "ච", "Kuja": "කු", "Budha": "බු",
           "Guru": "ගු", "Sikuru": "ශු", "Shani": "ශ", "Raahu": "රා",
           "Kethu": "කේ"},
    "ta": {"Ravi": "சூ", "Chandra": "சந்", "Kuja": "செ", "Budha": "பு",
           "Guru": "கு", "Sikuru": "சு", "Shani": "சனி", "Raahu": "ரா",
           "Kethu": "கே"},
}


def _glyph(planet, locale):
    """Chart glyph for an engine planet key in the report locale."""
    return GLYPH_LOCALE.get(locale, {}).get(planet, GLYPHS[planet])

LOCALE = {"en": "english", "si": "sinhala", "ta": "tamil"}

# Report-theme matching the page (docs/modern_display.md palette).
# Colors ride as CSS vars so the SVG follows the theme instead of
# baking literals (light now, dark later); family matches the report
# body. Sizes/weights stay library-tuned to the compartments — the
# theme defines no chart type scale.
THEME_FAMILY = "'Noto Sans Sinhala', 'Noto Sans', sans-serif"
LIGHT = dict(
    aspect=False,
    clr_background="var(--chart-bg)",
    clr_outbox="var(--chart-line)",
    clr_inbox="var(--chart-line)",
    clr_line="var(--chart-line)",
    clr_Asc="var(--text)",
    clr_houses=["var(--chart-bg)"] * 12,
    clr_details="var(--text)",
    font_family=THEME_FAMILY,
)

# Division label for the center box per chart (jyotichart vocabulary, so
# si/ta translate; unknown names pass through unchanged). The Lagna
# chart uses True: rising sign + Lagna marker (the library maps the
# word "Lagna" to "Rashi", which is not what we want there).
DIVISIONS = {
    "Lagna Chart": True,
    "Navamsa Chart": "Navamsa",
    "Hora Chart": "Hora",
    "Drekkana Chart": "Drekkana",
    "Dvadasamsa Chart": "Dwadasamsa",
    "Trimshamsa Chart": "Trimsamsa",
    "Ravi Chart": "Ravi",
    "Chandra Chart": "Chandra",
}


def _division_label(title, locale):
    """Localized center-box label. Sun/Moon are not library varga names
    (they would pass through in English), so localize here: the report
    calls the Sun Ravi (sample/matrix convention), the Moon Chandra."""
    from i18n import trv
    from report_l10n import trvx

    if title == "Ravi Chart":
        return trvx("Ravi", locale)
    if title == "Chandra Chart":
        return trv("Chandra", locale, "planets")
    return DIVISIONS[title]


def _house_of(houses: dict, planet: str) -> int:
    for h, ps in houses.items():
        if planet in ps:
            return h
    return 1


def _base(doc, varga: int, lagna_planet, locale: str, title: str, cls):
    lang = LOCALE.get(locale, "english")
    houses, _, lagna_seat = chart_data(doc, varga, lagna_planet)
    # Empty name/title: the report already profiles the owner, so the
    # center box carries only the rising sign + division label.
    c = cls("", "", language=lang)
    c.set_birth_details("", "", "")
    c.set_ascendantsign(MODERN_TO_CLASSICAL[RASIS[lagna_seat - 1]])
    for p, const in PLANET_CONST.items():
        c.add_planet(const, _glyph(p, locale),
                     _house_of(houses, p), colour="var(--text)")
    c.updatechartcfg(show_center_lagna=_division_label(title, locale),
                     **LIGHT)
    return c.to_svg_string()


def north_svg(doc, varga: int, lagna_planet, locale: str, title: str) -> str:
    # Fixed-house diamond like the DOS original: houses are positions,
    # signs rotate (housesigns). No division label needed — compartments
    # carry house numbers plus rotating sign numbers.
    lang = LOCALE.get(locale, "english")
    houses, _, lagna_seat = chart_data(doc, varga, lagna_planet)
    c = chart.NorthChart("", "", language=lang)
    c.set_ascendantsign(MODERN_TO_CLASSICAL[RASIS[lagna_seat - 1]])
    for p, const in PLANET_CONST.items():
        c.add_planet(const, _glyph(p, locale),
                     _house_of(houses, p), colour="var(--text)")
    c.updatechartcfg(**{k: v for k, v in LIGHT.items()
                         if k not in ("clr_inbox", "clr_Asc")})
    return c.to_svg_string()


def east_svg(doc, varga: int, lagna_planet, locale: str, title: str) -> str:
    """East frame, fixed houses (Sri Lankan use): house h always sits in
    position h, signs rotate. The housenum handed to the library is the
    one landing on the wanted position under the true ascendant."""
    lang = LOCALE.get(locale, "english")
    houses, _, lagna_seat = chart_data(doc, varga, lagna_planet)
    c = chart.EastChart("", "", language=lang)
    c.set_birth_details("", "", "")
    c.set_ascendantsign(MODERN_TO_CLASSICAL[RASIS[lagna_seat - 1]])
    c.fixed_houses = True
    for p, const in PLANET_CONST.items():
        house = _house_of(houses, p)
        # housenum n from true asc landing on position `house`: the library
        # maps n onto that position's fixed sign, so slots stay put.
        n = ((house - lagna_seat) % 12) + 1
        c.add_planet(const, _glyph(p, locale), n, colour="var(--text)")
    # Full names need smaller type in the cramped triangles.
    c.updatechartcfg(show_center_lagna=_division_label(title, locale),
                     **LIGHT)
    return _drop_asc_marker(c.to_svg_string())


def _drop_asc_marker(svg: str) -> str:
    """Strip the in-compartment Lagna marker (East only).

    Fixed-house mode pins the ascendant in house 1 (top-center) on
    every chart, so the marker carries no information — the center
    box already names the rising sign. South keeps its marker (its
    signs rotate across compartments).
    """
    import re

    svg = re.sub(r'<text[^>]*id="[A-Za-z]*Asc"[^>]*>[^<]*</text>\s*', "", svg)
    return re.sub(r"  <!-- \*+ Ascendant Sign \*+ -->\n", "", svg)


def south_svg(doc, varga: int, lagna_planet, locale: str, title: str) -> str:
    return _base(doc, varga, lagna_planet, locale, title, chart.SouthChart)


def _thin(svg: str) -> str:
    """Slim the library's chunky strokes (3/2 viewBox px read heavy at
    display size): outer/center boxes 3 -> 1.5, compartments 2 -> 1."""
    import re

    svg = re.sub(r"stroke-width:3(\.0)?(?![\d.])", "stroke-width:1.5", svg)
    return re.sub(r"stroke-width:2(\.0)?(?![\d.])", "stroke-width:1", svg)


def gallery_items(doc, style: str, locale: str):
    """Structured chart cards: [(title, varga, lagna_planet, svg)].

    The HTML report wraps each svg in its own card (title + zodiac
    icon); gallery() below keeps the legacy flat-HTML assembly.
    """
    if style == "south":
        make = south_svg
    elif style == "north":
        make = north_svg  # fixed houses like the CLI
    else:
        make = east_svg  # default: Sri Lankan East diamond
    return [(title, varga, lagna_planet,
             _thin(make(doc, varga, lagna_planet, locale, title)))
            for title, varga, lagna_planet in CHART_DEFS]


def gallery(doc, style: str, locale: str) -> str:
    parts = ["<h2>Charts (SVG)</h2>"]
    for title, _varga, _lagna_planet, svg in gallery_items(doc, style, locale):
        parts.append(f"<h3>{tr(title, locale)}</h3>")
        parts.append(svg)
    return "\n".join(parts)

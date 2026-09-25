"""Single source for engine-key -> modern display spellings (console).

Mirrors C++ displayPlanet/dasaName (src/ModernRenderer.hpp, which stays
authoritative for the native side); engine keys stay canonical
everywhere. render.py, kendra.py, htmlreport.py and jychart.py all
import from here — no local copies (WS-A consolidation).
"""

from i18n import trv
from report_l10n import trvx

# Modern display spellings (mirror displayPlanet).
PLANET_DISPLAY = {"Sikuru": "Shukra", "Raahu": "Rahu", "Kethu": "Ketu",
                  "Urenus": "Uranus"}
# Dasa-table spellings to modern display (mirror dasaName).
DASA_DISPLAY = {"Sikuru": "Shukra", "Sandu": "Chandra", "Rahu": "Rahu"}
# Yoga/karana romanizations to modern display (mirror displayYogaName /
# displayKaranaName; engine tables stay byte-faithful).
YOGA_DISPLAY = {"Vishkamba": "Vishkambha", "Aaushmaan": "Ayushman",
                "Savbhagya": "Saubhagya", "Sukarna": "Sukarma",
                "Drathi": "Dhriti", "Drava": "Dhruva", "Shubra": "Shukla",
                "Mahendra": "Indra", "Vydruthi": "Vaidhriti",
                "Brahhma": "Brahma"}
KARANA_DISPLAY = {"Kinsthugana": "Kimstughna"}


def disp(planet: str) -> str:
    return PLANET_DISPLAY.get(planet, planet)


def dasa_lord(lord: str) -> str:
    return DASA_DISPLAY.get(lord, lord)


# Sample-exact matrix row order (Lagna first, then Sun-first).
MATRIX_ORDER = ["Lagna", "Ravi", "Chandra", "Kuja", "Budha", "Guru",
                "Sikuru", "Shani", "Raahu", "Kethu", "Urenus",
                "Neptune", "Pluto"]

# The 8 charts: (localized-title key, varga index, lagna planet).
# Lagna planet None means the chart ascendant (doc lagna seats).
CHART_DEFS = [
    ("Lagna Chart", 0, None),
    ("Navamsa Chart", 1, None),
    ("Hora Chart", 2, None),
    ("Drekkana Chart", 3, None),
    ("Dvadasamsa Chart", 4, None),
    ("Trimshamsa Chart", 5, None),
    ("Ravi Chart", 0, "Ravi"),
    ("Chandra Chart", 0, "Chandra"),
]

# Division label for the center box per chart (jyotichart vocabulary, so
# si/ta translate; unknown names pass through unchanged). The Lagna
# chart uses True: rising sign + Lagna marker (the library maps the
# word "Lagna" to "Rashi", which is not what we want there).
DIVISION_LABELS = {
    "Lagna Chart": True,
    "Navamsa Chart": "Navamsa",
    "Hora Chart": "Hora",
    "Drekkana Chart": "Drekkana",
    "Dvadasamsa Chart": "Dwadasamsa",
    "Trimshamsa Chart": "Trimsamsa",
    "Ravi Chart": "Ravi",
    "Chandra Chart": "Chandra",
}


def division_label(title, locale):
    """Localized center-box label. Sun/Moon are not library varga names
    (they would pass through in English), so localize here: the report
    calls the Sun Ravi (sample/matrix convention), the Moon Chandra."""
    if title == "Ravi Chart":
        return trvx("Ravi", locale)
    if title == "Chandra Chart":
        return trv("Chandra", locale, "planets")
    return DIVISION_LABELS[title]

"""HTML-report-only strings (hand-maintained companion to i18n.py).

i18n.py is GENERATED from src/locale_si.inc / src/locale_ta.inc
(canonical C++ concepts, pinned at 363 by tests/test_locale.cpp), so
report-chrome strings that have no C++ counterpart live here instead.
Lookup order in trx(): i18n.STRINGS first (canonical wins), then
EXTRA_STRINGS below. Unknown locales and strings pass through in
English, like tr().

STATUS: si/ta rows below are first-draft (translator review needed
before any "Reviewed" claim, cf. src/locale_si.inc header). When a
translator promotes one of these into the canonical locale files,
delete the row here and add the concept to tools/gen_locales.py ITEMS.

Varga/month/Pada rows are DERIVED from i18n.CONCEPTS (canonical
translator data, not retyped); only genuinely new strings are
hand-typed below.
"""

import re

from i18n import CONCEPTS, STRINGS, tr as _tr, tr_tithi as _tr_tithi

# English literal -> (si, ta). Keys must equal the exact literals the
# report emits; values are Draft translations, see module docstring.
EXTRA_STRINGS = {
    'Sri Lankan Vedic Astrology Engine': (
        'ශ්‍රී ලංකා වේද ජ්‍යොතිෂ එන්ජිම',
        'இலங்கை வேத ஜோதிட எஞ்சின்'),
    'Engine': ('එන්ජිම', 'எஞ்சின்'),
    'Locale': ('භාෂාව', 'மொழி'),
    'Chart Style': ('සටහන් රටාව', 'கட்ட முறை'),
    'Shadvarga Matrix': ('ෂඩ්වර්ග න්‍යාසය', 'ஷட்வர்க்க அணி'),
    'Divisional Charts': ('වර්ග සටහන්', 'வர்க்கக் கட்டங்கள்'),
    'Schema': ('ස්කීමා', 'ஸ்கீமா'),
    'Version': ('අනුවාදය', 'பதிப்பு'),
    'Universal Time': ('විශ්ව වේලාව', 'உலகளாவிய நேரம்'),
    'Graha': ('ග්‍රහ', 'கிரகம்'),
    'Rasi': ('රාශිය', 'ராசி'),
    'Longitude': ('ස්ඵුට', 'ஸ்புடம்'),
    'Avastha': ('අවස්ථාව', 'அவஸ்தை'),
    'navamsa': ('නවාංශ', 'நவாம்சம்'),
    'Pura': ('පුර', 'வளர்பிறை'),
    'Ava': ('අව', 'தேய்பிறை'),
    'Nirayana': ('නිරයන', 'நிராயனம்'),
    'Sayana': ('සායන', 'சாயனம்'),
    'EN': ('ඉංග්‍රීසි', 'ஆங்கிலம்'),
    'SI': ('සිංහල', 'சிங்களம்'),
    'TA': ('දෙමළ', 'தமிழ்'),
    'East': ('නැගෙනහිර', 'கிழக்கு'),
    'North': ('උතුර', 'வடக்கு'),
    'South': ('දකුණ', 'தெற்கு'),
    'Diamond': ('ඩයමන්ඩ්', 'டயமண்ட்'),
    'Passed': ('ගතවූ', 'கடந்த'),
    'Active': ('ක්‍රියාත්මක', 'நடப்பு'),
    'Starts': ('ඇරඹෙන', 'தொடங்கும்'),
    'Ends': ('අවසන් වේ', 'முடிகிறது'),
    'Click on each Mahadasa to view its corresponding Antardasas.': (
        'අදාළ අතුරු දශා බැලීමට එක් එක් මහා දශාව මත ක්ලික් කරන්න.',
        'தொடர்புடைய அந்தர்தசைகளைக் காண ஒவ்வொரு மகாதசையையும் கிளிக் செய்க.'),
    'Superscript numbers show the Rasi sign number.': (
        'උඩුකුරු අංකවලින් දැක්වෙන්නේ රාශි අංකයයි.',
        'மேலொட்டு எண்கள் ராசி எண்ணைக் காட்டுகின்றன.'),
}

# Varga table headers derived from canonical concepts (VargaHora ->
# 'Hora', etc.); RajjuPada carries the bare 'Pada' header.
_VARGA_KEYS = {
    'VargaHora': 'Hora', 'VargaDrekkana': 'Drekkana',
    'VargaNavamsa': 'Navamsa', 'VargaDvadasamsa': 'Dvadasamsa',
    'VargaTrimshamsa': 'Trimshamsa',
}
for _concept, _header in _VARGA_KEYS.items():
    _en, _si, _ta = CONCEPTS[_concept]
    # Canonical STRINGS wins in trx(); never shadow it (e.g. Hora).
    if _header not in STRINGS:
        EXTRA_STRINGS.setdefault(_header, (_si, _ta))
EXTRA_STRINGS.setdefault('Pada', CONCEPTS['RajjuPada'][1:])

# Month names derived from canonical concepts (timeline "Passed 2010
# June" style status labels).
EXTRA_MONTHS = {}
for _concept, (_en, _si, _ta) in CONCEPTS.items():
    if _concept.startswith('Month'):
        EXTRA_MONTHS[_en] = (_si, _ta)
_MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November',
                'December']

# Short month forms for the timeline (sample style). English uses the
# standard 3-letter abbreviations; si/ta shorts are first-syllable
# truncations — Draft for translator review.
EXTRA_MONTHS_SHORT = {
    'January': ('Jan', 'ජන', 'ஜன'),
    'February': ('Feb', 'පෙබ', 'பிப்'),
    'March': ('Mar', 'මාර්', 'மார்'),
    'April': ('Apr', 'අප්‍රේ', 'ஏப்'),
    'May': ('May', 'මැයි', 'மே'),
    'June': ('Jun', 'ජූනි', 'ஜூன்'),
    'July': ('Jul', 'ජූලි', 'ஜூலை'),
    'August': ('Aug', 'අගෝ', 'ஓக்'),
    'September': ('Sep', 'සැප්', 'செப்'),
    'October': ('Oct', 'ඔක්', 'அக்'),
    'November': ('Nov', 'නොවැ', 'நவ'),
    'December': ('Dec', 'දෙසැ', 'டிச'),
}

# Report display names missing from i18n.VALUES['planets'] (which keys
# modern display strings): english -> (si, ta). Translations reuse the
# canonical concept rows (DasaRavi, PnameUrenus, ...).
EXTRA_PLANETS = {
    'Ravi': ('රවි', 'சூரியன்'),
    'Uranus': ('යුරේනස්', 'யுரேனஸ்'),
    'Neptune': ('නෙප්චූන්', 'நெப்டியூன்'),
    'Pluto': ('ප්ලූටෝ', 'புளூட்டோ'),
}

# Avastha states have no C++ concept rows (engine strings, shown raw in
# en like the sample). Draft transliterations, reviewer to confirm.
EXTRA_AVASTHA = {
    'Nidra': ('නිද්‍රා', 'நித்ரா'),
    'Shayana': ('ශයන', 'சயனம்'),
    'Upeveshana': ('උපවේශන', 'உபவேசனம்'),
    'Nethrapani': ('නේත්‍රපානි', 'நேத்ரபாணி'),
    'Prakasha': ('ප්‍රකාශ', 'பிரகாசம்'),
    'Gamana': ('ගමන', 'கமனம்'),
    'Agamana': ('ආගමන', 'ஆகமனம்'),
    'Saba': ('සභා', 'சபா'),
    'AAgama': ('ආගම', 'ஆகமம்'),
    'Bhojana': ('භෝජන', 'போஜனம்'),
    'Nuthyalipsa': ('නුත්‍යලිප්ස', 'நுத்யலிப்ஸா'),
    'Kavthuka': ('කව්තුක', 'கவ்துகம்'),
}


def trx(text, locale):
    """Localize report chrome: canonical STRINGS first, extras second."""
    out = _tr(text, locale)
    if out != text or locale not in ("si", "ta"):
        return out
    row = EXTRA_STRINGS.get(text)
    if row:
        return row[0] if locale == "si" else row[1]
    return text


def trvx(text, locale):
    """Translate a graha display name; extras cover Ravi + outers."""
    if locale in ("si", "ta"):
        row = EXTRA_PLANETS.get(text)
        if row:
            return row[0] if locale == "si" else row[1]
    from i18n import trv as _trv

    return _trv(text, locale, "planets")


def tr_avastha(text, locale):
    """Translate an avastha state; unknown/empty passes through."""
    if locale in ("si", "ta") and text:
        row = EXTRA_AVASTHA.get(text)
        if row:
            return row[0] if locale == "si" else row[1]
    return text


def tr_month(iso_date, locale, short=False):
    """Localized month name for an ISO date (YYYY-MM-DD).

    short=True gives the sample-style short form in every locale
    (Jun / ජූනි are already short; longer names abbreviate).
    """
    try:
        name = _MONTH_NAMES[int(iso_date[5:7]) - 1]
    except (ValueError, IndexError):
        return ""
    if short:
        row = EXTRA_MONTHS_SHORT.get(name)
        if row:
            if locale == "si":
                return row[1]
            if locale == "ta":
                return row[2]
            return row[0]
        return name[:3]
    if locale in ("si", "ta"):
        row = EXTRA_MONTHS.get(name)
        if row:
            return row[0] if locale == "si" else row[1]
    return name


_TITHI_RE = re.compile(r"^\s*(Pura|Ava)?\s*-?\s*(\S.*?)\s*-?\s*(\d+)\s*$")


def tr_tithi_full(text, locale):
    """Translate a full tithi string with uniform separators.

    Engine strings carry ragged spacing ('Ava -Thiyawaka  - 3'); the
    report re-emits every parsed form uniformly as 'Ava - Thiyawaka -
    3' with prefix + limb translated (si/ta also need පුර/අව and
    வளர்பிறை/தேய்பிறை). Genuinely unparseable strings fall back to
    i18n.tr_tithi() limb substitution.
    """
    from i18n import trv as _trv

    m = _TITHI_RE.match(text)
    if m and m.group(2):
        prefix, limb, day = m.group(1) or "", m.group(2).strip(), m.group(3)
        limb_t = _trv(limb, locale, "limbs")
        if not prefix:
            return f"{limb_t} - {day}"
        prefix_t = trx(prefix, locale)
        return f"{prefix_t} - {limb_t} - {day}"
    return _tr_tithi(text, locale)

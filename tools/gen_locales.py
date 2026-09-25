#!/usr/bin/env python3
"""Single source for generated language tables.

Master store: src/locale_si.inc + src/locale_ta.inc (canonical si/ta
rows per Concept) with English fallback text in src/Locale.hpp.
This script derives every generated artifact from that store:

  console/i18n.py — STRINGS (en-literal lookup used by console tr())
    plus CONCEPTS (full concept table for reference/future use).
  third_party/jyotichart/support/languages.py — si/ta sign-names
    blocks plus the si/ta ui_labels "asc" rows (the Lagna marker)
    between GENERATED markers (format preserved). All other
    jyotichart tables (planet glyphs, ui chrome without a core
    counterpart, kannada/hindi, the 16-division varga names) stay
    hand-maintained.

Usage:
  ./tools/gen_locales.py            regenerate changed files (prints status)
  ./tools/gen_locales.py --check    exit 1 on any drift (for the gate)

Day-one rule: regenerating must reproduce the committed files except
for the header provenance lines below. Any other diff is a bug here,
not an update there.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SI_INC = ROOT / "src" / "locale_si.inc"
TA_INC = ROOT / "src" / "locale_ta.inc"
LOCALE_HPP = ROOT / "src" / "Locale.hpp"
CONSOLE_OUT = ROOT / "console" / "i18n.py"
JYOTICHART = ROOT / "third_party" / "jyotichart" / "support" / "languages.py"

# (concept, english-as-rendered) — english must match render.py literals
# exactly. Subset the console looks up; CONCEPTS below carries all 363.
ITEMS = [
    ("UiTitleHoroscopeProfile", "Horoscope Profile"),
    ("UiTitleBirthProfile", "Birth Profile"),
    ("UiTitleAstroReference", "Astronomical & Chart Reference"),
    ("UiTitleTimeMetrics", "Time & Solar Metrics"),
    ("UiTitlePanchanga", "Panchanga"),
    ("UiTitleDasaInformation", "Dasa Information"),
    ("UiTitleHora", "Hora"),
    ("UiTitleChakra", "Chakra"),
    ("UiTitleSelectedOptions", "Selected Options"),
    ("UiTitleNirayanaTableOfHouses", "Nirayana Table of Houses"),
    ("UiTitleShadvargaCharts", "Shadvarga Charts"),
    ("UiTitleShadvargaPositions", "Shadvarga Positions"),
    ("UiTitleMahadasaTimeline", "Mahadasa and Antardasa Timeline"),
    ("UiHouseName", "Name"),
    ("UiHouseBorn", "Born"),
    ("UiHousePlace", "Place"),
    ("UiProfileBirthDay", "Birth Weekday"),
    ("UiOptDistrict", "District"),
    ("UiOptMethod", "Method"),
    ("UiAstroLagna", "Lagna"),
    ("UiAstroLagnaDegree", "Lagna Degree"),
    ("UiAstroLagnaNavamsa", "Lagna Navamsa"),
    ("UiTimeBirthTime", "Birth Time"),
    ("UiTimeTrueLocalMeanTime", "Local Mean Time (LMT)"),
    ("UiTimeUniversalSidereal", "Greenwich Mean Sidereal Time"),
    ("UiAstroJulianDate", "Julian Date"),
    ("UiAstroAyanamsa", "Ayanamsa"),
    ("UiTimeSinhalaTime", "Sinhala Time"),
    ("UiTimeSunrise", "Sunrise"),
    ("UiTimeSunset", "Sunset"),
    ("UiTimeUniversalTimeUT", "Universal Time (UT)"),
    ("UiTimeLocalMeanSidereal", "Local Mean Sidereal Time"),
    ("UiPanchangaTithi", "Tithi"),
    ("UiPanchangaNakshatra", "Nakshatra"),
    ("UiPanchangaNakshatraPada", "Nakshatra Pada"),
    ("UiPanchangaYoga", "Yoga"),
    ("UiPanchangaKarana", "Karana"),
    ("UiDasaStarting", "Starting"),
    ("UiDasaPeriod", "Period"),
    ("UiDasaReference", "Reference"),
    ("UiDasaFromBirth", "From birth"),
    ("UiHoraKala", "Kala"),
    ("UiHoraPanchama", "Panchama"),
    ("UiHoraSukshama", "Sukshama"),
    ("UiChakraGana", "Gana"),
    ("UiChakraYoni", "Yoni"),
    ("UiChakraLinga", "Linga"),
    ("UiChakraNaadi", "Naadi"),
    ("UiChakraVarna", "Varna"),
    ("UiChakraRuxha", "Ruxha"),
    ("UiChakraPaxhi", "Paxhi"),
    ("UiChakraGothra", "Gothra"),
    ("UiChakraRajju", "Rajju"),
    ("UiChakraBhutha", "Bhutha"),
    ("UiChartLagna", "Lagna Chart"),
    ("UiChartNavamsa", "Navamsa Chart"),
    ("UiKendraHoraChart", "Hora Chart"),
    ("UiKendraDrekkanaChart", "Drekkana Chart"),
    ("UiChartDvadasamsa", "Dvadasamsa Chart"),
    ("UiChartTrimshamsa", "Trimshamsa Chart"),
    ("UiChartSun", "Ravi Chart"),
    ("UiChartMoon", "Chandra Chart"),
]

# (jyotichart lang, concept) for generated ui_labels rows. Only keys
# with an exact-meaning core concept are generated (asc = the Lagna
# marker, cf. UiKendraLagna); the remaining chart chrome
# (birth/birthplace/chart/inner/outer/transit/...) has no core
# counterpart and stays hand-maintained in languages.py.
UI_ASC = [
    ("sinhala", "UiKendraLagna"),
    ("tamil", "UiKendraLagna"),
]

# (concept, classical key used by jyotichart) — stable mapping.
SIGNS = [
    ("RasiMesha", "Aries"), ("RasiVrishabha", "Taurus"),
    ("RasiMithuna", "Gemini"), ("RasiKataka", "Cancer"),
    ("RasiSimha", "Leo"), ("RasiKanya", "Virgo"),
    ("RasiTula", "Libra"), ("RasiVrishchika", "Scorpio"),
    ("RasiDhanu", "Saggitarius"), ("RasiMakara", "Capricorn"),
    ("RasiKumbha", "Aquarius"), ("RasiMeena", "Pisces"),
]

ROW_RE = (r'\{Concept::([A-Za-z0-9_]+),\s*"((?:[^"\\]|\\.)*)",'
          r'\s*"((?:[^"\\]|\\.)*)",\s*ReviewStatus::([A-Za-z]+)\},?')


def load_inc(path):
    txt = "\n".join(
        l for l in path.read_text(encoding="utf-8").split("\n")
        if not l.strip().startswith("//"))
    out = {}
    for m in re.finditer(ROW_RE, txt):
        c, s, r, st = m.groups()
        if c in out:
            raise SystemExit("dup %s in %s" % (c, path))
        out[c] = (s, r, st)
    return out


def concept_en_table():
    """Ordered (concept, en) pairs: Concept enum order zipped with the
    conceptText table order. Both orders are load-bearing; any length
    mismatch or spot-check failure exits nonzero (loud, never silent)."""
    src = LOCALE_HPP.read_text(encoding="utf-8")
    enum_txt = re.search(r"enum class Concept[^{]*{(.*?)\n};", src, re.S).group(1)
    enum_txt = "\n".join(l.split("//")[0] for l in enum_txt.split("\n"))
    names = [x.strip().split("=")[0].strip() for x in enum_txt.split(",")]
    names = [n for n in names if n and n != "Count"]
    arr = re.search(r"static const ConceptText k\[\] = \{(.*?)\n    \};", src, re.S).group(1)
    ens = re.findall(r'\{\s*"((?:[^"\\]|\\.)*)"\s*\}', arr)
    if len(names) != len(ens):
        raise SystemExit("concept/en length mismatch: %d vs %d"
                         % (len(names), len(ens)))
    pairs = list(zip(names, ens))
    for want_c, want_en in (("RasiMesha", "Mesha"),
                            ("UiMiscYes", "Yes"),
                            ("UiMiscNo", "No")):
        got = dict(pairs).get(want_c)
        if got != want_en:
            raise SystemExit("concept/en misaligned at %s: %r" % (want_c, got))
    return pairs


def build_console(si, ta, concepts, values):
    en_of = dict(concepts)
    lines = ['"""Report text translations (generated — do not hand-edit).',
             '',
             'Source: src/locale_si.inc / src/locale_ta.inc (canonical).',
             'Regenerate with tools/gen_locales.py after translator updates.',
             'Keys are the exact English literals emitted by render.py;',
             'values stay English (data). Table headers, chart titles,',
             'prompts and the provenance line are intentionally',
             'untranslated (technical vocabulary).',
             '"""',
             'STRINGS = {']
    missing = []
    for c, en in ITEMS:
        if c not in si or c not in ta:
            missing.append(c)
            continue
        if en_of.get(c, en) != en:
            raise SystemExit("ITEMS/en drift for %s" % c)
        lines.append("    %r: (%r, %r)," % (en, si[c][0], ta[c][0]))
    lines.append("}")
    lines.append("")
    lines.append("CONCEPTS = {")
    lines.append("    # Full concept table (concept id -> en, si, ta script).")
    lines.append("    # Reference/future use; tr() only consults STRINGS.")
    for c, en in concepts:
        lines.append("    %r: (%r, %r, %r)," % (
            c, en, si.get(c, ("", "", ""))[0], ta.get(c, ("", "", ""))[0]))
    lines.append("}")
    lines.append("")
    lines.append("def tr(text, locale):")
    lines.append('    """Localize a title/key; unknown locales and strings pass through."""')
    lines.append('    if locale in ("si", "ta"):')
    lines.append("        row = STRINGS.get(text)")
    lines.append("        if row:")
    lines.append('            return row[0] if locale == "si" else row[1]')
    lines.append("    return text")
    lines.append("")
    lines.append("def trv(text, locale, table):")
    lines.append('    """Translate a report value via a VALUES table; unknown locales,')
    lines.append('    tables, and keys pass through (English fallback, like the core)."""')
    lines.append('    if locale in ("si", "ta"):')
    lines.append("        row = VALUES.get(table, {}).get(text)")
    lines.append("        if row:")
    lines.append('            return row[1] if locale == "si" else row[2]')
    lines.append("    return text")
    lines.append("")
    lines.append("def tr_tithi(text, locale):")
    lines.append('    """Translate the limb inside a full tithi string, preserving the')
    lines.append('    Pura-/Ava- prefix, spacing, and day number. Unparseable strings')
    lines.append('    (e.g. Amaawaka-15) pass through."""')
    lines.append('    if locale in ("si", "ta"):')
    lines.append('        for limb, row in VALUES.get("limbs", {}).items():')
    lines.append("            if limb and limb in text:")
    lines.append('                return text.replace(limb, row[1] if locale == "si" else row[2], 1)')
    lines.append("    return text")
    lines.append("")
    lines.append("VALUES = {")
    lines.append("    # Report values by class (english -> concept, si, ta).")
    lines.append("    # Reference for trv(); tr() only consults STRINGS.")
    for table in values:
        lines.append("    %r: {" % table)
        for en, (c, s, t) in values[table].items():
            lines.append("        %r: (%r, %r, %r)," % (en, c, s, t))
        lines.append("    },")
    lines.append("}")
    return "\n".join(lines) + "\n", missing


# Value classes for report values (planets, rasis, weekdays, ...).
# Each class lists explicit (concept, english) pairs and/or concept-name
# prefixes resolved against the master concept/en table. English must
# equal the en cell and (for display-mapped values) the modern display
# string. A duplicate english key with DIFFERENT translations exits
# nonzero; identical twins (Batticaloa A/B) share the key.
VALUE_CLASSES = [
    ("planets", {"explicit": [
        ("UiAstroLagna", "Lagna"), ("DasaChandra", "Chandra"),
        ("DasaRavi", "Ravi"), ("DasaBudha", "Budha"),
        ("DasaShukra", "Shukra"), ("DasaKuja", "Kuja"),
        ("DasaGuru", "Guru"), ("DasaShani", "Shani"),
        ("DasaRahu", "Rahu"), ("DasaKetu", "Ketu")]}),
    ("rasis", {"prefixes": ["Rasi"]}),
    ("weekdays", {"prefixes": ["Weekday"]}),
    ("nakshatras", {"prefixes": ["Nak"]}),
    ("yogas", {"prefixes": ["Yoga"]}),
    ("karanas", {"prefixes": ["Kar"]}),
    ("limbs", {"prefixes": ["Limb"]}),
    ("attrs", {"prefixes": ["Gana", "Linga", "Naadi", "Varna", "Ruxha",
                            "Paxhi", "Gothra", "Rajju", "Bhutha", "Yoni"]}),
    ("cities", {"prefixes": ["District"]}),
]


def build_values(concepts, si, ta):
    en_of = dict(concepts)
    tables = {}
    for name, spec in VALUE_CLASSES:
        rows = []
        for c, e in spec.get("explicit", []):
            if en_of.get(c) != e:
                raise SystemExit("VALUES en drift for %s" % c)
            rows.append((c, e))
        for c, e in concepts:
            if any(c.startswith(p) for p in spec.get("prefixes", [])):
                rows.append((c, e))
        table, seen = {}, {}
        for c, e in rows:
            key = e.strip()
            s = si.get(c, ("", "", ""))[0]
            t = ta.get(c, ("", "", ""))[0]
            if key in seen:
                prev = seen[key]
                ps = si.get(prev, ("", "", ""))[0]
                pt = ta.get(prev, ("", "", ""))[0]
                if (s, t) != (ps, pt):
                    raise SystemExit("VALUES dup %r in %s" % (key, name))
                continue
            seen[key] = c
            table[key] = (c, s, t)
        if name == "attrs":
            # Yoni display-truncated aliases (docs carry truncated forms).
            for c, e in rows:
                if c.startswith("Yoni"):
                    trunc = e.strip()[:10]
                    if trunc and trunc not in table:
                        table[trunc] = (
                            c, si.get(c, ("", "", ""))[0],
                            ta.get(c, ("", "", ""))[0])
        tables[name] = table
    return tables


def build_jyotichart(si, ta):
    text = JYOTICHART.read_text(encoding="utf-8")
    changed = False
    stores = {"sinhala": si, "tamil": ta}
    for lang, store in (("sinhala", si), ("tamil", ta)):
        rows = []
        for concept, eng in SIGNS:
            if concept not in store:
                print("missing %s in %s" % (concept, lang))
                return None, None
            rows.append('        %-15s : "%s",' % ('"%s"' % eng, store[concept][0]))
        pat = ("(# BEGIN GENERATED sign-names %s\\n)(.*?)(\\n    # END GENERATED)"
               % lang)
        m = re.search(pat, text, re.S)
        if not m:
            print("markers missing for %s" % lang)
            return None, None
        new = m.group(1) + "\n".join(rows) + m.group(3)
        if new != m.group(0):
            changed = True
            text = text[:m.start()] + new + text[m.end():]
    ui_base = text.index("ui_labels = {")
    for lang, concept in UI_ASC:
        store = stores[lang]
        if concept not in store:
            print("missing %s in %s" % (concept, lang))
            return None, None
        value = store[concept][0]
        start = "BEGIN GENERATED ui-asc %s" % lang
        # Generated single row first; fall back to wrapping the hand row.
        m = re.search(r"(        # %s\n)(        \"asc\"         : \")[^\"]*(\",\n)(        # END GENERATED\n)" % re.escape(start), text[ui_base:])
        if m:
            new = m.group(1) + m.group(2) + value + m.group(3) + m.group(4)
            if new != m.group(0):
                changed = True
                s, e = ui_base + m.start(), ui_base + m.end()
                text = text[:s] + new + text[e:]
            continue
        m = re.search(r'("(%s)": \{\n)(        "asc"         : ")[^"]*(",\n)'
                      % re.escape(lang), text[ui_base:])
        if not m:
            print("asc row missing for %s" % lang)
            return None, None
        new = (m.group(1) + "        # " + start + "\n" + m.group(3) + value
               + m.group(4) + "        # END GENERATED\n")
        changed = True
        s, e = ui_base + m.start(), ui_base + m.end()
        text = text[:s] + new + text[e:]
    return text, changed


def main(argv):
    si = load_inc(SI_INC)
    ta = load_inc(TA_INC)
    concepts = concept_en_table()
    values = build_values(concepts, si, ta)
    console_txt, missing = build_console(si, ta, concepts, values)
    if missing:
        print("missing concepts: %s" % missing)
        return 2
    jyoti_txt, jyoti_changed = build_jyotichart(si, ta)
    if jyoti_txt is None:
        return 2
    check = "--check" in argv
    drift = []
    if CONSOLE_OUT.read_text(encoding="utf-8") != console_txt:
        drift.append(str(CONSOLE_OUT))
    if jyoti_changed:
        drift.append(str(JYOTICHART))
    if check:
        if drift:
            print("drift: run tools/gen_locales.py (%s)" % ", ".join(drift))
        return 1 if drift else 0
    if drift:
        CONSOLE_OUT.write_text(console_txt, encoding="utf-8")
        if jyoti_changed:
            JYOTICHART.write_text(jyoti_txt, encoding="utf-8")
        print("regenerated: %s" % ", ".join(drift))
    else:
        print("in sync")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

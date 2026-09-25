"""Sample-layout HTML report tests: sections, values, assets, l10n."""
import copy

from htmlreport import render_report
from test_render import DOC


def _report(locale="en", **kw):
    doc = copy.deepcopy(DOC)
    doc["locale"] = locale
    return render_report(doc, **kw)


def test_sample_sections_present_and_old_dropped():
    html = _report()
    for section in ["Panchanga", "Hora", "Chakra", "Shadvarga Matrix",
                    "Divisional Charts",
                    "Mahadasa and Antardasa Timeline"]:
        assert section in html, section
    for dropped in ["Selected Options", "Time &amp; Solar Metrics",
                    "Time & Solar Metrics", "Nirayana Table of Houses",
                    "Shadvarga Positions", "Shadvarga Charts",
                    "Birth Profile",
                    "Astronomical &amp; Chart Reference"]:
        assert dropped not in html, dropped
    for tag in ["<table>", "<h1 ", "<article", "<details", "<summary>"]:
        assert tag in html, tag
    assert "<pre>" not in html


def test_hero_values_and_matrix():
    html = _report()
    assert "Test User" in html and "Ratnapura" in html
    assert "2000-08-17" in html and "Thursday" in html
    # matrix: rasi-relative longitude, nakshatra, avastha, sign numbers
    assert "00\u00b000&#x27;00&quot;" in html  # 0:00:00, escaped
    assert "Asvida" in html and "Bhojana" in html
    assert "<sup>1</sup>" in html
    # sample spellings: Ravi stays Ravi, modern Shukra/Rahu/Ketu/Uranus
    for name in ["Ravi", "Shukra", "Rahu", "Ketu", "Uranus"]:
        assert f"<b>{name}</b>" in html, name
    assert "2000-08-17" in html and "Budha" in html


def test_escaping():
    doc = copy.deepcopy(DOC)
    doc["name"] = 'T <Q> & "Z"'
    html = render_report(doc)
    assert "T &lt;Q&gt; &amp; &quot;Z&quot;" in html


def test_fonts_embedded_no_external_links():
    html = _report()
    assert "@font-face" in html and "data:font/ttf;base64," in html
    assert "fonts.googleapis.com" not in html
    assert html.count("data:font/ttf;base64,") == 2  # Regular + Bold


def _spread():
    # spread planets so jyotichart never stacks >8 glyphs in one house
    doc = copy.deepcopy(DOC)
    lon_rasi = {"Ravi": "Simha", "Chandra": "Kumbha", "Kuja": "Kataka",
                "Budha": "Kataka", "Guru": "Vrishabha", "Sikuru": "Simha",
                "Shani": "Vrishabha", "Raahu": "Mithuna", "Kethu": "Dhanu"}
    for p, v in lon_rasi.items():
        doc["shadvarga"][p] = [v] * 6
    doc["lagna"]["seats"] = [8, 12, 5, 4, 7, 2]
    return doc


def test_zodiac_dynamically_inlined():
    html = render_report(_spread())
    # hero Lagna badge + 8 chart SVGs, all inline, no chart titles
    assert html.count("<svg") == 1 + 8
    assert "hero-zodiac" in html
    assert "chart-title" not in html and "chart-icon" not in html
    assert "#d8bfa0" in html  # tan fill of our zodiac assets (not charts)
    assert "<img" not in html and ".svg\"" not in html


def test_default_chart_style_east():
    assert ">East<" in _report()  # masthead Chart Style default


def test_timeline_marks_active_maha():
    html = _report()  # today falls in Shani 2010-06-28 -> 2029-06-28
    assert "maha-block active" in html and " open" in html
    assert ">Shani<" in html and "Passed 2010 Jun" in html
    assert ">Active<" in html
    assert "</sup>Click on each Mahadasa" in html  # no leading space


def test_timeline_future_status():
    doc = copy.deepcopy(DOC)
    doc["dasa"]["mahas"].append(
        {"lord": "Budha", "from": "2029-06-28", "to": "2046-06-28",
         "age": "28y 10m 11d to 45y 10m 11d", "bhuktis": []})
    html = render_report(doc)
    assert "Starts 2029 Jun" in html


def test_legacy_gallery_passthrough():
    html = _report(gallery="<svg></svg>")
    assert "<svg></svg>" in html


def test_charts_autogenerate_eight_cards():
    html = _report()
    assert html.count("chart-card") == 8
    assert "chart-title" not in html  # charts carry no title rows


def test_sinhala_chrome_and_values():
    from i18n import tr, trv
    from report_l10n import EXTRA_AVASTHA, EXTRA_MONTHS, EXTRA_STRINGS

    html = _report(locale="si")
    for en in ["Panchanga", "Hora", "Chakra", "Nakshatra", "Nakshatra Pada",
               "Tithi", "Yoga", "Karana", "Kala", "Panchama", "Sukshama",
               "Sunrise", "Sunset", "Gana", "Yoni", "Linga", "Naadi",
               "Varna", "Ruxha", "Paxhi", "Gothra", "Rajju", "Bhutha",
               "Method", "Julian Date", "Ayanamsa",
               "Mahadasa and Antardasa Timeline"]:
        assert tr(en, "si") != en, en
        assert tr(en, "si") in html, en
    for en in ["Sri Lankan Vedic Astrology Engine", "Shadvarga Matrix",
               "Divisional Charts", "Engine", "Locale", "Chart Style",
               "Schema", "Version", "Universal Time", "Graha", "Rasi",
               "Longitude", "Pada", "Drekkana", "Navamsa", "Dvadasamsa",
               "Trimshamsa", "Avastha", "navamsa", "Passed", "Active"]:
        assert EXTRA_STRINGS[en][0] in html, en
    assert trv("Ratnapura", "si", "cities") in html
    assert trv("Guru", "si", "planets") in html
    assert EXTRA_AVASTHA["Bhojana"][0] in html  # avastha column
    assert EXTRA_MONTHS["June"][0] in html  # timeline month after year
    for en in ["Nirayana", "SI", "East"]:  # masthead values translated
        assert EXTRA_STRINGS[en][0] in html, en
    assert "Nirayana" not in html and ">East<" not in html
    assert ">DOS<" in html  # acronyms stay Latin in every locale
    assert '<p class="hero-eyebrow">Panchanga</p>' not in html
    assert "Shadvarga Matrix" not in html
    assert "<th>Graha</th>" not in html
    assert "Sri Lankan Vedic Astrology Engine" not in html
    assert "Ratnapura" not in html and ">Guru<" not in html
    assert ">Bhojana<" not in html
    assert "Test User" in html  # names stay as-is
    assert "2000-08-17" in html


def test_tamil_chrome_and_values():
    from i18n import tr, trv
    from report_l10n import EXTRA_AVASTHA, EXTRA_MONTHS, EXTRA_STRINGS

    html = _report(locale="ta")
    for en in ["Panchanga", "Hora", "Chakra",
               "Mahadasa and Antardasa Timeline"]:
        assert tr(en, "ta") != en, en
        assert tr(en, "ta") in html, en
    for en in ["Sri Lankan Vedic Astrology Engine", "Shadvarga Matrix",
               "Divisional Charts", "Graha", "Rasi", "Longitude", "Pada",
               "Drekkana", "Navamsa", "Dvadasamsa", "Trimshamsa",
               "Avastha", "Passed", "Active"]:
        assert EXTRA_STRINGS[en][1] in html, en
    assert trv("Mesha", "ta", "rasis") in html
    assert trv("Guru", "ta", "planets") in html
    assert EXTRA_AVASTHA["Bhojana"][1] in html
    assert EXTRA_MONTHS["June"][1] in html
    for en in ["Nirayana", "TA", "East"]:
        assert EXTRA_STRINGS[en][1] in html, en
    assert "Shadvarga Matrix" not in html
    assert "<th>Graha</th>" not in html


def test_tithi_prefix_translated():
    import copy

    from report_l10n import EXTRA_STRINGS

    doc = copy.deepcopy(DOC)
    doc["panchanga"]["tithi"] = "Ava -Thiyawaka  - 3"
    doc["locale"] = "si"
    html = render_report(doc)
    assert EXTRA_STRINGS["Ava"][0] in html
    assert "Ava -" not in html and "Thiyawaka" not in html


def test_normal_weight_only_inside_charts():
    html = _report()
    # report chrome keeps its weights (sample-exact) ...
    for weight in ["font-weight: 700", "font-weight: 600",
                   "font-weight: 500"]:
        assert weight in html, weight
    # ... while every SVG glyph renders normal via one override rule.
    assert ".chart-wrap svg text" in html
    assert ".chart-wrap svg text { fill: var(--text); font-weight: normal; }" \
        in html


def test_east_charts_carry_no_asc_marker():
    html = _report()
    assert 'Asc"' not in html  # fixed house 1 needs no in-house marker
    assert "Mesha" in html  # center still names the rising sign


def test_tithi_uniform_separators():
    import copy

    doc = copy.deepcopy(DOC)
    doc["panchanga"]["tithi"] = "Ava -Thiyawaka  - 3"
    assert "Ava - Thiyawaka - 3" in render_report(doc)
    assert "Ava -Thiyawaka  - 3" not in render_report(doc)
    doc["panchanga"]["tithi"] = "Amaawaka-15"
    assert "Amaawaka - 15" in render_report(doc)


def test_footer_provenance_technical():
    html = _report()
    assert "star-horoscope/2" in html and "Universal Time" in html
    assert "Julian Date" in html and "Ayanamsa" in html

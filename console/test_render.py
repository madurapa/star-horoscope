"""Consumer tests: synthetic schema-v1 docs, no engine needed."""
import io

from rich.console import Console

from render import render_all

DOC = {
    "schema": "star-horoscope/2", "version": "x", "name": "Test User",
    "birth_date": "2000-08-17", "birth_time": "14:05",
    "place": {"city_index": 7, "city": "Ratnapura"},
    "method": "nirayana", "engine": "dos",
    "locale": "en", "julian_date": 2451773.857639, "ayanamsa_deg": 23.83364,
    "longitudes": {p: "0:0:0" for p in
                   ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
                    "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune",
                    "Pluto"]},
    "lagna": {"rasi": "Mesha", "degree": " 0:00:00", "navamsa": "Mesha",
              "seats": [1, 2, 3, 4, 5, 6]},
    "houses": {p: 1 for p in
               ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
                "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune",
                "Pluto"]},
    "details": {p: {"nakshatra": "Asvida", "pada": 1,
                    "rasi_longitude": " 0:00:00"} for p in
                ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
                 "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune",
                 "Pluto"]},
    "avastha": {p: ("Bhojana" if p == "Chandra" else "") for p in
                ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
                 "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune",
                 "Pluto"]},
    "shadvarga": {p: ["Mesha"] * 6 for p in
                  ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
                   "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune",
                   "Pluto"]},
    "panchanga": {"weekday": "Thursday", "nakshatra": "Asvida", "pada": 3,
                  "tithi": "T", "yoga": "Y", "karana": "K"},
    "times": {"birth": "14:05:00", "sinhala": "1", "sunrise": "2",
              "sunset": "3", "ut": "4", "lmst": "5", "lmt": "6", "gmst": "7"},
    "dasa": {"balance_lord": "Guru", "balance": "9y 10m 11d",
             "mahas": [
                 {"lord": "Guru", "from": "2000-08-17", "to": "2010-06-28",
                  "age": "0y 0m 0d to 9y 10m 11d",
                  "bhuktis": [
                      {"lord": "Budha", "from": "2000-08-17",
                       "to": "2001-06-04", "age": "0y 0m 0d to 0y 9m 17d"},
                  ]},
                 {"lord": "Shani", "from": "2010-06-28", "to": "2029-06-28",
                  "age": "9y 10m 11d to 28y 10m 11d",
                  "bhuktis": []},
             ]},
    "hora": {"kala": "Kuja", "panchama": "Kuja", "sukshama": "Kuja"},
    "chakra": {"gana": "Deva", "yoni": "Ashva", "linga": "Purusha",
               "naadi": "Poorva", "varna": "Brahmana", "ruxha": "Godaka",
               "paxhi": "Bheruda", "gothra": "Marivi", "rajju": "Pada",
               "bhutha": "Patavi"},
}


def test_renders_all_planets_at_fixed_width():
    buf = io.StringIO()
    render_all(DOC, Console(file=buf, width=140, color_system=None))
    out = buf.getvalue()
    assert "Horoscope Profile" in out
    assert "Test User" in out
    from render import disp

    for p in DOC["longitudes"]:
        assert disp(p) in out, p
    assert "Ratnapura" in out
    for section in ["Chart Reference", "Time & Solar Metrics", "Panchanga",
                    "Nirayana Table of Houses", "Shadvarga Charts",
                    "Mahadasa and Antardasa Timeline", "South Indian square"]:
        assert section in out, section
    assert "Guru" in out and "2010-06-28" in out
    assert "Thursday" in out and "Asvida" in out
    assert "Bhojana" in out and "Avastha" in out
    assert "Asvida" in out and "Nakshatra" in out
    assert "Hora" in out and "Kuja" in out
    assert "Chakra" in out and "Ashva" in out and "Patavi" in out


def test_cli_mirror_order_and_all_charts():
    import render as R

    buf = io.StringIO()
    R.render_all(DOC, Console(file=buf, width=140, color_system=None))
    out = buf.getvalue()
    seq = ["Horoscope Profile", "Selected Options", "Birth Profile",
           "Astronomical & Chart Reference",
           "Time & Solar Metrics", "Panchanga", "Dasa Information", "Hora",
           "Chakra", "Nirayana Table of Houses", "Shadvarga Charts",
           "Shadvarga Positions", "Lagna Chart",
           "Navamsa Chart", "Hora Chart", "Drekkana Chart", "Dvadasamsa Chart",
           "Trimshamsa Chart", "Ravi Chart", "Chandra Chart", "Mahadasa and Antardasa Timeline"]
    pos = -1
    for s in seq:
        nxt = out.find(s, pos + 1)
        assert nxt > pos, s
        pos = nxt


def test_chart_data_sun_moon_lagna():
    import render as R

    doc = dict(DOC)
    shad = {p: (["Mesha"] * 6) for p in DOC["shadvarga"]}
    shad["Ravi"] = ["Simha"] * 6
    shad["Chandra"] = ["Kumbha"] + ["Mesha"] * 5
    doc["shadvarga"] = shad
    houses, seats, lagna_seat = R.chart_data(doc, 0, "Ravi")
    assert lagna_seat == 5
    assert houses[1] == ["Ravi"]
    houses, seats, lagna_seat = R.chart_data(doc, 0, "Chandra")
    assert lagna_seat == 11
    houses, seats, lagna_seat = R.chart_data(doc, 0, None)
    assert lagna_seat == 1  # DOC lagna.seats[0]


def test_dasa_drilldown():
    import render as R

    def shot(dasa=None):
        buf = io.StringIO()
        kw = {} if dasa is None else {"detail": dasa}
        R.render_dasa(DOC, Console(file=buf, width=140, color_system=None), **kw)
        return buf.getvalue()

    all_rows = shot()
    assert "Budha" in all_rows and "2001-06-04" in all_rows  # default: all Antardasa
    guru = shot("Guru")
    assert "Budha" in guru and "2001-06-04" in guru
    assert "Budha" not in shot("Shani")


def test_helpers():
    from render import ayan_dms, disp_lon

    assert ayan_dms(23.833639) == "23°50'01\""
    assert disp_lon("239:07:08") == "239°07'08\""


def test_trim_html():
    from render import trim_html

    out = trim_html("<pre>\n    abc   \n\t\n\n\n\n<p>x</p>   \n\n\n")
    assert out == "<pre>\n    abc\n\n\n<p>x</p>\n"
    assert trim_html("") == "\n"


def test_missing_planet_raises():
    import copy
    bad = copy.deepcopy(DOC)
    del bad["longitudes"]["Kuja"]
    buf = io.StringIO()
    try:
        render_all(bad, Console(file=buf, width=140, color_system=None))
    except KeyError:
        return
    raise AssertionError("expected KeyError")


def test_export_html_self_contained(tmp_path):
    from rich.console import Console as RC

    from render import render_all as ra

    rec = RC(width=140, record=True)
    ra(DOC, rec)
    html = rec.export_html(inline_styles=True)
    assert "<html" in html and "</html>" in html
    for section in ["Horoscope Profile", "Mahadasa and Antardasa Timeline",
                    "South Indian square", "Shadvarga Charts", "Hora", "Chakra"]:
        assert section in html, section
    p = tmp_path / "report.html"
    p.write_text(html, encoding="utf-8")
    assert p.stat().st_size > 10000


def test_sinhala_report_translated_titles_keys():
    import copy

    from i18n import STRINGS
    from render import render_all as ra

    si = copy.deepcopy(DOC)
    si["locale"] = "si"
    buf = io.StringIO()
    ra(si, Console(file=buf, width=140, color_system=None))
    out = buf.getvalue()
    en_buf = io.StringIO()
    ra(DOC, Console(file=en_buf, width=140, color_system=None))
    en_out = en_buf.getvalue()
    for en, (si_s, ta_s) in STRINGS.items():
        if en in ("Nirayana Longitudes",):
            continue  # technical table title, intentionally untranslated
        if en not in en_out:
            continue  # concept not emitted by this report
        assert si_s in out, en
    # titles fully switch; keys may echo as data headers (technical words)
    for en in ["Horoscope Profile", "Birth Profile", "Time & Solar Metrics",
               "Panchanga", "Dasa Information", "Selected Options",
               "Nirayana Table of Houses", "Shadvarga Charts",
               "Shadvarga Positions", "Mahadasa and Antardasa Timeline"]:
        assert en not in out, en
    # values translate too (names, dates, numbers stay as-is)
    assert "රත්නපුර" in out and "ගුරු" in out and "2000-08-17" in out
    assert "Ratnapura" not in out and "Guru" not in out


def test_disp_lon_clock_form():
    from render import disp_lon

    assert disp_lon("239:07:08") == "239°07'08\""
    assert disp_lon(" 44:29:23") == "44°29'23\""


def test_boost_html_font():
    from render import boost_html

    out = boost_html("<html><head></head><body>x</body></html>")
    assert "<style>body{font-size:15px}</style></head>" in out
    assert boost_html("<html><body>x</body></html>").startswith("<style>")


def test_display_maps_mirror_modern():
    from render import DASA_DISPLAY, KARANA_DISPLAY, YOGA_DISPLAY

    assert YOGA_DISPLAY["Sukarna"] == "Sukarma"
    assert YOGA_DISPLAY["Brahhma"] == "Brahma"
    assert KARANA_DISPLAY["Kinsthugana"] == "Kimstughna"
    assert DASA_DISPLAY["Sikuru"] == "Shukra"
    assert YOGA_DISPLAY.get("Parigha", "Parigha") == "Parigha"


def test_display_single_source():
    import display_names as dn
    import kendra as K
    import render as R

    assert R.DISPLAY is dn.PLANET_DISPLAY
    assert K.DISPLAY is dn.PLANET_DISPLAY
    assert R.DASA_DISPLAY is dn.DASA_DISPLAY
    assert R.YOGA_DISPLAY is dn.YOGA_DISPLAY
    assert R.KARANA_DISPLAY is dn.KARANA_DISPLAY
    assert R.CHART_DEFS is dn.CHART_DEFS
    for p in R.PLANETS:  # every engine key resolves, none raise
        assert isinstance(R.disp(p), str)

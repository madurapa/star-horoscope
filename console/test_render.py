"""Consumer tests: synthetic schema-v1 docs, no engine needed."""
import io

from rich.console import Console

from render import render_all

DOC = {
    "schema": "star-horoscope/1", "version": "x", "name": "Test User",
    "birth_date": "2000-08-17", "birth_time": "14:05",
    "place": {"city_index": 7, "city": "Ratnapura"},
    "method": "nirayana", "engine": "dos", "display": "modern",
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
              "sunset": "3", "ut": "4", "lmst": "5"},
    "dasa": {"balance_lord": "Guru", "balance": "9y 10m 11d",
             "mahas": [
                 {"lord": "Guru", "from": "2000-08-17", "to": "2010-06-28",
                  "bhuktis": [
                      {"lord": "Budha", "from": "2000-08-17",
                       "to": "2001-06-04", "age": "0y 0m 0d to 0y 9m 17d"},
                  ]},
                 {"lord": "Shani", "from": "2010-06-28", "to": "2029-06-28",
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
    for p in DOC["longitudes"]:
        assert p in out, p
    assert "Ratnapura" in out
    for section in ["Chart Reference", "Time & Solar Metrics", "Panchanga",
                    "Nirayana Table of Houses", "Shadvarga Seats",
                    "Mahadasa Timeline", "Sri Lankan diamond"]:
        assert section in out, section
    assert "Guru" in out and "2010-06-28" in out
    assert "Thursday" in out and "Asvida" in out
    assert "Bhojana" in out and "Avastha" in out
    assert "Hora" in out and "Kuja" in out
    assert "Chakra" in out and "Ashva" in out and "Patavi" in out


def test_cli_mirror_order_and_all_charts():
    import render as R

    buf = io.StringIO()
    R.render_all(DOC, Console(file=buf, width=140, color_system=None))
    out = buf.getvalue()
    seq = ["Horoscope Profile", "Birth Profile", "Astronomical & Chart Reference",
           "Time & Solar Metrics", "Panchanga", "Dasa Information", "Hora",
           "Chakra", "Selected Options", "Nirayana Table of Houses",
           "Shadvarga Seats", "Shadvarga Positions", "Lagna Chart",
           "Navamsa Chart", "Hora Chart", "Drekkana Chart", "Dvadasamsa Chart",
           "Trimshamsa Chart", "Sun Chart", "Moon Chart", "Mahadasa Timeline"]
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


def test_svg_charts():
    from svgchart import svg_diamond, svg_square

    d = svg_diamond({1: ["Guru"], 4: ["Chandra"]}, 8, "Lagna Chart")
    assert d.startswith("<svg") and "Guru" in d and "Vrishchika" in d
    assert d.count("<rect") == 12
    s = svg_square({"Chandra": 11, "Ravi": 5}, 8, "Lagna Chart")
    assert s.startswith("<svg") and "Chandra" in s and "Kumbha" in s
    assert "Lagna" in s


def test_dasa_drilldown():
    import render as R

    def shot(dasa=None):
        buf = io.StringIO()
        R.render_dasa(DOC, Console(file=buf, width=140, color_system=None),
                      detail=dasa)
        return buf.getvalue()

    plain = shot()
    assert "Budha" not in plain and "2001-06-04" not in plain
    guru = shot("Guru")
    assert "Budha" in guru and "2001-06-04" in guru
    assert "Budha" not in shot("Shani")
    assert "Budha" in shot("all")


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
    for section in ["Horoscope Profile", "Mahadasa Timeline", "Sri Lankan diamond",
                    "Shadvarga Seats", "Hora", "Chakra"]:
        assert section in html, section
    p = tmp_path / "report.html"
    p.write_text(html, encoding="utf-8")
    assert p.stat().st_size > 10000

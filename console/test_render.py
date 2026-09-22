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
    "lagna": {"rasi": "Mesha", "degree": " 0:00:00", "navamsa": "Mesha"},
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
                 {"lord": "Guru", "from": "2000-08-17", "to": "2010-06-28"},
                 {"lord": "Shani", "from": "2010-06-28", "to": "2029-06-28"},
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

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
}


def test_renders_all_planets_at_fixed_width():
    buf = io.StringIO()
    render_all(DOC, Console(file=buf, width=100, color_system=None))
    out = buf.getvalue()
    assert "Horoscope Profile" in out
    assert "Test User" in out
    for p in DOC["longitudes"]:
        assert p in out, p
    assert "Ratnapura" in out


def test_missing_planet_raises():
    import copy
    bad = copy.deepcopy(DOC)
    del bad["longitudes"]["Kuja"]
    buf = io.StringIO()
    try:
        render_all(bad, Console(file=buf, width=100, color_system=None))
    except KeyError:
        return
    raise AssertionError("expected KeyError")

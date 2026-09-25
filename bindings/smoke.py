"""Smoke consumer: the frozen JSON schema parsed with stdlib json only."""
import json
import sys

import pystar

doc = json.loads(
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 7, engine="dos")
)
assert doc["schema"] == "star-horoscope/2", doc.get("schema")
assert doc["engine"] == "dos", doc.get("engine")
assert doc["method"] == "nirayana", doc.get("method")
assert doc["locale"] == "en", doc.get("locale")
assert doc["place"] == {"city_index": 7, "city": "Ratnapura"}, doc.get("place")
assert len(doc["longitudes"]) == 13, len(doc["longitudes"])
assert doc["longitudes"]["Lagna"].startswith("239:"), doc["longitudes"]["Lagna"]
assert pystar.schema() == "star-horoscope/2"
assert pystar.version() == doc["version"]
try:
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 99)
    sys.exit("city 99 should have failed")
except ValueError:
    pass
# Manual geo (city > 26 + all four fields) mirrors the CLI batch path.
# Ratnapura's own coords: numbers must equal the city-7 document above.
manual = json.loads(
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 27,
                     lat_deg=6, lat_min=37, lon_deg=80, lon_min=24,
                     engine="dos")
)
assert manual["place"] == {"city_index": 27, "city": "Manual entry"}, manual.get("place")
assert manual["longitudes"] == doc["longitudes"], "manual geo parity"
try:
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 27, lat_deg=6)
    sys.exit("partial manual geo should have failed")
except ValueError:
    pass
try:
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 7, lat_deg=6,
                     lat_min=37, lon_deg=80, lon_min=24)
    sys.exit("manual geo with city <= 26 should have failed")
except ValueError:
    pass
# Thathkala: birth/city unused, Colombo fallback, literal owner name.
thath = json.loads(pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 7,
                                    thathkala=True))
assert thath["name"] == '"Thatkala Kendra"', thath.get("name")
assert thath["place"] == {"city_index": 1, "city": "Colombo (Thathkala default)"}, \
    thath.get("place")
print("PYSTAR_SMOKE_GREEN", pystar.version())

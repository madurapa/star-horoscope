"""Smoke consumer: the frozen JSON schema parsed with stdlib json only."""
import json
import sys

import pystar

doc = json.loads(
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 7, engine="dos")
)
assert doc["schema"] == "star-horoscope/1", doc.get("schema")
assert doc["engine"] == "dos", doc.get("engine")
assert doc["method"] == "nirayana", doc.get("method")
assert doc["locale"] == "en", doc.get("locale")
assert doc["place"] == {"city_index": 7, "city": "Ratnapura"}, doc.get("place")
assert len(doc["longitudes"]) == 13, len(doc["longitudes"])
assert doc["longitudes"]["Lagna"].startswith("239:"), doc["longitudes"]["Lagna"]
assert pystar.schema() == "star-horoscope/1"
assert pystar.version() == doc["version"]
try:
    pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 99)
    sys.exit("city 99 should have failed")
except ValueError:
    pass
print("PYSTAR_SMOKE_GREEN", pystar.version())

"""Application services (WS-B): validation + compute + view data.

Pure consumer layer over pystar and the doc dict, shared by
console/app.py, the future Qt GUI, and tests. Validation mirrors
src/CLI.cpp rule-for-rule (C++ stays authoritative; messages match
its English wording). View-row builders feed both htmlreport.py and
Qt models from one computation.
"""
import calendar
import json
from datetime import date

from display_names import DASA_DISPLAY, MATRIX_ORDER, PLANET_DISPLAY
from i18n import trv
from kendra import RASIS
from render import KARANA_DISPLAY, YOGA_DISPLAY
from report_l10n import tr_avastha, tr_month, tr_tithi_full, trvx, trx

CITY_COUNT = 26  # mirror kCityCount (src/AstroStructures.hpp)


class ServiceError(Exception):
    """Validation/compute failure carrying field -> message."""

    def __init__(self, errors: dict):
        super().__init__("; ".join(f"{k}: {v}" for k, v in errors.items()))
        self.errors = errors


def _dim(year, month) -> int:
    return calendar.monthrange(year, month)[1]


def validate_birth(name, year, month, day, hour, minute, city,
                   lat_deg=None, lat_min=None, lon_deg=None, lon_min=None,
                   thathkala=False) -> dict:
    """Mirror CLI::validate* (field -> message, {} when clean)."""
    if thathkala:
        return {}  # birth/city prompts never run; engine validated below
    errors = {}
    if not str(name).strip():
        errors["name"] = "Name must not be empty."
    elif len(str(name).strip()) > 60:
        errors["name"] = "Name must be at most 60 characters."
    if not 1000 <= year <= 9999:
        errors["year"] = "Year must be 1000-9999."
    elif not 1 <= month <= 12:
        errors["month"] = "Month must be 1-12."
    elif not 1 <= day <= _dim(year, month):
        dim = _dim(year, month)
        msg = f"Day must be 1-{dim} for month {month}"
        if month == 2:
            msg += " (leap year)." if calendar.isleap(year) else " (non-leap year)."
        else:
            msg += "."
        errors["day"] = msg
    if not 0 <= hour <= 23:
        errors["hour"] = "Hour must be 0-23."
    if not 0 <= minute <= 59:
        errors["minute"] = "Minute must be 0-59."
    if city < 1:
        errors["city"] = (
            f"District must be 1 or greater (1-{CITY_COUNT} list, "
            f">{CITY_COUNT} manual entry).")
    elif city > CITY_COUNT:
        geo = {"lat_deg": lat_deg, "lat_min": lat_min,
               "lon_deg": lon_deg, "lon_min": lon_min}
        if not all(v is not None for v in geo.values()):
            errors["geo"] = ("city > 26 needs lat_deg/lat_min/"
                             "lon_deg/lon_min")
        else:
            if not 0 <= lat_deg <= 90:
                errors["lat_deg"] = "Latitude degrees must be 0-90."
            if not 0 <= lat_min <= 59:
                errors["lat_min"] = "Latitude minutes must be 0-59."
            if lat_deg == 90 and lat_min != 0:
                errors["lat_min"] = "Latitude 90 must have 0 minutes."
            if not 0 <= lon_deg <= 180:
                errors["lon_deg"] = "Longitude degrees must be 0-180."
            if not 0 <= lon_min <= 59:
                errors["lon_min"] = "Longitude minutes must be 0-59."
            if lon_deg == 180 and lon_min != 0:
                errors["lon_min"] = "Longitude 180 must have 0 minutes."
    elif any(v is not None for v in
             (lat_deg, lat_min, lon_deg, lon_min)):
        errors["geo"] = "manual geo needs city > 26 (else it would be ignored)"
    return errors


def compute(name, year, month, day, hour, minute, city,
            nirayana=True, engine="swisseph", locale="en",
            lat_deg=None, lat_min=None, lon_deg=None, lon_min=None,
            thathkala=False) -> dict:
    """Validate, then compute the star-horoscope/2 doc via pystar."""
    errors = validate_birth(name, year, month, day, hour, minute, city,
                            lat_deg, lat_min, lon_deg, lon_min, thathkala)
    if errors:
        raise ServiceError(errors)
    import pystar

    try:
        return json.loads(pystar.horoscope(
            name, year, month, day, hour, minute, city,
            nirayana=nirayana, engine=engine, locale=locale,
            lat_deg=lat_deg, lat_min=lat_min, lon_deg=lon_deg,
            lon_min=lon_min, thathkala=thathkala))
    except ValueError as e:
        raise ServiceError({"options": str(e)})


def span_status(frm, to, locale, today=None) -> str:
    """Passed/Starts + year + localized short month; Active if running."""
    today = today or date.today().isoformat()
    if to < today:
        return f"{trx('Passed', locale)} {to[:4]} {tr_month(to, locale, short=True)}"
    if frm > today:
        return (f"{trx('Starts', locale)} {frm[:4]} "
                f"{tr_month(frm, locale, short=True)}")
    return trx("Active", locale)


def _force_open(detail, lord, disp_lord) -> bool:
    return bool(detail and detail.lower() != "all" and
                detail.lower() in (lord.lower(), disp_lord.lower()))


def timeline_rows(doc, detail=None, locale="en", today=None) -> list:
    """Dasa data for Qt models and the HTML timeline (same objects)."""
    rows = []
    for s in doc["dasa"]["mahas"]:
        lord = DASA_DISPLAY.get(s["lord"], s["lord"])
        now = today or date.today().isoformat()
        is_active = s["from"] <= now <= s["to"]
        bhuktis = []
        for b in s.get("bhuktis", []):
            lord_b = DASA_DISPLAY.get(b["lord"], b["lord"])
            b_active = b["from"] <= now <= b["to"]
            bhuktis.append({
                "lord": trvx(lord_b, locale),
                "from": b["from"], "to": b["to"],
                "status": span_status(b["from"], b["to"], locale, today),
                "active": b_active,
            })
        rows.append({
            "lord": trvx(lord, locale),
            "from": s["from"], "to": s["to"],
            "status": span_status(s["from"], s["to"], locale, today),
            "active": is_active,
            "open": is_active or _force_open(detail, s["lord"], lord),
            "bhuktis": bhuktis,
        })
    return rows


def matrix_rows(doc, locale="en") -> list:
    """Shadvarga Matrix data for Qt models and the HTML table."""
    from i18n import tr

    det = doc.get("details", {})
    rows = []
    for p in MATRIX_ORDER:
        d = det.get(p, {})
        vargas = []
        for v in (2, 3, 1, 4, 5):
            seat = doc["shadvarga"][p][v]
            vargas.append({"rasi": trv(seat, locale, "rasis"),
                           "num": RASIS.index(seat) + 1})
        rasi0 = doc["shadvarga"][p][0]
        rows.append({
            "planet": trvx(PLANET_DISPLAY.get(p, p), locale),
            "rasi": trv(rasi0, locale, "rasis"),
            "rasi_num": RASIS.index(rasi0) + 1,
            "lon": _rasi_lon(d.get("rasi_longitude", "")),
            "nakshatra": trv(d.get("nakshatra", "-"), locale, "nakshatras"),
            "pada": d.get("pada", "-"),
            "vargas": vargas,
            "avastha": tr_avastha(doc["avastha"][p], locale) or "-",
        })
    return rows


def _rasi_lon(raw: str) -> str:
    """Rasi-relative longitude in clock form, sample-padded (00°55'01")."""
    import re

    s = (raw or "").strip()
    m = re.match(r"^([0-9]+)[:\u00b0]([0-9]+)[:']([0-9]+)\"?$", s)
    if not m:
        return s or "-"
    deg, minute, sec = (int(m.group(1)) % 30, m.group(2), m.group(3))
    return f"{deg:02d}\u00b0{minute}'{sec}\""


def hero_groups(doc, locale="en") -> dict:
    """Panchanga/Hora/Chakra fact groups (shared hero data)."""
    pg = doc["panchanga"]
    tm = doc["times"]
    cc = doc["chakra"]
    hh = doc["hora"]
    return {
        "panchanga": [
            ("Nakshatra", trv(pg["nakshatra"], locale, "nakshatras")),
            ("Nakshatra Pada", pg["pada"]),
            ("Tithi", tr_tithi_full(pg["tithi"], locale)),
            ("Yoga", trv(YOGA_DISPLAY.get(pg["yoga"], pg["yoga"]),
                         locale, "yogas")),
            ("Karana", trv(KARANA_DISPLAY.get(pg["karana"], pg["karana"]),
                           locale, "karanas")),
        ],
        "hora": [
            ("Kala", trvx(DASA_DISPLAY.get(hh["kala"], hh["kala"]), locale)),
            ("Panchama", trvx(DASA_DISPLAY.get(hh["panchama"], hh["panchama"]),
                              locale)),
            ("Sukshama", trvx(DASA_DISPLAY.get(hh["sukshama"], hh["sukshama"]),
                              locale)),
            ("Sunrise", tm["sunrise"]),
            ("Sunset", tm["sunset"]),
        ],
        "chakra": [
            ("Gana", trv(cc["gana"], locale, "attrs")),
            ("Yoni", trv(cc["yoni"].strip(), locale, "attrs")),
            ("Linga", trv(cc["linga"], locale, "attrs")),
            ("Naadi", trv(cc["naadi"], locale, "attrs")),
            ("Varna", trv(cc["varna"], locale, "attrs")),
            ("Ruxha", trv(cc["ruxha"], locale, "attrs")),
            ("Paxhi", trv(cc["paxhi"], locale, "attrs")),
            ("Gothra", trv(cc["gothra"], locale, "attrs")),
            ("Rajju", trv(cc["rajju"], locale, "attrs")),
            ("Bhutha", trv(cc["bhutha"], locale, "attrs")),
        ],
    }

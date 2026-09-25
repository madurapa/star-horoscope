"""Service-layer tests: validation mirror, compute wiring, row builders."""
import copy
import json
import sys

from services import (ServiceError, compute, hero_groups, matrix_rows,
                      span_status, timeline_rows, validate_birth)
from test_render import DOC

GOOD = dict(name="Test User", year=2000, month=8, day=17, hour=14,
            minute=5, city=7)


def test_validate_clean_and_thathkala_bypass():
    assert validate_birth(**GOOD) == {}
    bad = dict(GOOD, name="", year=1, month=99, city=0)
    assert validate_birth(**bad, thathkala=True) == {}


def test_validate_fields_mirror_cli_messages():
    assert validate_birth(**dict(GOOD, name="   "))["name"] == \
        "Name must not be empty."
    assert validate_birth(**dict(GOOD, name="x" * 61))["name"] == \
        "Name must be at most 60 characters."
    assert validate_birth(**dict(GOOD, year=999))["year"] == \
        "Year must be 1000-9999."
    assert validate_birth(**dict(GOOD, month=13))["month"] == \
        "Month must be 1-12."
    assert validate_birth(**dict(GOOD, day=30, month=2, year=2001))["day"] == \
        "Day must be 1-28 for month 2 (non-leap year)."
    assert validate_birth(**dict(GOOD, day=29, month=2, year=2000)) == {}
    assert validate_birth(**dict(GOOD, hour=24))["hour"] == "Hour must be 0-23."
    assert validate_birth(**dict(GOOD, minute=60))["minute"] == \
        "Minute must be 0-59."
    assert "1-26" in validate_birth(**dict(GOOD, city=0))["city"]
    assert validate_birth(**dict(GOOD, city=27))["geo"] == \
        "city > 26 needs lat_deg/lat_min/lon_deg/lon_min"
    assert validate_birth(**dict(GOOD, city=27, lat_deg=6))["geo"] == \
        "city > 26 needs lat_deg/lat_min/lon_deg/lon_min"
    full = dict(GOOD, city=27, lat_deg=6, lat_min=37, lon_deg=80, lon_min=24)
    assert validate_birth(**full) == {}
    assert validate_birth(**dict(full, lat_deg=91))["lat_deg"] == \
        "Latitude degrees must be 0-90."
    assert validate_birth(**dict(full, lat_deg=90, lat_min=1))["lat_min"] == \
        "Latitude 90 must have 0 minutes."
    assert validate_birth(**dict(full, lon_deg=180, lon_min=1))["lon_min"] == \
        "Longitude 180 must have 0 minutes."
    assert validate_birth(**dict(GOOD, lat_deg=6))["geo"] == \
        "manual geo needs city > 26 (else it would be ignored)"


def test_compute_rejects_without_engine():
    try:
        compute(**dict(GOOD, month=13))
        raise AssertionError("expected ServiceError")
    except ServiceError as e:
        assert e.errors == {"month": "Month must be 1-12."}


def test_compute_wiring_with_stubbed_engine(monkeypatch):
    doc = copy.deepcopy(DOC)

    class Stub:
        @staticmethod
        def horoscope(*a, **k):
            assert k.get("thathkala") is False
            return json.dumps(doc)

    monkeypatch.setitem(sys.modules, "pystar", Stub)
    assert compute(**GOOD)["name"] == "Test User"

    class BadEngine:
        @staticmethod
        def horoscope(*a, **k):
            raise ValueError("engine wants dos|swisseph")

    monkeypatch.setitem(sys.modules, "pystar", BadEngine)
    try:
        compute(**GOOD)
        raise AssertionError("expected ServiceError")
    except ServiceError as e:
        assert e.errors == {"options": "engine wants dos|swisseph"}


def test_span_status_and_timeline_rows():
    assert span_status("2000-01-01", "2001-01-01", "en",
                       today="2026-01-01") == "Passed 2001 Jan"
    assert span_status("2029-01-01", "2030-01-01", "en",
                       today="2026-01-01") == "Starts 2029 Jan"
    assert span_status("2000-01-01", "2030-01-01", "en",
                       today="2026-01-01") == "Active"
    rows = timeline_rows(copy.deepcopy(DOC), locale="en", today="2026-01-01")
    assert [r["lord"] for r in rows] == ["Guru", "Shani"]
    assert rows[0]["status"] == "Passed 2010 Jun"
    assert rows[0]["open"] is False and rows[1]["open"] is True
    assert rows[1]["active"] is True
    assert rows[0]["bhuktis"][0]["lord"] == "Budha"
    forced = timeline_rows(copy.deepcopy(DOC), detail="Guru", locale="en",
                           today="2026-01-01")
    assert forced[0]["open"] is True


def test_matrix_and_hero_rows():
    doc = copy.deepcopy(DOC)
    rows = matrix_rows(doc, locale="en")
    assert len(rows) == 13 and rows[0]["planet"] == "Lagna"
    assert rows[0]["lon"] == "00°00'00\"" and rows[0]["rasi_num"] == 1
    assert len(rows[0]["vargas"]) == 5
    assert rows[1]["planet"] == "Ravi"  # sample spelling, not Surya
    groups = hero_groups(doc, locale="en")
    assert [k for k, _v in groups["panchanga"]] == \
        ["Nakshatra", "Nakshatra Pada", "Tithi", "Yoga", "Karana"]
    assert len(groups["hora"]) == 5 and len(groups["chakra"]) == 10


def test_hero_header():
    from services import hero_header

    doc = copy.deepcopy(DOC)
    name, sub = hero_header(doc, locale="en")
    assert name == "Test User"
    assert sub == "2000-08-17 \u00b7 14:05 \u00b7 Thursday \u00b7 Ratnapura"
    from i18n import trv

    _n, si_sub = hero_header(doc, locale="si")
    assert trv("Thursday", "si", "weekdays") in si_sub

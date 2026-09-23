"""Kendra chart tests: synthetic placements, fixed widths."""
import io

from rich.console import Console

from kendra import (houses_from_longitudes, parse_dms, planet_style,
                    render_diamond)

HOUSES = {1: ["Guru"], 2: [], 3: [], 4: ["Chandra"], 5: [],
          6: [], 7: [], 8: [], 9: ["Budha"], 10: ["Ravi", "Sikuru"],
          11: [], 12: []}


def shot(width=140, houses=None, lagna_rasi=8, box_w=17):
    buf = io.StringIO()
    render_diamond(houses if houses is not None else HOUSES, lagna_rasi,
                   Console(file=buf, width=width, color_system=None),
                   box_w=box_w)
    return buf.getvalue()


def test_diamond_places_glyphs_numbers_rasis():
    out = shot()
    assert "Sri Lankan diamond" in out
    assert "1 · Vrishchika" in out  # house 1 carries the Lagna rasi
    assert "4 · Kumbha" in out
    for name in ["Guru", "Chandra", "Budha", "Ravi", "Shukra"]:
        assert name in out, name
    assert "✦ Vrishchika Lagna ✦" in out


def test_diamond_scales_with_box_width():
    narrow = shot(box_w=11)
    wide = shot(box_w=21)
    assert len(wide.split("\n")[1]) > len(narrow.split("\n")[1])
    assert "Guru" in narrow and "Guru" in wide


def test_houses_from_longitudes():
    lon = {"Lagna": "239:05:18", "Chandra": "325:04:41",
           "Ravi": "120:52:33", "Budha": "115:56:20"}
    houses, lagna_rasi = houses_from_longitudes(lon)
    assert lagna_rasi == 8
    assert houses[4] == ["Chandra"]  # Kumba(11) from Wrschika(8) = house 4
    assert houses[10] == ["Ravi"]  # Sinha(5) from Wrschika(8) = house 10
    assert houses[9] == ["Budha"]  # Kataka(4) -> house 9


def test_parse_dms_leading_space():
    assert abs(parse_dms(" 44:27:36") - (44 + 27 / 60 + 36 / 3600)) < 1e-9


def test_planet_colors():
    assert planet_style("Guru") == "green"
    assert planet_style("Shani") == "red"
    assert planet_style("Lagna") == "yellow"

"""Fixed-house diamond tests: slots pinned, signs rotate with Lagna."""
import io

from rich.console import Console

from kendra import (houses_from_longitudes, parse_dms, planet_style,
                    render_diamond)

# house -> planets for Lagna Wrschika(8): H2 Ke, H4 Ch, H9 Bu/Ku, H10 Rv/Si
HOUSES = {1: [], 2: ["Kethu"], 3: [], 4: ["Chandra"], 5: [],
          6: [], 7: [], 8: [], 9: ["Budha", "Kuja"], 10: ["Ravi", "Sikuru"],
          11: [], 12: []}


def shot(width=140, houses=None, lagna_rasi=8, box_w=17):
    buf = io.StringIO()
    render_diamond(houses if houses is not None else HOUSES, lagna_rasi,
                   Console(file=buf, width=width, color_system=None),
                   box_w=box_w)
    return buf.getvalue()


def test_fixed_houses_signs_rotate():
    out = shot()
    assert "diamond" in out
    # house 1 top-center carries the Lagna rasi
    assert "1 · Vrishchika" in out
    # house 2 top-left holds Kethu (Dhanu from Wrschika)
    assert "2 · Dhanu" in out and "Ketu" in out
    # house 10 holds Ravi (display Shukra for Sikuru)
    assert "10 · Simha" in out and "Surya" in out and "Shukra" in out


def test_signs_move_with_lagna():
    out = shot(lagna_rasi=1)
    # same houses, signs rotated: house 1 now Mesha
    assert "1 · Mesha" in out
    assert "2 · Vrishabha" in out


def test_diamond_scales_with_box_width():
    narrow = shot(box_w=13)
    wide = shot(box_w=21)
    assert len(wide.split("\n")[1]) > len(narrow.split("\n")[1])


def test_houses_from_longitudes():
    lon = {"Lagna": "239:05:18", "Chandra": "325:04:41",
           "Ravi": "120:52:33", "Budha": "115:59:17"}
    houses, lagna_rasi = houses_from_longitudes(lon)
    assert lagna_rasi == 8
    assert houses[4] == ["Chandra"]
    assert houses[10] == ["Ravi"]
    assert houses[9] == ["Budha"]


def test_parse_dms_leading_space():
    assert abs(parse_dms(" 44:27:36") - (44 + 27 / 60 + 36 / 3600)) < 1e-9


def test_planet_colors():
    assert planet_style("Guru") == "green"
    assert planet_style("Shani") == "red"
    assert planet_style("Lagna") == "yellow"

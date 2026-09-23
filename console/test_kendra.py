"""East fixed-sign diamond tests: signs pinned, houses from Lagna."""
import io

from rich.console import Console

from kendra import (houses_from_longitudes, parse_dms, planet_style,
                    render_diamond)

# planet -> rasi index (Lagna Wrschika=8: Chandra Kumbha, Ravi Simha, ...)
SEATS = {"Chandra": 11, "Ravi": 5, "Budha": 4, "Sikuru": 5, "Kuja": 4,
         "Guru": 2, "Shani": 2, "Raahu": 3, "Kethu": 9}


def shot(width=140, seats=None, lagna_rasi=8, box_w=17):
    buf = io.StringIO()
    render_diamond(seats if seats is not None else SEATS, lagna_rasi,
                   Console(file=buf, width=width, color_system=None),
                   box_w=box_w)
    return buf.getvalue()


def test_fixed_signs_and_houses():
    out = shot()
    assert "East Indian diamond" in out
    # fixed signs present regardless of Lagna
    for sign in ["Mesha", "Vrishabha", "Mithuna", "Kataka", "Simha",
                 "Tula", "Makara", "Kumbha", "Meena"]:
        assert sign in out, sign
    # houses counted anti-clockwise from Lagna 8: Mesha -> house 6
    assert "6 · Mesha" in out
    # Chandra in Kumbha(11) -> house 4
    assert "4 · Kumbha" in out and "Chandra" in out
    # Lagna marked
    assert "◆" in out


def test_signs_pinned_across_lagnas():
    a = shot(lagna_rasi=8)
    b = shot(lagna_rasi=1)
    # same signs, different house numbers + different mark
    assert "6 · Mesha" in a and "1 · Mesha" in b
    assert a.count("Chandra") == b.count("Chandra")


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

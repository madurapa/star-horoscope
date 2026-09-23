"""jyotichart bridge tests: synthetic docs, no engine needed."""
import io

from jychart import east_svg, gallery, south_svg
from test_render import DOC


def test_east_english():
    svg = east_svg(DOC, 0, None, "en", "Lagna Chart")
    assert svg.startswith("<svg") and "Su" in svg and "Mo" in svg
    assert "Asc" in svg


def test_east_sinhala_tamil():
    si = east_svg(DOC, 0, None, "si", "Lagna Chart")
    assert "ලග්න" in si and "සූ" in si
    ta = east_svg(DOC, 0, None, "ta", "Lagna Chart")
    assert "லக்னம்" in ta and "சூ" in ta


def test_east_navamsa_lagna():
    svg = east_svg(DOC, 1, None, "en", "Navamsa Chart")
    assert svg.startswith("<svg")


def test_south_english():
    svg = south_svg(DOC, 0, None, "en", "Lagna Chart")
    assert svg.startswith("<svg") and "Su" in svg


def test_gallery_all_eight():
    g = gallery(DOC, "diamond", "en")
    assert g.count("<svg") == 8
    g2 = gallery(DOC, "south", "ta")
    assert g2.count("<svg") == 8 and "லக்னம்" in g2


def test_outers_skipped():
    svg = east_svg(DOC, 0, None, "en", "Lagna Chart")
    assert "Urenus" not in svg and "Neptune" not in svg and "Pluto" not in svg

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
    assert "Navamsa" in svg  # center division label
    assert 'fill="white"' in svg or "white" in svg  # light theme
    assert "Georgia" not in svg  # default fonts only


def test_center_no_name_or_chart_title():
    svg = east_svg(DOC, 0, None, "en", "Lagna Chart")
    assert "Test User" not in svg and "Chart :" not in svg
    assert "Asc" in svg  # rising sign + Lagna marker


def test_south_english():
    svg = south_svg(DOC, 0, None, "en", "Lagna Chart")
    assert svg.startswith("<svg") and "Su" in svg


def test_gallery_all_eight():
    import copy

    spread = copy.deepcopy(DOC)
    # spread planets (9 in one house exceeds North slots; nodes oppose IRL)
    lon_rasi = {"Ravi": "Simha", "Chandra": "Kumbha", "Kuja": "Kataka",
                "Budha": "Kataka", "Guru": "Vrishabha", "Sikuru": "Simha",
                "Shani": "Vrishabha", "Raahu": "Mithuna", "Kethu": "Dhanu"}
    for p, v in lon_rasi.items():
        spread["longitudes"][p] = "0:00:00"  # unused by chart_data
        spread["shadvarga"][p] = [v] * 6
    spread["lagna"]["seats"] = [1, 12, 5, 4, 7, 2]
    g = gallery(spread, "diamond", "en")
    assert g.count("<svg") == 8
    for title in ["Lagna Chart", "Navamsa Chart", "Sun Chart", "Moon Chart"]:
        assert f"<h3>{title}</h3>" in g
    g2 = gallery(spread, "south", "ta")
    assert g2.count("<svg") == 8 and "லக்னம்" in g2


def test_outers_skipped():
    svg = east_svg(DOC, 0, None, "en", "Lagna Chart")
    assert "Urenus" not in svg and "Neptune" not in svg and "Pluto" not in svg


def _spread_doc():
    import copy

    spread = copy.deepcopy(DOC)
    lon_rasi = {"Ravi": "Simha", "Chandra": "Kumbha", "Kuja": "Kataka",
                "Budha": "Kataka", "Guru": "Vrishabha", "Sikuru": "Simha",
                "Shani": "Vrishabha", "Raahu": "Mithuna", "Kethu": "Dhanu"}
    for p, v in lon_rasi.items():
        spread["shadvarga"][p] = [v] * 6
    spread["lagna"]["seats"] = [8, 12, 5, 4, 7, 2]
    return spread


def _compartment(x, y):
    C1, C2 = 141.67, 278.33
    if C1 <= x <= C2 and 5 <= y <= C1:
        return 1
    if 5 <= x <= C1 and 5 <= y <= C1:
        return 2 if y < x else 3
    if C2 <= x <= 415 and 5 <= y <= C1:
        return 12 if y < 420 - x else 11
    if 5 <= x <= C1 and C1 <= y <= C2:
        return 4
    if 5 <= x <= C1 and C2 <= y <= 415:
        return 5 if y < 420 - x else 6
    if C1 <= x <= C2 and C2 <= y <= 415:
        return 7
    if C2 <= x <= 415 and C2 <= y <= 415:
        return 9 if y < x else 8
    if C2 <= x <= 415 and C1 <= y <= C2:
        return 10
    return 0


def _compartment(x, y):
    C1, C2 = 141.67, 278.33
    if C1 <= x <= C2 and 5 <= y <= C1:
        return 1
    if 5 <= x <= C1 and 5 <= y <= C1:
        return 2 if y < x else 3
    if C2 <= x <= 415 and 5 <= y <= C1:
        return 12 if y < 420 - x else 11
    if 5 <= x <= C1 and C1 <= y <= C2:
        return 4
    if 5 <= x <= C1 and C2 <= y <= 415:
        return 5 if y < 420 - x else 6
    if C1 <= x <= C2 and C2 <= y <= 415:
        return 7
    if C2 <= x <= 415 and C2 <= y <= 415:
        return 9 if y < x else 8
    if C2 <= x <= 415 and C1 <= y <= C2:
        return 10
    return 0


def _compartment(x, y):
    C1, C2 = 141.67, 278.33
    if C1 <= x <= C2 and 5 <= y <= C1:
        return 1
    if 5 <= x <= C1 and 5 <= y <= C1:
        return 2 if y < x else 3
    if C2 <= x <= 415 and 5 <= y <= C1:
        return 12 if y < 420 - x else 11
    if 5 <= x <= C1 and C1 <= y <= C2:
        return 4
    if 5 <= x <= C1 and C2 <= y <= 415:
        return 5 if y < 420 - x else 6
    if C1 <= x <= C2 and C2 <= y <= 415:
        return 7
    if C2 <= x <= 415 and C2 <= y <= 415:
        return 9 if y < x else 8
    if C2 <= x <= 415 and C1 <= y <= C2:
        return 10
    return 0


def test_all_charts_placements_geometric():
    import re

    from render import CHART_DEFS, chart_data

    doc = _spread_doc()
    sym2p = {"Su": "Ravi", "Mo": "Chandra", "Ma": "Kuja", "Me": "Budha",
             "Ju": "Guru", "Ve": "Sikuru", "Sa": "Shani", "Ra": "Raahu",
             "Ke": "Kethu"}
    n = 0
    for title, varga, lagna_planet in CHART_DEFS:
        svg = east_svg(doc, varga, lagna_planet, "en", title)
        houses, _, _ = chart_data(doc, varga, lagna_planet)
        want = {}
        for hh, ps in houses.items():
            for p in ps:
                want[p] = hh
        for m in re.finditer(
                r'<text[^>]*x="([\d.]+)"[^>]*y="([\d.]+)"[^>]*>(Su|Mo|Ma|Me|Ju|Ve|Sa|Ra|Ke)</text>|'
                r'<text[^>]*y="([\d.]+)"[^>]*x="([\d.]+)"[^>]*>(Su|Mo|Ma|Me|Ju|Ve|Sa|Ra|Ke)</text>',
                svg):
            g = m.groups()
            x, y, t = ((float(g[0]), float(g[1]), g[2]) if g[0]
                       else (float(g[4]), float(g[3]), g[5]))
            # fixed-house: planet sits in its house-numbered position
            assert _compartment(x, y) == want[sym2p[t]], (title, t)
            n += 1
    assert n == 72


def test_north_fixed_houses_match_cli():
    import copy
    import re

    from jychart import north_svg

    spread = copy.deepcopy(DOC)
    rasis = {"Ravi": "Simha", "Sikuru": "Simha", "Kethu": "Dhanu"}
    for p, v in rasis.items():
        spread["shadvarga"][p] = [v] * 6
    spread["lagna"]["seats"] = [8, 12, 5, 4, 7, 2]
    svg = north_svg(spread, 0, None, "en", "Lagna Chart")
    assert svg.startswith("<svg")
    # Ravi + Sikuru in house 10 (right diamond): |x-310|+|y-210| < 100
    found = {}
    for m in re.finditer(r'<text[^>]*x="([\d.]+)"[^>]*y="([\d.]+)"[^>]*>(Su|Ve|Ke)</text>|'
                         r'<text[^>]*y="([\d.]+)"[^>]*x="([\d.]+)"[^>]*>(Su|Ve|Ke)</text>',
                         svg):
        g = m.groups()
        x, y, t = (float(g[0]), float(g[1]), g[2]) if g[0] else (float(g[4]), float(g[3]), g[5])
        found[t] = abs(x - 310) + abs(y - 210) < 100
    assert found == {"Su": True, "Ve": True, "Ke": False}
    # sign numbers rotate with Lagna (North shows signs, houses are positions)
    assert len(re.findall(r'class="sign-num"', svg)) > 0


def test_house_numbers_all_compartments():
    import re

    svg = east_svg(DOC, 0, None, "en", "Lagna Chart")
    nums = re.findall(r'font-size="11"[^>]*>(\d+)</text>', svg)
    assert sorted(nums, key=int) == [str(i) for i in range(1, 13)]
    # Dhanu compartment (bottom-right upper triangle) reads house 9
    # under Mesha Lagna (synthetic DOC lagna seat 1).
    hits = [m.group(3) for m in
            re.finditer(r'<text x="([\d.]+)" y="([\d.]+)" font-size="11"[^>]*>(\d+)</text>',
                        svg)
            if 278 <= float(m.group(1)) <= 415 and 278 <= float(m.group(2)) <= 415
            and float(m.group(2)) < float(m.group(1))]
    assert hits == ["9"]

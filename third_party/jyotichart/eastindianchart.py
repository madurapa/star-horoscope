import support.constants as c
import support.general as gen
import support.languages as lang_module
import support.fonts as fonts


# East Indian (Maithili/Bengali) chart geometry.
# 3x3 grid, outer square (OX, OY, S). Fixed signs, anti-clockwise.
# Sign order (anti-clockwise from top-centre), matches east_indian.svg:
#   1 Aries      -> top-centre (single)
#   2 Taurus     -> top-left upper triangle
#   3 Gemini     -> top-left lower triangle
#   4 Cancer     -> middle-left (single)
#   5 Leo        -> bottom-left upper triangle
#   6 Virgo      -> bottom-left lower triangle
#   7 Libra      -> bottom-centre (single)
#   8 Scorpio    -> bottom-right lower triangle
#   9 Saggitarius-> bottom-right upper triangle
#   10 Capricorn -> middle-right (single)
#   11 Aquarius  -> top-right lower triangle
#   12 Pisces    -> top-right upper triangle

# Baseline font sizes ({css-class: px}); override via
# updatechartcfg(font_family=..., font_sizes={...}).
BASE_FONTS = {
    "sign-num": 20, "sign-num-tri": 15, "planet": 14, "aspect": 16,
    "chart-details": 12, "center-lagna": 16,
}

OX, OY, S = 5, 5, 410
C1 = OX + S / 3.0       # 141.666...
C2 = OX + 2 * S / 3.0   # 278.333...
XE = OX + S             # 415
YE = OY + S             # 415
CX_MID = (C1 + C2) / 2.0  # 210

# Centroid of each sign compartment (for planet placement + Asc marker)
EastChart_centres = {
    "aries"       : {"x": CX_MID, "y": (OY + C1) / 2.0},                    # top-centre
    "taurus"      : {"x": (OX + C1 + C1) / 3.0, "y": (OY + OY + C1) / 3.0},  # TL upper
    "gemini"      : {"x": (OX + OX + C1) / 3.0, "y": (OY + C1 + C1) / 3.0},  # TL lower
    "cancer"      : {"x": (OX + C1) / 2.0, "y": CX_MID},                    # middle-left
    "leo"         : {"x": (OX + C1 + OX) / 3.0, "y": (C2 + C2 + YE) / 3.0},  # BL upper
    "virgo"       : {"x": (C1 + C1 + OX) / 3.0, "y": (C2 + YE + YE) / 3.0},  # BL lower
    "libra"       : {"x": CX_MID, "y": (C2 + YE) / 2.0},                    # bottom-centre
    "scorpio"     : {"x": (C2 + XE + C2) / 3.0, "y": (C2 + YE + YE) / 3.0},  # BR lower
    "saggitarius" : {"x": (C2 + XE + XE) / 3.0, "y": (C2 + C2 + YE) / 3.0},  # BR upper
    "capricorn"   : {"x": (C2 + XE) / 2.0, "y": CX_MID},                    # middle-right
    "aquarius"    : {"x": (XE + XE + C2) / 3.0, "y": (OY + C1 + C1) / 3.0},  # TR lower
    "pisces"      : {"x": (C2 + XE + C2) / 3.0, "y": (OY + OY + C1) / 3.0},  # TR upper
}

# Relative offsets for up to 9 planets/aspects inside one compartment
# (used for the four roomy single-cell signs; triangles use the compact
# canonical grids below).
base_coordinates = [
    {"x": 0, "y": 0},
    {"x": 28, "y": 8},
    {"x": 13, "y": 28},
    {"x": -22, "y": 16},
    {"x": 58, "y": 18},
    {"x": -12, "y": 41},
    {"x": 53, "y": -7},
    {"x": -27, "y": -2},
    {"x": 23, "y": -12},
]

# Asc marker offset from compartment centroid (single-cell signs only)
ASC_DX, ASC_DY = 0, -30

# Signs rendered as small corner triangles (houses 2,3,5,6,8,9,11,12 with
# Aries ascendant). Planet text here is middle-anchored and uses compact
# per-triangle grids so labels never cross the diagonal dividers.
TRIANGLE_SIGNS = frozenset([
    "taurus", "gemini", "leo", "virgo",
    "scorpio", "saggitarius", "aquarius", "pisces",
])

# Per-triangle layout tables (world coords), solved per sign with realistic
# glyph boxes (38px/34px middle-anchored planet text, 20px middle-anchored
# aspect glyphs, 46px Asc label). Slots 1-2 (+Asc) are well separated for
# typical loads; every slot is strictly inside its triangle (verified), so
# labels never cross the diagonal dividers. Slot order: slot 1 first planet.
EAST_TRI_LAYOUT = {
    "taurus": {
        "asc": (98, 41),
        "natal": [(116, 84), (51, 22), (90, 20), (122, 98), (78, 54), (122, 19), (109, 53), (112, 73), (89, 29)],
        "transit": [(108, 63), (61, 36), (117, 29), (67, 44), (63, 29), (119, 91), (84, 61), (102, 48), (106, 58)],
    },
    "gemini": {
        "asc": (48, 115),
        "natal": [(30, 71), (95, 133), (27, 135), (86, 119), (25, 58), (43, 102), (35, 82), (33, 126), (87, 126)],
        "transit": [(39, 92), (61, 132), (71, 103), (79, 111), (59, 124), (63, 95), (27, 65), (45, 107), (41, 97)],
    },
    "pisces": {
        "asc": (322, 41),
        "natal": [(304, 84), (369, 22), (301, 21), (298, 98), (360, 36), (342, 54), (311, 53), (308, 73), (308, 29)],
        "transit": [(312, 63), (335, 23), (353, 44), (334, 31), (359, 29), (301, 91), (336, 61), (318, 48), (314, 58)],
    },
    "aquarius": {
        "asc": (372, 115),
        "natal": [(390, 71), (325, 133), (364, 135), (395, 58), (351, 101), (382, 102), (385, 82), (395, 127), (395, 137)],
        "transit": [(381, 92), (335, 119), (361, 126), (340, 110), (337, 126), (357, 94), (393, 65), (375, 107), (379, 97)],
    },
    "leo": {
        "asc": (48, 315),
        "natal": [(31, 357), (95, 296), (27, 294), (25, 371), (86, 310), (43, 327), (35, 347), (33, 303), (87, 303)],
        "transit": [(39, 337), (61, 297), (71, 326), (79, 318), (59, 305), (27, 364), (63, 334), (45, 322), (41, 332)],
    },
    "virgo": {
        "asc": (98, 389),
        "natal": [(116, 345), (51, 407), (90, 409), (122, 330), (78, 375), (122, 402), (109, 376), (112, 356), (89, 400)],
        "transit": [(108, 366), (61, 393), (66, 384), (117, 410), (83, 367), (63, 400), (119, 338), (102, 381), (106, 371)],
    },
    "saggitarius": {
        "asc": (372, 315),
        "natal": [(389, 357), (325, 296), (364, 294), (395, 371), (377, 327), (385, 347), (395, 293), (363, 303), (393, 303)],
        "transit": [(381, 337), (335, 310), (349, 326), (341, 318), (337, 303), (393, 364), (357, 334), (375, 322), (379, 332)],
    },
    "scorpio": {
        "asc": (322, 389),
        "natal": [(304, 345), (368, 406), (301, 408), (298, 330), (359, 393), (342, 375), (311, 376), (308, 356), (307, 399)],
        "transit": [(312, 366), (334, 405), (354, 384), (333, 398), (301, 338), (336, 368), (356, 399), (318, 381), (314, 371)],
    },
}
_CANON_TRANSIT = [
    (62, 48), (27, 80), (48, 52), (60, 40), (24, 68),
    (56, 36), (60, 20), (30, 44), (30, 58),
]

# World-space triangle vertices per sign (for geometric anchor detection).
EAST_TRIANGLES = {
    "taurus":      [(OX, OY), (C1, OY), (C1, C1)],
    "gemini":      [(OX, OY), (OX, C1), (C1, C1)],
    "pisces":      [(C2, OY), (XE, OY), (C2, C1)],
    "aquarius":    [(XE, OY), (XE, C1), (C2, C1)],
    "leo":         [(OX, C2), (C1, C2), (OX, YE)],
    "virgo":       [(C1, C2), (C1, YE), (OX, YE)],
    "saggitarius": [(C2, C2), (XE, C2), (XE, YE)],
    "scorpio":     [(C2, C2), (XE, YE), (C2, YE)],
}


def _in_triangle(px, py, tri):
    (ax, ay), (bx, by), (cx, cy) = tri
    d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy)
    if d == 0:
        return False
    l1 = ((by - cy) * (px - cx) + (cx - bx) * (py - cy)) / d
    l2 = ((cy - ay) * (px - cx) + (ax - cx) * (py - cy)) / d
    return l1 > 0 and l2 > 0 and (1 - l1 - l2) > 0


def tri_anchor_for_pos(px, py):
    """Middle anchor inside corner triangles, start anchor elsewhere."""
    for tri in EAST_TRIANGLES.values():
        if _in_triangle(px, py, tri):
            return ' text-anchor="middle"'
    return ""


############################################################################
################# Global Functions #########################################
############################################################################

def reset_chartcfg():
    chartcfg = {
        "background-colour": "black",
        "outerbox-colour": "red",
        "innerbox-colour": "red",
        "line-colour": "yellow",
        "sign-colour": "pink",
        "house-colour": {
            "aries": "black",
            "taurus": "black",
            "gemini": "black",
            "cancer": "black",
            "leo": "black",
            "virgo": "black",
            "libra": "black",
            "scorpio": "black",
            "saggitarius": "black",
            "capricorn": "black",
            "aquarius": "black",
            "pisces": "black",
        },
        "aspect-visibility": True,
        "center-lagna-visibility": False,
        "font-family": "sans-serif",
        "font-sizes": {},
        "details-colour": "white",
    }
    return chartcfg


def _sign_key(sign):
    k = sign.lower()
    if k == "sagittarius":
        k = "saggitarius"
    return k


def get_coordniates(sign, planetidx):
    if planetidx in range(1, 10):
        key = _sign_key(sign)
        if key in TRIANGLE_SIGNS:
            return EAST_TRI_LAYOUT[key]["natal"][planetidx - 1]
        centre = EastChart_centres[key]
        x = centre["x"] + base_coordinates[planetidx - 1]["x"]
        y = centre["y"] + base_coordinates[planetidx - 1]["y"]
        return (x, y)
    print(f"INPUTERROR: planetidx must be in the range 1 to 9 but given value is {planetidx}.")
    return (0, 0)


def get_transitcoordniates(sign, planetidx):
    """Transit counterparts: separate sub-zone of the same triangle."""
    if planetidx in range(1, 10):
        key = _sign_key(sign)
        if key in TRIANGLE_SIGNS:
            return EAST_TRI_LAYOUT[key]["transit"][planetidx - 1]
        centre = EastChart_centres[key]
        x = centre["x"] + base_coordinates[planetidx - 1]["x"]
        y = centre["y"] + base_coordinates[planetidx - 1]["y"]
        return (x, y)
    print(f"INPUTERROR: planetidx must be in the range 1 to 9 but given value is {planetidx}.")
    return (0, 0)


def is_triangle_sign(sign):
    """True if the sign is drawn as a small corner triangle."""
    return _sign_key(sign) in TRIANGLE_SIGNS


def sign_of_house(housenum, ascendantsign):
    """Fixed-sign lookup: which sign occupies a house number from Lagna."""
    return gen.get_signofsign(housenum, ascendantsign)


def get_asc_position(sign):
    key = _sign_key(sign)
    if key in TRIANGLE_SIGNS:
        return EAST_TRI_LAYOUT[key]["asc"]
    centre = EastChart_centres[key]
    return (centre["x"] + ASC_DX, centre["y"] + ASC_DY)


def draw_classicEastChartSkeleton(chartSVG, chartCfg):
    chartSVG.write(f'''  <!-- ********** Chart Diagram ********** -->\n''')
    hc = chartCfg["house-colour"]
    # Outer border
    chartSVG.write(f'''  <rect id="border" width="{S}" height="{S}" x="{OX}" y="{OY}" style="fill:{chartCfg["background-colour"]};stroke-width:3;stroke:{chartCfg["outerbox-colour"]}" />\n''')
    # Centre hollow box (birth details)
    chartSVG.write(f'''  <rect id="center" width="{C2 - C1}" height="{C2 - C1}" x="{C1}" y="{C1}" style="fill:{chartCfg["background-colour"]};stroke-width:3;stroke:{chartCfg["innerbox-colour"]}" />\n''')
    # Four single-cell rects (fixed signs)
    chartSVG.write(f'''  <rect id="aries" width="{C2 - C1}" height="{C1 - OY}" x="{C1}" y="{OY}" style="fill:{hc["aries"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <rect id="cancer" width="{C1 - OX}" height="{C2 - C1}" x="{OX}" y="{C1}" style="fill:{hc["cancer"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <rect id="libra" width="{C2 - C1}" height="{YE - C2}" x="{C1}" y="{C2}" style="fill:{hc["libra"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <rect id="capricorn" width="{XE - C2}" height="{C2 - C1}" x="{C2}" y="{C1}" style="fill:{hc["capricorn"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    # Eight corner triangles (fixed signs, anti-clockwise)
    # Top-left: Taurus (upper) / Gemini (lower), diagonal OX,OY -> C1,C1
    chartSVG.write(f'''  <polygon id="taurus" points="{OX},{OY} {C1},{OY} {C1},{C1}" style="fill:{hc["taurus"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <polygon id="gemini" points="{OX},{OY} {OX},{C1} {C1},{C1}" style="fill:{hc["gemini"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    # Top-right: Pisces (upper) / Aquarius (lower), diagonal C2,C1 -> XE,OY
    chartSVG.write(f'''  <polygon id="pisces" points="{C2},{OY} {XE},{OY} {C2},{C1}" style="fill:{hc["pisces"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <polygon id="aquarius" points="{XE},{OY} {XE},{C1} {C2},{C1}" style="fill:{hc["aquarius"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    # Bottom-left: Leo (upper) / Virgo (lower), diagonal OX,YE -> C1,C2
    chartSVG.write(f'''  <polygon id="leo" points="{OX},{C2} {C1},{C2} {OX},{YE}" style="fill:{hc["leo"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <polygon id="virgo" points="{C1},{C2} {C1},{YE} {OX},{YE}" style="fill:{hc["virgo"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    # Bottom-right: Sagittarius (upper) / Scorpio (lower), diagonal C2,C2 -> XE,YE
    chartSVG.write(f'''  <polygon id="saggitarius" points="{C2},{C2} {XE},{C2} {XE},{YE}" style="fill:{hc["saggitarius"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    chartSVG.write(f'''  <polygon id="scorpio" points="{C2},{C2} {XE},{YE} {C2},{YE}" style="fill:{hc["scorpio"]};stroke:{chartCfg["line-colour"]};stroke-width:2" />\n''')
    # Grid dividers (redrawn for crisp edges over fills)
    chartSVG.write(f'''  <line x1="{C1}" y1="{OY}" x2="{C1}" y2="{YE}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{C2}" y1="{OY}" x2="{C2}" y2="{YE}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{OX}" y1="{C1}" x2="{XE}" y2="{C1}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{OX}" y1="{C2}" x2="{XE}" y2="{C2}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{OX}" y1="{OY}" x2="{C1}" y2="{C1}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{C2}" y1="{C1}" x2="{XE}" y2="{OY}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{OX}" y1="{YE}" x2="{C1}" y2="{C2}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    chartSVG.write(f'''  <line x1="{C2}" y1="{C2}" x2="{XE}" y2="{YE}" style="stroke:{chartCfg["line-colour"]};stroke-width:2"/>\n''')
    return


def write_signnumOnChart_esc(chartSVG, signclr, ascendantsign, language="english"):
    chartSVG.write('\n  <!-- ********** Ascendant Sign ********** -->\n')
    px, py = get_asc_position(ascendantsign)
    asc_label = lang_module.get_ui_label("asc", language)
    # Smaller marker inside the cramped corner triangles.
    asc_class = "sign-num-tri" if is_triangle_sign(ascendantsign) else "sign-num"
    chartSVG.write(f'''  <text id="{ascendantsign}Asc" x="{px}" y="{py}" fill="{signclr}" class="{asc_class}" text-anchor="middle">{asc_label}</text>\n''')
    return


def write_planetsOnChart_esc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Planets ********** -->\n')
    for planetname in planets:
        chartSVG.write(f'\n  <!-- ********** {planetname} ********** -->\n')
        symbol = planets[planetname]["symbol"]
        retro = planets[planetname]["retro"]
        planetcolour = planets[planetname]["colour"]
        px = planets[planetname]["pos"]["x"]
        py = planets[planetname]["pos"]["y"]
        # Middle anchor inside triangles keeps labels off the dividers.
        anchor = tri_anchor_for_pos(px, py)
        if retro:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" text-decoration="underline" class="planet"{anchor}>{symbol}</text>\n''')
        else:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" class="planet"{anchor}>{symbol}</text>\n''')
    return


def write_planetsAspectsOnChart_esc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Planets Aspects ********** -->\n')
    for planetname in planets:
        chartSVG.write(f'\n  <!-- ********** {planetname} Aspect ********** -->\n')
        symbol = planets[planetname]["aspect_symbol"]
        planetcolour = planets[planetname]["colour"]
        for aspectpositions in planets[planetname]["aspectpos"]:
            px = aspectpositions["x"]
            py = aspectpositions["y"]
            anchor = tri_anchor_for_pos(px, py)
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" class="aspect"{anchor}>{symbol}</text>\n''')
    return


def write_chartdetailsOnChart_esc(chartSVG, chartObj, language="english"):
    chartSVG.write('\n  <!-- ********** Chart Details ********** -->\n')
    cx = CX_MID
    cy = CX_MID - 10
    line_height = 18
    box_center_y = CX_MID
    lbl_birth = lang_module.get_ui_label("birth", language)
    lbl_birthplace = lang_module.get_ui_label("birthplace", language)
    lbl_chart = lang_module.get_ui_label("chart", language)
    details = []
    if chartObj.personname:
        details.append(chartObj.personname)
    if chartObj.dob:
        dob_tob = f"{lbl_birth} : {chartObj.dob}"
        if chartObj.tob:
            dob_tob += f" | {chartObj.tob}"
        details.append(dob_tob)
    if chartObj.pob:
        details.append(f"{lbl_birthplace} : {chartObj.pob}")
    if chartObj.chartname:
        details.append(f"{lbl_chart} : {chartObj.chartname}")
    # Sinhala (Sri Lankan) standard: centre must show rising sign + Lagna,
    # two lines, horizontally and vertically centred, updating with ascendant.
    lang = (language or "english").lower()
    lagna_lines = []
    show_center_lagna = chartObj.chartcfg.get("center-lagna-visibility", False)
    if show_center_lagna and getattr(chartObj, "ascendantsign", "NotSet") != "NotSet":
        # A string value doubles as a custom line-2 label; known Shodashavarga
        # names (e.g. "Navamsa", "D9") are auto-translated via get_varga_name().
        lagna_label = lang_module.get_varga_name(show_center_lagna, language) if isinstance(show_center_lagna, str) else lang_module.get_ui_label("asc", language)
        lagna_lines = [
            lang_module.get_sign_name(chartObj.ascendantsign, language),
            lagna_label,
        ]
        total = len(lagna_lines) + len(details)
        if total:
            cy = box_center_y - ((total - 1) * line_height) / 2.0
    for i, line in enumerate(lagna_lines):
        y_pos = cy + (i * line_height)
        chartSVG.write(f'''  <text x="{cx}" y="{y_pos}" fill="{chartObj.chartcfg.get("details-colour", "white")}" class="center-lagna" text-anchor="middle">{line}</text>\n''')
    for i, detail in enumerate(details):
        y_pos = cy + ((len(lagna_lines) + i) * line_height)
        chartSVG.write(f'''  <text x="{cx}" y="{y_pos}" fill="{chartObj.chartcfg.get("details-colour", "white")}" class="chart-details" text-anchor="middle">{detail}</text>\n''')
    return


def create_chartSVG(chartObj, location, chartSVGfilename, language="english"):
    if location[-1] == '\\' or location[-1] == '/':
        chartSVGFullname = f'{location}{chartSVGfilename}.svg'
    elif '/' in location:
        chartSVGFullname = f'{location}/{chartSVGfilename}.svg'
    else:
        chartSVGFullname = f'{location}\{chartSVGfilename}.svg'
    chartSVG = open(chartSVGFullname, 'w', encoding='utf-16')
    chartSVG.write(f'''<svg id="{chartObj.chartname}_chart_{chartObj.personname}" height="500" width="500" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 420 420" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" charset="utf-16">\n''')
    chartSVG.write(fonts.style_block(chartObj.chartcfg, BASE_FONTS))
    draw_classicEastChartSkeleton(chartSVG, chartObj.chartcfg)
    write_signnumOnChart_esc(chartSVG, chartObj.chartcfg["sign-colour"], chartObj.ascendantsign, language)
    write_planetsOnChart_esc(chartSVG, chartObj.planets)
    if chartObj.chartcfg["aspect-visibility"]:
        write_planetsAspectsOnChart_esc(chartSVG, chartObj.planets)
    write_chartdetailsOnChart_esc(chartSVG, chartObj, language)
    chartSVG.write('\n  Sorry, your browser does not support inline SVG.\n')
    chartSVG.write('</svg>\n')
    chartSVG.close()
    return "Success"

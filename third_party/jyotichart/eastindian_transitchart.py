import eastindianchart as ec
import support.languages as lang_module
import support.fonts as fonts

# Transit planets share the same fixed-sign compartments as natal planets
# but use a separate compact sub-zone (see _CANON_TRANSIT in
# eastindianchart.py) so both sets remain visible without crossing dividers.

# Baseline font sizes ({css-class: px}); override via
# updatechartcfg(font_family=..., font_sizes={...}).
BASE_FONTS = {
    "sign-num": 20, "sign-num-tri": 15,
    "natal-planet": 13, "transit-planet": 13,
    "natal-aspect": 14, "transit-aspect": 14,
    "chart-details": 11, "center-lagna": 14,
}


def reset_chartcfg():
    cfg = ec.reset_chartcfg()
    cfg["outerbox-colour"] = "cyan"
    return cfg


def get_natalcoordniates(sign, planetidx):
    return ec.get_coordniates(sign, planetidx)


def get_transitcoordniates(sign, planetidx):
    return ec.get_transitcoordniates(sign, planetidx)


def draw_classicEastTransitChartSkeleton(chartSVG, chartCfg):
    # Single East skeleton; natal (inner) + transit (outer-shifted) share compartments.
    ec.draw_classicEastChartSkeleton(chartSVG, chartCfg)
    return


def write_signnumOnChart_etsc(chartSVG, signclr, ascendantsign, language="english"):
    ec.write_signnumOnChart_esc(chartSVG, signclr, ascendantsign, language)
    return


def write_natalplanetsOnChart_etsc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Natal Planets ********** -->\n')
    for planetname in planets:
        symbol = planets[planetname]["symbol"]
        retro = planets[planetname]["retro"]
        planetcolour = planets[planetname]["colour"]
        px = planets[planetname]["pos"]["x"]
        py = planets[planetname]["pos"]["y"]
        anchor = ec.tri_anchor_for_pos(px, py)
        if retro:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" text-decoration="underline" class="natal-planet" id="natal-{planetname}"{anchor}>{symbol}</text>\n''')
        else:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" class="natal-planet" id="natal-{planetname}"{anchor}>{symbol}</text>\n''')
    return


def write_transitplanetsOnChart_etsc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Transit Planets ********** -->\n')
    for planetname in planets:
        symbol = planets[planetname]["symbol"]
        retro = planets[planetname]["retro"]
        planetcolour = planets[planetname]["colour"]
        px = planets[planetname]["pos"]["x"]
        py = planets[planetname]["pos"]["y"]
        anchor = ec.tri_anchor_for_pos(px, py)
        if retro:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" text-decoration="underline" class="transit-planet" id="transit-{planetname}"{anchor}>{symbol}</text>\n''')
        else:
            chartSVG.write(f'''  <text y="{py}" x="{px}" fill="{planetcolour}" class="transit-planet" id="transit-{planetname}"{anchor}>{symbol}</text>\n''')
    return


def write_natalplanetsAspectsOnChart_etsc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Natal Planets Aspects ********** -->\n')
    for planetname in planets:
        symbol = planets[planetname]["aspect_symbol"]
        planetcolour = planets[planetname]["colour"]
        for ap in planets[planetname]["aspectpos"]:
            anchor = ec.tri_anchor_for_pos(ap["x"], ap["y"])
            chartSVG.write(f'''  <text y="{ap["y"]}" x="{ap["x"]}" fill="{planetcolour}" class="natal-aspect" id="natal-{planetname}-aspect"{anchor}>{symbol}</text>\n''')
    return


def write_transitplanetsAspectsOnChart_etsc(chartSVG, planets):
    chartSVG.write('\n  <!-- ********** Transit Planets Aspects ********** -->\n')
    for planetname in planets:
        symbol = planets[planetname]["aspect_symbol"]
        planetcolour = planets[planetname]["colour"]
        for ap in planets[planetname]["aspectpos"]:
            anchor = ec.tri_anchor_for_pos(ap["x"], ap["y"])
            chartSVG.write(f'''  <text y="{ap["y"]}" x="{ap["x"]}" fill="{planetcolour}" class="transit-aspect" id="transit-{planetname}-aspect"{anchor}>{symbol}</text>\n''')
    return


def write_chartdetailsOnChart_etsc(chartSVG, chartObj, parentChartObj, language="english"):
    chartSVG.write('\n  <!-- ********** Chart Details ********** -->\n')
    cx = ec.CX_MID
    cy = ec.CX_MID - 20
    line_height = 15
    box_center_y = ec.CX_MID
    lbl_birth = lang_module.get_ui_label("birth", language)
    lbl_birthplace = lang_module.get_ui_label("birthplace", language)
    lbl_inner = lang_module.get_ui_label("inner", language)
    lbl_outer = lang_module.get_ui_label("outer", language)
    lbl_transit = lang_module.get_ui_label("transit", language)
    lbl_outerbirth = lang_module.get_ui_label("outerbirth", language)
    lbl_outerbirthpl = lang_module.get_ui_label("outerbirthplace", language)
    details = []
    if chartObj.personname:
        details.append(chartObj.personname)
    if hasattr(parentChartObj, 'dob') and parentChartObj.dob:
        dob_tob = f"{lbl_birth} : {parentChartObj.dob}"
        if hasattr(parentChartObj, 'tob') and parentChartObj.tob:
            dob_tob += f" | {parentChartObj.tob}"
        details.append(dob_tob)
    if hasattr(parentChartObj, 'pob') and parentChartObj.pob:
        details.append(f"{lbl_birthplace} : {parentChartObj.pob}")
    if parentChartObj.chartname:
        details.append(f"{lbl_inner} : {parentChartObj.chartname}")
    if chartObj.chartname:
        details.append(f"{lbl_outer} : {chartObj.chartname}")
    if hasattr(chartObj, 'outer_dob') and chartObj.outer_dob:
        outer_dob_tob = f"{lbl_outerbirth} : {chartObj.outer_dob}"
        if hasattr(chartObj, 'outer_tob') and chartObj.outer_tob:
            outer_dob_tob += f" | {chartObj.outer_tob}"
        details.append(outer_dob_tob)
        if hasattr(chartObj, 'outer_pob') and chartObj.outer_pob:
            details.append(f"{lbl_outerbirthpl} : {chartObj.outer_pob}")
    elif getattr(chartObj, 'transit_date', ''):
        transit_dt = f"{lbl_transit} : {chartObj.transit_date}"
        if getattr(chartObj, 'transit_time', ''):
            transit_dt += f" | {chartObj.transit_time}"
        details.append(transit_dt)
    # Optional centre label: rising sign + Lagna, two lines, centred.
    # Off by default; opt in via updatechartcfg(show_center_lagna=True).
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


def create_transitchartSVG(chartObj, location, chartSVGfilename, parentChartObj, language="english"):
    if location[-1] == '\\' or location[-1] == '/':
        chartSVGFullname = f'{location}{chartSVGfilename}.svg'
    elif '/' in location:
        chartSVGFullname = f'{location}/{chartSVGfilename}.svg'
    else:
        chartSVGFullname = f'{location}\\{chartSVGfilename}.svg'
    chartSVG = open(chartSVGFullname, 'w', encoding='utf-16')
    chartSVG.write(f'''<svg id="{chartObj.chartname}_chart_{chartObj.personname}" height="500" width="500" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 420 420" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" charset="utf-16">\n''')
    chartSVG.write(fonts.style_block(chartObj.chartcfg, BASE_FONTS))
    draw_classicEastTransitChartSkeleton(chartSVG, chartObj.chartcfg)
    write_signnumOnChart_etsc(chartSVG, chartObj.chartcfg["sign-colour"], chartObj.ascendantsign, language)
    write_natalplanetsOnChart_etsc(chartSVG, parentChartObj.planets)
    if parentChartObj.chartcfg["aspect-visibility"]:
        write_natalplanetsAspectsOnChart_etsc(chartSVG, parentChartObj.planets)
    write_transitplanetsOnChart_etsc(chartSVG, chartObj.planets)
    if chartObj.chartcfg["aspect-visibility"]:
        write_transitplanetsAspectsOnChart_etsc(chartSVG, chartObj.planets)
    write_chartdetailsOnChart_etsc(chartSVG, chartObj, parentChartObj, language)
    chartSVG.write('\n  Sorry, your browser does not support inline SVG.\n')
    chartSVG.write('</svg>\n')
    chartSVG.close()
    return "Success"

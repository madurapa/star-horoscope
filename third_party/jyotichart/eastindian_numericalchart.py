import eastindianchart as ec
import support.languages as lang_module
import support.fonts as fonts


# Baseline font sizes ({css-class: px}); override via
# updatechartcfg(font_family=..., font_sizes={...}).
# (sign-num-tri included: the Asc marker uses it inside triangles.)
BASE_FONTS = {
    "sign-num": 20, "sign-num-tri": 15,
    "num-value": 28, "center-lagna": 16,
}


def reset_chartcfg():
    return ec.reset_chartcfg()


def write_numericalValuesOnChart_esc(chartSVG, signvalues):
    chartSVG.write('\n  <!-- ********** Numerical Values ********** -->\n')
    for sign_key, centre in ec.EastChart_centres.items():
        entry = signvalues.get(sign_key, {"value": "", "colour": "lime"})
        val = entry["value"]
        clr = entry["colour"]
        px = centre["x"]
        py = centre["y"] + 8
        chartSVG.write(f'  <text x="{px}" y="{py}" fill="{clr}" class="num-value" text-anchor="middle">{val}</text>\n')
    return


def write_ascOnChart_esc(chartSVG, signclr, ascendantsign, language="english"):
    ec.write_signnumOnChart_esc(chartSVG, signclr, ascendantsign, language)
    return


def create_numericalchartSVG(chartObj, location, chartSVGfilename, language="english"):
    if location[-1] == '\\' or location[-1] == '/':
        chartSVGFullname = f'{location}{chartSVGfilename}.svg'
    elif '/' in location:
        chartSVGFullname = f'{location}/{chartSVGfilename}.svg'
    else:
        chartSVGFullname = f'{location}\\{chartSVGfilename}.svg'
    chartSVG = open(chartSVGFullname, 'w', encoding='utf-16')
    chartSVG.write(
        f'<svg id="{chartObj.chartname}_chart_{chartObj.personname}" '
        f'height="500" width="500" '
        f'xmlns="http://www.w3.org/2000/svg" '
        f'xmlns:xlink="http://www.w3.org/1999/xlink" '
        f'viewBox="0 0 420 420" shape-rendering="geometricPrecision" '
        f'text-rendering="geometricPrecision" charset="utf-16">\n'
    )
    chartSVG.write(fonts.style_block(chartObj.chartcfg, BASE_FONTS))
    ec.draw_classicEastChartSkeleton(chartSVG, chartObj.chartcfg)
    write_ascOnChart_esc(chartSVG, chartObj.chartcfg["sign-colour"], chartObj.ascendantsign, language)
    write_numericalValuesOnChart_esc(chartSVG, chartObj.signvalues)
    # Sinhala (Sri Lankan) standard: centre must show rising sign + Lagna.
    # Optional centre label: rising sign + Lagna, two lines, centred.
    # Off by default; opt in via updatechartcfg(show_center_lagna=True).
    lang = (language or "english").lower()
    show_center_lagna = chartObj.chartcfg.get("center-lagna-visibility", False)
    if show_center_lagna and getattr(chartObj, "ascendantsign", "NotSet") != "NotSet":
        cx, box_center_y, lh = ec.CX_MID, ec.CX_MID, 20
        sign_name = lang_module.get_sign_name(chartObj.ascendantsign, language)
        # A string flag value doubles as a custom line-2 label; known
        # Shodashavarga names (e.g. "Navamsa", "D9") are auto-translated.
        asc_label = lang_module.get_varga_name(show_center_lagna, language) if isinstance(show_center_lagna, str) else lang_module.get_ui_label("asc", language)
        chartSVG.write('\n  <!-- ********** Center Lagna (Sinhala) ********** -->\n')
        chartSVG.write(f'  <text x="{cx}" y="{box_center_y - lh / 2.0}" fill="{chartObj.chartcfg.get("details-colour", "white")}" class="center-lagna" text-anchor="middle">{sign_name}</text>\n')
        chartSVG.write(f'  <text x="{cx}" y="{box_center_y + lh / 2.0}" fill="{chartObj.chartcfg.get("details-colour", "white")}" class="center-lagna" text-anchor="middle">{asc_label}</text>\n')
    chartSVG.write('\n  Sorry, your browser does not support inline SVG.\n')
    chartSVG.write('</svg>\n')
    chartSVG.close()
    return "Success"

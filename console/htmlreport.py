"""Sample-layout HTML report renderer (pure consumer).

Self-contained single file: inline CSS, base64-embedded Noto Sans
Sinhala (Regular + Bold, from console/assets/fonts), inline zodiac
SVGs (console/assets/zodiac, picked dynamically per Rasi), and
jyotichart SVG strings for the divisional charts. Same doc dict as
the Rich renderers. Print-friendly light theme.

Sections (match report_sample/report-light.html): masthead, hero
(birth line + Lagna badge + Panchanga/Hora/Chakra groups), Shadvarga
Matrix, Divisional Charts (8 cards, each titled with its ascendant
zodiac icon), Mahadasa & Antardasa timeline, minimal provenance
footer. Dropped from the old layout on purpose: Selected Options,
Birth Profile / Astro Reference / Time & Solar tables, Houses table,
Shadvarga Positions, flat dasa table (see docs/status_and_plans.md).

All chrome goes through tr()/trx(), all values through trv()/
tr_tithi()/trvx() (en/si/ta). Table headers and the provenance line
stay English technical vocabulary, like the terminal renderers.
"""
import base64
import html as _html
from functools import lru_cache

from i18n import tr, trv
from render import disp_lon
from report_l10n import trx
from services import hero_groups, hero_header, matrix_rows, timeline_rows

# Assets + zodiac art live in services (WS-B single source).
from services import ASSETS, matrix_headers, sign_name, zodiac_svg as _zodiac

# jyotichart styles per --chart value (diamond renders fixed-house north).
CHART_STYLE = {"diamond": "north"}


def _esc(s) -> str:
    return _html.escape(str(s), quote=True)


@lru_cache(maxsize=1)
def _font_css() -> str:
    """@font-face with embedded Regular + Bold; "" when assets miss."""
    faces = []
    for weight, file in (("400", "NotoSansSinhala-Regular.ttf"),
                         ("700", "NotoSansSinhala-Bold.ttf")):
        path = ASSETS / "fonts" / file
        if not path.is_file():
            continue
        blob = base64.b64encode(path.read_bytes()).decode("ascii")
        faces.append(
            "@font-face{font-family:'Noto Sans Sinhala';font-style:normal;"
            f"font-weight:{weight};font-display:swap;"
            f"src:url(data:font/ttf;base64,{blob}) format('truetype');}}")
    return "".join(faces)


CSS = """
:root {
    --bg: rgba(247, 246, 243, 0.5);
    --panel: #ffffff;
    --panel-2: #faf9f6;
    --border: #e6e2da;
    --border-soft: #eeebe4;
    --text: #20221f;
    --text-dim: #6b6a63;
    --text-faint: #a3a097;
    --accent: #b45309;
    --accent-soft: #b453091a;
    --accent-line: #b4530944;
    --teal: #0f766e;
    --chart-bg: #ffffff;
    --chart-line: #d8d3c8;
    font-size: 16px;
}
* { box-sizing: border-box; }
html, body { margin: 0; padding: 0; }
body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Noto Sans Sinhala', 'Noto Sans', system-ui, sans-serif;
    padding-top: env(safe-area-inset-top, 0px);
    padding-bottom: env(safe-area-inset-bottom, 0px);
    letter-spacing: .018em;
}
a { color: var(--accent); }
.wrap { max-width: 1320px; margin: 0 auto; padding: 2rem 1.5rem 0; }
.masthead {
    display: flex; align-items: center; justify-content: space-between;
    flex-wrap: wrap; gap: .6rem; margin-bottom: 1.75rem;
}
.brand { display: flex; align-items: baseline; gap: .65rem; }
.brand-name { font-weight: 600; font-size: 1.3rem; letter-spacing: -.005em; }
.head-divider { opacity: 0.2; }
.meta-row {
    display: flex; gap: 1.1rem; flex-wrap: wrap;
    font-family: 'Noto Sans Sinhala', sans-serif;
    font-size: .74rem; color: var(--text-dim);
}
.meta-row b { color: var(--text); font-weight: 600; }
.footer { padding: 1.4rem 0; }
.footer-inner {
    display: flex; justify-content: space-between;
    flex-wrap: wrap; gap: .75rem 2rem;
}
.footer-sig {
    font-size: .7rem; color: var(--text-faint); width: 100%;
    padding-top: .9rem; border-top: 1px dashed var(--border-soft);
    margin-top: .4rem; text-align: center;
}
.hero1 {
    display: grid; grid-template-columns: 1.3fr 1fr;
    gap: 1.25rem; margin-bottom: 2.25rem; align-items: center;
}
@media (max-width: 700px) {
    .hero1 { grid-template-columns: 1fr; }
    .hero-side1 { justify-content: flex-start; }
}
.hero-main {
    background: var(--panel); border: 1px solid var(--border);
    border-radius: 10px; padding: 1.75rem 1.9rem;
    position: relative; overflow: hidden;
}
.hero-main::before {
    content: ""; position: absolute; inset: 0;
    background: radial-gradient(500px 200px at 85% -10%,
        var(--accent-soft), transparent 70%);
    pointer-events: none;
}
.hero-eyebrow {
    background: linear-gradient(to right, rgba(180, 83, 9, 0.05),
        rgba(180, 83, 9, 0.009));
    padding: .3rem 0 .3rem .5rem;
    font-size: 1rem; color: var(--accent); letter-spacing: .04em;
}
.hero-eyebrow--spaced { margin: 2.4rem 0 .9rem; }
.hero-name {
    font-size: 1.8rem; font-weight: 700;
    margin: 0 0 .35rem; letter-spacing: -.01em;
}
.hero-sub { color: var(--text-dim); font-size: .92rem; margin: 0; }
.hero-facts {
    display: grid; grid-template-columns: repeat(5, 1fr);
    gap: .9rem 1.4rem; margin-top: 0;
}
.hero-fact-k { font-size: .68rem; color: var(--text-faint); }
.hero-fact-v { font-size: .95rem; color: var(--text); margin-top: .15rem; }
.hero-side1 {
    display: flex; flex-direction: row; justify-content: right;
    justify-self: right; align-items: center; gap: .9rem;
}
.hero-zodiac { width: 104px; flex: none; }
.hero-zodiac svg {
    width: 100%; height: auto; display: block;
}
.lagna-badge {
    font-size: 1.25rem; font-weight: 500;
    color: var(--accent-line); text-align: right;
}
.lagna-badge .hero-fact-k {
    font-weight: normal; color: var(--accent-line);
}
.group-label {
    font-size: 1rem; color: var(--accent);
    margin: 2rem 0 .9rem .9rem; padding-bottom: .2rem;
    display: flex; align-items: center; gap: .5rem;
}
.card {
    background: var(--panel); border: 1px solid var(--border);
    border-radius: 8px; overflow: hidden;
}
.card-wide { margin-bottom: 1rem; }
.table-scroll { overflow-x: auto; }
table {
    border-collapse: collapse; width: 100%;
    min-width: 560px; font-size: .85rem;
}
thead th {
    text-align: left; padding: .55rem .8rem; color: var(--text-dim);
    font-weight: 600; border-bottom: 1px solid var(--border);
    background: var(--panel-2); white-space: nowrap;
}
tbody td {
    padding: .5rem .8rem; border-bottom: 1px solid var(--border-soft);
    white-space: nowrap;
}
tbody tr:hover { background: var(--panel-2); }
td.num { text-align: right; color: var(--teal); }
tbody td:first-child { color: var(--text); }
.charts-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
    gap: 1rem;
}
.chart-wrap { padding: .9rem; color: var(--text-dim); }
.chart-wrap svg { width: 100%; height: auto; display: block; }
.chart-wrap svg text { fill: var(--text); font-weight: normal; }
.timeline { display: flex; flex-direction: column; gap: .5rem; }
.note {
    font-size: .68rem; color: var(--text-faint);
    padding: 0.5rem; margin-bottom: .15rem;
}
.maha-block {
    background: var(--panel); border: 1px solid var(--border);
    border-radius: 8px; overflow: hidden;
}
.maha-block.active summary { background: var(--accent-line); }
.maha-block summary {
    list-style: none; cursor: pointer;
    display: grid; grid-template-columns: 110px 1fr 1fr;
    gap: 1rem; align-items: center;
    padding: .75rem 1rem; background: var(--panel-2);
}
.maha-block summary::-webkit-details-marker { display: none; }
.maha-lord {
    font-weight: 700; font-size: .95rem;
    display: flex; align-items: center; gap: .5rem;
}
.maha-lord::before {
    content: "\\25B8"; color: var(--accent); font-size: .75rem;
    transition: transform .15s ease;
}
.maha-block[open] .maha-lord::before { transform: rotate(90deg); }
.maha-span { font-size: .82rem; text-align: right; }
.maha-age {
    display: flex; justify-content: end; align-items: baseline;
    gap: .4rem; color: var(--text-dim); font-size: .8rem;
    text-align: right;
}
.bhukti-list { padding: .3rem 1rem .6rem 2.6rem; }
.bhukti-row {
    display: grid; grid-template-columns: calc(110px - 1.6rem) 1fr 1fr;
    gap: 1rem; padding: .38rem 0;
    border-bottom: 1px solid var(--border-soft); font-size: .83rem;
}
.bhukti-row.active .bh-name,
.bhukti-row.active .bh-span,
.bhukti-row.active .bh-age {
    color: var(--text) !important; font-weight: 500;
}
.bhukti-row:last-child { border-bottom: none; }
.bh-name { color: var(--text-dim); }
.bh-span { color: var(--text-dim); text-align: right; }
.bh-age {
    display: flex; justify-content: end; align-items: baseline;
    gap: .4rem; color: var(--text-dim);
}
.hero2 { margin-bottom: 2.25rem; }
@media print {
    body { background: #fff; color: #000; }
}
"""


def _masthead(doc, chart, locale) -> str:
    meta = (f"<span>{_esc(trx('Engine', locale))} "
            f"<b>{_esc(trx(doc['engine'].upper(), locale))}</b></span>"
            f"<span class=\"head-divider\">|</span>"
            f"<span>{_esc(tr('Method', locale))} "
            f"<b>{_esc(trx(doc['method'].capitalize(), locale))}</b></span>"
            f"<span class=\"head-divider\">|</span>"
            f"<span>{_esc(trx('Locale', locale))} "
            f"<b>{_esc(trx(doc['locale'].upper(), locale))}</b></span>"
            f"<span class=\"head-divider\">|</span>"
            f"<span>{_esc(trx('Chart Style', locale))} "
            f"<b>{_esc(trx(chart.capitalize(), locale))}</b></span>")
    brand = trx("Sri Lankan Vedic Astrology Engine", locale)
    return (f"<header class=\"masthead\">"
            f"<div class=\"brand\"><span class=\"brand-name\">"
            f"{_esc(brand)}</span></div>"
            f"<div class=\"meta-row\">{meta}</div></header>")


def _fact_group(title, items, locale, spaced=False) -> str:
    cls = "hero-eyebrow hero-eyebrow--spaced" if spaced else "hero-eyebrow"
    cells = "".join(
        f"<div><div class=\"hero-fact-k\">{_esc(tr(k, locale))}</div>"
        f"<div class=\"hero-fact-v\">{_esc(v)}</div></div>"
        for k, v in items)
    return (f"<p class=\"{cls}\">{_esc(tr(title, locale))}</p>"
            f"<div class=\"hero-facts\">{cells}</div>")


def _hero(doc, locale) -> str:
    lagna = doc["lagna"]
    name, sub = hero_header(doc, locale)
    badge = (f"<div class=\"lagna-badge\">"
             f"{_esc(trv(lagna['rasi'], locale, 'rasis'))}<br/>"
             f"<div class=\"hero-fact-k\">"
             f"{_esc(disp_lon(lagna['degree']))}</div>"
             f"<div class=\"hero-fact-k\"><b>"
             f"{_esc(trv(lagna['navamsa'], locale, 'rasis'))}</b> "
             f"{_esc(trx('navamsa', locale))}</div></div>"
             f"<div class=\"hero-zodiac\">{_zodiac(lagna['rasi'])}</div>")
    head = (f"<div class=\"hero1\"><div>"
            f"<h1 class=\"hero-name\" style=\"color: var(--accent); "
            f"font-weight: 500\">{_esc(name)}</h1>"
            f"<p class=\"hero-sub\" style=\"font-size: 1.25rem;\">"
            f"{_esc(sub)}</p></div>"
            f"<div class=\"hero-side1\">{badge}</div></div>")
    facts = hero_groups(doc, locale)
    groups = _fact_group("Panchanga", facts["panchanga"], locale)
    groups += _fact_group("Hora", facts["hora"], locale, spaced=True)
    groups += _fact_group("Chakra", facts["chakra"], locale, spaced=True)
    return (f"<div class=\"hero2\"><div class=\"hero-main\">"
            f"{head}{groups}</div></div>")


def _matrix(doc, locale) -> str:
    rows = []
    for r in matrix_rows(doc, locale):
        row = (f"<tr><td><b>{_esc(r['planet'])}</b></td>"
               f"<td>{_esc(r['rasi'])}<sup>{r['rasi_num']}</sup></td>"
               f"<td>{_esc(r['lon'])}</td>"
               f"<td>{_esc(r['nakshatra'])}</td>"
               f"<td class=\"num\">{_esc(r['pada'])}</td>")
        for v in r["vargas"]:
            row += f"<td>{_esc(v['rasi'])}<sup>{v['num']}</sup></td>"
        row += f"<td>{_esc(r['avastha'])}</td></tr>"
        rows.append(row)
    head = "".join(f"<th>{_esc(c)}</th>" for c in matrix_headers(locale))
    note = (f"<div class=\"note\"><sup>*</sup>"
            f"{_esc(trx('Superscript numbers show the Rasi sign number.', locale))}"
            f"</div>")
    return (f"<div class=\"group-label\">"
            f"{_esc(trx('Shadvarga Matrix', locale))}</div>"
            f"<article class=\"card card-wide\"><div class=\"table-scroll\">"
            f"<table><thead><tr>{head}</tr></thead>"
            f"<tbody>{''.join(rows)}</tbody></table></div>{note}</article>")


def _charts(doc, chart, locale, gallery) -> str:
    title = (f"<div class=\"group-label\">"
             f"{_esc(trx('Divisional Charts', locale))}</div>")
    if gallery:
        # Legacy path: pre-built HTML (tests / external callers).
        return (f"{title}<article class=\"card card-wide\">"
                f"<div class=\"chart-wrap\">{gallery}</div></article>")
    from jychart import gallery_items

    style = CHART_STYLE.get(chart, chart)
    cards = []
    for _ctitle, varga, lagna_planet, svg in gallery_items(doc, style,
                                                           locale):
        cards.append(
            f"<article class=\"card chart-card\">"
            f"<div class=\"chart-wrap\">{svg}</div></article>")
    return f"{title}<div class=\"charts-grid\">{''.join(cards)}</div>"


def _timeline(doc, locale, detail) -> str:
    blocks = []
    for s in timeline_rows(doc, detail, locale):
        open_attr = " open" if s["open"] else ""
        active_cls = " active" if s["active"] else ""
        bhuktis = []
        for b in s["bhuktis"]:
            b_cls = " active" if b["active"] else ""
            bhuktis.append(
                f"<div class=\"bhukti-row{b_cls}\">"
                f"<span class=\"bh-name\">"
                f"{_esc(b['lord'])}</span>"
                f"<span class=\"bh-span\">{_esc(b['from'])} \u2192 "
                f"{_esc(b['to'])}</span>"
                f"<span class=\"bh-age\"><span class=\"status-label\">"
                f"{_esc(b['status'])}</span></span></div>")
        blocks.append(
            f"<details class=\"maha-block{active_cls}\">{open_attr}>"
            f"<summary><span class=\"maha-lord\">"
            f"{_esc(s['lord'])}</span>"
            f"<span class=\"maha-span\">{_esc(s['from'])} \u2192 "
            f"{_esc(s['to'])}</span>"
            f"<span class=\"maha-age\"><span class=\"status-label\">"
            f"{_esc(s['status'])}</span></span></summary>"
            f"<div class=\"bhukti-list\">{''.join(bhuktis)}</div>"
            f"</details>")
    click_note = trx("Click on each Mahadasa to view its corresponding "
                      "Antardasas.", locale)
    note = (f"<div class=\"note\"><sup>*</sup>{_esc(click_note)}</div>")
    return (f"<div class=\"group-label\">"
            f"{_esc(tr('Mahadasa and Antardasa Timeline', locale))}</div>"
            f"<div class=\"timeline\">{''.join(blocks)}{note}</div>")


def _footer(doc, locale) -> str:
    tm = doc["times"]
    sig = (f"{trx('Schema', locale)} {doc['schema']} \u00b7 "
           f"{trx('Version', locale)} {doc['version']} \u00b7 "
           f"{trx('Universal Time', locale)} {tm['ut']} \u00b7 "
           f"{tr('Julian Date', locale)} {doc['julian_date']} \u00b7 "
           f"{tr('Ayanamsa', locale)} {doc['ayanamsa_deg']}")
    return (f"<footer class=\"footer\"><div class=\"footer-inner\">"
            f"<div class=\"footer-sig\">{_esc(sig)}</div>"
            f"</div></footer>")


def render_report(doc, chart="east", dasa=None, gallery="") -> str:
    locale = doc.get("locale", "en")
    lang = locale if locale in ("en", "si", "ta") else "en"
    parts = [
        "<!DOCTYPE html>",
        f"<html lang=\"{lang}\">",
        "<head>",
        "<meta charset=\"utf-8\"/>",
        ("<meta content=\"width=device-width, initial-scale=1, "
         "viewport-fit=cover\" name=\"viewport\"/>"),
        f"<title>{_esc(doc['name'])} \u2014 Horoscope</title>",
        f"<style>{_font_css()}{CSS}</style>",
        "</head>",
        "<body>",
        "<div class=\"wrap\">",
        _masthead(doc, chart, locale),
        _hero(doc, locale),
        _matrix(doc, locale),
        _charts(doc, chart, locale, gallery),
        _timeline(doc, locale, dasa if dasa else "all"),
        _footer(doc, locale),
        "</div>",
        "</body>",
        "</html>",
    ]
    return "\n".join(parts) + "\n"

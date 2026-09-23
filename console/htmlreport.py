"""Semantic HTML report renderer (pure consumer).

Real <table>/<section>/<h2> with a small stylesheet — not terminal
export. Same doc dict as the Rich renderers; charts embed jyotichart
SVG strings. Print-friendly light theme.
"""
import html as _html

from i18n import tr
from render import (DASA_DISPLAY, KARANA_DISPLAY, YOGA_DISPLAY, ayan_dms, disp, disp_lon, rasi_of)

CSS = """
body{font-family:Georgia,serif;font-size:15px;color:#111;background:#fff;
max-width:1100px;margin:2em auto;padding:0 1em}
h1{font-size:1.6em;border-bottom:2px solid #333;padding-bottom:.2em}
h2{font-size:1.25em;color:#333;border-bottom:1px solid #ccc;
padding-bottom:.15em;margin-top:1.5em}
table{border-collapse:collapse;width:100%;margin:.5em 0}
th,td{border:1px solid #bbb;padding:.3em .6em;text-align:left}
th{background:#f0f0f0}
td.num{text-align:right;font-variant-numeric:tabular-nums}
.maha{font-weight:bold;background:#f7f7f7}
.bhukti td:first-child{padding-left:2em;color:#444}
.charts{display:grid;grid-template-columns:1fr 1fr;gap:1em}
.charts svg{width:100%;height:auto}
.provenance{color:#777;font-size:.85em;margin-top:2em}
@media print{.charts{grid-template-columns:1fr 1fr}}
"""


def _esc(s) -> str:
    return _html.escape(str(s), quote=True)


def _kv_table(title, rows, locale):
    body = "".join(f"<tr><th>{_esc(tr(k, locale))}</th><td>{_esc(v)}</td></tr>"
                   for k, v in rows)
    return f"<section><h2>{_esc(tr(title, locale))}</h2><table>{body}</table></section>"


def _houses_table(doc, locale):
    rows = []
    det = doc.get("details", {})
    for p in doc["longitudes"]:
        d = det.get(p, {})
        rows.append(
            f"<tr><td><b>{_esc(disp(p))}</b></td>"
            f"<td class=\"num\">{_esc(disp_lon(doc['longitudes'][p]))}</td>"
            f"<td>{_esc(d.get('nakshatra', '-'))}</td>"
            f"<td class=\"num\">{_esc(d.get('pada', '-'))}</td>"
            f"<td>{_esc(rasi_of(doc['longitudes'][p]))}</td>"
            f"<td class=\"num\">{_esc(d.get('rasi_longitude', '-').strip())}</td>"
            f"<td>{_esc(doc['avastha'][p] or '-')}</td></tr>")
    head = "".join(f"<th>{c}</th>" for c in
                   ["Graha", "Longitude", "Nakshatra", "Pada", "Rasi",
                    "Rasi Longitude", "Avastha"])
    return (f"<section><h2>{_esc(tr('Nirayana Table of Houses', locale))}</h2>"
            f"<table><tr>{head}</tr>{''.join(rows)}</table></section>")


def _shadvarga_table(doc, locale, positions=False):
    heads = ["Graha", "Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa",
             "Trimshamsa"]
    body = []
    for p in doc["longitudes"]:
        if positions:
            cells = []
            for v in range(6):
                seat = doc["shadvarga"][p][v]
                from kendra import RASIS
                lagna_seat = doc["lagna"]["seats"][v]
                cells.append(str(((RASIS.index(seat) + 1 - lagna_seat) % 12) + 1))
        else:
            cells = [_esc(c) for c in doc["shadvarga"][p]]
        body.append(f"<tr><td><b>{_esc(disp(p))}</b></td>" +
                    "".join(f"<td class=\"num\">{c}</td>" for c in cells) + "</tr>")
    head = "".join(f"<th>{c}</th>" for c in heads)
    title = "Shadvarga Positions" if positions else "Shadvarga Charts"
    return (f"<section><h2>{_esc(tr(title, locale))}</h2>"
            f"<table><tr>{head}</tr>{''.join(body)}</table></section>")


def _dasa_table(doc, locale, detail):
    dasa = doc["dasa"]
    rows = []
    for s in dasa["mahas"]:
        lord = DASA_DISPLAY.get(s["lord"], s["lord"])
        rows.append(
            f"<tr class=\"maha\"><td><b>{_esc(lord)}</b></td>"
            f"<td class=\"num\">{_esc(s['from'])} → {_esc(s['to'])}</td>"
            f"<td class=\"num\">{_esc(s['age'])}</td></tr>")
        if detail == "all" or (detail and detail.lower() in (s["lord"].lower(),
                                                             lord.lower())):
            for b in s.get("bhuktis", []):
                lord_b = DASA_DISPLAY.get(b["lord"], b["lord"])
                rows.append(
                    f"<tr class=\"bhukti\"><td>└ {_esc(lord_b)}</td>"
                    f"<td class=\"num\">{_esc(b['from'])} → {_esc(b['to'])}</td>"
                    f"<td class=\"num\">{_esc(b['age'])}</td></tr>")
    return (f"<section><h2>{_esc(tr('Mahadasa and Antardasa Timeline', locale))}</h2>"
            f"<table><tr><th>Lord</th><th>Span</th><th>Age</th></tr>"
            f"{''.join(rows)}</table></section>")


def render_report(doc, chart="diamond", dasa=None, gallery="") -> str:
    locale = doc.get("locale", "en")
    lagna = doc["lagna"]
    place = doc["place"]
    pg = doc["panchanga"]
    tm = doc["times"]
    parts = [
        "<!DOCTYPE html>",
        "<html><head><meta charset=\"utf-8\">"
        f"<title>{_esc(doc['name'])} — Horoscope</title>"
        f"<style>{CSS}</style></head><body>",
        f"<h1>{_esc(doc['name'])}</h1>",
        _kv_table("Selected Options", [
            ("District", f"{place['city_index']} ({place['city']})"),
            ("Method", doc["method"]), ("Engine", doc["engine"]),
            ("Locale", doc["locale"]), ("Chart", chart)], locale),
        _kv_table("Birth Profile", [
            ("Name", doc["name"]),
            ("Born", f"{doc['birth_date']} {doc['birth_time']}"),
            ("Birth Weekday", pg["weekday"]),
            ("Place", f"{place['city']} ({place['city_index']})"),
            ("Method", doc["method"])], locale),
        _kv_table("Astronomical & Chart Reference", [
            ("Julian Date", f"{doc['julian_date']:.3f}"),
            ("Ayanamsa", ayan_dms(doc["ayanamsa_deg"])),
            ("Lagna", lagna["rasi"]),
            ("Lagna Degree", disp_lon(lagna["degree"])),
            ("Lagna Navamsa", lagna["navamsa"])], locale),
        _kv_table("Time & Solar Metrics", [
            ("Birth Time", tm["birth"]), ("Sinhala Time", tm["sinhala"]),
            ("Sunrise", tm["sunrise"]), ("Sunset", tm["sunset"]),
            ("Universal Time (UT)", tm["ut"]),
            ("Greenwich Mean Sidereal Time", tm["gmst"]),
            ("Local Mean Time (LMT)", tm["lmt"]),
            ("Local Mean Sidereal Time", tm["lmst"])], locale),
        _kv_table("Panchanga", [
            ("Nakshatra", pg["nakshatra"]), ("Nakshatra Pada", pg["pada"]),
            ("Tithi", pg["tithi"]),
            ("Yoga", YOGA_DISPLAY.get(pg["yoga"], pg["yoga"])),
            ("Karana", KARANA_DISPLAY.get(pg["karana"], pg["karana"]))],
            locale),
        _kv_table("Dasa Information", [
            ("Starting", doc["dasa"]["balance_lord"]),
            ("Period", doc["dasa"]["balance"]),
            ("Reference", tr("From birth", locale))], locale),
        _kv_table("Hora", [
            ("Kala", doc["hora"]["kala"]), ("Panchama", doc["hora"]["panchama"]),
            ("Sukshama", doc["hora"]["sukshama"])], locale),
        _kv_table("Chakra", [
            ("Gana", doc["chakra"]["gana"]), ("Yoni", doc["chakra"]["yoni"].strip()),
            ("Linga", doc["chakra"]["linga"]), ("Naadi", doc["chakra"]["naadi"]),
            ("Varna", doc["chakra"]["varna"]), ("Ruxha", doc["chakra"]["ruxha"]),
            ("Paxhi", doc["chakra"]["paxhi"]), ("Gothra", doc["chakra"]["gothra"]),
            ("Rajju", doc["chakra"]["rajju"]), ("Bhutha", doc["chakra"]["bhutha"])],
            locale),
        _houses_table(doc, locale),
        _shadvarga_table(doc, locale),
        _shadvarga_table(doc, locale, positions=True),
        gallery,
        _dasa_table(doc, locale, dasa if dasa else "all"),
        (f"<p class=\"provenance\">schema {doc['schema']} | v{doc['version']} | "
         f"{doc['engine']} | {doc['display']} | {doc['locale']} | "
         f"JD {doc['julian_date']} | ayanamsa {doc['ayanamsa_deg']}</p>"),
        "</body></html>",
    ]
    return "\n".join(parts)

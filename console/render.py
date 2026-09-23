"""Rich rendering for star-horoscope/1 documents (pure consumer).

Reads no engine code: takes the parsed JSON dict from pystar.horoscope()
and renders full-width, terminal-filling tables. Deterministic under a
fixed-width Console (see test_render.py).
"""
from datetime import date

from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.text import Text

from i18n import tr
from kendra import RASIS, houses_from_longitudes, parse_dms, render_diamond
from south import render_south, render_south_from_seats

PLANETS = ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
           "Shani", "Raahu", "Kethu", "Urenus", "Neptune", "Pluto"]

# Modern display spellings (mirror displayPlanet); engine keys stay canonical.
DISPLAY = {"Sikuru": "Shukra", "Raahu": "Rahu", "Kethu": "Ketu",
           "Urenus": "Uranus"}
# Dasa-table spellings to modern display (mirror dasaName).
DASA_DISPLAY = {"Sikuru": "Shukra", "Sandu": "Chandra", "Rahu": "Rahu"}


def disp(planet: str) -> str:
    return DISPLAY.get(planet, planet)


def render_profile(doc, console: Console) -> None:
    born = f"{doc['birth_date']} {doc['birth_time']}"
    place = doc["place"]
    console.print(Panel(
        f"[bold]{doc['name']}[/bold]  |  Born {born}  |  "
        f"{place['city']} ({place['city_index']})  |  {doc['method']}",
        title=tr("Horoscope Profile", doc["locale"]), expand=True))


def render_longitudes(doc, console: Console) -> None:
    t = Table(title=tr("Nirayana Longitudes", doc["locale"]), expand=True)
    t.add_column("Graha", style="bold")
    t.add_column("Longitude", justify="right")
    for p in PLANETS:
        t.add_row(disp(p), disp_lon(doc["longitudes"][p]))
    console.print(t)


def render_provenance(doc, console: Console) -> None:
    console.print(
        f"[dim]schema {doc['schema']} | v{doc['version']} | {doc['engine']} | "
        f"{doc['display']} | {doc['locale']} | JD {doc['julian_date']} | "
        f"ayanamsa {doc['ayanamsa_deg']}[/dim]")


def _kv(title, rows, locale="en") -> Table:
    t = Table(title=tr(title, locale), expand=True, show_header=False, box=None)
    t.add_column("k", style="bold", no_wrap=True)
    t.add_column("v")
    for k, v in rows:
        t.add_row(tr(k, locale), str(v))
    return t


def rasi_of(dms: str) -> str:
    return RASIS[int(parse_dms(dms) // 30) % 12]


def ayan_dms(dec: float) -> str:
    """Decimal degrees to CLI clock form (23.833639 -> 23°50'01")."""
    d = int(dec)
    m = int((dec - d) * 60)
    sec = int(round((((dec - d) * 60) - m) * 60))
    return f"{d}°{m:02d}'{sec:02d}\""


def disp_lon(dms: str) -> str:
    """Schema DMS display-split to CLI clock form (239:07:08 -> 239°07'08")."""
    d, m, sec = dms.strip().split(":")
    return f'{int(d)}°{m}\'{sec}"'


def trim_html(html: str) -> str:
    """Tidy exported HTML: strip trailing spaces per line (leading
    indentation inside <pre> blocks is significant and kept) and
    collapse 3+ blank lines. Never touches line starts."""
    lines = [ln.rstrip() for ln in html.split("\n")]
    out: list = []
    blanks = 0
    for ln in lines:
        if ln.strip() == "":
            blanks += 1
            if blanks <= 2:
                out.append("")
        else:
            blanks = 0
            out.append(ln)
    return "\n".join(out).rstrip() + "\n"


def boost_html(html: str, px: int = 15) -> str:
    """Bump the report base type size (HTML view only — terminal cells
    cannot scale). Injected as one <style> rule, no per-span edits."""
    tag = f"<style>body{{font-size:{px}px}}</style>"
    if "</head>" in html:
        return html.replace("</head>", tag + "</head>", 1)
    return tag + html


def render_reference(doc, console: Console) -> None:
    lagna = doc["lagna"]
    left = _kv("Birth Profile", [
        ("Name", doc["name"]),
        ("Born", f"{doc['birth_date']} {doc['birth_time']}"),
        ("Birth Weekday", doc["panchanga"]["weekday"]),
        ("Place", f"{doc['place']['city']} ({doc['place']['city_index']})"),
        ("Method", doc["method"])], doc["locale"])
    right = _kv("Astronomical & Chart Reference", [
        ("Julian Date", f"{doc['julian_date']:.3f}"),
        ("Ayanamsa", ayan_dms(doc["ayanamsa_deg"])),
        ("Lagna", lagna["rasi"]),
        ("Lagna Degree", disp_lon(lagna["degree"])),
        ("Lagna Navamsa", lagna["navamsa"])], doc["locale"])
    console.print(left)
    console.print(right)


def render_time_panchanga(doc, console: Console) -> None:
    tm = doc["times"]
    left = _kv("Time & Solar Metrics", [
        ("Birth Time", tm["birth"]), ("Sinhala Time", tm["sinhala"]),
        ("Sunrise", tm["sunrise"]), ("Sunset", tm["sunset"]),
        ("Universal Time (UT)", tm["ut"]),
        ("Greenwich Mean Sidereal Time", tm["gmst"]),
        ("Local Mean Time (LMT)", tm["lmt"]),
        ("Local Mean Sidereal Time", tm["lmst"])], doc["locale"])
    pg = doc["panchanga"]
    right = _kv("Panchanga", [
        ("Nakshatra", pg["nakshatra"]),
        ("Pada", pg["pada"]), ("Tithi", pg["tithi"]),
        ("Yoga", pg["yoga"]), ("Karana", pg["karana"])], doc["locale"])
    console.print(left)
    console.print(right)


def render_houses(doc, console: Console) -> None:
    t = Table(title=tr("Nirayana Table of Houses", doc["locale"]), expand=True)
    t.add_column("Graha", style="bold")
    t.add_column("Longitude", justify="right")
    t.add_column("Nakshatra")
    t.add_column("Pada", justify="right")
    t.add_column("Rasi")
    t.add_column("Rasi Longitude", justify="right")
    t.add_column("Avastha")
    det = doc.get("details", {})
    for p in PLANETS:
        lon = doc["longitudes"][p]
        d = det.get(p, {})
        t.add_row(disp(p), disp_lon(lon), d.get("nakshatra", "-"),
                  str(d.get("pada", "-")), rasi_of(lon),
                  d.get("rasi_longitude", "-").strip(),
                  doc["avastha"][p] or "-")
    console.print(t)


def render_shadvarga(doc, console: Console) -> None:
    t = Table(title=tr("Shadvarga Charts", doc["locale"]), expand=True)
    t.add_column("Graha", style="bold")
    for h in ["Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"]:
        t.add_column(h)
    for p in PLANETS:
        t.add_row(disp(p), *doc["shadvarga"][p])
    console.print(t)


def _iso(s: str) -> date:
    y, m, d = s.split("-")
    return date(int(y), int(m), int(d))


def render_dasa(doc, console: Console, detail=None) -> None:
    """detail: None (bars + all Antardasa), or a maha lord to narrow."""
    if detail is None:
        detail = "all"
    dasa = doc["dasa"]
    spans = dasa["mahas"]
    t = Table(title=tr("Mahadasa and Antardasa Timeline", doc["locale"]) +
                    f" (balance {dasa['balance_lord']} {dasa['balance']})",
              expand=True, show_header=False, box=None)
    t.add_column("name", style="bold", no_wrap=True, width=12)
    t.add_column("span", no_wrap=True)
    for s in spans:
        lord = DASA_DISPLAY.get(s["lord"], s["lord"])
        t.add_row(Text(lord, style="bold"),
                  Text(f"{s['from']} → {s['to']} ({s['age']})", style="bold"))
        if detail == "all" or (detail and detail.lower() in (s["lord"].lower(), lord.lower())):
            for b in s.get("bhuktis", []):
                t.add_row("  └ " + DASA_DISPLAY.get(b["lord"], b["lord"]),
                          Text(f"{b['from']} → {b['to']} ({b['age']})", style="dim"))
    console.print(t)


def render_hora_chakra(doc, console: Console) -> None:
    hh = doc["hora"]
    left = _kv("Hora", [
        ("Kala", hh["kala"]), ("Panchama", hh["panchama"]),
        ("Sukshama", hh["sukshama"])], doc["locale"])
    cc = doc["chakra"]
    right = _kv("Chakra", [
        ("Gana", cc["gana"]), ("Yoni", cc["yoni"].strip()),
        ("Linga", cc["linga"]), ("Naadi", cc["naadi"]),
        ("Varna", cc["varna"]), ("Ruxha", cc["ruxha"]),
        ("Paxhi", cc["paxhi"]), ("Gothra", cc["gothra"]),
        ("Rajju", cc["rajju"]), ("Bhutha", cc["bhutha"])], doc["locale"])
    console.print(left)
    console.print(right)


def render_dasa_info(doc, console: Console) -> None:
    dasa = doc["dasa"]
    console.print(_kv("Dasa Information", [
        ("Starting", dasa["balance_lord"]),
        ("Period", dasa["balance"]),
        ("Reference", tr("From birth", doc["locale"]))], doc["locale"]))


def render_options(doc, console: Console, chart: str) -> None:
    place = doc["place"]
    console.print(_kv("Selected Options", [
        ("District", f"{place['city_index']} ({place['city']})"),
        ("Method", doc["method"]),
        ("Engine", doc["engine"]),
        ("Locale", doc["locale"]),
        ("Chart", chart)], doc["locale"]))


CHART_DEFS = [
    ("Lagna Chart", 0, None),
    ("Navamsa Chart", 1, None),
    ("Hora Chart", 2, None),
    ("Drekkana Chart", 3, None),
    ("Dvadasamsa Chart", 4, None),
    ("Trimshamsa Chart", 5, None),
    ("Sun Chart", 0, "Ravi"),
    ("Moon Chart", 0, "Chandra"),
]


def chart_data(doc, varga: int, lagna_planet=None):
    """(houses, seats, lagna_seat): seats maps planet -> rasi index."""
    seats = {}
    for p in PLANETS:
        seats[p] = RASIS.index(doc["shadvarga"][p][varga]) + 1
    lagna_seat = seats[lagna_planet] if lagna_planet else doc["lagna"]["seats"][varga]
    houses: dict = {i: [] for i in range(1, 13)}
    for p in PLANETS:
        if p == "Lagna":
            continue
        houses[((seats[p] - lagna_seat) % 12) + 1].append(p)
    return houses, seats, lagna_seat


def render_charts(doc, console: Console, style: str) -> None:
    if style == "none":
        return
    use = style if style in ("diamond", "south") else "diamond"
    for title, varga, lagna_planet in CHART_DEFS:
        houses, seats, lagna_seat = chart_data(doc, varga, lagna_planet)
        if use == "south":
            render_south_from_seats(seats, lagna_seat, console, title=title)
        else:
            render_diamond(seats, lagna_seat, console, title=title)


def render_positions(doc, console: Console) -> None:
    t = Table(title=tr("Shadvarga Positions", doc["locale"]), expand=True)
    t.add_column("Graha", style="bold")
    for h in ["Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"]:
        t.add_column(h, justify="right")
    for p in PLANETS:
        row = [p]
        for v in range(6):
            seat = RASIS.index(doc["shadvarga"][p][v]) + 1
            lagna_seat = doc["lagna"]["seats"][v]
            row.append(str(((seat - lagna_seat) % 12) + 1))
        t.add_row(disp(row[0]), *row[1:])
    console.print(t)


def render_all(doc, console: Console, chart: str = "diamond", dasa=None) -> None:
    render_profile(doc, console)
    render_options(doc, console, chart)
    render_reference(doc, console)
    render_time_panchanga(doc, console)
    render_dasa_info(doc, console)
    render_hora_chakra(doc, console)
    render_houses(doc, console)
    render_shadvarga(doc, console)
    render_positions(doc, console)
    render_charts(doc, console, chart)
    render_dasa(doc, console, dasa)
    render_provenance(doc, console)

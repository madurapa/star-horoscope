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

from kendra import RASIS, houses_from_longitudes, parse_dms, render_diamond
from south import render_south

PLANETS = ["Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
           "Shani", "Raahu", "Kethu", "Urenus", "Neptune", "Pluto"]


def render_profile(doc, console: Console) -> None:
    born = f"{doc['birth_date']} {doc['birth_time']}"
    place = doc["place"]
    console.print(Panel(
        f"[bold]{doc['name']}[/bold]  |  Born {born}  |  "
        f"{place['city']} ({place['city_index']})  |  {doc['method']}",
        title="Horoscope Profile", expand=True))


def render_longitudes(doc, console: Console) -> None:
    t = Table(title="Nirayana Longitudes", expand=True)
    t.add_column("Graha", style="bold")
    t.add_column("Longitude", justify="right")
    for p in PLANETS:
        t.add_row(p, doc["longitudes"][p])
    console.print(t)


def render_provenance(doc, console: Console) -> None:
    console.print(
        f"[dim]schema {doc['schema']} | v{doc['version']} | {doc['engine']} | "
        f"{doc['display']} | {doc['locale']} | JD {doc['julian_date']} | "
        f"ayanamsa {doc['ayanamsa_deg']}[/dim]")


def _kv(title, rows) -> Table:
    t = Table(title=title, expand=True, show_header=False, box=None)
    t.add_column("k", style="bold", no_wrap=True)
    t.add_column("v")
    for k, v in rows:
        t.add_row(k, str(v))
    return t


def rasi_of(dms: str) -> str:
    return RASIS[int(parse_dms(dms) // 30) % 12]


def render_reference(doc, console: Console) -> None:
    lagna = doc["lagna"]
    left = _kv("Birth Profile", [
        ("Name", doc["name"]),
        ("Born", f"{doc['birth_date']} {doc['birth_time']}"),
        ("Place", f"{doc['place']['city']} ({doc['place']['city_index']})"),
        ("Method", doc["method"])])
    right = _kv("Chart Reference", [
        ("Lagna", lagna["rasi"]),
        ("Degree", lagna["degree"].strip()),
        ("Navamsa", lagna["navamsa"])])
    console.print(left)
    console.print(right)


def render_time_panchanga(doc, console: Console) -> None:
    tm = doc["times"]
    left = _kv("Time & Solar Metrics", [
        ("Birth", tm["birth"]), ("Sinhala", tm["sinhala"]),
        ("Sunrise", tm["sunrise"]), ("Sunset", tm["sunset"]),
        ("UT", tm["ut"]), ("LMST", tm["lmst"])])
    pg = doc["panchanga"]
    right = _kv("Panchanga", [
        ("Weekday", pg["weekday"]), ("Nakshatra", pg["nakshatra"]),
        ("Pada", pg["pada"]), ("Tithi", pg["tithi"]),
        ("Yoga", pg["yoga"]), ("Karana", pg["karana"])])
    console.print(left)
    console.print(right)


def render_houses(doc, console: Console) -> None:
    t = Table(title="Nirayana Table of Houses", expand=True)
    t.add_column("Graha", style="bold")
    t.add_column("Longitude", justify="right")
    t.add_column("Rasi")
    t.add_column("House", justify="right")
    t.add_column("Avastha")
    for p in PLANETS:
        lon = doc["longitudes"][p]
        t.add_row(p, lon, rasi_of(lon), str(doc["houses"][p]),
                  doc["avastha"][p] or "-")
    console.print(t)


def render_shadvarga(doc, console: Console) -> None:
    t = Table(title="Shadvarga Seats", expand=True)
    t.add_column("Graha", style="bold")
    for h in ["Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"]:
        t.add_column(h)
    for p in PLANETS:
        t.add_row(p, *doc["shadvarga"][p])
    console.print(t)


def _iso(s: str) -> date:
    y, m, d = s.split("-")
    return date(int(y), int(m), int(d))


def render_dasa(doc, console: Console, detail=None) -> None:
    """detail: None (bars only), "all", or a maha lord name to expand."""
    dasa = doc["dasa"]
    spans = dasa["mahas"]
    t0 = _iso(spans[0]["from"])
    total = max((_iso(spans[-1]["to"]) - t0).days, 1)
    width = max(console.width - 34, 20)
    t = Table(title=f"Mahadasa Timeline (balance {dasa['balance_lord']} "
                    f"{dasa['balance']})", expand=True, show_header=False,
              box=None)
    t.add_column("lord", style="bold", no_wrap=True, width=12)
    t.add_column("bar", ratio=1)
    t.add_column("span", no_wrap=True)
    for s in spans:
        days = (_iso(s["to"]) - _iso(s["from"])).days
        fill = max(int(days / total * width), 1)
        bar = Text("▉" * fill + "░" * (width - fill), style="yellow")
        t.add_row(s["lord"], bar, f"{s['from']} → {s['to']}")
        if detail == "all" or (detail and detail.lower() == s["lord"].lower()):
            for b in s.get("bhuktis", []):
                t.add_row("  └ " + b["lord"],
                          Text(f"{b['from']} → {b['to']}", style="dim"),
                          Text(b["age"], style="dim"))
    console.print(t)


def render_hora_chakra(doc, console: Console) -> None:
    hh = doc["hora"]
    left = _kv("Hora", [
        ("Kala", hh["kala"]), ("Panchama", hh["panchama"]),
        ("Sukshama", hh["sukshama"])])
    cc = doc["chakra"]
    right = _kv("Chakra", [
        ("Gana", cc["gana"]), ("Yoni", cc["yoni"].strip()),
        ("Linga", cc["linga"]), ("Naadi", cc["naadi"]),
        ("Varna", cc["varna"]), ("Ruxha", cc["ruxha"]),
        ("Paxhi", cc["paxhi"]), ("Gothra", cc["gothra"]),
        ("Rajju", cc["rajju"]), ("Bhutha", cc["bhutha"])])
    console.print(left)
    console.print(right)


def render_all(doc, console: Console, chart: str = "diamond", dasa=None) -> None:
    render_profile(doc, console)
    render_reference(doc, console)
    render_time_panchanga(doc, console)
    render_houses(doc, console)
    render_shadvarga(doc, console)
    houses, lagna_rasi = houses_from_longitudes(doc["longitudes"])
    if chart == "south":
        render_south(doc["longitudes"], lagna_rasi, console)
    else:
        render_diamond(houses, lagna_rasi, console)
    render_dasa(doc, console, dasa)
    render_hora_chakra(doc, console)
    render_provenance(doc, console)

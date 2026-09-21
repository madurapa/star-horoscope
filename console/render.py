"""Rich rendering for star-horoscope/1 documents (pure consumer).

Reads no engine code: takes the parsed JSON dict from pystar.horoscope()
and renders full-width, terminal-filling tables. Deterministic under a
fixed-width Console (see test_render.py).
"""
from rich.console import Console
from rich.panel import Panel
from rich.table import Table

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


def render_all(doc, console: Console) -> None:
    render_profile(doc, console)
    render_longitudes(doc, console)
    render_provenance(doc, console)

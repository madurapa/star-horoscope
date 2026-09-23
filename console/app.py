"""star-console: full-width rich front-end over pystar (pure consumer)."""
import json

import typer
from rich.console import Console

from render import render_all

app = typer.Typer(add_completion=False)


@app.command()
def horoscope(
    name: str = typer.Option(..., "--name"),
    year: int = typer.Option(..., "--year"),
    month: int = typer.Option(..., "--month"),
    day: int = typer.Option(..., "--day"),
    hour: int = typer.Option(..., "--hour"),
    minute: int = typer.Option(..., "--minute"),
    city: int = typer.Option(..., "--city"),
    nirayana: bool = typer.Option(True, "--nirayana/--sayana"),
    engine: str = typer.Option("swisseph", "--engine"),
    locale: str = typer.Option("en", "--locale"),
    width: int = typer.Option(None, "--width", help="Console width (auto-detect)"),
    chart: str = typer.Option("east", "--chart",
                              help="Chart style: east (Sri Lankan diamond, default), "
                              "north (fixed houses, CLI-like) or south (fixed signs)"),
    dasa: str = typer.Option(None, "--dasa",
                             help="Expand bhukti detail: a maha lord or 'all'"),
    export_html: str = typer.Option(None, "--export-html",
                                    help="Write a self-contained HTML report"),
) -> None:
    import pystar

    if chart not in ("north", "south", "east", "diamond", "none"):
        raise typer.BadParameter("--chart wants north|south|east")
    doc = json.loads(pystar.horoscope(
        name, year, month, day, hour, minute, city,
        nirayana=nirayana, engine=engine, locale=locale))
    if export_html:
        from htmlreport import render_report
        from jychart import gallery

        style = {"diamond": "north"}.get(chart, chart)
        html = render_report(doc, chart=chart, dasa=dasa,
                             gallery=gallery(doc, style, locale))
        with open(export_html, "w", encoding="utf-8") as f:
            f.write(html)
        print(f"wrote {export_html}")
        return
    render_all(doc, Console(width=width), chart=chart, dasa=dasa)


if __name__ == "__main__":
    app()

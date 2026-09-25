"""star-console: full-width rich front-end over pystar (pure consumer)."""
import json
import sys

import typer
from rich.console import Console

from render import render_all

app = typer.Typer(add_completion=False)


@app.command()
def horoscope(
    # Required birth fields prompt interactively when missing, so the
    # frozen double-clickable binary works with no flags at all.
    name: str = typer.Option(..., "--name", prompt="Full name"),
    year: int = typer.Option(..., "--year", prompt="Birth year"),
    month: int = typer.Option(..., "--month", prompt="Birth month (1-12)"),
    day: int = typer.Option(..., "--day", prompt="Birth day"),
    hour: int = typer.Option(..., "--hour", prompt="Birth hour (0-23)"),
    minute: int = typer.Option(..., "--minute", prompt="Birth minute"),
    city: int = typer.Option(..., "--city", prompt="District number"),
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
    if export_html is None and sys.stdin.isatty():
        # Interactive (double-clickable binary) only: scripts pipe stdin.
        export_html = typer.prompt("HTML report path (blank to skip)",
                                   default="") or None
    doc = json.loads(pystar.horoscope(
        name, year, month, day, hour, minute, city,
        nirayana=nirayana, engine=engine, locale=locale))
    if export_html:
        from htmlreport import render_report

        html = render_report(doc, chart=chart, dasa=dasa)
        with open(export_html, "w", encoding="utf-8") as f:
            f.write(html)
        print(f"wrote {export_html}")
        return
    render_all(doc, Console(width=width), chart=chart, dasa=dasa)


if __name__ == "__main__":
    app()

"""star-console: full-width rich front-end over services (pure consumer)."""
import os
import sys

import typer
from rich.console import Console

from render import render_all
from services import ServiceError, compute

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
    latdeg: int = typer.Option(None, "--latdeg", help="Manual latitude degrees"),
    latmin: int = typer.Option(None, "--latmin", help="Manual latitude minutes"),
    londeg: int = typer.Option(None, "--londeg", help="Manual longitude degrees"),
    lonmin: int = typer.Option(None, "--lonmin", help="Manual longitude minutes"),
    thathkala: bool = typer.Option(False, "--thathkala",
                                   help="Thathkala Kendra mode (time now, Colombo)"),
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
    export_pdf: str = typer.Option(None, "--export-pdf",
                                   help="Write the dedicated print-layout PDF"),
) -> None:
    if chart not in ("north", "south", "east", "diamond", "none"):
        raise typer.BadParameter("--chart wants north|south|east")
    if export_html is None and sys.stdin.isatty():
        # Interactive (double-clickable binary) only: scripts pipe stdin.
        export_html = typer.prompt("HTML report path (blank to skip)",
                                   default="") or None
    try:
        doc = compute(name, year, month, day, hour, minute, city,
                      nirayana=nirayana, engine=engine, locale=locale,
                      lat_deg=latdeg, lat_min=latmin, lon_deg=londeg,
                      lon_min=lonmin, thathkala=thathkala)
    except ServiceError as e:
        raise typer.BadParameter(str(e))
    if export_html:
        from htmlreport import render_report

        html = render_report(doc, chart=chart, dasa=dasa)
        with open(export_html, "w", encoding="utf-8") as f:
            f.write(html)
        print(f"wrote {export_html}")
        return
    if export_pdf:
        # Qt lives in the GUI build, not the lean frozen binary: fail
        # with guidance instead of a traceback when it is absent.
        try:
            import PySide6  # noqa: F401
        except ImportError:
            print("PDF export needs the GUI build (star-gui) or "
                  "pip-installed PySide6-Essentials.", file=sys.stderr)
            raise typer.Exit(2)
        _root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        if _root not in sys.path:
            sys.path.insert(0, _root)
        from gui.pdf import export_pdf as write_pdf

        print(f"wrote {write_pdf(doc, export_pdf)}")
        return
    render_all(doc, Console(width=width), chart=chart, dasa=dasa)


if __name__ == "__main__":
    app()

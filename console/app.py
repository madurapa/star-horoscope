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
    chart: str = typer.Option("diamond", "--chart",
                              help="Chart style: diamond (Sri Lankan) or south"),
    dasa: str = typer.Option(None, "--dasa",
                             help="Expand bhukti detail: a maha lord or 'all'"),
    export_html: str = typer.Option(None, "--export-html",
                                    help="Write a self-contained HTML report"),
) -> None:
    import pystar

    if chart not in ("diamond", "south"):
        raise typer.BadParameter("--chart wants diamond|south")
    doc = json.loads(pystar.horoscope(
        name, year, month, day, hour, minute, city,
        nirayana=nirayana, engine=engine, locale=locale))
    if export_html:
        from jychart import gallery
        from render import boost_html, trim_html

        style = chart if chart in ("diamond", "south") else "diamond"
        rec = Console(width=width, record=True)
        render_all(doc, rec, chart="none", dasa=dasa)
        html = rec.export_html(inline_styles=True)
        html = html.replace("</body>", gallery(doc, style, locale) + "\n</body>")
        with open(export_html, "w", encoding="utf-8") as f:
            f.write(boost_html(trim_html(html)))
        print(f"wrote {export_html}")
        return
    render_all(doc, Console(width=width), chart=chart, dasa=dasa)


if __name__ == "__main__":
    app()

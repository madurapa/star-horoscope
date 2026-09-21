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
) -> None:
    import pystar

    doc = json.loads(pystar.horoscope(
        name, year, month, day, hour, minute, city,
        nirayana=nirayana, engine=engine, locale=locale))
    render_all(doc, Console(width=width))


if __name__ == "__main__":
    app()

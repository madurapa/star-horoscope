"""South Indian square chart (fixed-sign 4x4, pure consumer).

Rasis sit in fixed cells; planets are placed by rasi (derived from schema
DMS strings client-side). Center 2x2 carries the Lagna rasi. The diamond
(kendra.py) stays the default --chart; this is the option.
"""
from rich.console import Console
from rich.text import Text

from kendra import RASIS, planet_style

# Fixed rasi per grid cell (None = center block).
GRID = [
    [12, 1, 2, 3],
    [11, None, None, 4],
    [10, None, None, 5],
    [9, 8, 7, 6],
]


def render_south_from_seats(seats: dict, lagna_rasi: int, console: Console,
                          box_w: int = 17, title: str = "Rasi Chart") -> None:
    box_w = max(13, box_w)
    inner = box_w - 2
    by_rasi: dict = {i: [] for i in range(1, 13)}
    for p, r in seats.items():
        by_rasi[r].append(p)

    def cell_lines(rasi, planets, hl):
        names = planets[:3]
        lines = [(f"{RASIS[rasi - 1]}", "dim" if not hl else "bold yellow", hl)]
        for p in names:
            lines.append((p.center(inner)[:inner], planet_style(p), hl))
        for _ in range(3 - len(names)):
            lines.append((" " * inner, "", hl))
        return lines

    height = 4  # rasi line + 3 planet lines per cell
    # Build each grid row: 1 text line (rasi) + 3 planet lines, boxed.
    out_lines: list = []
    for gr in GRID:
        # top borders
        top = Text()
        for rasi in gr:
            if rasi is None:
                top.append(" " * (box_w + 1))
            else:
                hl = (rasi == lagna_rasi)
                top.append("┌" + "─" * inner + "┐ ", style="bold yellow" if hl else "")
        out_lines.append(top)
        rows = []
        for rasi in gr:
            if rasi is None:
                rows.append(None)
            else:
                rows.append(cell_lines(rasi, by_rasi[rasi], rasi == lagna_rasi))
        for li in range(height):
            line = Text()
            for entry in rows:
                if entry is None:
                    line.append(" " * (box_w + 1))
                    continue
                txt, st, hl = entry[li]
                pad = inner - len(txt)
                left, right = pad // 2, pad - pad // 2
                seg = "│" + " " * left + txt + " " * right + "│ "
                start = len(line.plain)
                line.append(seg)
                if st:
                    line.stylize(st, start + 1, start + 1 + inner)
                if hl:
                    line.stylize("bold yellow", start, start + len(seg))
            out_lines.append(line)
        bot = Text()
        for rasi in gr:
            if rasi is None:
                bot.append(" " * (box_w + 1))
            else:
                hl = (rasi == lagna_rasi)
                bot.append("└" + "─" * inner + "┘ ", style="bold yellow" if hl else "")
        out_lines.append(bot)
    # Center block: lagna label over the middle gap rows.
    console.print(Text(f"─── {title} (South Indian square) ───", style="bold"))
    for line in out_lines:
        console.print(line)
    console.print(Text(f"✦ {RASIS[lagna_rasi - 1]} Lagna ✦",
                       style="bold yellow", justify="center"))


def render_south(longitudes: dict, lagna_rasi: int, console: Console,
                 box_w: int = 17, title: str = "Rasi Chart") -> None:
    from kendra import parse_dms as _parse

    seats = {}
    for p, v in longitudes.items():
        if p == "Lagna":
            continue
        seats[p] = int(_parse(v) // 30) + 1
    render_south_from_seats(seats, lagna_rasi, console, box_w, title)

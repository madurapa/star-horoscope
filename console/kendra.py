"""Sri Lankan diamond chart renderer (modernized, pure consumer).

Geometry: 12 house boxes in fixed diamond positions (house 1 = Lagna at
top); no diagonals — roomy boxes instead of the cramped DOS cells. Color:
house numbers dim, benefics green, malefics red, others yellow, the Lagna
box border highlighted. Width-responsive via box width (min 11 chars).

Input is house placements (1-12 -> planet display names) plus the rasi of
house 1; use houses_from_longitudes() to derive them from schema-v1 DMS
strings. South-Indian square and other styles plug in as alternative
renderers later — this diamond stays the default.
"""
from rich.console import Console
from rich.text import Text

RASIS = ["Mesha", "Vrishabha", "Mithuna", "Kataka", "Simha", "Kanya",
         "Tula", "Vrishchika", "Dhanu", "Makara", "Kumbha", "Meena"]

BENEFICS = {"Guru", "Sikuru", "Chandra", "Budha"}
MALEFICS = {"Ravi", "Kuja", "Shani", "Raahu", "Kethu"}

# Modern display spellings (mirror displayPlanet; keep engine keys for logic).
DISPLAY = {"Sikuru": "Shukra", "Raahu": "Rahu", "Kethu": "Ketu",
           "Urenus": "Uranus"}

# Diamond rows: (house, x cell) with cell width unit; center gap holds Lagna.
ROWS = [
    [(1, 2)],
    [(2, 1), (12, 3)],
    [(3, 0), (11, 4)],
    [(4, 1), (10, 3)],
    [(5, 0), (9, 4)],
    [(6, 1), (8, 3)],
    [(7, 2)],
]


def parse_dms(s: str) -> float:
    d, m, sec = s.strip().split(":")
    return int(d) + int(m) / 60.0 + int(sec) / 3600.0


def houses_from_longitudes(longitudes: dict) -> tuple:
    """(houses, lagna_rasi): houses maps 1-12 -> [planet names]."""
    dec = {p: parse_dms(v) for p, v in longitudes.items()}
    lagna_rasi = int(dec["Lagna"] // 30) + 1
    houses: dict = {i: [] for i in range(1, 13)}
    for p, lon in dec.items():
        if p == "Lagna":
            continue
        rasi = int(lon // 30) + 1
        house = ((rasi - lagna_rasi) % 12) + 1
        houses[house].append(p)
    return houses, lagna_rasi


def planet_style(planet: str) -> str:
    if planet in BENEFICS:
        return "green"
    if planet in MALEFICS:
        return "red"
    return "yellow"


def render_diamond(houses: dict, lagna_rasi: int, console: Console,
                   box_w: int = 17, title: str = "Rasi Chart") -> None:
    box_w = max(11, box_w)
    inner = box_w - 2
    lines: list = []

    def box_top(hl: bool) -> tuple:
        return ("┌" + "─" * inner + "┐", "", hl)

    def box_bottom(hl: bool) -> tuple:
        return ("└" + "─" * inner + "┘", "", hl)

    def box_line(text: str, style: str, hl: bool) -> tuple:
        pad = inner - len(text)
        left, right = pad // 2, pad - pad // 2
        return ("│" + " " * left + text + " " * right + "│", style, hl)

    # Pre-render each house box as (line, style) runs.
    boxes: dict = {}
    for h in range(1, 13):
        hl = (h == 1)
        rasi = RASIS[(lagna_rasi - 1 + h - 1) % 12]
        bl = [box_top(hl)]
        bl.append((f"{h} · {rasi}".center(inner)[:inner], "dim", hl))
        names = houses.get(h, [])
        for p in names[:3]:
            bl.append((DISPLAY.get(p, p).center(inner)[:inner], planet_style(p), hl))
        for _ in range(3 - len(names[:3])):
            bl.append((" " * inner, "", hl))
        bl.append(box_bottom(hl))
        boxes[h] = bl
    height = len(next(iter(boxes.values())))

    unit = box_w + 1
    width_cells = 5 * unit
    lagna_name = RASIS[lagna_rasi - 1]
    for ri, row in enumerate(ROWS):
        for li in range(height):
            # absolute placement on a char canvas per line
            canvas = [" "] * width_cells
            spans = []
            for (h, x) in row:
                off = x * unit
                txt, st, hl = boxes[h][li]
                for ci, ch in enumerate(txt):
                    canvas[off + ci] = ch
                if st:
                    spans.append((off, off + len(txt), st))
                if hl:
                    spans.append((off, off + len(txt), "bold yellow"))
            line = Text("".join(canvas).rstrip())
            for (a, b, st) in spans:
                line.stylize(st, a, min(b, len(line.plain)))
            if ri == 3 and li == 0:
                tag = f" ✦ {lagna_name} Lagna ✦"
                line.append(tag, style="bold yellow")
            lines.append(line)
    console.print(Text(f"─── {title} (Sri Lankan diamond) ───", style="bold"))
    for line in lines:
        console.print(line)

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
           "Urenus": "Uranus", "Ravi": "Surya"}

# Diamond rows: (house, x cell). Fixed-HOUSE slots like the DOS original:
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
    """Fixed-house diamond: house slots pinned (1 top-center,
    anti-clockwise), signs rotate. Matches the CLI kendra charts."""
    box_w = max(13, box_w)
    inner = box_w - 2

    def top(hl: bool) -> tuple:
        return ("┌" + "─" * inner + "┐", "", hl)

    def bottom(hl: bool) -> tuple:
        return ("└" + "─" * inner + "┘", "", hl)

    def sline(text: str, style: str, hl: bool) -> tuple:
        text = text.center(inner)[:inner]
        pad = inner - len(text)
        left, right = pad // 2, pad - pad // 2
        return ("│" + " " * left + text + " " * right + "│", style, hl)

    boxes: dict = {}
    for h in range(1, 13):
        hl = (h == 1)
        rasi = RASIS[(lagna_rasi - 1 + h - 1) % 12]
        bl = [top(hl)]
        bl.append(sline(f"{h} · {rasi}", "bold yellow" if hl else "dim", hl))
        names = houses.get(h, [])
        for p in names[:3]:
            bl.append(sline(DISPLAY.get(p, p), planet_style(p), hl))
        for _ in range(3 - len(names[:3])):
            bl.append(sline(" ", "", hl))
        bl.append(bottom(hl))
        boxes[h] = bl

    unit = box_w + 1
    width_cells = 5 * unit
    lagna_name = RASIS[lagna_rasi - 1]
    lines = []
    for ri, row in enumerate(ROWS):
        height = max(len(boxes[h]) for h, _ in row)
        for li in range(height):
            canvas = [" "] * width_cells
            spans = []
            for h, x in row:
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
                line.append(f" ✦ {lagna_name} Lagna ✦", style="bold yellow")
            lines.append(line)
    console.print(Text(f"─── {title} (diamond) ───", style="bold"))
    for line in lines:
        console.print(line)

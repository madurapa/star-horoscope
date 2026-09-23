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

# Diamond rows: (kind, x cell, payload). Singletons hold one sign;
# pairs hold the two triangle signs of a corner box (upper, lower).
ROWS = [
    [("s", 2, 1)],
    [("p", 1, (2, 3)), ("p", 3, (12, 11))],
    [("s", 0, 4), ("s", 4, 10)],
    [("p", 1, (5, 6)), ("p", 3, (9, 8))],
    [("s", 2, 7)],
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


def render_diamond(seats: dict, lagna_rasi: int, console: Console,
                   box_w: int = 17, title: str = "Rasi Chart") -> None:
    """East Indian fixed-sign diamond: signs pinned per the corner table,
    planets placed by rasi, houses counted anti-clockwise from Lagna."""
    box_w = max(13, box_w)
    inner = box_w - 2

    def house_of(sign: int) -> int:
        return ((sign - lagna_rasi) % 12) + 1

    def top(hl: bool) -> tuple:
        return ("┌" + "─" * inner + "┐", "", hl)

    def bottom(hl: bool) -> tuple:
        return ("└" + "─" * inner + "┘", "", hl)

    def mid(hl: bool) -> tuple:
        return ("├" + "─" * inner + "┤", "", hl)

    def sline(text: str, style: str, hl: bool) -> tuple:
        text = text.center(inner)[:inner]
        pad = inner - len(text)
        left, right = pad // 2, pad - pad // 2
        return ("│" + " " * left + text + " " * right + "│", style, hl)

    def planets(sign: int):
        return [p for p in seats if seats[p] == sign]

    boxes: dict = {}

    def single(sign: int):
        key = ("s", sign)
        hl = (sign == lagna_rasi)
        bl = [top(hl)]
        bl.append(sline(f"{house_of(sign)} · {RASIS[sign - 1]}",
                        "bold yellow" if hl else "dim", hl))
        names = planets(sign)
        for p in names[:3]:
            bl.append(sline(DISPLAY.get(p, p), planet_style(p), hl))
        for _ in range(3 - len(names[:3])):
            bl.append(sline(" ", "", hl))
        bl.append(bottom(hl))
        boxes[key] = bl

    def pair(upper: int, lower: int):
        key = ("p", upper, lower)
        hl = lagna_rasi in (upper, lower)
        bl = [top(hl)]
        for sign in (upper, lower):
            mark = "◆ " if sign == lagna_rasi else ""
            bl.append(sline(f"{mark}{house_of(sign)} · {RASIS[sign - 1]}",
                            "bold yellow" if sign == lagna_rasi else "dim", hl))
            names = planets(sign)
            for p in names[:2]:
                bl.append(sline(DISPLAY.get(p, p), planet_style(p), hl))
            for _ in range(2 - len(names[:2])):
                bl.append(sline(" ", "", hl))
            bl.append(mid(hl) if sign == upper else bottom(hl))
        boxes[key] = bl

    for row in ROWS:
        for kind, _, payload in row:
            if kind == "s":
                single(payload)
            else:
                pair(*payload)

    unit = box_w + 1
    width_cells = 5 * unit
    lines = []
    for row in ROWS:
        runs = []
        for kind, x, payload in row:
            key = (kind, payload) if kind == "s" else (kind, *payload)
            runs.append((x * unit, boxes[key]))
        height = max(len(r) for _, r in runs)
        for li in range(height):
            canvas = [" "] * width_cells
            spans = []
            for off, run in runs:
                txt, st, hl = run[li]
                for ci, ch in enumerate(txt):
                    canvas[off + ci] = ch
                if st:
                    spans.append((off, off + len(txt), st))
                if hl:
                    spans.append((off, off + len(txt), "bold yellow"))
            line = Text("".join(canvas).rstrip())
            for (a, b, st) in spans:
                line.stylize(st, a, min(b, len(line.plain)))
            lines.append(line)
    console.print(Text(f"─── {title} (East Indian diamond) ───", style="bold"))
    for line in lines:
        console.print(line)

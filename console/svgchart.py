"""Hand-rolled SVG charts (zero new dependencies).

Same data as the rich renderers, real vector output for HTML export and
any future GUI. Diamond = East Indian/Maithili method (house slots from
Lagna, anti-clockwise); square = fixed-sign South Indian grid.
"""
from kendra import RASIS

GREEN, RED, YELLOW, DIM, GOLD = "#4caf50", "#e57373", "#ffd54f", "#9e9e9e", "#ffb300"


def _esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def _fill(planet: str) -> str:
    from kendra import BENEFICS, MALEFICS
    if planet in BENEFICS:
        return GREEN
    if planet in MALEFICS:
        return RED
    return YELLOW


# (house, x cell, y row) diamond formation; unit cell 120x110.
DIAMOND = [
    (1, 2, 0),
    (2, 1, 1), (12, 3, 1),
    (3, 0, 2), (11, 4, 2),
    (4, 1, 3), (10, 3, 3),
    (5, 0, 4), (9, 4, 4),
    (6, 1, 5), (8, 3, 5),
    (7, 2, 6),
]

# Fixed rasi per square cell (None = center).
SQUARE = [
    [12, 1, 2, 3],
    [11, None, None, 4],
    [10, None, None, 5],
    [9, 8, 7, 6],
]


def svg_diamond(houses: dict, lagna_rasi: int, title: str) -> str:
    uw, uh, bw, bh = 120, 100, 112, 92
    W, H = 5 * uw + 8, 7 * uh + 44
    el = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" '
          f'font-family="sans-serif">',
          f'<text x="8" y="20" font-size="16" font-weight="bold" fill="{DIM}">'
          f'{_esc(title)}</text>']
    for (h, x, y) in DIAMOND:
        ox, oy = 4 + x * uw, 28 + y * uh
        hl = (h == 1)
        el.append(f'<rect x="{ox}" y="{oy}" width="{bw}" height="{bh}" rx="6" '
                  f'fill="none" stroke="{GOLD if hl else DIM}" '
                  f'stroke-width="{2.5 if hl else 1}"/>')
        rasi = RASIS[(lagna_rasi - 1 + h - 1) % 12]
        el.append(f'<text x="{ox + 8}" y="{oy + 18}" font-size="12" fill="{DIM}">'
                  f'{h} · {rasi}</text>')
        for i, p in enumerate(houses.get(h, [])[:3]):
            el.append(f'<text x="{ox + 8}" y="{oy + 38 + 18 * i}" font-size="13" '
                      f'fill="{_fill(p)}">{_esc(p)}</text>')
    el.append('</svg>')
    return "\n".join(el)


def svg_square(seats: dict, lagna_rasi: int, title: str) -> str:
    cw, chh, W, H = 130, 96, 4 * 130 + 8, 4 * 96 + 44
    el = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" '
          f'font-family="sans-serif">',
          f'<text x="8" y="20" font-size="16" font-weight="bold" fill="{DIM}">'
          f'{_esc(title)}</text>']
    by_rasi: dict = {i: [] for i in range(1, 13)}
    for p, r in seats.items():
        by_rasi[r].append(p)
    for gr, row in enumerate(SQUARE):
        for gc, rasi in enumerate(row):
            ox, oy = 4 + gc * cw, 28 + gr * chh
            if rasi is None:
                continue
            hl = (rasi == lagna_rasi)
            el.append(f'<rect x="{ox}" y="{oy}" width="{cw - 6}" height="{chh - 6}" rx="6" '
                      f'fill="none" stroke="{GOLD if hl else DIM}" '
                      f'stroke-width="{2.5 if hl else 1}"/>')
            el.append(f'<text x="{ox + 8}" y="{oy + 18}" font-size="12" '
                      f'fill="{DIM}">{RASIS[rasi - 1]}</text>')
            for i, p in enumerate(by_rasi[rasi][:3]):
                el.append(f'<text x="{ox + 8}" y="{oy + 38 + 18 * i}" font-size="13" '
                          f'fill="{_fill(p)}">{_esc(p)}</text>')
    lr = RASIS[lagna_rasi - 1]
    el.append(f'<text x="{4 + 2 * cw - 40}" y="{28 + 2 * chh - 8}" font-size="12" '
              f'fill="{GOLD}">✦ {lr} Lagna ✦</text>')
    el.append('</svg>')
    return "\n".join(el)

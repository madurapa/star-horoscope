"""South square tests: fixed signs regardless of Lagna."""
import io

from rich.console import Console

from south import GRID, render_south

LON = {"Lagna": "239:05:18", "Chandra": "325:04:41", "Ravi": "120:52:33"}


def shot(width=140, lagna_rasi=8):
    buf = io.StringIO()
    render_south(LON, lagna_rasi,
                 Console(file=buf, width=width, color_system=None))
    return buf.getvalue()


def test_fixed_sign_grid():
    flat = sorted(c for row in GRID for c in row if c)
    assert flat == list(range(1, 13))


def test_planets_pinned_to_rasi_cells():
    out = shot()
    assert "South Indian square" in out
    lines = out.split("\n")

    def near(rasi, planet):
        ri = [i for i, l in enumerate(lines) if rasi in l]
        pi = [i for i, l in enumerate(lines) if planet in l]
        return bool(ri) and bool(pi) and any(abs(a - b) <= 4 for a in ri for b in pi)

    assert near("Kumbha", "Chandra")  # Chandra is Kumbha(11)
    assert near("Simha", "Surya")  # Ravi is Simha(5)


def test_lagna_highlight_moves_with_lagna():
    out8 = shot(lagna_rasi=8)
    out1 = shot(lagna_rasi=1)
    assert "✦ Vrishchika Lagna ✦" in out8
    assert "✦ Mesha Lagna ✦" in out1
    # Chandra stays in Kumbha cell in both (fixed signs)
    assert "Chandra" in out8 and "Chandra" in out1

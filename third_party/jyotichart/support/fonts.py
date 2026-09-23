############################################################################
# fonts.py - Font family / size configuration for JyotiChart SVG output.
#
# Every renderer keeps a BASE_FONTS dict ({css-class: px}) with its
# historical sizes, so default output renders identically to before.
# Users override via updatechartcfg(font_family=..., font_sizes=...):
#   - font_family: any CSS font-family value, e.g. "serif",
#     "Arial, sans-serif". Default "sans-serif".
#   - font_sizes: dict of {name: px}. Names may be exact css classes
#     ("planet", "sign-num", "natal-planet", "num-value", ...) or one of
#     the generic aliases below, which expand to every matching class:
#       "sign"    -> sign-num, sign-num-tri
#       "planet"  -> planet, natal-planet, transit-planet
#       "aspect"  -> aspect, natal-aspect, transit-aspect
#       "details" -> chart-details
#       "value"   -> num-value
#       "lagna"   -> center-lagna
############################################################################

DEFAULT_FAMILY = "sans-serif"

GENERIC_ALIASES = {
    "sign": ["sign-num", "sign-num-tri"],
    "planet": ["planet", "natal-planet", "transit-planet"],
    "aspect": ["aspect", "natal-aspect", "transit-aspect"],
    "details": ["chart-details"],
    "value": ["num-value"],
    "lagna": ["center-lagna"],
}

# Every css class ever emitted, used to drop unknown keys quietly.
KNOWN_CLASSES = frozenset(
    cls for targets in GENERIC_ALIASES.values() for cls in targets
) | frozenset(GENERIC_ALIASES.keys())


def normalize_font_sizes(spec):
    """Expand generic aliases; keep positive ints; drop unknown keys."""
    resolved = {}
    if not isinstance(spec, dict):
        return resolved
    for key, px in spec.items():
        if not isinstance(px, int) or isinstance(px, bool) or px <= 0:
            continue
        k = str(key).strip()
        targets = GENERIC_ALIASES.get(k.lower(), [k] if k in KNOWN_CLASSES else [])
        for cls in targets:
            resolved[cls] = px
    return resolved


def apply_font_cfg(chartcfg, font_family=None, font_sizes=None):
    """Apply font overrides onto a chartcfg dict (in place)."""
    if font_family is not None:
        chartcfg["font-family"] = str(font_family)
    if font_sizes is not None:
        merged = dict(chartcfg.get("font-sizes", {}))
        merged.update(normalize_font_sizes(font_sizes))
        chartcfg["font-sizes"] = merged
    return chartcfg


def style_block(chartcfg, base_fonts):
    """Render the <style> font lines for the given base {class: px} sizes."""
    family = chartcfg.get("font-family", DEFAULT_FAMILY)
    overrides = chartcfg.get("font-sizes", {})
    lines = ["  <style>"]
    for cls, px in base_fonts.items():
        size = overrides.get(cls, px)
        lines.append("    .%s { font: bold %spx %s; }" % (cls, size, family))
    lines.append("  </style>")
    return "\n".join(lines) + "\n"

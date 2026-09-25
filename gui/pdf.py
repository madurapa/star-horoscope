"""Dedicated print layout -> PDF (WS-E). Qt-native, no new dependencies.

Clean print design (not the screen HTML): A4 landscape, tables, flat
expanded timeline, vector charts. Headless-capable (offscreen
platform), so console/app.py --export-pdf reuses export_pdf().
"""
import os

import services
from i18n import tr
from report_l10n import trx

TEXT = "#20221f"
ACCENT = "#b45309"
LINE = "#d8d3c8"
FAINT = "#a3a097"

# Theme vars baked into chart SVGs mean nothing to QSvgRenderer (no CSS
# :root there), and the library's bold does not match the report's
# normal-weight charts — resolve both on the PDF copy only.
_SVG_LITERALS = (
    ("var(--chart-bg)", "#ffffff"),
    ("var(--chart-line)", "#d8d3c8"),
    ("var(--text)", TEXT),
    ("font: bold ", "font: normal "),
)


def ensure_qt():
    """QApplication instance, offscreen unless the host sets a platform."""
    os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")
    from PySide6.QtWidgets import QApplication

    app = QApplication.instance()
    return app or QApplication([])


def register_fonts() -> str:
    """Bundle Noto Sans Sinhala with the painter; fallback sans-serif."""
    from PySide6.QtGui import QFontDatabase

    ok = False
    for weight in ("Regular", "Bold"):
        path = services.ASSETS / "fonts" / f"NotoSansSinhala-{weight}.ttf"
        if path.is_file() and QFontDatabase.addApplicationFont(str(path)) >= 0:
            ok = True
    return "Noto Sans Sinhala" if ok else "sans-serif"


def chart_svg_for_print(svg: str) -> bytes:
    """Copy of a chart SVG with theme vars + weight resolved for PDF."""
    for old, new in _SVG_LITERALS:
        svg = svg.replace(old, new)
    return svg.encode("utf-8")


MM = 72 / 25.4  # PDF points per millimetre


class _Page:
    """QPainter cursor over a QPdfWriter, working in PDF points.

    Device pixels would collapse (or explode, under a world
    transform that also scales fonts) the layout, so geometry stays
    in points and only metrics convert through the device DPI.
    """

    def __init__(self, pdf, family):
        from PySide6.QtGui import QFont, QPainter

        self.pdf = pdf
        self.family = family
        self.painter = QPainter(pdf)
        self.dpix = pdf.logicalDpiX()
        self.dpiy = pdf.logicalDpiY()
        self.no = 1
        self.font = QFont(family)
        self.margin = 15 * MM
        pts = pdf.pageLayout().pageSize().sizePoints()
        self.w = pts.width() - 2 * self.margin
        page_h = pts.height()
        self.x0 = self.margin
        self.y = self.margin
        self.max_y = page_h - self.margin - 10 * MM

    def _set(self, size, bold=False, color=TEXT):
        from PySide6.QtGui import QColor

        # Printer resolution is forced to 72dpi (see export_pdf), so
        # point sizes emit 1:1 with no compensation layer.
        self.font.setPointSizeF(size)
        self.font.setBold(bold)
        self.painter.setFont(self.font)
        self.painter.setPen(QColor(color))

    def _metrics(self):
        from PySide6.QtGui import QFontMetrics

        return QFontMetrics(self.font, self.painter.device())

    def _advance(self, s) -> float:
        return self._metrics().horizontalAdvance(s) * 72 / self.dpix

    def _line(self, mult=1.0) -> float:
        return self._metrics().height() * mult * 72 / self.dpiy

    def _ascent(self) -> float:
        return self._metrics().ascent() * 72 / self.dpiy

    def _elide(self, s, width_pt) -> str:
        from PySide6.QtCore import Qt

        return self._metrics().elidedText(
            str(s), Qt.ElideRight, max(int(width_pt * self.dpix / 72), 1))

    def text(self, s, size=9, bold=False, color=TEXT, indent=0):
        self._set(size, bold, color)
        total = self._line()
        self._feed(total)
        self.painter.drawText(self.x0 + indent * MM,
                              self.y + self._ascent(), s)
        self.y += total

    def rule(self):
        from PySide6.QtGui import QColor, QPen

        self._feed(4 * MM)
        self.painter.setPen(QPen(QColor(LINE), 0.4 * MM))
        self.painter.drawLine(self.x0, self.y, self.x0 + self.w, self.y)
        self.y += 4 * MM

    def section(self, title):
        self.y += 2 * MM
        self.text(title, size=11, bold=True, color=ACCENT)

    def footer(self):
        self._set(7.5, False, FAINT)
        label = f"Page {self.no}"
        self.painter.drawText(self.x0 + self.w - self._advance(label),
                              self.max_y + 6 * MM, label)

    def _feed(self, need):
        if self.y + need > self.max_y:
            self.footer()
            self.pdf.newPage()
            self.no += 1
            self.y = self.margin

    def table(self, headers, rows, size=8.0):
        self._set(size, True)
        head_h = self._line(1.5)
        self._feed(head_h)
        self._row(headers, self._fit(headers, rows), head_h, True)
        self._set(size, False)
        row_h = self._line(1.4)
        for r in rows:
            self._feed(row_h)
            self._row(r, self._widths, row_h, False)

    def _fit(self, headers, rows):
        widths = [0.0] * len(headers)
        for i, h in enumerate(headers):
            widths[i] = max(widths[i], self._advance(str(h)) + 3 * MM)
            for r in rows:
                widths[i] = max(widths[i],
                                self._advance(str(r[i])) + 3 * MM)
        total = sum(widths)
        if total > self.w:
            # 0.96 safety: shaped advances can exceed measured ones.
            factor = 0.96 * self.w / total
            widths = [w * factor for w in widths]
        self._widths = widths
        return widths

    def _row(self, cells, widths, height, header):
        from PySide6.QtGui import QColor, QPen

        x = self.x0
        for i, cell in enumerate(cells):
            text = self._elide(cell, widths[i] - 1 * MM)
            if header:
                self.painter.setPen(QPen(QColor(LINE), 0.4 * MM))
                self.painter.drawLine(x, self.y + height,
                                      x + widths[i], self.y + height)
            self.painter.drawText(x + 1 * MM, self.y + height - 2 * MM, text)
            x += widths[i]
        self.y += height

    def chart(self, svg_bytes, title, x, y, w, h):
        from PySide6.QtCore import QRectF
        from PySide6.QtGui import QColor
        from PySide6.QtSvg import QSvgRenderer

        self._set(9, True)
        self.painter.drawText(x, y + 4 * MM, title)
        renderer = QSvgRenderer(svg_bytes)
        if renderer.isValid():
            self.painter.save()
            self.painter.setPen(QColor(TEXT))
            renderer.render(self.painter,
                            QRectF(x, y + 6 * MM, w, h - 8 * MM))
            self.painter.restore()

    def close(self):
        self.footer()
        self.painter.end()


def export_pdf(doc, path, locale=None) -> str:
    """Render the dedicated print layout to path. Returns path."""
    from PySide6.QtGui import QPageLayout, QPageSize
    from PySide6.QtPrintSupport import QPrinter

    from jychart import gallery_items

    ensure_qt()
    locale = locale or doc.get("locale", "en")
    family = register_fonts()
    # QPrinter at 72dpi: painter units == PDF points, font sizes emit
    # 1:1 (higher resolutions scale emitted Tf by resolution/72 while
    # leaving coordinates in points — verified empirically).
    pdf = QPrinter(QPrinter.HighResolution)
    pdf.setOutputFormat(QPrinter.PdfFormat)
    pdf.setOutputFileName(str(path))
    pdf.setResolution(72)
    pdf.setPageSize(QPageSize(QPageSize.A4))
    pdf.setPageOrientation(QPageLayout.Landscape)
    pdf.setDocName(f"{doc['name']} — Horoscope")
    page = _Page(pdf, family)

    name, sub = services.hero_header(doc, locale)
    page.text(name, size=16, bold=True, color=ACCENT)
    page.text(sub, size=10)
    page.text(f"Schema {doc['schema']} · Version {doc['version']} · "
              f"Julian Date {doc['julian_date']} · "
              f"Ayanamsa {doc['ayanamsa_deg']}", size=7.5, color=FAINT)
    page.rule()
    groups = services.hero_groups(doc, locale)
    for title in ("Panchanga", "Hora", "Chakra"):
        page.section(tr(title, locale))
        for key, value in groups[title.lower()]:
            page.text(f"{tr(key, locale)}: {value}", indent=4)
    page.section(trx("Shadvarga Matrix", locale))
    page.table(services.matrix_headers(locale),
               [[r["planet"], f"{r['rasi']} ({r['rasi_num']})",
                 r["lon"], r["nakshatra"], str(r["pada"])] +
                [f"{v['rasi']} ({v['num']})" for v in r["vargas"]] +
                [r["avastha"]] for r in services.matrix_rows(doc, locale)])
    page.section(tr("Houses", locale))
    page.table(services.houses_headers(locale),
               [[r["planet"], r["lon"], r["nakshatra"], r["pada"],
                 r["rasi"], r["rasi_lon"], r["avastha"]]
                for r in services.houses_rows(doc, locale)])
    page.section(tr("Mahadasa and Antardasa Timeline", locale))
    for s in services.timeline_rows(doc, None, locale):
        page.text(f"{s['lord']}  {s['from']} – {s['to']}  "
                  f"{s['status']}", bold=s["active"])
        for b in s["bhuktis"]:
            page.text(f"{b['lord']}  {b['from']} – {b['to']}  "
                      f"{b['status']}", indent=6)
    items = gallery_items(doc, "east", locale)
    titles = [t for t, _v, _l, _s in items]
    svgs = [chart_svg_for_print(s) for _t, _v, _l, s in items]
    cols, gap = 2, 8 * MM
    cw = (page.w - gap) / cols
    ch = 80 * MM
    for i in range(0, len(svgs), cols * 2):
        page.footer()
        page.pdf.newPage()
        page.no += 1
        page.y = page.margin
        for j in range(min(cols * 2, len(svgs) - i)):
            k = i + j
            page.chart(svgs[k], tr(titles[k], locale),
                       page.x0 + (j % cols) * (cw + gap),
                       page.y + (j // cols) * (ch + 10 * MM), cw, ch)
    page.close()
    return str(path)

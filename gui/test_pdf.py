"""WS-E print goldens: PDF text presence/order (not pixels)."""
import copy

from pypdf import PdfReader

from gui.pdf import chart_svg_for_print, export_pdf
from test_render import DOC


def _norm(text) -> str:
    """Collapse extraction artifacts (pypdf joins drawText ops)."""
    import re

    return re.sub(r"\s+", "", text)


def _pdf_text(doc, locale="en"):
    import tempfile

    d = copy.deepcopy(doc)
    d["locale"] = locale
    with tempfile.TemporaryDirectory() as tmp:
        path = f"{tmp}/report.pdf"
        export_pdf(d, path)
        reader = PdfReader(path)
        return reader, _norm("\n".join(p.extract_text() or ""
                                       for p in reader.pages))


def test_pdf_sections_order_and_content(qapp):
    reader, text = _pdf_text(DOC)
    assert len(reader.pages) >= 3  # tables + timeline + charts
    order = ["TestUser", "2451773", "ShadvargaMatrix", "Houses",
             "MahadasaandAntardasaTimeline", "Guru", "2000-08-17",
             "Budha", "2001-06-04", "Shani"]
    pos = -1
    for token in order:
        nxt = text.find(token, pos + 1)
        assert nxt > pos, token
        pos = nxt
    # every bhukti expanded (print has no collapsed details)
    assert "2001-06-04" in text


def test_pdf_a4_landscape(tmp_path, qapp):
    doc = copy.deepcopy(DOC)
    path = str(tmp_path / "r.pdf")
    export_pdf(doc, path)
    box = PdfReader(path).pages[0].mediabox
    assert abs(float(box.width) - 841.89) < 1.0
    assert abs(float(box.height) - 595.28) < 1.0


def test_pdf_sinhala_text_and_charts(tmp_path, qapp):
    # Qt subset-embeds complex scripts with unreliable ToUnicode, so
    # script assertions stay structural: si shaping is verified by
    # raster eyeball (see session log), extraction only proves ASCII
    # content landed and English values did not leak through.
    doc = copy.deepcopy(DOC)
    path = str(tmp_path / "r.pdf")
    export_pdf(doc, path, locale="si")
    reader = PdfReader(path)
    assert len(reader.pages) >= 3
    text = _norm("\n".join(p.extract_text() or ""
                           for p in reader.pages))
    assert "star-horoscope/2" in text
    assert "2000-08-17" in text
    assert "Ratnapura" not in text and ">Guru<" not in text


def test_chart_svg_print_literals():
    svg = chart_svg_for_print(
        '<svg style="fill:var(--chart-bg);stroke:var(--chart-line)">'
        '<style>.planet { font: bold 14px sans-serif; }</style>'
        '<text fill="var(--text)">Rv</text></svg>').decode("utf-8")
    assert "var(--" not in svg and "bold" not in svg
    assert "#ffffff" in svg and "#20221f" in svg

"""Semantic HTML report tests: tags, values, escaping."""
from htmlreport import render_report
from test_render import DOC


def _report(locale="en", **kw):
    import copy

    doc = copy.deepcopy(DOC)
    doc["locale"] = locale
    return render_report(doc, **kw)


def test_semantic_tags_and_sections():
    html = _report()
    for tag in ["<table>", "<h1>", "<h2>", "<section>"]:
        assert tag in html, tag
    assert "<pre>" not in html
    for section in ["Birth Profile", "Nirayana Table of Houses",
                    "Shadvarga Charts", "Mahadasa and Antardasa Timeline",
                    "Dasa Information", "Selected Options"]:
        assert section in html, section


def test_values_and_charts_present():
    html = _report(gallery="<svg></svg>")
    assert "Test User" in html and "Ratnapura" in html
    assert "2451773.858" in html and "23°50&#x27;01&quot;" in html
    assert "Asvida" in html and "Bhojana" in html
    assert "2000-08-17" in html and "Budha" in html
    assert "<svg></svg>" in html


def test_escaping():
    import copy

    doc = copy.deepcopy(DOC)
    doc["name"] = 'T <Q> & "Z"'
    html = render_report(doc)
    assert "T &lt;Q&gt; &amp; &quot;Z&quot;" in html


def test_sinhala_titles():
    html = _report(locale="si")
    assert "උපන් විස්තර" in html  # Birth Profile
    assert "Test User" in html  # values stay English

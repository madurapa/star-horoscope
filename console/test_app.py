"""app.py CLI tests: export flags (compute stubbed, no engine needed)."""
import copy
import sys

from typer.testing import CliRunner

import app as appmod
from test_render import DOC

ARGS = ["--name", "Test User", "--year", "2000", "--month", "8",
        "--day", "17", "--hour", "14", "--minute", "5", "--city", "7"]


def _stubbed(monkeypatch):
    monkeypatch.setattr(appmod, "compute",
                        lambda *a, **kw: copy.deepcopy(DOC))


def test_export_pdf_dev(monkeypatch, tmp_path):
    _stubbed(monkeypatch)
    out = str(tmp_path / "r.pdf")
    result = CliRunner().invoke(appmod.app, ARGS + ["--export-pdf", out])
    assert result.exit_code == 0, result.output
    assert f"wrote {out}" in result.output
    with open(out, "rb") as f:
        assert f.read(5) == b"%PDF-"


def test_export_pdf_without_qt(monkeypatch):
    _stubbed(monkeypatch)
    monkeypatch.setitem(sys.modules, "PySide6", None)
    result = CliRunner().invoke(appmod.app, ARGS + ["--export-pdf", "y"])
    assert result.exit_code == 2
    assert "star-gui" in result.output

"""star-gui entry (future frozen double-clickable binary target).

Run from the repo root: PYTHONPATH=/tmp/star-py python gui/main.py
(or python -m gui.main with console/ importable).
"""
import os
import sys

_HERE = os.path.dirname(os.path.abspath(__file__))
_ROOT = os.path.dirname(_HERE)
if not getattr(sys, "frozen", False):
    # Dev: console/ lives beside gui/ in-tree (mirrors jychart pattern).
    sys.path.insert(0, os.path.join(_ROOT, "console"))
    if _ROOT not in sys.path:
        sys.path.append(_ROOT)

from PySide6.QtWidgets import QApplication

from gui.views import MainWindow


def main(argv=None) -> int:
    argv = sys.argv if argv is None else argv
    if "--smoke" in argv[1:]:
        # CI/dev aid: construct the window, compute the baseline
        # profile and export a PDF offscreen, proving Qt plugins,
        # engine and print path resolve in the frozen bundle.
        import os
        import tempfile

        os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")
        app = QApplication([])
        window = MainWindow()
        window.show()
        import services
        from gui.pdf import export_pdf

        doc = services.compute("Test User", 2000, 8, 17, 14, 5, 7)
        assert doc["longitudes"]["Lagna"].startswith("239:")
        with tempfile.TemporaryDirectory() as tmp:
            export_pdf(doc, f"{tmp}/smoke.pdf")
        print("GUI_SMOKE_GREEN")
        return 0
    app = QApplication(argv)
    window = MainWindow()
    window.show()
    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())

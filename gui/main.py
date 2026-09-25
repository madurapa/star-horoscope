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


def main() -> int:
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())

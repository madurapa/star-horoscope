"""pytest bootstrap for gui/: repo paths + headless Qt."""
import os
import sys

_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for _p in (os.path.join(_ROOT, "console"), _ROOT):
    if _p not in sys.path:
        sys.path.append(_p)

os.environ.setdefault("QT_QPA_PLATFORM", "offscreen")

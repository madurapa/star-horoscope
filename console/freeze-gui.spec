# PyInstaller spec: single-file star-gui binary (frozen Qt app).
#
#   STAR_PYBUILD=/tmp/star-py pyinstaller console/freeze-gui.spec
#
# Same engine/assets as freeze.spec plus PySide6 (NOT excluded here).
# macOS builds a one-dir STAR Horoscope.app bundle (one-file .app is
# blocked); Linux/Windows stay one-file. Console stays attached in v1
# (debatable for Windows double-click; revisit with real UX feedback).
import glob
import os
import sys

# Repo root regardless of invocation directory (SPECPATH == console/).
ROOT = os.path.dirname(os.path.abspath(SPECPATH))

# Directory holding the built pystar extension (cmake -DSTAR_PYTHON=ON).
pybuild = os.environ.get("STAR_PYBUILD", "/tmp/star-py")
if not os.path.isabs(pybuild):
    pybuild = os.path.join(ROOT, pybuild)

ext = glob.glob(os.path.join(pybuild, "pystar*.so"))
ext += glob.glob(os.path.join(pybuild, "pystar*.pyd"))
# Multi-config generators (Visual Studio) land the module in Release/.
ext += glob.glob(os.path.join(pybuild, "Release", "pystar*.pyd"))
assert ext, "no pystar extension in %s (build with -DSTAR_PYTHON=ON)" % pybuild
binaries = [(ext[0], ".")]

zodiacs = glob.glob(os.path.join(ROOT, "console", "assets", "zodiac", "*.svg"))
fonts = glob.glob(os.path.join(ROOT, "console", "assets", "fonts", "*.ttf"))
assert len(zodiacs) == 12, "zodiac assets missing: %s" % zodiacs
assert fonts, "font assets missing"
datas = [(f, "assets/zodiac") for f in zodiacs]
datas += [(f, "assets/fonts") for f in fonts]

hiddenimports = [
    "pystar",
    "htmlreport", "jychart", "report_l10n", "i18n", "render",
    "kendra", "south", "services", "display_names",
    "gui.main", "gui.views", "gui.models", "gui.pdf",
    "jyotichart", "eastindianchart", "southindianchart",
    "northindianchart", "eastindian_transitchart",
    "southindian_transitchart", "northindian_transitchart",
    "eastindian_numericalchart", "southindian_numericalchart",
    "northindian_numericalchart", "support.general", "support.languages",
    "support.fonts", "support.constants",
]

# Data-science/GUI-toolkit stack excluded; PySide6 intentionally kept
# (unlike freeze.spec) — the GUI cannot run without it.
excludes = [
    "matplotlib", "IPython", "pandas", "PyQt6", "PIL",
    "scipy", "numpy", "pytest", "_pytest", "traitlets",
    "tornado", "zmq", "jupyter_client", "nbformat", "nbclient",
    "ipykernel", "prompt_toolkit", "jedi", "parso", "sphinx",
    "nose", "tkinter", "setuptools", "pkg_resources",
]

a = Analysis(
    [os.path.join(ROOT, "gui", "main.py")],
    pathex=[os.path.join(ROOT, "console"), ROOT,
            os.path.join(ROOT, "third_party", "jyotichart"), pybuild],
    binaries=binaries,
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=excludes,
    noarchive=False,
)
pyz = PYZ(a.pure)

# Single-sourced from kAppVersion (never hardcode a release number).
import re

with open(os.path.join(ROOT, "src", "ModernRenderer.hpp")) as _f:
    _APP_VERSION = re.search(r'kAppVersion = "([^"]+)"', _f.read()).group(1)

if sys.platform == "darwin":
    exe = EXE(
        pyz,
        a.scripts,
        [],
        exclude_binaries=True,
        name="star-gui",
        debug=False,
        console=True,
    )
    coll = COLLECT(
        exe,
        a.binaries,
        a.datas,
        strip=False,
        upx=False,
        name="star-gui",
    )
    app = BUNDLE(
        coll,
        name="STAR Horoscope.app",
        codesign_identity="-",  # ad-hoc; DID + notarization later
        info_plist={"CFBundleShortVersionString": _APP_VERSION},
    )
else:
    exe = EXE(
        pyz,
        a.scripts,
        a.binaries,
        a.datas,
        [],
        name="star-gui",
        debug=False,
        strip=False,
        upx=False,
        console=True,
        disable_windowed_traceback=False,
        target_arch=None,
        codesign_identity=None,
        entitlements_file=None,
    )

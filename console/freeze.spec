# PyInstaller spec: single-file star-report binary (frozen console app).
#
#   STAR_PYBUILD=/tmp/star-py pyinstaller console/freeze.spec
#
# Bundles console/app.py + the nanobind pystar extension + vendored
# jyotichart + report assets. Run from the repo root. Build dirs stay
# in /tmp (never committed). See docs/plans.md (frozen-app workstream).
import glob
import os

# Repo root regardless of invocation directory (SPECPATH == console/).
ROOT = os.path.dirname(os.path.abspath(SPECPATH))

# Directory holding the built pystar extension (cmake -DSTAR_PYTHON=ON).
pybuild = os.environ.get("STAR_PYBUILD", "/tmp/star-py")

ext = glob.glob(os.path.join(pybuild, "pystar*.so"))
ext += glob.glob(os.path.join(pybuild, "pystar*.pyd"))
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
    "kendra", "south",
    "jyotichart", "eastindianchart", "southindianchart",
    "northindianchart", "eastindian_transitchart",
    "southindian_transitchart", "northindian_transitchart",
    "eastindian_numericalchart", "southindian_numericalchart",
    "northindian_numericalchart", "support.general", "support.languages",
    "support.fonts", "support.constants",
]

# Data-science/GUI stack: dragged in via orthogonal import branches that
# never execute (proven: importing the whole app closure loads none of
# these). Excluding shrinks the one-file binary ~10x.
excludes = [
    "matplotlib", "IPython", "pandas", "PyQt6", "PySide6", "PIL",
    "scipy", "numpy", "pytest", "_pytest", "traitlets",
    "tornado", "zmq", "jupyter_client", "nbformat", "nbclient",
    "ipykernel", "prompt_toolkit", "jedi", "parso", "sphinx",
    "nose", "tkinter", "setuptools", "pkg_resources",
]

a = Analysis(
    [os.path.join(ROOT, "console", "app.py")],
    pathex=[os.path.join(ROOT, "console"),
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

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name="star-report",
    debug=False,
    strip=False,
    upx=False,
    console=True,
    disable_windowed_traceback=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)

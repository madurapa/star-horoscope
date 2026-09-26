# PyInstaller runtime hook: make Qt's GL linkage resolve on systems
# without it (minimal CI images, bare distros).
#
# System GL first (proprietary drivers keep working); otherwise dlopen
# the bundled copies by absolute path so no loader search is involved.
# The app creates no GL contexts (software-rasterized charts) — this is
# load-only insurance for QtGui's DT_NEEDED entries. Silent by design.
import ctypes
import os
import sys

# Dependencies-first: libEGL/libGLESv2 link libGLdispatch, so it must
# load before them (a bare except-pass here once hid exactly that).
_BUNDLED = ("libGLdispatch.so.0", "libEGL.so.1", "libGLESv2.so.2",
            "libGL.so.1")


def _rth_egl():
    if not (getattr(sys, "frozen", False) and hasattr(sys, "_MEIPASS")):
        return
    try:
        ctypes.CDLL("libEGL.so.1")
        return  # system GL present; leave it alone
    except OSError:
        pass
    loaded = set()
    problems = []
    for _lib in _BUNDLED:
        _path = os.path.join(sys._MEIPASS, _lib)
        if not os.path.isfile(_path):
            problems.append(f"{_lib}: not bundled")
            continue
        try:
            ctypes.CDLL(_path, mode=ctypes.RTLD_GLOBAL)
            loaded.add(_lib)
        except OSError as e:
            problems.append(f"{_lib}: {e}")
    # Only EGL/GLESv2 are load-bearing for Qt; report iff Qt is
    # about to die (libGL legitimately fails on X11-less systems).
    if not ({"libEGL.so.1", "libGLESv2.so.2"} & loaded):
        sys.stderr.write("egl-preload failed: " + "; ".join(problems) + "\n")


_rth_egl()
del _rth_egl

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

_BUNDLED = ("libEGL.so.1", "libGLESv2.so.2", "libGL.so.1",
            "libGLdispatch.so.0")


def _rth_egl():
    if not (getattr(sys, "frozen", False) and hasattr(sys, "_MEIPASS")):
        return
    try:
        ctypes.CDLL("libEGL.so.1")
        return  # system GL present; leave it alone
    except OSError:
        pass
    for _lib in _BUNDLED:
        _path = os.path.join(sys._MEIPASS, _lib)
        if os.path.isfile(_path):
            try:
                ctypes.CDLL(_path, mode=ctypes.RTLD_GLOBAL)
            except OSError:
                pass


_rth_egl()
del _rth_egl

#!/usr/bin/env python3
"""Deprecated wrapper: use tools/gen_locales.py (single source for all
generated language tables: console/i18n.py + jyotichart sign-names).
Kept so existing invocations keep working; --check now covers both
artifacts, not just jyotichart."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from gen_locales import main

if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

# Modern STAR — Sri Lankan Vedic Astrology Engine

A cross-platform (Linux, macOS, Windows) C++ console application
computing Sri Lankan Vedic horoscopes. It began as a
reverse-engineering port of a 16-bit MS-DOS program (`STAR.EXE`) —
that port is complete and frozen. Current work is product development
on top of a verified core: corrected spellings, responsive layout,
interactive input, color themes, and a second Swiss-Ephemeris engine.

See `NOTICE.md` for provenance and `docs/quirks.md` for the
deliberately reproduced behaviors of the original program.

## The original program

The 16-bit DOS program this port replaces:

![Original STAR.EXE opening screen](docs/images/original-star-screen.png)

The pre-removal tree (original binary, disassembly, extraction
scripts) is frozen on the `legacy` branch (`origin/legacy`
at v2.35.0) — see `NOTICE.md`.

## Requirements

- C++20 compiler (GCC, Clang, or MSVC 2022+) plus a C compiler,
  CMake >= 3.16; all builds are 64-bit (enforced by the build)
- Python 3 (test-gate harness only: `corpus`)
- Swiss Ephemeris v2.10.3final sources, vendored under
  `third_party/` (Moshier fallback; no downloads, no data files)
- A UTF-8 terminal (no ASCII fallback)
- Optional: static libc for a portable binary
  (`cmake -S . -B build -DSTAR_PORTABLE=ON`, Linux)
- Optional: Python 3.9+ dev headers plus pip-installed `nanobind`
  for the `pystar` bindings (`-DSTAR_PYTHON=ON`, e.g.
  `-DPython_EXECUTABLE=/usr/bin/python3.13`)
- Optional: pip-installed `PySide6-Essentials` plus `pytest-qt`
  for the Qt desktop GUI (`gui/`, offscreen-tested)

## Build

```bash
cmake -S . -B /tmp/star-build && cmake --build /tmp/star-build
```

Portable standalone binary (fully static, Linux):

```bash
cmake -S . -B /tmp/star-port -DSTAR_PORTABLE=ON && cmake --build /tmp/star-port
```

Python bindings (optional, off by default):

```bash
cmake -S . -B /tmp/star-py -DSTAR_PYTHON=ON -DPython_EXECUTABLE=/usr/bin/python3.13
cmake --build /tmp/star-py --target pystar
PYTHONPATH=/tmp/star-py python3.13 bindings/smoke.py
```

Quick app-only build (Linux; `-ldl` is Linux-only):

```bash
g++ -std=c++20 -O2 -Wall -Wextra -Isrc -Ithird_party/swisseph \
  src/main.cpp src/CLI.cpp src/VargaEngine.cpp src/SwissFeed.cpp \
  third_party/swisseph/swe*.c -lm -ldl -o modern_star
```

## Test gate (run every time)

```bash
ctest --test-dir /tmp/star-build
/tmp/star-build/modern_star --verify   # must end VERIFY_ALL_GREEN
```

Zero warnings under `-Wall -Wextra` is required, not aspirational. A step
that reduces passing tests is a bug in that step — revert and re-approach.

## Binaries

Download-and-run, no install — like the original STAR.EXE:

- **Windows**: download `star.exe`, double-click (a console opens).
  SmartScreen will flag the unknown publisher once — choose Run anyway.
- **Linux**: download `star_linux`, `chmod +x star_linux`, run it
  (fully static binary).
- **macOS**: download `star.dmg`, double-click, drag into
  Applications. Unsigned, so on first launch right-click the app
  and choose Open (Gatekeeper one-time approval).
- **Horoscope app** (terminal + HTML reports, no Python needed):
  download `star-report-linux`, `star-report-macos`, or
  `star-report-windows.exe` and run it — birth fields prompt
  interactively, `--export-html report.html` writes the
  self-contained report. Same Gatekeeper/SmartScreen one-time
  approvals as above.

Tagged versions (`v*`) build all three via
`.github/workflows/release.yml`, published as GitHub Releases.
Windows builds use MSVC (VS2022 x64, static CRT — no redistributable
needed).

## Usage

With no options, the program prompts for every field (no defaults —
every input is validated):

```bash
./modern_star
```

Batch/scripting flags (see `./modern_star --help` for the full list):

```bash
./modern_star --name "Test User" --year 2000 --month 8 --day 17 \
  --hour 14 --minute 5 --city 7 --nirayana
```

Key options:

- `--city <1-26>` — closest district (all 25 districts covered;
  `>26` takes manual coordinates, as in the original).
- `--engine dos|swisseph` — Swiss Ephemeris feed (default)
  vs frozen DOS reconstruction. The verifier asserts both engines
  (Swiss: all longitudes move ~2', dasa +15d); `--verify` checks
  both checkpoint sets.
- `--locale en|si|ta` — output locale (default `en`; si/ta fall back
  to English per string until translated).
- `--color auto|always|never` — headings color (`NO_COLOR` respected;
  never emitted into pipes/files).
- `--screen <n[,n...]>` — show only output group N (1–14).
- `--format <text|json>`, `--output <file>`, `--config <file>`.
- `--verify` — checkpoint verification, exit non-zero on failure.
- `--thathkala` — Thathkala Kendra mode (current time, Colombo fallback).

## Python bindings

`pystar.horoscope(...)` returns a `star-horoscope/2` JSON document
(see `docs/json_schema.md`), parsed with stdlib `json`:

```python
import json, pystar
doc = json.loads(pystar.horoscope("Test User", 2000, 8, 17, 14, 5, 7))
print(doc["longitudes"]["Lagna"], doc["engine"])
```

Only the engine is shared — Python is a pure schema consumer.
Translator files live in `src/locale_si.inc` / `src/locale_ta.inc`.

A rich full-width console pilot lives in `console/` (needs the
`pystar` build plus `rich`/`typer`/`pytest`):

```bash
PYTHONPATH=/tmp/star-py:console python3.13 console/app.py \
  --name "Test User" --year 2000 --month 8 --day 17 \
  --hour 14 --minute 5 --city 7 --export-html /tmp/report.html
python3.13 -m pytest console/ -q
```

Frozen single-file binary from the same sources (PyInstaller one-file
over `console/app.py` + the `pystar` engine + report assets; Linux
builds target older glibc, see the `freeze` CI job):

```bash
STAR_PYBUILD=/tmp/star-py python -m PyInstaller console/freeze.spec \
  --distpath dist --workpath freeze-build --noconfirm
```

Qt desktop GUI (`gui/`, PySide6): validated profile form, tabbed
results (summary, Shadvarga Matrix, houses, dasa timeline, chart
gallery), stacked navigation — all views share services with the
console above; PDF export lands per `docs/qt_plan.md`:

```bash
PYTHONPATH=/tmp/star-py:console python gui/main.py
QT_QPA_PLATFORM=offscreen python3.13 -m pytest gui/ -q
```

`--export-html FILE` writes a self-contained horoscope report
(embedded Noto Sans Sinhala, inline zodiac art, 8 divisional charts,
collapsible dasa timeline) — double-clickable in any browser, no
server. `--locale en|si|ta` localizes it; `--chart east|north|south`
picks the chart style (east default); `--dasa LORD|all` controls
Antardasa detail; `--city N` past 26 takes `--latdeg/--latmin/`
`--londeg/--lonmin` manual coordinates; `--thathkala` runs the
current moment at Colombo. Missing birth fields prompt
interactively. (The native binary has no HTML flag:
`--format text|json` only.)

Compare like with like: `--engine dos` reproduces the original
program's dates, `--engine swisseph` (default everywhere) uses
clean-math ephemeris — Moon arcminutes move dasa boundaries by
days, so always match the flag on both sides.

## Docs

- `docs/quirks.md` — original-program behaviors reproduced on purpose.
- `docs/glossary.md` — modern display vocabulary.
- `docs/modern_display.md` — palette and layout rules.
- `docs/plans.md` — phased roadmap (publish → engines →
  localization → JSON consumers → multi-tradition).
- `docs/json_schema.md` — frozen `star-horoscope/2` JSON schema.
- `docs/status_and_plans.md` — session history log (append-only).

## Contributing

See `CONTRIBUTING.md`. The one rule: `tests/corpus/` and
`tests/swiss_goldens/` are the contract — golden
files change only by explicit re-baselining with recorded justification,
never edited to match new code.

## License

GNU Affero General Public License v3.0 — see `LICENSE` (full text).
Provenance statement: `NOTICE.md`.

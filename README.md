# Modern STAR — Sri Lankan Vedic Astrology Engine

A native 64-bit Linux C++ console application computing Sri Lankan Vedic
horoscopes. It began as a reverse-engineering port of a 16-bit MS-DOS
program (`STAR.EXE`) — that port is complete and frozen. Current work is
product development on top of a verified core: corrected spellings,
responsive layout, interactive input, color themes.

See `NOTICE.md` for provenance and `docs/quirks.md` for the
deliberately reproduced behaviors of the original program.

## Requirements

- C++20 compiler (GCC or Clang) plus a C compiler, CMake >= 3.16
- Python 3 (test-gate harness only: `extraction_check`, `corpus`)
- Swiss Ephemeris v2.10.3final sources, vendored under
  `third_party/` (Moshier fallback; no downloads, no data files)
- A UTF-8 terminal for `--display modern` (no ASCII fallback)

## Build

```bash
cmake -S . -B /tmp/star-build && cmake --build /tmp/star-build
```

Quick app-only build:

```bash
g++ -std=c++20 -O2 -Wall -Wextra -Isrc src/main.cpp src/CLI.cpp src/VargaEngine.cpp -o modern_star
```

## Test gate (run every time)

```bash
ctest --test-dir /tmp/star-build
/tmp/star-build/modern_star --verify   # must end VERIFY_ALL_GREEN
```

Zero warnings under `-Wall -Wextra` is required, not aspirational. A step
that reduces passing tests is a bug in that step — revert and re-approach.

## Binaries

Tagged versions (`v*`) build Linux, macOS (clang), and Windows (MinGW)
executables via `.github/workflows/release.yml`, published as GitHub
Releases. MSVC is not supported (the sources rely on unistd.h/isatty).

## Usage

With no options, the program prompts for every field (no defaults —
every input is validated):

```bash
./modern_star
```

Batch/scripting flags (see `./modern_star --help` for the full list):

```bash
./modern_star --name "Test User" --year 1981 --month 12 --day 8 \
  --hour 12 --minute 55 --city 7 --nirayana
```

Key options:

- `--display modern|legacy` — corrected redesign (default) vs byte-exact
  original (verification runs only). Modern changes words/layout only;
  every number is proven equal to legacy output.
- `--color auto|always|never` — headings color (`NO_COLOR` respected;
  never emitted into pipes/files).
- `--screen <n[,n...]>` — show only output group N (1–14).
- `--format <text|json>`, `--output <file>`, `--config <file>`.
- `--verify` — checkpoint verification, exit non-zero on failure.
- `--thathkala` — Thathkala Kendra mode (current time, Colombo fallback).

## Docs

- `docs/quirks.md` — original-program behaviors reproduced on purpose.
- `docs/glossary.md` — Old→New spelling table (modern display).
- `docs/modern_display.md` — palette and layout rules.
- `docs/plans.md` — phased roadmap (publish → provenance → engines).
- `docs/status_and_plans.md` — session history log (append-only).

## Contributing

See `CONTRIBUTING.md`. The one rule: `tests/screens/`,
`tests/corpus/`, and `tests/screen_test/` are the contract — golden
files change only by explicit re-baselining with recorded justification,
never edited to match new code.

## License

GNU Affero General Public License v3.0 — see `LICENSE` (full text).
Provenance statement: `NOTICE.md`.

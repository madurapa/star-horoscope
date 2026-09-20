# AGENT OPERATIONAL DIRECTIVE: MODERN STAR (Sri Lankan Vedic Astrology Engine)

## What this project is

A native 64-bit Linux C++ console application computing Sri Lankan Vedic
horoscopes. It began as a reverse-engineering port of a 16-bit MS-DOS
program (`STAR.EXE`, original author unknown, source never available,
freely distributed in Sri Lanka) — that port is **complete and frozen**.
Current work is product development on top of a verified core: corrected
spellings, redesigned responsive layout, interactive input, color themes.

Provenance: independent reconstruction from the program's own screen
captures plus static disassembly, built to restore free public access to
functionality otherwise lost to 16-bit obsolescence. Not a copy of any
original source, no authorship claimed over it, not a commercial product.

## Architecture (do not fork it)

- **One engine** (`src/Engine.hpp` → `HoroscopeResult`): frozen DOS-faithful
  math. All quirks reproduce deliberately (non-carry seconds display,
  truncation splits, half-odd JD ties, 30-day date borrowing, the 23|24
  balance razor, city-13 label/coords mismatch). Never "fix" these —
  they are the fidelity contract, documented across source comments.
- **Two displays**: `--display modern` (default: corrected spellings per
  `docs/glossary.md`, responsive 80/90-col layout, central `Theme`
  palette) and `--display legacy` (byte-exact original, verification
  runs only).
- **Interactive CLI**: no defaults anywhere; every field validated
  (day-vs-month incl. leap-year Feb 29, hour/minute, city list + manual
  geo, S/N choices). Batch flags exist for scripting/tests.
- **Layout**: `src/` engine + CLI, `tests/` code + fixtures (`screens/`,
  `screen_test/`, `corpus/`), `tools/` harness scripts, `docs/`,
  `legacy/` frozen reverse-engineering archive (never built, never
  re-linked — see its README).

## The oracle doctrine (the one rule that matters)

- `tests/screens/`, `tests/corpus/`, `tests/screen_test/` are the
  **contract**, not fixtures of convenience. Golden files change only by
  explicit re-baselining with recorded justification — never edit
  expectations to match new code.
- Numeric parity: modern display changes words/layout only; every number
  proven equal to legacy (`test_modern_display`).
- `legacy/` is the court of last resort (arbitration, new ground truth),
  not a dependency: nothing in the build runs it except
  `tools/check_extraction.py` (reads the asm text).
- Reverse-engineering track is **closed**. No disassembler is needed for
  any current workflow. If disassembly is ever needed again, use free
  tooling (Ghidra/radare2) — proprietary tools have no place in this
  pipeline.

## Build & gate (run both, every time)

```bash
cmake -S . -B /tmp/star-build && cmake --build /tmp/star-build
ctest --test-dir /tmp/star-build
./modern_star --verify   # checkpoint gate, must end VERIFY_ALL_GREEN
```

Quick app-only build:
`g++ -std=c++20 -O2 -Wall -Wextra -Isrc src/main.cpp src/CLI.cpp src/VargaEngine.cpp -o modern_star`

A step that reduces passing tests is a bug in that step — revert and
re-approach. Zero warnings (`-Wall -Wextra`) is required, not aspirational.

## Standing rules

- **Prompts/output**: 2-space indent, `[default]` hints (empty takes the
  default), `!` errors; section dividers `─── Title ───` exact width with
  two blank lines around; Title Case titles; tables stretch to layout
  width (80/90); no trailing whitespace; no emitted line exceeds layout.
- **Color**: central `Theme` only (section/label/value/special/dates/
  faint/subtle/err/warn); codes wrap visible text, never padding;
  plain fallback byte-identical; `--color auto|always|never` + `NO_COLOR`;
  never into pipes/files; TTY stderr may use red.
- **Config**: `--display modern|legacy`, `--color`, `--screen 1-14`,
  `--output`, `--format`, `--verify`, `--config`, `--help`. No defaults
  for birth/city/method fields, ever.
- **Versions**: patch = fixes/docs, minor = features (`kAppVersion` in
  `ModernRenderer.hpp` is authoritative; tests pin the constant, never
  the literal). When the codebase gains a build/run dependency, update
  README Requirements in the same change and bump the version.
  Keep README current with every change: new flags, engines,
  artifacts, and requirements all land in README in the same change.
  Releases are cut by manual tag push (`git push origin vX.Y.Z`);
  every GitHub Release ships notes (CHANGELOG entry + highlights).
  Release notes live in docs/releases.md (single file, newest on
  top) — written before tagging so the body is copy-paste ready.
- **Docs**: maintain `docs/status_and_plans.md` (append sessions),
  `docs/glossary.md` (regenerate coded tables via
  `tools/dump_glossary.cpp` when tables change), `docs/modern_display.md`
  (palette/layout rules). History logs are append-only.
- **Privacy**: no real personal names/data in code, tests, or fixtures
  (synthetic `Test User` / `Test User A–E` profile family). Docs
  narrative history is exempt.
- **Paths**: repo-relative everywhere; `$HOME` for home-dir references;
  never absolute local paths, never machine-specific literals.

## Forward plan

`docs/plans.md` is authoritative (rulings recorded
2026-09-19): Phase 0 publish hygiene (LICENSE/NOTICE/README/CHANGELOG/
CONTRIBUTING/.gitignore, `docs/quirks.md`), Phase 1 provenance tags +
safe model work, **Phase 2 Swiss-Ephemeris backend** (`--engine
dos|swisseph`, display×engine independent, differential + independent
anchors, modern-default only after L0+L1+L2 green), Phase 3 localization
(glossary seed exists), Phase 4 tri-target JSON consumers, Phase 5
India mode (Bhava/quadrant systems live there, not in v1).

## Baseline checkpoints (what "correct" means)

Profile: Test User, 1981-12-08 12:55, Ratnapura (city 7), Nirayana.
Lagna 334:50:42 | Chandra 9:23:49 | Ravi 232:33:32 | Budha 231:17:00 |
Sikuru 276:02:26 | Kuja 152:42:30 | Guru 188:32:33 | Shani 176:32:50 |
Raahu 90:52:13 | Kethu 270:52:13. JD 2444946.809, UT 07:25:00,
Ayanamsa 23°34'21". Balance Kethu 2-0-23 (table age 2-0-24: known
two-convention dust, both reproduced). Kuja Maha 2020-01-02→2027-01-02;
Kuja-Budha →2024-06-29, Kuja-Kethu →2024-11-26, Kuja-Sikuru →2026-01-26.
Full assertions live in `tests/verifier.cpp` — this list is the summary.

## Skills (load deterministically — auto-loading is unreliable)

Name the skill explicitly (in your reasoning or reply) before using it;
most installed skills only trigger on explicit mention. Read the skill's
`SKILL.md` under `.agents/skills/<name>/` and follow it.

| Task | Skill(s) |
|---|---|
| Any refactoring plan, any `src/`/`tests/` change | `star-fidelity-gate` first, always |
| Display/layout/color work | `ascii-table-renderer`, `ascii-cli-logo-banner`, `ascii-ansi-colorizer`, `ascii-diagram-boxflow`, `ascii-mini-charts` (+ others in `ascii-*` as needed) |
| Test hardening, new suites, flaky tests | `cpp-testing`, `fuzzing`, `sanitizers` |
| Fuzzing campaigns, hard-to-fuzz code | `fuzzing`, `fuzzing-obstacles` + `sanitizers` |
| Compiler warnings, tidy/format, builds | `clang`, `clang-tidy`, `gcc`, `cmake`, `static-analysis` |
| Crash debugging | `gdb` |
| Any future disassembly need (never IDA) | `ghidra`, `ghidra-headless`, `ghidra-reverse`, `reverse-engineering` |
| Phase-4 Python bindings | `pybind11-best-practices` |
| Discovering/installing further skills | `find-skills` |

`skills-lock.json` pins every fetched skill (source + hash); the local
`star-fidelity-gate` is intentionally unlisted there (no fetch source).

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

When the user types `/graphify` or `graphify . --code-only`, use the installed graphify skill or instructions before doing anything else.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- Dirty graphify-out/ files are expected after hooks or incremental updates; dirty graph files are not a reason to skip graphify. Only skip graphify if the task is about stale or incorrect graph output, or the user explicitly says not to use it.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).

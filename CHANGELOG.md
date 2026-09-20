# Changelog

Version policy: patch = fixes/docs, minor = features. `kAppVersion` in
`src/ModernRenderer.hpp` is authoritative; tests pin the constant, never
the literal.

## 2.8.0

- Minor: Swiss engine is now the default (--engine dos selects the
  frozen reconstruction; --verify/corpus stay DOS-pinned). L3 Swiss
  goldens frozen (tests/swiss_goldens, modern display x 3 profiles).

## 2.7.1

- Patch: L1 differential harness (tools/diff_engines.py, frozen
  36,783-case grid + bounds) and L2 independent anchors
  (J2000/equinox/ayanamsa-rate). Validation only, no behavior change.

## 2.7.0

- Minor: second engine — `--engine dos|swisseph` (Swiss Ephemeris
  Moshier + Lahiri feed through the same HoroscopeResult; DOS
  default, DOS-pinned --verify/corpus, `"engine"` JSON provenance).

## 2.6.13

- Patch: Swiss Ephemeris v2.10.3final vendored (Phase-2 step 1)
  with wiring smoke test (Moshier fallback proven). No engine
  behavior change yet; attribution in NOTICE.md.

## 2.6.12

- Patch: Phase-1 safe item — string_view on eight read-only
  predicate params (spelling resolvers, trim, planet codes).

## 2.6.11

- Patch: Phase-1 safe item — fromDecimal seconds overflow clamp
  (unobserved magnitudes only; all observed values unaffected).

## 2.6.10

- Patch: Phase-1 array-indexed storage (Planet-indexed longitude /
  avastha arrays, per-slot display resolver). Internal refactoring;
  all program output byte-identical.

## 2.6.9

- Patch: README Requirements completed (CMake >= 3.16, Python 3 for
  the gate harness, zero third-party C++ libs); dependency/version
  standing rule recorded in AGENTS.md + CONTRIBUTING.md.

## 2.6.8

- Privacy re-baselining (owner-directed): baseline profile `Test Owner`
  → `Test User` across `src/` (incl. the byte-exact screen-06 literal),
  `tests/` sources and goldens, `AGENTS.md`, live docs. Birth data kept,
  so every golden number stays valid. `legacy/` frozen untouched;
  narrative history untouched.

## 2.6.7

- Phase-0 publish set: `LICENSE` (full AGPL-3.0 text, fetched from
  gnu.org and verified), `NOTICE.md`, `README.md`, `CHANGELOG.md`,
  `CONTRIBUTING.md`, `docs/quirks.md`.
- No engine, display, or test changes; gate stays green.

## 2.6.6

- Docs reorg: `docs/refactor_plans/FINAL_PLAN.md` promoted to
  `docs/plans.md` (lowercase); superseded drafts retired after migrating
  live content; root-CAPS vs docs-lowercase convention recorded.

## 2.6.5

- Docs/comments only: live-doc privacy sweep, plans tour.

## 2.6.4

- Test-folder reorg (`screens/` and `screen_test/` under `tests/`,
  harness scripts to `tools/`); dead `verify_dir` config field removed.

## 2.6.3

- Privacy rename (synthetic `Test Owner` / `Test User A–E` family);
  `legacy/` reverse-engineering archive; Yoni index 15 asterisk restored;
  UTF-8 terminal target declared.

## 2.6.1

- Patch: glossary Old/New/Note tables and tooling (docs/tooling only).

## 2.6.0

- Minor: full central `Theme` palette system.

## 2.2.0 – 2.5.0

- Minor series: version banner (2.2.0), boxed tables with tree colors
  and gray headers (2.3.0), footer art (2.4.0), input banner and error
  scheme with palette work (2.5.0).

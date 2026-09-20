# Changelog

Version policy: patch = fixes/docs, minor = features. `kAppVersion` in
`src/ModernRenderer.hpp` is authoritative; tests pin the constant, never
the literal.

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

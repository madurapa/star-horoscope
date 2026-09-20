# Contributing

## Gate first, always

Before changing anything, establish the baseline:

```bash
cmake -S . -B /tmp/star-build && cmake --build /tmp/star-build
ctest --test-dir /tmp/star-build
/tmp/star-build/modern_star --verify   # must end VERIFY_ALL_GREEN
```

Re-run the full gate after the change. Any step that reduces passing
tests is a bug in that step: revert and re-approach. Zero warnings
under `-Wall -Wextra` is required.

Before drafting any refactoring plan or touching `src/`, `tests/`,
`tools/`, or output-affecting docs, load the `star-fidelity-gate`
skill (`.agents/skills/star-fidelity-gate/`) and follow it.

## Golden files are frozen

`tests/screens/`, `tests/corpus/`, `tests/screen_test/` are the
contract. They change only by explicit re-baselining with a recorded
justification — never edit expectations to match new code.

## Numeric parity

Display, palette, and layout work must prove every number equal to
`--display legacy` output (the `test_modern_display` pattern: strip
words, diff numbers). Modern display changes words/layout only.

## Quirks are load-bearing

Before "fixing" anything surprising, look it up in `docs/quirks.md`
and the source comments. Reproductions of original-program behavior
(non-carry seconds display, truncation splits, half-odd JD ties, 30-day
date borrowing, the 23|24 balance razor, city-13 label/coords mismatch)
are the fidelity contract, not a bug list.

## Versions

Patch = fixes/docs, minor = features. Bump `kAppVersion`
(`src/ModernRenderer.hpp`, the single source) with every user-visible
change. Tests pin the constant, never the literal. When the codebase
gains a build/run dependency, update the README Requirements section
in the same change.

## Style and hygiene

- 2-space indent, no trailing whitespace, no line exceeding layout width.
- UTF-8 terminal target; color via the central `Theme` only, never into
  pipes/files (`--color auto|always|never` + `NO_COLOR`).
- No defaults for birth/city/method fields, ever; every input validated.
- Repo-relative paths everywhere (`$HOME` for home-dir references;
  never machine-specific literals).
- Privacy: synthetic `Test User` / `Test User A–E` profile family only.
  No real personal names or data in code, tests, or fixtures.
- Docs: append a session entry to `docs/status_and_plans.md` (history
  logs are append-only); regenerate glossary tables via
  `tools/dump_glossary.cpp` when coded tables change.

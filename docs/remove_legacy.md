# Remove-legacy plan (main branch; `legacy` branch holds the frozen tree)

## Main goal
Clean up legacy dependencies, tests, and blocks — leaving ONLY the DOS
computation engine (`EngineKind::Dos` math). Docs and versioning follow
the code, not the other way round.

## Rule
One unit per commit, gate green after each. No unit starts until the
owner calls it.

## Status (2026-09-24: R1–R8 done, gate green)
- [x] R0. Safety: `legacy` branch = pre-removal tree, pushed.
- [x] R1. CLI surface: `--display` flag (modern-only), `runBaselineLegacy`,
      legacy prompt path (`promptModern` stays), help text.
- [x] R2. Legacy renderers: `renderScreen*` legacy fns in
      ScreenRenderer.hpp. Shared pieces (makeKendra tables feeding
      modern charts, DMS/split helpers) stay — per-function call.
- [x] R3. Golden files: `tests/screens/`, `tests/screen_test/output*`,
      TRANSCRI*, and every test reading them (test_screens, verifier,
      corpus expects, screen_test harness entries).
- [x] R4. DOS-pinned tests: verifier rewritten around Swiss,
      extraction_check, corpus runner re-point, fuzz oracle (DOS
      captures → Swiss or drop).
- [x] R5. DOS tooling: check_extraction.py, capture/compare/fuzz
      scripts tied to DOS screens. gen_fuzz range decision included.
- [x] R6. All-md review (expanded 2026-09-24; one sub-unit per
      commit, owner calls each):
      - R6a doctrine: AGENTS.md oracle/fidelity/checkpoint sections,
        quirks.md (archive, not delete), plans.md + beyond_legacy.md
        + remove_legacy.md status.
      - R6b glossary: Old columns dropped, tables regenerated via
        tools/dump_glossary.cpp.
      - R6c front doors: README.md, CONTRIBUTING.md, NOTICE.md,
        CHANGELOG.md legacy mentions (--display/--engine/screens).
      - R6d docs/ sweep: modern_display, json_schema (display key
        gone), fuzzing (compare flow dropped), cli_ui_plan,
        console_plan, locale_notes, phase2_design, releases,
        spellings_and_glossary, data_structures,
        math_engine_proofs, time_and_dasa_logic,
        varga_and_sunrise_engine.
      - R6e screen_test/README.md (deleted outputs harness).
      - Out of scope: .agents/skills (not ours), third_party,
        legacy/ docs (die with R7), status_and_plans.md
        (append-only log, keeps history).
- [x] R7. `legacy/` dir: RULED delete. NOTICE.md cites the frozen tag
      + `legacy` branch instead.
- [x] R8. v3.0.0 + release notes + release tag.

## Owner rulings (recorded, supersede docs/beyond_legacy.md where they differ)
1. `legacy/` dir: DELETE (engine only).
2. Glossary: DROP Old columns (modern vocabulary only).
3. Verifier: REWRITE around Swiss checkpoints.
4. Scope order: code + tests first (R1–R5), docs + version after (R6–R8).

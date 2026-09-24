# FINAL PLAN — validated against repo reality (2026-09-19)

Merges `AGENTS.md` (operative directive), the four plan docs, the owner's
recent directives (modern engine, modern-default, palette, glossary), and
the actual repo state. Where sources conflict, the conflict is flagged
**[NEEDS OWNER RULING]** — nothing below picks a side silently (Phase-0 §0).

## 1. Ground reality (verified, not assumed)

- Gate is green: `ctest` 18/18, zero warnings; `./modern_star --verify` →
  `VERIFY_ALL_GREEN`. The Phase-0 fear (broken verifier/panchanga tests,
  missing fixtures) is over — all fixtures present.
- Shipped since the plans were written: `--display modern|legacy` (modern
  default), interactive input windows (validated, no defaults), full
  responsive/color redesign with centralized `Theme`, `docs/glossary.md`
  (363-row Old→New, generated + curated), `docs/modern_display.md`,
  `tools/dump_glossary.cpp`, version policy (now v2.6.1, test pins the
  constant), `--screen` groups, JSON output. Engine math untouched.
- Still missing (Phase-0 §4/§6): `LICENSE`, `README.md`, `CHANGELOG.md`,
  `CONTRIBUTING.md`, `NOTICE.md`, `.gitignore`, `docs/quirks.md`. None exist.
- Still open from Phase-0 §1/§2: privacy names (§4.1), Yoni index 15
  (§4.2), ASCII-vs-UTF-8 header contradiction (§4.3).
- `ModernRenderer.hpp` header still claims ASCII-only borders/boxflow
  while the code emits `─ │ ├ °` — stale comment, see §4.3.

## 2. Locked decisions (settled, do not relitigate)

- Oracle freeze rule: golden files (`screens/`, `corpus/`, captures)
  change only by explicit re-baselining with recorded justification.
- Numeric parity: modern display changes words/layout only; every number
  proven equal to legacy output (`test_modern_display`).
- Engine math frozen pending the Phase-2 engine decision (§4.4).
- No blank-check normalization/rounding consolidations (plan2 §Task-3
  rationale stands: `normUp`/`norm360`/Rashi-branch, `bankersRound`/
  `displayHms`/`splitYmd` are distinct decoded behaviors).
- No output-side strict validation; no cross-validation-as-gate.
- Version policy: patch = fixes/docs, minor = features (test pins
  `kAppVersion`, never the literal).

## 3. Phased plan

### Phase 0 — Publish hygiene (no engine work, no test changes beyond paths)
1. Privacy resolution (§4.1), then `LICENSE` (full AGPL-3.0 text, verified
   word-for-word), `NOTICE.md` (owner-approved wording), `README.md` (+
   License section), `CHANGELOG.md`, `CONTRIBUTING.md`, `.gitignore`.
2. `docs/quirks.md` built from source comments (`sic`, `binary-literal`,
   `never observed except`, non-carry seconds, `normUp` semantics, Gana
   Keti + Linga-24 nondeterminism, Karana table anomalies, `Chadra`
   slot spelling, city-13 label/coords, 23|24 razor).
3. Rule on §4.2 (Yoni*) and §4.3 (UTF-8 header) first — both touch
   documented behavior. (DONE 2026-09-19: asterisk restored, UTF-8
   declared. Remaining: items 1–2.)
4. Gate stays green throughout; any step reducing passes is reverted.

Publish blockers — owner confirms both before any public push:
- `NOTICE.md` wording below approved (statement about unknown authorship).
- Privacy pass complete (done 2026-09-19: Test Owner / Test User A–E).
- `LICENSE`: complete unmodified AGPL-3.0 text, fetched at publish time
  from https://www.gnu.org/licenses/agpl-3.0.txt and verified word-for-word
  against the official FSF text (never paraphrased or truncated).

`NOTICE.md` template (migrated from the Phase-0 instructions):

```markdown
# Provenance

This project is an independent reconstruction of a DOS-era Sri Lankan
Vedic astrology program (commonly referred to as STAR.EXE) whose original
author is unknown and whose source code was never available. The program
was freely distributed in Sri Lanka and fell out of use only because
modern operating systems can no longer run 16-bit DOS binaries.

This codebase was built by black-box analysis of the program's own
output (screen captures across many input scenarios) combined with
static disassembly of the binary, in order to restore free public access
to functionality that would otherwise be permanently lost. It is not a
copy of the original source code (none exists), makes no claim of
authorship over the original program, and is not a commercial product.

Where this project's output intentionally reproduces a quirk, rounding
behavior, or apparent bug from the original program, that reproduction
is documented in docs/quirks.md and is deliberate, not an oversight.
```

Also add `## License` to `README.md` (AGPL-3.0 + link to `LICENSE` +
pointer to `NOTICE.md`).

### Phase 1 — Provenance + safe model work (screen-diff-gated, one file at a time)
1. `DECODED`/`FITTED`/`UNOBSERVED`/`NONDETERMINISTIC` tags on tables and
   constants (backbone for decode prioritization).
2. Array-indexed value storage with per-slot display resolver
   (`Chadra`/`Chandra`, dasa-table aliases preserved as tested mappings).
3. Safe Task-3 items only (formatting with width-spec preservation,
   `string_view`, comment cleanup, `lround` clamp).

### Phase 2 — Second engine (BLOCKED on §4.4 + §4.5 rulings)
- Interface: `EngineKind` + dispatch at the existing `Engine.hpp` seam
  (`HoroscopeResult` is already engine-agnostic: same struct, all
  renderers/dasa/varga/CLI work unchanged).
- Validation (non-negotiable, whichever engine wins): L0 frozen legacy
  suite; L1 differential harness (both engines over a date/city grid,
  frozen arcsecond bounds); L2 independent anchors (cited values);
  L3 frozen modern goldens later. `--verify`/corpus pin legacy
  unconditionally.
- Candidate A (plan3): Swiss Ephemeris backend, `--engine dos|swisseph`,
  display×engine independent.
- Candidate B (owner proposal): hand-built modern engine (clean series,
  canonical rounding, stateless contexts), `--legacy` flag.
- v1 scope either way: SAME astrological system (Equal-house,
  Lahiri-like ayanamsa), clean math only. Quadrant systems (Sripati,
  Placidus, Bhava Madhya/Sandhi as features) belong to Phase 5, not v1.

### Phase 3 — Localization (parallel with Phase 2, never touches engine)
- Extend `docs/glossary.md` Old→New into the plan2 model
  (`dos_literal`/`en_classical`/`si_script`/`ta_script` + romanized +
  per-language `REVIEWED`/`DRAFT`/`UNSOURCED` + reviewer + notes).
- Thin `(concept id, locale)` renderer hooking into the layer
  `ModernRenderer.hpp` uses for strings (free width/wrap handling).
- Sourcing (priority order; never a single web source alone, Wikipedia
  included — use it for candidates, then a named reviewer confirms before
  any row flips to `REVIEWED`):
  Sinhala — Sri Lankan lit (annual almanac) publishers first (closest to
  living usage of exactly this vocabulary), jyotisha textbooks by known
  Sri Lankan authors, Kelaniya/Peradeniya departments as secondary check,
  and a practicing Sri Lankan astrologer as named reviewer (budget
  explicitly — worth more than any additional text source);
  Tamil — Tamil Nadu *and* Sri Lankan Tamil panchangams (usage differs),
  Jyotisham references, a native reviewer familiar with Sri Lankan Tamil
  usage specifically; `en_classical` bridge via BPHS translations and
  B.V. Raman to sanity-check concepts land correctly.

### Phase 4 — Tri-target (after Phase 2 lands)
- Frozen hand-specified JSON schema carrying engine+display provenance;
  Python (pybind11/nanobind) and TypeScript as pure consumers; no
  output-side enforcement.

### Phase 5 — India / multi-tradition mode (separate future doc)
- Ayanamsa options, house systems (incl. Bhava decision §4.6), KP
  sub-lords; resolve the `kIstMeridianDeg = 82.5` artifact via asm first.

## 4. Conflicts — OWNER RULINGS RECORDED 2026-09-19

- **4.1 Privacy → FULL SYNTHETIC (ruling refined).** Baseline becomes a
  new fictional identity *and* new birth data; fuzz-scenario persons get
  new names with edge-case data KEPT (the dates are the test fixture and
  aren't identifying without names — Phase-0 §1 principle). Docs history
  (`status_and_plans.md`, AGENTS.md) is NOT rewritten.
- **4.1a Execution (privacy).** Snapshot taken
  (`/tmp/star_snapshot_20260919.tgz`, 14MB). DOSBox + automation config
  present, server currently down. Steps: (1) trial capture to prove the
  pipeline; (2) re-capture baseline + TRANSCRI scenarios under synthetic
  inputs; (3) rebuild `screens/` + `corpus/` expectations from DOS output
  only (never engine-generated — that would make goldens circular);
  (4) update every hardcoded expectation in `tests/` + `src/` defaults;
  (5) full gate. Fallback if capture proves infeasible: rename-only with
  birth data kept (validity preserved, weaker anonymization).
- **4.2 Yoni index 15 → RESTORE asterisk** (`Vyagradena*`) + provenance
  comment.
- **4.3 UTF-8 → DECLARE UTF-8 target.** Fix the header; modern output
  requires a UTF-8 terminal (no ASCII fallback).
- **4.4 Engine → SWISS BACKEND** (`--engine dos|swisseph`), per plan3.
- **4.5 Default → FLIP NOW.** Modern becomes default as soon as Phase 2
  lands (no extended parallel-default period); L0+L1+L2 gates still
  required at flip time; `--verify`/corpus pin legacy unconditionally.
- **4.6 Archive → legacy/ FOLDER.** Extraction debris moves under
  `legacy/`; one engine tree stays; `check_extraction.py` path updated.
  (Supersedes plan3's tags-only stance for debris — engine source itself
  is never forked.)
- **4.7 Bhava → DEFER to Phase 5.** Modern v1 keeps Equal-house.

## 5. Original conflict list (kept for audit; all ruled above)

- **4.1 Privacy (§1 Phase-0, BLOCKING).** `Maduka Jayalath` (+1981-12-08,
  12:55, Ratnapura) is baked into sources, tests, and golden screens;
  `John`, `Bahashana`, `Nimal`, `Loku`, `Podi` also appear. KEEP or
  REPLACE-WITH-placeholder per name? (Replaces must touch fixtures +
  source in one commit.)
- **4.2 Yoni index 15 (§2 Phase-0).** `src/Attributes.hpp:52` currently
  `Vyagradena` (no asterisk). Deliberate correction with a decode note,
  or accidental drop? Whichever: add the one-line provenance comment.
- **4.3 UTF-8 contradiction (§2 Phase-0).** `ModernRenderer.hpp` header
  claims ASCII-only borders/boxflow while emitting `─ │ ├ °` (and boxed
  tables were later added). Fix the header to declare UTF-8 terminal
  target, or add an ASCII fallback (`+ - |`, `|--` tree)?
- **4.4 Engine choice (plan3 vs owner proposal).** Candidate A (Swiss
  Ephemeris backend, `--engine dos|swisseph`) or Candidate B (hand-built
  modern engine, `--legacy` flag)? Note: several recent directives
  assumed B's vocabulary (Real48→f64 narrative is inaccurate — the port
  is already f64; the real work is quirk-removal + model upgrade).
- **4.5 Default timing.** Modern-default only after L0+L1+L2 green
  (proposal), or flip earlier? `--verify`/corpus pin legacy either way.
- **4.6 Legacy folder vs single tree.** Owner proposed `legacy/` archive;
  plan3 §Architecture + Phase-0 §4 explicitly forbid a second tree
  (frozen reference = git tags, not a fork). Archive debris under
  `legacy/` while keeping one engine source tree, or strict single-tree
  with tags only?
- **4.7 Bhava scope.** Bhava Madhya/Sandhi + quadrant systems inside
  modern-engine v1, or deferred to Phase 5 as scoped above?

## Appendix A — proposal register (full coverage of refactor_plan*)

Every tool, plugin, and method proposed across the archived planning drafts lands
here with a verdict. Statuses: DONE, ADOPT (do it), DEFER (do it when
triggered), REJECT (don't do it, with reason).

### Libraries & plugins (mostly v1 §libraries)

| Proposal | Verdict | Note |
|---|---|---|
| `nlohmann/json` | DEFER | JSON is hand-rolled today; adopt when Phase-4 schema work demands it |
| `std::format` / `spdlog` | DEFER | `snprintf` width-specs are fidelity-relevant; convert file-by-file with screen diffs, never wholesale |
| Catch2 / GTest | REJECT | `check.hpp` works with zero deps; revisit only if needs outgrow it |
| Google Benchmark | DEFER | no measured perf pain exists |
| pybind11 / nanobind | Phase 4 | Python as pure schema consumer |
| `pyswisseph` | Phase 2, research only | differential report vs DOS engine; never a CI gate (disagreement is expected, not a defect) |
| pytest / hypothesis | DEFER | bounded Varga asserts belong in-suite now; full property harness with Phase 4 |
| pydantic / Zod | REJECT (output) | strict schemas reject legitimate values (e.g. Lagna 591:11:18); request-side only if an API layer ever exists |
| svg.js / D3 / chalk / cli-table3 / tsup / Vite | Phase 4 | TypeScript consumers of the frozen JSON schema |
| vcpkg / Conan | DEFER | zero third-party deps today; adopt with the first one |
| Clang-Format / Clang-Tidy | ADOPT config | add `.clang-format`; reformat opportunistically per file, never a flag-day diff |
| `<cmath>` native trig | DONE | the port already uses libm; Real48 survives only in constant decoding |

## 6. Status note — 2026-09-24 (remove_legacy R1–R5 done, R6 docs underway)

Swiss default is live (`--engine dos|swisseph`), the verifier asserts
both engines, product goldens are `tests/corpus/` + `tests/swiss_goldens/`,
and the legacy display, DOS goldens, renderers, DOS-pinned tests, DOS
tooling, and the `legacy/` directory are removed. Only v3.0.0 (R8)
is still open.
The phase structure above stands; this note records position only.

### Methods & refactors

| Proposal | Verdict | Note |
|---|---|---|
| Array-indexed value storage | Phase 1 | with per-slot display resolver (`Chadra`/`Chandra`, dasa aliases preserved as tested mappings) |
| Header/impl splitting | DEFER | no build pain (~20 files, seconds); opportunistic per file |
| `string_view` params | Phase 1 | safe, no behavior change |
| Unified `normUp` / rounding / clamp policy | REJECT | three distinct decoded behaviors each; strong types over shared helpers if ever touched |
| `fromDecimal` overflow clamp | Phase 1 | safe (boundary never observed either way) |
| Hardcoded date in `renderScreen01` | KEEP | byte-exact screen01 content, not a bug |
| `baselineInputs()` shared helper | DONE | both paths share `computeHoroscope` by construction |
| Fuzz `displayHms`/`splitYmd` | Phase 1 | oracle must encode the anomalies (e.g. `213:52:60` is correct), never naive ranges |
| Machine-readable provenance tags | Phase 1 | `DECODED`/`FITTED`/`UNOBSERVED`/`NONDETERMINISTIC` on tables + constants |
| Frozen hand-specified JSON schema | Phase 4 | carries engine+display provenance; documents shape, rejects nothing |
| Header comment migration to docs | Ongoing | leave concise summaries inline |
| Differential harness (L1) + independent anchors (L2) | Phase 2 | gates the second engine; `--verify`/corpus pin legacy unconditionally |
| Release git tags | ADOPT | tag versions going forward (complements, not replaces, `legacy/`) |

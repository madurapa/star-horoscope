# Changelog

Version policy: patch = fixes/docs, minor = features. `kAppVersion` in
`src/ModernRenderer.hpp` is authoritative; tests pin the constant, never
the literal.

## 2.34.0

- SL chart convention everywhere: DOS glyphs (Ch, Rv, …),
  transliterated signs (Vrushchika, …), Lagna marker — in all
  locales. Fork English blocks updated (other languages
  untouched).

## 2.33.3

- Single language source: `tools/gen_jylang.py` regenerates
  jyotichart's si/ta sign names from the core concept rows
  (`--check` pinned by test); symbols/labels/kannada/hindi
  stay hand-maintained (no core counterpart).

## 2.33.2

- East chart compartments name their sign (`4 · Aquarius`),
  so houses read without counting from Asc.

## 2.33.3

- Console panchanga mirrors the modern corrections
  (Sukarma etc.) instead of raw engine strings; Panchanga
  rows aligned to CLI keys.

## 2.33.1

- East charts fixed-house throughout: the `fixed_houses`
  flag (positional numbers, Asc top-center) was set in code
  but never enabled — placements were right, numbers
  disagreed. All 72 placements + numbers proven.

## 2.33.0

- East charts go fixed-house (Sri Lankan use): house h sits in
  position h, signs rotate, Asc marker top-center — matching
  the CLI on every chart. Upstream North file pristine again.

## 2.32.1

- 72-placement geometric regression test (all planets, all
  charts, fixed-sign compartments).

## 2.32.0

- East design by default (`--chart east|south|north`):
  upstream North file restored pristine — corrections live
  only in the project-owned East code.

## 2.31.0

- Charts match the CLI: `--chart north` (fixed houses, North
  SVG + box diamond) is the default; `south`/`east` stay as
  explicit fixed-sign alternatives. House numbers on North
  compartments too.

## 2.30.0

- House numbers on every fixed-sign compartment: fork East
  charts gain small dim numbers (counted anti-clockwise from
  Lagna), rich square boxes show `Hn · Sign`. "Second house"
  is now unambiguous on all surfaces.

## 2.29.1

- HTML gallery labels every chart (was title-less SVGs);
  SVG placements verified planet-by-planet against the drawn
  diagonals for both engines.

## 2.29.0

- HTML export rewritten as semantic markup (real tables,
  sections, headings + print CSS) instead of terminal
  `<pre>` spans.

## 2.28.0

- Mahadasa rows show their age ranges (schema `mahas[].age`;
  same engine spans as the text timeline).
- HTML view base type bumped to 15px (terminal cells cannot
  scale type — export-only improvement).

## 2.27.2

- Console dasa timeline: bars dropped — Mahadasa rows render
  bold like Antardasa rows (terminal cells can't scale type,
  so bold is the emphasis).

## 2.27.1

- Docs: engine-parity note (dos vs swisseph dasa dates differ
  legitimately; match the flag when comparing outputs).

## 2.27.0

- Report section completion: Birth Weekday, Julian Date +
  Ayanamsa, LMT + GMST rows (schema `times` extended), options
  panel moved up, confusing House column dropped, all
  Antardasa expanded by default, terminal diamond realigned to
  fixed-sign East geometry.

## 2.26.0

- Report data audit vs the native CLI (every houses-table
  value now verified present): modern planet spellings
  everywhere, full Nakshatra/Pada/Rasi-longitude columns via
  a new schema `details` block, dasa lords corrected, current
  maha auto-expanded, clock-form longitudes.

## 2.25.0

- Chart center boxes: rising sign + division label only (owner
  name/title dropped — already in the report); Lagna chart
  centers on the Lagna marker; light theme without font
  overrides (library defaults).

## 2.24.1

- HTML export tidies whitespace (per-line rstrip, blank
  collapsing; `<pre>` indentation untouched).

## 2.24.0

- Consistent localized reports: section titles + row keys now
  render in the report locale (machine-generated map from the
  translator files, test-pinned); values stay English.
- Charts match the report: light theme, center box carries the
  division + rising sign (no duplicated birth details).

## 2.23.0

- Charts via vendored jyotichart (MIT, pure stdlib): authentic
  East Indian fixed-sign anti-clockwise SVGs (default) + South
  squares, Sinhala/Tamil/English, all 8 charts in HTML export.
  Hand-rolled SVG retired; terminal text charts unchanged.

## 2.22.0

- Console mirrors the CLI: section order, Dasa Information +
  Selected Options panels, Shadvarga Positions, all 8 charts
  (Lagna→Moon) in terminal and as hand-rolled SVG (no new
  dependencies) in HTML export. Schema gains lagna seats.

## 2.21.0

- S5 HTML export: `--export-html FILE` writes a self-contained
  report (inline styles, double-clickable in any browser) —
  the shareable GUI-quality output with no server.

## 2.20.0

- S4 Bhukti drill-down: schema `dasa.mahas[].bhuktis`
  (balance-anchored first maha, forward spans after — same as
  the text timeline), `--dasa LORD|all` expands detail rows
  with ages in the rich timeline.

## 2.19.0

- S3 South Indian square chart: fixed-sign 4×4 grid renderer
  with Lagna highlight, `--chart diamond|south` (diamond
  default). No schema need; sign-pinning tested.

## 2.18.0

- S2 Avastha: schema gains the engine's planet-indexed `avastha`
  map (no plumbing needed — already computed); rich houses table
  grows its fifth column.

## 2.17.0

- S1 Hora + Chakra: schema gains `hora`/`chakra` blocks
  (backward-compatible), rich rows in the dashboard after the
  dasa timeline.

## 2.16.0

- Schema P1 blocks (additive): lagna, houses, shadvarga,
  panchanga, times, dasa — documented in json_schema.md,
  pinned by test_json_schema.
- Console full dashboard: two-column profile/chart-ref and
  time/panchanga groups, houses + shadvarga tables, kendra
  diamond, proportional dasa bars, provenance line.

## 2.15.0

- Console: modernized Sri Lankan diamond chart (default) —
  roomy color boxes, Lagna highlight, responsive width, houses
  derived from schema JSON. C++ charts frozen; square and other
  styles plug in later as options.

## 2.14.0

- Python console pilot (`console/`): rich full-width tables over
  `pystar` JSON (profile, longitudes, provenance) + typer CLI +
  pytest consumer tests. Engine untouched; the portable native
  binary stays the download-and-run product.

## 2.13.2

- macOS asset renamed `star-mac.dmg` → `star.dmg` (dmg is
  unambiguous on Mac); inner binary named `star`.

## 2.13.1

- macOS ships as `star-mac.dmg` (drag-to-Applications); README
  documents the Gatekeeper/SmartScreen one-time approvals.

## 2.13.0

- Portable releases: Linux builds fully static, Windows links
  the static CRT — release assets run with no install, like the
  original STAR.EXE. README Binaries rewritten as download/double-click.

## 2.12.1

- Docs: README covers districts, `--locale`, portable builds,
  Python bindings, and the JSON schema doc.

## 2.12.0

- Portable binary: `-DSTAR_PORTABLE=ON` fully static-links
  `modern_star` (~4MB, `VERIFY_ALL_GREEN`, Swiss engine works).
- Python bindings (nanobind, optional/off by default):
  `pystar.horoscope(...)` returns schema-v1 JSON (stdlib-json
  consumer, `bindings/smoke.py` green as `test_pystar`).
  Needs Python 3.9+ dev + pip `nanobind`.

## 2.11.0

- Phase 4 increment 1: frozen JSON schema `star-horoscope/1`
  (docs/json_schema.md) — provenance in every document
  (schema/version/method/engine/display/locale/birth/place),
  minimal string escaping, `src/JsonOutput.hpp` renderer,
  `tests/test_json_schema.cpp` conformance. Python/TS
  consumers later (binding decision open).

## 2.10.2

- Wording: modern options row "Manual Geo" → "Manual
  Coordinates" (concept + reverse-map follow automatically).
  Audit note: modern planet names were already correct
  (displayPlanet); slot variants live only in legacy output.
  Kendra case, tithi trio, Sinhala Time, Kendra Type stay —
  no safe target (reviewer calls).

## 2.10.1

- Correction policy extended (owner ruling): modern display now
  uses standard romanizations for 10 yogas + Brahma, Kimstughna
  for the karana, and Antardasa for the dasa timeline (engine
  tables + legacy output frozen; Swiss goldens re-recorded,
  glossary regenerated).

## 2.10.0

- Phase 3 live: first-draft Sinhala/Tamil rows for all 363
  concepts (all Draft, none Reviewed — machine-drafted, see
  docs/locale_notes.md). `--locale si|ta` now renders translated
  titles/keys/prompts with English fallback per cell.
- Modern wording fixes in the same pass: Birth Weekday, Local
  Mean Time (LMT), Greenwich Mean Sidereal Time, Local Mean
  Sidereal Time (core + concepts + glossary + Swiss goldens).
- Deliberately NOT changed: binary-attested spellings (Chadra,
  Rav1, Urenus/Urenes, Neptun, Pluuto, Brahhma), legacy
  uppercase titles, prompt padding — fidelity contract
  (docs/quirks.md); needs an explicit policy ruling to revisit.

## 2.9.7

- Phase 3: translations split into translator-editable
  `src/locale_si.inc` / `src/locale_ta.inc` (sparse rows with
  script + romanized + review status; absent = English
  fallback). Header no longer carries untranslatable cells.
  Tables start empty — output unchanged.

## 2.9.6

- Phase 3 increment 5: `--locale en|si|ta` wired through a
  reverse-map at the string-layer chokepoints (section titles,
  row keys, prompts, dividers). si/ta fall back to English cell
  by cell — si/ta output proven byte-identical to en. 363
  concepts; reverse-map round-trip tested (it caught a real
  table/enum misalignment plus a pointer-comparison bug).

## 2.9.5

- Phase 3 increment 4: locale model 264→353 concepts — all
  modern UI strings (row-function keys pinned by calling them,
  prompts/hints/titles/kendra labels transcribed exact).
  si/ta still Unsourced; output unchanged.

## 2.9.4

- Phase 3 increment 3: locale model 99→264 concepts — yogas,
  tithi limbs, karanas, 21 planet slot spellings, all attribute
  values (gana/linga/naadi/paxhi/gothra/varna/rajju/bhutha, 27
  yoni + 27 ruxha with binary literals intact). en pinned to the
  live tables; output unchanged.

## 2.9.3

- Phase 3 increment 2: 62 more locale concepts (9 dasa lords,
  27 nakshatras, 26 districts; 99 total), en pinned to the live
  tables. Still no renderer call-sites — output unchanged.

## 2.9.2

- Phase 3 scaffolding: `src/Locale.hpp` concept model (en + si/ta
  script/romanized + per-language review status; 37 pilot concepts:
  rasis, vargas, weekdays, months) with English fallback, plus
  `tests/test_locale.cpp` pinning en against the live modern
  tables. No renderer call-sites yet — output unchanged. Sinhala
  /Tamil sourcing awaits the named reviewer (plans.md Phase 3).

## 2.9.1

- Wording: the 26 list entries are districts — modern display,
  prompts, `--help`, and validation messages say District.
  Legacy byte-exact strings (`LIST OF CITIES`, …) untouched;
  `--city` flag and code identifiers unchanged.

## 2.9.0

- Feature: city table 15→26 — Ampara, Batticaloa, Gampaha,
  Kilinochchi, Kurunegala, Mannar, Matale, Monaragala, Mullaitivu,
  Nuwara Eliya, Vavuniya appended (decimal table, round-to-nearest
  minute). Entries 1–15 byte-frozen incl. the city-13 quirk;
  manual entry now >26; legacy + modern lists extended.

## 2.8.20

- Tooling: advisory `.clang-format` encoding the observed code
  style (4-space, K&R braces, 100-col, unsorted includes). Not
  CI-enforced and no sources reformatted — diffs stay reviewable
  against the golden contract.

## 2.8.19

- Patch: stale ground-truth references swept (§4.1a) — AGENTS.md
  checkpoints, CLI date hint, Ayanamsa/Panchanga/Vimshottari
  comment proofs now cite the dummy baseline (screen12/14 rows).
  Mechanism unit tests with synthetic inputs untouched.

## 2.8.18

- Patch: synthetic-data swap (§4.1a) — all birth-data tuples in
  code/tests/fixtures replaced with the dummy family, goldens
  re-baselined from fresh DOSBox captures; kendra home table
  completed 55→82 cells (all 8 charts decode to fixed GOTOXY cells,
  cross-chart consistent) + TRISANSAKA test-label fix.
  Full gate 25/25, VERIFY_ALL_GREEN.

## 2.8.17

- Patch: MSVC-only Windows leg — _MSC_VER compat shims
  (src/Compat.hpp), compiler-conditional flags, 64-bit enforcement
  on all platforms; MinGW retired from CI.

## 2.8.16

- Patch: README refresh — cross-platform intro, original-program
  section (screenshot + DOSBox-X), fixed quick-build line,
  star_linux/star_macos/star.exe artifact names.

## 2.8.15

- Patch: release notes consolidated to a single docs/releases.md
  (newest on top) instead of per-release files.

## 2.8.14

- Patch: release notes now maintained per-release under
  docs/releases/ (v2.8.12 backfilled); convention recorded.

## 2.8.13

- Patch: release workflow hardening from review — dropped the
  duplicated Windows configure step, dist/ guard, idempotent
  publish (upload --clobber when the release exists).

## 2.8.12

- Patch: release job checks out the repo (gh needs git context).

## 2.8.11

- Patch: portable temp dirs in test tools (tempfile, not /tmp —
  Windows test processes run native, where POSIX paths fail).

## 2.8.10

- Patch: CI ctest runs with --output-on-failure so failures
  self-report (no log archaeology for the last Windows leg).

## 2.8.9

- Patch: LF enforcement extended to asm/idc/TXT/json (same
  autocrlf class as the golden fix); extraction_check still under
  diagnosis, log requested.

## 2.8.8

- Patch: CI diagnostics — Windows configure/build/gate as separate
  steps to localize the red leg precisely.

## 2.8.7

- Patch: Windows CI fixes — enforced LF checkouts (.gitattributes,
  autocrlf broke byte goldens), portable temp dir in cli_config,
  .exe-aware binary discovery + current g++ fallback in corpus_run.

## 2.8.6

- Patch: Windows probe no longer requires plain `make`
  (mingw32-make is the standardized generator tool).

## 2.8.5

- Patch: Windows CI uses MSYS2-native cmake (the runner's cmake
  is absent from the msys2 PATH; probe proved it).

## 2.8.4

- Patch: renamed third_party/swisseph/VERSION to VERSION.txt — the
  bare name shadowed C++20 <version> via libc++ <iostream> and broke
  the macOS build (plus a no-extensionless-files rule for that dir).

## 2.8.3

- Patch: CI diagnostics (split configure/build steps, Windows
  toolchain probe) while chasing the macOS/Windows red legs.

## 2.8.2

- Patch: CI builds on main pushes (releases still tag-only);
  MinGW make added for the Windows leg.

## 2.8.1

- Patch: release-notes convention recorded (every GitHub Release
  ships notes; cut by manual tag push).

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

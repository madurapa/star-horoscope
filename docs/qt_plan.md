# Qt Desktop Implementation Plan

Status: direction decided 2026-09-25 (PySide6 QWidgets; Qt-native
dedicated print PDF; CLI demoted to oracle). Implementation not
started. Companion decision record: docs/architecture.md.

Ground rules (non-negotiable): the full gate runs green at every
step (ctest 26/26 zero warnings, pytest, `--verify`,
`locales_check`) — a step that reduces passing tests is a bug in
that step. No engine or golden changes (display words only, with
numeric-parity proof). Every user-visible string flows through
`tools/gen_locales.py` (new concepts welcome; si/ta fill in as
Draft with English fallback). No pytest-console test may be
weakened to fit new code.

## WS-A — Consolidation (prerequisite, S)

Kill the duplicated knowledge before a third consumer (Qt) copies it.

- A1: one canonical display-spelling map. Today: `displayPlanet`/
  `dasaName` (C++), `DISPLAY`/`DASA_DISPLAY` (+`YOGA`/`KARANA`) in
  `console/render.py`, `DISPLAY` in `console/kendra.py`,
  `GRAHA_DISPLAY` in `console/htmlreport.py`, glossary source
  tables. Target: C++ tables stay authoritative; console imports
  one mapping (or a generated one via `gen_locales.py` if the
  concept model covers it). Prove: full gate + `dump_glossary`
  output identical.
- A2: one chart-definition source. Today: `CHART_DEFS`
  (`render.py`), `DIVISIONS` + titles (`jychart.py`), kendra
  labels (C++). Target: single table (title, varga,
  lagna_planet, division label) consumed by terminal, SVG, and Qt.
- A3: decide the second-binary question (owner-confirm): v1 ships
  `star-report` (console) + `star-gui` as separate frozen
  artifacts (recommended — clean smoke boundaries); single-binary
  merge later, if ever.

## WS-B — Service layer (M)

Extract callable units so Qt, console, and tests share one path.

- B1: `console/services.py` — `validate_birth(...)` porting the
  C++ CLI rules (required fields; day-vs-month incl. leap-year
  Feb 29; hour/minute ranges; district list + manual geo;
  method choices) returning structured field errors, no prints.
- B2: `compute(args)` → validated `star-horoscope/2` doc via
  pystar, raising `ServiceError` on bad input. Rewire `app.py`
  onto B1/B2 with zero behavior change (pytest proves it).
- B3: shared view helpers extracted from `htmlreport.py`:
  `timeline_rows(doc)` (status computation) and
  `matrix_rows(doc)` (Shadvarga Matrix cells) — same objects feed
  Qt models and the HTML report.
- B4: binding extension (spike first): manual lat/lon + thathkala
  in `pystar.horoscope()` as default-off kwargs. The C++ batch
  path already supports both — expose, don't reimplement. If the
  spike shows engine-side work, split it out and sequence it first.
- Tests: service pytest matrix (valid/invalid incl. Feb 29, city
  bounds, manual geo); contract test: service output equals
  CLI/HTML values field-for-field.

## WS-C — Qt shell (M)

- C1: deps — `PySide6-Essentials` (Widgets, Svg, SvgWidgets,
  PrintSupport — CI proves the set; else full PySide6),
  dev-only `pytest-qt`. Delete the `PySide6` line from
  `freeze.spec` excludes.
- C2: `gui/` package — `gui/app.py` entry (`QApplication`),
  `MainWindow` + `QStackedWidget`: ProfileForm → ResultsTabs
  → ChartsGallery → Timeline → ExportBar. Native dialogs,
  keyboard navigation throughout.
- C3: i18n adapter (`gui/i18n.py`) over console `STRINGS`
  (`tr`/`trx`/`trv`) — no `.ts`/lupdate pipeline in v1, so the
  single-source rule holds trivially.
- C4: profile form — `QFormLayout`, per-field `QValidator`s
  (`QIntValidator`, date logic) + B1 domain validation on
  submit/blur, inline errors. Busy state during compute,
  error surface for `ServiceError`.
- C5: compute wiring — submit calls B2; results land in shared
  view-models (thin wrappers over the doc dict, no logic).
- Tests: `pytest-qt` with `QT_QPA_PLATFORM=offscreen` in CI —
  validation matrix, navigation smoke, baseline-profile compute
  smoke (numbers equal the golden profile).

## WS-D — Results views (M)

- D1: tables — `QTableView` + lightweight read-only models over
  the doc (Shadvarga Matrix via B3, houses, Panchanga/Hora/
  Chakra groups, dasa timeline with active-row highlight).
- D2: charts gallery — one `QSvgWidget` per `gallery_items()`
  SVG string (`QSvgWidget.load(bytes)`), grid layout matching
  the report's responsive breakpoints conceptually.
- D3: hero/profile header reusing `tr()`/`trx()` strings (same
  words as the HTML hero, Qt widgets instead of CSS).

## WS-E — PDF dedicated print layout (M)

NOT the screen HTML: a clean print design (A4 default, margins,
page numbers; single column; expanded timeline; literal chart
colors) built Qt-natively so no new dependency stack appears.

- E1: `gui/pdf.py` — `export_pdf(doc, path)`: `QTextDocument`
  tables/text + `QPainter` + `QSvgRenderer` charts → `QPdfWriter`.
  Headless-capable (`QT_QPA_PLATFORM=offscreen`), so
  `console/app.py --export-pdf` reuses the exact same function —
  one implementation serves GUI button and CLI flag.
- E2: PDF-text goldens (pypdf): sections present and ordered, all
  bhuktis expanded, baseline-profile numbers; plus one
  eyeball-reference PDF per release (manual check, not committed
  binaries — record the check in the session log).
- E3: README documents `--export-pdf` next to `--export-html`.

## WS-F — Packaging (M)

- F1: `freeze.spec` — Qt plugins/platforms/translations via the
  standard PyInstaller Qt hooks (verify, don't hand-roll);
  re-confirm the data-science excludes still hold with Qt
  present; keep one-file Linux, `.app`+dmg macOS (build-time
  codesign identity; ad-hoc until the DID decision), one-file
  Windows.
- F2: CI `freeze` job gains the GUI artifact(s) + extended smoke
  (`--help`, compute, `--export-html`, `--export-pdf`, offscreen
  GUI launch) on all three OSes + old-glibc container check.
- F3: release notes template gains the GUI + PDF lines (existing
  copy-paste process in `docs/releases.md`).

## WS-G — CLI demotion (S, docs + help text only)

- G1: README Binaries reorder (GUI first; C++ as engine/batch);
  `--help` epilog notes the GUI; `docs/plans.md` status note.
- G2: explicitly unchanged: C++ build, full gate, `--verify`,
  goldens, release artifact (batch users keep download-and-run).

## WS-H — Translators + release (S)

- H1: every new UI string enters `gen_locales.py` ITEMS as a
  concept first; `locales_check` covers it; si/ta ship as Draft
  until reviewed (established process, no change).
- H2: release cut follows the existing process (CHANGELOG +
  releases.md before tag; tag push builds everything).

## Sequencing

```text
A (maps) → B (services) → C (shell) → D (views) → E (PDF) → F (package)
     B4 spike first (may split engine-side work ahead of B2)
     G + H ride alongside from WS-C on
     F smoke needs C + E complete; no phase starts off a red gate
```

Size guide: S ≈ days, M ≈ 1–3 focused sessions each with green
gates between. WS-A/B are deliberately scheduled before any Qt
code so the GUI starts on a seam, not on duplicated knowledge.

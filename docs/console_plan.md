# Console UI plan (operative; supersedes docs/cli_ui_plan.md survey)

## 0. Ground facts the survey got wrong

- Our kendra charts are **not a "custom 3×3 invention"** — they are the
  DOS program's own diamond charts, reproduced cell-exact from a decoded
  GOTOXY table (55→82 homes). The diamond *is* the Sri Lankan style.
  There is no "which layout" question for fidelity: legacy keeps them.
- The engine is frozen and already serves JSON (`star-horoscope/2`
  via `pystar`). The console is a **pure consumer** — it can never
  corrupt calculations, only presentation. No engine work, ever.
- The portable native binary stays the download-and-run product.
  The Python console is for technical users (needs interpreter +
  `pystar` build). Two tracks, no mixing.
- The survey's mockup contains a real birth identity. Sanitized to
  the dummy family in this revision; numbers below are illustrative
  layout, not computed output.

## Method ruling (2026-09-21, owner complaint verified; refined same day)

East frame, fixed houses: house h always sits in position h
(anti-clockwise from top-center), signs rotate — matching the
CLI/DOS geometry. The Bengali fixed-sign reading is NOT used.
`--chart east` (default) renders this; `north` is the fixed-house
diamond alternative, `south` the fixed-sign square.

## 1. Library verdicts (minimal set, reasons)

| Library | Verdict | Why |
|---|---|---|
| Rich | USE (piloted) | Tables/panels/columns, auto width, `export_html` free |
| Typer | USE (piloted) | Flags mirror the native CLI subset, validation included |
| Pytest | USE (piloted) | Synthetic-doc consumer tests, no engine needed |
| Textual | DEFER | Only if an interactive TUI is wanted; static first |
| prompt_toolkit / questionary | REJECT | Typer + Rich cover static; Textual covers interactive — no third input stack |
| plotext | REJECT | Dasa bars are Rich `Text`/rule blocks; no numerical-plot need |

## 2. Layout doctrine (replaces fixed 80-col thinking)

- Width is detected (`Console()` default), `--width` overrides; tests
  pin fixed widths. Never hard-code 80 anywhere new.
- Dashboard order (full-width stacked sections; Rich `Columns`
  proved fragile with expanding tables, so groups stack even wide):
  profile, chart-ref, time+panchanga, houses table, shadvarga,
  kendra pair, dasa timeline.
- Narrow terminal: the same sections stack vertically, tables shrink
  (Rich handles it — no manual line math, unlike the C++ renderer).

## 3. Phases (each gated: pytest green + C++ gate untouched)

### P1 — Remaining sections, one commit each (schema adds are additive)

- [ ] **S1. Hora + Chakra rows.** Schema: `hora: {kala, pancha, sukshama}`,
  `chakra: {gana, yoni, ...}` (engine `horaChain` + `attributesFor`;
  display-truncation for yoni stays engine-side). Render: key-value
  rows beside dasa. Tests: synthetic-doc asserts.
- [ ] **S2. Avastha column in houses.** Schema: `houses` values become
  `{house, avastha}` (needs mode-longitude plumbing in JsonOutput —
  the only engine-side work in this list). Render: 5th table column.
- [ ] **S3. South Indian square chart.** No schema need (house data
  suffices). Fixed-sign 4×4 grid renderer + `--chart diamond|south`
  (diamond default). Tests: sign pinning per lagna.
- [ ] **S4. Bhukti drill-down.** Schema: `dasa.mahas[i].bhuktis`
  (engine `bhuktiTimeline`, additive). Render: expandable detail
  under each maha bar (`--dasa LORD` flag or all-detail mode).
- [ ] **S5. HTML export.** `Console(record=True).export_html()` behind
  `--export-html FILE`. Near-free; do anytime after P1 sections land.

### P2 — Deferred / on-request

- **Desktop GUI (PySide6 pilot: main window + houses table + diamond
  on QGraphicsScene)**: PARKED by owner 2026-09-21 until the static
  console + HTML export are done — then judge whether it still earns
  its keep against a double-clickable HTML file.
- **Textual TUI**: only on explicit go (static console first).
- **North Indian diamond**: only on explicit request.
- **Console localization**: renderers are English-only today (`--locale`
  passes through to JSON but nothing translates); needs a Python-side
  concept map — separate increment, not per-section work.

## 4. Non-goals

- No engine, schema-breaking, or C++ changes from this track.
- No new required dependencies for the native build (console deps
  are Python-side and optional).
- No 80-column layouts, no manual border math, no second input stack.

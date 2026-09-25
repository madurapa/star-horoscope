# Architecture Assessment: Cross-Platform Horoscope Application

Status: decided 2026-09-25 — PySide6 QWidgets; Qt-native dedicated
print PDF (not WeasyPrint); CLI demoted to headless oracle (not
deleted). Analysis phase only; no implementation started. Three
parallel deep-dives fed this (framework + licensing, engines,
PDF/packaging); load-bearing claims verified against the tree.
Detailed plan: docs/qt_plan.md.

## A. Current architecture

```text
┌─ User ─┐
         │ ① interactive TTY (prompts, --screen, --verify, --format)
         ▼
   src/main.cpp + CLI.cpp  ──  C++20, batch flags, validation
         │ ② computes HoroscopeResult (Engine.hpp: Dos | Swiss)
         ▼
   ModernRenderer (terminal UI)   │   JsonOutput (star-horoscope/2)
         │                              │ ③ pystar.horoscope() → JSON string
         ▼                              ▼ (bindings/pystar.cpp, ~60 lines)
   terminal screens          console/*.py (pure consumers)
                             render_all (rich) │ render_report (HTML string)
                                               │ jychart (SVG strings)
                                               ▼
                                    --export-html │ frozen star-report (13MB)
```

- **Calculation**: `src/` C++20. `Dos` = frozen DOS-faithful
  reconstruction (quirks deliberate, pinned); `Swiss` = vendored C
  `third_party/swisseph` v2.10.3final (Moshier, no data files).
  Shared downstream (varga/panchanga/dasa/avastha/sunrise). Contract:
  `tests/corpus/`, `tests/swiss_goldens/`, dual-engine verifier,
  26 ctest cases, zero warnings.
- **Boundary**: `star-horoscope/2` JSON is already the
  Calculation|Application interface, and `pystar` is its only
  crossing (~60 lines + `version`/`schema`). This is the future
  domain interface — it exists today.
- **Reporting**: `console/htmlreport.py` (self-contained HTML: inline
  CSS, base64 Noto ×2, inline SVGs), `console/jychart.py` (8 SVG
  strings via vendored pure-stdlib jyotichart + 12 zodiac assets),
  `console/i18n.py` (generated en/si/ta). 52 pytest cases.
- **Locales**: single-sourced (`src/locale_si.inc/ta.inc` →
  `gen_locales.py` → `i18n.py` + jyotichart blocks; 363 concepts,
  `locales_check` gate). si/ta rows are translator **Drafts**.
- **Packaging (proven)**: PyInstaller one-file `console/freeze.spec`
  → 13MB Linux binary, byte-identical output, CI freeze jobs for
  3 OSes. C++ ships fully static.
- **Absent**: no GUI/TUI framework beyond Rich, no PDF path, no
  Qt/Textual/weasyprint anywhere in the tree.

## B. Architecture problems (ranked)

1. **Display-spelling knowledge in 5+ places**: `displayPlanet`/
   `dasaName` (C++), `DISPLAY`/`DASA_DISPLAY`/`YOGA`/`KARANA`
   (`render.py`), `DISPLAY` (`kendra.py`), `GRAHA_DISPLAY`
   (`htmlreport.py`), glossary tables. The Surya→Ravi flip touched
   all of them by hand. Needs one canonical map before UI work
   multiplies consumers.
2. **Chart definitions duplicated**: `CHART_DEFS` (`render.py`) vs
   `DIVISIONS` + titles (`jychart.py`) vs kendra labels (C++). Same
   8-chart knowledge, three spellings.
3. **CLI presentation owns UX knowledge**: screen grouping, prompt
   texts, and validation live inside `CLI.cpp`/`ModernRenderer`;
   a GUI would re-derive them. Validation must move down to a
   callable domain layer (see F).
4. **Freeze shims accumulated in product code**: `sys._MEIPASS`
   branch (`htmlreport.py`), frozen-guard on the vendored-path hack
   (`jychart.py`), excludes list in the spec. Contained, but the
   next framework must not add more — it should be freeze-clean by
   construction.
5. **No PDF, no GUI, terminal-only i18n**: Sinhala/Tamil shaping is
   at the mercy of the user's terminal today — a permanent tax only
   real text rendering escapes.
6. **Translator Drafts + bulk**: si/ta are unreviewed; any new UI
   strings must flow through the single-source pipeline, not
   ad-hoc dicts.

## C. TUI (Textual) vs GUI (Qt/PySide6) — verdict: PySide6, QWidgets, no WebEngine in v1

Decided by project constraints, not generic preference:

- **SVG is the decider.** The 8 divisional charts + 12 zodiac assets
  are SVG strings. Textual has *no SVG widget* (only
  terminal-dependent Sixel/Kitty image hacks — GNOME Terminal and
  Windows Console excluded). Qt takes the strings directly
  (`QSvgWidget`/`QSvgRenderer`), including onto printer painters.
- **PDF-from-shared-code exists only in Qt.** Textual would force a
  parallel ReportLab/fpdf2 renderer (~1000+ LOC, permanent double
  maintenance). Qt prints `QTextDocument` + the same `QSvgRenderer`
  output to `QPdfWriter`. (For HTML-verbatim PDF, WeasyPrint behind
  `--export-pdf` is the validated non-Qt path — but that is export,
  not on-screen UI.)
- **The HTML string is not on-screen reusable either way.**
  Textual renders no HTML/CSS at all. Qt's `QTextBrowser` supports
  only an HTML4/CSS2.1 subset (no grid/flex/`<details>`) — so the
  report layout gets *rebuilt* in widgets, while `htmlreport.py`
  stays as the HTML-export path untouched. Do **not** reach for
  `QWebEngineView` to dodge this: it doubles the bundle
  (~100–200MB Chromium) for pixel-fidelity the screen does not need.
- **Trilingual shaping**: Qt/HarfBuzz renders Sinhala/Tamil
  correctly everywhere; terminals vary.
- **Packaging**: Qt Widgets via PyInstaller is standard practice
  (~40–90MB Linux, more on macOS/Windows) vs ~13–35MB for Textual.
  The size buys charts + PDF + forms that actually work.
- **Licensing (AGPL-3.0 codebase)**: PySide6 (LGPL) combines cleanly
  into an AGPL work with source-publication duties already met;
  keep `PySide6/` replaceable (`--onedir` story) and never vendor
  Qt sources. Avoid PyQt (GPL/commercial, nothing gained). Note:
  `freeze.spec` currently *excludes* PySide6 — that line goes the
  day Qt lands.

## D. Calculation layer — verdict: keep C++, reject pysweph and the port

- **pysweph is not a pure-Python port**: it is a C-extension wrapper
  (same C math, older C version than vendored v2.10.3final),
  single-maintainer, self-deprecated test suite, with a breaking
  `houses` change on the Lagna path. At most a read-only test
  oracle — never the feed.
- **A DOS-engine port is the highest-risk move available.** That
  engine is a *fitted* reconstruction; every quirk (non-carry
  seconds, truncation splits, 23|24 razor…) is load-bearing at 2″
  verifier tolerances. A Python rewrite re-risks float/truncation/
  rounding edge cases one by one, voids the golden contract (mass
  forced re-baselining destroys the ability to distinguish port
  artifacts from regressions), runs the 36k-case differential grid
  orders of magnitude slower, and trades a solved cross-platform C
  build for per-OS wheel matrices. Zero precision payoff.
- Keep: C++ engines + the 60-line nanobind boundary + vendored
  SwissEph (Moshier needs no data files). Proven — including
  byte-identical frozen output.

## E. Recommended architecture

```text
                ┌──────────────────────────────┐
                │  PySide6 QWidgets UI         │
                │  forms · tables · QSvgChart  │
                └──────────────┬───────────────┘
                               │ view-models (new, thin)
                ┌──────────────▼───────────────┐
                │ Application services (new)   │  validate() · compute() ·
                │                              │  timeline() · export_*() │
                └──────────────┬───────────────┘
                               │
        ┌──────────────────────▼──────────────────────┐
        │ Reporting (reuse, extend — no rewrites)     │
        │  htmlreport.py (HTML export) · jychart SVGs │
        │  + Qt widget builders over the same doc     │
        │  + Qt print layout → QPdfWriter (dedicated) │
        └──────────────────────┬──────────────────────┘
                               │ star-horoscope/2 JSON (already the seam)
                ┌──────────────▼───────────────┐
                │ pystar (nanobind, unchanged) │
                └──────────────┬───────────────┘
                               │
              ┌────────────────┴────────────────┐
              │                                 │
       ┌──────▼──────┐                  ┌──────▼──────┐
       │ DOS engine  │                  │ SwissEph C  │
       │ (frozen)    │                  │ (vendored)  │
       └─────────────┘                  └─────────────┘
```

Packaging: PyInstaller per OS (Linux one-file on 22.04 glibc floor;
macOS `.app`+dmg with build-time codesign identity for future
notarization; Windows one-file). PDF deps lazy so the lean binary
story survives.

## F. Migration strategy (incremental, no big-bang)

1. **Consolidate display knowledge** (small, safe): one canonical
   spelling/chart-definition map feeding C++, console, and the
   future UI.
2. **Extract validation + app services** from `CLI.cpp`/`app.py`
   into callable units (`validate_*`, `compute(doc)`, timeline/
   export helpers) with the existing goldens/pytest as the net.
   The CLI becomes one thin caller among future two.
3. **Freeze the service contract**: `pystar` JSON in → validated
   doc + timeline + report strings out. New UI codes against this,
   never the engine.
4. **Qt shell first**: main window + stacked views + profile form
   wired to real compute; charts via `QSvgWidget` on existing
   `gallery_items()`.
5. **Tables + timeline views** over the same doc objects the HTML
   report uses.
6. **PDF**: dedicated Qt print layout (`QTextDocument` tables/text
   + `QPainter` + `QSvgRenderer` charts → `QPdfWriter`: single
   column, expanded timeline, literal chart colors) + text-extraction
   golden tests. (WeasyPrint evaluated and set aside: with Qt
   accepted, native printing needs no extra system-dependency stack.)
7. **Packaging per OS** in the existing `freeze` job shape, then
   macOS `.app`/notarization path.
8. **Retire only when redundant**: the C++ binary stays as
   headless/batch + CI oracle (see challenges).

## G. Risks

1. **Fidelity leaks during extraction** — mitigated by the existing
   gates run at every step (a step that reduces passing tests is a
   bug in that step, per standing rule).
2. **Qt bundle size/trust surface** — mitigated by versioned
   releases, pre-release VirusTotal scans, documented
   right-click-Open flow, cert costed later.
3. **Print-layout fidelity drift** (dedicated layout vs screen/HTML
   diverging) — mitigated by shared doc-level helpers, PDF-text
   goldens, and one eyeball-reference PDF per release. (No Pango
   stack: Qt-native printing keeps the dependency set at PySide6.)
4. **Translator pipeline overload** — mitigated by routing all
   strings through `gen_locales` from day one, English-first with
   fallback.
5. **Second renderer rot** — mitigated by sharing doc-level helpers
   and PDF-text goldens, plus one eyeball-reference PDF per release.

## Challenges to the brief (standing unless overruled)

1. **Don't drop the C++ CLI.** Demote `modern_star` to headless/
   batch engine + CI oracle (goldens, `--verify`, gdb/sanitizer
   debug path) instead of deleting it. What gets replaced is its
   role as the user-facing UI.
2. **Don't assume TUI just because Rich is here.** The listed
   requirements (SVG, PDF, forms for non-technical users) are GUI
   requirements; Textual leaves charts and PDF unsolved while
   adding a terminal-compatibility matrix.
3. **"Python app ⇒ portable" is false without dedicated work.**
   Portability came from spec excludes, asset handling, `_MEIPASS`
   branches, per-OS CI, and glibc-floor discipline. Budget
   packaging as a workstream (a Qt app multiplies it).

## Owner rulings 2026-09-25 (settled, do not relitigate)

1. PySide6 / Qt Widgets — accepted (bundle size accepted).
2. PDF — dedicated clean print layout (Qt-native, not HTML mirror).
3. CLI — demote to headless/batch calculation and CI oracle (kept,
   not deleted).

# Phase-2 design — Swiss-Ephemeris second engine

Status: LANDED — v2.7.0 (feed + flag, DOS default), v2.8.0 (L3 goldens
+ Swiss default flip per §4.5). Implements plans.md Phase 2
under owner rulings §4.4 (Swiss backend) and §4.5 (default flips when
Phase 2 lands). Sibling doc: docs/plans.md §Phase 2 (authoritative
one-paragraph scope); this file is the buildable elaboration.
Post-landing deltas (remove_legacy): `--display` removed, JSON
`"display"` key dropped, verifier dual-engine, corpus Swiss.

## 1. Goal and non-goals

- Goal: a second, clean-math engine behind the same `HoroscopeResult`,
  selectable at runtime, so users can compare the frozen DOS
  reconstruction against a standard modern ephemeris.
- v1 scope (locked): SAME astrological system — Equal-house,
  Lahiri-like ayanamsa. Clean math only: no DOS quirks reproduced on
  the Swiss path (no non-carry seconds, no truncation splits, no
  stale-carry, no binary-literal FDDs — those stay DOS-only and
  documented in docs/quirks.md).
- Non-goals: quadrant/Sripati/Placidus/Bhava systems (Phase 5),
  KP sub-lords (Phase 5), ayanamsa options (Phase 5), Python/TS
  bindings (Phase 4; the JSON provenance fields below are its seed).

## 2. Interface

- `enum class EngineKind { Dos, Swiss };` in Engine.hpp (or a new
  EngineKind.hpp if the seam grows includes).
- Dispatch at the existing seam:
  `computeHoroscope(owner, geo, nirayana, EngineKind = EngineKind::Dos)`
  — wait, no silent default: the CLI always passes an explicit kind
  (standing rule: no defaults for method fields). The default-flip
  ruling (§4.5) is implemented as the CLI's explicit fallback when the
  flag is absent, decided once at landing time, not as a C++ default
  argument. Until landing, absent flag means DOS.
- `HoroscopeResult` is already engine-agnostic (decimals, DMS, JD,
  ayanamsa, panchanga limbs, dasa inputs) — renderers, dasa/varga
  timelines, and CLI work unchanged. The Swiss path fills the SAME
  struct; only the numbers differ.
- CLI: `--engine dos|swisseph`. The verifier asserts both engines
  (dual block, R4); `--verify` still pins the DOS checkpoints; the
  corpus runs Swiss. (Design said `--verify`/corpus ALWAYS DOS and
  display×engine independence — landed state per remove_legacy:
  `--display` removed, JSON `"display"` key dropped.)
- Provenance output: every run reports its engine (text banner line +
  `--format json` gains `"engine": "dos|swisseph"`). Phase 4 froze
  this into schema (minus `"display"`, dropped R6).

## 3. Swiss integration (deferred decisions recorded)

- Library: Swiss Ephemeris C sources, AGPL-licensed upstream. License
  fit: our LICENSE is AGPL-3.0, so the upstream AGPL terms are
  compatible — but adoption MUST update LICENSE/NOTICE attribution
  (third-party notice naming upstream + version) and README
  Requirements in the same change (standing rule).
- Build: this becomes the project's first third-party dep, which is
  the trigger plans.md sets for adopting vcpkg/Conan (currently
  DEFER). Vendor-vs-fetch decision lands with the implementation;
  do NOT hand-copy sources without a version pin.
- Ephemeris data: Swiss needs `*.se1` data files for full accuracy
  or falls back to Moshier. v1 decision (to confirm at build time):
  ship the minimal Moshier fallback OR fetch data at build;
  either way the L1 bounds below must state which was used.
- Sidereal mode: `SE_SIDM_LAHIRI`. Known model gap: the binary's
  ayanamsa (decoded Ca/Cc/dseg constants) is Lahiri-LIKE, not
  Lahiri-identical — L1 bounds absorb this (see §4), and the gap is
  documented, not tuned away.
- Houses: Equal-house from the Swiss Ascendant (swe_houses_ex Equal
  flag or Asc + 30° slices — implementation picks one and cites it).
- Sunrise/sunset, sinhala ghati, hora, avastha E02, panchanga limbs,
  dasa timelines: all downstream of positions/JD, so they reuse the
  existing code unchanged on Swiss inputs.

## 4. Validation gates (non-negotiable)

- L0 — frozen legacy suite: today's 21 tests + `--verify` run
  unchanged and green on the DOS path, before and after. Any L0
  regression from engine work is a bug in the engine work.
- L1 — differential harness (new `tools/diff_engines.py` or C++ twin,
  decided at build): BOTH engines over a frozen grid (proposal:
  monthly 1900-01-01..2100-12-01 x 15 cities x Nirayana = ~36k runs;
  Sayana spot-checks). Per-body arcsecond bounds are FROZEN IN
  ADVANCE as methodology (which bodies, which statistic — max abs,
  not mean), while the numeric bound values are recorded from the
  first run and approved, never auto-updated. Disagreement is
  EXPECTED (different models); the harness reports, it does not gate
  on zero.
- L2 — independent anchors: cited third-party values the Swiss path
  must reproduce within stated tolerance (proposal: Lahiri ayanamsa
  for 2000-01-01 from a named table, one JPL-Horizons-grade planetary
  longitude, Meeus worked-example JD). Sources cited at build time
  from named references — never a single web source, never invented
  here.
- L3 — frozen modern goldens for Swiss output: only AFTER L0+L1+L2
  are green AND the default flips.
- Default flip (§4.5): Swiss becomes the CLI fallback engine only
  when L0+L1+L2 are green together; `--engine dos` remains forever;
  `--verify`/corpus stay DOS-pinned regardless.

## 5. Landing sequence

1. Vendor/fetch Swiss + build wiring (LICENSE/NOTICE/README same change).
2. `EngineKind` + dispatch + `--engine` flag (DOS-only behavior unchanged).
3. Swiss position/house/ayanamsa feed into `HoroscopeResult`.
4. L1 harness + first differential report (bounds recorded, approved).
5. L2 anchors cited and green.
6. Default flip + L3 goldens + CHANGELOG minor bump (new engine =
   minor per version policy) + tag (fires Release per workflow).

## 6. Open questions (not blockers for design)

- Vendor vs FetchContent vs system package for Swiss sources.
- Moshier fallback vs shipped `*.se1` data for v1.
- Exact L1 grid density and per-body bound methodology values.
- Whether `--thathkala` uses the active engine or pins DOS (proposal:
  active engine — it is a live query, not a checkpoint).

## 7. Landing record (2026-09-20, v2.8.0)

- L0 green throughout (DOS suite untouched, all callers explicit Dos).
- L1 bounds frozen in tools/diff_bounds.json (36,783 cases).
- L2 anchors green (test_swiss_anchors).
- L3: tests/swiss_goldens/{baseline,user_d,user_e}.txt, modern
  display at width 80, compared byte-exact by test_swiss_goldens
  (banner/footer excluded: date/version).
- Default flipped: absent --engine now means Swiss; --engine dos,
  --verify, and the corpus pin the reconstruction unconditionally.
- Thathkala follows the active engine (live query, per proposal).

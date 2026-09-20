# Legacy archive — frozen reverse-engineering artifacts

This tree holds the **extraction debris** of the STAR.EXE reverse-engineering
track (owner ruling 2026-09-19, `docs/refactor_plans/FINAL_PLAN.md` §4.6).
It is **not built, not tested (except via `tools/check_extraction.py`),
and must not be re-linked into the product**. The engine source tree is
never forked; this archive exists for provenance and arbitration only.

- `STAR.EXE`, `STAR.EXE.i64`, `STAR.EXE.idc`, `STAR.EXE.asm`,
  `full_analysis_listing.asm`, `binary_blueprint.json`,
  `STAR.EXE_export_for_ai/` — the binary, IDA artifacts, disassembly
  dumps, and the extracted string/layout blueprint.
- `scripts/` — one-shot extraction harnesses (`extract_all.py`,
  `dump_*.py`, `r2_stage*.py`, `expB.py`/`expC.py` DOSBox drivers,
  `extract_strings.py`, `real48.py`). Run once, kept for the record.
- `suggestion/` — contemporary analysis notes and proposals from the
  extraction era.

Live references: `tools/check_extraction.py` runs
`legacy/scripts/extract_strings.py` over `legacy/STAR.EXE.asm` and asserts
the ported table spellings exist in the binary. Everything else under the
repo root ignores this directory.

Also archived here (moved during pre-publish cleanup): `star.py` (stale
engine wrapper pointing at nonexistent build paths), `try.py` (scratch
analysis notes), `tools/r2_out/` (unreferenced radare2 output).

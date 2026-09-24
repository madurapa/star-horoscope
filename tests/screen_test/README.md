# screen_test — engine data files

> Status 2026-09-24 (remove_legacy R3b+R5): the DOS capture corpus
> (`entries_*.txt`, `output_*/`), the capture/compare/fuzz scripts,
> and the memdumps are deleted; `test_hora_chain` and `test_screens`
> went with them. The DOS-capture campaigns they served are recorded
> in `docs/status_and_plans.md` (Sessions 13–17) and `docs/fuzzing.md`.

What remains, and what reads it:

| data file | test | notes |
|---|---|---|
| `karana_data.txt` (88) | `test_karana_data` | karana ground-truth rows (skips gracefully if absent) |
| `attributes_data.txt` (95) | `test_attributes_data` | attribute ground-truth rows (skips gracefully if absent) |

`tools/gen_fuzz.py` still generates coverage-matrix entry files for
engine runs; the L1 `tools/diff_engines.py` harness covers
DOS-vs-Swiss differentials.

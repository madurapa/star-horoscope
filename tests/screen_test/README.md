# screen_test — DOS capture corpus and harness

Pairing convention: `entries_X.txt` (inputs, `name|Y M D|H M|city`) feeds
`output_X/` (DOS screen captures, one `<slug>.txt` per entry). Every pair
below feeds a ctest **except where noted**.

## Wired pairs (ctest)

| entries file | output dir | test | notes |
|---|---|---|---|
| `entries_fuzz.txt` (106) | `output_fuzz/` | `test_hora_chain` | seasonal grid |
| `entries.txt` (7 active) | `output/` | `test_hora_chain` | baseline + person scenarios; `Invalid_*` lines stay commented (garbage inputs, unrecorded) |
| `entries_target.txt` (20) | `output_target/` | `test_hora_chain` | |
| `entries_supp.txt` (7) | `output_supp/` | `test_hora_chain` | |
| `entries_ab/odd/odd2/repro` | `output_ab*/output_odd*/output_repro/` | `test_hora_chain` | `output_ab*` are empty files (failed captures) — they skip with a notice until recaptured |
| `karana_data.txt` (88) | — | `test_karana_data` | port-vs-DOS incl. 75 BREAK anomaly rows |
| `attributes_data.txt` (95) | — | `test_attributes_data` | skips Keti-gana + Siyavsa/Puvaputupa-linga flips (documented DOS nondeterminism) |

## Manual tracks (not ctest)

- `compare_entries.py` — differential check (modern binary vs transcripts),
  takes `--entries`/`--out`; `analyze_fuzz.py`, `decode_dseg.py`,
  `fit_dump.py`, `gen_fuzz.py`, `resume_list.py` — analysis helpers.
- `capture_screen.sh`, `snapshot_mem.sh`, `run_all.sh` — capture pipeline.
- `memdump_target/`, `memdump_ties/` — emulator memory snapshots for the
  stack-leak findings; interpreted by hand (see `docs/fuzzing.md`), no
  automated asserts.
- `output/Invalid_*.txt`, `Leap_Year.txt` — captures whose exact inputs
  were never recorded; kept as reference, not wired.

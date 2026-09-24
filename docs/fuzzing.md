# Differential Fuzzing Runbook (DOS STAR.EXE vs modern_star)

> Status 2026-09-24 (remove_legacy R4–R5 — retired flow, kept as
> campaign record): the DOS-compare flow is gone (`run_all.sh`,
> `analyze_fuzz.py`, `compare_entries.py`, `resume_list.py`,
> `snapshot_mem.sh`, `decode_dseg.py` deleted; DOS outputs deleted).
> What remains for future engine work: the `gen_fuzz.py` coverage
> matrix (ranges re-decided in R5), the L1 `diff_engines.py`
> harness, and the runbook lessons below (timing knobs, failure
> modes, bucket taxonomy). Session-17 reference result stands as
> history.

Proven at 106 cases, 2026-09-16/17 (Session 17). This doc lets a future
thousand-case run go without rediscovery. Tooling lived in `tests/screen_test/`.

## 1. Pipeline (three stages, in order)

```
python3 tools/gen_fuzz.py [seed] > tests/screen_test/entries_fuzz.txt
LUA_WAIT=60 ENTRY_TIMEOUT=90 CAP_INTERVAL=0.1 CAP_STABLE=2 CAP_FLUSH=12 \
  ./tools/run_all.sh tests/screen_test/entries_fuzz.txt tests/screen_test/output_fuzz
python3 tools/analyze_fuzz.py --entries tests/screen_test/entries_fuzz.txt \
  --out tests/screen_test/output_fuzz --modern ./modern_star
```

- `gen_fuzz.py`: coverage matrix (SEAS/MOON/LAGNA sweeps + seeded random +
  leap days). Edit the matrix for new campaigns; keep the seed in the file
  header for reproducibility. Names must be unique (slug = output filename).
- `run_all.sh`: one DOSBox session, drives entries sequentially, captures
  full screen text per entry to `output_fuzz/<slug>.txt`. See §2 knobs.
- `analyze_fuzz.py`: exact-match diff with mismatch bucketing + DOS-side
  coverage stats. Exit 0 iff no hard-bucket hits. See §4 gate definition.

Reference result (seed 20260916, 106 cases): HARD_FAILS=0; tolerant
buckets EPHEMERIS 66 / KARANA 92 / RAZOR 38 / DASA-RAZOR 9 / ATTRIBUTES 3.

## 2. Timing knobs (env vars; defaults = slow-but-proven)

| Var | Default | Fuzz value | Meaning |
|---|---|---|---|
| `LUA_WAIT` | 90 | 60 | frames between Enters (60 fps ⇒ 1.0 s/screen) |
| `ENTRY_TIMEOUT` | 90 | 90 | seconds to wait per Lua script |
| `CAP_INTERVAL` | 0.25 | 0.1 | capture poll interval (s) |
| `CAP_STABLE` | 3 | 2 | stable polls before a screen is accepted |
| `CAP_FLUSH` | 8 | 12 | idle polls before buffer flush |
| `API_BASE` | `http://localhost:8386` | — | override for parallel instances |
| `DOSBOX_CONFIG_DIR` | `~/.config/dosbox-automation` | — | override (separate token per instance) |

**Hard constraint (learned the painful way): `LUA_WAIT` frames must exceed
`CAP_STABLE × CAP_INTERVAL` with margin.** At `LUA_WAIT=30` (0.5 s) with the
default 0.75 s stability window, NO screen ever stabilizes and captures
contain only `C:\>` prompts. Proven pairs: (90, 0.25, 3) and (60, 0.1, 2).
Per-entry wall time ≈ 25–45 s ⇒ budget ~1 h per 100 cases serially.

## 3. Failure modes seen in production (all fixed)

1. **Boot race**: typing `STAR.EXE` before the shell is ready swallows input;
   everything downstream fails fast. Fix: Lua waits `wait_for_text("C:")`
   first (pattern without backslash — Lua escapes bite).
2. **1-second input timeouts**: `wait_for_text(..., 60)` (60 frames) is too
   short for disk load variance. Input screens now wait 600 frames; only
   the 25 screen-advance Enters use fast `LUA_WAIT` pacing.
3. **Transitional empty `/script/status`**: right after load/start the API
   can return a whitespace-only body; `jq` succeeds with empty output, the
   poller saw `state=""` and aborted the entry (~13-line stub file). Fix:
   retry empty states (max 10), sleep 3 s after `script/start`, and
   `get_state()` never returns empty (maps to `unknown`).
4. **Mid-write analysis races**: files grow while entries run; analyzing a
   partial file yields bogus `dos=None` mismatches. Only analyze completed
   files (or rerun at the end).
5. **Shell self-kill**: `pkill -f` with a pattern matching your own
   `bash -c` command line kills your shell (tool timeout). Match narrowly
   (e.g. `pkill -f "run_all.sh <entries>"` still risky — prefer `pkill -f
   "star_run_"` for workers, and let the trap clean the AppImage).
6. **Single AppImage ownership (Session 19g lesson)**: run_all.sh and
   snapshot_mem.sh each start their OWN AppImage (rm token + launch +
   kill at cleanup). NEVER launch a manual AppImage alongside them, and
   never run two drivers concurrently: they fight over TCP :8386 (only
   the first binder serves; the other fails) and the token file (rewritten
   per launch -> Unauthorized errors + scripts talking to the wrong
   session, including dev-state reads/writes landing in a stale session).
   Symptoms: "response: Unauthorized", empty captures, pattern-search
   misses, mid-run wedges. Recovery: kill ALL instances by PID (never
   pattern-pkill your own shell), verify zero remain, start exactly one.
6. **Launch hangs the tool**: background the run with stdin detached
   (`</dev/null`), stdout/stderr to a log file; poll the log. Template:
   `VAR=... nohup ./tools/run_all.sh E O > /tmp/fuzz.log 2>&1 </dev/null &`

## 4. Gate definition (buckets in `analyze_fuzz.py`)

- **Hard (must be zero)**: `SUNRISE` (rise/set/sinhala/hora/avastha-only),
  `TIME` (JD/UT/sidereal/Lagna-rel), `DASA` (structural), `VARGA`, `OTHER`.
- **Tolerant (documented residuals)**: `EPHEMERIS` (≤1.5″ longitude/ayanamsa
  truncation), `KARANA` (repeating-rule breaks; dataset in
  `tests/screen_test/karana_data.txt`), `THITHI` (limb/yoga spelling guesses),
  `ATTRIBUTES` (Gana/Linga multi-variable rules; dataset in
  `tests/screen_test/attributes_data.txt`), `RAZOR` (exact hora-boundary births —
  every 12:00 birth sits on the day-hora 5|6 edge; Real48/double dust flips
  the index with identical times), `DASA-RAZOR` (sub-arcsecond Moon dust
  flips a day-split threshold; lords agree, dates ±1 day, Moon matches).
- `FUZZ_VERBOSE=1` prints every mismatch line. Coverage counters (lagna
  rasis, nakshatras, tithis, weekdays, dasa lords) prove matrix breadth —
  require 12/27/7 before trusting a "zero" gate.

## 5. Scaling to thousands

- **Throughput**: ~25–45 s/entry serially ⇒ 1000 cases ≈ 7–12 h. Run
  overnight with `nohup`; tail the log.
- **Resume**: `python3 tools/resume_list.py ENTRIES OUTDIR [MIN=200]
  > entries_todo.txt`, then run the subset. Re-run AFTER code changes
  (never trust stale outputs across binary versions).
- **Parallel instances** (untested — recipe, not proven): separate
  `DOSBOX_CONFIG_DIR` per instance (own token file), distinct
  `API_BASE` ports (DOSBox-side port setting unverified — find the
  `webserver` port key in `dosbox-automation.conf` first), split entries
  files, separate output dirs. C: mounts are read-only in practice
  (STAR.EXE writes nothing), so sharing the game dir should be safe.
- **Keep inputs valid**: day ≤ 28 (month-length safety), hours 0–23,
  minutes 0–59, cities 1–15. Invalid inputs (Feb 29 non-leap, 45:80,
  city 0) were covered by DEDICATED DOS edge captures (deleted R3b)
  + `tests/test_boundaries.cpp`, not the fuzz matrix — the comparator
  assumed sane inputs.
- **After the run**: re-run `analyze_fuzz.py` on the full set (never on a
  partial set), triage new buckets (a new bucket name or a SUNRISE hit =
  stop and investigate; spelling-shaped diffs = table corrections like
  Session 17), then re-run suites + `verifier` + the 10-file compare.

## 6. Memory snapshots (separate track)

`tools/snapshot_mem.sh` + `decode_dseg.py`: drive entries to the
Good Luck screen (program waiting, DS = dseg), dump `DS:0x0000–0x7E80`
via `/api/v1/memory`, decode Real48. Critical details: read DS live from
`/api/v1/cpu/state` (varies per load: `0x1983` observed vs IDA `0x278E`);
IDA `word_27XXXX` names encode LINEAR addresses (`true_off = name −
0x278E0`); snapshot BEFORE program exit (at `C:\>` DS is command.com's).
Used to bit-prove the sunrise mechanism + swap and to attribute the 1″
residuals (Session 16).

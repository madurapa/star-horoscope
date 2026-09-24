# Quirks — original-program behaviors reproduced on purpose

> Status 2026-09-24 (remove_legacy R6a — archived, not deleted): every
> entry below describes the **frozen DOS engine** (`--engine dos`), now
> the reference backend. The default Swiss backend intentionally
> diverges (measured deltas in `docs/status_and_plans.md` Session 127:
> all longitudes move ~2', dasa +15d). The catalog is preserved as the
> decode record; "fixing" a DOS-engine entry without an explicit
> re-baselining (plus a recorded justification) is still a breach.

This project is an independent reconstruction of a DOS-era Sri Lankan
Vedic astrology program (see `NOTICE.md`). Where the original's output
contains an apparent bug, odd rounding, or strange spelling, the DOS
engine reproduces it deliberately: the verifier's DOS block and the
engine tests pin that behavior, and "fixing" any entry below without
an explicit re-baselining (plus a recorded justification) is a fidelity
breach, not an improvement.

Each entry cites the source that implements it. The modern display
corrects *spellings* per `docs/glossary.md` but never changes a number.

## Degree splitting without carry

`AngularDegrees::fromDecimal` never carries seconds into minutes
(`src/Engine.hpp:110-121`). Shani 213:52:60 displays exactly that —
and the rasi-relative split is raw components, so it shows 3:52:60,
not 3:53:00 (Invalid_City proof). Lagna is never wrapped down either:
out-of-range values display raw (Invalid_Time Lagna 591:11:18), while
negatives wrap up (`normUp`; Sikuru -13.26 → 346:44:22).

## Time splitting with a 59.99 carry threshold

The time-table splitter (`displayHms`, `src/AstroTime.hpp:119-137`)
replicates sub_21EE1: seconds ≥ 59.99 promote a minute, minutes ≥ 59.99
promote an hour, with banker's rounding (`std::nearbyint`). Negative
clock values wrap by +24 once — and only on the display path (birth
00:00 prints UT 18:30:00 while the JD chain keeps the raw negative).
Positive values ≥ 24 print raw (Invalid_Time UT 40:50:00, LMST 32:52:45).

## Julian Date rounds half-to-odd

`formatJulianDate` (`src/ScreenRenderer.hpp:64-82`) replicates Borland
`%.3f` semantics: exact ties round half-to-ODD (Lagna10 X.6875→.687,
Lagna13 X.8125→.813, Lagna22 X.1875→.187 fuzz proofs). glibc uses
half-even and flips all three, so the stock `printf` cannot be used.

## Date splitting truncates; months borrow 30 days

`splitYmd` (`src/AstroTime.hpp:99-114`) is the sub_15FF8 replica: year
and month truncate, days use Pascal Round, and month 0 carries to the
previous December. The `carry30` flag path is kept although the flag is
never set on the dasa path. Dasa-table ages instead use a civil date
difference with fixed 30-day month borrowing
(`src/Vimshottari.hpp:79-90`).

## The 23|24 balance razor

The balance text (Trunc-split) and the dasa-table ages (30-day calendar
diff) are two legitimate conventions that disagree by a day: the
baseline prints balance Kethu 2-0-23 while the table age is 2-0-24.
The display flips within 0.2" of Moon longitude, and the engine Moon
sits 0.63" under the screen value, so both roundings are accepted by
the verifier (`src/CLI.cpp:823-831`). Never unify the two conventions —
that would diverge from ground truth.

## City 13: MATHARA label, Batticaloa coordinates

Slot 13 is labeled `MATHARA` but carries 7°40'/81°43' — Batticaloa's
coordinates, not Matara's (slot 3 is the real Matara:
`src/AstroStructures.hpp:57-76`). Never "correct" the coordinates to
the label; the mismatch is binary-literal.

## Binary-literal spellings

Kept exactly as decoded (modern display maps them per the glossary):

- `NRAYANA` for Nirayana (`--nrayana` accepted as well as `--nirayana`).
- `Siderial`/`siderial` in the screen-12 TIMES block.
- `Rav1` for Ravi in screen-06 planet cells and dasa-lord slots.
- `Chadra` for the Moon in the Hora B-order display table — load-bearing:
  the chain's remap logic string-compares against it
  (`src/Hora.hpp:10-14`).
- `Aakasha` (double a) for BHUTHA group 5, `Maanusha` for the Gana.
- City slots: `CLOMBO`, `A"PURA`, `K"GALA`, `POLONARU` (embedded quotes
  are binary-literal).
- Screen-14 header: `ALL MAHA AND ATHURU DASAS DURING PARAMAUSHA OF:`.

## Yoni field-width truncation

The stored Yoni strings are binary-literal 12-char fields
(`src/Attributes.hpp:43-59`), but the binary displays 10 chars: stored
`Mushikadena*` prints `Mushikaden`, stored `Sinha` + 7 spaces prints 10
chars (`displayYoni`, `src/ScreenRenderer.hpp:826-836`). The 2026-09-16
transcription that shortened the *stored* string was a capture artifact
and was reverted — store truthfully, render literally. Index 15
`Vyagradena*` keeps its asterisk per owner ruling 2026-09-19
(`docs/plans.md` §4.2).

## Gana Keti nondeterminism

Keti (nakshatra 3) matches no Gana set, so the binary keeps a stale
stack slot: observed DOS outputs are city-dependent (Moon17 with Galle
→ Maanusha vs Keti-pada-1 with Colombo → Raxha on identical
nak/pada/tithi/weekday/mode) with an overall record of Raxha ×6,
Maanusha ×1, blank ×2 (`src/Attributes.hpp:20-30`). No deterministic
rule can fit; the port returns the majority value Raxha.

## Blank Linga for Siyavsa

The LINGA Napunsaka check tests nak == 28, outside the 1–27 range —
a probable binary typo for 24. Siyavsa (24) Moon therefore yields a
blank Linga (`src/Attributes.hpp:10-12`). Reproduced literally.

## Misplaced fixed karanas

The binary's karana dispatch table puts the fixed karanas where the
textbooks do not: Shakuna at k=59 (classical 57), Chathuppada at k=44
(classical Chatushpada 58), Vanija at k=57 — "the table itself is
wrong", confirmed by re-decode (`src/Panchanga.hpp:173-190`). There is
no weekday term. Nakshatra display spellings likewise deviate from
classical (Berana, Ada, Pushha, Suvana, Siyavsa, Keti, Rehena,
Muvasirasa, Maa, Puvapal, Puvasala, Hata, Denata, Revathee;
`src/Panchanga.hpp:27-35`).

## Real48 arithmetic dust

The binary computed in Borland Real48 (40-bit effective mantissa,
round-half-even per op), emulated in `src/AstroTime.hpp:47-82` — proven
bit-exact on live dumps, including the +1e-6-day dust doubles lack.
Longitude razors caused by JD dust flip identically to the binary.
Related decoded constants that differ from textbooks: the GMST constant
24110.54541 (Meeus 24110.54841) and the ayanamsa epoch 2415020.5, half a
day later than the planetary-elements epoch 2415020.0 — the 0.5 d
matters (0.069"; `src/Ayanamsa.hpp:33-36`).

## Avastha stale carry

The AVASTHA remainder chains stale `DF4`/`DFC` words (init 0) whenever
Lagna is out of range (≥ 360), with a fixed call order (Lagna, Sandu,
Ravi, Budha, Sikuru, Kuja, Guru, Shani, Raahu, Kethu) and a blank gate
for Lagna plus the outer planets; the E02 term uses Pascal banker's
rounding (`src/Avastha.hpp:1-30`).

## Out-of-range rasi renders `**`

Pascal field-width overflow: rasi indices outside 1–12 print `**`
(observed in screen_test Invalid_Time Lagna Hora/Deshkana/Dvadasansa
cells; `src/ScreenRenderer.hpp:84-86`). Sunset hour prints mod 12
(`src/ScreenRenderer.hpp:762-772`).

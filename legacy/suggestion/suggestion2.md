# On That Analysis — Mostly Right, But It Misses the Strongest Lead

The distinction the text draws is correct and important. But it undersells what you already know: **your own code comments confirm the binary contains a sunrise table**. You're not reverse-engineering a formula — you're looking for a data structure that already exists.

## What the text gets right

- **Finite-table fixes converge.** Tithi limbs (15 cells), Yonis (27), karana names (≤60), nakshatra attributes — one capture per unattested cell and the table is closed permanently. This is a legitimately finished thing.
- **The sunrise per-date memoization does not converge.** Adding entries one at a time for observed dates is exactly the mistake the karana case illustrates: 11/11 fit, then broke on Loku.
- **The blast radius is real and asymmetric.** Longitudes, vargas, dasas, JD/ayanamsa are ported math — they don't depend on the sunrise table. Sinhala time, Hora Pancha/Sukshama, and all 9 Avastha cells *do*. Sunrise is the single largest correctness hole.
- **The karana `(k+weekday)%7` fit was a small-sample illusion.** Any black-box fit with <20 points and no holdout is suspect.

That's a clean, honest separation. The previous AI earned credit for owning it.

## What the text understates — three things

### 1. The binary already has the sunrise table, and you know where to look

From `Avastha.hpp`:
```
//   E02  = Round_bankers(2.5 * (birthDecH - sunriseH)) (sinhala-ghati rounded;
//          uses the TABLE sunrise, raw (possibly >24) birth hours).
```

The word "TABLE" is in your own provenance comment. And from `SunriseSunset.hpp`:
```
// All screens satisfy rise + set = 24:00:00 exactly, i.e. sunset
// is MIRRORED (set = 24 - rise), consistent with a tabulated-almanac
// sunrise (traditional panchanga tables) rather than a computed one.
```

So the question isn't "does the binary contain a table" — it's "**where is it and what shape is it**." That reframes the task from "reverse-engineer a formula from black-box points" (which never converges) to "dump a finite data structure" (which does).

### 2. The sunrise is *half-day symmetric* — that halves the search

`rise + set = 24:00:00` on every capture is not a coincidence and not physics. Real sunrise and sunset are asymmetric about noon because of the equation of time. This means the binary computes (or stores) **one value per (date, city)** — the half-day length — and mirrors:

```
sunrise = 12.0 - halfDay
sunset  = 12.0 + halfDay
```

Consequences:
- The table has **365 entries per city per year**, not 730.
- If the year is not stored, the table is likely **month/day keyed** (365 rows), with a **latitude or city offset formula** on top.
- A full dump is 365 × (small scalar). Under a kilobyte in raw form. That's a one-afternoon task once you find the base address.
- Or — more likely — a **32-row table** (one per 10-day solar segment) plus **linear interpolation**, which is what traditional Indian panchangas actually use.

Check for a `sub_XXXXX` that takes (dayOfYear, latitude) and returns a half-day value. That's your target.

### 3. The February/March impossibility is a *fingerprint*, not a bug

The comment says February/March points need H ≈ 84.1° which is physically impossible for Sri Lanka at any (altitude, obliquity). That's not a problem — that's a **signature**. It tells you:

- The algorithm is **not** the standard `cos(H) = (sin(alt) − sin(φ)sin(δ)) / (cos(φ)cos(δ))`.
- It might be a **fixed-declination table** (Surya Siddhanta-style: the sun's declination is tabulated at 30°-arc intervals).
- Or a **sinusoidal approximation** where the programmer used `sin(2π·(d − d0)/365)` with a phase error.
- Or a **Meeus-like formula with a porting bug** — you already found one in the GMST constant (`24110.54541` vs Meeus `24110.54841`). The same kind of transcription error in the sunrise routine is plausible.

Either way, an 84.1° half-angle is a strong discriminator. If you find a routine producing that, you've found the sunrise routine.

## What to actually do (concrete)

Priority order:

1. **Find the data segment table.** In the IDA export, look at `dseg` for a 365-, 180-, 32-, or 24-row contiguous array of `real48` values. The `real48` pattern is distinctive (6 bytes, characteristic exponent byte). If it's 365 rows, it's a daily table. If 32, it's likely 10- or 11-day bins. If 24, it's half-months.

2. **Find the sunrise routine.** Look for the string `"Sun rise"` or `"Sun set"` in the data segment, then follow xrefs. The routine that writes to the display buffer for those labels is your target. Read what it reads.

3. **Test the "half-day" hypothesis.** If the routine writes only one value and the print side does `12 + x` and `12 - x`, the hypothesis is confirmed. Then dump the source array.

4. **If it's a formula, port it exactly.** Don't fit. Read the constants, translate the trig, and ship the formula. This is the same discipline as the GMST and planetary element ports.

5. **Add a holdout set.** For sunrise specifically: pick 20 dates across the year and 3 cities, compute the fallback, and compare against a fresh capture. Report mismatch rate, not per-cell patches. If the fallback is off by 15.6 min for Loku but 44 s for baseline, something structural is wrong with the fallback *or* with the assumption that Loku's entry follows the same pattern. This is a clue, not a data point to absorb.

6. **Only after 1–5, decide about the observed table.** If you recover the formula/table, `kObservedSun[]` becomes a *test fixture*, not a data source. That's the right outcome.

## On the karana fix specifically

Same principle: `sub_1B689` is the karana routine (you've already named it). The `(k+weekday)%7` rule was a fit because you were fitting the *output*, not reading the *code*. The next step is the same: read `sub_1B689`, not add a 12th data point.

Don't holdout-test the current karana rule. Replace it.

## What the text gets slightly wrong

> 365 days × 15 cities ≈ 5,000 captures to enumerate — infeasible.

Only if you assume the binary's table is keyed by (date, city). If it's **365 half-day values + a per-latitude offset**, the enumeration is 365 values and the city dependence is a 1-line formula. The 15.6 min Loku error suggests the fallback is missing exactly that per-latitude term (or has it wrong). This is likely a 1-formula bug, not a 5,000-entry table.

> Any of them can break on the next capture.

True for **black-box fits**. Not true for **ported code**. The whole point of the STAR.EXE approach is that ported code (GMST, planetary elements, varga rules) does *not* break on the next capture because it reproduces the mechanism, not the output. The right answer to "will this break on a new date?" is "only if I fit instead of port."

## Bottom line

The analysis is honest and the framing (finite vs. infinite, fit vs. port) is right. What it misses:

- You already know the binary has a table; the task is to dump it, not infer it.
- The mirror symmetry halves the table size and points at the half-day-length structure.
- The 84.1° anomaly is a signature for a non-standard algorithm — use it as a locator, not as a problem to work around.
- The correct framing of the goal is: **recover the mechanism**, which makes holdout testing a confirmation rather than a discovery tool.

Yes, start on (1). The sunrise table/routine is the highest-value reverse-engineering task remaining, and it's probably a weekend's work if the data segment is intact.

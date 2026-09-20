I built it and ran it first, so this is based on the actual behaviour, not just a read-through.

```
g++ -std=c++20 -O2 -Wall -Wextra   → clean, zero warnings
./star --verify                     → VERIFY_ALL_GREEN (18/18)
```

## Overall

This is unusually disciplined reverse-engineering work. Every constant carries its real48 bit pattern, every rule carries its address and the scenario that proves it, and — rarest of all — the places where you're guessing are explicitly labelled as guesses (Trishansa even b1, tithi limbs 3/8/10/11/15, Karana's fixed branches, the unobserved Sukshama middle tier). The distinction you maintain between "bit-fidelity with a 1990s Borland binary" and "astronomically correct" is the right one and it's held consistently: the non-carrying seconds (`213:52:60`), the single-conditional-subtract reductions, the `nak == 28` Linga typo, the per-varga reduction habits. Most people would have "fixed" those and destroyed the fidelity.

So the code quality issues below are small. The interesting finding is in the data.

## The sunrise table is a wrong turn, and I think I can show why

`SunriseSunset.hpp` says the observed values "do NOT follow the standard hour-angle equation," that Feb/March needs H ≈ 84.1° which "would require solar declination -46 deg," and concludes the binary reads a tabulated almanac. The reasoning rests on one premise: that `rise + set = 24:00:00` exactly proves no equation-of-time term.

That premise doesn't hold. The mirror is equally consistent with the binary computing sunrise properly and deriving sunset as `24 - rise` for display — which is exactly what the screen suggests, since it prints 17:51:45 as "5 51 45".

Once you drop it, the gap closes exactly. For 1980-02-29 at Colombo:

| term | arc (deg) |
|---|---|
| H standard (alt −0.8333°) | 89.879 |
| equation of time, −12.63 min | −3.158 |
| longitude, (82.5 − 79.85) | −2.650 |
| **predicted arc** | **84.071** |
| observed arc (12 − 6:23:38) | 84.092 |

Five seconds. The 5.79° you couldn't account for is EoT plus the longitude correction your model drops (`kISTMeridianDeg` is declared but never used in the rise path — mean noon is hardcoded to exactly 12:00).

Across all eleven captured rows, with no fitting at all:

| date | city | observed | model | err |
|---|---|---|---|---|
| 1981-12-08 | Ratnapura | 06:08:15 | 06:07:59 | −16 s |
| 1979-12-01 | Ratnapura | 06:05:01 | 06:04:26 | −35 s |
| 1980-02-29 | Colombo | 06:23:38 | 06:24:03 | +25 s |
| 1989-02-29 | Colombo | 06:23:29 | 06:23:44 | +15 s |
| 1975-03-02 | Colombo | 06:22:52 | 06:23:36 | +44 s |
| 1985-04-10 | Colombo | 06:04:44 | 06:05:10 | +26 s |
| 1975-03-22 | Trinco | 06:08:50 | 06:09:03 | +13 s |
| 1990-05-15 | Galle | 05:53:30 | 05:54:07 | +37 s |
| 2022-08-01 | Galle | 06:04:18 | 06:04:32 | +14 s |
| 2025-09-22 | Galle | 05:58:09 | 05:58:49 | +39 s |
| 2026-09-12 | Colombo fb | 06:01:28 | 06:02:04 | +36 s |

RMS 24 s, max 57 s, mean −3 s, using a generic Meeus solar longitude rather than your decoded one. Note it holds at three different latitudes and across the Loku/Podi cases your current model misses by 15.6 min and 1.6 min.

This matters well beyond the display line. Your own comment says the table exists because sunrise error propagates into Sinhala time (×2.5), the Hora sub-lords, and the avastha E02 term — so every AVASTHA cell shifts. Right now that's only correct on eleven hardcoded dates, with a silent fallback to a model that's off by minutes, plus a 0.02° latitude match that makes a different city on a captured date fall through without warning.

The replacement:

```cpp
// Semi-diurnal arc + EoT + IST-meridian correction. Sunset mirrors (24-rise),
// matching the binary's display, but the ARC itself is not symmetric.
[[nodiscard]] inline double sunriseLocal(double jdn0, double latDeg, double lonDeg) {
    double r = 6.0;
    for (int i = 0; i < 3; ++i) {              // converges in 2
        const double jd = jdn0 + (r - kTZOffsetHours) / 24.0;
        const double decl = SolarDeclinationSayana(sunSayanaLon(jd));
        const double eot  = equationOfTimeMinutes(jd);
        r = 12.0 - HourAngle(latDeg, decl) / 15.0
              - eot / 60.0 + (kISTMeridianDeg - lonDeg) / 15.0;
    }
    return r;
}
```

Feed it your decoded Sun (`sunResult`) rather than a generic one and the residual should shrink further; whatever's left is then a real measurement of the binary's own EoT term, which is itself a decode lead. Worth keeping the eleven rows as a regression test rather than as the source of truth — and I'd drop the sub-second "fitted" fractions, since they encode model error into what's presented as ground truth.

The `kObliquityDeg = 23.45` / `kLagKobl` reuse is fine for fidelity, but note the sign convention: your `SolarDeclination` alias silently reinterprets its argument, which is the kind of thing that bites in six months.

## Data notes

- **City 13.** Labelled `MATHARA` with `// label sic in binary`, but 7°40′N 81°43′E is Batticaloa (7°43′/81°42′). Worth recording in the comment that the *coordinates* identify the city even though the string is a binary typo — otherwise someone later "corrects" the coordinates to match the label.
- **Three different nakshatra spans.** `kNakshatraSpan = 13.333333333328483` (real48-truncated) in `AstroTime.hpp`, `kNakSpanAv = 40.0/3.0` in `Avastha.hpp`, `kNakSpanPanch = 40.0/3.0` in `Panchanga.hpp`. The divergence only bites within ~2e-9° of a boundary, so it will never show up in testing and will be maddening if it ever does. Pick one, and if the real48 value is the faithful one, use it everywhere.
- **`GeoCoord::decimalLat`** breaks for southern/western coordinates (−6° 30′ → −5.5). Fine for Sri Lanka, a trap if the city table ever grows.
- **Karana** is the one rule you know is wrong (Loku, k=6 Monday → Vanija vs predicted Garaja). Given how cleanly the Avastha decode went via `sub_23A58`, I'd expect the same treatment of the karana store to beat further black-box fitting — no `(a·k + b·w + c) % 7` will fit because the table itself is probably wrong (Vanija appearing at both 4 and 6 is the tell).
- **Ayanamsa** is a two-epoch linear fit. Over ±100 years from 1981 the missing quadratic term is a couple of arcseconds, so it's fine — but the comment should say "valid ~1900–2100," because a linear ayanamsa extrapolated to 1600 is badly wrong and nothing in the code stops that.

## Code-level

Dead or duplicated, all confirmed by grep:

- `Ayanamsa.hpp` has `MeeusJD`, `GMST0`, `LMST` — zero callers, duplicating `meeusJdNoon`, `gmstMidnightSec`, `localMeanSiderealHours`. Two sources of truth for the JD is precisely the bug you'd never find. Delete them.
- `Avastha.hpp::avasthaFor` always returns `""`. Delete it; "kept for tests" isn't true, nothing calls it.
- `Attributes.hpp::panchaSukshama(const std::string&)` is shadowed by the real `Hora.hpp::panchaSukshama(double, int)`. Two functions with the same name, different signatures, same namespace, one of them obsolete — this compiles and will eventually pick the wrong one.
- `Ayanamsa.hpp` has a duplicated comment line (the "24110.54541 differs from Meeus" sentence appears twice).
- `truncHms`, and all of `Bhava.hpp`, have no callers outside tests.
- `kStarR2D` in `Ephemeris.hpp` is declared at global scope, outside `namespace star`.

Robustness:

- `CLI.cpp`'s `seats` lambda does `findLongitude(h.output, planet)->ecliptic` with no null check. Any missing key is a segfault rather than an error message.
- `--city 99` silently becomes Colombo with no diagnostic. `resolveGeo` has three fallback paths with different rationales; a one-line warning to stderr would cost nothing.
- The `--screen N` numbering doesn't match the `renderScreenNN` names (`show(5)` renders screen07, `show(7)` renders screens 09–14). It accepts 1–19 but only 1–14 do anything. This will confuse anyone but you.
- `Lagna.hpp` uses `double qcode` compared with `==` as a quadrant enum. It works because the values are assigned from literals, but it should be an `int`.

Build and structure: there's no build file in what you sent, and the `test_*.cpp` files reference `../src/...` so they only build from a specific layout. A minimal CMake + CTest with `--verify` as a test would make the fidelity guarantee enforceable rather than manual. `Ephemeris.hpp`'s machine-translated `t1..t276` bodies are unreadable by design — I'd mark them `// GENERATED FROM ASM — DO NOT HAND-EDIT` at the top of each function so nobody tidies them and silently changes a rounding.

One design question worth deciding explicitly: right now fidelity and accuracy are the same code path. If this is ever meant to be used rather than studied, a `--modern` flag routing to a real ephemeris (with the DOS quirks off) would let you keep the archaeological engine pristine while having something that's actually right. The seam is already clean — `Engine.hpp` is the only place that would need to branch.

Want me to write the sunrise patch against your actual `sunResult` and check the residuals, or work up the CMake/CTest scaffolding?

Ran all of them first. Everything is green:

```
test_boundaries / test_ephemeris / test_panchanga
test_phase2 / test_shadvarga (72/72) / test_trishansa (52/52)   all pass
verifier.cpp                                    119 passed, 0 failed
test_kendra / test_screens                      build clean (need screens/)
```

## On the tests

The suite is real — `verifier.cpp` and `test_screens.cpp` especially, since a byte-exact screen diff is the only assertion that actually encodes "fidelity". But several of the others prove less than they appear to.

**`test_shadvarga.cpp` executes no production code.** Look at what it touches: `rasiIdx` (defined in the test), and the `Rasi` enum. The 72 cells are screen06 names and screen07 numbers both hardcoded in the test, checked against a formula also written in the test. It's a spreadsheet validation of your reading of the screens. If `VargaEngine::GetNavamshaIndex` returned garbage tomorrow, this test stays green. Same structural issue in `test_kendra.cpp`: the charts are built from hardcoded screen06 names, so it tests `makeKendra`/`renderKendraPair` only — fine, but the header comment says "rebuilt from the screen06 seat table," which reads as if the engine produced them.

**`test_ephemeris.cpp` uses a different ayanamsa than the engine.** It hardcodes `23:34:21.0`; `Ayanamsa.hpp` uses `23:34:20.65` and says explicitly that the 21.0 anchor was an overfit to the rounded display. With a 2″ tolerance the 0.35″ gap hides. So the test can pass while the engine is wrong, and vice versa — it's validating a constant you've since rejected.

**2″ tolerance against a 1″ display.** Every DMS assertion in `verifier.cpp` and `test_ephemeris.cpp` uses `tolSec = 2.0`. The screens print whole arcseconds, so a 1.5″ drift changes the printed cell and the test stays green. For a fidelity project the assertion should be on the formatted string: `formatDMS(fromDecimal(v)) == "232 33 32"`. Keep a decimal tolerance only for things with no display (intermediate Sayana values). That would also catch the non-carrying-seconds behaviour, which no test currently exercises.

**Duplication that hides errors.** Six copies of the `CHECK` macro across the test files, with different semantics — `test_kendra`'s doesn't print on success, and its `ok ... art 21/21` is gated on the *global* `g_fail`, so once any screen fails the later ones report nothing. Three copies of `rasiIdx`/`RASI`, and two of them fall through to `Meena` on an unrecognised name while `test_shadvarga`'s returns −1. A typo in an expected value silently becomes Meena and passes. One `tests/check.hpp` and one `rasiFromName` in the production headers fixes both.

**Gaps.** `Attributes.hpp` (the whole 27×9 decode) has no direct test outside whatever `screen13` covers for one nakshatra. `SunriseSunset.hpp` has none at all — the eleven-row table is both the implementation and the unstated oracle. CLI config parsing has none. And the 8 machine captures your comments lean on constantly (Loku, Podi, Nimal, Invalid_City, Invalid_Leap…) live in prose, not in the suite; only baseline + T3 are actually asserted.

That last one is the fix I'd make first: a data-driven runner. `corpus/<name>/input.ini` + `expected/screen*.txt`, one loop that runs `computeHoroscope` and diffs. Adding a capture becomes dropping a folder, and every existing claim in the comments becomes an executable assertion. That's maybe 80 lines and it converts your documentation into tests.

Minor: `return g_fail` wraps past 255 failures; and there are no property tests (sweep 0→360 in 0.001° steps asserting every varga index is in 1..12 or −1, no NaN, no throw — cheap, and exactly where out-of-range semantics bite).

## Yes, extract from the ASM — and mechanize it

Fitting has taken you impressively far, but you've hit its ceiling, and the symptoms are all over the code: Karana fits 11/11 then breaks on the 12th capture; the Sukshama middle tier is an unobserved guess; Bahashana sits 0.01′ from a boundary; tithi limbs 3/8/10/11/15 are invented; Trishansa's even b1 is "by symmetry." A fitted rule is unfalsifiable outside its sample and silently wrong inside every unobserved branch.

The decisive argument is cheapness, though. A large fraction of what's still guessed isn't a *rule* at all — it's **string literals and constants sitting in the data segment**. Turbo Pascal `ShortString` is a length byte followed by characters. Every unobserved tithi limb, every unobserved yoga, the full avastha name list, the yoni/ruxha tables — they're all there, in table order, recoverable with zero ambiguity. You're guessing at data that's literally in the file.

### Plan

**Phase A — turn the .asm back into bytes.** Write a parser over `STAR.EXE.asm` that walks the `dseg` (and any other data segments) `db`/`dw`/`dd`/`dup` directives and reconstructs a byte image, plus an `offset → label` map from the IDA names. Everything downstream operates on `dseg.bin`, which is reviewable and diffable. This is a couple of hundred lines of Python and it's the single highest-leverage thing in the plan.

**Phase B — scanners over the image.**
1. *ShortString scanner*: length byte + printable run, emit `(offset, text)`. Sort by offset and the tables appear as contiguous runs — that's your spelling catalog, complete, in binary order.
2. *real48 scanner*: every 6-byte window with a plausible exponent byte, decoded to a double. Filter for values in sane ranges. You already decode these by hand; doing it exhaustively gives you a constant catalog keyed by offset, and the ones near a routine you're decoding are its parameters.
3. *Record-stride detector*: the city table is a 15×(label + 4 words) run. The same shape will find the other tables you haven't identified yet.

Then join each recovered offset against IDA's xrefs from the asm text: now you know *which routine* uses which string and constant. That's the map you're currently rebuilding by hand each session.

**Phase C — generated headers, not transcriptions.** Emit `Tables.generated.hpp` from the extractor, with the provenance comments (offset, segment) written automatically. A test diffs generated against your hand-written tables. Any mismatch is either a transcription bug (like `Mushikadena*` → `Mushikaden`, which you found the hard way) or an extraction bug — both worth knowing. Long-term the hand-written versions go away and the headers become derived artifacts.

**Phase D — targeted routine decodes, in this order.**
1. **Sunrise.** Biggest correctness payoff, and you now have a hypothesis to confirm rather than an open search: find the `Sun rise` print site, walk back to the routine, and look for an equation-of-time polynomial and an `82.5` load. If the EoT + longitude structure is there, the eleven-row table goes away and every date becomes correct.
2. **Karana** — the only rule you *know* is wrong. The doubled `Vanija` suggests the table itself is misread, so extract the table before re-deriving the rule.
3. **Ayanamsa** — replace the fitted anchor+rate with whatever constant the binary actually holds. Likely a single real48 plus a rate; Phase B hands it to you.
4. **`sub_1AE29`** (Pancha/Sukshama) — an 8-point fit with a fragile boundary is the definition of a rule that should be read, not guessed.
5. Trishansa even b1, Sukshama middle tier, `nak == 28` — these mostly fall out of A/B for free.

**Phase E — dynamic corpus, if you still have the executable.** DOSBox with scripted keystrokes and screen capture gets you hundreds of scenarios instead of eight, chosen to straddle every uncertain boundary (dates either side of each Trishansa bound, every weekday × karana cell, every nakshatra). Static extraction tells you the rule; the corpus proves the port. They're complementary, and the corpus is what makes Phase C safe.

### One rule for the whole thing

**The current 119 green assertions are the oracle.** If an extracted table changes a cell that presently matches DOS, the extraction is wrong, not the fit. Run Phase C's diff before adopting anything. Extraction replacing verified behaviour is the one way this project can go backwards.

If you upload `STAR.EXE.asm` I'll build Phase A and B now — the asm parser, the ShortString and real48 scanners, and a first pass at the string catalog. That should settle the tithi limbs, the yoga list and the avastha names within one session, and tell us whether the sunrise routine has an EoT term in it.


Good — the .asm is here. Let me build the extractors.Major hits already. Let me pull the other blocks and the sunrise routine.Found it. Now the real48 decoder and a trace of that block.Now the decisive test — implement the recovered formula against their own engine:Everything worked. Here's what the binary actually says.Extraction worked better than I expected. Headlines:

**One structural surprise:** `dseg` is pure BSS — every `db ?`. All the tables live as inline Pascal literals in the code segments, already length-prefixed and labelled by IDA. 400 recovered.

**Yoga: 14 of 27 names were wrong,** including #26 Indra → **Mahendra**. **Tithi limbs: all 15 recovered,** so the five guesses (Tijava, Atavaka, Dasamaka, Ekodasa, Pasoloswaka) are settled.

**Karana was wrong in both table and rule.** The binary stores exactly 11 karana strings in classical order — Kinsthugana, then Bava/Baalava/Kavlava/Thithila/Garaja/Vanija/Vishti, then Shakuna/Chathuppada/Naaga. There is no weekday term anywhere. The `(k + weekday) % 7` fit was spurious, and the doubled "Vanija" was the artefact of fitting a wrong table. With the textbook rule `kMov[(k-1)%7]`, the baseline gives Bava (k=22) and the Loku capture that broke the old rule gives Vanija (k=6). Both correct, no free parameters.

**Revert one prior correction:** the binary stores `'Mushikadena*'` (length 12). The DOS capture showing "Mushikaden" was field-width truncation, not the stored string.

**Sunrise is fully decoded, and the table can go.** Two findings. First, the premise that justified it is false — at the `Sun set time` print site the binary loads the immediate `12.0` and subtracts sunrise. Sunset is a display expression, so `rise + set = 24:00` says nothing about the model. Second, the routine is a standard hour angle at altitude −0°50′ plus **Spencer's equation of time, verbatim**, plus the `5.5 − lon/15` correction the port drops:

```
cosH    = -tan(lat)*tan(decl) + cos(90.8333°)/(cos decl · cos lat)
EoT_min = 229.18 * (0.000075 + 0.001868 cos B - 0.032077 sin B
                             - 0.014615 cos 2B - 0.040890 sin 2B)
sunrise = 5.5 - lon/15 + (12 - H/15) - EoT_min/60
```

Only deviation from published Spencer is the last coefficient, `0.040890` vs `0.040849`. Wired into your engine it reproduces all 11 captures at rms 11.6 s, max 28 s, with no fitting — against an off-table fallback that was missing by up to 15.6 minutes. And the block independently confirms the @Sin/@Cos FLIRT swap: Spencer's coefficients only land on the right terms once the swap is applied.

The residual is probably an artefact of my test (I forced birth hour 12:00 for every row, and `N` depends on the full JD). Tracing what feeds `sub_260ED` around asm line 2280 should close it.

Suggested order: apply the four table swaps first — zero algorithmic risk, and re-running your 119 verifier assertions should move only Karana and Yoga cells, toward the captures. Then swap the sunrise model and keep the 11 rows as a regression test. Then ayanamsa, `sub_1AE29`, Trishansa bounds.

Want me to trace the declination source next and close that residual, or apply the four table patches to the headers and re-run the full suite first?

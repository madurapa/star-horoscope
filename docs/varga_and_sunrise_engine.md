# Varga & Sunrise Engine Architectural Specification

## A. Shadvarga Matrix Mapping System

The software computes 6 distinct divisional charts (Vargas). Each division slices a standard 30° Rasi (Zodiac Sign) into fractional arcs. Planetary longitudes are mapped using these exact modulo loops:

### Rashi (D1 - Whole Sign)
Index = floor(Absolute Longitude / 30.0) + 1

### Hora (D2 - Arcs of 15°)
- **Odd Signs**: First 15° = Sinha (Leo), Second 15° = Kataka (Cancer)
- **Even Signs**: First 15° = Kataka (Cancer), Second 15° = Sinha (Leo)

### Drekkana (D3 - Arcs of 10°)
- First 10° = Same Sign
- Second 10° = 5th Sign forward
- Third 10° = 9th Sign forward

### Navamsha (D9 - Arcs of 3° 20')
Total arc minutes divided by 200'. Baseline sign index from element triad:
- Fiery (1,5,9): Mesha (Aries)
- Earthy (2,6,10): Makara (Capricorn)
- Airy (3,7,11): Thula (Libra)
- Watery (4,8,12): Kataka (Cancer)

### Dvadasamsa (D12 - Arcs of 2° 30')
Arc integer quotient adds directly to baseline natal Rashi index.

### Trishansa (D30 - Arcs of Varying Degrees)
Refit Session 13 over ~150 cells (8 machine captures + TRANSCRI1-4 +
screen06; see docs/status_and_plans.md Session 13 — NOT the classical
(5,10,18,25) and NOT the Session-8 interim (odd-18/even-10)):
- Odd signs: bounds (4, 9, 17, 24); rulers Mars/Saturn/Jupiter/Mercury/Venus
  map to Mesha/Kumbha/Dhanu/Mithuna/Thula (classical mapping).
  - V1/V2 = 4: T4 Budha 3.02 (V1) vs T3 Lagna/Raahu 4.49-4.52 (V2).
  - V2/V3 = 9: ILeap Sikuru 8.91 (V2) vs Test User C Sikuru 9.23 (V3).
  - V3/V4 = 17: T2 Ravi 16.13 (V3) vs ILeap Ravi 17.49 (V4).
    (Session-8 value 18 excluded by the ILeap cell.)
- Even signs: bounds (4, 11, 19, 24); rulers Venus/Mercury/Jupiter/Saturn/
  Mars map to Wrushaba/Kanya/Meena/Makara/WRUSHABA — arc4 (24-30 deg) reads
  Venus, never Mars (T2 Raahu/Kethu 24.44).
  - V2/V3 = 11: Test User C nodes 10.87 (V2) vs T3 Urenus 11.76 (V3).
    (Session-8 value 10 excluded.)
  - V3/V4 = 19: ICity Guru 18.82 (V3) vs T4 Ravi 19.73 (V4).
  - V1/V2 b1 = 4 by symmetry with odd (NO even rem observed in [2.97,4.34);
    disclosed gap-ambiguity; classical 5 excluded by Leap Sandu 4.74).
- V4/V5 = 24 both parities (odd: Test User C Sandu 23.91 V4 vs Test User B Kuja 24.41 V5;
  even: V4 max 23.24 vs V1-high min 24.21).
- Trishansa always wraps (norm360): Lagna-591 computes from Wrschika(8).

### Out-of-range semantics (Invalid_Time Lagna 591:11:18, birth 45:80)
- Negatives wrap UP (Sikuru -13.26 behaves as 346.74); positives NEVER wrap
  down (display + all Vargas see 591 raw).
- Rashi rule1: q = floor(lon/30); rasi = q<12 ? q+1 : q==12 ? 12 : q-12
  (591 -> Thula(7); w == 360 exactly -> Meena(12) via Meena jbe-360).
- Hora/Deshkana/Dvadasansa validate the raw quotient (outside [0,11] the
  getter returns -1, rendered `**`); in-range sums wrap with a SINGLE
  conditional subtract. Navamsa base tribe uses the rule1 rasi, sum wraps
  once (Lagna-591 -> 7+6 = 13 -> 1 Mesha).
- House-table row: whole tail (NEKETH/PADA/RASI/rel/AVASTHA) blank when
  w > 360 (finder-loop bounds); longitude + nothing else prints.
- Numbers screen (screen07): lagna-relative house ((sv-lag+12)%12)+1,
  except gated Lagna seats (-1) show the ABSOLUTE seat (ITime proof).
- Shadvarga `**` cells occupy widths 10/9/14 (Hora/Deshkana/Dvadasansa),
  not 11/11/11 (ITime Lagna row: `**` at cols 32/42/51, Trishansa back
  at 65; total 33 preserved). Mechanism undisclosed; reproduced literally.
- Kendra charts skip invalid seats (<1 or >12).

## B. Sunrise/Sunset Equation — RECOVERED MECHANISM (Session 15)

No almanac table exists: PROGRAM 0x122D8–0x12586 computes sunrise
analytically every run (traced with an 8086 emulator + byte-level capstone
audit; no 365-entry array anywhere in dseg). `src/SunriseSunset.hpp`
`nativeSunrise()` ports it exactly (all immediates are exact Real48
decodes); the old `kObservedSun` memorization table is deleted.

```
JD      = MeeusJD(date, no fraction) + (birthH - 5.5)/24   (binary JD
          convention: noon-epoch + UT fraction)
dayNum  = JD - (MeeusJD(y,1,0) - 0.5) - 1.0   (fractional day-of-year)
dayAng  = dayNum * 2*PI/365,  2*PI = 6.2831853071766091
EoT     = 229.17999999993481*(0.000075 + 0.001868*cos(dayAng)
          - 0.032077*sin(dayAng) - 0.014615*cos(2*dayAng)
          - 0.04089*sin(2*dayAng))  (Spencer, minutes) / 60 -> hours
T       = (JD - 2415020.0)/36525; sunLon = sunResult(T).lon  (Sayana)
sinDec  = sin(23.45deg)*sin(sunLon);  dec = asin(...)   (dseg 27DA8)
cosH    = sin(-50'/60)/(cos(lat)*cos(dec)) - tan(lat)*tan(dec)
          (binary form: cos(90d50')/(cos(dec)*cos(lat)) - tan(lat)*tan(dec))
rise    = (12 - H/15) - EoT + (5.5 - lon/15)            (dseg 27DBA)
set     = 12.0 - rise   (PROGRAM 0x15DD4 prints sunset on a 12-hour clock;
          display-identical to (24-rise)%12; Engine keeps setH = 24-rise
          for the Hora day-length and mods 12 at render)
sinhala = (birth - rise)*2.5, +60 if negative (PROGRAM 0x1255A clamp)
E02     = Round_bankers(2.5*(birth - rise))   (avastha term, unclamped)
```

Notes:
- Trig swap (see Ephemeris.hpp: blueprint @Sin -> cos(), @Cos -> sin())
  applies throughout: with TRUE functions the block above == the standard
  solar formula, byte-for-byte the binary's op sequence.
- The old "84.1 deg anomaly" (Session 11/13) was an artifact of assuming
  symmetric-about-noon (rise = 12-H/15). With the longitude correction
  (+9..13 min across Sri Lanka) and EoT included, ordinary H values fit
  every date (e.g. Feb-29 H = 89.91 deg, not 84.1). There never was a
  non-standard hour angle.
- Validation: mechanism vs DOS sunrise <= 0.5 s on all 7 dated captures
  (Test User D -0.34, Test User E +0.48, Test User +0.30, Test User A -0.18, Test User B +0.17,
  Test User C -0.03, Leap -0.06 s; residual = float53 vs Real48 rounding),
  display-identical on rise/set/sinhala/hora/avastha everywhere (485-check
  full-capture diff: only pre-existing ephemeris/karana residuals remain).
- A day-of-year approximation (EoT = 9.87*sin2b - 7.53*cosb - 1.5*sinb,
  dec = 23.45*sin(b)) was evaluated and REJECTED: fits Test User D only to -25 s.
  The binary uses Schlyter solar longitude + Spencer EoT, not crude
  day-angle approximations.

Local time = GMT/UT + 5:30 offset (hardcoded Sri Lanka timezone).

Sinhala time = (birth − sunrise) × 2.5 (+60 wrap when negative), exact to
the second on all entries once sunrise is right (Test User B 11:31:16, Test User C
6:30:24, Leap 43:58:25 proofs).

## Implementation Files

- `src/VargaEngine.hpp` / `src/VargaEngine.cpp` - Complete 6 Vargas
- `src/SunriseSunset.hpp` (header-only) - Hour angle + timezone
- `src/Ayanamsa.hpp` - Precession formula wired into pipeline
- `tests/verifier.cpp` - Phase 5 automated screen diff harness
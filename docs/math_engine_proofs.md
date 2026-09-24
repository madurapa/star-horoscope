# Math Engine Proofs — Planetary/Longitude Core

## 1. Routine roles (from `binary_blueprint.json` function sizes)

| Routine | Lines | Stack | Role (now proven/inferred) |
|---|---|---|---|
| `PROGRAM` | 8368 | — | Main flow; inline GMST/LMST block `0x1159d–0x11a33` (proven §7); inline trig (23 Cos, 8 Sin) for Moon-perturbation/panchanga |
| `sub_1D989` | 5170 | 2 | **Chart renderer**: Lagna/Navamsa Kendraya ASCII art via `GOTOXY` + `Write('Ke'/'Gu'/…)` gated on occupancy flags `word_27E42…27E50` (head at `0x1d989–0x1dac4`) |
| `sub_1CBB2` | 1519 | 500h | **String-concat chart builder** ( Kendraya box text assembly; no Real ops) |
| `sub_1B689` | 1585 | DF8h | Integer-heavy block (150 jcc, no direct Real ops) — Shadvarga/dasa-date candidate, open |
| `sub_1633A` | 2638 | ACh | **Vimshottari timeline engine+printer** (all Maha/Athuru string refs; lord table init Ravi 6 … Sikuru 20 at `0x1634e–0x16409`) |
| `sub_220B3` | 2011 | A2h | **Planetary ephemeris engine** (99 mul, 41 div, 21 Sin, 25 Cos, 2 Sqrt, 4 ArcTan) — Phase 3 target |
| `sub_18760` | 1164 | 0 | **Lagna/ascendant engine** (33 mul, 32 div, 11 Sin, 10 Cos, 5 ArcTan; called at `0x11a33` right after sidereal block) — Phase 3 target |
| `sub_23A58` | 2703 | 32h | **Nakshatra/pada finder + printers** (189 jcc; finds nak `0x23a93–0x23b08`, pada `0x23b1b–0x23b69`, rasi-pointer table) |
| `sub_21576` | 1132 | 0 | Called at `0x11424` (post-coords) and atop `sub_1633A` — preprocessing, open |
| `sub_195D3` | 1636 | 0 | Post-method (S/N) compute block (light Real use) |
| `sub_2564E` | 136 | 24h | **Julian Date** `JD = f(Y, M, D.frac)` — proven §2 |
| `sub_15FF8` | 123 | 0 | **Fractional-year → Y/M/D splitter** — proven §8 |
| `sub_21EE1` | 148 | 12h | **H/M/S display splitter** (Int/Int/Round + 59.99 carry) — proven §9 |

> Full per-line proof of `sub_1D989`'s remainder, `sub_1CBB2`, `sub_1B689`, `sub_1633A` (trig-call census: `@Sin/@Cos/@ArcTan/@Sqrt` sites, iteration bounds, table base addresses) is open work — see `status_and_plans.md`. The head of `sub_1D989` is conclusively I/O, not math: it positions the cursor and writes two-letter planet glyphs.

## 2. Proven: `sub_2564E` = Meeus Gregorian Julian Date (Real version)

Signature: 3 Turbo-Pascal Reals in, 1 Real out (`retf 12h` = pops 18 bytes = 3 Reals: year, month, day-with-fraction).

Pseudocode recovered (`0x2564E–0x257dc`):

```
if (M > 2.0):  Yp = Y;    Mp = M
else:           Yp = Y-1;  Mp = M+12        # 0x2565c–0x256d6, cmp vs 2.0 (82 00..), ±1.0 (81 00..), +12.0 (84 40..)
A  = Int(Yp / 100)                          # div by 87 48 00.. = 100.0, @Int
B  = 2 - A + Int(A / 4)                     # div by 83 00.. = 4.0
JD = Int(365.25 * (Yp + 4716)) + Int(30.6001 * (Mp + 1)) + D + B - 1524.5 + (1720994.5 folded)
```

Constant proofs (Turbo Pascal 6-byte Real, exponent byte first):
- `87 48 00..` → 100.0 (64 × 1.5625; `0x48/0x80 = 0.5625`).
- `83 00 00..` → 4.0; `82 00 00..` → 2.0; `81 00 00..` → 1.0; `86 70 00..` → 60.0.
- `89 00 36A0..` → 365.25 (256 × 1.42676…).
- `93 85 013A 74CD..` → 30.6001 (Meeus monthly coefficient).
- `95 14 0052 15..` → 1720994.5 (= 365.25×4716 − 1524.5 folded jar).

Check against ground truth: `sub_2564E(1981, 12, 8.309…)` + fraction handling in PROGRAM yields screen12 `JULIAN DATE : 2444946.809`. Standard Meeus gives JD(1981-12-08 07:25 UT) = 2444946.809 ✓ (see `time_and_dasa_logic.md`).

## 3. Proven: decimal conversions (minutes/60)

Pattern at `0x10d2a`, `0x10d7d`, `0x10dad`, `0x10ee3`, `0x1142d`, `0x11462`:

```
Real(minutes) /= 60.0            # CX=86h SI=0 DI=7000h
decimal       += Real(degrees)   # @$brplu
```

C++ equivalent: `decimal = degrees + minutes / 60.0;` — exact, no precision trap (values < 100, `double` exact to 1e-12 ≪ 1 arcsec).

## 4. Proven: IAU GMST block (PROGRAM `0x1159d–0x118ea`) — full decode, supersedes earlier shape note

Decoded with an exact Borland real48 decoder (validated on 1.0/2.0/3.0/60.0/100.0/5.5/12.0/365.25/30.6001/1720994.5):

```
T       = (JDN0 - 2451545.0) / 36525.0          # Julian centuries since J2000; JDN0 = sub_2564E(Y,M,D-int)
GMST0s  = 24110.54541 + 8640184.812866*T + 0.093104*T^2 - 0.0000062*T^3
GMST0h  = (GMST0s mod 86400) / 3600             # -> word_27BF2
LMST    = GMST0h + birthDecH + UT*0.0027379093 - (82.5 - lonDec)/15   (mod 24)  # -> word_27BF8
printed "Universal Siderial" = (LMST - 5.5) mod 24                  # -> word_27B42
UT      = birthDecH - 5.5                       # -> word_27DDE
TLM     = birthDecH - (82.5 - lonDec)/15        # true local mean, -> screen "12:46:36"
RAMCish = UT + lonDec/15  (mod 24)              # -> word_27D7E, feeds sub_18760 (Lagna)
```

Notes: `24110.54541` differs from Meeus's `24110.54841` by 0.003 s — replicate as-is. `JDN0` is the MIDNIGHT JD (integer day arg); the day fraction advances GMST0 via the `birthDecH + UT*excess` terms (classic GMST0 + UT*1.002738 + lon/15 composition).
Numeric check (baseline): GMST0 = 05:06:39.xxx, LMST = 17:54:29.055, pseudo-GMST = 12:24:29.055, JD = 2444946.809028, TLM = 12.776667 — all match screen12 after display splitting (§8).

## 7. Proven: sub_15FF8 = fractional-year → Y/M/D splitter

```
Y = Trunc(R);  M = Trunc((R-Y)*12);  if M==0 { Y--; M=12 }
D = Round((((R-Y)*12)-M)*30)         # Pascal Round (half away from zero)
+ flag-gated carry: if flag && D>=30 { M++; D=0 }; if flag && M>=12 { Y++; M=0 }
```
Epoch form: `R = Y + M/12 + D/365` (note: month/12, so December contributes +1.0; R(1981,12,8) = 1982.0219178). The flag byte (`[bp-9Ah]`) is never written by caller `sub_1633A` → carry path dormant on the dasa path. This splitter explains the "Ketu +2-day bias": R0+B = 1984.0885 → (1984, 1, Round(1.86)=2).

## 8. Proven: sub_21EE1 = H/M/S display splitter

```
H = Int(X);  M = Int((X-H)*60);  Sf = ((X-H)*60-M)*60
if Sf >= 59.99 { M++; Sf = 0 };  if M >= 59.99 { H++; M = 0 }
S = Round(Sf)     # Pascal Round = banker's (half to even)
```
Threshold constant real48(`5C86 C28F 6FF5`) = 59.98999999999069 (≈59.99). Reproduces all seven screen12 time rows exactly, including UT 07:25:00 (via the 59.99 carry on Sf=59.99999) and Sinhala :52 (banker's Round of 52.5).

## 5. Time-scale chain (addresses)

`Read time` → decimal hours (`0x10edf`) → (+ city path) → `sub_21576` (`0x11424`) → `sub_2564E` JD (`0x1158d`) → T-polynomial (`0x1159d`) → … → screens 12 values. Timezone −5:30: `12:55 − 5:30 = 07:25 UT` exactly (screen12), so `UT = local − 5.5h`.

## 6. Validation anchors (exact, zero-variance targets)

screen05 Nirayana longitudes (D:M:S) — Lagna 334:50:42, Chandra 9:23:49, Ravi 232:33:32, Budha 231:17:00, Sikuru 276:02:26, Kuja 152:42:30, Guru 188:32:33, Shani 176:32:50, Raahu 90:52:13, Kethu 270:52:13. Note Kethu = Raahu + 180° exactly (270:52:13 − 90:52:13). Outer planets (Urenus/Neptun/Pluto) also listed — engine covers 13 bodies + Lagna.

screen06/07 Shadvarga: numbers = Bhava-style house counts from Lagna's varga seat —
`house = ((planetVarga − lagnaVarga + 12) % 12) + 1` — proven over all 72 cells
(tests/test_shadvarga.cpp), except gated Lagna seats (-1, Invalid_Time) show the
ABSOLUTE seat (Session 13). Rasi-index map Mesha=1 … Meena=12 confirmed by the same test.

## 6b. Validation anchors, Session 13 (machine captures + TRANSCRI)

- Avastha formula (sub_23A58 loc_25464): idx = (DF4·DF6·E00+E02+DF8+DFA) mod 12;
  117/117 cells over 13 runs (`src/Avastha.hpp`).
- Trishansa bounds: odd (4,9,17,24), even (4,11,19,24) (~150 cells).
- Sunrise NATIVE mechanism (Session 15, `src/SunriseSunset.hpp`
  `nativeSunrise()`, PROGRAM 0x122D8–0x12586): no table; Schlyter Sun +
  Spencer EoT + hour-angle with lon correction; sunset display = 12 − rise
  (0x15DD4); <=0.5 s vs DOS on all 7 dated captures, display-identical
  on rise/set/sinhala/hora/avastha. Replaces the old table hypothesis.
- Comparator `screen_test/compare_entries.py`: 385 checks, 5 disclosed
  mismatches (4× sub-arcsecond ephemeris truncation + 1× garbage-input cell).

## 9. Proven: IDA FLIRT swapped the Sin/Cos runtime names (critical porting rule)

`@Sin$q4Real` (0x26b36) computes COSINE; `@Cos$q4Real` (0x26b49) computes SINE. Proof chain (six independent legs): Sun sine-closure 0.67" vs 2.58°, tan-half tan-vs-cot structure, runtime small-x shortcut returns x (sine behavior), K_sin = -pi/2 exact, Rsun needs cosine at far-@Sin site, full 13-body closure <0.7" on two dates 44.7y apart (tests/test_ephemeris.cpp).
Port rule: blueprint `@Sin` calls -> `cos()`, blueprint `@Cos` calls -> `sin()`. (The STAR.EXE_export_for_ai/AGENTS.md substitution mandate assumes direct mapping — that assumption is WRONG; empirical evidence rules.) ArcTan/Sqrt labels verified correct by the same closure.

## 10. Proven: Earth radius uses 27C46 = M + Ceq (not pure M)

`27C7C = K*(1-e^2)/(e*cos(27C46)+1)` with `27C46 = M + Ceq` (PROGRAM 0x1210b). Using pure M errs R by +1e-4, shifting Venus 31", Mars 14", Jupiter 3" via reduction sensitivities. With M+Ceq: 1981 all bodies <0.7", 2026 all <0.5".

## 11. Phase 3 validation status (tests/test_ephemeris.cpp)

1981-12-08 Nirayana: all 13 bodies <=0.67" (most <=0.4"). 2026-09-12 second date: all <=0.5". Residuals are harness artifacts (hand-typed screen JD/ayan); exact ayan formula closes them in Phase 5.

## 12. Proven: sub_25F30 = tan, sub_25FC7/25F7D = standard deg2rad/rad2deg

sub_25F30(x) = @Cos(x)/@Sin(x) (Cos-result divided by pushed Sin-result) = TRUE sine/cosine = TAN under the swap (NOT cot — numerator/denominator order matters). sub_25FC7(x) = (x/180)*pi and sub_25F7D(x) = (x/pi)*180 are STANDARD conversions (divisor (88,0,3400) decodes to exactly 180.0). Proof: Lagna tail closes to 0.44" with tan; cot gives asin domain error (NaN).

## 13. Proven: Lagna engine sub_18760 (tests/test_ephemeris.cpp, err 0.44")

RAMC = LMST*15 with edge guards (==360->0, <=1.6e-8->tiny, snap near 180); MC = RAMC+90 with quadrant code 1-4 and reduced angle; D = atan(sin(lat)/(cos(red)*cos(lat))); B68 = D +/- 23.45 (q 4/1 vs 3/2); main atan branch (B68<90) with per-quadrant Asc (q1:plain, q2:180-, q3:180+, q4:360-) else alternate; tail via asin-chains + RAMC inverse interpolation Lagna = ai + (RAMC-bc8)*(aj-ai)/(bce-bc8). Obliquity const 23.45, pi = 3.1415926535883045 (real48).

## 14. Proven: native sunrise mechanism, no almanac table (Session 15)

(a) String XREF ("Sun rise time" <- 0x15d86) locates a pure-computation
block PROGRAM 0x122D8-0x12586 (Real48 immediates + date/city/birth only);
dseg contains no 365-entry array, and an 8086 emulator executing the
program reads no table addresses on the sunrise path.
(b) No-crash proof for the trig swap: under IDA labels the arccos input
evaluates to -16.89 (Sqrt domain error), yet the binary runs; under the
swap (§9) every asin/acos input is valid program-wide.
(c) Closure: the ported mechanism (`nativeSunrise()`, exact Real48
decodes) reproduces all 7 DOS sunrises to <=0.5 s (sub-display Real48 vs
double rounding; every rise/set/sinhala/hora/avastha display identical),
including the old "84.1 deg anomaly" dates, which take ordinary
H ~= 89.9 deg once lon correction + EoT are included (the anomaly assumed
symmetric-about-noon). Sunset display = 12.0 - rise (PROGRAM 0x15DD4).

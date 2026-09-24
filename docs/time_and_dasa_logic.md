# Time & Dasa Logic — JD, Timezone, Ayanamsa, Vimshottari

Ground truth: `screens/screen12.txt` (times), `screen14–16.txt` (Dasa timelines), baseline birth `1981-12-08 12:55` local, Ratnapura `6°37′N 80°24′E`, Nirayana.

## 1. Julian Date

- Routine: `sub_2564E` = Meeus Gregorian JD (proof in `math_engine_proofs.md` §2).
- Anchor: screen12 `JULIAN DATE : 2444946.809`.
- Verification: 1981-12-08 00:00 UT = JD 2444946.5; +07:25 (= 7.41667 h = 0.30903 d) → **2444946.80903…** → displayed `2444946.809` ✓ (3-decimal truncation/rounding — to be pinned in Phase 2 against print format `@Write Real width`).
- C++ reference:
```cpp
double julianDate(int y, int m, double dayFrac) {
    int yp = (m > 2) ? y : y - 1;
    int mp = (m > 2) ? m : m + 12;
    int A = yp / 100;
    int B = 2 - A + A / 4;
    return std::floor(365.25 * (yp + 4716)) + std::floor(30.6001 * (mp + 1)) + dayFrac + B - 1524.5;
}
```

## 2. Timezone engine (+5:30, hardcoded Sri Lanka)

Screen12 chain for 12:55 local:
| Row | Value | Derivation |
|---|---|---|
| Birth time | 12:55:00 | raw input |
| Universal time | 07:25:00 | **local − 5:30** exactly (no DST, no longitude term) |
| True local mean time | 12:46:36 | local − 8:24. Equation: (82.5° − 80.4°) × 4 min/deg = 8.4 min = 8:24 ✓ (IST meridian 82°30′ vs Ratnapura 80°24′) |
| Sinhala time | 16:56:52 | **ghati since sunrise**: (12:55:00 − 06:08:15) = 6:46:45 = 6.7792 h × 2.5 = 16.948 ghati = 16:56:52 ✓ |
| Sunrise / sunset | 06:08:15 / 17:51:45→`5:51:45` (12h clock) | NATIVE mechanism recovered Session 15 (PROGRAM 0x122D8–0x12586, `nativeSunrise()`): Schlyter Sun + Spencer EoT + hour-angle with lon correction; sunset display = 12 − rise (PROGRAM 0x15DD4). Sinhala ghati derives from it (banker's rounding gives the exact :52) |
| UT sidereal | 12:24:29 | GMST(JD) polynomial |
| Local mean sidereal | 17:54:29 | GMST + longitude east (80.4° = 5:21:36; 12:24:29 + 5:21:36 = 17:46:05?? — 8.4 min over; LMST likely uses true-local-mean correction. Open, verify in Phase 2: 17:54:29 − 12:24:29 = 5:30:00 exactly = IST offset, so LMST = GMST + 5:30 here) |

Note the LMST−GMST difference is exactly 5:30:00, i.e. program adds the zone offset rather than the 5:21:36 longitude hour-angle — flipped from Q2 to RESOLVED: printed "Universal Siderial" = LMST − 5.5 **by construction** (`27B42 = 27BF8 − 5.5` at PROGRAM `0x1194c–0x119aa`).

## 3. Ayanamsa (precession correction)

- Anchor: screen12 `AYANAMSA(Arc-Ray): 23 34 21` = 23°34′21″.
- Sanity: Lahiri ayanamsa for 1981-12-08 ≈ 23°33–35′ ✓ consistent with Lahiri/Nirayana school.
- Engine: quadratic-in-T polynomial at PROGRAM `0x1159d–0x11601` (T = fractional century from epoch constant `96 6400 15A1`, divisor `90 00 0EAD`). Exact coefficients pending Phase-2 byte decode; target output pinned to 23°34′21″ (in arc-sec: 84,861″).
- Nirayana = Sayana − Ayanamsa (method flag `N` at `0x11500–0x1152e`).

## 4. Vimshottari Dasa engine (120-year cycle)

Order + year-lengths (recovered from screen14–16 spans):
Ketu 7 → Sikuru/Venus 20 → Ravi/Sun 6 → Sandu/Moon 10 → Kuja/Mars 7 → Rahu 18 → Guru/Jupiter 16 → Shani/Saturn 19 → Budha/Mercury 17 = **120**.

- Balance at birth: `Kethu 2 Years 0 Months 23 Days` (screen12). Moon 9°23′49″ lies in Asvida(Ashwini)-3 (Moon longitude 9.397° within first nakshatra 0–13.333°, pada 3 ⇒ lord Ketu; remaining fraction ⇒ 2y0m23d of 7y). Formula: `balance = mahaYears × (1 − traversedFraction)`.
- Maha boundaries (screen14/15): Ketu 1981-12-08→1984-01-02 (RESOLVED Phase 2: boundaries live in fractional-year space `R = Y + M/12 + D/365`, split via sub_15FF8 with `D = Round`: R0+B = 1984.0885 → (1984, 1, 2); the "23 days" display truncates the same fraction — PROGRAM `0x15b38–0x15bd4` uses `@Trunc`), then Venus 1984-01-02→2004-01-02 (20y exact), Sun 2004→2010 (6y), Moon 2010→2020 (10y), Mars 2020-01-02→2027-01-02 (7y ✓ anchor), Rahu →2045 (18y), Guru →2061 (16y), Shani →2080 (19y), Budha →2097 (17y).
- Athuru (bhukti) splits = maha span × bhuktiLordYears/120, sequential order starting from maha lord. Anchors (Kuja maha): Kuja–Budha ends 2024-06-29, Kuja–Kethu ends 2024-11-26, Kuja–Sikuru ends 2026-01-26 (AGENT.MD checkpoint 4). Screen15 rows confirm: …Budha 2023-07-02→2024-06-29, Ketu →2024-11-26, Venus →2026-01-26, Ravi →2026-06-02, Sandu →2027-01-02.
- Age columns: `Age 42-6-21 to 42-11-18` style = elapsed Y-M-D from birth; replicate with civil-date difference (borrow logic TBD — assert against screen rows, esp. month-end behavior).
- RESOLVED (Phase 2): the Ketu-maha end 1984-01-02 falls out of the fractional-year splitter (see above) — replicate, don't "fix".
- Balance-maha bhukti tail (RESOLVED Phase 2): boundaries are anchored BACKWARD from the maha end with full-maha-year spans (`M*Yi/120`); only the tail from the birth bhukti prints (Ketu balance: Shani partial from birth → 1983-01-05, Budha full → 1984-01-02).
- Ages (RESOLVED Phase 2): civil date difference with fixed 30-day month borrowing (`dateDiffYmd`), not fractional splits.

## 5. Panchanga block (screen12 rows 8–10; DECODED Session 13)

Tuesday / Asvida-3 / Pura-Doloswaka-12 / Parigha / Bava (baseline). Engine
lives in `sub_220B3`/`sub_23A58`/`sub_1B689` (fully decoded where noted).

- Vaara (weekday) from the CIVIL-date JD (jdn0, noon of birth date), NEVER
  the full JD+UT — proven by Invalid_Time (1975-03-02, Sunday): full JD
  2442475.201 gives Monday, jdn0 2442474.0 gives Sunday (src/Panchanga.hpp
  `weekdayIndex`, Engine passes `r.jdn0`).
- Neketha/pada from Moon longitude (mode-appropriate: T2 Krittika from the
  Sayana Moon). Nak = floor(lon/13.333), pada from remainder.
- Tithi = floor(elong/12)+1, waxing iff elong < 180. Limb names (binary):
  1 Pelaviya (Test User E proof, Session 14), 2 Diyawaka, 3 Thiyawaka (waning
  Seas10 fuzz; waxing inferred, Session 17), 4 Jalawaka (Test User D proof,
  Session 14), 5 Visheniya, 6 Shatawaka, 7 Sathawaka (Shatawaka/Sathawaka
  differ by limb, both literal), 9 Navawaka, 10 Dasawaka (Seas03 fuzz),
  11 Ekoloswaka (waning, Moon01 fuzz proof, Session 17), 12 Doloswaka, 13 Theleswaka,
  14 Thuduswaka, 8 Atawaka (waxing Moon14 fuzz; waning inferred, Session 17),
  (limb 15 best-effort guess). Waning prints
  the LIMB number (`Ava -Visheniya  - 5` for tithi 20), waxing
  `Pura-<limb>-<tithi>` (limb padded to 11, number `-%2d`).
- Yoga = floor((sun+moon mod 360)/13.333). Binary spellings: #7 Sukarna,
  #18 Varyayan, #22 Saadaya (T2), #23 Shubra (T3), #27 Vydruthi (T4).
- Karana (BINARY-EXTRACTED enumerated table, sub_17FFE dispatch asm
  12485-12769, Session 18b — supersedes both the Session-13 (k+weekday)%7 fit
  and the interim textbook (k-1)%7 hypothesis, which held only for k<=30):
  ax = floor(elong/6)+1 (1..60) with literal per-name value sets; fixed
  Kinsthugana:1, Shakuna:59, Chathuppada:45 (!), Naaga:60; moving sets e.g.
  Bava {2,9,16,23,30,34,41,52}, Vanija {7,14,21,28,33,40,51,58} (full table in
  Panchanga.hpp). Misplaced fixed karanas (Vanija at k=57, Chathuppada at
  k=44) — binary table quirk, reproduced literally. NO weekday term (same k
  on different weekdays always agrees, 88 rows). 87/87 karana_data.txt.
- E02 (avastha engine input) = Round_bankers(2.5*(birth − sunrise))
  (the rounded Sinhala ghati; sub_23A58 word_27E02, multiplier 2.5 =
  real48(82h,0,2000h)). Exact on 12/13 runs (ITime garbage-input DBA
  deviation disclosed in status Session 13).

## 6. Hora engine (screen13 first line; sub_1AE29 FULLY DECODED, Session 19)

Mechanism (STAR.EXE.asm 15906-16550; three chained lord-cycle loops over
the WRAPPED sinhala ghati X, two lord numberings ping-ponging at each
stage — supersedes the horaAt + (Kala+3b) fit, which matched 9/9 Kala by
geographic luck but differed on 38/108 triples and guessed the tier):
- A-order (Chaldean fast-from-Sun): Ravi1 Sikuru2 Budha3 Chandra4 Shani5
  Guru6 Kuja7 (display table DS:7AF9, Moon "Chandra"). B-order (weekday):
  Ravi1 Chandra2 Kuja3 Budha4 Guru5 Sikuru6 Shani7 (DS:7B47, Moon "Chadra"
  — load-bearing for the remap string-compares). weekday->A: Sun1 Mon4
  Tue7 Wed3 Thu6 Fri2 Sat5 (consecutive days +3 mod 7).
- Loop 1 (KALA, ≤24 iters): n=ceil(X/2.5); KalaA=A0+(n-1) steps.
- Remap A->B {1:1,2:6,3:4,4:2,5:7,6:5,7:3} (exact inverse of the second).
- var_1A=frac(X/2.5)*60. Loop 2 (PANCHAMA, ≤5): n=ceil(var_1A/12);
  PanchaB= KalaB+(n-1). rem=var_1A-(n2-1)*12.
- Remap B->A {1:1,2:4,3:7,4:3,5:6,6:2,7:5}. Loop 3 (SUKSHAMA, ≤3):
  n=ceil(rem/4) (+0/+1/+2 at exact bounds 4,8 — no observation needed);
  SukA=PanchaA+(n-1). Unmatched loops run to max (23/4/2 steps).
- 108/108 DOS triples (incl. pre-dawn Lagna00 via wrapped ghati, Test User A
  rem-3.99 in the +0 tier, Chandra/Chadra slots). Index-8 overread
  (ghati>60, garbage input only) emulated as blank with documented
  continuation. Real48-vs-double dust only within 1e-9 of integer bounds.
- Weekday and ghati use the civil weekday (jdn0) and wrapped ghati.

## 7. Porting rules for time code

1. All civil→JD math in `double`, `floor` = Pascal `Int` (truncation toward −∞ for positive args — identical here since args positive; still use `std::floor`, never cast).
2. Preserve print rounding: JD shown with 3 decimals; dasa dates as civil Y-M-D (no times).
3. Timezone constant `+5:30` hardcoded (`constexpr int TZ_MIN = 330`), never host-local.
4. Day-fraction for JD uses **UT** (local − 5:30), proven by 2444946.809.

# STAR.EXE — static extraction results (from STAR_EXE.asm)

Tooling: `tools/extract_strings.py` (400 Pascal ShortStrings recovered),
`tools/real48.py` (register-triple -> real48 decoder).

All string tables live in the CODE segments as inline Pascal literals;
`dseg` is pure BSS (`?`), which is why nothing was recoverable from it.

---

## 1. YOGA — 14 of 27 names were wrong

Binary order (asm lines 26503-26564), interleaved with the tithi/karana
tables in the same init block:

```cpp
inline const char* yogaName(int idx0) {
    static const char* kYogas[27] = {
        "Vishkamba",  "Preethi",   "Aaushmaan", "Savbhagya", "Shobhana",
        "Athiganda",  "Sukarna",   "Drathi",    "Shula",     "Ganda",
        "Wruddhi",    "Drava",     "Vyaghatha", "Harshana",  "Vajra",
        "Siddi",      "Vyathipatha","Varyayan", "Parigha",   "Shiva",
        "Sidda",      "Saadaya",   "Shubha",    "Shubra",    "Brahhma",
        "Mahendra",   "Vydruthi"};
    if (idx0 < 0) idx0 = 0;
    if (idx0 > 26) idx0 = 26;
    return kYogas[idx0];
}
```

Corrections vs the current table: Vishkambha->Vishkamba, Priti->Preethi,
Ayushmana->Aaushmaan, Saubhagya->Savbhagya, Atiganda->Athiganda,
Dhriti->Drathi, Vriddhi->Wruddhi, Dhruva->Drava, Vyaghata->Vyaghatha,
Siddhi->Siddi, Vyatipata->Vyathipatha, Siddha->Sidda, Brahma->Brahhma,
**Indra->Mahendra**. Shobhana/Sukarna/Shula/Ganda/Harshana/Vajra/
Varyayan/Parigha/Shiva/Saadaya/Shubha/Shubra/Vydruthi were already right.

## 2. TITHI limbs — all 15 recovered (5 were guesses)

```cpp
static const char* kLimbs[15] = {
    "Pelaviya", "Diyawaka", "Thiyawaka", "Jalawaka", "Visheniya",
    "Shatawaka", "Sathawaka", "Atawaka", "Navawaka", "Dasawaka",
    "Ekoloswaka", "Doloswaka", "Theleswaka", "Thuduswaka", "Pasaloswaka"};
```

Corrections: #3 Tijava->Thiyawaka, #8 Atavaka->Atawaka,
#10 Dasamaka->Dasawaka, #11 Ekodasa->Ekoloswaka, #15 Pasoloswaka->Pasaloswaka.

## 3. KARANA — table AND rule were both wrong

The binary holds exactly 11 karana strings, in classical order:

```
Kinsthugana | Bava Baalava Kavlava Thithila Garaja Vanija Vishti | Shakuna Chathuppada Naaga
```

So there is **no weekday term at all** — the fitted `(k + weekday) % 7` rule
was spurious, and the doubled "Vanija" was an artefact of fitting a wrong
table. The rule is the textbook one:

```cpp
inline const char* karanaName(double elongDeg, int /*weekday*/) {
    int k = static_cast<int>(elongDeg / 6.0);          // 0..59 half-tithis
    if (k < 0) k = 0;
    if (k > 59) k = 59;
    if (k == 0)  return "Kinsthugana";
    if (k == 57) return "Shakuna";
    if (k == 58) return "Chathuppada";
    if (k == 59) return "Naaga";
    static const char* kMov[7] = {
        "Bava", "Baalava", "Kavlava", "Thithila", "Garaja", "Vanija", "Vishti"};
    return kMov[(k - 1) % 7];
}
```

Checks: baseline elongation 136.84 -> k=22 -> kMov[21%7=0] = **Bava** (screen12 OK).
screen_test Loku k=6 -> kMov[5] = **Vanija** (the capture that broke the old
rule). Podi k=0 -> Kinsthugana. Note the old spellings Shakuni/Chatushpada/
Naga/Taitila/Baalava-order were all off.

## 4. ATTRIBUTES — one prior "correction" should be reverted

`aMushikadena db 12,'Mushikadena*'` (asm line 16624). The 2026-09-16 change
to `"Mushikaden"` was wrong: the DOS capture was showing **field-width
truncation**, not the stored string. Restore `"Mushikadena*"` and let the
renderer truncate. Everything else in Attributes.hpp matches the binary
literally, including every `#`/`*` marker and `Aakasha`.

Also literal: yoni #25 is stored as `'Sinha       '` (padded to 12).

## 5. AVASTHA — confirmed

Stored order is Shayana, Upeveshana, Nethrapani, Prakasha, Gamana, Agamana,
Saba, AAgama, Bhojana, Nuthyalipsa, Kavthuka, **Nidra** (last), which is
consistent with the existing 0=Nidra .. 11=Kavthuka mapping. No change.

---

## 6. SUNRISE — fully decoded. The lookup table can be deleted.

### The premise that justified the table is false

At the `Sun set time` print site the binary does not compute a sunset at all:

```asm
mov ax, 84h / xor bx,bx / mov dx, 4000h   ; real48 = 12.0
mov cx, word_27DBA ...                    ; = sunrise
call @$brmin$q4Realt1                     ; 12.0 - sunrise
```

Sunset is a **display expression**, `12 - rise`. So `rise + set = 24:00:00`
says nothing about the model, and the inference "therefore no equation of
time" was unfounded.

### The actual routine

```
word_27DD8 = cos(90.8333 deg) / (cos(decl) * cos(lat))       ; alt = -0 deg 50'
cosH       = -tan(lat)*tan(decl) + word_27DD8
word_27DAE = 12.0 - (arccos(cosH) * R2D) / 15.0
N          = JD - (MeeusJD(year,1,0) - 1)                    ; day of year
B          = (N - 1) * 6.283185307176609 / 365.0             ; Spencer day angle
EoT_min    = 229.18 * ( 0.000075
                      + 0.001868*cos(B)  - 0.032077*sin(B)
                      - 0.014615*cos(2B) - 0.040890*sin(2B) )
sunrise    = 5.5 - lon/15 + word_27DAE - EoT_min/60
```

That is **Spencer's equation of time**, verbatim, except the last
coefficient is `0.040890` where Spencer publishes `0.040849`. Exact real48
values: `229.1799999999348`, `0.0018679999999999808`, `0.03207700000001523`,
`0.014615000000006262`, `0.04088999999999032`, `7.500000000004725e-05`,
`6.283185307176609`, `90.83333333337214`, TZ `5.5`.

Note this block also independently **confirms the IDA @Sin/@Cos swap**: the
Spencer coefficients only land on the right terms once @Sin is read as cos
and @Cos as sin.

### Result

Implemented against the existing engine, all 11 DOS captures:

| date | city | DOS | recovered formula | err |
|---|---|---|---|---|
| 1981-12-08 | Ratnapura | 06:08:15 | 06:08:27 | +12 s |
| 1979-12-01 | Ratnapura | 06:05:01 | 06:05:08 | +7 s |
| 1980-02-29 | Colombo | 06:23:38 | 06:23:43 | +5 s |
| 1989-02-29 | Colombo | 06:23:28 | 06:23:34 | +6 s |
| 1975-03-02 | Colombo | 06:22:51 | 06:23:19 | +28 s |
| 1985-04-10 | Colombo | 06:04:44 | 06:04:36 | -8 s |
| 1975-03-22 | Trinco | 06:08:50 | 06:08:37 | -14 s |
| 1990-05-15 | Galle | 05:53:29 | 05:53:30 | +1 s |
| 2022-08-01 | Galle | 06:04:17 | 06:04:16 | -1 s |
| 2025-09-22 | Galle | 05:58:09 | 05:57:58 | -11 s |
| 2026-09-12 | Colombo | 06:01:28 | 06:01:19 | -9 s |

rms 11.6 s, max 28 s, with no fitting and no table — versus the old
hour-angle fallback which was off by up to 15.6 minutes off-table.

Caveat on the residual: this test forced birth hour 12:00 for every row,
and `N` (hence B and the declination) depends on the full JD including the
birth time. The remaining seconds should mostly vanish once real birth times
are used and the declination source (`sub_260ED` input, asm ~line 2280) is
traced to confirm which solar longitude feeds it.

---

## Suggested order of work

1. Apply 1-4 (pure table swaps, no algorithm risk). Re-run the 119
   verifier assertions; only Karana/Yoga cells should move, and they should
   move toward the captures.
2. Replace `kObservedSun` with the recovered formula; keep the 11 rows as a
   regression test with a ~30 s tolerance, tightened once the declination
   source is traced.
3. Then: ayanamsa constant, `sub_1AE29` (Pancha/Sukshama), Trishansa bounds.

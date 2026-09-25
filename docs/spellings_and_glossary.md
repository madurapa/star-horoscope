# Spellings & Glossary — STAR.EXE literal forms (do-not-correct catalog)

> Status 2026-09-24 (remove_legacy R6d — preserved as decode record):
> the exact-render tripwires (`test_screens`, kendra art lines) left
> with the golden files. Live pins are now `test_slot_names`,
> the verifier DOS block, and the engine data tests
> (`test_panchanga`, `test_phase2`, `test_trishansa`,
> `test_attributes_data`, `test_karana_data`). "Fixing" an entry
> below still breaks those LOUDLY — that remains the intent.
Row-level Gate entries naming `test_screens` or `compare_entries.py`
refer to the retired harnesses; the live pins above are authoritative.

The port reproduces the binary's strings VERBATIM, including typos.

Gate strength per area (honest): house/Shadvarga/kendra TEXT — exact-line
gates (strong). Panchanga/avastha/dasa VALUE strings — exact-value gates in
`tests/verifier.cpp` + `tests/test_panchanga.cpp` (strong). Rasi names —
`tests/test_shadvarga.cpp` 72/72 relation + kendra centers (strong).

## 1. Planet-name spellings (per-screen conventions differ!)

| Binary form | Classical | Meaning / reference | Appears in | Gate |
|---|---|---|---|---|
| Sandu | Chandra (Moon) | Sinhala word for the Moon | house table (screen05, T3/T4), dasa cycle (`Sandu` 10y) | test_screens screen05 lines; verifier dasa |
| Chandra | Chandra | Sanskrit Moon (used ONLY in Shadvarga) | screen06 + T2/T3/T4 Shadvarga row 2 | test_screens screen06 lines |
| Rav1 | Ravi (Sun) | typo: digit `1` for `i` | screen06 + all Shadvarga row 3 | test_screens screen06 lines |
| Ravi | Ravi | Sun (house table, dasa `Ravi` 6y) | screen05, dasa tables | test_screens; test_phase2 |
| Budha | Budha (Mercury) | — | everywhere | exact lines |
| Sikuru | Shukra (Venus) | Sinhala form of Shukra | everywhere | exact lines |
| Kuja | Kuja/Mangala (Mars) | — | everywhere | exact lines |
| Guru | Guru/Brihaspati (Jupiter) | — | everywhere | exact lines |
| Shani | Shani (Saturn) | — | everywhere | exact lines |
| Raahu | Rahu (lunar north node) | binary doubles the `a` | everywhere | exact lines |
| Kethu | Ketu (lunar south node) | binary `th` for `t` | everywhere; dasa spells it `Ketu` 7y | test_phase2 (`Ketu`) |
| Urenus | Uranus | house table spelling | screen05 | test_screens screen05 |
| Urenes | Uranus | Shadvarga spelling (drops `u`, adds `e`) | screen06 + T2/T3/T4 | test_screens screen06 |
| Neptun | Neptune | house table spelling (drops `e`) | screen05 | test_screens screen05 |
| Neptune | Neptune | Shadvarga spelling (with `e`) | screen06 + T2/T3/T4 | test_screens screen06 |
| Pluuto | Pluto | double `u`, all Shadvarga | screen06 + T2/T3/T4 | test_screens screen06 |
| Pluto | Pluto | house table spelling | screen05 | test_screens screen05 |
| Rahu | Rahu | dasa-table spelling (segment 05FF), NOT `Raahu` | dasa tables screen14-18 | test_phase2, verifier |
| Sandu (dasa) | Moon | dasa-table spelling, NOT `Chandra` | dasa tables | test_phase2, verifier |
| Ketu (dasa) | Ketu | dasa-table spelling, NOT `Kethu` | dasa tables | test_phase2, verifier |

## 2. Rasi (zodiac sign) spellings

Keep `Wrschika` (Scorpio): it is consistent across the house table, every
Shadvarga matrix, and all kendra centers in all four transcripts — the
binary's transliteration is data. "Correcting" it to Wrushchika/Vrishchika
breaks test_shadvarga (72/72), test_kendra (centers), and both exact-render
screens.

| Binary | Classical | Sign |
|---|---|---|
| Mesha | Mesha/Aries | 1 |
| Wrushaba | Vrishabha/Taurus | 2 |
| Mituna | Mithuna/Gemini | 3 (T3 once writes `Mithuna` — lone scribe variant, majority rules) |
| Kataka | Kataka/Cancer | 4 |
| Sinha | Simha/Leo | 5 |
| Kanya | Kanya/Virgo | 6 |
| Thula | Tula/Libra | 7 |
| Wrschika | Vrishchika/Scorpio | 8 (see note above) |
| Dhanu | Dhanus/Sagittarius | 9 |
| Makara | Makara/Capricorn | 10 |
| Kumba | Kumbha/Aquarius | 11 |
| Meena | Meena/Pisces | 12 |

## 3. Nakshatra (lunar mansion) spellings

Attested forms win over classical guesses. Corrected from earlier classical
guesses after TRANSCRI2/3/4 evidence (Session 9): Keti (Krittika, not
Kethi), Rehena (Rohini), Muvasirasa (Mrigashira), Maa (Magha, not Maha),
Puvapal (Purva Phalguni, not Pupba), Puvasala (Purva Ashadha, not Purasala),
Hata (Hasta), Denata (Dhanishta, not Danista), Revathee (Revati, not
Rewathi). Classical guesses retained ONLY where unobserved — Bharani,
Ardra, Pushya, Sravana, Siyavasa (marked in code).

Full table with classical references: Asvida (Ashwini), Bharani\*,
Keti (Krittika), Rehena (Rohini), Muvasirasa (Mrigashira), Ardra\*,
Punavasa (Punarvasu), Pushya\*, Aslisa (Ashlesha), Maa (Magha),
Puvapal (Purva Phalguni), Utrapal (Uttara Phalguni), Hata (Hasta),
Sita (Chitra), Saa (Swati), Visa (Vishakha), Anura (Anuradha),
Deta (Jyeshtha), Mula (Mula), Puvasala (Purva Ashadha),
Utrasala (Uttara Ashadha), Sravana\* (Shravana), Denata (Dhanishta),
Siyavasa\* (Shatabhisha), Puvaputupa (Purva Bhadrapada),
Utraputupa (Uttara Bhadrapada), Revathee (Revati). Gate: verifier
panchanga blocks + test_panchanga (exact strings).

Native-attribute rows (screen13, Moon-nakshatra based) and Hora line,
implemented in src/Attributes.hpp + Hora.hpp (Session 12), all byte-exact:
- `KALA HORAVA : Guru      PANCHAMA HORAVA : Ravi     SUKSHAMA HORAVA : Budha`
  (field widths %-10s/%-9s). KALA is the exact horaAt() rule (3/3 samples);
  PANCHAMA/SUKSHAMA derivation unrecovered — Kala-lord lookup
  {(Guru→Ravi/Budha), (Ravi→Guru/Kuja)} + blank fallback, disclosed.
- GANA: Deva / Raxha (= Rakshasa) / Manushya (spelling unobserved — no
  Manushya Moon in 4 scenarios — disclosed guess). Full classical table,
  validated 4/4 (Ashwini-Deva, Krittika-Raxha, Hasta-Deva, Chitra-Raxha).
- YONI (birth symbol, Moon nakshatra): Ashva (horse), Eludena\* (goat/sheep,
  asterisk is literal output), Meedena (buffalo), Vyagra (tiger). Other
  animals unobserved → blank fallback (Sinhala forms unknown).
- RUXHA (tree): Godaka, Dimbul, Beli, Athikka (Ficus). Others blank.
- LINGA (gender): Purusha (male), Sthree (female). Neuter unobserved.
- NAADI: Poorva (≈ first/Adi), Madya (middle), Anthya (last).
- PAXHI (bird): Bheruda (mythical Bherunda), Kaka (crow).
- GOTHRA (clan): Marivi (Marichi), Angeera (Angirasa).
- VARNA (class): Brahmana, Vyshya (Vaishya), Kshathriya (Kshatriya).
- RAJJU (rope): Pada (feet), Bahu (arm), Shiro (head), Nabhi (navel).
- BHUTHA (element): Patavi (earth/soil), Thejo (fire/heat).
- Label quirks reproduced: `NAADI:`, `GOTHRA:`, `VARNA:`, `BHUTHA:` (no
  space before colon) vs `GANA  :`, `LINGA :`, `YONI :`, `RUXHA :`,
  `PAXHI :`, `RAJJU :` (with space); all values right-aligned to fixed end
  columns (measured). T3/T4 attribute blocks gate the 4 observed Moon
  nakshatras (Ashwini/Krittika/Hasta/Chitra) in the verifier.

## 4. Tithi / Yoga / Karana spellings

- Tithi limbs: #1 `Pelaviya` (Test User E proof, Session 14), #2 is `Diyawaka`
  (T3/T4 `Pura-Diyawaka -2`), #3 `Thiyawaka` (waning Seas10 fuzz; waxing
  inferred), #4 `Jalawaka` (Test User D proof, Session 14), #8 `Atawaka`
  (waxing Moon14 fuzz; waning inferred), #10 `Dasawaka` (Seas03 fuzz),
  #11 `Ekoloswaka` (waning, Moon01 fuzz proof, Session 17),
  #12 `Doloswaka` (screen12); #15 `Pasaloswaka` (binary-extracted, Session 18);
  tithi 30 is special-cased `Amaawaka-15`
  (Moon06 fuzz). `Pura-` = waxing fortnight, `Ava-` = waning.
  Other limbs best-effort (marked in code).
- Yoga #24 is `Shubra` (T3 sum 307.81 deg pins the INDEX, so the binary
  names the 24th yoga Shubra, not Shukla), #27 `Vydruthi` (T4, not
  Vaidhriti), #19 `Parigha` (screen12). #23 classical Shubha unobserved.
  Fuzz-attested (Session 17): #1 `Vishkamba`, #9 `Drathi`, #11 `Wruddhi`,
  #12 `Drava`, #13 `Vyaghatha`, #16 `Siddi`, #17 `Vyathipatha`,
  #25 `Brahhma`, #26 `Mahendra`.
- Karana (BINARY-EXTRACTED enumerated table, sub_17FFE, Session 18b —
  supersedes Session-13 fit AND the interim textbook hypothesis): fixed
  `Kinsthugana` (ax 1), `Shakuna` (ax 59), `Chathuppada` (ax 45!),
  `Naaga` (ax 60); moving sets enumerated literally in Panchanga.hpp
  (e.g. Vanija {7,14,21,28,33,40,51,58}). No weekday term. 87/87
  karana_data.txt.
  Gate: verifier panchanga blocks (exact) + comparator karana cells.

## 5. Avastha (planet-state) vocabulary

Observed states and their plain meanings: Upeveshana (being seated),
Nidra (sleep), Shayana (lying/reclining), Agamana / AAgama / Gamana
(coming / coming-variant / going — spelling varies by table: Nirayana
tables write Agamana/Gamana, Sayana tables AAgama), Bhojana
(eating/feasting), Prakasha (radiance), Saba (assembly, cf. Sabha).
Uncertain: Nethrapani and Kavthuka (no confident classical mapping;
possibly local usages — reproduced verbatim, meanings open).
The underlying rule is DECODED from the binary (Session 13, sub_23A58):
idx = (DF4*DF6*E00 + E02 + DF8 + DFA) mod 12 (DF4=nak+1, DF6=planet code,
E00=Trunc(rel)+1, E02=Round(2.5*(birth-sunrise)), DF8=Sandu's DF4,
DFA=Lagna's rasi). src/Avastha.hpp implements the formula (13/13 runs).
Gate: verifier avastha block 9/9 exact + comparator 117/117.

## 6. Varga / chart / report vocabulary

RASHI (D1 sign), NAVAMSAKA (D9), HORA (D2), DESHKANA = Drekkana (D3),
DVADASANSAKA (D12; screen10 writes DVADASHANSAKA with an extra A),
TRISHANSAKA (D30; screen10 writes TRISANSAKA without the H), SHAD VARGA
(six divisions), KENDRAYA (chart: LAGNA/NAVAMSAKA/HORA/DESHKANA/
DVADASHANSAKA/TRISANSAKA/SOORYA/CHANDRA), GRHAYA (screen06 header) vs
GRHAYA/GRAHA (screen07 `GRAHA  POSITIONS  IN  SHAD  VARGA`), SOORYARASI
(Sun's sign) / SANDURASI (Moon's sign) centers, `Maha dasava` (major
period) / `Athuru dasava` (sub-period), `PARAMAUSHA` (lifetime; screen14
`DURING PARAMAUSHA OF`), dasava (not dasha). I/O echoes kept verbatim:
`"SAYANA"  method  or "NRAYANA"  method (S/N)` (NRAYANA = Nirayana, NOT
Narayana Dasa), `"Thathkala Kendra"   ?  (Y/N)`, owner header
`HOROSCOPE  OWNER"S   DEATALS` (+ `****` rule; note DEATALS typo),
`0.0 % Of Disk B: Is Full`, `"Thatkala Kendra"` quoted owner (single-h
variant in the NAME field), city labels incl. `CLOMBO` (Colombo typo),
`A"PURA` (Anuradhapura), `POLONARU` (Polonnaruwa), `K"GALA` (Kegalle),
`TRINCO`, and `MATHARA` twice (idx 13 carries Batticaloa-area coords —
kept as-is).

## 7. What "correcting" breaks (tripwire index)

- Rav1->Ravi, Urenes->Urenus, Pluuto->Pluto, Chandra->Sandu (shadvarga):
  test_slot_names shadvarga slot.
- Wrschika->Wrushchika: test_shadvarga 72/72, test_trishansa 52/52,
  verifier DOS block (Lagna-Rashi seat).
- Sandu->Chandra (house table) / Neptun->Neptune / Urenus->Urenus:
  test_slot_names house slot + verifier DOS block.
- Neketha/Yoga/Karana/Tithi classical respellings: verifier panchanga
  blocks (T3/T4/baseline), test_panchanga.
- Avastha respellings: verifier avastha block.
- Dasa lord respellings (Ketu->Kethu, Sandu->Chandra, Rahu->Raahu):
  test_phase2 maha/bhukti lord asserts + verifier dasa blocks.
- NRAYANA->Nirayana in echoes: legacy echo string retired with
  renderScreen06 (R2); modern prompt per glossary.

## 8. Session-13 machine-capture spellings (all binary-literal, gated)

- Nakshatra: `Berana` (Bharani), `Pushha` (Pushya), `Ada` (Ardra), `Suvana`
  (Sravana), `Siyavsa` (Siyavasa; house table + no divergent NEKATHA
  evidence, so shared). Prior "screen12 Siyavasa" claim retracted.
- Tithi limbs: `Navawaka` (9), `Theleswaka` (13), `Thuduswaka` (14),
  `Visheniya` (waning 5), `Shatawaka` (waning 6) vs `Sathawaka` (waning 7 —
  both literal), `Diyawaka` (2), `Doloswaka` (12). Waning prints the LIMB
  number (`Ava -Visheniya  - 5` for tithi 20), waxing `Pura-<limb>-<tithi>`.
- Yoga: `Sukarna` (not Sukarma), `Varyayan` (not Variyana), `Saadaya`
  (not Sadhya, T2 idx 21), plus fuzz-attested `Vishkamba`, `Drathi`,
  `Wruddhi`, `Drava`, `Vyaghatha`, `Siddi`, `Vyathipatha`, `Brahhma`,
  `Mahendra` (Session 17).
- Karana: `Kavlava` (not Kaulava), `Garaja` (not Gara); cells per
  (k+weekday)%7 table (see status Session 13).
- Gana: `Maanusha` (double-a). House-table Gemini: `Mithuna` (vs `Mituna`
  in shadvarga/kendra). Balance/dasa: `Rav1`, `Chadra` (Panchama slot
  only), `Aakasha` (Bhutha-5). RUXHA/YONI `#`/`*` markers literal
  (`Nuga#`, `Kos#`, `Sunakhi*`, `Muvadena*`, ...).
- Gate: engine data tests (test_attributes_data over
  attributes_data.txt, test_karana_data over karana_data.txt);
  the old screen_test/compare_entries.py flow retired in R4.

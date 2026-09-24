# STAR.EXE Data Structures — dseg Memory Map & City Tables

Source (on the `legacy` branch since R7 removed the directory):
`legacy/binary_blueprint.json` (352 strings, 32 custom routines),
`legacy/STAR.EXE.asm` (67,917 lines, base `1000h`, entry `1000:A46`);
DOS-output ground truth lived in `tests/screens/` (removed R3b; last copy on the `legacy` branch) and now pins the verifier DOS block.

## 1. Global words (dseg) identified from PROGRAM disassembly

| dseg symbol | Width | Role (evidence) |
|---|---|---|
| `word_2793A` | int | Latitude degrees (set by city dispatcher; manual entry at `0x113d9`) |
| `word_2793C` | int | Latitude minutes (manual entry at `0x113e1`) |
| `word_2793E` | int | Longitude degrees (manual entry at `0x11414`) |
| `word_27940` | int | Longitude minutes (manual entry at `0x1141c`) |
| `word_27DF0/27DF2` + `word_27DEE` | int | Birth month / day / year (`Read Longint` at `0x10e7d–0x10e92`) |
| `word_27E1C/27E1E` | int | Birth hour / minute (`Read Longint` at `0x10ec0–0x10ecd`) |
| `word_27B48:27B4C` | 6-byte Turbo Pascal Real | City index as Real (read via `Read Real` at `0x1108c`, compared vs 1.0–15.0 with `@__Cmp`) |
| `word_27BFE:27C02` | Real | Birth time decimal hours = Hr + Min/60 (built at `0x10edf–0x10f10`) |
| `word_27C04:27C08` | Real | Longitude decimal degrees = Deg + Min/60 (built at `0x11429–0x1145a`) |
| `word_27C0A:27C0E` | Real | Latitude decimal degrees = Deg + Min/60 (built at `0x1145e–0x1148f`) |
| `word_27BDA:27BDE` | Real | Julian-ish day number from `sub_2564E(year,month,day)` (call at `0x1158d`) |
| `word_27BEC:27BF0` | Real | Fractional-century term `((JDN − 2415020) / 36525)`-family (divisor bytes `90 EAD`, see §3) |
| `byte_27B4E` | byte | 0 = Thathkala-Kendra (skip prompts), 1 = full birth-data entry |
| `byte_27DEA` | char | `S`/`N` Sayana/Nirayana flag (`UpCase(ReadKey)` loop at `0x1150b–0x1152c`) |
| `word_27E42…27E50` | flags | Chart-cell occupancy flags tested in `sub_1D989` Lagna-Kendraya renderer (`cmp word_27E50,1` → write `Ke`, `Gu`, `Rv`, `Sh`, `Ku`, `Bu` …) |
| `unk_27F18`, `unk_2B418`, `unk_2F50A/2F60A` | string buffers | Name buffer, stdin/stdout Text file vars |

### Session-13 decoded engine words (avastha / hora / attributes)

| dseg symbol | Width | Role (evidence) |
|---|---|---|
| `word_27DF4` | int | Avastha nak+1 (1–27; nak loop `var_26` = 0..26 in `sub_23A58`; stale-carry init 0) |
| `word_27DF6` | int | Avastha planet code: Ravi 1, Sandu 2, Kuja 3, Budha 4, Guru 5, Sikuru 6, Shani 7, Raahu 8, Kethu 9 (nine `mov` stores before planet calls) |
| `word_27E00` | int | Avastha Trunc(rel-longitude)+1 (1–30; rasi-block side effect) |
| `word_27E02` | int | Avastha E02 = Round(2.5×(birth − sunrise)) (PROGRAM `0x10...`; multiplier real48(82h,0,2000h) = 2.5) |
| `word_27DF8` | int | Avastha DF8 = Sandu's DF4 (copied once via `byte_2ED18` flag) |
| `word_27DFA` | int | Avastha DFA = Lagna's rasi (saved once after Lagna's `sub_23A58` call) |
| `word_27DFC` | int | Current rasi 1–12 (rasi-finder blocks; stale if no block matches, e.g. Lagna 591) |
| `byte_2ED18` | byte | DF8-update flag (set once at PROGRAM+1AD2, cleared after Sandu's call) |
| `word_27E04` | int | Avastha blank gate (1 = Lagna + outer planets print blank AVASTHA) |
| `word_27DD2:27DD6` | Real | Sinhala ghati 2.5×(birth − DBA) (+60 wrap if negative; feeds hora `sub_1AE29`) |
| `word_27E06` | int | Moon nakshatra+1 input to attribute dispatch `sub_1B689` |
| `unk_2F3E4…2F426`, `unk_2F2B6…2F2F8` | runtime strings | Weekday names for hora lord mappings (filled at runtime; order = Sunday..Saturday per lord-value fit) |

String tables (all 11-byte `db` entries, `sub_1B689` init order = nak order):
- YONI (27, `*` literal): Ashva, Eth, Eludena*, Sarpa, Sepini*, Sunakha, Balal, Elu, Belali*, Mushika, Mushikadena*, Gavadena*, Meedena, Vyagra, Meegon, Vyagradena, Muvadena*, Muva, Sunakhi*, Vendiri, Mugatidena, Vanduru, Sinhadena*, Velamba*, Sinha+7sp, Gon, Ethini. (Session 18 reverts index 10 to binary-literal "Mushikadena*" per STAR.EXE.asm:16624 — the "Mushikaden" capture was field-width truncation.) Display truncates YONI to 10 chars (Session 18c: Mushikadena*->Mushikaden, Sinha+7sp->Sinha+5sp, 2 DOS proofs; displayYoni() in ScreenRenderer).
- RUXHA (27, `#` literal): Godaka, Nelli, Athikka, Madan, Kaluvara, Kihira, Una, Bo#, Domba#, Nuga#, Kela#, Alari#, Dimbul, Beli, Kumbuk, Sapu, Munamal, Vetake#, Imbul#, Hopalu#, Kos#, Vara#, Samadara, Kolong, Mee Amba#, Kohomba, Mee#.
- Hora lord names (11-byte, table at `7B47h`): Chaldean order for Kala/Pancha/Sukshama prints; Panchama slot uses `Chadra ` (7 chars, Moon typo) vs `Chandra` elsewhere.
- Avastha names (14-byte, `sub_23A58`): `   Shayana    `, `   Upeveshana `, `   Nethrapani `, `   Prakasha   `, `   Gamana     `, `   Agamana    `, `   Saba       `, `   AAgama     `, `   Bhojana    `, `   Nuthyalipsa`, `   Kavthuka   `, `   Nidra      ` (remainder order 1,2,…,11,0).

Turbo Pascal 6-byte Real immediate decode (cracked Session 13; bias 128,
mantissa = 0.5 + last-byte/256 for SI=0 constants): `(86h,0,7000h)` = 60.0,
`(87h,0,7000h)` = 120.0, `(88h,0,5200h)` = 210.0, `(89h,0,3400h)` = 360.0,
`(89h,0,2500h)` = 330.0, `(83h,0,3000h)` = 5.5 (timezone), `(82h,0,2000h)`
= 2.5 (ghati multiplier), `(81h,0,0)` = 1.0, `(85h,0,7000h)` = 30.0.

Turbo Pascal 6-byte Real is returned in `AX:BX:DX` and compared as `AX:BX:DX` vs `CX:SI:DI` via `@__Cmp$q4Realt1`; arithmetic via `@$brmul / $brdiv / $brplu / $brmin`, conversions via `@Real$q7Longint`, `@Int`, `@Trunc`, `@Round`, `@Frac`, trig via `@Sin/@Cos/@ArcTan/@Sqrt/@Exp`.

## 2. Divide-by-60 constant (decimal conversion)

Every deg+min/60 site loads `CX=86h, SI=0, DI=7000h` then `@$brdiv`:
`86 70 00 00 00 00` = Turbo Pascal Real **60.0** (32 × 1.875). Sites: `0x10d34`, `0x10d82`, `0x10db7`, `0x10ee8`, `0x11432`, `0x11467`.

```cpp
double decimal_latitude  = degrees + (minutes / 60.0);
double decimal_longitude = degrees + (minutes / 60.0);
double decimal_hours     = hours   + (minutes / 60.0);
```

## 3. City index dispatcher (PROGRAM `0x11096–0x113a7`)

Input Real compared against 1.0 (`81 00..`), 2.0 (`82 00..`), 3.0 (`82 40..`), 4.0 (`83 00..`), 5.0 (`83 20..`), 6.0 (`83 40..`), 7.0 (`83 60..`), 8.0 (`84 00..`), 9.0 (`84 10..`), 10.0 (`84 20..`), 11.0 (`84 30..`), 12.0 (`84 40..`), 13.0 (`84 50..`), 14.0 (`84 60..`), 15.0 (`84 70..`). On match, four words set: lat-deg / lat-min / lon-deg / lon-min. `>15` falls through to manual geocentric entry (`0x113a9–0x1141f`).

| Idx | City (screen list) | Lat | Lon | asm origin |
|---|---|---|---|---|
| 1 | COLOMBO | 6°53′ N | 79°51′ E | `0x110bf` (6, 35h, 4Fh, 33h) |
| 2 | GALLE | 5°58′ N | 80°13′ E | `0x110f0` (5, 3Ah, 50h, 0Dh) |
| 3 | MATHARA | 5°54′ N | 80°33′ E | `0x11122` (5, 36h, 50h, 21h) |
| 4 | KANDY | 7°07′ N | 80°38′ E | `0x11153` (7, 7, 50h, 26h) |
| 5 | HAMBANTOTA | 6°03′ N | 81°07′ E | `0x11185` (6, 3, 51h, 7) |
| 6 | KALUTHARA | 6°31′ N | 79°58′ E | `0x111b7` (6, 1Fh, 4Fh, 3Ah) |
| 7 | RATNAPURA | 6°37′ N | 80°24′ E | `0x111e9` (6, 25h, 50h, 18h) |
| 8 | PUTTLAM | 7°59′ N | 79°50′ E | `0x1121a` (7, 3Bh, 4Fh, 32h) |
| 9 | A″PURA (Anuradhapura) | 8°13′ N | 80°25′ E | `0x1124c` (8, 0Dh, 50h, 19h) |
| 10 | POLONARU (Polonnaruwa) | 7°54′ N | 81°00′ E | `0x1127e` (7, 36h, 51h, 0) |
| 11 | JAFFNA | 9°36′ N | 80°01′ E | `0x112af` (9, 24h, 50h, 1) |
| 12 | TRINCO (Trincomalee) | 8°32′ N | 81°14′ E | `0x112e1` (8, 20h, 51h, 0Eh) |
| 13 | MATHARA sic (= Batticaloa area) | 7°40′ N | 81°43′ E | `0x11313` (7, 28h, 51h, 2Bh) |
| 14 | BADULLA | 6°55′ N | 81°03′ E | `0x11345` (6, 37h, 51h, 3) |
| 15 | K″GALA (Kegalle) | 7°25′ N | 80°23′ E | `0x11377` (7, 19h, 50h, 17h) |

Default/Colombo fallback seeded at `0x10d61`: `word_2793A=6, 2793C=32h(50), 2793E=4Fh(79), 27940=32h(50)` ⇒ **Lat 6°50′ N, Lon 79°50′ E**.

## 4. Baseline scenario (AGENT.MD §Phase 5)

- Thathkala Kendra `N` → full entry; user `Test User`; birth `1981-12-08 12:55` (24h); city `7` ⇒ Ratnapura 6°37′ / 80°24′ (screen12 confirms `at Latitude 6 37 N Longitude 80 24 E`); method `N` = Nirayana sidereal.

## 5. Enum domains scraped from string table

- Planets (`screen05` order): Lagna, Sandu/Chandra, Ravi, Budha, Sikuru, Kuja, Guru, Shani, Raahu, Kethu, Urenus, Neptun, Pluto.
- Rasis: Mesha, Wrushaba, Mituna, Kataka, Sinha, Kanya, Thula, Wrschika, Dhanu, Makara, Kumba, Meena.
- Vargas: RASHI, NAVAMSAKA, HORA, DESHKANA, DVADASANSA(KA), TRISHANSA(KA).
- Chart tags: LAGNA/NAVAMSAKA/HORA/DESHKANA/DVADASHANSAKA/TRISANSAKA/SOORYA/SANDURASI kendraya; cell glyphs `Ke Gu Rv Sh Ku Bu Ch Si Ra 10 11 12`.

## 6. Live dseg ground truth (Session 16, dosbox-automation memory probe)

IDA `word_27XXXX` names encode LINEAR addresses for DS base `0x278E`
(linear `0x278E0`); true DS-relative offset = name − `0x278E0`. DS varies
per DOS load (observed `0x1983` live vs `0x278E` in IDA) — always read DS
from `/api/v1/cpu/state`, never assume. Snapshot while STAR.EXE waits at
the Good Luck screen (at `C:\>` DS belongs to command.com). Tooling:
`tools/snapshot_mem.sh` + `tools/decode_dseg.py`.

Discovered longitude words (Nirayana decimal degrees, Real48):
- `27D2A` Ravi, `27D30` Moon (Sandu), `27B8C` + `27D24` Lagna (identical
  copies), `27C76` + `27B6E` ayanamsa (display-routing copy).
- Exact binary values explaining the sub-arcsecond residuals: Test User A
  Moon 14.76596454 (= 14°45′57.47″, display :57; port rounds :58),
  Test User C Neptune 228.27317953 (= 228°16′23.45″, display :23),
  Leap Guru 131.07901664 (= 131°04′44.46″, display :44).
  All three are lunar/planetary series truncation (~0.05–0.1″), not bugs.
- Test User D sunrise-path intermediates, bit-identical to the 8086 emulator
  (swap applied): 27DBA 6.07157234, 27DD2 15.86273581, 27BE0
  2459792.78819275, 27C40 129.03693775, 27DA8 18.00516060,
  27DD8 −0.01537611, 27DB4 −0.10791393, 27DAE 5.81143619,
  27DCC 3.66297985, 27C34 206.54759300, 27C4C 1.22581213,
  27C2E 129.87650846, E02 = 16.
- Invalid_Time: 27B8C = 27D24 = 591.18834445 (raw displayed 591:11:18);
  27DE4 (screen12 LAGNA-rel) = 14.89076220 (display 14:53:27). The
  12-block rasi cascade at PROGRAM 0x15214 covers only (0,360] and cannot
  produce this from 591.19 — the value is written by `sub_23A58` (only
  other writer of 27DE4), whose out-of-range wrapping rule is still open:
  precise puzzle f(591.18834445) = 14.89076220.
- Test User D karana inputs confirmed exact: elong 39.90732185 (k=6), Monday —
  the (k+weekday)%7 rule is definitively broken (needs re-decode).

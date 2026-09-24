# Locale notes: English corrections and si/ta first draft

Covers `Locale.hpp`, `locale_si.inc`, `locale_ta.inc`.

## 1. English cells corrected in `Locale.hpp`

Changed cells carry a `// FIXED` comment in the source.

| Concept | Old en | New en | Why |
|---|---|---|---|
| `UiProfileBirthDay` | Birth Day | **Birth Weekday** | Sits next to "Birth Date" and holds a weekday (Thursday, ...). "Birth Day" reads as a duplicate of the date. |
| `UiTimeTrueLocalMeanTime` | True Local Mean Time | **Local Mean Time (LMT)** | Self-contradictory. "True" (apparent) solar time and "Mean" time are different things. The standard term is LMT. |
| `UiTimeUniversalSidereal` | Universal Sidereal | **Greenwich Mean Sidereal Time** | "Universal Sidereal" is not a term. It is the sidereal time at Greenwich, i.e. GMST. |
| `UiTimeLocalMeanSidereal` | Local Mean Sidereal | **Local Mean Sidereal Time** | Missing the noun. LMST is the standard term. |
| `PnameChadra` | Chadra | **Chandra** | Typo. |
| `PnameRav1` | Rav1 | **Ravi** | Typo (digit `1` for `i`). |
| `PnameUrenus` / `PnameUrenes` | Urenus / Urenes | **Uranus** | Misspelling of the planet name. |
| `PnameNeptun` | Neptun | **Neptune** | Misspelling. |
| `PnamePluuto` | Pluuto | **Pluto** | Typo. |
| `YogaBrahhma` | Brahhma | **Brahma** | Typo (double h). |

**Follow-ups outside these three files (I could not see them):**

* The four `Ui*` cells above are looked up by exact string in `conceptForEn()`. Whatever `ModernRenderer` currently prints must be changed to the new text. Until then, `localizeKey("Birth Day", ...)` returns the string unchanged and the row is silently not localized. Find the strings with `grep -rn "Birth Day\|True Local Mean\|Universal Sidereal\|Local Mean Sidereal" src/ tests/`.
* `test_locale` pins the en cells to the ModernRenderer tables, so update the tables and the test to the same strings. The `Pname*` and `Yoga*` cells are not in `conceptForEn`, but they are covered by that same pin.
* The C++ identifiers keep their old spellings (`YogaBrahhma`, `PnameUrenus`, `PnameChadra`, `PnameRav1`, `PnamePluuto`, ...). Renaming them would break call sites. After the fix, `PnameChandra`/`PnameChadra`, `PnameRavi`/`PnameRav1`, `PnameUrenus`/`PnameUrenes`, `PnameNeptun`/`PnameNeptune` and `PnamePluto`/`PnamePluuto` have identical en text. That is harmless, but it may be a chance to merge the duplicate slots later.

## 2. Flagged but NOT changed (your call)

I fixed only clear errors. These are judgment calls or established Sri Lankan usage:

* **`UiTimeSinhalaTime` "Sinhala Time"**: unclear what it shows (traditional nali-vinadi time?). A clearer label would be better once the meaning is confirmed.
* **`UiOptManualGeo` "Manual Geo"**: jargon shorthand. "Manual Coordinates" would read better.
* **`UiTitleKendraType` "Kendra Type"**: in Sri Lankan usage *kendaraya* means the whole chart. In standard Jyotish, *kendra* means the angular houses 1-4-7-10. It is fine for a local audience, but confusing for anyone else.
* **`UiTitleMahadasaTimeline` "Athurudasa"**: the standard term is *Antardasa*. "Athuru" is the Sinhala form.
* **`UiAstroJulianDate` "Julian Date"**: the value shown is a Julian Day number. The label is acceptable.
* **Yoga spellings** are Sinhala-style romanizations, not English words, so I left them:
  * `Drava` = **Dhruva** (12th yoga) and `Drathi` = **Dhriti**
  * `Sukarna` = **Sukarma**
  * `Vishkamba` = Vishkambha
  * `Shubra` = **Shukla**
  * `Mahendra` = Aindra/Indra
  * `Kinsthugana` = Kimstughna
  * `Vydruthi` = Vaidhriti
  * `Savbhagya` = Saubhagya
  * `Aaushmaan` = Ayushman

  The translations render the correct yoga, and the notes are in `// REVIEW:` comments. Normalizing the English romanization is a policy decision for you.
* **Inconsistent spellings for the same division**: `DESHKANA` vs `Drekkana Chart`, `DVADASANSA` vs `Dvadasamsa`, `TRISANSAKA` vs `Trimshamsa` (`Trisansaka` looks like Trimshamsaka, the 30th division).
* **Tithi names `Jalawaka`, `Visheniya`, `Shatawaka`** (4th to 6th) differ from the usual Sinhala names (සතරවක, පස්වක, සවක). I transliterated them as given.
* **Yoni and ruxha markers**: `*` and `#` are kept in the translations exactly as in en. `YoniSinha` in en has trailing padding (`"Sinha       "`) which I did not reproduce.

## 3. si/ta translation: conventions

* **All 363 concepts** have a row in each file, with script and romanized forms.
* **Every row is `ReviewStatus::Draft`.** Nothing is Reviewed, and this is machine-drafted, not a native or astrologer sign-off. Rows with a specific question end in `// REVIEW: ...` (20 in si, 17 in ta).
* **Names follow local tradition where there is one**:
  * Sinhala: the nakshatra and tithi names, and Sinhala district names.
  * Tamil: the standard Tamil nakshatra names, Sri Lankan Tamil district names, and Sri Lankan vocabulary such as `திகதி` (date), `தெரிவு` (selection), `நெட்டாங்கு`/`அகலாங்கு` (longitude/latitude).
* **Tamil rasi names** use the Sanskritic forms (மேஷம், ரிஷபம், சிம்மம்) to match the en names. Jaffna almanacs often use மேடம்/இடபம்/சிங்கம், so the reviewer should pick one.
* **Tamil yoni animals and ruxha trees** use Tamil equivalents rather than transliteration. That is easier to read, but the identification needs an astrologer's check (see the `// REVIEW:` lines).
* **Prompts**: leading spaces and trailing punctuation are preserved, and the input keys stay Latin (`[y/N]`, `(S)ayana / (N)irayana [s/N]`) because the console reads those letters.
* **Hints**: "eg:" becomes `උදා:` (si) and `உதா:` (ta).
* **Caste terms** (`Varna*`) are the traditional chart attributes and are flagged for the reviewer's inclusion and wording policy. For Linga, the Tamil `நபும்சகம்` is the formal term, and the common colloquial word is deliberately avoided.
* **Console note**: a Windows console needs the UTF-8 code page and a font covering Sinhala and Tamil. That is separate from these files.

## 4. How the files were checked

* `g++ -std=c++17 -Wall -Wextra -pedantic` compiles `Locale.hpp` with both `.inc` files, no warnings.
* Every concept has exactly one row per language (363/363, no duplicates), and every row is Draft.
* Script cells are all non-ASCII, romanized cells are all ASCII, and all three files are valid UTF-8.
* `*` and `#` markers and prompt leading spaces match the en cells.

## 5. How to change strings (single-source workflow)

Master: `src/locale_si.inc` / `src/locale_ta.inc` + the `en` table in
`src/Locale.hpp`. Everything else generates from there via
`tools/gen_locales.py` (`console/i18n.py` STRINGS + full CONCEPTS
table, jyotichart si/ta sign-names and `asc` rows); `locales_check`
in ctest fails on drift. Gate after every change: build, `ctest`,
`--verify`.

### Fix a modern English display string
1. Change it in `src/ModernRenderer.hpp` (prompts: `src/CLI.cpp`).
2. Change the matching `en` cell in `Locale.hpp` — `test_locale`
   pins en==renderer equality and fails otherwise.
3. Regenerate the glossary (`tools/dump_glossary.cpp` build line
   in its header; paste into `docs/glossary.md`, fix counts).
4. Expect `test_swiss_goldens` / `corpus` to fail (pinned text) —
   re-record deliberately with justification in
   `docs/status_and_plans.md`, never blindly.
5. Never "fix" engine DOS-literal strings (`Sandu`, `Rav1`,
   quirks) — fidelity contract, `docs/quirks.md`.

### Fix a Sinhala/Tamil translation
1. Edit the row in `src/locale_si.inc` / `src/locale_ta.inc`
   (exact `{Concept::X, "script", "roman", ReviewStatus::Draft},`
   shape). Stays `Draft` — only the named reviewer flips to
   `Reviewed` (policy in `docs/glossary.md`).
2. Run `python3 tools/gen_locales.py` (`console/i18n.py`, plus
   jyotichart sign/`asc` rows when touched), then
   `python3 tools/gen_locales.py --check` (exit 0).
3. Hand-maintained jyotichart parts (planet glyphs, non-`asc`
   chrome, kannada/hindi) have no core counterpart — edit
   `third_party/jyotichart/support/languages.py` directly,
   outside the GENERATED markers.

### Add a new translatable string
1. Append the `Concept` at the end of the enum (before `Count`)
   — existing indices must not shift (`test_locale` uses
   hardcoded offsets).
2. Append its `en` cell at the end of the `conceptText` table
   (same order), and add it to the `conceptForEn` list if it
   must translate through the `localizeKey` chokepoint.
3. Use `localeText(Concept::X, locale)` (prompts/values) or
   route the literal through `localizeKey` (titles/keys).
4. Add si/ta `.inc` rows (or omit for clean English fallback).
5. Regenerate + `--check`; extend `ITEMS` in `gen_locales.py`
   if `render.py` looks the key up. Update goldens/corpus on
   output-text change; log a session entry.

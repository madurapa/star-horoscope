# Translator handoff — strings pending review

Generated 2026-09-25 from the live tables (`console/report_l10n.py`,
`console/jychart.py` GLYPH_LOCALE). Everything below is **Draft**:
correct it, then promote each row into the canonical locale files
(`src/Locale.hpp` concept + `src/locale_si.inc`/`locale_ta.inc` rows
+ `tools/gen_locales.py` ITEMS/class), regenerate (`gen_locales.py`,
`dump_glossary.cpp` if coded tables shift), delete the EXTRA row, and
re-run the full gate. si/ta fall back to English per cell until then.

## 1. Report chrome (EXTRA_STRINGS)

| English | Sinhala (draft) | Tamil (draft) |
| --- | --- | --- |
| Active | ක්‍රියාත්මක | நடப்பு |
| Ava | අව | தேய்பிறை |
| Avastha | අවස්ථාව | அவஸ்தை |
| Chart Style | සටහන් රටාව | கட்ட முறை |
| Click on each Mahadasa to view its corresponding Antardasas. | අදාළ අතුරු දශා බැලීමට එක් එක් මහා දශාව මත ක්ලික් කරන්න. | தொடர்புடைய அந்தர்தசைகளைக் காண ஒவ்வொரு மகாதசையையும் கிளிக் செய்க. |
| Diamond | ඩයමන්ඩ් | டயமண்ட் |
| Divisional Charts | වර්ග සටහන් | வர்க்கக் கட்டங்கள் |
| Drekkana | ද්‍රෙක්කාණ | திரேக்காணம் |
| Dvadasamsa | ද්වාදශාංශ | துவாதசாம்சம் |
| EN | ඉංග්‍රීසි | ஆங்கிலம் |
| East | නැගෙනහිර | கிழக்கு |
| Ends | අවසන් වේ | முடிகிறது |
| Engine | එන්ජිම | எஞ்சின் |
| Graha | ග්‍රහ | கிரகம் |
| Locale | භාෂාව | மொழி |
| Longitude | ස්ඵුට | ஸ்புடம் |
| Navamsa | නවාංශ | நவாம்சம் |
| Nirayana | නිරයන | நிராயனம் |
| North | උතුර | வடக்கு |
| Pada | පාද | பாதம் |
| Passed | ගතවූ | கடந்த |
| Pura | පුර | வளர்பிறை |
| Rasi | රාශිය | ராசி |
| SI | සිංහල | சிங்களம் |
| Sayana | සායන | சாயனம் |
| Schema | ස්කීමා | ஸ்கீமா |
| Shadvarga Matrix | ෂඩ්වර්ග න්‍යාසය | ஷட்வர்க்க அணி |
| South | දකුණ | தெற்கு |
| Sri Lankan Vedic Astrology Engine | ශ්‍රී ලංකා වේද ජ්‍යොතිෂ එන්ජිම | இலங்கை வேத ஜோதிட எஞ்சின் |
| Starts | ඇරඹෙන | தொடங்கும் |
| Superscript numbers show the Rasi sign number. | උඩුකුරු අංකවලින් දැක්වෙන්නේ රාශි අංකයයි. | மேலொட்டு எண்கள் ராசி எண்ணைக் காட்டுகின்றன. |
| TA | දෙමළ | தமிழ் |
| Trimshamsa | ත්‍රිංශාංශ | திரிம்சாம்சம் |
| Universal Time | විශ්ව වේලාව | உலகளாவிய நேரம் |
| Version | අනුවාදය | பதிப்பு |
| navamsa | නවාංශ | நவாம்சம் |

## 2. Timeline short months (EXTRA_MONTHS_SHORT)

| English | Sinhala (draft) | Tamil (draft) |
| --- | --- | --- |
| January (Jan) | ජන | ஜன |
| February (Feb) | පෙබ | பிப் |
| March (Mar) | මාර් | மார் |
| April (Apr) | අප්‍රේ | ஏப் |
| May (May) | මැයි | மே |
| June (Jun) | ජූනි | ஜூன் |
| July (Jul) | ජූලි | ஜூலை |
| August (Aug) | අගෝ | ஓக் |
| September (Sep) | සැප් | செப் |
| October (Oct) | ඔක් | அக் |
| November (Nov) | නොවැ | நவ |
| December (Dec) | දෙසැ | டிச |

## 3. Avastha states (EXTRA_AVASTHA, engine strings)

| English | Sinhala (draft) | Tamil (draft) |
| --- | --- | --- |
| Nidra | නිද්‍රා | நித்ரா |
| Shayana | ශයන | சயனம் |
| Upeveshana | උපවේශන | உபவேசனம் |
| Nethrapani | නේත්‍රපානි | நேத்ரபாணி |
| Prakasha | ප්‍රකාශ | பிரகாசம் |
| Gamana | ගමන | கமனம் |
| Agamana | ආගමන | ஆகமனம் |
| Saba | සභා | சபா |
| AAgama | ආගම | ஆகமம் |
| Bhojana | භෝජන | போஜனம் |
| Nuthyalipsa | නුත්‍යලිප්ස | நுத்யலிப்ஸா |
| Kavthuka | කව්තුක | கவ்துகம் |

## 4. Planet display values (EXTRA_PLANETS)

| English | Sinhala (draft) | Tamil (draft) |
| --- | --- | --- |
| Ravi | රවි | சூரியன் |
| Uranus | යුරේනස් | யுரேனஸ் |
| Neptune | නෙප්චූන් | நெப்டியூன் |
| Pluto | ප්ලූටෝ | புளூட்டோ |

## 5. Chart glyphs (GLYPH_LOCALE, first-akshara convention)
| Planet | en (DOS, frozen) | Sinhala (draft) | Tamil (draft) |
| --- | --- | --- | --- |
| Ravi | Rv | ර | சூ |
| Chandra | Ch | ච | சந் |
| Kuja | Ku | කු | செ |
| Budha | Bu | බු | பு |
| Guru | Gu | ගු | கு |
| Sikuru | Si | ශු | சு |
| Shani | Sh | ශ | சனி |
| Raahu | Ra | රා | ரா |
| Kethu | Ke | කේ | கே |


## 6. GUI/app literals needing concepts (English-only today)

These pass through `tr()` untranslated until concepts land. When
promoting, canonicalize each to one concept (note the existing
`UiPromptFullName` "Full Name: " concept and the GUI/app case
mismatch on name/year labels).

| Literal (file) | Suggested concept |
| --- | --- |
| Full Name (gui), Full name (app) | UiPromptFullName family |
| Birth year / Birth month / Birth day (gui+app prompts differ in case) | UiProfileBirth* family |
| Birth hour / Birth minute | UiProfileBirth* family |
| District number | UiOptDistrict family |
| Manual coordinates (district > 26) | new concept |
| Latitude/longitude degrees/minutes | new concepts |
| Thathkala Kendra (time now) | UiPromptThathkalaKendraYN family |
| Compute horoscope | new concept |
| Back | UiMisc family |
| Summary / Houses / Dasa | UiTitle* family |
| Lord / Span / Status (timeline columns) | new concepts |

## Reviewer notes (known concerns)

- `AAgama` → ආගම collides with the everyday word for "religion";
  confirm or replace with a classical form.
- `Longitude` → ස්ඵුට/ஸ்புடம் assumes the sphuta reading; confirm.
- Brand translation (`Sri Lankan Vedic Astrology Engine`) is a
  product-name call — confirm, or keep English everywhere.
- Tamil short months and single-akshara glyphs are first-draft
  conventions (bare-ச collision already fixed via சந்/சனி).
- `DasaRavi`/`PnameRavi` share en "Ravi" with identical si/ta —
  intentional, no action.


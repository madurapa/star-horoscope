# Translator handoff — strings pending review

Generated 2026-09-25 from the live tables (`console/report_l10n.py`,
`console/jychart.py` GLYPH_LOCALE). Everything below is **Draft**:
correct it, then promote each row into the canonical locale files
(`src/Locale.hpp` concept + `src/locale_si.inc`/`locale_ta.inc` rows
+ `tools/gen_locales.py` ITEMS/class), regenerate (`gen_locales.py`,
`dump_glossary.cpp` if coded tables shift), delete the EXTRA row, and
re-run the full gate. si/ta fall back to English per cell until then.

## 0. Canonical concepts (363 — all Draft, none Reviewed)

The pre-existing store (`src/locale_si.inc` / `src/locale_ta.inc`).
Machine-drafted, never reviewed — the new batch in §1–§6 below
joins this same queue. Promote row-by-row per the process above.

The `*` / `#` markers live in a separate column here (they are
noise inside words): `*` = female yoni animal form, printed
literally by the original program and restored per owner ruling —
preserve it, never drop it; `#` = literal marker from the
original tree table (classical meaning unrecorded) — preserve
as-is, do not interpret. In the source `.inc` files the markers
stay embedded at the end of each cell; re-attach them on
transcription.

| Marker | Concept | English | Sinhala | Tamil | Note |
| --- | --- | --- | --- | --- | --- |
|  | RasiMesha | Mesha | මේෂ | மேஷம் |  |
|  | RasiVrishabha | Vrishabha | වෘෂභ | ரிஷபம் |  |
|  | RasiMithuna | Mithuna | මිථුන | மிதுனம் |  |
|  | RasiKataka | Kataka | කටක | கடகம் |  |
|  | RasiSimha | Simha | සිංහ | சிம்மம் |  |
|  | RasiKanya | Kanya | කන්‍යා | கன்னி |  |
|  | RasiTula | Tula | තුලා | துலாம் |  |
|  | RasiVrishchika | Vrishchika | වෘශ්චික | விருச்சிகம் |  |
|  | RasiDhanu | Dhanu | ධනු | தனுசு |  |
|  | RasiMakara | Makara | මකර | மகரம் |  |
|  | RasiKumbha | Kumbha | කුම්භ | கும்பம் |  |
|  | RasiMeena | Meena | මීන | மீனம் |  |
|  | VargaRashi | Rashi | රාශි | ராசி |  |
|  | VargaNavamsa | Navamsa | නවාංශ | நவாம்சம் |  |
|  | VargaHora | Hora | හෝරා | ஹோரை |  |
|  | VargaDrekkana | Drekkana | ද්‍රෙක්කාණ | திரேக்காணம் |  |
|  | VargaDvadasamsa | Dvadasamsa | ද්වාදශාංශ | துவாதசாம்சம் |  |
|  | VargaTrimshamsa | Trimshamsa | ත්‍රිංශාංශ | திரிம்சாம்சம் |  |
|  | WeekdaySunday | Sunday | ඉරිදා | ஞாயிற்றுக்கிழமை |  |
|  | WeekdayMonday | Monday | සඳුදා | திங்கட்கிழமை |  |
|  | WeekdayTuesday | Tuesday | අඟහරුවාදා | செவ்வாய்க்கிழமை |  |
|  | WeekdayWednesday | Wednesday | බදාදා | புதன்கிழமை |  |
|  | WeekdayThursday | Thursday | බ්‍රහස්පතින්දා | வியாழக்கிழமை |  |
|  | WeekdayFriday | Friday | සිකුරාදා | வெள்ளிக்கிழமை |  |
|  | WeekdaySaturday | Saturday | සෙනසුරාදා | சனிக்கிழமை |  |
|  | MonthJanuary | January | ජනවාරි | ஜனவரி |  |
|  | MonthFebruary | February | පෙබරවාරි | பெப்ரவரி |  |
|  | MonthMarch | March | මාර්තු | மார்ச் |  |
|  | MonthApril | April | අප්‍රේල් | ஏப்ரல் |  |
|  | MonthMay | May | මැයි | மே |  |
|  | MonthJune | June | ජූනි | ஜூன் |  |
|  | MonthJuly | July | ජූලි | ஜூலை |  |
|  | MonthAugust | August | අගෝස්තු | ஓகஸ்ட் |  |
|  | MonthSeptember | September | සැප්තැම්බර් | செப்டெம்பர் |  |
|  | MonthOctober | October | ඔක්තෝබර් | ஒக்டோபர் |  |
|  | MonthNovember | November | නොවැම්බර් | நவம்பர் |  |
|  | MonthDecember | December | දෙසැම්බර් | டிசம்பர் |  |
|  | DasaKetu | Ketu | කේතු | கேது |  |
|  | DasaShukra | Shukra | ශුක්‍ර | சுக்கிரன் |  |
|  | DasaRavi | Ravi | රවි | சூரியன் |  |
|  | DasaChandra | Chandra | චන්ද්‍ර | சந்திரன் |  |
|  | DasaKuja | Kuja | කුජ | செவ்வாய் |  |
|  | DasaRahu | Rahu | රාහු | ராகு |  |
|  | DasaGuru | Guru | ගුරු | குரு |  |
|  | DasaShani | Shani | ශනි | சனி |  |
|  | DasaBudha | Budha | බුධ | புதன் |  |
|  | NakAsvida | Asvida | අස්විද | அசுவினி |  |
|  | NakBerana | Berana | බෙරණ | பரணி |  |
|  | NakKeti | Keti | කැති | கார்த்திகை |  |
|  | NakRehena | Rehena | රෙහෙණ | ரோகிணி |  |
|  | NakMuvasirasa | Muvasirasa | මුවසිරස | மிருகசீரிடம் |  |
|  | NakAda | Ada | අද | திருவாதிரை |  |
|  | NakPunavasa | Punavasa | පුනාවස | புனர்பூசம் |  |
|  | NakPushha | Pushha | පුස්ස | பூசம் |  |
|  | NakAslisa | Aslisa | අස්ලිස | ஆயில்யம் |  |
|  | NakMaa | Maa | මා | மகம் |  |
|  | NakPuvapal | Puvapal | පුවපල් | பூரம் |  |
|  | NakUtrapal | Utrapal | උත්‍රපල් | உத்திரம் |  |
|  | NakHata | Hata | හත | அஸ்தம் |  |
|  | NakSita | Sita | සිත | சித்திரை |  |
|  | NakSaa | Saa | සා | சுவாதி |  |
|  | NakVisa | Visa | විසා | விசாகம் |  |
|  | NakAnura | Anura | අනුර | அனுஷம் |  |
|  | NakDeta | Deta | දෙට | கேட்டை |  |
|  | NakMula | Mula | මුල | மூலம் |  |
|  | NakPuvasala | Puvasala | පුවසල | பூராடம் |  |
|  | NakUtrasala | Utrasala | උත්‍රසල | உத்திராடம் |  |
|  | NakSuvana | Suvana | සුවණ | திருவோணம் |  |
|  | NakDenata | Denata | දෙනට | அவிட்டம் |  |
|  | NakSiyavsa | Siyavsa | සියාවස | சதயம் |  |
|  | NakPuvaputupa | Puvaputupa | පුවපුටුප | பூரட்டாதி |  |
|  | NakUtraputupa | Utraputupa | උත්‍රපුටුප | உத்திரட்டாதி |  |
|  | NakRevathee | Revathee | රේවතී | ரேவதி |  |
|  | DistrictColombo | Colombo | කොළඹ | கொழும்பு |  |
|  | DistrictGalle | Galle | ගාල්ල | காலி |  |
|  | DistrictMatara | Matara | මාතර | மாத்தறை |  |
|  | DistrictKandy | Kandy | මහනුවර | கண்டி |  |
|  | DistrictHambantota | Hambantota | හම්බන්තොට | அம்பாந்தோட்டை |  |
|  | DistrictKalutara | Kalutara | කළුතර | களுத்துறை |  |
|  | DistrictRatnapura | Ratnapura | රත්නපුර | இரத்தினபுரி |  |
|  | DistrictPuttalam | Puttalam | පුත්තලම | புத்தளம் |  |
|  | DistrictAnuradhapura | Anuradhapura | අනුරාධපුරය | அனுராதபுரம் |  |
|  | DistrictPolonnaruwa | Polonnaruwa | පොළොන්නරුව | பொலன்னறுவை |  |
|  | DistrictJaffna | Jaffna | යාපනය | யாழ்ப்பாணம் |  |
|  | DistrictTrincomalee | Trincomalee | ත්‍රිකුණාමලය | திருகோணமலை |  |
|  | DistrictBatticaloaA | Batticaloa | මඩකලපුව | மட்டக்களப்பு |  |
|  | DistrictBadulla | Badulla | බදුල්ල | பதுளை |  |
|  | DistrictKegalle | Kegalle | කෑගල්ල | கேகாலை |  |
|  | DistrictAmpara | Ampara | අම්පාර | அம்பாறை |  |
|  | DistrictBatticaloaB | Batticaloa | මඩකලපුව | மட்டக்களப்பு |  |
|  | DistrictGampaha | Gampaha | ගම්පහ | கம்பஹா |  |
|  | DistrictKilinochchi | Kilinochchi | කිලිනොච්චිය | கிளிநொச்சி |  |
|  | DistrictKurunegala | Kurunegala | කුරුණෑගල | குருணாகல் |  |
|  | DistrictMannar | Mannar | මන්නාරම | மன்னார் |  |
|  | DistrictMatale | Matale | මාතලේ | மாத்தளை |  |
|  | DistrictMonaragala | Monaragala | මොණරාගල | மொனராகலை |  |
|  | DistrictMullaitivu | Mullaitivu | මුලතිව් | முல்லைத்தீவு |  |
|  | DistrictNuwaraEliya | Nuwara Eliya | නුවරඑළිය | நுவரெலியா |  |
|  | DistrictVavuniya | Vavuniya | වවුනියාව | வவுனியா |  |
|  | YogaVishkamba | Vishkambha | විෂ්කම්භ | விஷ்கம்பம் |  |
|  | YogaPreethi | Preethi | ප්‍රීති | பிரீதி |  |
|  | YogaAaushmaan | Ayushman | ආයුෂ්මාන් | ஆயுஷ்மான் |  |
|  | YogaSavbhagya | Saubhagya | සෞභාග්‍ය | சௌபாக்கியம் |  |
|  | YogaShobhana | Shobhana | ශෝභන | சோபனம் |  |
|  | YogaAthiganda | Athiganda | අතිගණ්ඩ | அதிகண்டம் |  |
|  | YogaSukarna | Sukarma | සුකර්ම | சுகர்மம் |  |
|  | YogaDrathi | Dhriti | ධෘති | திருதி |  |
|  | YogaShula | Shula | ශූල | சூலம் |  |
|  | YogaGanda | Ganda | ගණ්ඩ | கண்டம் |  |
|  | YogaWruddhi | Wruddhi | වෘද්ධි | விருத்தி |  |
|  | YogaDrava | Dhruva | ධ්‍රැව | துருவம் |  |
|  | YogaVyaghatha | Vyaghatha | ව්‍යාඝාත | வியாகாதம் |  |
|  | YogaHarshana | Harshana | හර්ෂණ | ஹர்ஷணம் |  |
|  | YogaVajra | Vajra | වජ්‍ර | வஜ்ரம் |  |
|  | YogaSiddi | Siddi | සිද්ධි | சித்தி |  |
|  | YogaVyathipatha | Vyathipatha | ව්‍යතීපාත | வியதீபாதம் |  |
|  | YogaVaryayan | Varyayan | වරීයාන් | வரீயான் |  |
|  | YogaParigha | Parigha | පරිඝ | பரிகம் |  |
|  | YogaShiva | Shiva | ශිව | சிவம் |  |
|  | YogaSidda | Sidda | සිද්ධ | சித்தம் |  |
|  | YogaSaadaya | Saadaya | සාධ්‍ය | சாத்தியம் |  |
|  | YogaShubha | Shubha | ශුභ | சுபம் |  |
|  | YogaShubra | Shukla | ශුභ්‍ර | சுப்பிரம் |  |
|  | YogaBrahhma | Brahma | බ්‍රහ්ම | பிரம்மம் |  |
|  | YogaMahendra | Indra | මහේන්ද්‍ර | மகேந்திரம் |  |
|  | YogaVydruthi | Vaidhriti | වෛධෘති | வைதிருதி |  |
|  | LimbPelaviya | Pelaviya | පෑළවිය | பிரதமை |  |
|  | LimbDiyawaka | Diyawaka | දියවක | துவிதியை |  |
|  | LimbThiyawaka | Thiyawaka | තියවක | திருதியை |  |
|  | LimbJalawaka | Jalawaka | ජලවක | சதுர்த்தி |  |
|  | LimbVisheniya | Visheniya | විෂේනිය | பஞ்சமி |  |
|  | LimbShatawaka | Shatawaka | ෂටවක | சஷ்டி |  |
|  | LimbSathawaka | Sathawaka | සතවක | சப்தமி |  |
|  | LimbAtawaka | Atawaka | අටවක | அஷ்டமி |  |
|  | LimbNavawaka | Navawaka | නවවක | நவமி |  |
|  | LimbDasawaka | Dasawaka | දසවක | தசமி |  |
|  | LimbEkoloswaka | Ekoloswaka | එකොළොස්වක | ஏகாதசி |  |
|  | LimbDoloswaka | Doloswaka | දොළොස්වක | துவாதசி |  |
|  | LimbTheleswaka | Theleswaka | තෙළෙස්වක | திரயோதசி |  |
|  | LimbThuduswaka | Thuduswaka | තුදුස්වක | சதுர்த்தசி |  |
|  | LimbPasaloswaka | Pasaloswaka | පසළොස්වක | பஞ்சதசி |  |
|  | KarKinsthugana | Kimstughna | කිංස්තුඝ්න | கிம்ஸ்துக்னம் |  |
|  | KarBava | Bava | බව | பவம் |  |
|  | KarBaalava | Baalava | බාලව | பாலவம் |  |
|  | KarKavlava | Kavlava | කෞලව | கௌலவம் |  |
|  | KarThithila | Thithila | තෛතිල | தைதுலம் |  |
|  | KarGaraja | Garaja | ගරජ | கரசை |  |
|  | KarVanija | Vanija | වණිජ | வணிசை |  |
|  | KarVishti | Vishti | විෂ්ටි | விஷ்டி |  |
|  | KarChathuppada | Chathuppada | චතුෂ්පාද | சதுஷ்பாதம் |  |
|  | KarShakuna | Shakuna | ශකුනි | சகுனி |  |
|  | KarNaaga | Naaga | නාග | நாகவம் |  |
|  | PnameLagna | Lagna | ලග්නය | இலக்கினம் |  |
|  | PnameSandu | Sandu | සඳු | சந்திரன் |  |
|  | PnameChandra | Chandra | චන්ද්‍ර | சந்திரன் |  |
|  | PnameChadra | Chadra | චන්ද්‍ර | சந்திரன் |  |
|  | PnameRavi | Ravi | රවි | சூரியன் |  |
|  | PnameRav1 | Rav1 | රවි | சூரியன் |  |
|  | PnameBudha | Budha | බුධ | புதன் |  |
|  | PnameSikuru | Sikuru | සිකුරු | சுக்கிரன் |  |
|  | PnameKuja | Kuja | කුජ | செவ்வாய் |  |
|  | PnameGuru | Guru | ගුරු | குரு |  |
|  | PnameShani | Shani | ශනි | சனி |  |
|  | PnameRaahu | Raahu | රාහු | ராகு |  |
|  | PnameRahu | Rahu | රාහු | ராகு |  |
|  | PnameKethu | Kethu | කේතු | கேது |  |
|  | PnameKetu | Ketu | කේතු | கேது |  |
|  | PnameUrenus | Urenus | යුරේනස් | யுரேனஸ் |  |
|  | PnameUrenes | Urenes | යුරේනස් | யுரேனஸ் |  |
|  | PnameNeptun | Neptun | නෙප්චූන් | நெப்டியூன் |  |
|  | PnameNeptune | Neptune | නෙප්චූන් | நெப்டியூன் |  |
|  | PnamePluto | Pluto | ප්ලූටෝ | புளூட்டோ |  |
|  | PnamePluuto | Pluuto | ප්ලූටෝ | புளூட்டோ |  |
|  | GanaDeva | Deva | දේව | தேவ |  |
|  | GanaMaanusha | Maanusha | මානුෂ | மனுஷ |  |
|  | GanaRaxha | Raxha | රාක්ෂ | ராட்சச |  |
|  | LingaPurusha | Purusha | පුරුෂ | ஆண் |  |
|  | LingaSthree | Sthree | ස්ත්‍රී | பெண் |  |
|  | LingaNapunsaka | Napunsaka | නපුංසක | நபும்சகம் |  |
|  | NaadiPoorva | Poorva | පූර්ව | பூர்வம் |  |
|  | NaadiMadya | Madya | මධ්‍ය | மத்யம் |  |
|  | NaadiAnthya | Anthya | අන්ත්‍ය | அந்த்யம் |  |
|  | PaxhiBheruda | Bheruda | භේරුණ්ඩ | வல்லூறு |  |
|  | PaxhiPingala | Pingala | පිංගල | ஆந்தை |  |
|  | PaxhiKaka | Kaka | කාක | காகம் |  |
|  | PaxhiKukuta | Kukuta | කුක්කුට | கோழி |  |
|  | PaxhiMaura | Maura | මයූර | மயில் |  |
|  | GothraMarivi | Marivi | මරීචි | மரீசி |  |
|  | GothraAthri | Athri | අත්‍රි | அத்ரி |  |
|  | GothraVashista | Vashista | වසිෂ්ඨ | வசிஷ்டர் |  |
|  | GothraAngeera | Angeera | අංගිරස | ஆங்கீரசர் |  |
|  | GothraPulasthi | Pulasthi | පුලස්ති | புலஸ்தியர் |  |
|  | GothraPulaga | Pulaga | පුලහ | புலகர் |  |
|  | GothraKruthu | Kruthu | ක්‍රතු | கிருது |  |
|  | VarnaBrahmana | Brahmana | බ්‍රාහ්මණ | பிராமணர் |  |
|  | VarnaKshathriya | Kshathriya | ක්ෂත්‍රිය | க்ஷத்திரியர் |  |
|  | VarnaVyshya | Vyshya | වෛශ්‍ය | வைசியர் |  |
|  | VarnaShudra | Shudra | ශුද්‍ර | சூத்திரர் |  |
|  | VarnaPanchama | Panchama | පංචම | பஞ்சமர் |  |
|  | VarnaSankara | Sankara | සංකර | சங்கரர் |  |
|  | RajjuPada | Pada | පාද | பாதம் |  |
|  | RajjuOoru | Ooru | ඌරු | ஊரு |  |
|  | RajjuNabhi | Nabhi | නාභි | நாபி |  |
|  | RajjuBahu | Bahu | බාහු | புஜம் |  |
|  | RajjuShiro | Shiro | ශිරෝ | சிரசு |  |
|  | BhuthaPatavi | Patavi | පඨවි | நிலம் |  |
|  | BhuthaAapo | Aapo | ආපෝ | நீர் |  |
|  | BhuthaThejo | Thejo | තේජෝ | நெருப்பு |  |
|  | BhuthaVaayo | Vaayo | වායෝ | காற்று |  |
|  | BhuthaAakasha | Aakasha | ආකාශ | ஆகாயம் |  |
|  | YoniAshva | Ashva | අශ්ව | குதிரை |  |
|  | YoniEth | Eth | ඇතා | யானை |  |
| * | YoniEludena | Eludena | එළුදෙන | பெண் ஆடு |  |
|  | YoniSarpa | Sarpa | සර්ප | பாம்பு |  |
| * | YoniSepini | Sepini | සර්පිණී | பெண் பாம்பு |  |
|  | YoniSunakha | Sunakha | සුනඛ | நாய் |  |
|  | YoniBalal | Balal | බළල් | பூனை |  |
|  | YoniElu | Elu | එළු | ஆடு |  |
| * | YoniBelali | Belali | බළලි | பெண் பூனை |  |
|  | YoniMushika | Mushika | මූෂික | எலி |  |
| * | YoniMushikadena | Mushikadena | මූෂිකදෙන | பெண் எலி |  |
| * | YoniGavadena | Gavadena | ගවදෙන | பசு |  |
|  | YoniMeedena | Meedena | මීදෙන | எருமை |  |
|  | YoniVyagra | Vyagra | ව්‍යාඝ්‍ර | புலி |  |
|  | YoniMeegon | Meegon | මීගොන් | எருமைக்கடா |  |
| * | YoniVyagradena | Vyagradena | ව්‍යාඝ්‍රදෙන | பெண் புலி |  |
| * | YoniMuvadena | Muvadena | මුවදෙන | பெண் மான் |  |
|  | YoniMuva | Muva | මුවා | மான் |  |
| * | YoniSunakhi | Sunakhi | සුනඛී | பெண் நாய் |  |
|  | YoniVendiri | Vendiri | වැඳිරි | பெண் குரங்கு |  |
|  | YoniMugatidena | Mugatidena | මුගටිදෙන | கீரி |  |
|  | YoniVanduru | Vanduru | වඳුරු | குரங்கு |  |
| * | YoniSinhadena | Sinhadena | සිංහදෙන | பெண் சிங்கம் |  |
| * | YoniVelamba | Velamba | වෙළඹ | பெண் குதிரை |  |
|  | YoniSinha | Sinha | සිංහ | சிங்கம் |  |
|  | YoniGon | Gon | ගොන් | காளை |  |
|  | YoniEthini | Ethini | ඇතිනි | பெண் யானை |  |
|  | RuxhaGodaka | Godaka | ගොඩක | எட்டி |  |
|  | RuxhaNelli | Nelli | නෙල්ලි | நெல்லி |  |
|  | RuxhaAthikka | Athikka | අත්තික්කා | அத்தி |  |
|  | RuxhaMadan | Madan | මාදං | நாவல் |  |
|  | RuxhaKaluvara | Kaluvara | කළුවර | கருங்காலி |  |
|  | RuxhaKihira | Kihira | කිහිරි | செங்கருங்காலி |  |
|  | RuxhaUna | Una | උණ | மூங்கில் |  |
| # | RuxhaBo | Bo | බෝ | அரசு |  |
| # | RuxhaDomba | Domba | දොඹ | புன்னை |  |
| # | RuxhaNuga | Nuga | නුග | ஆல் |  |
| # | RuxhaKela | Kela | කෙළ | பலாசு |  |
| # | RuxhaAlari | Alari | අලරි | அலரி |  |
|  | RuxhaDimbul | Dimbul | දිඹුල් | ஆத்தி |  |
|  | RuxhaBeli | Beli | බෙලි | வில்வம் |  |
|  | RuxhaKumbuk | Kumbuk | කුඹුක් | மருது |  |
|  | RuxhaSapu | Sapu | සපු | சண்பகம் |  |
|  | RuxhaMunamal | Munamal | මුනමල් | மகிழம் |  |
| # | RuxhaVetake | Vetake | වැටකේ | தாழை |  |
| # | RuxhaImbul | Imbul | ඉඹුල් | இலவு |  |
| # | RuxhaHopalu | Hopalu | හෝපලු | ஹோபலு |  |
| # | RuxhaKos | Kos | කොස් | பலா |  |
| # | RuxhaVara | Vara | වරා | எருக்கு |  |
|  | RuxhaSamadara | Samadara | සමදර | வன்னி |  |
|  | RuxhaKolong | Kolong | කොළොං | கடம்பு |  |
| # | RuxhaMeeAmba | Mee Amba | මී අඹ | தேமா |  |
|  | RuxhaKohomba | Kohomba | කොහොඹ | வேம்பு |  |
| # | RuxhaMee | Mee | මී | இருப்பை |  |
|  | UiProfileFullName | Full Name | සම්පූර්ණ නම | முழுப் பெயர் |  |
|  | UiProfileBirthDate | Birth Date | උපන් දිනය | பிறந்த திகதி |  |
|  | UiProfileBirthDay | Birth Weekday | උපන් වාරය | பிறந்த கிழமை |  |
|  | UiProfileBirthPlace | Birth Place | උපන් ස්ථානය | பிறந்த இடம் |  |
|  | UiAstroJulianDate | Julian Date | ජූලියන් දිනය | ஜூலியன் திகதி |  |
|  | UiAstroAyanamsa | Ayanamsa | අයනාංශය | அயனாம்சம் |  |
|  | UiAstroLagna | Lagna | ලග්නය | இலக்கினம் |  |
|  | UiAstroLagnaDegree | Lagna Degree | ලග්න අංශක | இலக்கின பாகை |  |
|  | UiAstroLagnaNavamsa | Lagna Navamsa | ලග්න නවාංශය | இலக்கின நவாம்சம் |  |
|  | UiTimeBirthTime | Birth Time | උපන් වේලාව | பிறந்த நேரம் |  |
|  | UiTimeSinhalaTime | Sinhala Time | සිංහල වේලාව | சிங்கள நேரம் |  |
|  | UiTimeTrueLocalMeanTime | Local Mean Time (LMT) | ප්‍රාදේශීය මධ්‍යම වේලාව (LMT) | உள்ளூர் சராசரி நேரம் (LMT) |  |
|  | UiTimeUniversalTimeUT | Universal Time (UT) | විශ්ව වේලාව (UT) | உலகளாவிய நேரம் (UT) |  |
|  | UiTimeUniversalSidereal | Greenwich Mean Sidereal Time | ග්‍රීනිච් මධ්‍යම නාක්ෂත්‍ර කාලය | கிரீன்விச் சராசரி நட்சத்திர நேரம் |  |
|  | UiTimeLocalMeanSidereal | Local Mean Sidereal Time | ප්‍රාදේශීය මධ්‍යම නාක්ෂත්‍ර කාලය | உள்ளூர் சராசரி நட்சத்திர நேரம் |  |
|  | UiTimeSunrise | Sunrise | හිරු උදාව | சூரிய உதயம் |  |
|  | UiTimeSunset | Sunset | හිරු බැසීම | சூரிய அஸ்தமனம் |  |
|  | UiPanchangaTithi | Tithi | තිථි | திதி |  |
|  | UiPanchangaNakshatra | Nakshatra | නැකත | நட்சத்திரம் |  |
|  | UiPanchangaNakshatraPada | Nakshatra Pada | නැකත් පාදය | நட்சத்திரப் பாதம் |  |
|  | UiPanchangaYoga | Yoga | යෝග | யோகம் |  |
|  | UiPanchangaKarana | Karana | කරණ | கரணம் |  |
|  | UiDasaStarting | Starting | ආරම්භය | ஆரம்பம் |  |
|  | UiDasaPeriod | Period | කාලය | காலம் |  |
|  | UiDasaReference | Reference | යොමුව | குறிப்பு |  |
|  | UiDasaFromBirth | From birth | උපතේ සිට | பிறப்பிலிருந்து |  |
|  | UiDasaYears | years | වසර | ஆண்டுகள் |  |
|  | UiDasaMonths | months | මාස | மாதங்கள் |  |
|  | UiDasaDays | days | දින | நாட்கள் |  |
|  | UiHoraKala | Kala | කාල | கால |  |
|  | UiHoraPanchama | Panchama | පංචම | பஞ்சம |  |
|  | UiHoraSukshama | Sukshama | සූක්ෂ්ම | சூட்சும |  |
|  | UiChakraGana | Gana | ගණ | கணம் |  |
|  | UiChakraYoni | Yoni | යෝනි | யோனி |  |
|  | UiChakraLinga | Linga | ලිංග | லிங்கம் |  |
|  | UiChakraNaadi | Naadi | නාඩි | நாடி |  |
|  | UiChakraVarna | Varna | වර්ණ | வர்ணம் |  |
|  | UiChakraRuxha | Ruxha | වෘක්ෂ | விருட்சம் |  |
|  | UiChakraPaxhi | Paxhi | පක්ෂි | பட்சி |  |
|  | UiChakraGothra | Gothra | ගෝත්‍ර | கோத்திரம் |  |
|  | UiChakraRajju | Rajju | රජ්ජු | ரஜ்ஜு |  |
|  | UiChakraBhutha | Bhutha | භූත | பூதம் |  |
|  | UiHouseName | Name | නම | பெயர் |  |
|  | UiHouseBorn | Born | උපන් | பிறப்பு |  |
|  | UiHousePlace | Place | ස්ථානය | இடம் |  |
|  | UiOptDistrict | District | දිස්ත්‍රික්කය | மாவட்டம் |  |
|  | UiOptManualGeo | Manual Coordinates | අතින් ඛණ්ඩාංක | கைமுறை ஆள்கூறுகள் |  |
|  | UiOptMethod | Method | ක්‍රමය | முறை |  |
|  | UiOptNirayanaSidereal | Nirayana (Sidereal) | නිරයන (නාක්ෂත්‍ර) | நிராயனம் (நட்சத்திர) |  |
|  | UiOptSayanaTropical | Sayana (Tropical) | සායන (නිවර්තන) | சாயனம் (வெப்பமண்டல) |  |
|  | UiTitleHoroscopeProfile | Horoscope Profile | ජන්ම පත්‍ර පැතිකඩ | ஜாதக விவரம் |  |
|  | UiTitleDistrictSelection | District Selection | දිස්ත්‍රික්කය තෝරාගැනීම | மாவட்டத் தெரிவு |  |
|  | UiTitleNirayanaTableOfHouses | Nirayana Table of Houses | නිරයන භාව වගුව | நிராயன பாவ அட்டவணை |  |
|  | UiTitleShadvargaCharts | Shadvarga Charts | ෂඩ්වර්ග සටහන් | ஷட்வர்க்கக் கட்டங்கள் |  |
|  | UiTitleShadvargaPositions | Shadvarga Positions | ෂඩ්වර්ග පිහිටීම් | ஷட்வர்க்க நிலைகள் |  |
|  | UiTitleMahadasaTimeline | Mahadasa and Antardasa Timeline | මහා දශා සහ අතුරු දශා කාල රේඛාව | மகாதசை மற்றும் அந்தர்தசை காலவரிசை |  |
|  | UiTitlePanchanga | Panchanga | පංචාංග | பஞ்சாங்கம் |  |
|  | UiTitleDasaInformation | Dasa Information | දශා තොරතුරු | தசை தகவல் |  |
|  | UiTitleHora | Hora | හෝරා | ஹோரை |  |
|  | UiTitleChakra | Chakra | චක්‍ර | சக்கரம் |  |
|  | UiTitleKendraType | Kendra Type | කේන්දර වර්ගය | கேந்திர வகை |  |
|  | UiTitleBirthProfile | Birth Profile | උපන් විස්තර | பிறப்பு விவரம் |  |
|  | UiTitleAstroReference | Astronomical & Chart Reference | තාරකා විද්‍යා සහ සටහන් යොමුව | வானியல் மற்றும் கட்டக் குறிப்பு |  |
|  | UiTitleTimeMetrics | Time & Solar Metrics | කාල සහ සූර්ය මිනුම් | நேரம் மற்றும் சூரிய அளவீடுகள் |  |
|  | UiTitleSelectedOptions | Selected Options | තෝරාගත් විකල්ප | தேர்ந்தெடுத்த தெரிவுகள் |  |
|  | UiTitleHoroscopeOwnerDetails | Horoscope Owner Details | ජන්ම පත්‍ර හිමියාගේ තොරතුරු | ஜாதகரின் விவரங்கள் |  |
|  | UiTitleAyanamsaMethod | Ayanamsa Method | අයනාංශ ක්‍රමය | அயனாம்ச முறை |  |
|  | UiPromptThathkalaKendraYN | Use Thathkala Kendra [y/N]: | තත්කාල කේන්දරය භාවිතා කරන්නද [y/N]: | தற்கால கேந்திரத்தைப் பயன்படுத்தவும் [y/N]: |  |
|  | UiPromptMethodSN | Method (S)ayana / (N)irayana [s/N]: | ක්‍රමය (S)ayana / (N)irayana [s/N]: | முறை (S)ayana / (N)irayana [s/N]: |  |
|  | UiPromptFullName | Full Name: | සම්පූර්ණ නම: | முழுப் பெயர்: |  |
|  | UiPromptBirthDate | Birth Date (YYYY MM DD): | උපන් දිනය (YYYY MM DD): | பிறந்த திகதி (YYYY MM DD): |  |
|  | UiPromptBirthTime | Birth Time (HH MM, 24h): | උපන් වේලාව (HH MM, පැය 24): | பிறந்த நேரம் (HH MM, 24 மணி): |  |
|  | UiPromptClosestDistrict | Closest District [1-26, >26 Other]: | ආසන්නතම දිස්ත්‍රික්කය [1-26, >26 වෙනත්]: | அருகிலுள்ள மாவட்டம் [1-26, >26 வேறு]: |  |
|  | UiPromptLatitude | Latitude (Deg Min): | අක්ෂාංශය (අංශක විනාඩි): | அகலாங்கு (பாகை நிமிடம்): |  |
|  | UiPromptLongitude | Longitude (Deg Min): | දේශාංශය (අංශක විනාඩි): | நெட்டாங்கு (பாகை நிமிடம்): |  |
|  | UiPromptThathkalaKendra | Thathkala Kendra: | තත්කාල කේන්දරය: | தற்கால கேந்திரம்: |  |
|  | UiHintDateEg | YYYY MM DD, eg: 2000 08 17 | YYYY MM DD, උදා: 2000 08 17 | YYYY MM DD, உதா: 2000 08 17 |  |
|  | UiHintTimeEg | HH MM (24h), eg: 14 05 | HH MM (පැය 24), උදා: 14 05 | HH MM (24 மணி), உதா: 14 05 |  |
|  | UiHintDistrictEg | district number, eg: 7 | දිස්ත්‍රික්ක අංකය, උදා: 7 | மாவட்ட எண், உதா: 7 |  |
|  | UiHintLatEg | Deg Min, eg: 6 37 | අංශක විනාඩි, උදා: 6 37 | பாகை நிமிடம், உதா: 6 37 |  |
|  | UiHintLonEg | Deg Min, eg: 80 24 | අංශක විනාඩි, උදා: 80 24 | பாகை நிமிடம், உதா: 80 24 |  |
|  | UiKendraLagna | LAGNA | ලග්නය | இலக்கினம் |  |
|  | UiKendraNavamsaka | NAVAMSAKA | නවාංශක | நவாம்சகம் |  |
|  | UiKendraHora | HORA | හෝරා | ஹோரை |  |
|  | UiKendraDeshkana | DESHKANA | දෙශ්කාණ | திரேக்காணம் |  |
|  | UiKendraDvadasansa | DVADASANSA | ද්වාදශාංශ | துவாதசாம்சம் |  |
|  | UiKendraTrisansaka | TRISANSAKA | ත්‍රිංශාංශක | திரிம்சாம்சகம் |  |
|  | UiKendraSooryarasi | SOORYARASI | සූර්ය රාශිය | சூரிய ராசி |  |
|  | UiKendraSandurasi | SANDURASI | සඳු රාශිය | சந்திர ராசி |  |
|  | UiKendraHoraChart | Hora Chart | හෝරා සටහන | ஹோரை கட்டம் |  |
|  | UiKendraDrekkanaChart | Drekkana Chart | ද්‍රෙක්කාණ සටහන | திரேக்காண கட்டம் |  |
|  | UiChartLagna | Lagna Chart | ලග්න සටහන | இலக்கின கட்டம் |  |
|  | UiChartNavamsa | Navamsa Chart | නවාංශ සටහන | நவாம்ச கட்டம் |  |
|  | UiChartDvadasamsa | Dvadasamsa Chart | ද්වාදශාංශ සටහන | துவாதசாம்ச கட்டம் |  |
|  | UiChartTrimshamsa | Trimshamsa Chart | ත්‍රිංශාංශ සටහන | திரிம்சாம்ச கட்டம் |  |
|  | UiChartSun | Ravi Chart | සූර්ය සටහන | சூரிய கட்டம் |  |
|  | UiChartMoon | Chandra Chart | චන්ද්‍ර සටහන | சந்திர கட்டம் |  |
|  | UiMiscYes | Yes | ඔව් | ஆம் |  |
|  | UiMiscNo | No | නැහැ | இல்லை |  |


## Do-not-touch list (frozen keys and strings)

These are data, not language. Correcting their spelling breaks
engines, goldens, or the JSON API. They never enter review:

- Engine planet keys (exact case): Lagna, Chandra, Ravi, Budha,
  Sikuru, Kuja, Guru, Shani, Raahu, Kethu, Urenus, Neptune, Pluto
- Engine aliases: Sandu, Chadra, Rav1, Urenes, Neptun, Pluuto,
  Rahu/Ketu as engine keys (display forms are separate concepts)
- DOS-literal screen strings: NRAYANA, MATHARA, Siderial,
  PARAMAUSHA, DESHKANA, Dvadasansa, TRISANSAKA, SOORYARASI,
  SANDURASI, LAGNA, NAVAMSAKA, HORA, "Colombo (Thathkala default)"
  and "\"Thatkala Kendra\"" spellings as emitted (sic), "Manual entry"
- JSON document keys (`schema`, `version`, `longitudes`, …) —
  frozen by `docs/json_schema.md`
- Concept IDs (`RasiMesha`, `DasaRavi`, …) and the English column
  of every row (tests pin it; English fixes go through the
  maintainer, never via translation)
- `*` / `#` markers: review the words, keep the Marker column
  as-is (re-attached on transcription)

If a frozen string looks wrong to you, flag it in a NOTE instead —
the maintainer verifies against the original program first
(fidelity contract: reproducing the original is deliberate).

Changing a frozen string later is possible, with a bar per tier
(Surya→Ravi is the worked example of Tier 1):

- Tier 1, display words (modern spellings, chart titles, locale en
  cells): owner ruling → change source + all mirrors + ITEMS →
  regen → en-pinning gates → re-record affected goldens with a
  normalized words-only diff proof (numbers proven unchanged) →
  justification log → commit.
- Tier 2, engine/behavioral strings (DOS literals, engine keys,
  quirks): additionally requires new evidence (re-disassembly,
  fresh captures, or proof the original varies), arbitration
  against the frozen `origin/legacy` tree, and re-baselining of
  goldens/verifier/diff bounds. Never silent, never to match
  new code.

The practical upshot: if you (or the translator) find a frozen
string that is genuinely wrong, flag which tier you think it is in.
Tier 1 can be scoped immediately; Tier 2 starts with
evidence-gathering.

## For the translator (how to return corrections)

- Work on a **copy** of this file — never on code. For each wrong
  cell, write the correction next to it or add a `NOTE:` line
  under the row.
- Columns: **English is frozen** (do not change it — tests pin
  it); correct **Sinhala** / **Tamil** script and romanization.
  The Marker column is not translated — keep it as-is.
- Status meanings: Draft = machine-drafted, unreviewed; Reviewed =
  confirmed by you (add your name + date in your reply).
- §6 literals have no translation yet — provide all three columns
  (English stays as shown).
- Return the annotated copy; the maintainers transcribe it into
  `src/locale_si.inc` / `src/locale_ta.inc`, regenerate, gate,
  and commit. This file is a snapshot — it is regenerated, not
  edited in place.

## For the maintainer (verify against git history after editing)

Never commit transcription blind. After applying corrections:

1. `git diff --stat` — expect only the two locale files (plus
   regenerated artifacts below). Anything else is a red flag.
2. `git diff src/locale_si.inc src/locale_ta.inc` — read every
   hunk: only si/ta script cells, romanized cells, and
   `Draft`→`Reviewed` flips may change. **Zero hunks may touch
   an English cell or a Concept ID** (that means a frozen key
   moved — stop and investigate).
3. Regenerate and re-diff: `tools/gen_locales.py` (expect only
   the translated rows to change in `console/i18n.py`),
   `tools/dump_glossary.cpp` if a coded table shifted.
4. Full gate green (ctest + pytest + `--verify` + `locales_check`),
   then commit with the reviewer's name in the message.


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


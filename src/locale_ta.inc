// Translator file: Tamil (ta) rows.
//
// HOW TO TRANSLATE: add one row per concept BELOW, keeping the exact shape:
//   {Concept::RasiMesha, "<Tamil script>", "<romanized>", ReviewStatus::Draft},
// Concept ids are listed in src/Locale.hpp (enum Concept). Leave a concept
// out and it falls back to English. Do NOT edit src/Locale.hpp itself.
//
// STATUS: Unsourced (guessed — do not use), Draft (translator-supplied,
// needs reviewer), Reviewed (confirmed by the named reviewer, see
// docs/glossary.md). Nothing here may flip to Reviewed without the reviewer.
// Sri Lankan Tamil usage specifically (see plans.md Phase 3).
//
// NOTE: this file is #included by src/Locale.hpp, so it must stay valid
// C++ initializers (UTF-8, one row per line, trailing comma ok).
//
// EXAMPLE (commented out — copy, fill, uncomment; keep the shape exact):
//   {Concept::RasiMesha, "<Tamil script>", "<romanized>", ReviewStatus::Draft},
//   {Concept::UiTitleHoroscopeProfile, "<Tamil script>", "<romanized>", ReviewStatus::Draft},
//
// Rows below: first-draft translation for ALL 363 concepts, supplied as Draft.
// Every row is ReviewStatus::Draft - none is Reviewed. Rows marked "// REVIEW:"
// carry a specific question for the reviewer. Markers "*" and "#" that the en
// cells carry (yoni / ruxha) are preserved on purpose. See locale_notes.md.

// ---- Rasis ----
    {Concept::RasiMesha, "மேஷம்", "Mesham", ReviewStatus::Draft},  // REVIEW: Sanskritic forms used; Jaffna almanacs often use மேடம்/இடபம்/சிங்கம் (Medam/Idabam/Singam) - reviewer to choose
    {Concept::RasiVrishabha, "ரிஷபம்", "Rishabam", ReviewStatus::Draft},
    {Concept::RasiMithuna, "மிதுனம்", "Mithunam", ReviewStatus::Draft},
    {Concept::RasiKataka, "கடகம்", "Kadakam", ReviewStatus::Draft},
    {Concept::RasiSimha, "சிம்மம்", "Simmam", ReviewStatus::Draft},
    {Concept::RasiKanya, "கன்னி", "Kanni", ReviewStatus::Draft},
    {Concept::RasiTula, "துலாம்", "Thulaam", ReviewStatus::Draft},
    {Concept::RasiVrishchika, "விருச்சிகம்", "Viruchchikam", ReviewStatus::Draft},
    {Concept::RasiDhanu, "தனுசு", "Dhanusu", ReviewStatus::Draft},
    {Concept::RasiMakara, "மகரம்", "Makaram", ReviewStatus::Draft},
    {Concept::RasiKumbha, "கும்பம்", "Kumbam", ReviewStatus::Draft},
    {Concept::RasiMeena, "மீனம்", "Meenam", ReviewStatus::Draft},

// ---- Vargas ----
    {Concept::VargaRashi, "ராசி", "Raasi", ReviewStatus::Draft},
    {Concept::VargaNavamsa, "நவாம்சம்", "Navaamsam", ReviewStatus::Draft},
    {Concept::VargaHora, "ஹோரை", "Horai", ReviewStatus::Draft},
    {Concept::VargaDrekkana, "திரேக்காணம்", "Thirekkaanam", ReviewStatus::Draft},
    {Concept::VargaDvadasamsa, "துவாதசாம்சம்", "Thuvaathasaamsam", ReviewStatus::Draft},
    {Concept::VargaTrimshamsa, "திரிம்சாம்சம்", "Thirimsaamsam", ReviewStatus::Draft},

// ---- Weekdays ----
    {Concept::WeekdaySunday, "ஞாயிற்றுக்கிழமை", "Njaayitrukkizhamai", ReviewStatus::Draft},
    {Concept::WeekdayMonday, "திங்கட்கிழமை", "Thingatkizhamai", ReviewStatus::Draft},
    {Concept::WeekdayTuesday, "செவ்வாய்க்கிழமை", "Sevvaaikkizhamai", ReviewStatus::Draft},
    {Concept::WeekdayWednesday, "புதன்கிழமை", "Budhankizhamai", ReviewStatus::Draft},
    {Concept::WeekdayThursday, "வியாழக்கிழமை", "Viyaazhakkizhamai", ReviewStatus::Draft},
    {Concept::WeekdayFriday, "வெள்ளிக்கிழமை", "Vellikkizhamai", ReviewStatus::Draft},
    {Concept::WeekdaySaturday, "சனிக்கிழமை", "Sanikkizhamai", ReviewStatus::Draft},

// ---- Months ----
    {Concept::MonthJanuary, "ஜனவரி", "Janavari", ReviewStatus::Draft},
    {Concept::MonthFebruary, "பெப்ரவரி", "Pebravari", ReviewStatus::Draft},
    {Concept::MonthMarch, "மார்ச்", "Maarch", ReviewStatus::Draft},
    {Concept::MonthApril, "ஏப்ரல்", "Eppiral", ReviewStatus::Draft},
    {Concept::MonthMay, "மே", "Mae", ReviewStatus::Draft},
    {Concept::MonthJune, "ஜூன்", "Joon", ReviewStatus::Draft},
    {Concept::MonthJuly, "ஜூலை", "Joolai", ReviewStatus::Draft},
    {Concept::MonthAugust, "ஓகஸ்ட்", "Ogast", ReviewStatus::Draft},
    {Concept::MonthSeptember, "செப்டெம்பர்", "Septhembar", ReviewStatus::Draft},
    {Concept::MonthOctober, "ஒக்டோபர்", "Oktobar", ReviewStatus::Draft},
    {Concept::MonthNovember, "நவம்பர்", "Navambar", ReviewStatus::Draft},
    {Concept::MonthDecember, "டிசம்பர்", "Disambar", ReviewStatus::Draft},

// ---- Dasa lords ----
    {Concept::DasaKetu, "கேது", "Kethu", ReviewStatus::Draft},
    {Concept::DasaShukra, "சுக்கிரன்", "Sukkiran", ReviewStatus::Draft},
    {Concept::DasaRavi, "சூரியன்", "Sooriyan", ReviewStatus::Draft},
    {Concept::DasaChandra, "சந்திரன்", "Chandhiran", ReviewStatus::Draft},
    {Concept::DasaKuja, "செவ்வாய்", "Sevvaai", ReviewStatus::Draft},
    {Concept::DasaRahu, "ராகு", "Raagu", ReviewStatus::Draft},
    {Concept::DasaGuru, "குரு", "Guru", ReviewStatus::Draft},
    {Concept::DasaShani, "சனி", "Sani", ReviewStatus::Draft},
    {Concept::DasaBudha, "புதன்", "Budhan", ReviewStatus::Draft},

// ---- Nakshatras ----
    {Concept::NakAsvida, "அசுவினி", "Asuvini", ReviewStatus::Draft},
    {Concept::NakBerana, "பரணி", "Parani", ReviewStatus::Draft},
    {Concept::NakKeti, "கார்த்திகை", "Kaarththikai", ReviewStatus::Draft},
    {Concept::NakRehena, "ரோகிணி", "Rohini", ReviewStatus::Draft},
    {Concept::NakMuvasirasa, "மிருகசீரிடம்", "Mirugaseeridam", ReviewStatus::Draft},
    {Concept::NakAda, "திருவாதிரை", "Thiruvaathirai", ReviewStatus::Draft},
    {Concept::NakPunavasa, "புனர்பூசம்", "Punarpoosam", ReviewStatus::Draft},
    {Concept::NakPushha, "பூசம்", "Poosam", ReviewStatus::Draft},
    {Concept::NakAslisa, "ஆயில்யம்", "Aayilyam", ReviewStatus::Draft},
    {Concept::NakMaa, "மகம்", "Magam", ReviewStatus::Draft},
    {Concept::NakPuvapal, "பூரம்", "Pooram", ReviewStatus::Draft},
    {Concept::NakUtrapal, "உத்திரம்", "Uththiram", ReviewStatus::Draft},
    {Concept::NakHata, "அஸ்தம்", "Astham", ReviewStatus::Draft},
    {Concept::NakSita, "சித்திரை", "Siththirai", ReviewStatus::Draft},
    {Concept::NakSaa, "சுவாதி", "Suvaathi", ReviewStatus::Draft},
    {Concept::NakVisa, "விசாகம்", "Visaakam", ReviewStatus::Draft},
    {Concept::NakAnura, "அனுஷம்", "Anusham", ReviewStatus::Draft},
    {Concept::NakDeta, "கேட்டை", "Kettai", ReviewStatus::Draft},
    {Concept::NakMula, "மூலம்", "Moolam", ReviewStatus::Draft},
    {Concept::NakPuvasala, "பூராடம்", "Pooraadam", ReviewStatus::Draft},
    {Concept::NakUtrasala, "உத்திராடம்", "Uththiraadam", ReviewStatus::Draft},
    {Concept::NakSuvana, "திருவோணம்", "Thiruvonam", ReviewStatus::Draft},
    {Concept::NakDenata, "அவிட்டம்", "Avittam", ReviewStatus::Draft},
    {Concept::NakSiyavsa, "சதயம்", "Sathayam", ReviewStatus::Draft},
    {Concept::NakPuvaputupa, "பூரட்டாதி", "Poorattaathi", ReviewStatus::Draft},
    {Concept::NakUtraputupa, "உத்திரட்டாதி", "Uththirattaathi", ReviewStatus::Draft},
    {Concept::NakRevathee, "ரேவதி", "Revathi", ReviewStatus::Draft},

// ---- Districts ----
    {Concept::DistrictColombo, "கொழும்பு", "Kolumbu", ReviewStatus::Draft},
    {Concept::DistrictGalle, "காலி", "Kaali", ReviewStatus::Draft},
    {Concept::DistrictMatara, "மாத்தறை", "Maathatrai", ReviewStatus::Draft},
    {Concept::DistrictKandy, "கண்டி", "Kandi", ReviewStatus::Draft},
    {Concept::DistrictHambantota, "அம்பாந்தோட்டை", "Ampaanthottai", ReviewStatus::Draft},
    {Concept::DistrictKalutara, "களுத்துறை", "Kaluthurai", ReviewStatus::Draft},
    {Concept::DistrictRatnapura, "இரத்தினபுரி", "Iraththinapuri", ReviewStatus::Draft},
    {Concept::DistrictPuttalam, "புத்தளம்", "Puththalam", ReviewStatus::Draft},
    {Concept::DistrictAnuradhapura, "அனுராதபுரம்", "Anuraathapuram", ReviewStatus::Draft},
    {Concept::DistrictPolonnaruwa, "பொலன்னறுவை", "Polonnaruvai", ReviewStatus::Draft},
    {Concept::DistrictJaffna, "யாழ்ப்பாணம்", "Yaazhppaanam", ReviewStatus::Draft},
    {Concept::DistrictTrincomalee, "திருகோணமலை", "Thirukonamalai", ReviewStatus::Draft},
    {Concept::DistrictBatticaloaA, "மட்டக்களப்பு", "Mattakkalappu", ReviewStatus::Draft},
    {Concept::DistrictBadulla, "பதுளை", "Padulai", ReviewStatus::Draft},
    {Concept::DistrictKegalle, "கேகாலை", "Kegaalai", ReviewStatus::Draft},
    {Concept::DistrictAmpara, "அம்பாறை", "Ampaarai", ReviewStatus::Draft},
    {Concept::DistrictBatticaloaB, "மட்டக்களப்பு", "Mattakkalappu", ReviewStatus::Draft},
    {Concept::DistrictGampaha, "கம்பஹா", "Gampaha", ReviewStatus::Draft},
    {Concept::DistrictKilinochchi, "கிளிநொச்சி", "Kilinochchi", ReviewStatus::Draft},
    {Concept::DistrictKurunegala, "குருணாகல்", "Kurunaakal", ReviewStatus::Draft},
    {Concept::DistrictMannar, "மன்னார்", "Mannaar", ReviewStatus::Draft},
    {Concept::DistrictMatale, "மாத்தளை", "Maathalai", ReviewStatus::Draft},
    {Concept::DistrictMonaragala, "மொனராகலை", "Monaraakalai", ReviewStatus::Draft},
    {Concept::DistrictMullaitivu, "முல்லைத்தீவு", "Mullaiththeevu", ReviewStatus::Draft},
    {Concept::DistrictNuwaraEliya, "நுவரெலியா", "Nuwaraeliya", ReviewStatus::Draft},
    {Concept::DistrictVavuniya, "வவுனியா", "Vavuniya", ReviewStatus::Draft},

// ---- Yogas ----
    {Concept::YogaVishkamba, "விஷ்கம்பம்", "Vishkambam", ReviewStatus::Draft},
    {Concept::YogaPreethi, "பிரீதி", "Preethi", ReviewStatus::Draft},
    {Concept::YogaAaushmaan, "ஆயுஷ்மான்", "Aayushmaan", ReviewStatus::Draft},
    {Concept::YogaSavbhagya, "சௌபாக்கியம்", "Saubhaakkiyam", ReviewStatus::Draft},
    {Concept::YogaShobhana, "சோபனம்", "Sobhanam", ReviewStatus::Draft},
    {Concept::YogaAthiganda, "அதிகண்டம்", "Athikandam", ReviewStatus::Draft},
    {Concept::YogaSukarna, "சுகர்மம்", "Sukarmam", ReviewStatus::Draft},
    {Concept::YogaDrathi, "திருதி", "Thiruthi", ReviewStatus::Draft},
    {Concept::YogaShula, "சூலம்", "Soolam", ReviewStatus::Draft},
    {Concept::YogaGanda, "கண்டம்", "Kandam", ReviewStatus::Draft},
    {Concept::YogaWruddhi, "விருத்தி", "Viruththi", ReviewStatus::Draft},
    {Concept::YogaDrava, "துருவம்", "Thuruvam", ReviewStatus::Draft},  // REVIEW: en "Drava" is the 12th yoga Dhruva (துருவம்) - rendered as Dhruva
    {Concept::YogaVyaghatha, "வியாகாதம்", "Viyaakaatham", ReviewStatus::Draft},
    {Concept::YogaHarshana, "ஹர்ஷணம்", "Harshanam", ReviewStatus::Draft},
    {Concept::YogaVajra, "வஜ்ரம்", "Vajjiram", ReviewStatus::Draft},
    {Concept::YogaSiddi, "சித்தி", "Siththi", ReviewStatus::Draft},
    {Concept::YogaVyathipatha, "வியதீபாதம்", "Viyatheepaatham", ReviewStatus::Draft},
    {Concept::YogaVaryayan, "வரீயான்", "Variyaan", ReviewStatus::Draft},
    {Concept::YogaParigha, "பரிகம்", "Parikam", ReviewStatus::Draft},
    {Concept::YogaShiva, "சிவம்", "Sivam", ReviewStatus::Draft},
    {Concept::YogaSidda, "சித்தம்", "Siththam", ReviewStatus::Draft},
    {Concept::YogaSaadaya, "சாத்தியம்", "Saaththiyam", ReviewStatus::Draft},
    {Concept::YogaShubha, "சுபம்", "Subham", ReviewStatus::Draft},
    {Concept::YogaShubra, "சுப்பிரம்", "Suppiram", ReviewStatus::Draft},  // REVIEW: standard name is Shukla (சுக்லம்); Tamil almanacs write சுப்பிரம்
    {Concept::YogaBrahhma, "பிரம்மம்", "Pirammam", ReviewStatus::Draft},
    {Concept::YogaMahendra, "மகேந்திரம்", "Makenthiram", ReviewStatus::Draft},
    {Concept::YogaVydruthi, "வைதிருதி", "Vaithiruthi", ReviewStatus::Draft},

// ---- Limbs (15 lunar-day / tithi names) ----
    {Concept::LimbPelaviya, "பிரதமை", "Pirathamai", ReviewStatus::Draft},
    {Concept::LimbDiyawaka, "துவிதியை", "Thuvithiyai", ReviewStatus::Draft},
    {Concept::LimbThiyawaka, "திருதியை", "Thiruthiyai", ReviewStatus::Draft},
    {Concept::LimbJalawaka, "சதுர்த்தி", "Chathurththi", ReviewStatus::Draft},  // REVIEW: Tamil rows map by tithi position 1-15 (Prathamai...Panchadasi); confirm en position order
    {Concept::LimbVisheniya, "பஞ்சமி", "Panchami", ReviewStatus::Draft},
    {Concept::LimbShatawaka, "சஷ்டி", "Sashti", ReviewStatus::Draft},
    {Concept::LimbSathawaka, "சப்தமி", "Sapthami", ReviewStatus::Draft},
    {Concept::LimbAtawaka, "அஷ்டமி", "Ashtami", ReviewStatus::Draft},
    {Concept::LimbNavawaka, "நவமி", "Navami", ReviewStatus::Draft},
    {Concept::LimbDasawaka, "தசமி", "Thasami", ReviewStatus::Draft},
    {Concept::LimbEkoloswaka, "ஏகாதசி", "Ekaathasi", ReviewStatus::Draft},
    {Concept::LimbDoloswaka, "துவாதசி", "Thuvaathasi", ReviewStatus::Draft},
    {Concept::LimbTheleswaka, "திரயோதசி", "Thirayothasi", ReviewStatus::Draft},
    {Concept::LimbThuduswaka, "சதுர்த்தசி", "Chathurthasi", ReviewStatus::Draft},
    {Concept::LimbPasaloswaka, "பஞ்சதசி", "Panchathasi", ReviewStatus::Draft},  // REVIEW: position 15 (Panchadasi) used so it covers both Pournami and Amavasai

// ---- Karanas ----
    {Concept::KarKinsthugana, "கிம்ஸ்துக்னம்", "Kimsthukhnam", ReviewStatus::Draft},
    {Concept::KarBava, "பவம்", "Bavam", ReviewStatus::Draft},
    {Concept::KarBaalava, "பாலவம்", "Baalavam", ReviewStatus::Draft},
    {Concept::KarKavlava, "கௌலவம்", "Kaulavam", ReviewStatus::Draft},
    {Concept::KarThithila, "தைதுலம்", "Thaithulam", ReviewStatus::Draft},
    {Concept::KarGaraja, "கரசை", "Karasai", ReviewStatus::Draft},
    {Concept::KarVanija, "வணிசை", "Vanisai", ReviewStatus::Draft},
    {Concept::KarVishti, "விஷ்டி", "Vishti", ReviewStatus::Draft},
    {Concept::KarChathuppada, "சதுஷ்பாதம்", "Chathushpaatham", ReviewStatus::Draft},
    {Concept::KarShakuna, "சகுனி", "Sakuni", ReviewStatus::Draft},
    {Concept::KarNaaga, "நாகவம்", "Naakavam", ReviewStatus::Draft},

// ---- Planet slot names ----
    {Concept::PnameLagna, "இலக்கினம்", "Ilakkinam", ReviewStatus::Draft},
    {Concept::PnameSandu, "சந்திரன்", "Chandhiran", ReviewStatus::Draft},
    {Concept::PnameChandra, "சந்திரன்", "Chandhiran", ReviewStatus::Draft},
    {Concept::PnameChadra, "சந்திரன்", "Chandhiran", ReviewStatus::Draft},
    {Concept::PnameRavi, "சூரியன்", "Sooriyan", ReviewStatus::Draft},
    {Concept::PnameRav1, "சூரியன்", "Sooriyan", ReviewStatus::Draft},
    {Concept::PnameBudha, "புதன்", "Budhan", ReviewStatus::Draft},
    {Concept::PnameSikuru, "சுக்கிரன்", "Sukkiran", ReviewStatus::Draft},
    {Concept::PnameKuja, "செவ்வாய்", "Sevvaai", ReviewStatus::Draft},
    {Concept::PnameGuru, "குரு", "Guru", ReviewStatus::Draft},
    {Concept::PnameShani, "சனி", "Sani", ReviewStatus::Draft},
    {Concept::PnameRaahu, "ராகு", "Raagu", ReviewStatus::Draft},
    {Concept::PnameRahu, "ராகு", "Raagu", ReviewStatus::Draft},
    {Concept::PnameKethu, "கேது", "Kethu", ReviewStatus::Draft},
    {Concept::PnameKetu, "கேது", "Kethu", ReviewStatus::Draft},
    {Concept::PnameUrenus, "யுரேனஸ்", "Yuranas", ReviewStatus::Draft},
    {Concept::PnameUrenes, "யுரேனஸ்", "Yuranas", ReviewStatus::Draft},
    {Concept::PnameNeptun, "நெப்டியூன்", "Neptiyoon", ReviewStatus::Draft},
    {Concept::PnameNeptune, "நெப்டியூன்", "Neptiyoon", ReviewStatus::Draft},
    {Concept::PnamePluto, "புளூட்டோ", "Pluutto", ReviewStatus::Draft},
    {Concept::PnamePluuto, "புளூட்டோ", "Pluutto", ReviewStatus::Draft},

// ---- Gana ----
    {Concept::GanaDeva, "தேவ", "Deva", ReviewStatus::Draft},
    {Concept::GanaMaanusha, "மனுஷ", "Manusha", ReviewStatus::Draft},
    {Concept::GanaRaxha, "ராட்சச", "Raatchasa", ReviewStatus::Draft},

// ---- Linga ----
    {Concept::LingaPurusha, "ஆண்", "Aan", ReviewStatus::Draft},
    {Concept::LingaSthree, "பெண்", "Pen", ReviewStatus::Draft},
    {Concept::LingaNapunsaka, "நபும்சகம்", "Napumsakam", ReviewStatus::Draft},  // REVIEW: formal term; the common colloquial word is derogatory and deliberately avoided

// ---- Naadi ----
    {Concept::NaadiPoorva, "பூர்வம்", "Poorvam", ReviewStatus::Draft},
    {Concept::NaadiMadya, "மத்யம்", "Mathyam", ReviewStatus::Draft},
    {Concept::NaadiAnthya, "அந்த்யம்", "Anthyam", ReviewStatus::Draft},

// ---- Paxhi (pakshi) ----
    {Concept::PaxhiBheruda, "வல்லூறு", "Vallooru", ReviewStatus::Draft},  // REVIEW: Tamil uses pancha-pakshi: vulture/owl/crow/rooster/peacock in that order; confirm mapping
    {Concept::PaxhiPingala, "ஆந்தை", "Aanthai", ReviewStatus::Draft},
    {Concept::PaxhiKaka, "காகம்", "Kaakam", ReviewStatus::Draft},
    {Concept::PaxhiKukuta, "கோழி", "Kozhi", ReviewStatus::Draft},
    {Concept::PaxhiMaura, "மயில்", "Mayil", ReviewStatus::Draft},

// ---- Gothra ----
    {Concept::GothraMarivi, "மரீசி", "Mareesi", ReviewStatus::Draft},
    {Concept::GothraAthri, "அத்ரி", "Athri", ReviewStatus::Draft},
    {Concept::GothraVashista, "வசிஷ்டர்", "Vasishtar", ReviewStatus::Draft},
    {Concept::GothraAngeera, "ஆங்கீரசர்", "Aangeerasar", ReviewStatus::Draft},
    {Concept::GothraPulasthi, "புலஸ்தியர்", "Pulasthiyar", ReviewStatus::Draft},
    {Concept::GothraPulaga, "புலகர்", "Pulakar", ReviewStatus::Draft},
    {Concept::GothraKruthu, "கிருது", "Kiruthu", ReviewStatus::Draft},

// ---- Varna ----
    {Concept::VarnaBrahmana, "பிராமணர்", "Piraamanar", ReviewStatus::Draft},  // REVIEW: traditional caste attributes - reviewer to confirm wording/inclusion policy
    {Concept::VarnaKshathriya, "க்ஷத்திரியர்", "Kshaththiriyar", ReviewStatus::Draft},
    {Concept::VarnaVyshya, "வைசியர்", "Vaisiyar", ReviewStatus::Draft},
    {Concept::VarnaShudra, "சூத்திரர்", "Soothirar", ReviewStatus::Draft},
    {Concept::VarnaPanchama, "பஞ்சமர்", "Panjamar", ReviewStatus::Draft},
    {Concept::VarnaSankara, "சங்கரர்", "Sankarar", ReviewStatus::Draft},

// ---- Rajju ----
    {Concept::RajjuPada, "பாதம்", "Paatham", ReviewStatus::Draft},
    {Concept::RajjuOoru, "ஊரு", "Ooru", ReviewStatus::Draft},
    {Concept::RajjuNabhi, "நாபி", "Naapi", ReviewStatus::Draft},
    {Concept::RajjuBahu, "புஜம்", "Pujam", ReviewStatus::Draft},
    {Concept::RajjuShiro, "சிரசு", "Sirasu", ReviewStatus::Draft},

// ---- Bhutha (elements) ----
    {Concept::BhuthaPatavi, "நிலம்", "Nilam", ReviewStatus::Draft},
    {Concept::BhuthaAapo, "நீர்", "Neer", ReviewStatus::Draft},
    {Concept::BhuthaThejo, "நெருப்பு", "Neruppu", ReviewStatus::Draft},
    {Concept::BhuthaVaayo, "காற்று", "Kaatru", ReviewStatus::Draft},
    {Concept::BhuthaAakasha, "ஆகாயம்", "Aakaayam", ReviewStatus::Draft},

// ---- Yoni ----
    {Concept::YoniAshva, "குதிரை", "Kuthirai", ReviewStatus::Draft},
    {Concept::YoniEth, "யானை", "Yaanai", ReviewStatus::Draft},  // REVIEW: yoni animals translated to Tamil equivalents; male/female pairing to be confirmed
    {Concept::YoniEludena, "பெண் ஆடு*", "Pen Aadu*", ReviewStatus::Draft},
    {Concept::YoniSarpa, "பாம்பு", "Paambu", ReviewStatus::Draft},
    {Concept::YoniSepini, "பெண் பாம்பு*", "Pen Paambu*", ReviewStatus::Draft},
    {Concept::YoniSunakha, "நாய்", "Naai", ReviewStatus::Draft},
    {Concept::YoniBalal, "பூனை", "Poonai", ReviewStatus::Draft},
    {Concept::YoniElu, "ஆடு", "Aadu", ReviewStatus::Draft},
    {Concept::YoniBelali, "பெண் பூனை*", "Pen Poonai*", ReviewStatus::Draft},
    {Concept::YoniMushika, "எலி", "Eli", ReviewStatus::Draft},
    {Concept::YoniMushikadena, "பெண் எலி*", "Pen Eli*", ReviewStatus::Draft},
    {Concept::YoniGavadena, "பசு*", "Pasu*", ReviewStatus::Draft},
    {Concept::YoniMeedena, "எருமை", "Erumai", ReviewStatus::Draft},
    {Concept::YoniVyagra, "புலி", "Puli", ReviewStatus::Draft},
    {Concept::YoniMeegon, "எருமைக்கடா", "Erumaikkadaa", ReviewStatus::Draft},
    {Concept::YoniVyagradena, "பெண் புலி*", "Pen Puli*", ReviewStatus::Draft},
    {Concept::YoniMuvadena, "பெண் மான்*", "Pen Maan*", ReviewStatus::Draft},
    {Concept::YoniMuva, "மான்", "Maan", ReviewStatus::Draft},
    {Concept::YoniSunakhi, "பெண் நாய்*", "Pen Naai*", ReviewStatus::Draft},
    {Concept::YoniVendiri, "பெண் குரங்கு", "Pen Kurangu", ReviewStatus::Draft},
    {Concept::YoniMugatidena, "கீரி", "Keeri", ReviewStatus::Draft},  // REVIEW: mongoose (Sinhala mugati); Tamil கீரி
    {Concept::YoniVanduru, "குரங்கு", "Kurangu", ReviewStatus::Draft},
    {Concept::YoniSinhadena, "பெண் சிங்கம்*", "Pen Singam*", ReviewStatus::Draft},
    {Concept::YoniVelamba, "பெண் குதிரை*", "Pen Kuthirai*", ReviewStatus::Draft},
    {Concept::YoniSinha, "சிங்கம்", "Singam", ReviewStatus::Draft},
    {Concept::YoniGon, "காளை", "Kaalai", ReviewStatus::Draft},
    {Concept::YoniEthini, "பெண் யானை", "Pen Yaanai", ReviewStatus::Draft},

// ---- Ruxha (nakshatra trees) ----
    {Concept::RuxhaGodaka, "எட்டி", "Etti", ReviewStatus::Draft},  // REVIEW: Tamil = the traditional nakshatra tree for that star; Godaka/Kela/Alari/Dimbul/Hopalu/Samadara identities to be confirmed
    {Concept::RuxhaNelli, "நெல்லி", "Nelli", ReviewStatus::Draft},
    {Concept::RuxhaAthikka, "அத்தி", "Aththi", ReviewStatus::Draft},
    {Concept::RuxhaMadan, "நாவல்", "Naaval", ReviewStatus::Draft},
    {Concept::RuxhaKaluvara, "கருங்காலி", "Karungaali", ReviewStatus::Draft},
    {Concept::RuxhaKihira, "செங்கருங்காலி", "Sengarungaali", ReviewStatus::Draft},
    {Concept::RuxhaUna, "மூங்கில்", "Moongil", ReviewStatus::Draft},
    {Concept::RuxhaBo, "அரசு#", "Arasu#", ReviewStatus::Draft},
    {Concept::RuxhaDomba, "புன்னை#", "Punnai#", ReviewStatus::Draft},
    {Concept::RuxhaNuga, "ஆல்#", "Aal#", ReviewStatus::Draft},
    {Concept::RuxhaKela, "பலாசு#", "Palaasu#", ReviewStatus::Draft},
    {Concept::RuxhaAlari, "அலரி#", "Alari#", ReviewStatus::Draft},
    {Concept::RuxhaDimbul, "ஆத்தி", "Aaththi", ReviewStatus::Draft},
    {Concept::RuxhaBeli, "வில்வம்", "Vilvam", ReviewStatus::Draft},
    {Concept::RuxhaKumbuk, "மருது", "Marudhu", ReviewStatus::Draft},
    {Concept::RuxhaSapu, "சண்பகம்", "Sanpakam", ReviewStatus::Draft},
    {Concept::RuxhaMunamal, "மகிழம்", "Makizham", ReviewStatus::Draft},
    {Concept::RuxhaVetake, "தாழை#", "Thaazhai#", ReviewStatus::Draft},
    {Concept::RuxhaImbul, "இலவு#", "Ilavu#", ReviewStatus::Draft},
    {Concept::RuxhaHopalu, "ஹோபலு#", "Hopalu#", ReviewStatus::Draft},  // REVIEW: unidentified tree - transliterated only, needs a Tamil equivalent from the reviewer
    {Concept::RuxhaKos, "பலா#", "Palaa#", ReviewStatus::Draft},
    {Concept::RuxhaVara, "எருக்கு#", "Erukku#", ReviewStatus::Draft},
    {Concept::RuxhaSamadara, "வன்னி", "Vanni", ReviewStatus::Draft},
    {Concept::RuxhaKolong, "கடம்பு", "Kadambu", ReviewStatus::Draft},
    {Concept::RuxhaMeeAmba, "தேமா#", "Themaa#", ReviewStatus::Draft},
    {Concept::RuxhaKohomba, "வேம்பு", "Vembu", ReviewStatus::Draft},
    {Concept::RuxhaMee, "இருப்பை#", "Iruppai#", ReviewStatus::Draft},

// ---- UI: labels ----
    {Concept::UiProfileFullName, "முழுப் பெயர்", "Muzhup Peyar", ReviewStatus::Draft},
    {Concept::UiProfileBirthDate, "பிறந்த திகதி", "Pirantha Thikathi", ReviewStatus::Draft},
    {Concept::UiProfileBirthDay, "பிறந்த கிழமை", "Pirantha Kizhamai", ReviewStatus::Draft},
    {Concept::UiProfileBirthPlace, "பிறந்த இடம்", "Pirantha Idam", ReviewStatus::Draft},
    {Concept::UiAstroJulianDate, "ஜூலியன் திகதி", "Juliyan Thikathi", ReviewStatus::Draft},
    {Concept::UiAstroAyanamsa, "அயனாம்சம்", "Ayanaamsam", ReviewStatus::Draft},
    {Concept::UiAstroLagna, "இலக்கினம்", "Ilakkinam", ReviewStatus::Draft},
    {Concept::UiAstroLagnaDegree, "இலக்கின பாகை", "Ilakkina Paakai", ReviewStatus::Draft},
    {Concept::UiAstroLagnaNavamsa, "இலக்கின நவாம்சம்", "Ilakkina Navaamsam", ReviewStatus::Draft},
    {Concept::UiTimeBirthTime, "பிறந்த நேரம்", "Pirantha Neram", ReviewStatus::Draft},
    {Concept::UiTimeSinhalaTime, "சிங்கள நேரம்", "Singhala Neram", ReviewStatus::Draft},  // REVIEW: meaning of "Sinhala Time" unclear in en; translated literally
    {Concept::UiTimeTrueLocalMeanTime, "உள்ளூர் சராசரி நேரம் (LMT)", "Ullur Sarasari Neram (LMT)", ReviewStatus::Draft},
    {Concept::UiTimeUniversalTimeUT, "உலகளாவிய நேரம் (UT)", "Ulakalaaviya Neram (UT)", ReviewStatus::Draft},
    {Concept::UiTimeUniversalSidereal, "கிரீன்விச் சராசரி நட்சத்திர நேரம்", "Greenwich Sarasari Natchaththira Neram", ReviewStatus::Draft},
    {Concept::UiTimeLocalMeanSidereal, "உள்ளூர் சராசரி நட்சத்திர நேரம்", "Ullur Sarasari Natchaththira Neram", ReviewStatus::Draft},
    {Concept::UiTimeSunrise, "சூரிய உதயம்", "Sooriya Udayam", ReviewStatus::Draft},
    {Concept::UiTimeSunset, "சூரிய அஸ்தமனம்", "Sooriya Asthamanam", ReviewStatus::Draft},
    {Concept::UiPanchangaTithi, "திதி", "Thithi", ReviewStatus::Draft},
    {Concept::UiPanchangaNakshatra, "நட்சத்திரம்", "Natchaththiram", ReviewStatus::Draft},
    {Concept::UiPanchangaNakshatraPada, "நட்சத்திரப் பாதம்", "Natchaththirap Paatham", ReviewStatus::Draft},
    {Concept::UiPanchangaYoga, "யோகம்", "Yogam", ReviewStatus::Draft},
    {Concept::UiPanchangaKarana, "கரணம்", "Karanam", ReviewStatus::Draft},
    {Concept::UiDasaStarting, "ஆரம்பம்", "Aarampam", ReviewStatus::Draft},
    {Concept::UiDasaPeriod, "காலம்", "Kaalam", ReviewStatus::Draft},
    {Concept::UiDasaReference, "குறிப்பு", "Kurippu", ReviewStatus::Draft},
    {Concept::UiDasaFromBirth, "பிறப்பிலிருந்து", "Pirappilirunthu", ReviewStatus::Draft},
    {Concept::UiDasaYears, "ஆண்டுகள்", "Aandukal", ReviewStatus::Draft},
    {Concept::UiDasaMonths, "மாதங்கள்", "Maathangal", ReviewStatus::Draft},
    {Concept::UiDasaDays, "நாட்கள்", "Naatkal", ReviewStatus::Draft},
    {Concept::UiHoraKala, "கால", "Kaala", ReviewStatus::Draft},  // REVIEW: Hora sub-divisions Kala/Panchama/Sukshama transliterated; confirm terms with astrologer
    {Concept::UiHoraPanchama, "பஞ்சம", "Panchama", ReviewStatus::Draft},
    {Concept::UiHoraSukshama, "சூட்சும", "Sootchuma", ReviewStatus::Draft},
    {Concept::UiChakraGana, "கணம்", "Kanam", ReviewStatus::Draft},
    {Concept::UiChakraYoni, "யோனி", "Yoni", ReviewStatus::Draft},
    {Concept::UiChakraLinga, "லிங்கம்", "Lingam", ReviewStatus::Draft},
    {Concept::UiChakraNaadi, "நாடி", "Naadi", ReviewStatus::Draft},
    {Concept::UiChakraVarna, "வர்ணம்", "Varnam", ReviewStatus::Draft},
    {Concept::UiChakraRuxha, "விருட்சம்", "Viruchcham", ReviewStatus::Draft},
    {Concept::UiChakraPaxhi, "பட்சி", "Patchi", ReviewStatus::Draft},
    {Concept::UiChakraGothra, "கோத்திரம்", "Koththiram", ReviewStatus::Draft},
    {Concept::UiChakraRajju, "ரஜ்ஜு", "Rajju", ReviewStatus::Draft},
    {Concept::UiChakraBhutha, "பூதம்", "Pootham", ReviewStatus::Draft},
    {Concept::UiHouseName, "பெயர்", "Peyar", ReviewStatus::Draft},
    {Concept::UiHouseBorn, "பிறப்பு", "Pirappu", ReviewStatus::Draft},
    {Concept::UiHousePlace, "இடம்", "Idam", ReviewStatus::Draft},
    {Concept::UiOptDistrict, "மாவட்டம்", "Maavattam", ReviewStatus::Draft},
    {Concept::UiOptManualGeo, "கைமுறை ஆள்கூறுகள்", "Kaimurai Aalkoorukal", ReviewStatus::Draft},
    {Concept::UiOptMethod, "முறை", "Murai", ReviewStatus::Draft},
    {Concept::UiOptNirayanaSidereal, "நிராயனம் (நட்சத்திர)", "Niraayanam (Natchaththira)", ReviewStatus::Draft},
    {Concept::UiOptSayanaTropical, "சாயனம் (வெப்பமண்டல)", "Saayanam (Veppamandala)", ReviewStatus::Draft},

// ---- UI: section titles ----
    {Concept::UiTitleHoroscopeProfile, "ஜாதக விவரம்", "Jaathaka Vivaram", ReviewStatus::Draft},
    {Concept::UiTitleDistrictSelection, "மாவட்டத் தெரிவு", "Maavattath Therivu", ReviewStatus::Draft},
    {Concept::UiTitleNirayanaTableOfHouses, "நிராயன பாவ அட்டவணை", "Niraayana Paava Attavanai", ReviewStatus::Draft},
    {Concept::UiTitleShadvargaCharts, "ஷட்வர்க்கக் கட்டங்கள்", "Shadvargak Kattangal", ReviewStatus::Draft},
    {Concept::UiTitleShadvargaPositions, "ஷட்வர்க்க நிலைகள்", "Shadvarga Nilaikal", ReviewStatus::Draft},
    {Concept::UiTitleMahadasaTimeline, "மகாதசை மற்றும் அந்தர்தசை காலவரிசை", "Mahaathasai matrum Anthardasai Kaalavarisai", ReviewStatus::Draft},
    {Concept::UiTitlePanchanga, "பஞ்சாங்கம்", "Panchaangam", ReviewStatus::Draft},
    {Concept::UiTitleDasaInformation, "தசை தகவல்", "Thasai Thakaval", ReviewStatus::Draft},
    {Concept::UiTitleHora, "ஹோரை", "Horai", ReviewStatus::Draft},
    {Concept::UiTitleChakra, "சக்கரம்", "Chakkaram", ReviewStatus::Draft},
    {Concept::UiTitleKendraType, "கேந்திர வகை", "Kenthira Vakai", ReviewStatus::Draft},  // REVIEW: Kendra here means the chart (කේන්දරය/ஜாதகம்), not the angular houses 1-4-7-10; reviewer to confirm best Tamil term
    {Concept::UiTitleBirthProfile, "பிறப்பு விவரம்", "Pirappu Vivaram", ReviewStatus::Draft},
    {Concept::UiTitleAstroReference, "வானியல் மற்றும் கட்டக் குறிப்பு", "Vaaniyal matrum Kattak Kurippu", ReviewStatus::Draft},
    {Concept::UiTitleTimeMetrics, "நேரம் மற்றும் சூரிய அளவீடுகள்", "Neram matrum Sooriya Alaveedukal", ReviewStatus::Draft},
    {Concept::UiTitleSelectedOptions, "தேர்ந்தெடுத்த தெரிவுகள்", "Therntheduththa Therivukal", ReviewStatus::Draft},
    {Concept::UiTitleHoroscopeOwnerDetails, "ஜாதகரின் விவரங்கள்", "Jaathakarin Vivarangkal", ReviewStatus::Draft},
    {Concept::UiTitleAyanamsaMethod, "அயனாம்ச முறை", "Ayanaamsa Murai", ReviewStatus::Draft},

// ---- UI: prompts ----
    {Concept::UiPromptThathkalaKendraYN, "  தற்கால கேந்திரத்தைப் பயன்படுத்தவும் [y/N]: ", "  Tharkaala Kenthiraththaip Payanpaduththavum [y/N]: ", ReviewStatus::Draft},
    {Concept::UiPromptMethodSN, "  முறை (S)ayana / (N)irayana [s/N]: ", "  Murai (S)ayana / (N)irayana [s/N]: ", ReviewStatus::Draft},  // REVIEW: the (S)/(N) and [y/N] letters stay Latin because the console reads those keys
    {Concept::UiPromptFullName, "  முழுப் பெயர்: ", "  Muzhup Peyar: ", ReviewStatus::Draft},
    {Concept::UiPromptBirthDate, "  பிறந்த திகதி (YYYY MM DD): ", "  Pirantha Thikathi (YYYY MM DD): ", ReviewStatus::Draft},
    {Concept::UiPromptBirthTime, "  பிறந்த நேரம் (HH MM, 24 மணி): ", "  Pirantha Neram (HH MM, 24 mani): ", ReviewStatus::Draft},
    {Concept::UiPromptClosestDistrict, "  அருகிலுள்ள மாவட்டம் [1-26, >26 வேறு]:", "  Arukilulla Maavattam [1-26, >26 Veru]:", ReviewStatus::Draft},
    {Concept::UiPromptLatitude, "  அகலாங்கு (பாகை நிமிடம்):", "  Akalaangku (Paakai Nimidam):", ReviewStatus::Draft},
    {Concept::UiPromptLongitude, "  நெட்டாங்கு (பாகை நிமிடம்):", "  Nettaangku (Paakai Nimidam):", ReviewStatus::Draft},
    {Concept::UiPromptThathkalaKendra, "தற்கால கேந்திரம்: ", "Tharkaala Kenthiram: ", ReviewStatus::Draft},

// ---- UI: input hints ----
    {Concept::UiHintDateEg, "YYYY MM DD, உதா: 2000 08 17", "YYYY MM DD, Uthaa: 2000 08 17", ReviewStatus::Draft},
    {Concept::UiHintTimeEg, "HH MM (24 மணி), உதா: 14 05", "HH MM (24 mani), Uthaa: 14 05", ReviewStatus::Draft},
    {Concept::UiHintDistrictEg, "மாவட்ட எண், உதா: 7", "Maavatta En, Uthaa: 7", ReviewStatus::Draft},
    {Concept::UiHintLatEg, "பாகை நிமிடம், உதா: 6 37", "Paakai Nimidam, Uthaa: 6 37", ReviewStatus::Draft},
    {Concept::UiHintLonEg, "பாகை நிமிடம், உதா: 80 24", "Paakai Nimidam, Uthaa: 80 24", ReviewStatus::Draft},

// ---- UI: kendra types ----
    {Concept::UiKendraLagna, "இலக்கினம்", "Ilakkinam", ReviewStatus::Draft},
    {Concept::UiKendraNavamsaka, "நவாம்சகம்", "Navaamsakam", ReviewStatus::Draft},
    {Concept::UiKendraHora, "ஹோரை", "Horai", ReviewStatus::Draft},
    {Concept::UiKendraDeshkana, "திரேக்காணம்", "Thirekkaanam", ReviewStatus::Draft},
    {Concept::UiKendraDvadasansa, "துவாதசாம்சம்", "Thuvaathasaamsam", ReviewStatus::Draft},
    {Concept::UiKendraTrisansaka, "திரிம்சாம்சகம்", "Thirimsaamsakam", ReviewStatus::Draft},  // REVIEW: en "Trisansaka" appears to be Trimshamsaka (30th division) - rendered as such
    {Concept::UiKendraSooryarasi, "சூரிய ராசி", "Sooriya Raasi", ReviewStatus::Draft},
    {Concept::UiKendraSandurasi, "சந்திர ராசி", "Chandhira Raasi", ReviewStatus::Draft},
    {Concept::UiKendraHoraChart, "ஹோரை கட்டம்", "Horai Kattam", ReviewStatus::Draft},
    {Concept::UiKendraDrekkanaChart, "திரேக்காண கட்டம்", "Thirekkaana Kattam", ReviewStatus::Draft},

// ---- UI: chart names ----
    {Concept::UiChartLagna, "இலக்கின கட்டம்", "Ilakkina Kattam", ReviewStatus::Draft},
    {Concept::UiChartNavamsa, "நவாம்ச கட்டம்", "Navaamsa Kattam", ReviewStatus::Draft},
    {Concept::UiChartDvadasamsa, "துவாதசாம்ச கட்டம்", "Thuvaathasaamsa Kattam", ReviewStatus::Draft},
    {Concept::UiChartTrimshamsa, "திரிம்சாம்ச கட்டம்", "Thirimsaamsa Kattam", ReviewStatus::Draft},
    {Concept::UiChartSun, "சூரிய கட்டம்", "Sooriya Kattam", ReviewStatus::Draft},
    {Concept::UiChartMoon, "சந்திர கட்டம்", "Chandhira Kattam", ReviewStatus::Draft},

// ---- UI: misc ----
    {Concept::UiMiscYes, "ஆம்", "Aam", ReviewStatus::Draft},
    {Concept::UiMiscNo, "இல்லை", "Illai", ReviewStatus::Draft},

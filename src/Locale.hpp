#pragma once
// Phase-3 localization model (plan2 vocabulary schema, technical half).
// One row per translatable concept: English (current modern-display string,
// the fallback) plus Sinhala/Tamil script + romanized forms with a
// per-language review status. Sourcing policy (plans.md Phase 3): no row
// flips to Reviewed without the named reviewer; reviewer identity and
// notes live in docs/glossary.md, not here. All si/ta cells below are
// therefore empty/Unsourced until the sourcing track lands — localeText
// falls back to English for any untranslated cell, so output cannot change
// by including this header (no renderer call-sites yet).
// PROVENANCE: SCAFFOLD (structure per plans.md; en cells mirror the tested
// modern tables they will translate — test_locale pins the equality).
#include <cstdint>
#include <string>
#include <string_view>

namespace star {

// Output locale (a future --locale flag will select; English is the default
// and the fallback for every untranslated cell).
enum class Locale : std::uint8_t { En, Si, Ta };

[[nodiscard]] inline bool parseLocale(std::string_view s, Locale& out) noexcept {
    if (s == "en") { out = Locale::En; return true; }
    if (s == "si") { out = Locale::Si; return true; }
    if (s == "ta") { out = Locale::Ta; return true; }
    return false;
}

[[nodiscard]] inline const char* localeName(Locale loc) noexcept {
    switch (loc) {
        case Locale::En: return "en";
        case Locale::Si: return "si";
        case Locale::Ta: return "ta";
    }
    return "en";
}

// Per-language sourcing status (plans.md Phase 3: Reviewed needs the named
// reviewer; everything starts Unsourced).
enum class ReviewStatus : std::uint8_t { Unsourced, Draft, Reviewed };

// Pilot concept set: rasis + vargas + weekdays + months (37 rows), then
// dasa lords + nakshatras + districts (62 rows). The remaining coded
// vocabulary (planet slot names, yogas, tithis, karanas, attributes) and
// UI strings follow the same shape in later increments.
enum class Concept : std::uint16_t {
    RasiMesha = 0,
    RasiVrishabha,
    RasiMithuna,
    RasiKataka,
    RasiSimha,
    RasiKanya,
    RasiTula,
    RasiVrishchika,
    RasiDhanu,
    RasiMakara,
    RasiKumbha,
    RasiMeena,
    VargaRashi,
    VargaNavamsa,
    VargaHora,
    VargaDrekkana,
    VargaDvadasamsa,
    VargaTrimshamsa,
    WeekdaySunday,
    WeekdayMonday,
    WeekdayTuesday,
    WeekdayWednesday,
    WeekdayThursday,
    WeekdayFriday,
    WeekdaySaturday,
    MonthJanuary,
    MonthFebruary,
    MonthMarch,
    MonthApril,
    MonthMay,
    MonthJune,
    MonthJuly,
    MonthAugust,
    MonthSeptember,
    MonthOctober,
    MonthNovember,
    MonthDecember,
    DasaKetu,
    DasaShukra,
    DasaRavi,
    DasaChandra,
    DasaKuja,
    DasaRahu,
    DasaGuru,
    DasaShani,
    DasaBudha,
    NakAsvida,
    NakBerana,
    NakKeti,
    NakRehena,
    NakMuvasirasa,
    NakAda,
    NakPunavasa,
    NakPushha,
    NakAslisa,
    NakMaa,
    NakPuvapal,
    NakUtrapal,
    NakHata,
    NakSita,
    NakSaa,
    NakVisa,
    NakAnura,
    NakDeta,
    NakMula,
    NakPuvasala,
    NakUtrasala,
    NakSuvana,
    NakDenata,
    NakSiyavsa,
    NakPuvaputupa,
    NakUtraputupa,
    NakRevathee,
    DistrictColombo,
    DistrictGalle,
    DistrictMatara,
    DistrictKandy,
    DistrictHambantota,
    DistrictKalutara,
    DistrictRatnapura,
    DistrictPuttalam,
    DistrictAnuradhapura,
    DistrictPolonnaruwa,
    DistrictJaffna,
    DistrictTrincomalee,
    DistrictBatticaloaA,  // list index 13 (DOS coords)
    DistrictBadulla,
    DistrictKegalle,
    DistrictAmpara,
    DistrictBatticaloaB,  // list index 17 (user table coords)
    DistrictGampaha,
    DistrictKilinochchi,
    DistrictKurunegala,
    DistrictMannar,
    DistrictMatale,
    DistrictMonaragala,
    DistrictMullaitivu,
    DistrictNuwaraEliya,
    DistrictVavuniya,
    YogaVishkamba,
    YogaPreethi,
    YogaAaushmaan,
    YogaSavbhagya,
    YogaShobhana,
    YogaAthiganda,
    YogaSukarna,
    YogaDrathi,
    YogaShula,
    YogaGanda,
    YogaWruddhi,
    YogaDrava,
    YogaVyaghatha,
    YogaHarshana,
    YogaVajra,
    YogaSiddi,
    YogaVyathipatha,
    YogaVaryayan,
    YogaParigha,
    YogaShiva,
    YogaSidda,
    YogaSaadaya,
    YogaShubha,
    YogaShubra,
    YogaBrahhma,
    YogaMahendra,
    YogaVydruthi,
    LimbPelaviya,
    LimbDiyawaka,
    LimbThiyawaka,
    LimbJalawaka,
    LimbVisheniya,
    LimbShatawaka,
    LimbSathawaka,
    LimbAtawaka,
    LimbNavawaka,
    LimbDasawaka,
    LimbEkoloswaka,
    LimbDoloswaka,
    LimbTheleswaka,
    LimbThuduswaka,
    LimbPasaloswaka,
    KarKinsthugana,
    KarBava,
    KarBaalava,
    KarKavlava,
    KarThithila,
    KarGaraja,
    KarVanija,
    KarVishti,
    KarChathuppada,
    KarShakuna,
    KarNaaga,
    PnameLagna,
    PnameSandu,
    PnameChandra,
    PnameChadra,
    PnameRavi,
    PnameRav1,
    PnameBudha,
    PnameSikuru,
    PnameKuja,
    PnameGuru,
    PnameShani,
    PnameRaahu,
    PnameRahu,
    PnameKethu,
    PnameKetu,
    PnameUrenus,
    PnameUrenes,
    PnameNeptun,
    PnameNeptune,
    PnamePluto,
    PnamePluuto,
    GanaDeva,
    GanaMaanusha,
    GanaRaxha,
    LingaPurusha,
    LingaSthree,
    LingaNapunsaka,
    NaadiPoorva,
    NaadiMadya,
    NaadiAnthya,
    PaxhiBheruda,
    PaxhiPingala,
    PaxhiKaka,
    PaxhiKukuta,
    PaxhiMaura,
    GothraMarivi,
    GothraAthri,
    GothraVashista,
    GothraAngeera,
    GothraPulasthi,
    GothraPulaga,
    GothraKruthu,
    VarnaBrahmana,
    VarnaKshathriya,
    VarnaVyshya,
    VarnaShudra,
    VarnaPanchama,
    VarnaSankara,
    RajjuPada,
    RajjuOoru,
    RajjuNabhi,
    RajjuBahu,
    RajjuShiro,
    BhuthaPatavi,
    BhuthaAapo,
    BhuthaThejo,
    BhuthaVaayo,
    BhuthaAakasha,
    YoniAshva,
    YoniEth,
    YoniEludena,
    YoniSarpa,
    YoniSepini,
    YoniSunakha,
    YoniBalal,
    YoniElu,
    YoniBelali,
    YoniMushika,
    YoniMushikadena,
    YoniGavadena,
    YoniMeedena,
    YoniVyagra,
    YoniMeegon,
    YoniVyagradena,
    YoniMuvadena,
    YoniMuva,
    YoniSunakhi,
    YoniVendiri,
    YoniMugatidena,
    YoniVanduru,
    YoniSinhadena,
    YoniVelamba,
    YoniSinha,
    YoniGon,
    YoniEthini,
    RuxhaGodaka,
    RuxhaNelli,
    RuxhaAthikka,
    RuxhaMadan,
    RuxhaKaluvara,
    RuxhaKihira,
    RuxhaUna,
    RuxhaBo,
    RuxhaDomba,
    RuxhaNuga,
    RuxhaKela,
    RuxhaAlari,
    RuxhaDimbul,
    RuxhaBeli,
    RuxhaKumbuk,
    RuxhaSapu,
    RuxhaMunamal,
    RuxhaVetake,
    RuxhaImbul,
    RuxhaHopalu,
    RuxhaKos,
    RuxhaVara,
    RuxhaSamadara,
    RuxhaKolong,
    RuxhaMeeAmba,
    RuxhaKohomba,
    RuxhaMee,
    UiProfileFullName,
    UiProfileBirthDate,
    UiProfileBirthDay,
    UiProfileBirthPlace,
    UiAstroJulianDate,
    UiAstroAyanamsa,
    UiAstroLagna,
    UiAstroLagnaDegree,
    UiAstroLagnaNavamsa,
    UiTimeBirthTime,
    UiTimeSinhalaTime,
    UiTimeTrueLocalMeanTime,
    UiTimeUniversalTimeUT,
    UiTimeUniversalSidereal,
    UiTimeLocalMeanSidereal,
    UiTimeSunrise,
    UiTimeSunset,
    UiPanchangaTithi,
    UiPanchangaNakshatra,
    UiPanchangaNakshatraPada,
    UiPanchangaYoga,
    UiPanchangaKarana,
    UiDasaStarting,
    UiDasaPeriod,
    UiDasaReference,
    UiDasaFromBirth,
    UiDasaYears,
    UiDasaMonths,
    UiDasaDays,
    UiHoraKala,
    UiHoraPanchama,
    UiHoraSukshama,
    UiChakraGana,
    UiChakraYoni,
    UiChakraLinga,
    UiChakraNaadi,
    UiChakraVarna,
    UiChakraRuxha,
    UiChakraPaxhi,
    UiChakraGothra,
    UiChakraRajju,
    UiChakraBhutha,
    UiHouseName,
    UiHouseBorn,
    UiHousePlace,
    UiOptDistrict,
    UiOptManualGeo,
    UiOptMethod,
    UiOptNirayanaSidereal,
    UiOptSayanaTropical,
    UiTitleHoroscopeProfile,
    UiTitleDistrictSelection,
    UiTitleNirayanaTableOfHouses,
    UiTitleShadvargaCharts,
    UiTitleShadvargaPositions,
    UiTitleMahadasaTimeline,
    UiTitlePanchanga,
    UiTitleDasaInformation,
    UiTitleHora,
    UiTitleChakra,
    UiTitleKendraType,
    UiTitleBirthProfile,
    UiTitleAstroReference,
    UiTitleTimeMetrics,
    UiTitleSelectedOptions,
    UiTitleHoroscopeOwnerDetails,
    UiTitleAyanamsaMethod,
    UiPromptThathkalaKendraYN,
    UiPromptMethodSN,
    UiPromptFullName,
    UiPromptBirthDate,
    UiPromptBirthTime,
    UiPromptClosestDistrict,
    UiPromptLatitude,
    UiPromptLongitude,
    UiPromptThathkalaKendra,
    UiHintDateEg,
    UiHintTimeEg,
    UiHintDistrictEg,
    UiHintLatEg,
    UiHintLonEg,
    UiKendraLagna,
    UiKendraNavamsaka,
    UiKendraHora,
    UiKendraDeshkana,
    UiKendraDvadasansa,
    UiKendraTrisansaka,
    UiKendraSooryarasi,
    UiKendraSandurasi,
    UiKendraHoraChart,
    UiKendraDrekkanaChart,
    UiChartLagna,
    UiChartNavamsa,
    UiChartDvadasamsa,
    UiChartTrimshamsa,
    UiChartSun,
    UiChartMoon,
    UiMiscYes,
    UiMiscNo,
    Count
};


struct ConceptText {
    const char* en = "";  // current modern-display string (fallback)
};

// A translated row. Rows live in the translator files src/locale_si.inc /
// src/locale_ta.inc (sparse: absent concepts fall back to English), so
// translators never touch this header or the concept table.
struct TrRow {
    Concept c;
    const char* s = "";      // script form (empty = untranslated)
    const char* roman = "";  // romanized form (empty = untranslated)
    ReviewStatus st = ReviewStatus::Unsourced;
};

// PROVENANCE: SCAFFOLD (en cells mirror ModernRenderer tables; si/ta pending
// the sourcing track — see test_locale pinning en equality).
[[nodiscard]] inline const ConceptText& conceptText(Concept c) noexcept {
    static const ConceptText k[] = {
        {"Mesha"}, {"Vrishabha"}, {"Mithuna"}, {"Kataka"}, {"Simha"}, {"Kanya"},
        {"Tula"}, {"Vrishchika"}, {"Dhanu"}, {"Makara"}, {"Kumbha"}, {"Meena"},
        {"Rashi"}, {"Navamsa"}, {"Hora"}, {"Drekkana"}, {"Dvadasamsa"}, {"Trimshamsa"},
        {"Sunday"}, {"Monday"}, {"Tuesday"}, {"Wednesday"}, {"Thursday"}, {"Friday"},
        {"Saturday"},
        {"January"}, {"February"}, {"March"}, {"April"}, {"May"}, {"June"},
        {"July"}, {"August"}, {"September"}, {"October"}, {"November"}, {"December"},
        {"Ketu"}, {"Shukra"}, {"Ravi"}, {"Chandra"}, {"Kuja"}, {"Rahu"},
        {"Guru"}, {"Shani"}, {"Budha"},
        {"Asvida"}, {"Berana"}, {"Keti"}, {"Rehena"}, {"Muvasirasa"}, {"Ada"},
        {"Punavasa"}, {"Pushha"}, {"Aslisa"}, {"Maa"}, {"Puvapal"}, {"Utrapal"},
        {"Hata"}, {"Sita"}, {"Saa"}, {"Visa"}, {"Anura"}, {"Deta"},
        {"Mula"}, {"Puvasala"}, {"Utrasala"}, {"Suvana"}, {"Denata"}, {"Siyavsa"},
        {"Puvaputupa"}, {"Utraputupa"}, {"Revathee"},
        {"Colombo"}, {"Galle"}, {"Matara"}, {"Kandy"}, {"Hambantota"},
        {"Kalutara"}, {"Ratnapura"}, {"Puttalam"}, {"Anuradhapura"}, {"Polonnaruwa"},
        {"Jaffna"}, {"Trincomalee"}, {"Batticaloa"}, {"Badulla"}, {"Kegalle"},
        {"Ampara"}, {"Batticaloa"}, {"Gampaha"}, {"Kilinochchi"}, {"Kurunegala"},
        {"Mannar"}, {"Matale"}, {"Monaragala"}, {"Mullaitivu"}, {"Nuwara Eliya"},
        {"Vavuniya"},
        {"Vishkamba"}, {"Preethi"}, {"Aaushmaan"}, {"Savbhagya"}, {"Shobhana"},
        {"Athiganda"}, {"Sukarna"}, {"Drathi"}, {"Shula"}, {"Ganda"},
        {"Wruddhi"}, {"Drava"}, {"Vyaghatha"}, {"Harshana"}, {"Vajra"},
        {"Siddi"}, {"Vyathipatha"}, {"Varyayan"}, {"Parigha"}, {"Shiva"},
        {"Sidda"}, {"Saadaya"}, {"Shubha"}, {"Shubra"}, {"Brahhma"},
        {"Mahendra"}, {"Vydruthi"},
        {"Pelaviya"}, {"Diyawaka"}, {"Thiyawaka"}, {"Jalawaka"}, {"Visheniya"},
        {"Shatawaka"}, {"Sathawaka"}, {"Atawaka"}, {"Navawaka"}, {"Dasawaka"},
        {"Ekoloswaka"}, {"Doloswaka"}, {"Theleswaka"}, {"Thuduswaka"}, {"Pasaloswaka"},
        {"Kinsthugana"}, {"Bava"}, {"Baalava"}, {"Kavlava"}, {"Thithila"},
        {"Garaja"}, {"Vanija"}, {"Vishti"}, {"Chathuppada"}, {"Shakuna"}, {"Naaga"},
        {"Lagna"}, {"Sandu"}, {"Chandra"}, {"Chadra"}, {"Ravi"}, {"Rav1"},
        {"Budha"}, {"Sikuru"}, {"Kuja"}, {"Guru"}, {"Shani"}, {"Raahu"},
        {"Rahu"}, {"Kethu"}, {"Ketu"}, {"Urenus"}, {"Urenes"}, {"Neptun"},
        {"Neptune"}, {"Pluto"}, {"Pluuto"},
        {"Deva"}, {"Maanusha"}, {"Raxha"},
        {"Purusha"}, {"Sthree"}, {"Napunsaka"},
        {"Poorva"}, {"Madya"}, {"Anthya"},
        {"Bheruda"}, {"Pingala"}, {"Kaka"}, {"Kukuta"}, {"Maura"},
        {"Marivi"}, {"Athri"}, {"Vashista"}, {"Angeera"}, {"Pulasthi"},
        {"Pulaga"}, {"Kruthu"},
        {"Brahmana"}, {"Kshathriya"}, {"Vyshya"}, {"Shudra"}, {"Panchama"}, {"Sankara"},
        {"Pada"}, {"Ooru"}, {"Nabhi"}, {"Bahu"}, {"Shiro"},
        {"Patavi"}, {"Aapo"}, {"Thejo"}, {"Vaayo"}, {"Aakasha"},
        {"Ashva"}, {"Eth"}, {"Eludena*"}, {"Sarpa"}, {"Sepini*"}, {"Sunakha"},
        {"Balal"}, {"Elu"}, {"Belali*"}, {"Mushika"}, {"Mushikadena*"},
        {"Gavadena*"}, {"Meedena"}, {"Vyagra"}, {"Meegon"}, {"Vyagradena*"},
        {"Muvadena*"}, {"Muva"}, {"Sunakhi*"}, {"Vendiri"}, {"Mugatidena"},
        {"Vanduru"}, {"Sinhadena*"}, {"Velamba*"}, {"Sinha       "},
        {"Gon"}, {"Ethini"},
        {"Godaka"}, {"Nelli"}, {"Athikka"}, {"Madan"}, {"Kaluvara"}, {"Kihira"},
        {"Una"}, {"Bo#"}, {"Domba#"}, {"Nuga#"}, {"Kela#"}, {"Alari#"},
        {"Dimbul"}, {"Beli"}, {"Kumbuk"}, {"Sapu"}, {"Munamal"}, {"Vetake#"},
        {"Imbul#"}, {"Hopalu#"}, {"Kos#"}, {"Vara#"}, {"Samadara"}, {"Kolong"},
        {"Mee Amba#"}, {"Kohomba"}, {"Mee#"},
        {"Full Name"}, {"Birth Date"}, {"Birth Day"}, {"Birth Place"},
        {"Julian Date"}, {"Ayanamsa"}, {"Lagna"}, {"Lagna Degree"}, {"Lagna Navamsa"},
        {"Birth Time"}, {"Sinhala Time"}, {"True Local Mean Time"},
        {"Universal Time (UT)"}, {"Universal Sidereal"}, {"Local Mean Sidereal"},
        {"Sunrise"}, {"Sunset"},
        {"Tithi"}, {"Nakshatra"}, {"Nakshatra Pada"}, {"Yoga"}, {"Karana"},
        {"Starting"}, {"Period"}, {"Reference"},
        {"From birth"}, {"years"}, {"months"}, {"days"},
        {"Kala"}, {"Panchama"}, {"Sukshama"},
        {"Gana"}, {"Yoni"}, {"Linga"}, {"Naadi"}, {"Varna"},
        {"Ruxha"}, {"Paxhi"}, {"Gothra"}, {"Rajju"}, {"Bhutha"},
        {"Name"}, {"Born"}, {"Place"},
        {"District"}, {"Manual Geo"}, {"Method"},
        {"Nirayana (Sidereal)"}, {"Sayana (Tropical)"},
        {"Horoscope Profile"}, {"District Selection"}, {"Nirayana Table of Houses"},
        {"Shadvarga Charts"}, {"Shadvarga Positions"}, {"Mahadasa and Athurudasa Timeline"},
        {"Panchanga"}, {"Dasa Information"}, {"Hora"}, {"Chakra"},
        {"Kendra Type"}, {"Birth Profile"}, {"Astronomical & Chart Reference"},
        {"Time & Solar Metrics"}, {"Selected Options"},
        {"Horoscope Owner Details"}, {"Ayanamsa Method"},
        {"  Use Thathkala Kendra [y/N]: "}, {"  Method (S)ayana / (N)irayana [s/N]: "},
        {"  Full Name: "}, {"  Birth Date (YYYY MM DD): "},
        {"  Birth Time (HH MM, 24h): "}, {"  Closest District [1-26, >26 Other]:"},
        {"  Latitude (Deg Min):"}, {"  Longitude (Deg Min):"}, {"Thathkala Kendra: "},
        {"YYYY MM DD, eg: 2000 08 17"}, {"HH MM (24h), eg: 14 05"},
        {"district number, eg: 7"}, {"Deg Min, eg: 6 37"}, {"Deg Min, eg: 80 24"},
        {"LAGNA"}, {"NAVAMSAKA"}, {"HORA"}, {"DESHKANA"}, {"DVADASANSA"},
        {"TRISANSAKA"}, {"SOORYARASI"}, {"SANDURASI"},
        {"Hora Chart"}, {"Drekkana Chart"},
        {"Lagna Chart"}, {"Navamsa Chart"},
        {"Dvadasamsa Chart"}, {"Trimshamsa Chart"}, {"Sun Chart"}, {"Moon Chart"},
        {"Yes"}, {"No"},
    };
    return k[static_cast<std::size_t>(c)];
}

// Translation-table detail (after Concept: rows reference concept ids).
namespace detail {

inline const TrRow* siRows(size_t* n) {
    static const TrRow k[] = {
#include "locale_si.inc"
    };
    *n = sizeof(k) / sizeof(k[0]);
    return k;
}

inline const TrRow* taRows(size_t* n) {
    static const TrRow k[] = {
#include "locale_ta.inc"
    };
    *n = sizeof(k) / sizeof(k[0]);
    return k;
}

// First non-empty row wins; empty cells fall through to English.
[[nodiscard]] inline const char* trLookup(const TrRow* rows, size_t n, Concept c,
                                          bool roman) noexcept {
    for (size_t i = 0; i < n; ++i) {
        if (rows[i].c != c) continue;
        const char* s = roman ? rows[i].roman : rows[i].s;
        if (s != nullptr && s[0] != '\0') return s;
    }
    return nullptr;
}

}  // namespace detail

// Localized string with English fallback for untranslated cells.
[[nodiscard]] inline const char* localeText(Concept c, Locale loc) noexcept {
    if (loc == Locale::Si || loc == Locale::Ta) {
        size_t n = 0;
        const TrRow* rows = (loc == Locale::Si) ? detail::siRows(&n) : detail::taRows(&n);
        const char* s = detail::trLookup(rows, n, c, false);
        if (s != nullptr) return s;
    }
    return conceptText(c).en;
}

// Romanized form with English fallback.
[[nodiscard]] inline const char* localeRoman(Concept c, Locale loc) noexcept {
    if (loc == Locale::Si || loc == Locale::Ta) {
        size_t n = 0;
        const TrRow* rows = (loc == Locale::Si) ? detail::siRows(&n) : detail::taRows(&n);
        const char* s = detail::trLookup(rows, n, c, true);
        if (s != nullptr) return s;
    }
    return conceptText(c).en;
}

// Reverse map for the string-layer chokepoints (sectionTitle/divider titles
// and renderKeyValues row keys): exact modern strings that have a concept.
// Anything absent passes through untranslated (dynamic text, values, table
// heads) — so the hook can never alter output by itself.
[[nodiscard]] inline Concept conceptForEn(std::string_view s) noexcept {
    static const Concept k[] = {
        Concept::UiProfileFullName, Concept::UiProfileBirthDate,
        Concept::UiProfileBirthDay, Concept::UiProfileBirthPlace,
        Concept::UiAstroJulianDate, Concept::UiAstroAyanamsa, Concept::UiAstroLagna,
        Concept::UiAstroLagnaDegree, Concept::UiAstroLagnaNavamsa,
        Concept::UiTimeBirthTime, Concept::UiTimeSinhalaTime,
        Concept::UiTimeTrueLocalMeanTime, Concept::UiTimeUniversalTimeUT,
        Concept::UiTimeUniversalSidereal, Concept::UiTimeLocalMeanSidereal,
        Concept::UiTimeSunrise, Concept::UiTimeSunset,
        Concept::UiPanchangaTithi, Concept::UiPanchangaNakshatra,
        Concept::UiPanchangaNakshatraPada, Concept::UiPanchangaYoga,
        Concept::UiPanchangaKarana,
        Concept::UiDasaStarting, Concept::UiDasaPeriod, Concept::UiDasaReference,
        Concept::UiHoraKala, Concept::UiHoraPanchama, Concept::UiHoraSukshama,
        Concept::UiChakraGana, Concept::UiChakraYoni, Concept::UiChakraLinga,
        Concept::UiChakraNaadi, Concept::UiChakraVarna, Concept::UiChakraRuxha,
        Concept::UiChakraPaxhi, Concept::UiChakraGothra, Concept::UiChakraRajju,
        Concept::UiChakraBhutha,
        Concept::UiHouseName, Concept::UiHouseBorn, Concept::UiHousePlace,
        Concept::UiOptDistrict, Concept::UiOptManualGeo, Concept::UiOptMethod,
        Concept::UiTitleHoroscopeProfile, Concept::UiTitleDistrictSelection,
        Concept::UiTitleNirayanaTableOfHouses, Concept::UiTitleShadvargaCharts,
        Concept::UiTitleShadvargaPositions, Concept::UiTitleMahadasaTimeline,
        Concept::UiTitlePanchanga, Concept::UiTitleDasaInformation,
        Concept::UiTitleHora, Concept::UiTitleChakra,
        Concept::UiTitleKendraType, Concept::UiTitleBirthProfile,
        Concept::UiTitleAstroReference, Concept::UiTitleTimeMetrics,
        Concept::UiTitleSelectedOptions, Concept::UiTitleHoroscopeOwnerDetails,
        Concept::UiTitleAyanamsaMethod,
        Concept::UiKendraLagna, Concept::UiKendraNavamsaka, Concept::UiKendraHora,
        Concept::UiKendraDeshkana, Concept::UiKendraDvadasansa,
        Concept::UiKendraTrisansaka, Concept::UiKendraSooryarasi,
        Concept::UiKendraSandurasi, Concept::UiKendraHoraChart,
        Concept::UiKendraDrekkanaChart,
        Concept::UiChartLagna, Concept::UiChartNavamsa,
        Concept::UiChartDvadasamsa, Concept::UiChartTrimshamsa,
        Concept::UiChartSun, Concept::UiChartMoon,
    };
    for (const Concept c : k)
        if (std::string_view(conceptText(c).en) == s) return c;
    return Concept::Count;
}

// Chokepoint translation: mapped strings localize, everything else passes
// through untouched (returns a std::string since the input may be dynamic).
[[nodiscard]] inline std::string localizeKey(std::string_view s, Locale loc) {
    const Concept c = conceptForEn(s);
    if (c == Concept::Count) return std::string(s);
    return localeText(c, loc);
}

}  // namespace star



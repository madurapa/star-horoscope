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

// Pilot concept set: rasis + vargas + weekdays + months (37 rows). The full
// coded vocabulary (planets, districts, dasa lords, nakshatras, ...) follows
// the same shape in later increments.
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
    Count
};

struct ConceptText {
    const char* en = "";       // current modern-display string (fallback)
    const char* si = "";       // Sinhala script (empty until sourced)
    const char* ta = "";       // Tamil script (empty until sourced)
    const char* siRoman = "";  // romanized Sinhala (empty until sourced)
    const char* taRoman = "";  // romanized Tamil (empty until sourced)
    ReviewStatus siStatus = ReviewStatus::Unsourced;
    ReviewStatus taStatus = ReviewStatus::Unsourced;
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
    };
    return k[static_cast<std::size_t>(c)];
}

// Localized string with English fallback for untranslated cells.
[[nodiscard]] inline const char* localeText(Concept c, Locale loc) noexcept {
    const ConceptText& t = conceptText(c);
    if (loc == Locale::Si && t.si[0] != '\0') return t.si;
    if (loc == Locale::Ta && t.ta[0] != '\0') return t.ta;
    return t.en;
}

}  // namespace star

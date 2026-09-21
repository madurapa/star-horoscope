// Phase-3 locale model tests (scaffolding increment: no renderer call-sites,
// so these pin the model, not output).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_locale.cpp -o /tmp/test_locale
#include <cstdio>
#include <string>

#include "../src/Locale.hpp"
#include "../src/ModernRenderer.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    // en cells mirror the live modern tables (drift guard: editing either
    // side deliberately means updating both).
    for (int i = 1; i <= 12; ++i) {
        const Concept c = static_cast<Concept>(i - 1);
        STAR_CHECK(std::string(conceptText(c).en) == modern::rasiName(i), "rasi en %d", i);
    }
    for (int i = 0; i < 6; ++i) {
        const Concept c = static_cast<Concept>(12 + i);
        STAR_CHECK(std::string(conceptText(c).en) == modern::vargaName(i), "varga en %d", i);
    }
    static const char* days[7] = {"Sunday", "Monday", "Tuesday", "Wednesday",
                                  "Thursday", "Friday", "Saturday"};
    static const char* months[12] = {"January", "February", "March", "April", "May", "June",
                                     "July", "August", "September", "October", "November",
                                     "December"};
    for (int i = 0; i < 7; ++i)
        STAR_CHECK(std::string(conceptText(static_cast<Concept>(18 + i)).en) == days[i],
                   "weekday en %d", i);
    for (int i = 0; i < 12; ++i)
        STAR_CHECK(std::string(conceptText(static_cast<Concept>(25 + i)).en) == months[i],
                   "month en %d", i);
    // Every concept: non-empty en; si/ta fall back to en; both Unsourced.
    for (int i = 0; i < static_cast<int>(Concept::Count); ++i) {
        const Concept c = static_cast<Concept>(i);
        const ConceptText& t = conceptText(c);
        STAR_CHECK(t.en[0] != '\0', "en nonempty %d", i);
        STAR_CHECK(std::string(localeText(c, Locale::En)) == t.en, "en passthrough %d", i);
        STAR_CHECK(std::string(localeText(c, Locale::Si)) == t.en, "si fallback %d", i);
        STAR_CHECK(std::string(localeText(c, Locale::Ta)) == t.en, "ta fallback %d", i);
        STAR_CHECK(t.siStatus == ReviewStatus::Unsourced, "si unsourced %d", i);
        STAR_CHECK(t.taStatus == ReviewStatus::Unsourced, "ta unsourced %d", i);
    }
    // Locale parsing for the future --locale flag.
    Locale loc = Locale::En;
    STAR_CHECK(parseLocale("en", loc) && loc == Locale::En, "parse en");
    STAR_CHECK(parseLocale("si", loc) && loc == Locale::Si, "parse si");
    STAR_CHECK(parseLocale("ta", loc) && loc == Locale::Ta, "parse ta");
    STAR_CHECK(!parseLocale("de", loc), "parse de rejected");
    STAR_CHECK(!parseLocale("", loc), "parse empty rejected");
    STAR_CHECK(std::string(localeName(Locale::Si)) == "si", "localeName");
    if (::startest::g_fail == 0) std::printf("LOCALE_ALL_GREEN\n");
    return ::startest::exitCode();
}

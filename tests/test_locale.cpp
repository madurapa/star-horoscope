// Phase-3 locale model tests (scaffolding increment: no renderer call-sites,
// so these pin the model, not output).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_locale.cpp -o /tmp/test_locale
#include <cstdio>
#include <string>

#include "../src/Attributes.hpp"
#include "../src/Locale.hpp"
#include "../src/ModernRenderer.hpp"
#include "../src/Panchanga.hpp"
#include "../src/Vimshottari.hpp"
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
    for (int i = 0; i < 9; ++i) {
        const Concept c = static_cast<Concept>(37 + i);
        STAR_CHECK(std::string(conceptText(c).en) ==
                       modern::dasaName(kDasaCycle[static_cast<std::size_t>(i)].name),
                   "dasa en %d", i);
    }
    for (int i = 0; i < 27; ++i) {
        const Concept c = static_cast<Concept>(46 + i);
        STAR_CHECK(std::string(conceptText(c).en) == nakshatraDisplayName(i), "nak en %d", i);
    }
    for (int i = 1; i <= kCityCount; ++i) {
        const Concept c = static_cast<Concept>(72 + i);
        STAR_CHECK(std::string(conceptText(c).en) == modern::cityLabel(i), "district en %d",
                   i);
    }
    for (int i = 0; i < 27; ++i) {
        const Concept c = static_cast<Concept>(99 + i);
        STAR_CHECK(std::string(conceptText(c).en) == yogaName(i), "yoga en %d", i);
    }
    for (int i = 1; i <= 15; ++i) {
        const Concept c = static_cast<Concept>(125 + i);
        STAR_CHECK(std::string(conceptText(c).en) == tithiLimbName(i), "limb en %d", i);
    }
    static const double kKarElong[11] = {0.0,  6.0,  12.0, 18.0, 24.0,  30.0,
                                         36.0, 42.0, 264.0, 348.0, 354.0};
    for (int i = 0; i < 11; ++i) {
        const Concept c = static_cast<Concept>(141 + i);
        STAR_CHECK(std::string(conceptText(c).en) == karanaName(kKarElong[i], 0),
                   "karana en %d", i);
    }
    static const Concept kPnameCon[21] = {
        Concept::PnameLagna,   Concept::PnameSandu,   Concept::PnameChandra,
        Concept::PnameChadra,  Concept::PnameRavi,    Concept::PnameRav1,
        Concept::PnameBudha,   Concept::PnameSikuru,  Concept::PnameKuja,
        Concept::PnameGuru,    Concept::PnameShani,   Concept::PnameRaahu,
        Concept::PnameRahu,    Concept::PnameKethu,   Concept::PnameKetu,
        Concept::PnameUrenus,  Concept::PnameUrenes,  Concept::PnameNeptun,
        Concept::PnameNeptune, Concept::PnamePluto,   Concept::PnamePluuto};
    static const Planet kPnamePl[21] = {
        Planet::Lagna,   Planet::Chandra, Planet::Chandra, Planet::Chandra,
        Planet::Ravi,    Planet::Ravi,    Planet::Budha,   Planet::Sikuru,
        Planet::Kuja,    Planet::Guru,    Planet::Shani,   Planet::Raahu,
        Planet::Raahu,   Planet::Kethu,   Planet::Kethu,   Planet::Urenus,
        Planet::Urenus,  Planet::Neptune, Planet::Neptune, Planet::Pluto,
        Planet::Pluto};
    static const NameSlot kPnameSl[21] = {
        NameSlot::House, NameSlot::House,     NameSlot::Shadvarga, NameSlot::HoraB,
        NameSlot::House, NameSlot::Shadvarga, NameSlot::House,     NameSlot::House,
        NameSlot::House, NameSlot::House,     NameSlot::House,     NameSlot::House,
        NameSlot::Dasa,  NameSlot::House,     NameSlot::Dasa,      NameSlot::House,
        NameSlot::Shadvarga, NameSlot::House, NameSlot::Shadvarga, NameSlot::House,
        NameSlot::Shadvarga};
    for (int i = 0; i < 21; ++i)
        STAR_CHECK(std::string(conceptText(kPnameCon[i]).en) ==
                       planetSlotName(kPnamePl[i], kPnameSl[i]),
                   "pname en %d", i);
    static const int kAttrNak[8][7] = {{0, 1, 2},       // gana
                                       {0, 2, 4},       // linga
                                       {0, 1, 2},       // naadi
                                       {0, 5, 11, 16, 22},  // paxhi (5 used)
                                       {0, 4, 8, 12, 16, 20, 23},  // gothra
                                       {0, 1, 2, 3, 4, 5},  // varna (6 used)
                                       {0, 1, 2, 3, 4},     // rajju (5 used)
                                       {0, 5, 11, 15, 21}};  // bhutha (5 used)
    static const char* (*kAttrFn[8])(int) = {ganaFor, lingaFor, naadiFor, paxhiFor,
                                             gothraFor, varnaFor, rajjuFor, bhuthaFor};
    static const int kAttrBase[8] = {173, 176, 179, 182, 187, 194, 200, 205};
    static const int kAttrCount[8] = {3, 3, 3, 5, 7, 6, 5, 5};
    for (int g = 0; g < 8; ++g)
        for (int i = 0; i < kAttrCount[g]; ++i) {
            const Concept c = static_cast<Concept>(kAttrBase[g] + i);
            STAR_CHECK(std::string(conceptText(c).en) == kAttrFn[g](kAttrNak[g][i]),
                       "attr en %d/%d", g, i);
        }
    for (int i = 0; i < 27; ++i) {
        STAR_CHECK(std::string(conceptText(static_cast<Concept>(210 + i)).en) == yoniFor(i),
                   "yoni en %d", i);
        STAR_CHECK(std::string(conceptText(static_cast<Concept>(237 + i)).en) == ruxhaFor(i),
                   "ruxha en %d", i);
    }
    STAR_CHECK(static_cast<int>(Concept::Count) == 353, "concept count %d",
               static_cast<int>(Concept::Count));
    auto keysOf = [](const modern::KeyRows& rows) {
        std::vector<std::string> k;
        for (const auto& r : rows) k.push_back(r.first);
        return k;
    };
    {
        const HoroscopeOwner owner{"Test User", 2000, 8, 17, 14, 5};
        const std::vector<std::string> want = {"Full Name", "Birth Date", "Birth Day",
                                               "Birth Place"};
        STAR_CHECK(keysOf(modern::birthProfileRows(owner, "Ratnapura", "Thursday")) == want,
                   "profile keys");
    }
    {
        const std::vector<std::string> want = {"Tithi", "Nakshatra", "Nakshatra Pada",
                                               "Yoga", "Karana"};
        STAR_CHECK(keysOf(modern::panchangaRows(PanchangaInfo{})) == want, "panchanga keys");
    }
    {
        const std::vector<std::string> want = {"Starting", "Period", "Reference"};
        STAR_CHECK(keysOf(modern::dasaInfoRows(DasaBalance{})) == want, "dasa keys");
    }
    {
        const std::vector<std::string> want = {"Kala", "Panchama", "Sukshama"};
        STAR_CHECK(keysOf(modern::horaRows("a", "b", "c")) == want, "hora keys");
    }
    {
        const std::vector<std::string> want = {"Gana",     "Yoni",  "Linga", "Naadi",
                                               "Varna",    "Ruxha", "Paxhi", "Gothra",
                                               "Rajju",    "Bhutha"};
        STAR_CHECK(keysOf(modern::chakraRows(0)) == want, "chakra keys");
    }
    // Row-function keys must equal the matching UI concepts (order-sensitive).
    static const Concept kProfileCon[4] = {Concept::UiProfileFullName, Concept::UiProfileBirthDate,
                                           Concept::UiProfileBirthDay,
                                           Concept::UiProfileBirthPlace};
    {
        const HoroscopeOwner owner{"Test User", 2000, 8, 17, 14, 5};
        const auto keys =
            keysOf(modern::birthProfileRows(owner, "Ratnapura", "Thursday"));
        for (int i = 0; i < 4; ++i)
            STAR_CHECK(keys[static_cast<std::size_t>(i)] == conceptText(kProfileCon[i]).en,
                       "profile concept %d", i);
    }
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

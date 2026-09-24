// Glossary dump: modern display vocabulary for docs/glossary.md.
// Single Term column (legacy Old columns dropped per remove_legacy R6b);
// Note stays reserved for translator/reviewer notes (Phase 3).
// Coded tables only; the UI term list is curated by hand in the same file.
// Build with:
// g++ -std=c++20 -O2 -Isrc -Ithird_party/swisseph tools/dump_glossary.cpp src/VargaEngine.cpp src/SwissFeed.cpp third_party/swisseph/swe*.c -o /tmp/dump_glossary -lm -ldl
#include <cstdio>
#include <set>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/Attributes.hpp"
#include "../src/ModernRenderer.hpp"
#include "../src/Panchanga.hpp"
#include "../src/ScreenRenderer.hpp"

using namespace star;

static std::string trim(std::string s) {
    while (!s.empty() && (s.back() == ' ' || s.back() == '\t')) s.pop_back();
    size_t a = s.find_first_not_of(" \t");
    return a == std::string::npos ? "" : s.substr(a);
}

static void term(const std::string& v) {
    std::printf("| %s | |\n", v.c_str());
}

static void termUnique(std::set<std::string>& seen, const std::string& v) {
    if (seen.insert(v).second) term(v);
}

int main() {
    std::printf("### Planets\n");
    std::printf("| Term | Note |\n| --- | --- |\n");
    for (int i = 0; i < 13; ++i) term(modern::displayPlanet(kPlanetNames[i]));

    std::printf("\n### Rasis\n| Term | Note |\n| --- | --- |\n");
    for (int i = 1; i <= 12; ++i) term(modern::rasiName(i));

    std::printf("\n### Vargas\n| Term | Note |\n| --- | --- |\n");
    for (int i = 0; i < 6; ++i) term(modern::vargaName(i));

    std::printf("\n### Cities\n| Term | Note |\n| --- | --- |\n");
    for (int i = 1; i <= kCityCount; ++i) term(modern::cityLabel(i));

    std::printf("\n### Vimshottari dasa lords\n| Term | Note |\n| --- | --- |\n");
    {
        std::set<std::string> seen;
        for (const auto& d : kVimshottari) termUnique(seen, modern::dasaName(d.name));
    }

    std::printf("\n### Nakshatras (transliterated vocabulary)\n| Term | Note |\n| --- | --- |\n");
    for (int i = 0; i < 27; ++i) term(nakshatraDisplayName(i));

    std::printf("\n### Weekdays\n| Term | Note |\n| --- | --- |\n");
    for (int i = 0; i < 7; ++i) term(weekdayName(i));

    std::printf("\n### Yoga names\n| Term | Note |\n| --- | --- |\n");
    {
        std::set<std::string> seen;
        for (int i = 0; i < 27; ++i) termUnique(seen, modern::displayYogaName(yogaName(i)));
    }

    std::printf("\n### Tithi displays\n| Term | Note |\n| --- | --- |\n");
    for (int i = 1; i <= 30; ++i) term(trim(tithiDisplay(i)));

    std::printf("\n### Karana names\n| Term | Note |\n| --- | --- |\n");
    {
        std::set<std::string> seen;
        for (double e = 0.0; e < 360.0; e += 0.5)
            termUnique(seen, modern::displayKaranaName(trim(karanaName(e, 2))));
    }

    std::printf("\n### Attributes (transliterated vocabulary)\n| Term | Note |\n| --- | --- |\n");
    {
        std::vector<const char* (*) (int)> fns = {ganaFor,   yoniFor,  ruxhaFor,
                                                  lingaFor,  naadiFor, paxhiFor,
                                                  gothraFor, varnaFor, rajjuFor,
                                                  bhuthaFor};
        std::set<std::string> seen;
        for (auto f : fns)
            for (int i = 0; i < 27; ++i) {
                // Yoni renders through the 10-char display truncation.
                std::string v = (f == yoniFor) ? trim(displayYoni(f(i))) : trim(f(i));
                termUnique(seen, v);
            }
    }
    return 0;
}

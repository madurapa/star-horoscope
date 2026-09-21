// Glossary dump: Old (STAR.EXE literals) vs New (modern display) rows for
// docs/glossary.md. Coded tables only; free-form UI strings are curated by
// hand in the same file. Build with:
// g++ -std=c++20 -O2 -Isrc tools/dump_glossary.cpp src/VargaEngine.cpp -o /tmp/dump_glossary
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

static void row(const std::string& oldV, const std::string& newV) {
    std::printf("| %s | %s | |\n", oldV.c_str(), newV.c_str());
}

int main() {
    std::printf("### Planets (engine key -> legacy screen spellings -> modern)\n");
    std::printf("| Old | New | Note |\n| --- | --- | --- |\n");
    const char* legacyHouse[13] = {"Lagna", "Sandu",  "Ravi",  "Budha", "Sikuru", "Kuja",
                                   "Guru",  "Shani",  "Raahu", "Kethu", "Urenus", "Neptun",
                                   "Pluto"};
    const char* legacyShad[13] = {"Lagna", "Chandra", "Rav1",  "Budha", "Sikuru", "Kuja",
                                  "Guru",  "Shani",   "Raahu", "Kethu", "Urenes", "Neptune",
                                  "Pluuto"};
    for (int i = 0; i < 13; ++i) {
        const std::string key = kPlanetNames[i];
        row(std::string(legacyHouse[i]) + " (houses)", modern::displayPlanet(key));
        if (std::string(legacyShad[i]) != legacyHouse[i])
            row(std::string(legacyShad[i]) + " (shadvarga)", modern::displayPlanet(key));
    }

    std::printf("\n### Rasis\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 1; i <= 12; ++i) row(rasiName(i), modern::rasiName(i));
    row("Mithuna (house table spelling)", "Mithuna");

    std::printf("\n### Vargas\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 0; i < 6; ++i)
        row(vargaName(static_cast<Varga>(i)), modern::vargaName(i));

    std::printf("\n### Cities\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 1; i <= kCityCount; ++i) row(cityByIndex(i).label, modern::cityLabel(i));

    std::printf("\n### Vimshottari dasa lords\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (const auto& d : kVimshottari) row(d.name, modern::dasaName(d.name));
    row("Rahu", "Rahu");
    row("Kethu (balance display)", "Ketu");
    row("Rav1 (balance display)", "Ravi");

    std::printf("\n### Nakshatras (unchanged transliteration)\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 0; i < 27; ++i) row(nakshatraDisplayName(i), nakshatraDisplayName(i));

    std::printf("\n### Weekdays (unchanged)\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 0; i < 7; ++i) row(weekdayName(i), weekdayName(i));

    std::printf("\n### Yoga names (unchanged)\n| Old | New | Note |\n| --- | --- | --- |\n");
    {
        std::set<std::string> seen;
        for (int i = 0; i < 27; ++i) {
            std::string v = yogaName(i);
            if (seen.insert(v).second) row(v, v);
        }
    }

    std::printf("\n### Tithi displays (unchanged)\n| Old | New | Note |\n| --- | --- | --- |\n");
    for (int i = 1; i <= 30; ++i) {
        const std::string v = trim(tithiDisplay(i));
        row(v, v);
    }

    std::printf("\n### Karana names (unchanged)\n| Old | New | Note |\n| --- | --- | --- |\n");
    {
        std::set<std::string> seen;
        for (double e = 0.0; e < 360.0; e += 0.5) {
            std::string v = trim(karanaName(e, 2));
            if (seen.insert(v).second) row(v, v);
        }
    }

    std::printf("\n### Attributes (unchanged transliteration)\n| Old | New | Note |\n| --- | --- | --- |\n");
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
                if (seen.insert(v).second) row(v, v);
            }
    }
    return 0;
}

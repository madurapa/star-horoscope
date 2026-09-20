// Trishansa 52-cell gate: screen06 + TRANSCRI2/3/4 Shadvarga matrices.
// Rule under test (docs/status_and_plans.md Session 8): odd bounds
// (4,9,18,24) -> Mesha/Kumbha/Dhanu/Mithuna/Thula; even bounds
// (4,10,19,24) -> Wrushaba/Kanya/Meena/Makara/Wrushaba (arc4 reads Venus).
// Engine longitudes drive the computation end-to-end (margins >= 15' at
// every arc boundary vs <= 2" engine error).
// Build: g++ -std=c++2a -Wall -Wextra -O2 -Isrc tests/test_trishansa.cpp src/VargaEngine.cpp -o /tmp/test_trishansa
#include <cstdio>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/Engine.hpp"
#include "../src/ScreenRenderer.hpp"
#include "../src/VargaEngine.hpp"

static int g_fail = 0;

static int RASI(const std::string& s) {
    using star::Rasi;
    if (s == "Mesha") return (int)Rasi::Mesha;
    if (s == "Wrushaba") return (int)Rasi::Wrushaba;
    if (s == "Mituna") return (int)Rasi::Mituna;
    if (s == "Kataka") return (int)Rasi::Kataka;
    if (s == "Sinha") return (int)Rasi::Sinha;
    if (s == "Kanya") return (int)Rasi::Kanya;
    if (s == "Thula") return (int)Rasi::Thula;
    if (s == "Wrschika") return (int)Rasi::Wrschika;
    if (s == "Dhanu") return (int)Rasi::Dhanu;
    if (s == "Makara") return (int)Rasi::Makara;
    if (s == "Kumba") return (int)Rasi::Kumba;
    return (int)Rasi::Meena;
}

int main() {
    using namespace star;
    struct PlanetExp {
        const char* key;
        const char* want;
    };
    struct Scenario {
        const char* tag;
        HoroscopeOwner owner;
        GeoCoord geo;
        bool nirayana;
        std::vector<PlanetExp> cells;  // Lagna + 9 + Urenus + Neptune + Pluto
    };
    const GeoCoord ratnapura{6, 37, 80, 24};
    const GeoCoord colombo{6, 50, 79, 50};
    std::vector<Scenario> scs = {
        {"base-N", {"B", 1981, 12, 8, 12, 55}, ratnapura, true,
         {{"Lagna", "Kanya"}, {"Chandra", "Dhanu"}, {"Ravi", "Makara"}, {"Budha", "Makara"},
          {"Sikuru", "Kanya"}, {"Kuja", "Wrushaba"}, {"Guru", "Kumba"}, {"Shani", "Wrushaba"},
          {"Raahu", "Wrushaba"}, {"Kethu", "Wrushaba"}, {"Urenus", "Kanya"},
          {"Neptune", "Mesha"}, {"Pluto", "Mesha"}}},
        {"base-S", {"B", 1981, 12, 8, 12, 55}, ratnapura, false,
         {{"Lagna", "Wrushaba"}, {"Chandra", "Wrushaba"}, {"Ravi", "Dhanu"}, {"Budha", "Dhanu"},
          {"Sikuru", "Wrushaba"}, {"Kuja", "Wrushaba"}, {"Guru", "Wrushaba"}, {"Shani", "Mituna"},
          {"Raahu", "Wrushaba"}, {"Kethu", "Wrushaba"}, {"Urenus", "Mesha"},
          {"Neptune", "Thula"}, {"Pluto", "Thula"}}},
        {"T3-N", {"T", 2026, 9, 12, 16, 54}, colombo, true,
         {{"Lagna", "Kumba"}, {"Chandra", "Meena"}, {"Ravi", "Thula"}, {"Budha", "Kanya"},
          {"Sikuru", "Kumba"}, {"Kuja", "Thula"}, {"Guru", "Makara"}, {"Shani", "Meena"},
          {"Raahu", "Kumba"}, {"Kethu", "Kumba"}, {"Urenus", "Meena"},
          {"Neptune", "Kanya"}, {"Pluto", "Kanya"}}},
        {"T4-S", {"T", 2026, 9, 12, 16, 57}, colombo, false,
         {{"Lagna", "Thula"}, {"Chandra", "Kumba"}, {"Ravi", "Makara"}, {"Budha", "Mesha"},
          {"Sikuru", "Wrushaba"}, {"Kuja", "Makara"}, {"Guru", "Dhanu"}, {"Shani", "Dhanu"},
          {"Raahu", "Thula"}, {"Kethu", "Thula"}, {"Urenus", "Kumba"},
          {"Neptune", "Mesha"}, {"Pluto", "Mesha"}}},
    };
    int total = 0;
    for (const auto& sc : scs) {
        const HoroscopeResult h = computeHoroscope(sc.owner, sc.geo, sc.nirayana, EngineKind::Dos);
        for (const auto& c : sc.cells) {
            ++total;
            const double dec = findLongitude(h.output, c.key)->ecliptic.toDecimal();
            const int got = VargaEngine::GetTrishansaIndex(dec);
            const int want = RASI(c.want);
            if (got != want) {
                ++g_fail;
                std::printf("FAIL %s %-8s lon=%.4f got %s want %s\n", sc.tag, c.key, dec,
                            rasiName(got), c.want);
            }
        }
        std::printf("ok   %s (%u cells)\n", sc.tag, (unsigned)sc.cells.size());
    }
    if (g_fail == 0) std::printf("TRISHANSA_ALL_GREEN (%d/%d cells)\n", total, total);
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

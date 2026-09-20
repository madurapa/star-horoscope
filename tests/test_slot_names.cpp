// Per-slot display-name resolver tests (Phase-1 array-indexed storage
// backbone): planetSlotName() must reproduce every tested legacy spelling
// mapping exactly. Any intentional respelling needs re-baselining.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_slot_names.cpp src/VargaEngine.cpp -o /tmp/test_slot_names
#include <cstdio>
#include <string>

#include "../src/AstroStructures.hpp"
#include "../src/Hora.hpp"
#include "../src/ScreenRenderer.hpp"
#include "../src/Vimshottari.hpp"
#include "check.hpp"

namespace {
// Planet index (Planet enum order) -> Hora A-number (0 = not a hora lord).
constexpr int kHoraA[13] = {0, 4, 1, 3, 2, 7, 6, 5, 0, 0, 0, 0, 0};
// Planet index -> Hora B-number (0 = not a hora lord).
constexpr int kHoraB[13] = {0, 2, 1, 4, 6, 3, 5, 7, 0, 0, 0, 0, 0};
// Planet index -> dasa-cycle lord index (-1 = not a dasa lord).
constexpr int kDasaLord[13] = {-1, 3, 2, 8, 1, 4, 6, 7, 5, 0, -1, -1, -1};
}  // namespace

int main() {
    using namespace star;
    for (int i = 0; i < 13; ++i) {
        const Planet p = static_cast<Planet>(i);
        const std::string canon(kPlanetNames[i]);
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::House)) ==
                       displayPlanetName(canon),
                   "house %s", canon.c_str());
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::Shadvarga)) ==
                       displayShadvargaName(canon),
                   "shadvarga %s", canon.c_str());
        const std::string wantA =
            (kHoraA[i] == 0) ? "" : horaAName(kHoraA[i]);
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::HoraA)) == wantA,
                   "horaA %s", canon.c_str());
        const std::string wantB =
            (kHoraB[i] == 0) ? "" : horaBName(kHoraB[i]);
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::HoraB)) == wantB,
                   "horaB %s", canon.c_str());
        const std::string dasa =
            (kDasaLord[i] < 0) ? "" : kDasaCycle[kDasaLord[i]].name;
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::Dasa)) == dasa,
                   "dasa %s", canon.c_str());
        const std::string balIn = dasa.empty() ? canon : dasa;
        STAR_CHECK(std::string(planetSlotName(p, NameSlot::Balance)) ==
                       balanceLordDisplay(balIn),
                   "balance %s", canon.c_str());
    }
    if (::startest::g_fail == 0) std::printf("SLOT_NAMES_ALL_GREEN\n");
    return ::startest::exitCode();
}

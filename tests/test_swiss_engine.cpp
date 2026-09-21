// Swiss engine feed test (Phase-2 step 2): the Swiss path returns ok
// with finite in-range values on the baseline profile; Ascendant and
// Lahiri ayanamsa sane; Swiss sidereal Sun/Moon within 1° of the DOS
// bodies (expected model closeness on this date, NOT parity — the L1
// differential harness quantifies properly).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_swiss_engine.cpp src/VargaEngine.cpp src/SwissFeed.cpp -Ithird_party/swisseph build/libswisseph.a -lm -ldl -o /tmp/test_swiss_engine
#include <cmath>
#include <cstdio>

#include "../src/Engine.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    const HoroscopeOwner o{"Test User", 2000, 8, 17, 14, 5};
    const GeoCoord geo = cityByIndex(7).coord;
    const HoroscopeResult d = computeHoroscope(o, geo, true, EngineKind::Dos);
    const HoroscopeResult s = computeHoroscope(o, geo, true, EngineKind::Swiss);
    STAR_CHECK(s.engineOk, "swiss ok %s", s.engineError.c_str());
    const double asc = s.output.lonByPlanet[0].ecliptic.toDecimal();
    STAR_CHECK(asc >= 0.0 && asc < 360.0, "asc %.4f", asc);
    STAR_CHECK(s.ayanamsaDeg > 23.0 && s.ayanamsaDeg < 24.0, "ayan %.5f",
               s.ayanamsaDeg);
    const double sunD = d.output.lonByPlanet[2].ecliptic.toDecimal();
    const double sunS = s.output.lonByPlanet[2].ecliptic.toDecimal();
    STAR_CHECK(std::fabs(sunD - sunS) < 1.0, "sun dos-swiss %.4f",
               std::fabs(sunD - sunS));
    const double monD = d.output.lonByPlanet[1].ecliptic.toDecimal();
    const double monS = s.output.lonByPlanet[1].ecliptic.toDecimal();
    STAR_CHECK(std::fabs(monD - monS) < 1.0, "moon dos-swiss %.4f",
               std::fabs(monD - monS));
    if (::startest::g_fail == 0) std::printf("SWISS_ENGINE_ALL_GREEN\n");
    return ::startest::exitCode();
}

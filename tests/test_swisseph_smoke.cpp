// Swiss Ephemeris wiring smoke test (Phase-2 step 1): the vendored
// library links, and the Moshier fallback returns plausible Sun/Moon
// longitudes for the baseline date. No golden values — the Swiss model
// differs from DOS by design (see docs/phase2_design.md); this test
// proves wiring only (flags + finite in-range values).
// Build: gcc -Wall -Wextra -O2 -Ithird_party/swisseph tests/test_swisseph_smoke.cpp build/libswisseph.a -lm -o /tmp/test_swisseph_smoke
#include <cmath>
#include <cstdio>

#include "check.hpp"
#include "swephexp.h"

int main() {
    // Baseline civil date, UT hours (12:55 IST = 07:25 UT).
    const double jut = swe_julday(1981, 12, 8, 7.0 + 25.0 / 60.0, SE_GREG_CAL);
    STAR_CHECK(jut > 2444900.0 && jut < 2445000.0, "jd %.6f", jut);
    char serr[256] = {0};
    double xsun[6] = {0};
    const int frcSun =
        swe_calc_ut(jut, SE_SUN, SEFLG_MOSEPH | SEFLG_SPEED, xsun, serr);
    STAR_CHECK((frcSun & SEFLG_MOSEPH) != 0, "sun moshier flag %d", frcSun);
    STAR_CHECK(std::isfinite(xsun[0]) && xsun[0] >= 0.0 && xsun[0] < 360.0,
               "sun lon %.4f", xsun[0]);
    double xmoon[6] = {0};
    const int frcMoon =
        swe_calc_ut(jut, SE_MOON, SEFLG_MOSEPH | SEFLG_SPEED, xmoon, serr);
    STAR_CHECK((frcMoon & SEFLG_MOSEPH) != 0, "moon moshier flag %d", frcMoon);
    STAR_CHECK(std::isfinite(xmoon[0]) && xmoon[0] >= 0.0 && xmoon[0] < 360.0,
               "moon lon %.4f", xmoon[0]);
    swe_close();
    if (::startest::g_fail == 0) std::printf("SWISSEPH_SMOKE_ALL_GREEN\n");
    return ::startest::exitCode();
}

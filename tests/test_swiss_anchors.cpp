// L2 independent anchors (Phase-2 step 4): textbook-level facts the Swiss
// path must reproduce. No DOS values, no fitted numbers — each bound is
// wide and definitional. Sources: Meeus-style JD definition (J2000),
// March-equinox Sun zero-crossing, precession-order ayanamsa rate.
// Build: part of ctest via add_star_test (links swisseph).
#include <cmath>
#include <cstdio>

#include "check.hpp"
#include "swephexp.h"

int main() {
    // Anchor 1: J2000 = JD 2451545.0 for 2000-01-01 12:00 UT by definition
    // of the civil-to-JD algorithm.
    const double j2000 = swe_julday(2000, 1, 1, 12.0, SE_GREG_CAL);
    STAR_CHECK(std::fabs(j2000 - 2451545.0) < 1e-9, "j2000 %.9f", j2000);

    // Anchor 2: the Sun's tropical longitude wraps through 0 deg (Aries
    // ingress) exactly once during 18-22 March 2026 (March equinox week).
    char serr[256] = {0};
    int crossings = 0;
    double prev = -1.0;
    for (int d = 18; d <= 22; ++d) {
        const double jd = swe_julday(2026, 3, d, 0.0, SE_GREG_CAL);
        double xx[6] = {0};
        const int rc = swe_calc_ut(jd, SE_SUN, SEFLG_MOSEPH, xx, serr);
        STAR_CHECK(rc >= 0, "sun rc %d", rc);
        if (prev >= 0.0 && prev > 350.0 && xx[0] < 10.0) ++crossings;
        prev = xx[0];
    }
    STAR_CHECK(crossings == 1, "equinox crossings %d", crossings);

    // Anchor 3: Lahiri ayanamsa grows at precession order (~50.3"/yr);
    // century-average rate over 1900-2100 must sit in a wide 45-55 band.
    swe_set_sid_mode(SE_SIDM_LAHIRI, 0, 0);
    const double a1900 = swe_get_ayanamsa_ut(swe_julday(1900, 1, 1, 12.0, SE_GREG_CAL));
    const double a2100 = swe_get_ayanamsa_ut(swe_julday(2100, 1, 1, 12.0, SE_GREG_CAL));
    const double rate = (a2100 - a1900) * 3600.0 / 200.0;
    STAR_CHECK(rate > 45.0 && rate < 55.0, "ayan rate %.3f\"/yr", rate);
    swe_close();
    if (::startest::g_fail == 0) std::printf("SWISS_ANCHORS_ALL_GREEN\n");
    return ::startest::exitCode();
}

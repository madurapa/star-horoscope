// Phase 3 validation: all screen05 Nirayana longitudes (D:M:S).
// Build: g++ -std=c++2a -Wall -Wextra -I../src test_ephemeris.cpp -o test_ephemeris
#include <cmath>
#include <cstdio>

#include "../src/AstroTime.hpp"
#include "../src/Ayanamsa.hpp"
#include "../src/Ephemeris.hpp"
#include "../src/Lagna.hpp"

static int g_fail = 0;
static void check(const char* name, double got, int d, int m, int s) {
    const double want = d + m / 60.0 + s / 3600.0;
    double err = std::fabs(got - want) * 3600.0;
    if (err > 2.0) {
        ++g_fail;
        std::printf("FAIL %-8s got %.7f want %d:%d:%d (err %.2f\")\n", name, got, d, m, s, err);
    } else {
        std::printf("ok   %-8s got %.7f want %d:%d:%d (err %.2f\")\n", name, got, d, m, s, err);
    }
}

int main() {
    using namespace star;
    const double jdn0 = meeusJdNoon(2000, 8, 17);
    const double birthDec = birthDecHoursR48(14, 5);
    const double jd = julianDateR48(jdn0, birthDec);
    const double T = (jd - 2415020.0) / 36525.0;
    // Engine anchor (Ayanamsa.hpp: 23:50:01.10 + 50.315"/yr), NOT the rounded
    // display 23:50:01.0 — the 0.10" gap hides inside the 2" tolerance but the
    // test must use the same constant as the engine it validates.
    const double ayan = AyanamsaExact(jd);

    const SunResult sun = sunResult(T);
    check("Ravi", sun.lon - ayan, 120, 55, 1);
    check("Chandra", moonSayana(T, sun.MplusC) - ayan, 325, 6, 45);
    const double Rsun = earthRadius(sun.ecc, sun.MplusC);
    const struct {
        const char* key;
        const char* name;
        int d, m, s;
    } ps[] = {{"Budha", "Budha", 115, 59, 17}, {"Sikuru", "Sikuru", 139, 14, 48},
              {"Kuja", "Kuja", 106, 40, 47},  {"Guru", "Guru", 44, 29, 23},
              {"Shani", "Shani", 36, 36, 38}, {"Urenus", "Urenus", 294, 58, 6},
              {"Neptun", "Neptun", 280, 43, 23}, {"Pluto", "Pluto", 225, 59, 55}};
    for (const auto& p : ps)
        // NOTE: planetSayana(..., nirayana=true) already returns Nirayana
        // longitudes (ayanamsa subtracted internally via AyanamsaExact):
        // no further subtraction here (a double-subtract drops every planet
        // by exactly one ayanamsa, 84861").
        check(p.name, planetSayana(kPlanetElements.at(p.key), T, jd, sun.lon, Rsun, true),
              p.d, p.m, p.s);
    const double rahu = meanNodeSayana(T) - ayan;
    check("Raahu", rahu, 89, 5, 27);
    double ketu = rahu + 180.0;
    if (ketu >= 360.0) ketu -= 360.0;
    check("Kethu", ketu, 269, 5, 27);
    const double lmst =
        localMeanSiderealHours(gmstMidnightSec(jdn0) / 3600.0, birthDec, 80.0 + 24.0 / 60.0);
    check("Lagna", lagnaSayana(lmst, 6.0 + 37.0 / 60.0) - ayan, 239, 7, 8);
    if (g_fail == 0) std::printf("EPHEMERIS_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

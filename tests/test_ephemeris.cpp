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
    const double jdn0 = meeusJdNoon(1981, 12, 8);
    const double birthDec = birthDecHoursR48(12, 55);
    const double jd = julianDateR48(jdn0, birthDec);
    const double T = (jd - 2415020.0) / 36525.0;
    // Engine anchor (Ayanamsa.hpp: 23:34:20.65 + 50.315"/yr), NOT the rounded
    // display 23:34:21.0 — the 0.35" gap hides inside the 2" tolerance but the
    // test must use the same constant as the engine it validates.
    const double ayan = AyanamsaExact(jd);

    const SunResult sun = sunResult(T);
    check("Ravi", sun.lon - ayan, 232, 33, 32);
    check("Chandra", moonSayana(T, sun.MplusC) - ayan, 9, 23, 49);
    const double Rsun = earthRadius(sun.ecc, sun.MplusC);
    const struct {
        const char* key;
        const char* name;
        int d, m, s;
    } ps[] = {{"Budha", "Budha", 231, 17, 0}, {"Sikuru", "Sikuru", 276, 2, 26},
              {"Kuja", "Kuja", 152, 42, 30},  {"Guru", "Guru", 188, 32, 33},
              {"Shani", "Shani", 176, 32, 50}, {"Urenus", "Urenus", 217, 45, 1},
              {"Neptun", "Neptun", 240, 40, 59}, {"Pluto", "Pluto", 182, 20, 11}};
    for (const auto& p : ps)
        // NOTE: planetSayana(..., nirayana=true) already returns Nirayana
        // longitudes (ayanamsa subtracted internally via AyanamsaExact):
        // no further subtraction here (a double-subtract drops every planet
        // by exactly one ayanamsa, 84861").
        check(p.name, planetSayana(kPlanetElements.at(p.key), T, jd, sun.lon, Rsun, true),
              p.d, p.m, p.s);
    const double rahu = meanNodeSayana(T) - ayan;
    check("Raahu", rahu, 90, 52, 13);
    double ketu = rahu + 180.0;
    if (ketu >= 360.0) ketu -= 360.0;
    check("Kethu", ketu, 270, 52, 13);
    const double lmst =
        localMeanSiderealHours(gmstMidnightSec(jdn0) / 3600.0, birthDec, 80.0 + 24.0 / 60.0);
    check("Lagna", lagnaSayana(lmst, 6.0 + 37.0 / 60.0) - ayan, 334, 50, 42);
    if (g_fail == 0) std::printf("EPHEMERIS_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

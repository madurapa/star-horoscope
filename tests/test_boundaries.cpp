// Boundary conditions + multi-scenario consistency.
//  - 0/360 wrap (norm360, GetRashiIndex edges, houseOf wrap).
//  - Midnight birth: JD fraction + negative-UT clock wrap.
//  - High latitude: HourAngle clamp + Lagna finite (no NaN).
//  - Sayana/Nirayana consistency (TRANSCRI2 scenario: same birth, S method
//    must equal Nirayana + ayanamsa planet by planet).
//  - displayHms 59.99-carry path (UT 07:25:00 needs Sf=59.99999 promotion).
// Build: g++ -std=c++2a -Wall -Wextra -O2 -Isrc tests/test_boundaries.cpp src/VargaEngine.cpp -o /tmp/test_boundaries
#include <cmath>
#include <cstdio>
#include <string>

#include "../src/AstroTime.hpp"
#include "../src/Bhava.hpp"
#include "../src/Engine.hpp"
#include "../src/ScreenRenderer.hpp"
#include "../src/SunriseSunset.hpp"
#include "../src/VargaEngine.hpp"

static int g_fail = 0;
#define CHECK(cond, ...) do { \
    if (!(cond)) { ++g_fail; std::printf("FAIL %d: ", __LINE__); std::printf(__VA_ARGS__); std::printf("\n"); } \
    else { std::printf("ok   "); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)

int main() {
    using namespace star;

    // ---- longitude wrap ----
    CHECK(VargaEngine::norm360(360.0) == 0.0, "norm360(360)");
    CHECK(std::fabs(VargaEngine::norm360(-0.1) - 359.9) < 1e-9, "norm360(-0.1)");
    CHECK(VargaEngine::GetRashiIndex(0.0) == 1, "rashi 0.0");
    CHECK(VargaEngine::GetRashiIndex(359.999) == 12, "rashi 359.999");
    CHECK(VargaEngine::GetRashiIndex(360.0) == 12, "rashi 360.0 (Meena jbe-360)");
    CHECK(VargaEngine::GetRashiIndex(-0.5) == 12, "rashi -0.5");
    CHECK(VargaEngine::GetHoraIndex(0.0) == 5, "hora edge 0 (Sinha)");
    // Meena is even: second half (15-30) -> Sinha.
    CHECK(VargaEngine::GetHoraIndex(359.999) == 5, "hora edge 360 (Sinha)");

    // ---- midnight birth (2000-01-01 00:00 Colombo) ----
    {
        HoroscopeOwner o{"Midnight", 2000, 1, 1, 0, 0};
        HoroscopeResult h = computeHoroscope(o, cityByIndex(1).coord, true);
        // UT = -5.5h -> JD 2451544.5 (midnight) - 0.229167.
        CHECK(std::fabs(h.jd - 2451544.270833) < 1e-4, "midnight jd %.6f", h.jd);
        const HMS ut = displayHms(18.5);  // wrapped clock must show 18:30:00
        CHECK(ut.h == 18 && ut.m == 30 && ut.s == 0, "midnight UT wrap");
        for (const auto& kv : h.output.longitudes) {
            const double v = kv.second.ecliptic.toDecimal();
            CHECK(v >= 0.0 && v < 360.0, "lon range %s", kv.first.c_str());
        }
    }

    // ---- 59.99-carry: UT 07:25:00 from 12:55-5:30 ----
    {
        const HMS ut = displayHms(12.0 + 55.0 / 60.0 - 5.5);
        CHECK(ut.h == 7 && ut.m == 25 && ut.s == 0, "UT carry 7:25:00");
    }

    // ---- high latitude robustness ----
    {
        const double H = HourAngle(89.0, -23.0);
        CHECK(std::isfinite(H) && H >= 0.0 && H <= 180.0, "hour angle polar %.3f", H);
        const double lg = lagnaSayana(10.0, 89.0);
        CHECK(std::isfinite(lg), "lagna polar finite");
        const double lg0 = lagnaSayana(10.0, 0.0);
        CHECK(std::isfinite(lg0), "lagna equator finite");
    }

    // ---- Sayana = Nirayana + ayanamsa (TRANSCRI2 scenario) ----
    {
        HoroscopeOwner o{"Test User", 1981, 12, 8, 12, 55};
        const GeoCoord geo = cityByIndex(7).coord;
        const HoroscopeResult n = computeHoroscope(o, geo, true);
        const HoroscopeResult s = computeHoroscope(o, geo, false);
        const char* keys[] = {"Ravi", "Budha", "Sikuru", "Kuja", "Guru",
                              "Shani", "Raahu", "Kethu", "Chandra", "Lagna"};
        for (const char* k : keys) {
            double nv = findLongitude(n.output, k)->ecliptic.toDecimal();
            double sv = findLongitude(s.output, k)->ecliptic.toDecimal();
            double d = sv - nv;
            if (d < 0.0) d += 360.0;
            CHECK(std::fabs(d - n.ayanamsaDeg) * 3600.0 < 2.0, "say-niray %s", k);
        }
    }

    // ---- Bhava wrap: lagna near 0 deg ----
    {
        CHECK(houseOf(5.0, 355.0) == 2, "bhava wrap");
        auto c = bhavaMadhyas(355.0);
        CHECK(std::fabs(c[0] - 355.0) < 1e-9 && std::fabs(c[1] - 25.0) < 1e-9,
              "cusp wrap");
    }

    if (g_fail == 0) std::printf("BOUNDARIES_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

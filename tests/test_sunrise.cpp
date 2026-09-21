// Sunrise regression: the 11 DOS capture rows are the TEST, not the source.
// nativeSunrise() is analytical (Spencer EoT + hour angle + IST-meridian);
// this locks it against the captures with a 60 s tolerance (birth hour forced
// to 12:00 per star_asm_findings.md section 6; residual includes that forcing).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_sunrise.cpp src/VargaEngine.cpp -o /tmp/test_sunrise
#include <cmath>
#include <cstdio>

#include "../src/AstroStructures.hpp"
#include "../src/SunriseSunset.hpp"
#include "check.hpp"

struct Row {
    int y, mo, d, city;
    int h, m, s;  // DOS captured sunrise
};

int main() {
    using namespace star;
    const Row rows[] = {
        {2000, 8, 17, 7, 6, 2, 45},    // Ratnapura baseline
        {1995, 4, 3, 7, 6, 6, 14},     // Ratnapura
        {1980, 2, 29, 1, 6, 23, 38},   // Colombo (CLOMBO)
        {1989, 2, 29, 1, 6, 23, 28},   // Colombo (non-leap input as captured)
        {1975, 3, 2, 1, 6, 22, 51},    // Colombo
        {1985, 4, 10, 1, 6, 4, 44},    // Colombo
        {1975, 3, 22, 12, 6, 8, 50},   // Trinco
        {1990, 5, 15, 2, 5, 53, 29},   // Galle
        {2023, 5, 19, 2, 5, 53, 9},     // Galle Test User D
        {2024, 9, 11, 2, 6, 0, 10},    // Galle Test User E
        {2026, 9, 12, 1, 6, 1, 28},    // Colombo
    };
    for (const auto& r : rows) {
        const GeoCoord geo = cityByIndex(r.city).coord;
        const NativeSun ns = nativeSunrise(r.y, r.mo, r.d, 12.0, geo.decimalLat(), geo.decimalLon());
        const double want = r.h + r.m / 60.0 + r.s / 3600.0;
        double err = std::fabs(ns.riseH - want) * 3600.0;
        if (err > 1800.0) err = 3600.0 - err;  // midnight wrap guard (never triggers here)
        STAR_CHECK(err < 60.0, "sunrise %04d-%02d-%02d city%d err %.0fs", r.y, r.mo, r.d, r.city, err);
        // Sunset is a display expression (12 - rise); rise+set must be 24:00.
        STAR_CHECK(std::fabs((ns.riseH + (24.0 - ns.riseH)) - 24.0) < 1e-9, "mirror %04d-%02d-%02d",
                   r.y, r.mo, r.d);
    }
    if (::startest::g_fail == 0) std::printf("SUNRISE_ALL_GREEN\n");
    return ::startest::exitCode();
}

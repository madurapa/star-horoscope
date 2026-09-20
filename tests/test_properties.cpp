// Property sweep: every varga index in range, no NaN/throw, over 0..360.
// Covers the out-of-range semantics where binary quirks bite.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_properties.cpp src/VargaEngine.cpp -o /tmp/test_properties
#include <cmath>
#include <cstdio>

#include "../src/AstroStructures.hpp"
#include "../src/Panchanga.hpp"
#include "../src/VargaEngine.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    for (int i = 0; i < 360000; ++i) {
        const double lon = i * 0.001;  // 0..359.999 in 0.001 deg steps
        const auto sv = VargaEngine::GetShadvarga(lon);
        for (size_t c = 0; c < sv.size(); ++c) {
            const int v = sv[c];
            if (v < 1 || v > 12) {
                ++::startest::g_fail;
                std::printf("FAIL lon %.3f col %zu seat %d\n", lon, c, v);
                goto done;
            }
        }
        if (!std::isfinite(lon)) {
            ++::startest::g_fail;
            std::printf("FAIL non-finite lon %.3f\n", lon);
            goto done;
        }
    }
done:
    STAR_CHECK(::startest::g_fail == 0, "varga sweep 0..359.999 x0.001 in 1..12");
    // Boundary: lon == 360.0 exactly → Rashi 12 (Meena jbe-360 rule); other
    // seats may return the documented -1 out-of-range sentinel (renders "**").
    {
        const auto sv = VargaEngine::GetShadvarga(360.0);
        STAR_CHECK(sv[0] == 12, "rashi 360 -> 12");
        for (size_t c = 1; c < sv.size(); ++c)
            STAR_CHECK(sv[c] == -1 || (sv[c] >= 1 && sv[c] <= 12),
                       "seat360 col %zu = %d", c, sv[c]);
    }
    // Karana/yoga/tithi index ranges over full elongation + sun/moon sums.
    for (int e = 0; e < 360; ++e) {
        const char* k = karanaName((double)e, 2);
        if (!k || !*k) STAR_CHECK(false, "karana empty elong %d", e);
        const int t = tithiNumber((double)e);
        if (t < 1 || t > 30) STAR_CHECK(false, "tithi range elong %d -> %d", e, t);
    }
    for (int s = 0; s < 360; s += 7) {
        const int y = yogaIndex((double)s, (double)(s * 2 % 360));
        if (y < 0 || y > 26) STAR_CHECK(false, "yoga range s=%d -> %d", s, y);
    }
    // DMS round-trip: fromDecimal(toDecimal(dms)) preserves printed cell.
    {
        const AngularDegrees dms{232, 33, 32};
        const AngularDegrees rt = AngularDegrees::fromDecimal(dms.toDecimal());
        STAR_CHECK(rt.deg == 232 && rt.min == 33, "dms round-trip 232:33:32");
    }
    if (::startest::g_fail == 0) std::printf("PROPERTIES_ALL_GREEN\n");
    return ::startest::exitCode();
}

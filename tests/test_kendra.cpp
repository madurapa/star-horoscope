// Bhava verification (docs/remove_legacy.md R3).
// The legacy kendra art-line gate against screens/screen08..11.txt left
// with the golden files (kendra geometry is covered by the
// test_modern_display chart tests). What remains pins Bhava math only:
//  - Bhava houseOf() checked against the baseline house column (12/12).
//  - Cusp/sandhi geometry: 30 deg spacing, sandhi midway, wrap-around.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_kendra.cpp src/VargaEngine.cpp -o /tmp/test_kendra
#include <array>
#include <cmath>
#include <cstdio>

#include "../src/Bhava.hpp"

static int g_fail = 0;
#define CHECK(cond, ...) do { \
    if (!(cond)) { ++g_fail; std::printf("FAIL %d: ", __LINE__); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)

int main() {
    using namespace star;

    // ---- Bhava: house column from Lagna Wrschika (baseline 239:7:8) ----
    const double lagna = 239.0 + 7.0 / 60.0 + 8.0 / 3600.0;
    const struct {
        const char* name;
        double lon;
        int house;
    } bh[] = {
        {"Chandra", 325 + 6.0 / 60 + 45.0 / 3600, 4},
        {"Ravi", 120 + 55.0 / 60 + 1.0 / 3600, 10},
        {"Budha", 115 + 59.0 / 60 + 17.0 / 3600, 9},
        {"Sikuru", 139 + 14.0 / 60 + 48.0 / 3600, 10},
        {"Guru", 44 + 29.0 / 60 + 23.0 / 3600, 7},
        {"Kuja", 106 + 40.0 / 60 + 47.0 / 3600, 9},
        {"Shani", 36 + 36.0 / 60 + 38.0 / 3600, 7},
        {"Raahu", 89 + 5.0 / 60 + 27.0 / 3600, 8},
        {"Kethu", 269 + 5.0 / 60 + 27.0 / 3600, 2},
        {"Urenus", 294 + 58.0 / 60 + 6.0 / 3600, 3},
        {"Neptun", 280 + 43.0 / 60 + 23.0 / 3600, 3},
        {"Pluto", 225 + 59.0 / 60 + 55.0 / 3600, 1},
    };
    for (const auto& b : bh)
        CHECK(houseOf(b.lon, lagna) == b.house, "house %s = %d", b.name,
              houseOf(b.lon, lagna));
    const std::array<double, 12> cusps = bhavaMadhyas(lagna);
    CHECK(std::fabs(cusps[0] - lagna) < 1e-9, "cusp1 == lagna");
    for (int i = 1; i < 12; ++i) {
        double d = cusps[static_cast<size_t>(i)] - cusps[static_cast<size_t>(i - 1)];
        if (d < 0.0) d += 360.0;
        CHECK(std::fabs(d - 30.0) < 1e-9, "cusp spacing %d", i);
    }
    const std::array<double, 12> sandhis = bhavaSandhis(lagna);
    for (int i = 0; i < 12; ++i) {
        double want = cusps[static_cast<size_t>(i)] - 15.0;
        if (want < 0.0) want += 360.0;
        CHECK(std::fabs(sandhis[static_cast<size_t>(i)] - want) < 1e-9, "sandhi %d", i);
    }
    // Wrap: longitude 359.99 -> house 5 rasi; 0.0 -> Mesha house 6 from Wrschika.
    CHECK(houseOf(359.99, lagna) == 5, "wrap 359.99");
    CHECK(houseOf(0.0, lagna) == 6, "wrap 0.0");

    if (g_fail == 0) std::printf("KENDRA_BHAVA_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

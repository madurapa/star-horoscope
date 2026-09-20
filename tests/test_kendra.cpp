// Kendra (screens 08-11) + Bhava verification.
//  - All 8 kendra charts rebuilt from the screen06 seat table and diffed
//    line-exact against screens/screen08.txt..screen11.txt art lines.
//  - Bhava houseOf() checked against the screen07 RASHI house column (12/12).
//  - Cusp/sandhi geometry: 30 deg spacing, sandhi midway, wrap-around.
// Build: g++ -std=c++2a -Wall -Wextra -O2 -Isrc tests/test_kendra.cpp src/VargaEngine.cpp -o /tmp/test_kendra
// Usage: /tmp/test_kendra [screens-dir]
#include <cmath>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/Bhava.hpp"
#include "../src/ScreenRenderer.hpp"
#include "../src/VargaEngine.hpp"

static int g_fail = 0;
#define CHECK(cond, ...) do { \
    if (!(cond)) { ++g_fail; std::printf("FAIL %d: ", __LINE__); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)

static int RASI(const std::string& s) {
    using star::Rasi;
    if (s == "Mesha") return (int)Rasi::Mesha;
    if (s == "Wrushaba") return (int)Rasi::Wrushaba;
    if (s == "Mituna") return (int)Rasi::Mituna;
    if (s == "Kataka") return (int)Rasi::Kataka;
    if (s == "Sinha") return (int)Rasi::Sinha;
    if (s == "Kanya") return (int)Rasi::Kanya;
    if (s == "Thula") return (int)Rasi::Thula;
    if (s == "Wrschika") return (int)Rasi::Wrschika;
    if (s == "Dhanu") return (int)Rasi::Dhanu;
    if (s == "Makara") return (int)Rasi::Makara;
    if (s == "Kumba") return (int)Rasi::Kumba;
    return (int)Rasi::Meena;
}

int main(int argc, char* argv[]) {
    using namespace star;
    const std::string screens = argc > 1 ? argv[1] : "tests/screens";

    // Screen06 seat table: {RASHI, NAVAMSAKA, HORA, DESHKANA, DVADASANSA, TRISHANSA}.
    struct Row {
        const char* planet;
        const char* glyph;
        const char* v[6];
    };
    const Row rows[10] = {
        {"Lagna", "", {"Meena", "Sinha", "Kataka", "Meena", "Mesha", "Kanya"}},
        {"Chandra", "Ch", {"Mesha", "Mituna", "Sinha", "Mesha", "Kataka", "Dhanu"}},
        {"Ravi", "Rv", {"Wrschika", "Makara", "Sinha", "Kataka", "Sinha", "Makara"}},
        {"Budha", "Bu", {"Wrschika", "Makara", "Sinha", "Kataka", "Kataka", "Makara"}},
        {"Sikuru", "Si", {"Makara", "Kumba", "Kataka", "Makara", "Meena", "Kanya"}},
        {"Kuja", "Ku", {"Kanya", "Makara", "Kataka", "Kanya", "Thula", "Wrushaba"}},
        {"Guru", "Gu", {"Thula", "Dhanu", "Sinha", "Thula", "Makara", "Kumba"}},
        {"Shani", "Sh", {"Kanya", "Sinha", "Sinha", "Wrushaba", "Kataka", "Wrushaba"}},
        {"Raahu", "Ra", {"Kataka", "Kataka", "Kataka", "Kataka", "Kataka", "Wrushaba"}},
        {"Kethu", "Ke", {"Makara", "Makara", "Kataka", "Makara", "Makara", "Wrushaba"}},
    };
    // (screen file, left varga col, left lagna, left label, right varga col, ...)
    struct Pair {
        const char* file;
        int vl;
        const char* ll;
        const char* lt;
        int vr;
        const char* lr;
        const char* rt;
    };
    const Pair pairs[4] = {
        {"screen08.txt", 0, "Meena", "LAGNA", 1, "Sinha", "NAVAMSAKA"},
        {"screen09.txt", 2, "Kataka", "HORA", 3, "Meena", "DESHKANA"},
        {"screen10.txt", 4, "Mesha", "DVADASANSA", 5, "Kanya", "TRISANSAKA"},
        {"screen11.txt", 0, "Wrschika", "SOORYARASI", 0, "Mesha", "SANDURASI"},
    };
    // Title lines per screen (binary's own spacing; compared loosely).
    for (const auto& pr : pairs) {
        auto build = [&](int vc, const char* lagna, const char* label) {
            std::vector<std::pair<std::string, int>> ps;
            for (int i = 1; i < 10; ++i)
                ps.push_back({rows[i].glyph, RASI(rows[i].v[vc])});
            return makeKendra(RASI(lagna), lagna, label, ps);
        };
        KendraChart L = build(pr.vl, pr.ll, pr.lt);
        KendraChart R = build(pr.vr, pr.lr, pr.rt);
        // Titles used only for the label row; art compared line-exact.
        std::string got = renderKendraPair(L, "X", R, "Y");
        std::ifstream f(screens + "/" + pr.file);
        CHECK(static_cast<bool>(f), "open %s", pr.file);
        if (!f) continue;
        std::vector<std::string> expLines;
        std::string ln;
        while (std::getline(f, ln)) expLines.push_back(ln);
        std::istringstream gotSs(got);
        std::vector<std::string> gotLines;
        while (std::getline(gotSs, ln)) gotLines.push_back(ln);
        CHECK(gotLines.size() >= 21 && expLines.size() >= 21, "%s line count", pr.file);
        for (int i = 0; i < 21; ++i) {
            if (gotLines[static_cast<size_t>(i)] != expLines[static_cast<size_t>(i)]) {
                ++g_fail;
                std::printf("FAIL %s art line %d:\n  got '%s'\n  exp '%s'\n", pr.file, i,
                            gotLines[static_cast<size_t>(i)].c_str(),
                            expLines[static_cast<size_t>(i)].c_str());
            }
        }
        if (g_fail == 0) std::printf("ok   %s art 21/21 lines\n", pr.file);
    }

    // ---- Bhava: screen07 RASHI house column from Lagna Meena ----
    const double lagna = 334.0 + 50.0 / 60.0 + 42.0 / 3600.0;
    const struct {
        const char* name;
        double lon;
        int house;
    } bh[] = {
        {"Chandra", 9 + 23.0 / 60 + 49.0 / 3600, 2},
        {"Ravi", 232 + 33.0 / 60 + 32.0 / 3600, 9},
        {"Budha", 231 + 17.0 / 60, 9},
        {"Sikuru", 276 + 2.0 / 60 + 26.0 / 3600, 11},
        {"Guru", 188 + 32.0 / 60 + 33.0 / 3600, 8},
        {"Kuja", 152 + 42.0 / 60 + 30.0 / 3600, 7},
        {"Shani", 176 + 32.0 / 60 + 50.0 / 3600, 7},
        {"Raahu", 90 + 52.0 / 60 + 13.0 / 3600, 5},
        {"Kethu", 270 + 52.0 / 60 + 13.0 / 3600, 11},
        {"Urenus", 217 + 45.0 / 60 + 1.0 / 3600, 9},
        {"Neptun", 240 + 40.0 / 60 + 59.0 / 3600, 10},
        {"Pluto", 182 + 20.0 / 60 + 11.0 / 3600, 8},
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
    // Wrap: longitude 359.99 -> house 12 rasi; 0.0 -> Mesha house from Meena.
    CHECK(houseOf(359.99, lagna) == 1, "wrap 359.99");
    CHECK(houseOf(0.0, lagna) == 2, "wrap 0.0");

    if (g_fail == 0) std::printf("KENDRA_BHAVA_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

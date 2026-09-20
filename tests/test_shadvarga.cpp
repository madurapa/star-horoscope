// Shadvarga cross-matrix relation test (screens 06 + 07).
// Proves: screen07 numbers = house counts from Lagna's varga seat,
//   house = ((planetVarga - lagnaVarga + 12) % 12) + 1,
// using the Rasi enum Mesha=1..Meena=12 from AstroStructures.hpp.
// (The longitude->varga computation itself is Phase 3; this locks the
// enum and the presentation rule with zero variance over all 72 cells.)
// Build: g++ -std=c++2a -Wall -Wextra -I../src test_shadvarga.cpp -o test_shadvarga
#include <cstdio>
#include <string>

#include "../src/AstroStructures.hpp"
#include "../src/VargaEngine.hpp"

static int g_fail = 0;

int rasiIdx(const std::string& s) {
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
    if (s == "Meena") return (int)Rasi::Meena;
    return -1;
}

struct Row {
    const char* name;
    const char* v[6];  // screen06 RASHI..TRISHANSAKA
    int n[6];          // screen07 numbers (0 = absent, e.g. Lagna)
};

int main() {
    const Row rows[13] = {
        {"Lagna", {"Meena","Sinha","Kataka","Meena","Mesha","Kanya"}, {0,0,0,0,0,0}},
        {"Chandra", {"Mesha","Mituna","Sinha","Mesha","Kataka","Dhanu"}, {2,11,2,2,4,4}},
        {"Ravi", {"Wrschika","Makara","Sinha","Kataka","Sinha","Makara"}, {9,6,2,5,5,5}},
        {"Budha", {"Wrschika","Makara","Sinha","Kataka","Kataka","Makara"}, {9,6,2,5,4,5}},
        {"Sikuru", {"Makara","Kumba","Kataka","Makara","Meena","Kanya"}, {11,7,1,11,12,1}},
        {"Guru", {"Thula","Dhanu","Sinha","Thula","Makara","Kumba"}, {8,5,2,8,10,6}},
        {"Kuja", {"Kanya","Makara","Kataka","Kanya","Thula","Wrushaba"}, {7,6,1,7,7,9}},
        {"Shani", {"Kanya","Sinha","Sinha","Wrushaba","Kataka","Wrushaba"}, {7,1,2,3,4,9}},
        {"Raahu", {"Kataka","Kataka","Kataka","Kataka","Kataka","Wrushaba"}, {5,12,1,5,4,9}},
        {"Kethu", {"Makara","Makara","Kataka","Makara","Makara","Wrushaba"}, {11,6,1,11,10,9}},
        {"Urenus", {"Wrschika","Kanya","Kataka","Wrschika","Kumba","Kanya"}, {9,2,1,9,11,1}},
        {"Neptune", {"Dhanu","Mesha","Sinha","Dhanu","Dhanu","Mesha"}, {10,9,2,10,9,8}},
        {"Pluuto", {"Thula","Thula","Sinha","Thula","Thula","Mesha"}, {8,3,2,8,7,8}},
    };
    // Lagna reference seats (screen06 row 1).
    int lag[6];
    for (int c = 0; c < 6; ++c) {
        lag[c] = rasiIdx(rows[0].v[c]);
        if (lag[c] < 0) { ++g_fail; std::printf("FAIL bad lagna col %d\n", c); }
    }
    for (int r = 1; r < 13; ++r) {
        for (int c = 0; c < 6; ++c) {
            const int p = rasiIdx(rows[r].v[c]);
            if (p < 0) { ++g_fail; std::printf("FAIL bad name %s/%d\n", rows[r].name, c); continue; }
            const int house = ((p - lag[c] + 12) % 12) + 1;
            if (house != rows[r].n[c]) {
                ++g_fail;
                std::printf("FAIL %s col%d: %s(%d) vs lagna %d -> house %d, screen07=%d\n",
                            rows[r].name, c, rows[r].v[c], p, lag[c], house, rows[r].n[c]);
            }
        }
    }
    // Production-code gate: baseline screen05 longitudes through the real
    // VargaEngine must reproduce the screen06 RASHI seats (was: test-only
    // formula, green even if GetShadvarga returned garbage).
    {
        struct Lon { const char* name; int d, m, s; };
        const Lon lons[] = {
            {"Lagna", 334, 50, 42}, {"Chandra", 9, 23, 49}, {"Ravi", 232, 33, 32},
            {"Budha", 231, 17, 0}, {"Sikuru", 276, 2, 26}, {"Kuja", 152, 42, 30},
            {"Guru", 188, 32, 33}, {"Shani", 176, 32, 50}, {"Raahu", 90, 52, 13},
            {"Kethu", 270, 52, 13},
        };
        for (const auto& L : lons) {
            const char* want = nullptr;
            for (const auto& R : rows)
                if (std::string(R.name) == L.name) { want = R.v[0]; break; }
            if (!want) continue;  // Urenus/Neptune/Pluto screen05 keys differ; verifier covers them
            const double dec = L.d + L.m / 60.0 + L.s / 3600.0;
            const int got = star::VargaEngine::GetShadvarga(dec)[0];
            const int exp = rasiIdx(want);
            if (got != exp) {
                ++g_fail;
                std::printf("FAIL engine rashi %s: got %d want %s(%d)\n", L.name, got, want, exp);
            }
        }
    }
    if (g_fail == 0) std::printf("SHADVARGHA_RELATION_GREEN (72/72 cells)\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

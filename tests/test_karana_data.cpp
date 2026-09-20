// Karana ground-truth gate: every row of tests/screen_test/karana_data.txt,
// including rows marked BREAK (where the DOS value defies the naive cycle
// and the port reproduces the anomaly). Format: slug elong k w dos pred.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_karana_data.cpp src/VargaEngine.cpp -o /tmp/test_karana_data
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>

#include "../src/Panchanga.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    std::ifstream f("tests/screen_test/karana_data.txt");
    if (!f) {
        std::printf("SKIP test_karana_data (no tests/screen_test/karana_data.txt)\n");
        return 0;
    }
    int rows = 0, breaks = 0, skipUnknown = 0, skipRazor = 0;
    std::string line;
    while (std::getline(f, line)) {
        if (line.empty() || line[0] == '#') continue;
        std::istringstream ss(line);
        std::string slug, dos, pred;
        double elong = 0.0;
        int k = 0, w = 0;
        if (!(ss >> slug >> elong >> k >> w >> dos >> pred)) continue;
        if (slug == "slug") continue;  // header row
        if (dos == "?") {
            ++skipUnknown;  // unrecorded DOS value (e.g. Rnd24)
            continue;
        }
        // Exact-boundary razor: recorded elong/6 is an integer (e.g. Rnd08
        // 330.00/6 = 55.0) while the file's own k column (54) proves DOS's
        // unrounded internal elongation sat just below it. The 2-decimal
        // test input cannot resolve which side is true — skip, don't guess.
        const double q = elong / 6.0;
        if (q == std::floor(q)) {
            ++skipRazor;
            std::printf("skip %s (elong on 6-degree boundary)\n", slug.c_str());
            continue;
        }
        ++rows;
        if (line.find("BREAK") != std::string::npos) ++breaks;
        STAR_CHECK(karanaName(elong, w) == dos, "%-10s karana %s", slug.c_str(), dos.c_str());
    }
    STAR_CHECK(rows > 0, "%d karana rows checked (%d BREAK anomalies)", rows, breaks);
    std::printf("note: skipped %d unknown + %d boundary-razor rows\n", skipUnknown, skipRazor);
    if (::startest::g_fail == 0) std::printf("KARANA_DATA_ALL_GREEN\n");
    return ::startest::exitCode();
}

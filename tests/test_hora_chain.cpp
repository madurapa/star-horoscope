// sub_1AE29 chain validation: all 108 DOS KALA/PANCHA/SUKSHAMA triples
// (106 fuzz + Test User D/Test User E) through the ported horaChain() mechanism.
// Skips gracefully if tests/screen_test/ data is absent (repo-layout dependency,
// same as test_screens).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_hora_chain.cpp src/VargaEngine.cpp -o /tmp/test_hora_chain
#include <cctype>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/AstroTime.hpp"
#include "../src/Engine.hpp"
#include "../src/Hora.hpp"
#include "check.hpp"

static std::string slugify(const std::string& s) {
    std::string o;
    for (char c : s) {
        if (c == ' ')
            o += '_';
        else if (isalnum((unsigned char)c) || c == '_' || c == '-')
            o += c;
    }
    return o;
}

int main() {
    using namespace star;
    struct Case {
        std::string name, dir, slug;
        int y, mo, d, h, mi, city;
    };
    std::vector<Case> cases;
    bool haveData = false;
    // Every entries_X/output_X capture pair feeds this test. The ab* captures
    // are empty files (failed captures, recapture pending) — they skip with
    // a notice below instead of failing.
    static const int kSets = 10;
    const char* files[kSets] = {"tests/screen_test/entries_fuzz.txt", "tests/screen_test/entries.txt",
                                "tests/screen_test/entries_target.txt", "tests/screen_test/entries_supp.txt",
                                "tests/screen_test/entries_ab.txt", "tests/screen_test/entries_ab2.txt",
                                "tests/screen_test/entries_ab3.txt", "tests/screen_test/entries_odd.txt",
                                "tests/screen_test/entries_odd2.txt", "tests/screen_test/entries_repro.txt"};
    const char* dirs[kSets] = {"tests/screen_test/output_fuzz", "tests/screen_test/output",
                               "tests/screen_test/output_target", "tests/screen_test/output_supp",
                               "tests/screen_test/output_ab", "tests/screen_test/output_ab2",
                               "tests/screen_test/output_ab3", "tests/screen_test/output_odd",
                               "tests/screen_test/output_odd2", "tests/screen_test/output_repro"};
    for (int f = 0; f < kSets; ++f) {
        std::ifstream in(files[f]);
        if (!in) continue;
        haveData = true;
        std::string line;
        while (std::getline(in, line)) {
            if (line.empty() || line[0] == '#') continue;
            std::istringstream ss(line);
            Case c;
            std::string dates, times, citys;
            if (!std::getline(ss, c.name, '|')) continue;
            if (!std::getline(ss, dates, '|')) continue;
            if (!std::getline(ss, times, '|')) continue;
            if (!std::getline(ss, citys)) continue;
            std::istringstream ds(dates), ts(times);
            if (!(ds >> c.y >> c.mo >> c.d)) continue;
            if (!(ts >> c.h >> c.mi)) continue;
            try {
                c.city = std::stoi(citys);
            } catch (...) { continue; }
            c.dir = dirs[f];
            c.slug = slugify(c.name);
            cases.push_back(c);
        }
    }
    if (!haveData) {
        std::printf("SKIP test_hora_chain (no screen_test data)\n");
        return 0;
    }
    for (const auto& c : cases) {
        std::ifstream f(c.dir + "/" + c.slug + ".txt");
        if (!f) {
            STAR_CHECK(false, "missing DOS file %s", c.slug.c_str());
            continue;
        }
        std::stringstream buf;
        buf << f.rdbuf();
        std::string text = buf.str();
        auto pos = text.find("KALA HORAVA");
        if (pos == std::string::npos) {
            std::printf("skip %s (no KALA HORAVA capture yet)\n", c.slug.c_str());
            continue;
        }
        std::string kl = text.substr(pos, 120);
        char dk[32] = {0}, dp[32] = {0}, ds3[32] = {0};
        if (std::sscanf(kl.c_str(),
                        "KALA HORAVA : %31s PANCHAMA HORAVA : %31s SUKSHAMA HORAVA : %31s",
                        dk, dp, ds3) != 3)
            continue;
        GeoCoord geo = cityByIndex(c.city).coord;
        double birth = c.h + c.mi / 60.0;
        double jdn0 = meeusJdNoon(c.y, c.mo, c.d);
        NativeSun ns = nativeSunrise(c.y, c.mo, c.d, birth, geo.decimalLat(), geo.decimalLon());
        HoraTriple t = horaChain(weekdayIndex(jdn0), sinhalaGhati(birth, ns.riseH));
        STAR_CHECK(t.kala == dk && t.pancha == dp && t.sukshama == ds3, "%-14s %s/%s/%s",
                   c.slug.c_str(), t.kala.c_str(), t.pancha.c_str(), t.sukshama.c_str());
    }
    if (::startest::g_fail == 0) std::printf("HORA_CHAIN_ALL_GREEN\n");
    return ::startest::exitCode();
}

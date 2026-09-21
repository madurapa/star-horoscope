// L3 frozen Swiss goldens (Phase-2 step 6): modern-display output for
// three Swiss-engine profiles, byte-compared against
// tests/swiss_goldens/*.txt. Widths are explicit (no env dependence);
// banner/footer excluded (they carry date/version).
// Re-baselining: run with `--record <repo-root>` deliberately, review
// the diff, record the justification in docs/status_and_plans.md.
// NEVER --record to match new code.
// Build: part of ctest via add_star_test (links swisseph).
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>

#include "../src/Engine.hpp"
#include "../src/Hora.hpp"
#include "../src/ModernRenderer.hpp"
#include "../src/Vimshottari.hpp"
#include "check.hpp"

namespace {

struct Profile {
    const char* slug;
    const char* name;
    int y, mo, d, h, mi;
    int city;
    const char* cityName;
};

const Profile kProfiles[3] = {
    {"baseline", "Test User", 2000, 8, 17, 14, 5, 7, "Ratnapura"},
    {"user_d", "Test User D", 2023, 5, 19, 16, 20, 2, "Galle"},
    {"user_e", "Test User E", 2024, 9, 11, 9, 5, 2, "Galle"},
};

std::string buildGolden(const Profile& p) {
    using namespace star;
    const HoroscopeOwner o{p.name, p.y, p.mo, p.d, p.h, p.mi};
    const GeoCoord geo = cityByIndex(p.city).coord;
    const HoroscopeResult h = computeHoroscope(o, geo, true, EngineKind::Swiss);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    const YMD birth{p.y, p.mo, p.d};
    const HoraTriple ht =
        horaChain(weekdayIndex(h.jdn0), sinhalaGhati(h.birthDecHours, h.riseH));
    const int W = 80;
    std::string out;
    out += "=== houses ===\n" + modern::renderHouseTable(h.output, W, false);
    out += "=== shadvarga-names ===\n" + modern::renderShadvargaNames(h.output, W, false);
    out += "=== shadvarga-houses ===\n" +
           modern::renderShadvargaHouses(h.output, W, false);
    out += "=== profile ===\n" +
           modern::renderKeyValues(
               modern::birthProfileRows(o, p.cityName, h.panchanga.weekday), W, false);
    out += "=== astro ===\n" +
           modern::renderKeyValues(modern::astroRows(h.output), W, false);
    out += "=== times ===\n" +
           modern::renderKeyValues(
               modern::timeRows(h.birthDecHours, h.lmstHours, geo, h.riseH, h.setH), W,
               false);
    out += "=== panchanga ===\n" +
           modern::renderKeyValues(modern::panchangaRows(h.panchanga), W, false);
    out += "=== dasa-info ===\n" +
           modern::renderKeyValues(modern::dasaInfoRows(bal), W, false);
    out += "=== dasa ===\n" +
           modern::renderDasa(birth, fracYear(p.y, p.mo, p.d), bal,
                              h.moonNirayanaDeg, W, false);
    out += "=== hora ===\n" +
           modern::renderKeyValues(modern::horaRows(ht.kala, ht.pancha, ht.sukshama),
                                   W, false);
    out += "=== chakra ===\n" +
           modern::renderKeyValues(modern::chakraRows(h.panchanga.nakIndex), W, false);
    return out;
}

std::string readFile(const std::string& path) {
    std::ifstream f(path, std::ios::binary);
    std::ostringstream ss;
    ss << f.rdbuf();
    return ss.str();
}

}  // namespace

int main(int argc, char* argv[]) {
    const std::string root = (argc > 2) ? argv[2] : "tests/swiss_goldens";
    const bool record = (argc > 1 && std::string(argv[1]) == "--record");
    for (const Profile& p : kProfiles) {
        const std::string path = root + "/" + p.slug + ".txt";
        const std::string got = buildGolden(p);
        if (record) {
            std::ofstream f(path, std::ios::binary | std::ios::trunc);
            f << got;
            std::printf("recorded %s (%zu bytes)\n", path.c_str(), got.size());
            continue;
        }
        const std::string exp = readFile(path);
        STAR_CHECK(got == exp, "swiss golden %s (%zu bytes)", p.slug, got.size());
    }
    if (!record && ::startest::g_fail == 0) std::printf("SWISS_GOLDENS_ALL_GREEN\n");
    return ::startest::exitCode();
}

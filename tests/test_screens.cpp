// Exact-render gate: our screen05/screen06 text must match STAR.EXE byte for
// byte (modulo trailing whitespace). This is what makes "spelling
// corrections" (Rav1->Ravi, Wrschika->Wrushchika, Upeveshana->..., ...) fail
// loudly: the binary's literal spellings and column grid are ground truth.
// See docs/spellings_and_glossary.md for the full do-not-correct catalog.
// Build: g++ -std=c++2a -Wall -Wextra -O2 -Isrc tests/test_screens.cpp src/VargaEngine.cpp -o /tmp/test_screens
// Usage: /tmp/test_screens [screens-dir]
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/Engine.hpp"
#include "../src/Hora.hpp"
#include "../src/Panchanga.hpp"
#include "../src/ScreenRenderer.hpp"
#include "../src/SunriseSunset.hpp"
#include "../src/Vimshottari.hpp"

static int g_fail = 0;

static std::vector<std::string> readLines(const std::string& path) {
    std::vector<std::string> out;
    std::ifstream f(path);
    std::string ln;
    while (std::getline(f, ln)) {
        while (!ln.empty() && (ln.back() == ' ' || ln.back() == '\t' || ln.back() == '\r'))
            ln.pop_back();
        out.push_back(ln);
    }
    while (!out.empty() && out.back().empty()) out.pop_back();
    return out;
}

static std::vector<std::string> splitLines(const std::string& s) {
    std::vector<std::string> out;
    std::istringstream ss(s);
    std::string ln;
    while (std::getline(ss, ln)) {
        while (!ln.empty() && (ln.back() == ' ' || ln.back() == '\t' || ln.back() == '\r'))
            ln.pop_back();
        out.push_back(ln);
    }
    while (!out.empty() && out.back().empty()) out.pop_back();
    return out;
}

static void checkScreen(const std::string& tag, const std::vector<std::string>& got,
                        const std::vector<std::string>& exp) {
    if (got.size() != exp.size()) {
        ++g_fail;
        std::printf("FAIL %s line count %u vs %u\n", tag.c_str(), (unsigned)got.size(),
                    (unsigned)exp.size());
        return;
    }
    for (size_t i = 0; i < got.size(); ++i) {
        if (got[i] != exp[i]) {
            ++g_fail;
            std::printf("FAIL %s line %u:\n  got '%s'\n  exp '%s'\n", tag.c_str(),
                        (unsigned)i, got[i].c_str(), exp[i].c_str());
        }
    }
    std::printf("ok   %s (%u/%u lines)\n", tag.c_str(), (unsigned)got.size(),
                (unsigned)exp.size());
}

int main(int argc, char* argv[]) {
    using namespace star;
    const std::string screens = argc > 1 ? argv[1] : "tests/screens";

    // Baseline scenario (AGENTS.md): Test User, 1981-12-08 12:55,
    // Ratnapura (7), Nirayana.
    const HoroscopeOwner owner{"Test User", 1981, 12, 8, 12, 55};
    const HoroscopeResult h = computeHoroscope(owner, cityByIndex(7).coord, true);

    checkScreen("screen05", splitLines(renderScreen07(h.output, true)),
                readLines(screens + "/screen05.txt"));
    checkScreen("screen06", splitLines(renderScreen08(h.output)),
                readLines(screens + "/screen06.txt"));

    // Screen12 needs dasa inputs (sunrise lives in HoroscopeResult now).
    {
        const YMD birth{owner.birth_year, owner.birth_month, owner.birth_day};
        (void)birth;
        const double birthFrac = fracYear(owner.birth_year, owner.birth_month, owner.birth_day);
        (void)birthFrac;
        const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
        const GeoCoord geo = cityByIndex(7).coord;
        const double riseH = h.riseH;
        const double setH = h.setH;
        checkScreen("screen12",
                    splitLines(renderScreen12(owner, geo, h.output, h.birthDecHours,
                                              h.lmstHours, h.panchanga, bal, riseH, setH)),
                    readLines(screens + "/screen12.txt"));

        // Screen13 via the sub_1AE29 chain (weekday from jdn0 + wrapped ghati).
        const HoraTriple ht =
            horaChain(weekdayIndex(h.jdn0), sinhalaGhati(h.birthDecHours, riseH));
        checkScreen("screen13",
                    splitLines(renderScreen13(h.panchanga.nakIndex, ht.kala, ht.pancha,
                                              ht.sukshama)),
                    readLines(screens + "/screen13.txt"));
    }

    if (g_fail == 0) std::printf("SCREENS_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

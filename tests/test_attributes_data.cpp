// Attributes ground-truth gate: every row of tests/screen_test/attributes_data.txt.
// Row format (whitespace-split, marker-anchored):
//   nak_idx nak_name pada weekday mode GANA YONI : ... RUXHA : ... || LINGA
//   NAADI: ... PAXHI : ...
// Known DOS nondeterminism is skipped cell-wise with a printed notice, never
// asserted: Keti (idx 2) Gana flips, Siyavsa (23)/Puvaputupa (24) Linga flips
// (see docs/fuzzing.md + test_attributes.cpp). Everything else must match.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_attributes_data.cpp src/VargaEngine.cpp -o /tmp/test_attributes_data
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "../src/AstroStructures.hpp"
#include "../src/Attributes.hpp"
#include "../src/Panchanga.hpp"
#include "../src/ScreenRenderer.hpp"
#include "check.hpp"

using namespace star;

static std::string trim(std::string s) {
    while (!s.empty() && (s.back() == ' ' || s.back() == '\t')) s.pop_back();
    size_t a = s.find_first_not_of(" \t");
    return a == std::string::npos ? "" : s.substr(a);
}

static std::string join(const std::vector<std::string>& t, size_t a, size_t b) {
    std::string o;
    for (size_t i = a; i < b && i < t.size(); ++i) {
        if (!o.empty()) o += " ";
        o += t[i];
    }
    return trim(o);
}

static size_t findTok(const std::vector<std::string>& t, const std::string& w, size_t from = 0) {
    for (size_t i = from; i < t.size(); ++i)
        if (t[i] == w) return i;
    return t.size();
}

int main() {
    std::ifstream f("tests/screen_test/attributes_data.txt");
    if (!f) {
        std::printf("SKIP test_attributes_data (no tests/screen_test/attributes_data.txt)\n");
        return 0;
    }
    int rows = 0, skipGana = 0, skipLinga = 0;
    std::string line;
    while (std::getline(f, line)) {
        if (line.empty() || line[0] == '#') continue;
        std::istringstream ss(line);
        std::vector<std::string> t;
        std::string tok;
        while (ss >> tok) t.push_back(tok);
        if (t.size() < 19) continue;
        int idx = 0;
        try {
            idx = std::stoi(t[0]);
        } catch (...) { continue; }
        if (idx < 0 || idx > 26) continue;
        ++rows;

        STAR_CHECK(std::string(nakshatraDisplayName(idx)) == t[1], "row%d nak %s", rows,
                   t[1].c_str());
        const NakAttributes at = attributesFor(idx);
        const size_t yi = findTok(t, "YONI"), ri = findTok(t, "RUXHA");
        const size_t di = findTok(t, "||"), ni = findTok(t, "NAADI:");
        const size_t pi = findTok(t, "PAXHI");
        if (yi >= t.size() || ri >= t.size() || di >= t.size() || ni >= t.size() ||
            pi >= t.size())
            continue;
        if (idx == 2) {
            ++skipGana;  // Keti Gana flips on DOS reruns; engine keeps majority vote
        } else {
            STAR_CHECK(ganaFor(idx) == t[5], "row%d gana %s", rows, t[5].c_str());
        }
        STAR_CHECK(trim(displayYoni(at.yoni)) == join(t, yi + 2, ri), "row%d yoni", rows);
        STAR_CHECK(trim(at.ruxha) == join(t, ri + 2, di), "row%d ruxha", rows);
        if (idx == 23 || idx == 24) {
            ++skipLinga;  // Siyavsa/Puvaputupa Linga flips on DOS reruns
        } else {
            STAR_CHECK(trim(at.linga) == trim(t[di + 1]), "row%d linga", rows);
        }
        STAR_CHECK(trim(at.naadi) == trim(t[ni + 1]), "row%d naadi", rows);
        STAR_CHECK(trim(at.paxhi) == join(t, pi + 2, t.size()), "row%d paxhi", rows);
    }
    STAR_CHECK(rows > 0, "%d attribute rows checked", rows);
    std::printf("note: skipped %d Keti-gana + %d Siyavsa/Puvaputupa-linga cells (DOS flips)\n",
                skipGana, skipLinga);
    if (::startest::g_fail == 0) std::printf("ATTRIBUTES_DATA_ALL_GREEN\n");
    return ::startest::exitCode();
}

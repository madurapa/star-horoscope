#pragma once
// Shared legacy-table + kendra-geometry helpers (docs/remove_legacy.md R2).
// The byte-exact screen renderers (renderScreen*) left with the golden
// files; what remains is used by the modern display, the JSON output, or
// the engine-vocabulary tests: DOS-literal name tables (rasiName and
// friends — the engine stays byte-faithful, the modern display corrects
// per docs/glossary.md), per-slot display mappers (test_slot_names),
// findLongitude, DMS/date formatting, the YONI truncation rule, and the
// kendra chart geometry feeding modern charts.

#include <string>
#include <string_view>
#include <vector>
#include <map>
#include <cstdio>
#include <cmath>

#include "AstroStructures.hpp"
#include "VargaEngine.hpp"
#include "Vimshottari.hpp"
#include "Panchanga.hpp"
#include "Avastha.hpp"
#include "Attributes.hpp"
#include "Hora.hpp"

namespace star {

// Angular formatting: "DDD:MM:SS".
inline std::string formatDMS(const AngularDegrees& ad) {
    char buf[32];
    std::snprintf(buf, sizeof(buf), "%3d:%02d:%02d", ad.deg, ad.min, ad.sec);
    return std::string(buf);
}

// Julian Date display "DDDDDDD.DDD" with Borland %.3f semantics: exact ties
// round half-to-ODD (Lagna10 X.6875->.687, Lagna13 X.8125->.813, Lagna22
// X.1875->.187 fuzz proofs; glibc uses half-even and flips all three).
// Identical to %.3f except on exact ties (near-ties within 1e-7 snapped,
// covering double dust; genuine content never sits that close to a tie).
// PROVENANCE: FITTED (Lagna10/13/22 exact-tie fuzz proofs; Borland %.3f emulation, no asm address).
inline std::string formatJulianDate(double jd) {
    const double scaled = jd * 1000.0;
    double ipart = 0.0;
    const double frac = std::modf(scaled, &ipart);
    long long i = static_cast<long long>(ipart);
    if (frac > 0.5 + 1e-7) {
        i += 1;
    } else if (std::fabs(frac - 0.5) <= 1e-7) {
        if (i % 2 == 0) i += 1;  // half to odd (jd > 0 always)
    }
    char buf[32];
    std::snprintf(buf, sizeof(buf), "%lld.%03lld", i / 1000, i % 1000);
    return std::string(buf);
}

// Rasi name from index (1=Mesha ... 12=Meena). Out-of-range renders as
// "**" (Pascal field-width overflow, observed in screen_test Invalid_Time
// Lagna Hora/Deshkana/Dvadasansa cells).
// PROVENANCE: FITTED (capture spellings + Invalid_Time ** overflow proof).
inline const char* rasiName(int idx) {
    static const char* names[12] = {
        "Mesha", "Wrushaba", "Mituna", "Kataka", "Sinha", "Kanya",
        "Thula", "Wrschika", "Dhanu", "Makara", "Kumba", "Meena"
    };
    if (idx >= 1 && idx <= 12) return names[idx - 1];
    return "**";
}

// Varga name from enum.
inline const char* vargaName(Varga v) {
    static const char* names[6] = {
        "RASHI", "NAVAMSAKA", "HORA", "DESHKANA", "DVADASANSA", "TRISHANSA"
    };
    return names[static_cast<int>(v)];
}

// Standard 27-nakshatra table lives in Panchanga.hpp (display spellings follow
// screen05 where known). Display-only, not gated.
inline const char* nakshatraName(int idx0based) {
    return nakshatraDisplayName(idx0based);
}

// (houseTableOrder removed slice C: Planet order + kPlanetNames carry the
// screen05 sequence; the FITTED tag moved with it.)

// Screen display spelling: Moon prints as "Sandu", Neptune as "Neptun".
// PROVENANCE: FITTED (screen05 spelling rule).
inline std::string displayPlanetName(std::string_view key) {
    if (key == "Chandra") return "Sandu";
    if (key == "Neptune") return "Neptun";
    return std::string(key);
}

// Canonical-key lookup (harness compat; product paths use lonOf).
// The old Chandra/Sandu + Neptune/Neptun alias fallbacks dropped with the
// Engine alias keys (slice C); canonical keys always hit.
inline const PlanetLongitude* findLongitude(const AstroEngineOutput& output,
                                            const std::string& key) {
    auto it = output.longitudes.find(key);
    if (it != output.longitudes.end()) return &it->second;
    return nullptr;
}

// Shadvarga name mapping (DOS-literal spellings, quirks included): "Rav1"
// (digit one), "Urenes", "Neptune" (with the e), "Pluuto", and "Chandra".
// Pinned by test_slot_names; the modern display corrects per glossary.
// PROVENANCE: FITTED (screen06 planet cells reproduced literally, quirks included).
inline std::string displayShadvargaName(std::string_view key) {
    if (key == "Chandra" || key == "Sandu") return "Chandra";
    if (key == "Ravi") return "Rav1";
    if (key == "Urenus") return "Urenes";
    if (key == "Neptune" || key == "Neptun") return "Neptune";
    if (key == "Pluto") return "Pluuto";
    return std::string(key);
}

// ---------------------------------------------------------------------------
// Kendraya (South-Indian diamond) charts — screens 08-11.
// Reverse-engineered layout rules (proven against screen08, both charts):
//  - The box frame is static; each chart is 3 cells (13/10/13 chars).
//  - Houses sit at FIXED slots: H1 top-middle box; H2+H3 top-left diamond;
//    H12+H11 top-right diamond; H4 mid-left; H10 mid-right; H5+H6 bottom-left
//    diamond; H7 bottom-middle box; H8+H9 bottom-right diamond.
//  - An EMPTY house shows its house NUMBER; occupied houses show planet
//    glyphs (Lagna itself has no glyph — its rasi is the center label).
//  - Each divisional kendra counts houses from its own varga-Lagna
//    (e.g. screen10 Dvadasamsa kendra centers Mesha, houses from Mesha).
//  - Glyph fill order: nodes (Raahu, Kethu) first, then screen05 table order.
//  - Glyph codes: Ch Rv Bu Si Ku Gu Sh Ra Ke (outer planets omitted, as in
//    the original screens).
// Known template variance: single-dot displacements of the diamond diagonals
// near text (the binary's own left/right diamonds differ the same way);
// glyph micro-rows in multi-glyph houses follow fixed per-house slot lists
// tuned to the baseline exemplar.

// One kendra chart: center rasi/label + glyphs per house (1..12).
struct KendraChart {
    std::string centerRasi;
    std::string centerLabel;  // LAGNA, NAVAMSAKA, HORA, ...
    // houses[h] = glyph codes in house h (fill order already applied).
    std::array<std::vector<std::string>, 13> houses;
};

// PROVENANCE: FITTED (glyph spellings as in original screens; outers omitted).
inline std::string kendraGlyph(Planet p) {
    switch (p) {
        case Planet::Chandra: return "Ch";
        case Planet::Ravi: return "Rv";
        case Planet::Budha: return "Bu";
        case Planet::Sikuru: return "Si";
        case Planet::Kuja: return "Ku";
        case Planet::Guru: return "Gu";
        case Planet::Shani: return "Sh";
        case Planet::Raahu: return "Ra";
        case Planet::Kethu: return "Ke";
        default: return "";
    }
}

// Build a KendraChart from varga seats: lagnaSeat + planetSeats (rasi 1..12).
// planets: (glyph, seat) pairs in screen05 table order; nodes are pulled first.
// Invalid seats (<1 or >12, from gated vargas on out-of-range longitudes)
// are SKIPPED (no glyph placed), matching the binary's finder bounds.
inline KendraChart makeKendra(int lagnaSeat, const std::string& lagnaName,
                              const std::string& label,
                              const std::vector<std::pair<std::string, int>>& planets) {
    KendraChart k;
    k.centerRasi = lagnaName;
    k.centerLabel = label;
    if (lagnaSeat < 1 || lagnaSeat > 12) return k;
    std::vector<std::pair<std::string, int>> nodes, rest;
    for (const auto& pg : planets) {
        if (pg.first == "Ra" || pg.first == "Ke") nodes.push_back(pg);
        else rest.push_back(pg);
    }
    // Fill order nodes-first (decoded; a strict-order probe showed no
    // effect either way, so the decoded order stands).
    auto place = [&](const std::pair<std::string, int>& pg) {
        if (pg.second < 1 || pg.second > 12) return;  // gated varga: skip
        const int house = ((pg.second - lagnaSeat + 12) % 12) + 1;
        k.houses[static_cast<size_t>(house)].push_back(pg.first);
    };
    for (const auto& pg : nodes) place(pg);
    for (const auto& pg : rest) place(pg);
    return k;
}

// Frame laws: 21 art lines (0..20). Borders at 0,7,13,20.
inline std::string kendraBorder(bool top, bool mid) {
    if (top) return "┌─────────────┬──────────┬─────────────┐";
    if (mid) return "├─────────────┼──────────┼─────────────┤";
    return "└─────────────┴──────────┴─────────────┘";
}

inline void kendraPut(std::string& line, size_t col, const std::string& s) {
    for (size_t i = 0; i < s.size() && col + i < line.size(); ++i)
        line[col + i] = s[i];
}

// Display-column put: single-chart lines hold │ (3-byte) separators at
// display cols 0/14/25/39, so byte offset = dcol + 2 * sepsAtOrBefore(dcol).
inline void kendraDPut(std::string& line, size_t dcol, const std::string& s) {
    auto byteOf = [](size_t d) -> size_t {
        size_t seps = 0;
        if (d >= 1) ++seps;   // sep at display 0
        if (d >= 14) ++seps;
        if (d >= 25) ++seps;
        if (d >= 39) ++seps;
        return d + 2 * seps;
    };
    const size_t b = byteOf(dcol);
    for (size_t i = 0; i < s.size() && b + i < line.size(); ++i)
        line[b + i] = s[i];
}

inline void kendraDDot(std::string& line, size_t dcol) {
    kendraDPut(line, dcol, ".");
}

// Per-(house, planet) glyph home cells (single-chart DISPLAY cols; cells at
// A=1..13, B=15..24, C=26..38). Decoded from screens 08-11 exemplars: every
// observed multi-glyph house across all 8 kendra charts is consistent with
// FIXED cells (the binary's GOTOXY cursor table behind sub_1D989).
// Planet index: 0 Ch, 1 Rv, 2 Bu, 3 Si, 4 Ku, 5 Gu, 6 Sh, 7 Ra, 8 Ke.
struct KendraHome {
    int house;
    int planet;
    int row;
    int col;
};
// PROVENANCE: DECODED (binary GOTOXY cursor table behind sub_1D989; screens 08-11 exemplars).
inline const std::array<KendraHome, 82>& kendraHomes() {
    static const std::array<KendraHome, 82> k{{
        {1, 2, 4, 21},  // H1 Budha
        {1, 0, 5, 21},  // H1 Chandra
        {1, 8, 6, 15},  // H1 Kethu
        {1, 4, 2, 15},  // H1 Kuja
        {1, 7, 5, 15},  // H1 Raahu
        {1, 1, 3, 21},  // H1 Ravi
        {1, 6, 3, 15},  // H1 Shani
        {1, 3, 4, 15},  // H1 Sikuru
        {1, 5, 2, 21},  // H1 Guru
        {2, 2, 3, 11},  // H2 Budha
        {2, 0, 4, 10},  // H2 Chandra
        {2, 5, 1, 6},  // H2 Guru
        {2, 1, 1, 12},  // H2 Ravi
        {2, 6, 2, 6},  // H2 Shani
        {2, 8, 1, 9},  // H2 Kethu
        {2, 3, 3, 7},  // H2 Sikuru
        {3, 8, 2, 1},  // H3 Kethu
        {3, 6, 4, 5},  // H3 Shani
        {3, 3, 6, 5},  // H3 Sikuru
        {3, 0, 6, 1},  // H3 Chandra
        {3, 5, 3, 2},  // H3 Guru
        {4, 2, 11, 3},  // H4 Budha
        {4, 0, 10, 7},  // H4 Chandra
        {4, 7, 10, 3},  // H4 Raahu
        {4, 6, 12, 7},  // H4 Shani
        {4, 4, 11, 7},  // H4 Kuja
        {4, 5, 12, 3},  // H4 Guru
        {5, 2, 15, 6},  // H5 Budha
        {5, 5, 14, 2},  // H5 Guru
        {5, 7, 16, 6},  // H5 Raahu
        {5, 1, 14, 6},  // H5 Ravi
        {5, 4, 15, 2},  // H5 Kuja
        {5, 8, 18, 2},  // H5 Kethu
        {5, 6, 14, 10},  // H5 Shani
        {6, 2, 19, 4},  // H6 Budha
        {6, 0, 19, 11},  // H6 Chandra
        {6, 5, 16, 11},  // H6 Guru
        {6, 8, 15, 12},  // H6 Kethu
        {6, 4, 19, 7},  // H6 Kuja
        {6, 1, 18, 11},  // H6 Ravi
        {6, 6, 18, 7},  // H6 Shani
        {6, 3, 17, 11},  // H6 Sikuru
        {6, 7, 17, 8},  // H6 Raahu
        {7, 5, 15, 15},  // H7 Guru
        {7, 4, 17, 21},  // H7 Kuja
        {7, 6, 16, 15},  // H7 Shani
        {7, 3, 17, 15},  // H7 Sikuru
        {7, 0, 18, 21},  // H7 Chandra
        {7, 1, 16, 21},  // H7 Ravi
        {8, 2, 18, 26},  // H8 Budha
        {8, 5, 16, 26},  // H8 Guru
        {8, 1, 18, 29},  // H8 Ravi
        {8, 7, 19, 30},  // H8 Raahu
        {9, 2, 16, 37},  // H9 Budha
        {9, 8, 14, 36},  // H9 Kethu
        {9, 4, 16, 33},  // H9 Kuja
        {9, 7, 17, 37},  // H9 Raahu
        {9, 1, 15, 33},  // H9 Ravi
        {9, 6, 15, 37},  // H9 Shani
        {10, 5, 12, 27},  // H10 Guru
        {10, 8, 8, 27},  // H10 Kethu
        {10, 3, 9, 32},  // H10 Sikuru
        {10, 1, 9, 27},  // H10 Ravi
        {10, 4, 11, 32},  // H10 Kuja
        {10, 6, 12, 32},  // H10 Shani
        {11, 0, 6, 32},  // H11 Chandra
        {11, 8, 3, 35},  // H11 Kethu
        {11, 4, 5, 31},  // H11 Kuja
        {11, 6, 4, 36},  // H11 Shani
        {11, 3, 6, 36},  // H11 Sikuru
        {11, 1, 4, 32},  // H11 Ravi
        {11, 5, 2, 36},  // H11 Guru
        {11, 7, 5, 35},  // H11 Raahu
        {12, 5, 1, 26},  // H12 Guru
        {12, 7, 5, 26},  // H12 Raahu
        {12, 3, 3, 26},  // H12 Sikuru
        {12, 0, 4, 27},  // H12 Chandra
        {12, 1, 1, 34},  // H12 Ravi
        {12, 2, 3, 30},  // H12 Budha
        {12, 4, 2, 31},  // H12 Kuja
        {12, 6, 2, 26},  // H12 Shani
        {12, 8, 1, 30},  // H12 Kethu
    }};
    return k;
}
// Empty-house number cells (row, display col).
// PROVENANCE: UNOBSERVED (measured exemplars only; uncovered houses fall back to house 1).
inline std::pair<int, int> kendraNumberCell(int house) {
    switch (house) {
        case 1: return {4, 19};
        case 2: return {3, 9};
        case 3: return {5, 4};
        case 4: return {10, 7};
        case 5: return {16, 3};
        case 6: return {18, 10};
        case 7: return {17, 19};
        case 8: return {18, 30};
        case 9: return {16, 34};
        case 10: return {10, 32};
        case 11: return {5, 33};
        case 12: return {2, 27};
        default: return {4, 19};
    }
}

// Fallback: region rows + default display col for (house,planet) combos never
// observed in screens 08-11 (other Lagnas/scenarios).
// PROVENANCE: UNOBSERVED (unseen combos; region/fill policy reproduced literally).
inline std::pair<std::vector<int>, int> kendraFallback(int house) {
    switch (house) {
        case 1: return {{1, 2, 3, 4, 5, 6}, 15};
        case 2: return {{1, 2, 3, 4, 5, 6}, 9};
        case 3: return {{2, 5, 6, 1, 4, 3}, 9};
        case 12: return {{1, 5, 6, 2, 3, 4}, 26};
        case 11: return {{3, 4, 5, 6, 1, 2}, 35};
        case 4: return {{10, 11, 12}, 3};
        case 10: return {{10, 11, 12}, 28};
        case 5: return {{14, 15, 16, 17, 18, 19}, 6};
        case 6: return {{14, 15, 16, 17, 18, 19}, 11};
        case 7: return {{14, 15, 16, 17, 18}, 15};
        case 8: return {{14, 15, 16, 17}, 26};
        case 9: return {{14, 15, 16, 17}, 33};
        default: return {{4}, 15};
    }
}

// Render ONE chart (39-char lines without the outer join) into 21 art lines.
// centerLabels only affects the diamond center text (modern display); the
// default false path is the frozen byte-exact original.
inline std::vector<std::string> renderKendraSingle(const KendraChart& k,
                                                   bool centerLabels = false) {
    const std::string cell13(13, ' '), cell10(10, ' ');
    std::vector<std::string> L(21, "");
    L[0] = kendraBorder(true, false);
    L[7] = kendraBorder(false, true);
    L[13] = kendraBorder(false, true);
    L[20] = kendraBorder(false, false);
    for (int i = 1; i <= 6; ++i) L[static_cast<size_t>(i)] = "│" + cell13 + "│" + cell10 + "│" + cell13 + "│";
    for (int i = 8; i <= 12; ++i) L[static_cast<size_t>(i)] = "│" + cell13 + "│" + cell10 + "│" + cell13 + "│";
    for (int i = 14; i <= 19; ++i) L[static_cast<size_t>(i)] = "│" + cell13 + "│" + cell10 + "│" + cell13 + "│";

    // Diamond diagonals (clean symmetric template; verified dot-exact
    // against the screen08 exemplar on every cell row).
    for (int i = 1; i <= 6; ++i) {  // top diamonds
        kendraDDot(L[static_cast<size_t>(i)], static_cast<size_t>(2 + (i - 1) * 2));          // A asc
        kendraDDot(L[static_cast<size_t>(i)], static_cast<size_t>(37 - (i - 1) * 2));         // C desc
    }
    for (int i = 14; i <= 19; ++i) {  // bottom diamonds
        kendraDDot(L[static_cast<size_t>(i)], static_cast<size_t>(12 - (i - 14) * 2));        // A desc
        kendraDDot(L[static_cast<size_t>(i)], static_cast<size_t>(27 + (i - 14) * 2));        // C asc
    }

    // Glyph homes: glyph string -> planet index for the home table.
    auto planetIdx = [](const std::string& g) -> int {
        if (g == "Ch") return 0;
        if (g == "Rv") return 1;
        if (g == "Bu") return 2;
        if (g == "Si") return 3;
        if (g == "Ku") return 4;
        if (g == "Gu") return 5;
        if (g == "Sh") return 6;
        if (g == "Ra") return 7;
        if (g == "Ke") return 8;
        return -1;
    };
    // Used (row,col) cells per line, so fallback glyphs never overprint homes.
    std::array<std::array<bool, 40>, 21> used{};
    auto markUsed = [&](int row, size_t col, size_t w) {
        for (size_t c = col; c < col + w && c < 40; ++c)
            used[static_cast<size_t>(row)][c] = true;
    };
    auto isFree = [&](int row, size_t col, size_t w) {
        for (size_t c = col; c < col + w && c < 40; ++c)
            if (used[static_cast<size_t>(row)][c]) return false;
        return true;
    };
    const auto& H = k.houses;
    auto num2 = [](int h) -> std::string {
        char b[8];
        std::snprintf(b, sizeof(b), "%d", h);
        return std::string(b);
    };
    // Pass 1: homed glyphs + empty-house numbers.
    for (int house = 1; house <= 12; ++house) {
        const auto& glyphs = H[static_cast<size_t>(house)];
        if (glyphs.empty()) {
            const auto nc = kendraNumberCell(house);
            kendraDPut(L[static_cast<size_t>(nc.first)], static_cast<size_t>(nc.second),
                       num2(house));
            markUsed(nc.first, static_cast<size_t>(nc.second),
                     num2(house).size());
        }
    }
    auto findHome = [&](int house, int p) -> const KendraHome* {
        for (const auto& h : kendraHomes())
            if (h.house == house && h.planet == p) return &h;
        return nullptr;
    };
    // Pass 2: homed glyphs.
    std::array<std::vector<std::string>, 13> pending;
    for (int house = 1; house <= 12; ++house) {
        for (const auto& g : H[static_cast<size_t>(house)]) {
            const int p = planetIdx(g);
            const KendraHome* home = (p >= 0) ? findHome(house, p) : nullptr;
            if (home != nullptr && isFree(home->row, static_cast<size_t>(home->col), 2)) {
                kendraDPut(L[static_cast<size_t>(home->row)],
                           static_cast<size_t>(home->col), g);
                markUsed(home->row, static_cast<size_t>(home->col), 2);
            } else {
                pending[static_cast<size_t>(house)].push_back(g);
            }
        }
    }
    // Pass 3: fallback for unobserved (house,planet) combos: first free row
    // in the house region at the house default column.
    for (int house = 1; house <= 12; ++house) {
        if (pending[static_cast<size_t>(house)].empty()) continue;
        const auto fb = kendraFallback(house);
        size_t ri = 0;
        for (const auto& g : pending[static_cast<size_t>(house)]) {
            while (ri < fb.first.size() &&
                   !isFree(fb.first[ri], static_cast<size_t>(fb.second), 2))
                ++ri;
            if (ri >= fb.first.size()) break;  // region full; drop (never observed)
            kendraDPut(L[static_cast<size_t>(fb.first[ri])],
                       static_cast<size_t>(fb.second), g);
            markUsed(fb.first[ri], static_cast<size_t>(fb.second), 2);
            ++ri;
        }
    }
    // Center label (middle cell spans display cols 15..24; labels are ASCII).
    if (centerLabels) {
        auto putCenter = [&](int row, const std::string& s) {
            const size_t start = s.size() >= 10 ? 15 : 15 + (10 - s.size()) / 2;
            kendraDPut(L[static_cast<size_t>(row)], start, s);
        };
        putCenter(10, k.centerRasi);
        putCenter(11, k.centerLabel);
    } else {
        kendraDPut(L[10], 15, k.centerRasi);
        kendraDPut(L[11], 15, k.centerLabel);
    }
    return L;
}

// DASA BALANCE lord spellings use the DISPLAYED planet spellings (16/16
// machine cells): screen12 "Kethu", T3 "Chandra", machine "Rav1" (Ravi
// balance). Dasa tables instead use dasa names ("Ketu", "Sandu", "Rahu").
// PROVENANCE: FITTED (16/16 machine cells: balance lord uses displayed spellings).
inline std::string balanceLordDisplay(std::string_view dasaLord) {
    if (dasaLord == "Sandu") return "Chandra";
    if (dasaLord == "Ketu") return "Kethu";
    if (dasaLord == "Rahu") return "Raahu";
    if (dasaLord == "Ravi") return "Rav1";
    if (dasaLord == "Urenus") return "Urenes";
    if (dasaLord == "Neptune") return "Neptune";
    if (dasaLord == "Pluto") return "Pluuto";
    return std::string(dasaLord);
}

// Binary YONI display width is 10 chars (field-width truncation, NOT the
// stored string): stored 'Mushikadena*' (12) prints 'Mushikaden', stored
// 'Sinha       ' (12) prints 'Sinha     ' (10).
// yoniFor() keeps the binary-literal table; truncation lives here on the
// display path (same policy as the 213:52:60 non-carry: store truthfully,
// render literally).
// PROVENANCE: FITTED (machine captures; storage itself is DECODED binary-literal).
inline std::string displayYoni(const char* stored) {
    std::string s(stored ? stored : "");
    if (s.size() > 10) s.resize(10);
    return s;
}

// Render a PAIR of kendra charts side by side (feeds modern chart pairs).
// centerLabels forwards to the singles (modern display); default false is
// the frozen byte-exact original.
inline std::string renderKendraPair(const KendraChart& left, const std::string& leftTitle,
                                    const KendraChart& right, const std::string& rightTitle,
                                    bool centerLabels = false) {
    const std::vector<std::string> A = renderKendraSingle(left, centerLabels);
    const std::vector<std::string> B = renderKendraSingle(right, centerLabels);
    std::string out;
    for (size_t i = 0; i < 21; ++i) {
        // Single lines are 40 display cols ending/starting with a 3-byte
        // border. The pair shares ONE middle separator: drop A's trailing
        // border, keep B's leading one (content rows); borders merge corners
        // into ┬ / ┼ / ┴.
        std::string joint = A[i].substr(0, A[i].size() - 3);
        if (i == 0) joint += "┬";
        else if (i == 7 || i == 13) joint += "┼";
        else if (i == 20) joint += "┴";
        joint += (i == 0 || i == 7 || i == 13 || i == 20) ? B[i].substr(3) : B[i];
        out += joint + "\n";
    }
    out += "\n            " + leftTitle + "                      " + rightTitle + "\n";
    return out;
}

} // namespace star

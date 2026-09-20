#pragma once
// STAR.EXE Phase 5 — Screen Rendering Pipeline
// Reproduces ASCII layouts from the original STAR.EXE screens 1-19.
// Longitude columns (ecliptic + rasi-relative DMS, rasi names) are computed
// from the engine output; Neketh/Pada/Avastha are display-onlyderivatives
// (standard 27-nakshatra table, pada from remainder) and are NOT part of the
// zero-variance gate (which covers longitudes, varga seats, JD/UT/ayanamsa
// and dasa dates per AGENTS.md checkpoints 1-4).

#include <string>
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

// Field width constants matching original STAR.EXE layouts.
// PROVENANCE: FITTED (widths measured from original screen layouts).
struct LayoutConstants {
    static constexpr int SCREEN_WIDTH = 80;
    static constexpr int LABEL_WIDTH = 18;
    static constexpr int VALUE_WIDTH = 12;
    static constexpr int LONGITUDE_WIDTH = 18;
    static constexpr int BORDER_WIDTH = 76;
};

// Text alignment utilities.
inline std::string padRight(const std::string& s, int width) {
    return s + std::string(std::max(0, width - static_cast<int>(s.size())), ' ');
}

inline std::string padLeft(const std::string& s, int width) {
    return std::string(std::max(0, width - static_cast<int>(s.size())), ' ') + s;
}

inline std::string center(const std::string& s, int width) {
    int pad = width - static_cast<int>(s.size());
    if (pad <= 0) return s;
    int left = pad / 2;
    int right = pad - left;
    return std::string(static_cast<size_t>(left), ' ') + s +
           std::string(static_cast<size_t>(right), ' ');
}

inline std::string borderLine(char c = '-', int width = 76) {
    return std::string(static_cast<size_t>(width), c);
}

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

// Planet name from enum.
inline const char* planetName(Planet p) {
    static const char* names[13] = {
        "Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja",
        "Guru", "Shani", "Raahu", "Kethu", "Urenus", "Neptune", "Pluto"
    };
    return names[static_cast<int>(p)];
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

// Rasi-relative DMS for a full ecliptic longitude (screen05 RASI LONGITUDE).
[[nodiscard]] inline AngularDegrees rasiRelative(AngularDegrees ecl) {
    const long total = ecl.totalArcSec();
    const int rasi = VargaEngine::GetRashiIndex(ecl.toDecimal());
    const long rel = total - static_cast<long>(rasi - 1) * 30L * 3600L;
    const long d = rel / 3600L;
    const long m = (rel % 3600L) / 60L;
    const long s = rel % 60L;
    return {static_cast<int>(d), static_cast<int>(m), static_cast<int>(s)};
}

// Screen 1: Title. The binary spells the method "NRAYANA" (= Nirayana
// sidereal; NOT Narayana Dasa — the dasa engine here is Vimshottari).
inline std::string renderScreen01(bool thathkala) {
    char buf[256];
    std::snprintf(buf, sizeof(buf),
        "YOUR STARS\n\n"
        "0.0 %% Of Disk B: Is Full\n\n"
        "Today is:             2026- 9-12\n\n\n"
        "\"Thathkala Kendra\"   ?  (Y/N) %c\n",
        thathkala ? 'Y' : 'N');
    return std::string(buf);
}

// Screen 2-3: Owner details.
inline std::string renderScreen0203(const HoroscopeOwner& owner) {
    char buf[512];
    std::snprintf(buf, sizeof(buf),
        " HOROSCOPE  OWNER\"S   DEATALS \n"
        " ****************************\n\n"
        "Name ? %s\n\n"
        "Birth date - Year Month Day  ? %d %d %d\n\n"
        "Birth time - Hr Min [24Hrs]  ? %d %d\n",
        owner.name.c_str(),
        owner.birth_year, owner.birth_month, owner.birth_day,
        owner.birth_hour, owner.birth_minute);
    return std::string(buf);
}

// Screen 3/4: City list.
inline std::string renderScreen04() {
    return "          LIST  OF  CITIES    \n"
           "          ----------------    \n\n"
           " 1. CLOMBO     2. GALLE     3. MATHARA    4. KANDY     5. HAMBANTOTA \n\n"
           " 6. KALUTHARA  7. RATNAPURA 8. PUTTLAM    9. A\"PURA   10. POLONARU \n\n"
           "11. JAFFNA    12. TRINCO   13. MATHARA   14.BADULLA   15. K\"GALA     \n\n"
           "Closest city ? \n\n"
           "|------------------------------------------|\n"
           "| ENTER A NUMBER > 15 FOR CITIES NOT GIVEN |\n"
           "|------------------------------------------|\n";
}

// Screen 5 (input echo): coordinates prompt.
inline std::string renderScreen05() {
    return "Geocentric latitude  (Deg  Min) ?   \n"
           "Geocentric longitude (Deg  Min) ?   \n";
}

// Screen 6 (input echo): Sayana/Nirayana choice.
inline std::string renderScreen06() {
    return "\"SAYANA\"  method  or \"NRAYANA\"  method (S/N) ?N";
}

// (houseTableOrder removed slice C: Planet order + kPlanetNames carry the
// screen05 sequence; the FITTED tag moved with it.)

// Screen display spelling: Moon prints as "Sandu", Neptune as "Neptun".
// PROVENANCE: FITTED (screen05 spelling rule).
inline std::string displayPlanetName(const std::string& key) {
    if (key == "Chandra") return "Sandu";
    if (key == "Neptune") return "Neptun";
    return key;
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

// Screen 7 (screen05.txt content): Nirayana Table of Houses with real longitudes.
// Byte-exact column laws (0-based, measured from screen05):
// planet %-8s | D %3d | 3sp | M %2d | 5sp | S %2d | 2sp | NEKETH %-10s | sp |
// PADA %d | sp | RASI %-11s | rasi-rel D %2d (RIGHT-aligned) | 3sp | M %2d |
// 5sp | S %2d | 3sp | AVASTHA. A blank line follows the Lagna row; rows with
// empty AVASTHA carry no trailing spaces.
// Out-of-range longitudes (raw quotient outside [0,11], e.g. Lagna 591 from
// birth 45:80): longitude + RASI print, but NEKETH/PADA/RASI-rel are BLANK
// (finder loop bounds), exactly as observed. The AVASTHA column reproduces
// observed cells via Avastha.hpp (blank where unobserved, as Lagna/outers).
// House-table RASI column spells Gemini "Mithuna" (6/6 machine captures);
// Shadvarga/kendra keep "Mituna" (see spellings doc).
// PROVENANCE: FITTED (6/6 machine captures: house-table Gemini is "Mithuna").
inline std::string displayRasiHouse(int idx) {
    if (idx == 3) return "Mithuna";
    return rasiName(idx);
}

inline std::string renderScreen07(const AstroEngineOutput& output, bool /*nirayana*/) {
    std::string out =
        "                            NIRAYANA  TABLE  OF HOUSES\n\n"
        "PLANET      LONGITUDE    NEKETH   PADA RASI      RASI LONGITUDE   AVASTHA\n"
        "____________________________________________________________________________\n";
    // Phase-1 array read: canonical Planet order == houseTableOrder keys;
    // planetSlotName(House) == displayPlanetName (see test_slot_names).
    for (int i = 0; i < 13; ++i) {
        const Planet p = static_cast<Planet>(i);
        const PlanetLongitude& pl = output.lonOf(p);
        const char* disp = planetSlotName(p, NameSlot::House);
        const double dec = pl.ecliptic.toDecimal();
        const double vUp = VargaEngine::normUp(dec);
        // Finder-loop bounds: rasi blocks match w in [0,360] (Meena jbe-360);
        // whole tail blank when out of range (Invalid_Time Lagna-591).
        const bool outOfRange = (vUp > 360.0);
        const int rasiIdx = VargaEngine::GetRashiIndex(dec);
        char row[256];
        if (outOfRange) {
            // Finder-loop bounds: whole tail (NEKETH/PADA/RASI/rel/AVASTHA)
            // blank; observed Invalid_Time Lagna-591 prints DMS only.
            std::snprintf(row, sizeof(row), "%-8s%3d   %2d     %2d",
                disp,
                pl.ecliptic.deg, pl.ecliptic.min, pl.ecliptic.sec);
            out += std::string(row) + "\n";
            if (p == Planet::Lagna) out += "\n";
            continue;
        }
        int nak0 = static_cast<int>(dec / 13.333333333333334);
        if (nak0 < 0) nak0 = 0;
        if (nak0 > 26) nak0 = 26;
        const int pada = nakshatraPada(dec);
        const AngularDegrees& rel = pl.rasiRel;  // raw split, no carry
        const char* avastha = output.avastha[static_cast<std::size_t>(i)].c_str();
        std::snprintf(row, sizeof(row), "%-8s%3d   %2d     %2d  %-10s %d %-11s%2d   %2d     %2d   %s",
            disp,
            pl.ecliptic.deg, pl.ecliptic.min, pl.ecliptic.sec,
            nakshatraName(nak0), pada, displayRasiHouse(rasiIdx).c_str(),
            rel.deg, rel.min, rel.sec, avastha);
        std::string line(row);
        while (!line.empty() && (line.back() == ' ' || line.back() == '\t'))
            line.pop_back();
        out += line + "\n";
        if (p == Planet::Lagna) out += "\n";
    }
    out += "____________________________________________________________________________\n";
    return out;
}

// Screen 8 (screen06.txt content): Shadvarga name matrix, computed per planet.
// Screen 8 (screen06.txt content): Shadvarga name matrix, computed per planet.
// Planet spellings reproduce screen06 LITERALLY, quirks included: "Rav1"
// (digit one), "Urenes", "Neptun"->"Neptune" (screen06 spells it WITH the e,
// unlike screen05's "Neptun"), "Pluuto", and "Chandra" (screen06 does NOT use
// screen05's "Sandu"). See AGENTS.md zero-variance mandate.
// PROVENANCE: FITTED (screen06 planet cells reproduced literally, quirks included).
inline std::string displayShadvargaName(const std::string& key) {
    if (key == "Chandra" || key == "Sandu") return "Chandra";
    if (key == "Ravi") return "Rav1";
    if (key == "Urenus") return "Urenes";
    if (key == "Neptune" || key == "Neptun") return "Neptune";
    if (key == "Pluto") return "Pluuto";
    return key;
}

inline std::string renderScreen08(const AstroEngineOutput& output) {
    std::string out =
        "SHAD VARGA OF Test User\n\n"
        "GRHAYA    RASHI    NAVAMSAKA    HORA    DESHKANA   DVADASANSAKA TRISHANSAKA\n"
        "---------------------------------------------------------------------------\n";
    // Phase-1 array read (see renderScreen07 note).
    for (int i = 0; i < 13; ++i) {
        const Planet p = static_cast<Planet>(i);
        const PlanetLongitude& pl = output.lonOf(p);
        const std::array<int, 6> sv =
            VargaEngine::GetShadvarga(pl.ecliptic.toDecimal());
        // GetShadvarga order: {Rashi, Navamsa, Hora, Deshkana, Dvadasansa, Trishansa}.
        // Row grid mirrors screen06: 8-char name, then five 11-char varga
        // columns plus the trailing sign (no padding). EXCEPTION (Invalid_Time
        // Lagna-591, the only observed ** case): invalid Hora/Deshkana/
        // Dvadasansa cells ("**") occupy widths 10/9/14 (not 11/11/11), so
        // subsequent columns start at 42/51 with Trishansa realigned at 65.
        // Total stays 33 (10+9+14); mechanism undisclosed, reproduced literally.
        // PROVENANCE: UNOBSERVED (only observed ** case is Invalid_Time Lagna-591; widths 10/9/14 reproduced literally).
        auto cell = [](int idx, int wValid, int wStar) -> std::string {
            const char* s = rasiName(idx);
            char b[32];
            if (idx < 1 || idx > 12)
                std::snprintf(b, sizeof(b), "%-*s", wStar, s);
            else
                std::snprintf(b, sizeof(b), "%-*s", wValid, s);
            return std::string(b);
        };
        char head[64];
        std::snprintf(head, sizeof(head), "%-8s| %-11s%-11s", planetSlotName(p, NameSlot::Shadvarga),
                      rasiName(sv[0]), rasiName(sv[1]));
        out += std::string(head) + cell(sv[2], 11, 10) + cell(sv[3], 11, 9) +
               cell(sv[4], 11, 14) + rasiName(sv[5]) + "\n";
    }
    return out;
}

// Screen 9 (screen07.txt content): house numbers from Lagna's varga seats.
inline std::string renderScreen0914(const AstroEngineOutput& output) {
    // Array read; the old null-fallback was dead (Engine always provides
    // Lagna — Invalid_Time Lagna-591 flows through GetShadvarga below, and
    // the {12,5,4,12,1,6} screen06-Lagna-row fallback survives in ModernRenderer).
    const std::array<int, 6> lagSv =
        VargaEngine::GetShadvarga(output.lonOf(Planet::Lagna).ecliptic.toDecimal());

    std::string out =
        "GRAHA  POSITIONS  IN  SHAD  VARGA\n\n"
        "GRHAYA        RASHI  NAVAMSAKA HORA DESHKANA DVADASANSA TRISHANSA\n"
        "-----------------------------------------------------------------\n";
    for (int i = 0; i < 13; ++i) {
        const Planet p = static_cast<Planet>(i);
        if (p == Planet::Lagna) continue;
        const PlanetLongitude& pl = output.lonOf(p);
        const std::array<int, 6> sv =
            VargaEngine::GetShadvarga(pl.ecliptic.toDecimal());
        // Lagna-relative house ((sv-lag+12)%12)+1, except when the Lagna seat
        // is invalid (gated -1, e.g. Invalid_Time Lagna-591 Hora/Deshkana/
        // Dvadasansa): the binary then shows the ABSOLUTE seat (proven on
        // ITime numbers rows: Chandra Hora 4 abs, not 6 = relative-to-(-1)).
        auto rel = [](int s, int l) {
            if (l < 1 || l > 12) return s;
            return ((s - l + 12) % 12) + 1;
        };
        char row[160];
        std::snprintf(row, sizeof(row), "%-12s|%5d  %8d  %5d  %5d  %6d  %7d\n",
            planetSlotName(p, NameSlot::House),
            rel(sv[0], lagSv[0]), rel(sv[1], lagSv[1]), rel(sv[2], lagSv[2]),
            rel(sv[3], lagSv[3]), rel(sv[4], lagSv[4]), rel(sv[5], lagSv[5]));
        out += row;
    }
    out += "-----------------------------------------------------------------\n";
    return out;
}

// Dasa tables (screens 14-18): full 120-year maha + bhukti listing.
// moonNirayanaDeg is the Nirayana Moon longitude (for the balance-maha tail).
inline std::string renderDasaTables(const YMD& birth, double birthFrac,
                                    const DasaBalance& bal, double moonNirayanaDeg) {
    const std::vector<DasaSpan> mahas = mahaTimeline(birth, birthFrac, bal);
    std::string out;
    for (const DasaSpan& m : mahas) {
        const int lordIdx = [&] {
            for (size_t i = 0; i < kDasaCycle.size(); ++i)
                if (m.lord == kDasaCycle[i].name) return static_cast<int>(i);
            return 0;
        }();
        char head[256];
        std::snprintf(head, sizeof(head),
            "%-6s Maha   dasava from %4d-%2d-%2d to %4d-%2d-%2d  Age %3d-%2d-%2d to %3d-%2d-%2d\n"
            "-------------------------------------------------------------------------------\n",
            m.lord.c_str(),
            m.from.y, m.from.m, m.from.d, m.to.y, m.to.m, m.to.d,
            m.ageFrom.y, m.ageFrom.m, m.ageFrom.d, m.ageTo.y, m.ageTo.m, m.ageTo.d);
        out += head;
        const bool isFirst = (&m == &mahas.front());
        std::vector<DasaSpan> bh;
        if (isFirst) {
            bh = bhuktiTimeline(birth, birthFrac, lordIdx, bal.years,
                                balanceElapsedUnits(moonNirayanaDeg),
                                static_cast<double>(kDasaCycle[lordIdx].years));
        } else {
            const double span = m.to.y != 0
                ? (fracYear(m.to.y, m.to.m, m.to.d) - fracYear(m.from.y, m.from.m, m.from.d))
                : static_cast<double>(kDasaCycle[lordIdx].years);
            bh = bhuktiTimeline(birth, fracYear(m.from.y, m.from.m, m.from.d),
                                lordIdx, span);
        }
        for (const DasaSpan& b : bh) {
            char row[256];
            std::snprintf(row, sizeof(row),
                "%-6s Athuru dasava from %4d-%2d-%2d to %4d-%2d-%2d  Age %3d-%2d-%2d to %3d-%2d-%2d\n",
                b.lord.c_str(),
                b.from.y, b.from.m, b.from.d, b.to.y, b.to.m, b.to.d,
                b.ageFrom.y, b.ageFrom.m, b.ageFrom.d, b.ageTo.y, b.ageTo.m, b.ageTo.d);
            out += row;
        }
        out += "\n";
    }
    return out;
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
inline const std::array<KendraHome, 55>& kendraHomes() {
    static const std::array<KendraHome, 55> k{{
        {1, 2, 4, 21},  // H1 Budha
        {1, 0, 5, 21},  // H1 Chandra
        {1, 8, 6, 15},  // H1 Kethu
        {1, 4, 2, 15},  // H1 Kuja
        {1, 7, 5, 15},  // H1 Raahu
        {1, 1, 3, 21},  // H1 Ravi
        {1, 6, 3, 15},  // H1 Shani
        {1, 3, 4, 15},  // H1 Sikuru
        {2, 2, 3, 11},  // H2 Budha
        {2, 0, 4, 10},  // H2 Chandra
        {2, 5, 1, 6},  // H2 Guru
        {2, 1, 1, 12},  // H2 Ravi
        {2, 6, 2, 6},  // H2 Shani
        {3, 8, 2, 1},  // H3 Kethu
        {3, 6, 4, 5},  // H3 Shani
        {3, 3, 6, 5},  // H3 Sikuru
        {4, 2, 11, 3},  // H4 Budha
        {4, 0, 10, 7},  // H4 Chandra
        {4, 7, 10, 3},  // H4 Raahu
        {4, 6, 12, 7},  // H4 Shani
        {5, 2, 15, 6},  // H5 Budha
        {5, 5, 14, 2},  // H5 Guru
        {5, 7, 16, 6},  // H5 Raahu
        {5, 1, 14, 6},  // H5 Ravi
        {6, 2, 19, 4},  // H6 Budha
        {6, 0, 19, 11},  // H6 Chandra
        {6, 5, 16, 11},  // H6 Guru
        {6, 8, 15, 12},  // H6 Kethu
        {6, 4, 19, 7},  // H6 Kuja
        {6, 1, 18, 11},  // H6 Ravi
        {6, 6, 18, 7},  // H6 Shani
        {7, 5, 15, 15},  // H7 Guru
        {7, 4, 17, 21},  // H7 Kuja
        {7, 6, 16, 15},  // H7 Shani
        {7, 3, 17, 15},  // H7 Sikuru
        {8, 2, 18, 26},  // H8 Budha
        {8, 5, 16, 26},  // H8 Guru
        {8, 1, 18, 29},  // H8 Ravi
        {9, 2, 16, 37},  // H9 Budha
        {9, 8, 14, 36},  // H9 Kethu
        {9, 4, 16, 33},  // H9 Kuja
        {9, 7, 17, 37},  // H9 Raahu
        {9, 1, 15, 33},  // H9 Ravi
        {9, 6, 15, 37},  // H9 Shani
        {10, 5, 12, 27},  // H10 Guru
        {10, 8, 8, 27},  // H10 Kethu
        {10, 3, 9, 32},  // H10 Sikuru
        {11, 0, 6, 32},  // H11 Chandra
        {11, 8, 3, 35},  // H11 Kethu
        {11, 4, 5, 31},  // H11 Kuja
        {11, 6, 4, 36},  // H11 Shani
        {11, 3, 6, 36},  // H11 Sikuru
        {12, 5, 1, 26},  // H12 Guru
        {12, 7, 5, 26},  // H12 Raahu
        {12, 3, 3, 26},  // H12 Sikuru
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
inline std::string balanceLordDisplay(const std::string& dasaLord) {
    if (dasaLord == "Sandu") return "Chandra";
    if (dasaLord == "Ketu") return "Kethu";
    if (dasaLord == "Rahu") return "Raahu";
    if (dasaLord == "Ravi") return "Rav1";
    if (dasaLord == "Urenus") return "Urenes";
    if (dasaLord == "Neptune") return "Neptune";
    if (dasaLord == "Pluto") return "Pluuto";
    return dasaLord;
}

// Screen 12 block (screen12.txt content), byte-exact per measured columns:
// LAGNA "(%5d   %2d     %2d)" + 8sp + NAVAMSAKA; DAY %-21s / NEKATHA %-17s;
// THITIYA %-19s + 2sp + YOGAYA + yoga %-17s; TIMES rows "%-30s-    %2d   %2d
//     %2d" under a 35-space "Hrs   Min   Sec" header ("Siderial" sic);
// sunset hour shown mod 12 ("5 51 45"); balance lord in planet spelling.
inline std::string renderScreen12(const HoroscopeOwner& owner, const GeoCoord& geo,
                                  const AstroEngineOutput& output, double birthDecHours,
                                  double lmstHours, const PanchangaInfo& pg,
                                  const DasaBalance& bal, double riseH, double setH) {
    // Clock values are NOT wrapped mod 24 (DOS evidence: Invalid_Time prints
    // UT 40:50:00, LMST 32:52:45 raw). displayHms splits raw values directly.
    const HMS birthHms = displayHms(birthDecHours);
    const HMS utHms = displayHms(birthDecHours - kTzHours);
    const HMS tlmHms = displayHms(trueLocalMeanHours(birthDecHours, geo.decimalLon()));
    const HMS lmstHms = displayHms(lmstHours);
    const HMS ulstHms = displayHms(printedUniversalSiderealHours(lmstHours));
    const HMS sinhalaHms = displayHms(sinhalaGhati(birthDecHours, riseH));
    const HMS riseHms = displayHms(riseH);
    HMS setHms = displayHms(setH);
    setHms.h %= 12;  // 12-hour clock as printed ("5 51 45" for 17:51:45)

    // Array read; Engine always provides Lagna (see renderScreen07 note).
    const double lagnaDec = output.lonOf(Planet::Lagna).ecliptic.toDecimal();
    const AngularDegrees lagnaRel = output.lonOf(Planet::Lagna).rasiRel;  // raw split, no carry
    const int lagnaRasi = VargaEngine::GetRashiIndex(lagnaDec);
    const int lagnaNav = VargaEngine::GetNavamshaIndex(lagnaDec);
    const std::string dasaLord = balanceLordDisplay(kDasaCycle[bal.lordCycleIdx].name);

    char buf[4096];
    std::snprintf(buf, sizeof(buf),
        "NAME  : %s\n\n"
        "DATE OF BIRTH: %d-%d-%d at Latitude  %d %d N Longitude %d %d E (Geocentric)\n"
        "JULIAN DATE  : %s\n\n"
        "LAGNA : %-8s(%5d   %2d     %2d)%8sNAVAMSAKA  : %s\n\n"
        "PANCHANGAYA\n"
        "DAY    : %-21sNEKATHA : %-17sPADAYA  :  %d\n"
        "THITIYA: %-19s  YOGAYA  : %-17sKARANAYA:  %s\n\n"
        "TIMES\n"
        "                                   Hrs   Min   Sec\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n"
        "%-30s-    %2d   %2d     %2d\n\n"
        "DASA BALANCE     :   %-8s%d Years  %d Months  %d Days  From Birth Onwards\n"
        "AYANAMSA(Arc-Ray):   %d   %d     %d\n",
        owner.name.c_str(),
        owner.birth_year, owner.birth_month, owner.birth_day,
        geo.lat_deg, geo.lat_min, geo.lon_deg, geo.lon_min,
        formatJulianDate(output.julianDate).c_str(),
        rasiName(lagnaRasi), lagnaRel.deg, lagnaRel.min, lagnaRel.sec,
        "", rasiName(lagnaNav),
        pg.weekday.c_str(), pg.nakshatra.c_str(), pg.pada,
        pg.tithiText.c_str(), pg.yoga.c_str(), pg.karana.c_str(),
        "Birth   time", birthHms.h, birthHms.m, birthHms.s,
        "Sinhala time", sinhalaHms.h, sinhalaHms.m, sinhalaHms.s,
        "True local mean time", tlmHms.h, tlmHms.m, tlmHms.s,
        "Universal  time", utHms.h, utHms.m, utHms.s,
        "Universal  Siderial     time", ulstHms.h, ulstHms.m, ulstHms.s,
        "Local  mean   siderial   time", lmstHms.h, lmstHms.m, lmstHms.s,
        "Sun rise time", riseHms.h, riseHms.m, riseHms.s,
        "Sun set time", setHms.h, setHms.m, setHms.s,
        dasaLord.c_str(), bal.ymd.y, bal.ymd.m, bal.ymd.d,
        output.ayanamsa.deg, output.ayanamsa.min, output.ayanamsa.sec);
    return std::string(buf);
}

// Binary YONI display width is 10 chars (field-width truncation, NOT the
// stored string): stored 'Mushikadena*' (12) prints 'Mushikaden' (Test User D +
// 2 fuzz rows), stored 'Sinha       ' (12) prints 'Sinha     ' (10).
// yoniFor() keeps the binary-literal table; truncation lives here on the
// display path (same policy as the 213:52:60 non-carry: store truthfully,
// render literally).
// PROVENANCE: FITTED (Test User D + 2 fuzz rows; storage itself is DECODED binary-literal).
inline std::string displayYoni(const char* stored) {
    std::string s(stored ? stored : "");
    if (s.size() > 10) s.resize(10);
    return s;
}

// Screen 13 block (screen13.txt content), byte-exact per measured columns:
// Hora lords %-10s/%-9s; GANA/YONI/RUXHA values right-aligned ending cols
// 21/46/73; LINGA/NAADI/PAXHI ending 21/46/73 (labels NAADI:/GOTHRA:/VARNA:/
// BHUTHA: sic, no space before colon); GOTHRA/VARNA/RAJJU ending 21/46/73;
// BHUTHA value right-aligned ending col 21.
// Inputs: Moon nakshatra index (mode-appropriate) + decoded Kala/Pancha/
// Sukshama display strings from horaChain() (sub_1AE29 mechanism).
inline std::string renderScreen13(int nakIndex, const std::string& kala,
                                  const std::string& pancha, const std::string& sukshama) {
    const NakAttributes at = attributesFor(nakIndex);
    char buf[1024];
    std::snprintf(buf, sizeof(buf),
        "KALA HORAVA : %-10sPANCHAMA HORAVA : %-9sSUKSHAMA HORAVA : %s\n\n"
        "GANA  : %14s    YONI : %14s     RUXHA : %14s\n"
        "LINGA : %14s    NAADI:%15s     PAXHI : %14s\n"
        "GOTHRA:%15s    VARNA:%15s     RAJJU : %14s\n"
        "BHUTHA:%15s\n",
        kala.c_str(), pancha.c_str(), sukshama.c_str(),
        ganaFor(nakIndex), displayYoni(at.yoni).c_str(), at.ruxha,
        at.linga, at.naadi, at.paxhi,
        at.gothra, at.varna, at.rajju,
        at.bhutha);
    return std::string(buf);
}

// Render a PAIR of kendra charts side by side (screens 08-11 layout).
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

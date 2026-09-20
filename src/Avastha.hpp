#pragma once
// STAR.EXE AVASTHA (planet state) column — DECODED from the binary (sub_23A58).
// Provenance: STAR.EXE.asm loc_25464 + surrounding stores (see
// docs/status_and_plans.md Session 13 for the decode record). Validated:
// E02-constant holds 13/13 runs (117/117 cells: 8 machines + TRANSCRI1-4 +
// screen05) with the term rules below.
//
// Binary rule (16-bit, all terms non-negative in practice; no overflow —
// max product 27*9*30 = 7020, E02 <= ~150, so int arithmetic is exact):
//   idx = (DF4 * DF6 * E00 + E02 + DF8 + DFA) mod 12
//   DF4  = nakshatra index + 1 (1..27; nak loop var_26 = 0..26, so Revathee
//          matches with DF4 = 27). Stale-carry (init 0) only when longitude
//          >= 360 (Lagna 591); negatives wrap up first (normUp).
//   DF6  = planet code: Ravi 1, Sandu 2, Kuja 3, Budha 4, Guru 5, Sikuru 6,
//          Shani 7, Raahu 8, Kethu 9 (nine mov stores before the planet calls).
//   E00  = Trunc(rasi-relative longitude) + 1 (1..30; rasi-block side effect).
//   E02  = Round_bankers(2.5 * (birthDecH - sunriseH)) (sinhala-ghati rounded;
//          uses the native-mechanism sunrise (PROGRAM 0x122D8-0x12586, no
//          table since Session 15), raw (possibly >24) birth hours).
//   DF8  = DF4 captured after Sandu's call (byte_2ED18 flag, set once at
//          PROGRAM+1AD2). Lagna out-of-range (>= 360) leaves it 0 (inferred
//          from Invalid_Time 9/9; mechanism undisclosed).
//   DFA  = Lagna's rasi (DFC saved once after Lagna's call); 0 when Lagna
//          out-of-range (no rasi block matches, RASI column blank).
// Names by remainder: 0 Nidra, 1 Shayana, 2 Upeveshana, 3 Nethrapani,
// 4 Prakasha, 5 Gamana, 6 Agamana, 7 Saba, 8 AAgama, 9 Bhojana,
// 10 Nuthyalipsa, 11 Kavthuka (cmp chain loc_254B5..loc_2561A).
// Blank gate (word_27E04): Lagna + outer planets (Urenus/Neptune/Pluto).
// Call order for carry: Lagna, Sandu, Ravi, Budha, Sikuru, Kuja, Guru,
// Shani, Raahu, Kethu (sub_23A58 call sites in PROGRAM).

#include <cmath>
#include <map>
#include <string>

#include "AstroStructures.hpp"

namespace star {

// Planet codes (word_27DF6).
[[nodiscard]] inline int avasthaPlanetCode(const std::string& planet) noexcept {
    if (planet == "Ravi") return 1;
    if (planet == "Chandra" || planet == "Sandu") return 2;
    if (planet == "Kuja") return 3;
    if (planet == "Budha") return 4;
    if (planet == "Guru") return 5;
    if (planet == "Sikuru") return 6;
    if (planet == "Shani") return 7;
    if (planet == "Raahu") return 8;
    if (planet == "Kethu") return 9;
    return 0;
}

inline const char* avasthaName(int idx) noexcept {
    switch (idx) {
        case 0: return "Nidra";
        case 1: return "Shayana";
        case 2: return "Upeveshana";
        case 3: return "Nethrapani";
        case 4: return "Prakasha";
        case 5: return "Gamana";
        case 6: return "Agamana";
        case 7: return "Saba";
        case 8: return "AAgama";
        case 9: return "Bhojana";
        case 10: return "Nuthyalipsa";
        case 11: return "Kavthuka";
        default: return "";
    }
}

// Pascal Banker's Round (half to even), for E02.
[[nodiscard]] inline long bankersRound(double x) noexcept {
    double ipart = 0.0;
    const double fpart = std::modf(x, &ipart);
    const long i = static_cast<long>(ipart);
    const double af = fpart >= 0.0 ? fpart : -fpart;
    if (af < 0.5) return i;
    if (af > 0.5) return (x >= 0.0) ? i + 1 : i - 1;
    // Exactly half: to even.
    if (i % 2 == 0) return i;
    return (x >= 0.0) ? i + 1 : i - 1;
}

// E02 = Round(2.5 * (birth - sunrise)), banker's.
[[nodiscard]] inline long avasthaE02(double birthDecHours, double sunriseH) noexcept {
    return bankersRound(2.5 * (birthDecHours - sunriseH));
}

inline constexpr double kNakSpanAv = 13.333333333328483;  // real48 40/3 (AstroTime::kNakshatraSpan)

// Full per-run avastha table. modeLon: planet -> MODE longitude in degrees
// (decimal, any range; negatives wrap up, >= 360 stays raw). Must contain
// Lagna + the 9 planets. Returns planet -> state ("" for Lagna/outers).
// e02: precomputed avasthaE02(birth, sunriseTable).
[[nodiscard]] inline std::map<std::string, std::string> avasthaTable(
    const std::map<std::string, double>& modeLon, long e02) {
    static const char* const kOrder[10] = {
        "Lagna", "Chandra", "Ravi", "Budha", "Sikuru",
        "Kuja", "Guru", "Shani", "Raahu", "Kethu"};
    std::map<std::string, std::string> out;
    long df4 = 0;   // word_27DF4 (nak+1), stale-carry, init 0
    long dfc = 0;   // word_27DFC (rasi), stale-carry, init 0
    long df8 = 0;   // word_27DF8 (set from Sandu's DF4 via flag)
    long dfa = 0;   // word_27DFA (Lagna's DFC)
    bool lagnaValid = false;
    for (int ci = 0; ci < 10; ++ci) {
        const std::string pl = kOrder[ci];
        const auto it = modeLon.find(pl);
        if (it == modeLon.end()) continue;
        const double raw = it->second;
        double w = raw;
        while (w < 0.0) w += 360.0;  // normUp
        // Nak finder covers w in [0,360); rasi finder covers w in [0,360]
        // (Meena block matches w == 360 via jbe).
        if (w < 360.0) {
            const long nak = static_cast<long>(w / kNakSpanAv);  // 0..26
            if (nak >= 0 && nak <= 26) df4 = nak + 1;
        }
        if (w <= 360.0) {
            const long q = static_cast<long>(w / 30.0);
            if (q < 0) dfc = 1;
            else if (q < 12) dfc = q + 1;
            else if (q == 12) dfc = 12;
            else dfc = ((q - 1) % 12) + 1;
        }
        if (ci == 0) {
            dfa = dfc;
            lagnaValid = (w <= 360.0);
            out[pl] = "";
            continue;
        }
        if (ci == 1) df8 = lagnaValid ? df4 : 0;  // flag anomaly: 0 if Lagna OOR
        if (w > 360.0) {
            out[pl] = "";
            continue;
        }
        const long rasi = dfc;
        const double rel = w - static_cast<double>(rasi - 1) * 30.0;
        const long e00 = static_cast<long>(rel) + 1;  // Trunc(rel)+1
        const int code = avasthaPlanetCode(pl);
        const long total = df4 * code * e00 + e02 + df8 + (lagnaValid ? dfa : 0);
        if (total < 0) {
            out[pl] = "";
            continue;
        }
        out[pl] = avasthaName(static_cast<int>(total % 12));
    }
    return out;
}

}  // namespace star

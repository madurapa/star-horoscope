#pragma once
// STAR.EXE Divisional Shadvarga Calculation Matrix Engine
// Provenance: docs/varga_and_sunrise_engine.md; screen06 names / screen07 numbers.
// Target: Native C++20 standard under GCC on Ubuntu Linux.
//
// Classical (Parashara) rules reproduced exactly:
//  Rashi (D1), Hora (D2), Drekkana (D3), Navamsha (D9), Dvadasamsa (D12),
//  Trishansa (D30, odd/even ruler mapping).
// Rasi indices: Mesha=1 ... Meena=12 (see AstroStructures.hpp, proven by
// tests/test_shadvarga.cpp over all 72 screen06/07 cells).
//
// OUT-OF-RANGE semantics (screen_test Invalid_Time, Lagna 591:11:18 —
// a birth 45:80 flows through unvalidated, so longitudes exceed 360):
//  - negatives wrap UP into [0,360) (Sikuru -13.26 behaves as 346.74);
//  - positives NEVER wrap down (display shows 591 raw);
//  - Rashi uses rule1: q = floor(lon/30); rasi = (q == 0) ? 1
//    : ((q-1) % 12) + 1. (Proven on 5 probes: 591->Thula(7), 334.84->Meena,
//    9.39->Mesha, 232.55->Wrschika; w = 360 exactly -> Meena(12) via the
//    Meena block's jbe-360 upper bound, hence the q == 12 -> 12 case.
//    NOTE: for q in 13..23 this is proper-mod MINUS... q = 19 yields 7.)
//  - Navamsa wraps once (single subtract): base(rule1-rasi tribe) + pada,
//    Lagna-591 -> 7+6 = 13 -> 1 Mesha, as observed.
//  - Hora/Deshkana/Dvadasansa validate the raw quotient (out of [0,11]
//    renders "**", Pascal field-width overflow, as observed for Lagna-591);
//    in-range sums wrap with a SINGLE conditional subtract (never a loop).
//  - Trishansa is table-driven (always 1..12): rasi from the WRAPPED
//    (norm360) longitude, remainder via fmod — Lagna-591 -> Wrschika(8)
//    seat + rem 21 -> Makara, as observed.
// Each varga's reduction habit differs (hand-written per-varga Pascal);
// the table above is evidenced cell-by-cell in docs/status_and_plans.md.

#include "AstroStructures.hpp"
#include <array>
#include <cmath>

namespace star {

class VargaEngine {
public:
    static constexpr int RASHI_COUNT = 12;

    // Normalize negatives up; positives pass through raw.
    [[nodiscard]] static double normUp(double lon) noexcept {
        double v = lon;
        while (v < 0.0) v += 360.0;
        return v;
    }

    // Normalize fully (used ONLY by Trishansa, which provably wraps).
    [[nodiscard]] static double norm360(double lon) noexcept {
        double v = std::fmod(lon, 360.0);
        if (v < 0.0) v += 360.0;
        if (v >= 360.0) v -= 360.0;
        return v;
    }

    // Rasi (D1): rule1 on the RAW quotient (see header note).
    // PROVENANCE: DECODED (Meena jbe-360 bound + 5 Invalid_Time probes, 591->Thula).
    [[nodiscard]] static int GetRashiIndex(double absolute_lon) noexcept {
        const double v = normUp(absolute_lon);
        const long q = static_cast<long>(std::floor(v / 30.0));
        if (q < 0) return 1;
        if (q < 12) return static_cast<int>(q) + 1;
        if (q == 12) return 12;  // w == 360 exactly (Meena jbe-360)
        return static_cast<int>(((q - 1) % 12) + 1);  // 13..23 -> q-12
    }

    // Hora (D2 - 15 deg arcs). Returns -1 when out of range (renders "**").
    // Odd signs: 0-15 deg = Sinha (5), 15-30 deg = Kataka (4).
    // Even signs: 0-15 deg = Kataka (4), 15-30 deg = Sinha (5).
    // PROVENANCE: FITTED (classical odd/even rule; 72 screen06/07 cells + Invalid_Time **).
    [[nodiscard]] static int GetHoraIndex(double absolute_lon) noexcept {
        const double v = normUp(absolute_lon);
        const long q = static_cast<long>(std::floor(v / 30.0));
        if (q < 0 || q > 11) return -1;
        const int rashi = static_cast<int>(q) + 1;
        const double inSign = v - q * 30.0;
        const bool odd = (rashi % 2) == 1;
        const bool firstHalf = inSign < 15.0;
        if (odd) return firstHalf ? 5 : 4;   // Sinha : Kataka
        return firstHalf ? 4 : 5;            // Kataka : Sinha
    }

    // Drekkana (D3 - 10 deg arcs), single conditional subtract (NOT a loop):
    // out-of-range stays out (renders "**"). 0-10 deg: same sign (+0),
    // 10-20 deg: +4 (5th from), 20-30 deg: +8 (9th from).
    // PROVENANCE: FITTED (classical rule; 72 screen06/07 cells + Invalid_Time **).
    [[nodiscard]] static int GetDrekkanaIndex(double absolute_lon) noexcept {
        const double v = normUp(absolute_lon);
        const long q = static_cast<long>(std::floor(v / 30.0));
        if (q < 0 || q > 11) return -1;
        const int rashi = static_cast<int>(q) + 1;
        const double inSign = v - q * 30.0;
        const int arc = static_cast<int>(inSign / 10.0);  // 0, 1, 2
        int idx = rashi + (arc == 0 ? 0 : (arc == 1 ? 4 : 8));
        if (idx > 12) idx -= 12;
        return idx;
    }

    // Navamsha (D9) - 3 deg 20' = 10/3 deg per pada, single-subtract wrap.
    // Base tribe uses the rule1 rasi (NOT proper-mod): Lagna-591 has
    // rule1-rasi Thula(7, airy) -> base 7, rem 21.19 -> pada 6 -> 7+6 = 13
    // -> 1 Mesha, as observed (proper-mod Wrschika base would give Makara).
    // Start sign by element: Fiery (1,5,9)->Mesha(1); Earthy (2,6,10)->Makara(10);
    // Airy (3,7,11)->Thula(7); Watery (4,8,12)->Kataka(4); then count forward.
    // PROVENANCE: FITTED (classical tribes; Lagna-591 rule1-tribe proof in comment).
    [[nodiscard]] static int GetNavamshaIndex(double absolute_lon) noexcept {
        const double v = normUp(absolute_lon);
        const long q = static_cast<long>(std::floor(v / 30.0));
        int rashi = GetRashiIndex(v);
        if (rashi < 1 || rashi > 12)
            rashi = static_cast<int>(((q % 12) + 12) % 12) + 1;
        const double inSign = v - q * 30.0;
        int pada = static_cast<int>(inSign / (10.0 / 3.0));  // 0..8
        if (pada < 0) pada = 0;
        if (pada > 8) pada = 8;

        int base = 1;
        if (rashi == 1 || rashi == 5 || rashi == 9) base = 1;        // Fiery -> Mesha
        else if (rashi == 2 || rashi == 6 || rashi == 10) base = 10; // Earthy -> Makara
        else if (rashi == 3 || rashi == 7 || rashi == 11) base = 7;  // Airy -> Thula
        else base = 4;                                              // Watery -> Kataka

        int idx = base + pada;
        if (idx > 12) idx -= 12;
        return idx;
    }

    // Dvadasamsa (D12) - 2 deg 30' = 2.5 deg per part, single subtract.
    // PROVENANCE: FITTED (classical rule; 72 screen06/07 cells + Invalid_Time **).
    [[nodiscard]] static int GetDvadasamsaIndex(double absolute_lon) noexcept {
        const double v = normUp(absolute_lon);
        const long q = static_cast<long>(std::floor(v / 30.0));
        if (q < 0 || q > 11) return -1;
        const int rashi = static_cast<int>(q) + 1;
        const double inSign = v - q * 30.0;
        int arc = static_cast<int>(inSign / 2.5);  // 0..11
        if (arc < 0) arc = 0;
        if (arc > 11) arc = 11;
        int idx = rashi + arc;
        if (idx > 12) idx -= 12;
        return idx;
    }

    // Trishansa (D30) — decoded bounds, table-driven on WRAPPED longitude.
    // (docs/status_and_plans.md Session 8; 52/52 cells over 4 scenarios.)
    //   odd signs:  bounds (4, 9, 18, 24), rulers Mars/Saturn/Jupiter/
    //               Mercury/Venus -> Mesha/Kumbha/Dhanu/Mithuna/Thula.
    //   even signs: bounds (4, 10, 19, 24), rulers Venus/Mercury/Jupiter/
    //               Saturn/Mars -> Wrushaba/Kanya/Meena/Makara/WRUSHABA.
    [[nodiscard]] static int GetTrishansaIndex(double absolute_lon) noexcept;

    // Complete Shadvarga for one planet:
    // {Rashi, Navamsaka, Hora, Deshkana, Dvadasansa, Trishansa} as Rasi indices.
    // NOTE: order matches the AGENT.MD checkpoint-2 display order
    // (Rashi/Navamsa/Hora/Deshkana/Dvadasansa/Trishansa), NOT the internal
    // enum order. Kept stable for the verifier + renderer.
    [[nodiscard]] static std::array<int, 6> GetShadvarga(double absolute_lon) noexcept;
};

} // namespace star

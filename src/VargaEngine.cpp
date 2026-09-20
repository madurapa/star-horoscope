// STAR.EXE Divisional Shadvarga Calculation Matrix Engine
// Implementation of Trishansa (D30) + the Shadvarga aggregate.
// All other Vargas are inline constexpr in VargaEngine.hpp.

#include "VargaEngine.hpp"

namespace star {

int VargaEngine::GetTrishansaIndex(double absolute_lon) noexcept {
    const double v = norm360(absolute_lon);
    const int rashi = GetRashiIndex(v);
    const double inSign = v - (rashi - 1) * 30.0;
    const bool odd = (rashi % 2) == 1;

    // Arc from DOS-validated bounds (Session 13 refit + Session 19b
    // targeted DOSBox campaign: 8 dedicated captures pinning every gap).
    // Odd:  (4, 9, 17, 24) — V3/V4 boundary 17 proven by T2 Ravi 16.13 (V3)
    //         vs ILeap Ravi 17.49 (V4), narrowed to (16.98, 17.24) by
    //         TriOCA/B (16.71/16.83 -> Dhanu) + TriOEA (16.98 -> Dhanu) vs
    //         TriOBB/A (17.24/17.65 -> Mituna); V1/V2 = 4 proven by
    //         T4 Budha 3.02; V2/V3 = 9 (Test User C Sikuru 9.23 V3 vs
    //         ILeap Sikuru 8.91 V2).
    // Even: (4, 11, 19, 24) — b0 = 4 proven by TriB0A (3.55 -> Wrushaba,
    //         excludes 3); b1 = 11 proven by TriB1A/B (10.64 -> Kanya,
    //         excludes 10); V3/V4 = 19 proven by T4 Ravi 19.73 (V4) vs
    //         ICity Guru 18.82 (V3); b3 = 24 proven by TriB3A/B
    //         (23.48/23.49 -> Makara, excludes 23).
    int arc = 4;
    if (odd) {
        if (inSign < 4.0) arc = 0;
        else if (inSign < 9.0) arc = 1;
        else if (inSign < 17.0) arc = 2;
        else if (inSign < 24.0) arc = 3;
        else arc = 4;
        // Mars, Saturn, Jupiter, Mercury, Venus.
        // PROVENANCE: FITTED (Session 13 refit + Session 19b DOSBox campaign; bounds (4,9,17,24) per named probes above).
        constexpr int kOdd[5] = {1, 11, 9, 3, 7};
        return kOdd[arc];
    }
    if (inSign < 4.0) arc = 0;
    else if (inSign < 11.0) arc = 1;
    else if (inSign < 19.0) arc = 2;
    else if (inSign < 24.0) arc = 3;
    else arc = 4;
    // Venus, Mercury, Jupiter, Saturn, Venus (arc4 reads Wrushaba, NOT
    // Wrschika — 6/6 high-even samples across both epochs).
    // PROVENANCE: FITTED (TriB0A/B1A/B3A campaign; bounds (4,11,19,24) per named probes above).
    constexpr int kEven[5] = {2, 6, 12, 10, 2};
    return kEven[arc];
}

// Complete Shadvarga for one planet.
// Order: {Rashi, Navamsaka, Hora, Deshkana, Dvadasansa, Trishansa}.
std::array<int, 6> VargaEngine::GetShadvarga(double absolute_lon) noexcept {
    return {
        GetRashiIndex(absolute_lon),
        GetNavamshaIndex(absolute_lon),
        GetHoraIndex(absolute_lon),
        GetDrekkanaIndex(absolute_lon),
        GetDvadasamsaIndex(absolute_lon),
        GetTrishansaIndex(absolute_lon)
    };
}

} // namespace star

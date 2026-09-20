#pragma once
// Swiss-Ephemeris position feed (Phase-2 landing step 2).
// Fills mode-appropriate (Nirayana/Sayana) longitudes for all 13 slots
// plus the Lahiri ayanamsa and tropical Sun, reusing every downstream
// computation unchanged (varga, panchanga, dasa, avastha, sunrise).
// Moshier fallback (no .se1 data); see docs/phase2_design.md §3.
// lon[] is in Planet order (see kPlanetNames in AstroStructures.hpp).

#include <array>
#include <string>

namespace star {

struct SwissFeed {
    bool ok = true;
    std::string err;
    double ayanamsaDeg = 0.0;
    double sunSayanaDeg = 0.0;  // tropical Sun (sunrise path + Sayana mode)
    std::array<double, 13> lon{};  // Nirayana iff nirayana, else Sayana
};

[[nodiscard]] SwissFeed computeSwissFeed(double jd, double latDec, double lonDec,
                                        bool nirayana);

}  // namespace star

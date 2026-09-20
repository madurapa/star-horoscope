#pragma once
// STAR.EXE Bhava (house) engine — Madhya cusps + Sandhi boundaries.
// The Kendraya charts (screens 08-11) are South-Indian whole-sign houses:
// house n holds the rasi Lagna+n-1. Bhava Madhya (cusp) of house n is the
// Lagna longitude advanced by (n-1)*30 deg; Bhava Sandhi (boundary) sits
// midway between adjacent cusps (cusp-15). Whole-sign occupancy reproduces
// the screen07 RASHI house column exactly (12/12 cells, see test).
// NOTE: screens carry no Bhava-Madhya/Sandhi degree ground truth, so cusp
// longitudes are a documented equal-house extension; house MEMBERSHIP is
// ground-truth pinned.

#include <array>
#include <cmath>

#include "AstroStructures.hpp"
#include "VargaEngine.hpp"

namespace star {

// Whole-sign house number (1..12) of a longitude given Lagna longitude.
[[nodiscard]] inline int houseOf(double lonDeg, double lagnaDeg) noexcept {
    const int rasi = VargaEngine::GetRashiIndex(lonDeg);
    const int lagnaRasi = VargaEngine::GetRashiIndex(lagnaDeg);
    return ((rasi - lagnaRasi + 12) % 12) + 1;
}

// Bhava Madhya cusp longitudes, houses 1..12 (degrees, [0,360)).
[[nodiscard]] inline std::array<double, 12> bhavaMadhyas(double lagnaDeg) noexcept {
    std::array<double, 12> out{};
    double base = std::fmod(lagnaDeg, 360.0);
    if (base < 0.0) base += 360.0;
    for (int i = 0; i < 12; ++i) {
        double c = base + i * 30.0;
        c = std::fmod(c, 360.0);
        if (c < 0.0) c += 360.0;
        out[static_cast<size_t>(i)] = c;
    }
    return out;
}

// Bhava Sandhi boundary longitudes: midpoint between cusp n and cusp n+1,
// reported as the START boundary of each house (sandhi[i] opens house i+1).
[[nodiscard]] inline std::array<double, 12> bhavaSandhis(double lagnaDeg) noexcept {
    const std::array<double, 12> cusps = bhavaMadhyas(lagnaDeg);
    std::array<double, 12> out{};
    for (int i = 0; i < 12; ++i) {
        double b = cusps[static_cast<size_t>(i)] - 15.0;
        b = std::fmod(b, 360.0);
        if (b < 0.0) b += 360.0;
        out[static_cast<size_t>(i)] = b;
    }
    return out;
}

}  // namespace star

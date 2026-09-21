#pragma once
// STAR.EXE Ayanamsa Precession Formula
// Provenance: PROGRAM 0x1159d-0x11601 GMST block; screen12 AYANAMSA 23 50 1.
// The binary's GMST constant (24110.54541) differs from Meeus (24110.54841)
// by 0.003 s — see docs/math_engine_proofs.md section 4. The ayanamsa itself
// is Lahiri-like, empirically anchored (see constants below).
// VALID RANGE ~1900-2100: two-epoch linear fit omits the quadratic term
// (couple arcsec/century error off-anchor); do not extrapolate to 1600.
//
// Port rule: calibrated Lahiri — exact at the baseline epoch, standard
// precession rate (50.27"/yr = 0.0139639 deg/yr) elsewhere. This closes the
// baseline to 0.0" and keeps other dates within the binary's own ~arcminute
// band. Replaces the earlier stub that returned a constant via dead code.

#include <cmath>
#include "AstroTime.hpp"

namespace star {

// Binary ayanamsa (PROGRAM ayanamsa block, STAR.EXE.asm ~line 1680-1722,
// Session 19 decode — replaces the two-epoch linear fit; the quadratic
// term is real and the ~1900-2100 validity caveat is retired).
//   t  = JD - 2415020.0  (days; JD in the binary convention, noon epoch +
//        UT fraction — Engine passes r.jd directly)
//   A  = t/365 - 1
//   ayan = Ca + (A*Cb + Cc)*t/Cd   (Real48 immediates, exact decodes)
// Rate at 1900: Cc/Cd per day = 50.2564"/yr; Ca = 22.4276 deg at 1900.
// At baseline JD: 23.83364 deg (display still rounds to 23:50:01).
// PROVENANCE: DECODED (PROGRAM ayanamsa block, STAR.EXE.asm ~1680-1722; Real48 immediates with hex patterns; epoch 2415020.5 half-day later than elements epoch).
inline constexpr double kAyanCa = 22.427627139986726;    // (2985,C7C7,336B)
inline constexpr double kAyanCb = 0.00011125000000000718;  // (E273,E392,694E)
inline constexpr double kAyanCc = 50.256400000012945;      // (BB86,8DB8,4906)
inline constexpr double kAyanCd = 1314000.0;               // (95,8000,2066)
// NOTE: the ayanamsa epoch immediate is (96h,0B200h,1366h) = 2415020.5 —
// half a day LATER than the planetary-elements epoch (96h,0B000h,1366h) =
// 2415020.0 used in Engine/sunrise paths. The 0.5 d matters (0.069").
inline constexpr double kAyanEpoch = 2415020.5;

// Calibrated Lahiri ayanamsa in degrees (binary formula).
[[nodiscard]] inline double AyanamsaLahiri(double jd) noexcept {
    const double t = jd - kAyanEpoch;
    const double a = t / 365.0 - 1.0;
    return kAyanCa + (a * kAyanCb + kAyanCc) * t / kAyanCd;
}

// Exact binary-path ayanamsa (same calibration; kept as a separate entry
// point because Ephemeris calls it per-planet).
[[nodiscard]] inline double AyanamsaExact(double jd) noexcept {
    return AyanamsaLahiri(jd);
}

} // namespace star

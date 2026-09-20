#pragma once
// STAR.EXE native sunrise engine — RECOVERED MECHANISM (Session 15).
// Provenance: PROGRAM 0x122D8-0x12586, recovered via 8086 emulation +
// byte-level capstone audit of STAR.EXE (see docs/varga_and_sunrise_engine.md
// section B). There is NO almanac table in dseg: the binary computes sunrise
// analytically every run. Validated DOS-exact (<=0.5 s, display-identical on
// rise/sinhala/hora/avastha) on all 7 DOS captures (Test User D/Test User E/Test User/
// Test User A/Test User B/Test User C/Leap); sunset is derived as 12.0 - rise (PROGRAM
// 0x15DD4: the binary prints sunset on a 12-hour clock, i.e. (24-rise)%12).
//
// Mechanism (all values local decimal hours / degrees):
//   JD      = MeeusJD(date, no fraction) + (birthH - 5.5)/24   (binary JD
//             convention: noon-based epoch + UT fraction, NOT true JD)
//   dayNum  = JD - (MeeusJD(y,1,0) - 0.5) - 1.0   (fractional day-of-year)
//   dayAng  = dayNum * 2*PI/365
//   EoT     = 229.18*(0.000075 + 0.001868*cos(dayAng) - 0.032077*sin(dayAng)
//             - 0.014615*cos(2*dayAng) - 0.04089*sin(2*dayAng))  (Spencer,
//             minutes) / 60 -> hours                          (dseg 27DB4)
//   T       = (JD - 2415020.0)/36525; sunLon = sunResult(T).lon  (Sayana)
//   sinDec  = sin(obl)*sin(sunLon), obl = 23.45deg (dseg 27DA8 = asin)
//   cosH    = sin(h0)/(cos(lat)*cos(dec)) - tan(lat)*tan(dec),
//             h0 = -50' via cos(90d50')                       (dseg 27DD8)
//   rise    = (12 - H/15) - EoT + (5.5 - lon/15)              (dseg 27DBA)
// NOTE on trig (see Ephemeris.hpp): IDA FLIRT swapped the Sin/Cos runtime
// names (blueprint @Sin -> cos(), @Cos -> sin()). The code below is written
// with TRUE functions and matches the binary exactly under that mapping.
// All immediates below are exact Real48 decodes of the binary's constants.

#include <cmath>
#include <utility>

#include "AstroTime.hpp"  // meeusJdNoon, kTzHours
#include "Ephemeris.hpp"  // sunResult, kR2D

namespace star {

// Exact Real48 decodes (PROGRAM dseg immediates).
inline constexpr double kSunTwoPi = 6.2831853071766091;      // (2183,DAA2,490F)
inline constexpr double kSunYearDays = 365.0;                 // (89,0,3680)
inline constexpr double kEotScale = 229.17999999993481;       // (E188,147A,652E)
inline constexpr double kEotC0 = 7.5000000000047251e-05;      // (AA73,5182,1D49)
inline constexpr double kEotC1 = 0.0018679999999999808;       // (5F77,ADD1,74D7)
inline constexpr double kEotC2 = 0.032077000000015232;        // (437C,2C1F,0363)
inline constexpr double kEotC3 = 0.014615000000006262;        // (FD7A,C0C1,6F73)
inline constexpr double kEotC4 = 0.040889999999990323;        // (BC7C,45CB,277C)
inline constexpr double kSunObliquityDeg = 23.450000000011642;  // (9A85,9999,3B99)
inline constexpr double kSunZenithDeg = 90.833333333372138;    // (AB87,AAAA,35AA)
inline constexpr double kSunEpoch1900 = 2415020.0;            // (96,B000,1366)

struct NativeSun {
    double riseH = 0.0;    // sunrise, local decimal hours (== dseg 27DBA)
    double eotH = 0.0;     // equation of time, hours (== dseg 27DB4)
    double declDeg = 0.0;  // solar declination, degrees (== dseg 27DA8)
    double halfDayH = 0.0;  // half-day hour angle, hours (== X at 0x122BA)
};

// Native sunrise for a civil date + birth time + geo position.
// Self-contained (recomputes JD/T/Sun internally); deterministic, no tables.
[[nodiscard]] inline NativeSun nativeSunrise(int y, int mo, int d,
                                             double birthDecH, double latDec,
                                             double lonDec) noexcept {
    const double jdn0 = meeusJdNoon(y, mo, d);
    const double jd = julianDateR48(jdn0, birthDecH);
    // Fractional day-of-year in the binary's JD convention.
    const double dayNum = jd - (meeusJdNoon(y, 1, 0) - 0.5) - 1.0;
    const double dayAngle = dayNum * (kSunTwoPi / kSunYearDays);
    // Spencer equation of time, minutes (blueprint @Sin->cos, @Cos->sin).
    const double eotMin =
        kEotScale * (kEotC0 + kEotC1 * std::cos(dayAngle) -
                     kEotC2 * std::sin(dayAngle) -
                     kEotC3 * std::cos(2.0 * dayAngle) -
                     kEotC4 * std::sin(2.0 * dayAngle));
    const double eotH = eotMin / 60.0;
    // Sayana Sun longitude from the shared solar theory (sine series).
    const double sunLon = sunResult((jd - kSunEpoch1900) / 36525.0).lon;
    // Declination: asin(sin(obl)*sin(lon)) (binary 260ED, then x57.29578).
    const double sinEps = std::sin(kSunObliquityDeg / kR2D);
    const double declDeg =
        std::asin(sinEps * std::sin(sunLon / kR2D)) * kR2D;
    // Hour angle (binary 12206-122C8 under the Sin/Cos swap == standard):
    //   dd8 = cos(zenith)/(cos(dec)*cos(lat)); term = -tan(lat)*tan(dec).
    const double latR = latDec / kR2D;
    const double decR = declDeg / kR2D;
    const double dd8 = std::cos(kSunZenithDeg / kR2D) /
                       (std::cos(decR) * std::cos(latR));
    const double cosH = dd8 - std::tan(latR) * std::tan(decR);
    double cH = cosH;
    if (cH > 1.0) cH = 1.0;
    if (cH < -1.0) cH = -1.0;
    const double halfDayH = std::acos(cH) * kR2D / 15.0;
    // sunrise = (12 - H/15) - EoT + (5.5 - lon/15) (binary 124BB-124DF).
    const double riseH =
        (12.0 - halfDayH) - eotH + (kTzHours - lonDec / 15.0);
    return {riseH, eotH, declDeg, halfDayH};
}

inline constexpr double kSunTrueAltitudeDeg = -0.8333333333333333; // -50'
inline constexpr double kTZOffsetHours = 5.5;

// Hour angle H in degrees from latitude/declination via the cos-H formula.
// (Kept for test_boundaries high-latitude clamp coverage.)
[[nodiscard]] inline double HourAngle(double lat_deg, double decl_deg) noexcept {
    const double kD2R = 3.14159265358979323846 / 180.0;
    const double kR2D = 180.0 / 3.14159265358979323846;
    const double latR = lat_deg * kD2R;
    const double declR = decl_deg * kD2R;
    const double altR = kSunTrueAltitudeDeg * kD2R;
    double cosH = (std::sin(altR) - std::sin(latR) * std::sin(declR)) /
                  (std::cos(latR) * std::cos(declR));
    if (cosH > 1.0) cosH = 1.0;
    if (cosH < -1.0) cosH = -1.0;
    return std::acos(cosH) * kR2D; // degrees
}

// UTC -> Sri Lanka local (UTC+5:30), normalized to [0, 24).
[[nodiscard]] inline double ToSriLankaLocal(double utcHours) noexcept {
    double local = utcHours + kTZOffsetHours;
    local = std::fmod(local, 24.0);
    if (local < 0.0) local += 24.0;
    return local;
}

} // namespace star

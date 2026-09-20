#pragma once
// STAR.EXE Phase 3 - Lagna (ascendant) engine (sub_18760).
// Inputs: LMST decimal hours (dseg 27BF8), geocentric latitude degrees (27C0A).
// Output: Lagna Sayana longitude degrees (dseg 27C88).
// Small static procs inlined: deg2rad (25FC7: x/360*pi), rad2deg (25F7D),
// cot (25F30: cos/sin), asin01pi (26011), arcsin (260ED).
// Trig swap applied (see Ephemeris.hpp): blueprint @Sin -> cos(), @Cos -> sin().
#include <cmath>

namespace star {

// PROVENANCE: DECODED (sub_18760 + inlined procs 25FC7/25F7D/25F30/26011/260ED; hex patterns on Kobl/Krad/Edge).
inline constexpr double kLagPi = 3.1415926535883045;
inline constexpr double kLagObl = 23.45000000001164;
inline constexpr double kLagKobl = 23.45000000001164;   // (9A85,9999,3B99), degrees
inline constexpr double kLagKrad = 0.4092797095927381;  // (3C7F,1C2F,518D)
inline constexpr double kLagEdge = 89.99999999988358;   // (FF87,FFFF,33FF)
inline constexpr double kLagTiny = 1.6000000000007978e-08;
inline constexpr double kLagLo = 179.99999899999239;
inline constexpr double kLagHi = 179.99999990011565;

inline double lagna_d2r(double x) { return x / 180.0 * kLagPi; }
inline double lagna_r2d(double x) { return x / kLagPi * 180.0; }
inline double lagna_tan(double x) { return std::sin(x) / std::cos(x); }  // sub_25F30
inline double lagna_asin01pi(double x) {
    if (x == 0.0) return kLagPi / 2.0;
    double r = std::atan(x / std::sqrt(1.0 - x * x));
    if (r < 0.0) r += kLagPi;
    return r;
}

[[nodiscard]] inline double lagnaSayana(double lmstHours, double latDeg) {
    // A. RAMC edges + MC + quadrant
    double ramc = lmstHours * 15.0;
    if (ramc == 360.0) ramc = 0.0;
    if (!(ramc > kLagTiny)) ramc = kLagTiny;
    if (ramc <= 180.0 && ramc >= kLagLo) ramc = kLagHi;
    double mc = ramc + 90.0;
    int qcode = 0;
    double red = 0.0;
    if (mc < 90.0 && mc >= 0.0) { red = mc; qcode = 1; }
    if (mc < 180.0 && mc >= 90.0) { red = 180.0 - mc; qcode = 2; }
    if (mc < 270.0 && mc >= 180.0) { red = mc - 180.0; qcode = 3; }
    if (mc <= 360.0 && mc >= 270.0) { red = 360.0 - mc; qcode = 4; }
    if (mc >= 360.0) { mc = mc - 360.0; red = mc; qcode = 1; }
    // B. auxiliary angle D (degrees). True funcs: cos(lat), cos(red), sin(lat).
    double latR = latDeg / 180.0 * kLagPi;
    double redR = red / 180.0 * kLagPi;
    double ascD =
        std::atan(std::sin(latR) / (std::cos(redR) * std::cos(latR))) * 180.0 / kLagPi;
    double b68;
    if (qcode == 4 || qcode == 1)
        b68 = ascD + kLagObl;
    else
        b68 = ascD - kLagObl;
    // C. ascendant in degrees
    double asc;
    if (b68 < 90.0) {
        // t35 = sin(red)/cos(red) = tan(red); t36 *= cos(D); t37 /= cos(B68).
        double tang = (std::sin(redR) / std::cos(redR)) *
                      std::cos(ascD / 180.0 * kLagPi) /
                      std::cos(b68 / 180.0 * kLagPi);
        double aRad = std::atan(tang);
        if (qcode == 1)
            asc = aRad * 180.0 / kLagPi;
        else if (qcode == 2)
            asc = 180.0 - aRad * 180.0 / kLagPi;
        else if (qcode == 3)
            asc = 180.0 + aRad * 180.0 / kLagPi;
        else
            asc = 360.0 - aRad * 180.0 / kLagPi;
    } else {
        double tang = (std::sin(redR) / std::cos(redR)) *
                      std::cos(ascD / 180.0 * kLagPi) /
                      std::sin(b68 / 180.0 * kLagPi - 90.0);
        asc = std::atan(tang) * 180.0 / kLagPi + 180.0;
    }
    // D. tail: integer scaffolding + asin chains + interpolation
    double ai = std::trunc(asc);
    double aj = ai + 1.0;
    double s1 = std::sin(lagna_d2r(kLagKobl));
    double s2 = std::sin(lagna_d2r(ai));
    double b98 = lagna_r2d(std::asin(s1 * s2));
    double s3 = std::sin(lagna_d2r(kLagKobl));
    double s4 = std::sin(lagna_d2r(aj));
    double b9e = lagna_r2d(std::asin(s3 * s4));
    double c1 = lagna_tan(lagna_d2r(b98));
    double c2 = lagna_tan(lagna_d2r(latDeg));
    // Polar guard: |lat| near 90 deg pushes tan(lat) past the asin domain
    // (circumpolar Lagna is undefined; the 16-bit original had no guard).
    // Clamping keeps the console app finite without touching valid latitudes
    // (Sri Lanka 5-9 deg never exceeds |c1*c2| ~= 0.07).
    auto clamp01 = [](double v) {
        if (v > 1.0) return 1.0;
        if (v < -1.0) return -1.0;
        return v;
    };
    double ba4 = lagna_r2d(std::asin(clamp01(c1 * c2)));
    double c3 = lagna_tan(lagna_d2r(b9e));
    double c4 = lagna_tan(lagna_d2r(latDeg));
    double baa = lagna_r2d(std::asin(clamp01(c3 * c4)));
    double bbc = 90.0 + ba4;
    double bc2 = 90.0 + baa;
    if (aj <= 90.0 && aj >= kLagEdge) aj = kLagEdge;
    double bb0 = lagna_r2d(std::atan(
        (std::sin(ai / 180.0 * kLagPi) / std::cos(ai / 180.0 * kLagPi)) *
        std::cos(kLagKrad)));
    double bb6 = lagna_r2d(std::atan(
        (std::sin(aj / 180.0 * kLagPi) / std::cos(aj / 180.0 * kLagPi)) *
        std::cos(kLagKrad)));
    if (ramc <= 180.0 && ramc >= 0.0) { bb0 += 180.0; bb6 += 180.0; }
    if (ramc <= 360.0 && ramc > 180.0) { bb0 += 360.0; bb6 += 360.0; }
    double bc8 = bb0 - bbc;
    double bce = bb6 - bc2;
    double lagna = ai + (ramc - bc8) * (aj - ai) / (bce - bc8);
    return lagna;
}

}  // namespace star

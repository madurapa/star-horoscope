#pragma once
// STAR.EXE Phase 2 — civil time engine.
// Provenance: PROGRAM 0x11557-0x11a33; sub_2564E (Meeus JD); sub_15FF8 (YMD splitter).
// All magic numbers are exact Borland real48 bit patterns decoded from the
// binary (see docs/math_engine_proofs.md). Display decomposition uses Trunc.

#include <cmath>

#include "AstroStructures.hpp"

namespace star {

// Exact real48 values from the binary (%.17g of the decoded 39-bit mantissa).
inline constexpr double kJ2000Epoch      = 2451545.0;             // 96 6400 15A1
inline constexpr double kJulianCentury   = 36525.0;              // 90 0000 0EAD
inline constexpr double kGmstC3          = 6.199999999997874e-06;// 366F 982F 5009
inline constexpr double kGmstC2          = 0.09310400000003938;   // 047D 4F59 3EAD
inline constexpr double kGmstC1          = 8640184.812866211;    // 1898 B8D0 03D6
inline constexpr double kGmstC0          = 24110.54541000724;    // FB8F 173F 3C5D (cf. Meeus 24110.54841)
inline constexpr double kSecPerDay       = 86400.0;              // 91 0000 28C0
inline constexpr double kSecPerHour      = 3600.0;               // 8C 0000 6100
inline constexpr double kTzHours         = 5.5;                  // 83 0000 3000 (+5:30 hardcoded)
inline constexpr double kSiderealExcess  = 0.00273790929999862;  // 2578 7EE7 336E
inline constexpr double kSiderealRatio   = 1.0027379093007767;   // 7481 B73F 0059
inline constexpr double kDegPerHour      = 15.0;                 // 84 0000 7000
inline constexpr double kIstMeridianDeg  = 82.5;                 // 87 0000 2500
inline constexpr double kHoursPerDay     = 24.0;                 // 85 0000 4000
inline constexpr double kNakshatraSpan   = 13.333333333328483;   // 5584 5555 5555 (40/3 deg)
inline constexpr double kPadaSpan        = 3.3333333333321207;   // 5582 5555 5555 (10/3 deg)
inline constexpr double kYearDays        = 365.0;                // 89 0000 3680 (frac-year day unit)
inline constexpr double kMonthDays       = 30.0;                 // 85 0000 7000 (frac-year month unit)
inline constexpr double kMonthsPerYear   = 12.0;                 // 84 0000 4000

struct YMD { int y = 0, m = 0, d = 0; };
struct HMS { int h = 0, m = 0, s = 0; };

// Meeus Gregorian JD for integer civil day (sub_2564E, day WITHOUT fraction:
// caller adds the UT fraction afterwards). Matches binary Int() semantics via floor.
[[nodiscard]] inline double meeusJdNoon(int y, int m, int d) {
    const int yp = (m > 2) ? y : y - 1;
    const int mp = (m > 2) ? m : m + 12;
    const int a = yp / 100;
    const int b = 2 - a + a / 4;
    return std::floor(365.25 * (yp + 4716)) + std::floor(30.6001 * (mp + 1)) + d + b - 1524.5;
}

// Borland Real48 arithmetic emulation (Session 19d): 40-bit effective
// mantissa (39 stored + implicit leading 1), round-half-even per op.
// PROVEN bit-exact on 4 live 27BE0 dumps (Moon19/Lagna01/Lagna18/Rnd33
// byte-for-byte, incl. the +1e-6-day dust our doubles lack). Only ops
// with big-exponent/small-fraction alignment loss need it in practice
// (the JD sum: ~2^21 epoch + day fraction); same-magnitude ops match to
// ~1e-12 either way. Validated end state: longitude razors caused by JD
// dust (~0.06" via Moon rate) flip identically to the binary.
[[nodiscard]] inline double real48Round(double x) noexcept {
    if (x == 0.0) return 0.0;
    const long double v = static_cast<long double>(x);
    int e = 0;
    frexpl(v, &e);  // v = m * 2^e, m in [0.5, 1)
    static const long double kLn2 = 0.69314718055994530941723212145818L;
    const long double u = expl((e - 40) * kLn2);  // 40-bit ULP
    const long double q = v / u;
    const long double fl = floorl(q);
    const long double frac = q - fl;
    long long qi = static_cast<long long>(fl);
    if (fabsl(frac - 0.5L) < 1e-12L) {
        if (qi % 2 != 0) ++qi;  // half to even
    } else if (frac > 0.5L) {
        ++qi;
    }
    return static_cast<double>(qi * u);
}

[[nodiscard]] inline double r48add(double a, double b) noexcept {
    return real48Round(static_cast<long double>(a) + static_cast<long double>(b));
}
[[nodiscard]] inline double r48sub(double a, double b) noexcept {
    return real48Round(static_cast<long double>(a) - static_cast<long double>(b));
}
[[nodiscard]] inline double r48div(double a, double b) noexcept {
    return real48Round(static_cast<long double>(a) / static_cast<long double>(b));
}

// Binary-faithful birth-decimal-hours and JD construction (sub_2564E +
// fraction path): each op rounded as the RTL does. jdn0 enters exact
// (integer-exact Meeus, verified .50000000 on all live dumps).
[[nodiscard]] inline double birthDecHoursR48(int hour, int minute) noexcept {
    return r48add(hour, r48div(minute, 60.0));
}
[[nodiscard]] inline double julianDateR48(double jdn0, double birthDecH) noexcept {
    return r48add(jdn0, r48div(r48sub(birthDecH, kTzHours), kHoursPerDay));
}

// Fractional civil-year epoch: R = Y + M/12 + D/365 (PROGRAM 0x1656a-0x165bb).
[[nodiscard]] inline constexpr double fracYear(int y, int m, int d) {
    return y + m / kMonthsPerYear + d / kYearDays;
}

// sub_15FF8 replica: fractional years -> civil Y/M/D.
// Y = Trunc, M = Trunc(frac*12) with M==0 carrying to previous December,
// D = Pascal Round (half away from zero; inputs here are positive).
// carry30 replicates the flag-gated D>=30 block (flag never set on the
// dasa path; kept for fidelity).
[[nodiscard]] inline YMD splitYmd(double r, bool carry30 = false) {
    YMD out;
    out.y = static_cast<int>(r);  // Trunc, r > 0
    out.m = static_cast<int>((r - out.y) * kMonthsPerYear);
    if (out.m == 0) { out.y -= 1; out.m = 12; }
    const double f = ((r - out.y) * kMonthsPerYear) - out.m;
    out.d = static_cast<int>(std::floor(f * kMonthDays + 0.5));
    if (carry30 && out.d >= 30) { out.m += 1; out.d = 0; }
    if (carry30 && out.m >= 12) { out.y += 1; out.m = 0; }
    return out;
}

// sub_21EE1 second-carry threshold: real48(5C86 C28F 6FF5) ~= 59.99.
inline constexpr double kSecCarry = 59.98999999999069;

// sub_21EE1 replica: time-table display splitter with second carry.
// Negative clock values wrap by +24 once (Lagna00 fuzz proof: birth 00:00
// -> UT -5:30 prints 18:30:00, true-local -0:08:24 prints 23:51:36; the JD
// chain provably uses the raw negative, so the wrap lives on the display
// path). Positive values >= 24 print raw (Invalid_Time 40:50:00 proof).
// H = Int(X); M = Int(frac*60); S = Round(frac-of-minute*60) with
// Sf >= 59.99 promoting a minute and M >= 59.99 promoting an hour.
// Pascal Round = banker's (half to even): std::nearbyint.
[[nodiscard]] inline HMS displayHms(double hours) {
    if (hours < 0.0) hours += 24.0;  // single conditional add
    HMS out;
    out.h = static_cast<int>(hours);
    out.m = static_cast<int>((hours - out.h) * 60.0);
    double sf = ((hours - out.h) * 60.0 - out.m) * 60.0;
    if (sf >= kSecCarry) { out.m += 1; sf = 0.0; }
    if (static_cast<double>(out.m) >= kSecCarry) { out.h += 1; out.m = 0; }
    out.s = static_cast<int>(std::nearbyint(sf));
    return out;
}

// GMST at 0h (midnight) civil day, in seconds mod 86400 (PROGRAM 0x1159d-0x11673).
[[nodiscard]] inline double gmstMidnightSec(double jdnMidnight) {
    const double t = (jdnMidnight - kJ2000Epoch) / kJulianCentury;
    double s = kGmstC0 + kGmstC1 * t + kGmstC2 * t * t - kGmstC3 * t * t * t;
    s = std::fmod(s, kSecPerDay);
    if (s < 0.0) s += kSecPerDay;
    return s;
}

// Local mean sidereal time, decimal hours (PROGRAM 0x11704-0x118ea):
// LMST = GMST0 + birthLocal + UT*excess - (82.5 - lon)/15.
// Reduction is a SINGLE conditional subtract (NOT mod-24, NOT a loop):
// screen_test proves it across 8 scenarios — Invalid_Time (birth 45:80)
// prints LMST 32:52:45 raw (56.88 needs one subtract to 32.88; a second
// never comes), while Invalid_City/LeapYear/Test User B/Invalid_Leap show exactly
// one subtract (25.55->1.55, 34.39->10.39, 34.44->10.44, 25.86->1.86).
[[nodiscard]] inline double localMeanSiderealHours(double gmst0Hours, double birthDecHours,
                                                    double lonDecDeg) {
    const double ut = birthDecHours - kTzHours;
    double v = gmst0Hours + birthDecHours + ut * kSiderealExcess -
               (kIstMeridianDeg - lonDecDeg) / kDegPerHour;
    if (v >= kHoursPerDay) v -= kHoursPerDay;
    return v;
}

// Printed "Universal Siderial time" = LMST - 5.5 by construction (27B42).
// Single conditional add for negatives (Invalid_City: 1.55-5.5 = -3.95 is
// printed 20:03:14); values >= 24 pass through raw (Invalid_Time 27:22:45).
// Unwrapped likewise (27:22:45 observed raw).
[[nodiscard]] inline double printedUniversalSiderealHours(double lmstHours) {
    double v = lmstHours - kTzHours;
    if (v < 0.0) v += kHoursPerDay;
    return v;
}

// True local mean time = birth - (82.5 - lon)/15 (the 8:24 IST-meridian correction).
[[nodiscard]] inline double trueLocalMeanHours(double birthDecHours, double lonDecDeg) {
    return birthDecHours - (kIstMeridianDeg - lonDecDeg) / kDegPerHour;
}

// Sinhala time (ghati since sunrise) = (birth - sunrise) * 2.5.
// Binary-literal (PROGRAM 0x1255A): negative wraps by +60 ghati (birth
// before today's sunrise counts from yesterday's; display-only path, no
// effect on E02 which rounds the raw value separately).
[[nodiscard]] inline double sinhalaGhati(double birthDecHours, double sunriseDecHours) {
    double g = (birthDecHours - sunriseDecHours) * 2.5;
    if (g < 0.0) g += 60.0;
    return g;
}

}  // namespace star

#pragma once
// STAR.EXE central computation pipeline (Phases 2+3).
// Single source of truth for: JD/UT -> T(1900 epoch for elements) ->
// Sun/Moon/planets/nodes (Nirayana or Sayana) -> LMST -> Lagna.
// Used by CLI::runBaseline, CLI::runVerify and tests/verifier.cpp so all
// three agree by construction.
//
// Epoch notes (see docs/math_engine_proofs.md):
//  - Planetary elements use T1900 = (JD - 2415020.0) / 36525 (dseg 27BEC family).
//  - GMST block uses J2000 (2451545.0); ayanamsa is calibrated Lahiri,
//    exact at the baseline JD (src/Ayanamsa.hpp).
//  - planetSayana(..., nirayana=true) already subtracts the ayanamsa
//    internally: callers must NOT subtract again (a double-subtract bug that
//    lived in the first verifier draft).

#include <cmath>
#include <map>
#include <string>

#include "AstroStructures.hpp"
#include "AstroTime.hpp"
#include "Ayanamsa.hpp"
#include "Avastha.hpp"
#include "Ephemeris.hpp"
#include "Lagna.hpp"
#include "SunriseSunset.hpp"
#include "VargaEngine.hpp"
#include "Panchanga.hpp"

namespace star {

struct HoroscopeResult {
    AstroEngineOutput output;   // ecliptic DMS per body + JD + ayanamsa DMS
    double jd = 0.0;            // full Julian Date (with UT fraction)
    double jdn0 = 0.0;          // midnight JD (integer civil day)
    double ayanamsaDeg = 0.0;   // degrees
    double sunSayanaDeg = 0.0;  // Sayana Sun longitude (for sunrise declination)
    double riseH = 0.0;         // table/model sunrise, local decimal hours
    double setH = 0.0;          // mirrored sunset (24 - rise)
    double moonNirayanaDeg = 0.0;
    double lmstHours = 0.0;
    double latDec = 0.0;
    double lonDec = 0.0;
    double birthDecHours = 0.0;
    PanchangaInfo panchanga;  // five-limb almanac at birth (screen12 block)
};

[[nodiscard]] inline HoroscopeResult computeHoroscope(const HoroscopeOwner& owner,
                                                      const GeoCoord& geo,
                                                      bool nirayana) {
    HoroscopeResult r;
    r.latDec = geo.decimalLat();
    r.lonDec = geo.decimalLon();
    r.birthDecHours = birthDecHoursR48(owner.birth_hour, owner.birth_minute);

    r.jdn0 = meeusJdNoon(owner.birth_year, owner.birth_month, owner.birth_day);
    r.jd = julianDateR48(r.jdn0, r.birthDecHours);
    // Planetary-element century (1900-based, NOT J2000).
    // PROVENANCE: DECODED (elements epoch 2415020.0, dseg 27BEC family; cf. docs/math_engine_proofs.md).
    const double t1900 = (r.jd - 2415020.0) / 36525.0;

    r.ayanamsaDeg = AyanamsaExact(r.jd);

    const SunResult sun = sunResult(t1900);
    r.sunSayanaDeg = sun.lon;
    const double rsun = earthRadius(sun.ecc, sun.MplusC);

    auto norm = [](double v) {
        v = std::fmod(v, 360.0);
        if (v < 0.0) v += 360.0;
        return v;
    };

    const double raviNiray = nirayana ? norm(sun.lon - r.ayanamsaDeg) : norm(sun.lon);
    r.moonNirayanaDeg = nirayana
        ? norm(moonSayana(t1900, sun.MplusC) - r.ayanamsaDeg)
        : norm(moonSayana(t1900, sun.MplusC));

    const double gmst0h = gmstMidnightSec(r.jdn0) / 3600.0;
    r.lmstHours = localMeanSiderealHours(gmst0h, r.birthDecHours, r.lonDec);
    const double lagnaSay = lagnaSayana(r.lmstHours, r.latDec);
    // Lagna is NEVER wrapped down (Invalid_Time displays 591:11:18 raw);
    // negatives wrap up (normUp). Nirayana Lagna = Sayana - ayanamsa raw.
    auto normUp = [](double v) {
        while (v < 0.0) v += 360.0;
        return v;
    };
    const double lagnaNiray =
        nirayana ? normUp(lagnaSay - r.ayanamsaDeg) : normUp(lagnaSay);

    const double rahuNiray = nirayana ? norm(meanNodeSayana(t1900) - r.ayanamsaDeg)
                                      : norm(meanNodeSayana(t1900));
    double ketuNiray = rahuNiray + 180.0;
    if (ketuNiray >= 360.0) ketuNiray -= 360.0;

    std::map<std::string, double> dec;
    dec["Lagna"] = lagnaNiray;
    dec["Chandra"] = r.moonNirayanaDeg;
    dec["Sandu"] = r.moonNirayanaDeg;  // screen05 spelling alias
    dec["Ravi"] = raviNiray;
    for (const auto& kv : kPlanetElements) {
        // planetSayana applies the ayanamsa itself when nirayana=true.
        dec[kv.first] = norm(planetSayana(kv.second, t1900, r.jd, sun.lon, rsun, nirayana));
    }
    dec["Neptune"] = dec["Neptun"];  // canonical alias
    dec["Raahu"] = rahuNiray;
    dec["Rahu"] = rahuNiray;  // dasa-table spelling alias
    dec["Kethu"] = ketuNiray;
    dec["Ketu"] = ketuNiray;  // dasa-table spelling alias

    for (const auto& kv : dec) {
        // Display keeps raw positives (Lagna 591:11:18) and wraps negatives
        // up (Sikuru -13.26 -> 346:44:22); fromDecimal never carries seconds.
        double v = kv.second;
        while (v < 0.0) v += 360.0;
        const AngularDegrees ecl = AngularDegrees::fromDecimal(v);
        const int rasi = VargaEngine::GetRashiIndex(v);
        // Rasi-relative DMS is a RAW component split (no carry): Shani
        // 213:52:60 shows rel 3:52:60, not 3:53:00 (Invalid_City proof).
        const int relD = ecl.deg - (rasi - 1) * 30;
        const AngularDegrees rasiRel{relD, ecl.min, ecl.sec};
        r.output.longitudes[kv.first] = PlanetLongitude{ecl, rasiRel};
    }
    r.output.julianDate = r.jd;
    r.output.ayanamsa = AngularDegrees::fromDecimal(r.ayanamsaDeg);
    // Panchanga limbs follow the display mode: Nirayana positions in N mode
    // (screen12 block), Sayana positions in S mode (TRANSCRI2/4 blocks —
    // e.g. T4 Sita-4 comes from the Sayana Moon 186.50, not Nirayana Hata).
    // Weekday takes the civil-date JD (jdn0), never the full JD+UT
    // (Invalid_Time proof — see Panchanga.hpp).
    r.panchanga = computePanchanga(r.jdn0, raviNiray, r.moonNirayanaDeg);
    // Sunrise via the native mechanism (PROGRAM 0x122D8-0x12586): analytic,
    // deterministic, no tables. Sunset display = 12 - rise (PROGRAM 0x15DD4);
    // setH here keeps the full span (24 - rise) for the Hora day-length, and
    // the renderer prints it %12, which is display-identical to 12 - rise.
    const NativeSun nts = nativeSunrise(owner.birth_year, owner.birth_month,
                                        owner.birth_day, r.birthDecHours,
                                        r.latDec, r.lonDec);
    r.riseH = nts.riseH;
    r.setH = 24.0 - nts.riseH;
    // Avastha (sub_23A58 formula) over MODE longitudes + E02.
    const long e02 = avasthaE02(r.birthDecHours, r.riseH);
    r.output.avastha = avasthaTable(dec, e02);
    return r;
}

}  // namespace star

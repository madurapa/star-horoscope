// Swiss-Ephemeris position feed implementation (Phase-2 step 2).
// Moshier analytic ephemeris (forced via SEFLG_MOSEPH — no data files);
// Lahiri sidereal mode; Equal-house Ascendant for Lagna.

#include "SwissFeed.hpp"

#include <cmath>

#include "swephexp.h"

namespace star {
namespace {

// Planet-order Swiss body numbers; Lagna comes from houses, Kethu is
// derived from the mean node (+180, mirroring the DOS convention).
int swissBody(int planetIdx) {
    // Order: Lagna, Chandra, Ravi, Budha, Sikuru, Kuja, Guru, Shani,
    //        Raahu, Kethu, Urenus, Neptune, Pluto.
    static const int k[13] = {-1, SE_MOON, SE_SUN, SE_MERCURY, SE_VENUS,
                              SE_MARS, SE_JUPITER, SE_SATURN, SE_MEAN_NODE,
                              -1, SE_URANUS, SE_NEPTUNE, SE_PLUTO};
    return (planetIdx >= 0 && planetIdx < 13) ? k[planetIdx] : -1;
}

}  // namespace

SwissFeed computeSwissFeed(double jd, double latDec, double lonDec, bool nirayana) {
    SwissFeed f;
    char serr[256] = {0};
    swe_set_sid_mode(SE_SIDM_LAHIRI, 0, 0);
    f.ayanamsaDeg = swe_get_ayanamsa_ut(jd);

    const int ephFlag = SEFLG_MOSEPH | SEFLG_SPEED;
    const int modeFlag = nirayana ? SEFLG_SIDEREAL : 0;

    // Tropical Sun first (sunrise path; also the Sayana Ravi).
    double xs[6] = {0};
    if (swe_calc_ut(jd, SE_SUN, ephFlag, xs, serr) < 0) {
        f.ok = false;
        f.err = serr;
        return f;
    }
    f.sunSayanaDeg = xs[0];

    // Mode-appropriate bodies (Lagna via houses, Kethu via node below).
    for (int i = 0; i < 13; ++i) {
        if (i == 0 || i == 9) continue;  // Lagna, Kethu handled below
        double xx[6] = {0};
        if (swe_calc_ut(jd, swissBody(i), ephFlag | modeFlag, xx, serr) < 0) {
            f.ok = false;
            f.err = serr;
            return f;
        }
        f.lon[static_cast<std::size_t>(i)] = xx[0];
    }
    // Mean node + derived Kethu (matches the DOS +180 convention).
    const double rahu = f.lon[8];
    double ketu = rahu + 180.0;
    if (ketu >= 360.0) ketu -= 360.0;
    f.lon[9] = ketu;

    // Equal-house Ascendant for Lagna ('E'; sidereal iff Nirayana mode).
    double cusps[13] = {0};
    double ascmc[10] = {0};
    if (swe_houses_ex(jd, SEFLG_MOSEPH | modeFlag, latDec, lonDec, 'E', cusps,
                       ascmc) < 0) {
        f.ok = false;
        f.err = "swe_houses_ex failed";
        return f;
    }
    f.lon[0] = ascmc[0];
    return f;
}

}  // namespace star

// Phase 2 ground-truth tests: screens 12, 14, 15, 16 for
// Test User, 2000-08-17 14:05, Ratnapura 6d37'/80d24', Nirayana.
// Build: g++ -std=c++2a -Wall -Wextra -I../src test_phase2.cpp -o test_phase2
#include <cmath>
#include <cstdio>
#include <string>

#include "../src/Vimshottari.hpp"

static int g_fail = 0;
#define CHECK(cond, ...) do { \
    if (!(cond)) { ++g_fail; std::printf("FAIL %d: ", __LINE__); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)
#define CHECK_YMD(got, ey, em, ed, tag) \
    CHECK((got).y == (ey) && (got).m == (em) && (got).d == (ed), \
          "%s got %d-%d-%d want %d-%d-%d", tag, (got).y, (got).m, (got).d, ey, em, ed)
#define CHECK_HMS(got, eh, em, es, tag) \
    CHECK((got).h == (eh) && (got).m == (em) && (got).s == (es), \
          "%s got %d:%d:%d want %d:%d:%d", tag, (got).h, (got).m, (got).s, eh, em, es)

int main() {
    using namespace star;
    const double birthDec = 14.0 + 5.0 / 60.0;
    const double lonDec = 80.0 + 24.0 / 60.0;

    // ---- screen12 time engine ----
    const double jdn0 = meeusJdNoon(2000, 8, 17);
    CHECK(std::fabs(jdn0 - 2451773.5) < 1e-9, "jdn0=%f", jdn0);
    const double ut = birthDec - kTzHours;
    CHECK_HMS(displayHms(ut), 8, 35, 0, "UT");
    CHECK_HMS(displayHms(birthDec), 14, 5, 0, "birth");
    CHECK(std::fabs((jdn0 + ut / 24.0) - 2451773.858) < 5e-4, "jd=%f", jdn0 + ut / 24.0);
    const double gmst0h = gmstMidnightSec(jdn0) / 3600.0;
    const double lmst = localMeanSiderealHours(gmst0h, birthDec, lonDec);
    CHECK_HMS(displayHms(lmst), 11, 40, 44, "LMST");
    CHECK_HMS(displayHms(printedUniversalSiderealHours(lmst)), 6, 10, 44, "UT-sidereal");
    CHECK_HMS(displayHms(trueLocalMeanHours(birthDec, lonDec)), 13, 56, 36, "TLMT");
    // Sinhala ghati from screen sunrise 6:02:45 -> 20:05:37
    const double sunrise = 6.0 + 2.0 / 60.0 + 45.0 / 3600.0;
    const double ghati = sinhalaGhati(birthDec, sunrise);
    CHECK(static_cast<int>(ghati) == 20, "ghati=%f", ghati);
    // Razor dust: engine 20:05:38 vs DOS 20:05:37 (Real48-vs-double dust
    // at a .5s rounding boundary, same class as docs/quirks.md; both
    // accepted like the 23|24 balance razor in CLI.cpp).
    { const HMS sh = displayHms(ghati);
      CHECK(sh.h == 20 && sh.m == 5 && (sh.s == 37 || sh.s == 38),
            "sinhala got %d:%d:%d want 20:5:37(38)", sh.h, sh.m, sh.s); }

    // ---- dasa balance (Moon 325d6'45") ----
    const double moon = 325.0 + 6.0 / 60.0 + 45.0 / 3600.0;
    CHECK(nakshatraNumber(moon) == 25, "nak");
    CHECK(nakshatraPada(moon) == 2, "pada");
    const DasaBalance bal = dasaBalance(moon);
    CHECK(std::string(kDasaCycle[bal.lordCycleIdx].name) == "Guru", "lord=%s",
          kDasaCycle[bal.lordCycleIdx].name);
    CHECK_YMD(bal.ymd, 9, 10, 11, "balance");

    // ---- maha boundaries (screens 14-16) ----
    const YMD birth{2000, 8, 17};
    const double r0 = fracYear(2000, 8, 17);
    const auto mahas = mahaTimeline(birth, r0, bal);
    const struct { const char* lord; YMD to; YMD ageTo; } wantMaha[9] = {
        {"Guru", {2010,6,28}, {9,10,11}}, {"Shani", {2029,6,28}, {28,10,11}},
        {"Budha", {2046,6,28}, {45,10,11}}, {"Ketu", {2053,6,28}, {52,10,11}},
        {"Sikuru", {2073,6,28}, {72,10,11}}, {"Ravi", {2079,6,28}, {78,10,11}},
        {"Sandu", {2089,6,28}, {88,10,11}}, {"Kuja", {2096,6,28}, {95,10,11}},
        {"Rahu", {2114,6,28}, {113,10,11}},
    };
    CHECK(mahas.size() == 9, "maha count");
    for (int i = 0; i < 9; ++i) {
        CHECK(mahas[i].lord == wantMaha[i].lord, "maha%d lord=%s", i, mahas[i].lord.c_str());
        CHECK_YMD(mahas[i].to, wantMaha[i].to.y, wantMaha[i].to.m, wantMaha[i].to.d, "maha-to");
        CHECK_YMD(mahas[i].ageTo, wantMaha[i].ageTo.y, wantMaha[i].ageTo.m,
                  wantMaha[i].ageTo.d, "maha-ageTo");
    }
    CHECK_YMD(mahas[0].from, 2000, 8, 17, "maha0-from");
    CHECK_YMD(mahas[0].ageFrom, 0, 0, 0, "maha0-ageFrom");

    // ---- Shani bhukti full row (screen16) ----
    // Shani maha = mahas[1]: from 2010-06-28, 19 years, lord idx 7.
    const double shaniStart = fracYear(2010, 6, 28);
    const auto kb = bhuktiTimeline(birth, shaniStart, 7, 19.0);
    const struct { const char* lord; YMD to; YMD ageTo; } wantKb[9] = {
        {"Shani", {2013,7,1}, {12,10,14}}, {"Budha", {2016,3,10}, {15,6,23}},
        {"Ketu", {2017,4,19}, {16,8,2}}, {"Sikuru", {2020,6,19}, {19,10,2}},
        {"Ravi", {2021,6,1}, {20,9,14}}, {"Sandu", {2023,1,1}, {22,4,14}},
        {"Kuja", {2024,2,10}, {23,5,23}}, {"Rahu", {2026,12,16}, {26,3,29}},
        {"Guru", {2029,6,28}, {28,10,11}},
    };
    for (int i = 0; i < 9; ++i) {
        CHECK(kb[i].lord == wantKb[i].lord, "kb%d lord=%s", i, kb[i].lord.c_str());
        CHECK_YMD(kb[i].to, wantKb[i].to.y, wantKb[i].to.m, wantKb[i].to.d, "kb-to");
        CHECK_YMD(kb[i].ageTo, wantKb[i].ageTo.y, wantKb[i].ageTo.m, wantKb[i].ageTo.d,
                  "kb-ageTo");
    }
    CHECK_YMD(kb[0].ageFrom, 9, 10, 11, "kb0-ageFrom");

    // ---- Guru maha bhukti tail (screen15): Budha 2000-08-17 -> 2001-06-04 ... Rahu -> 2010-06-28
    // Balance starts partway through Guru maha, so only the tail prints.
    const auto guruB = bhuktiTimeline(birth, r0, 6, bal.years, balanceElapsedUnits(moon),
                                        static_cast<double>(kDasaCycle[6].years));
    CHECK(guruB.size() == 7, "guru tail count=%u", (unsigned)guruB.size());
    CHECK(guruB[0].lord == "Budha", "gurub0=%s", guruB[0].lord.c_str());
    CHECK_YMD(guruB[0].from, 2000, 8, 17, "guru-budha-from");
    CHECK_YMD(guruB[0].to, 2001, 6, 4, "guru-budha-to");
    CHECK_YMD(guruB[0].ageTo, 0, 9, 17, "guru-budha-age");
    CHECK(guruB[6].lord == "Rahu", "gurub6=%s", guruB[6].lord.c_str());
    CHECK_YMD(guruB[6].to, 2010, 6, 28, "guru-rahu-to");
    CHECK_YMD(guruB[6].ageTo, 9, 10, 11, "guru-rahu-age");

    // ---- Budha maha first bhukti (screen16): Budha -> 2031-11-25
    const auto vb = bhuktiTimeline(birth, fracYear(2029, 6, 28), 8, 17.0);
    CHECK_YMD(vb[0].to, 2031, 11, 25, "budha-budha-to");
    CHECK_YMD(vb[0].ageTo, 31, 3, 8, "budha-budha-age");

    if (g_fail == 0) std::printf("PHASE2_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

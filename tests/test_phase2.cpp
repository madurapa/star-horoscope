// Phase 2 ground-truth tests: screens 12, 14, 15, 16 for
// Test User, 1981-12-08 12:55, Ratnapura 6d37'/80d24', Nirayana.
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
    const double birthDec = 12.0 + 55.0 / 60.0;
    const double lonDec = 80.0 + 24.0 / 60.0;

    // ---- screen12 time engine ----
    const double jdn0 = meeusJdNoon(1981, 12, 8);
    CHECK(std::fabs(jdn0 - 2444946.5) < 1e-9, "jdn0=%f", jdn0);
    const double ut = birthDec - kTzHours;
    CHECK_HMS(displayHms(ut), 7, 25, 0, "UT");
    CHECK_HMS(displayHms(birthDec), 12, 55, 0, "birth");
    CHECK(std::fabs((jdn0 + ut / 24.0) - 2444946.809) < 5e-4, "jd=%f", jdn0 + ut / 24.0);
    const double gmst0h = gmstMidnightSec(jdn0) / 3600.0;
    const double lmst = localMeanSiderealHours(gmst0h, birthDec, lonDec);
    CHECK_HMS(displayHms(lmst), 17, 54, 29, "LMST");
    CHECK_HMS(displayHms(printedUniversalSiderealHours(lmst)), 12, 24, 29, "UT-sidereal");
    CHECK_HMS(displayHms(trueLocalMeanHours(birthDec, lonDec)), 12, 46, 36, "TLMT");
    // Sinhala ghati from screen sunrise 6:08:15 -> 16:56:52
    const double sunrise = 6.0 + 8.0 / 60.0 + 15.0 / 3600.0;
    const double ghati = sinhalaGhati(birthDec, sunrise);
    CHECK(static_cast<int>(ghati) == 16, "ghati=%f", ghati);
    CHECK_HMS(displayHms(ghati), 16, 56, 52, "sinhala");

    // ---- dasa balance (Moon 9d23'49") ----
    const double moon = 9.0 + 23.0 / 60.0 + 49.0 / 3600.0;
    CHECK(nakshatraNumber(moon) == 1, "nak");
    CHECK(nakshatraPada(moon) == 3, "pada");
    const DasaBalance bal = dasaBalance(moon);
    CHECK(std::string(kDasaCycle[bal.lordCycleIdx].name) == "Ketu", "lord=%s",
          kDasaCycle[bal.lordCycleIdx].name);
    CHECK_YMD(bal.ymd, 2, 0, 23, "balance");

    // ---- maha boundaries (screens 14-16) ----
    const YMD birth{1981, 12, 8};
    const double r0 = fracYear(1981, 12, 8);
    const auto mahas = mahaTimeline(birth, r0, bal);
    const struct { const char* lord; YMD to; YMD ageTo; } wantMaha[9] = {
        {"Ketu", {1984,1,2}, {2,0,24}}, {"Sikuru", {2004,1,2}, {22,0,24}},
        {"Ravi", {2010,1,2}, {28,0,24}}, {"Sandu", {2020,1,2}, {38,0,24}},
        {"Kuja", {2027,1,2}, {45,0,24}}, {"Rahu", {2045,1,2}, {63,0,24}},
        {"Guru", {2061,1,2}, {79,0,24}}, {"Shani", {2080,1,2}, {98,0,24}},
        {"Budha", {2097,1,2}, {115,0,24}},
    };
    CHECK(mahas.size() == 9, "maha count");
    for (int i = 0; i < 9; ++i) {
        CHECK(mahas[i].lord == wantMaha[i].lord, "maha%d lord=%s", i, mahas[i].lord.c_str());
        CHECK_YMD(mahas[i].to, wantMaha[i].to.y, wantMaha[i].to.m, wantMaha[i].to.d, "maha-to");
        CHECK_YMD(mahas[i].ageTo, wantMaha[i].ageTo.y, wantMaha[i].ageTo.m,
                  wantMaha[i].ageTo.d, "maha-ageTo");
    }
    CHECK_YMD(mahas[0].from, 1981, 12, 8, "maha0-from");
    CHECK_YMD(mahas[0].ageFrom, 0, 0, 0, "maha0-ageFrom");

    // ---- Kuja bhukti full row (screen15) ----
    // Kuja maha = mahas[4]: from 2020-01-02, 7 years, lord idx 4.
    const double kujaStart = fracYear(2020, 1, 2);
    const auto kb = bhuktiTimeline(birth, kujaStart, 4, 7.0);
    const struct { const char* lord; YMD to; YMD ageTo; } wantKb[9] = {
        {"Kuja", {2020,5,29}, {38,5,21}}, {"Rahu", {2021,6,17}, {39,6,9}},
        {"Guru", {2022,5,23}, {40,5,15}}, {"Shani", {2023,7,2}, {41,6,24}},
        {"Budha", {2024,6,29}, {42,6,21}}, {"Ketu", {2024,11,26}, {42,11,18}},
        {"Sikuru", {2026,1,26}, {44,1,18}}, {"Ravi", {2026,6,2}, {44,5,24}},
        {"Sandu", {2027,1,2}, {45,0,24}},
    };
    for (int i = 0; i < 9; ++i) {
        CHECK(kb[i].lord == wantKb[i].lord, "kb%d lord=%s", i, kb[i].lord.c_str());
        CHECK_YMD(kb[i].to, wantKb[i].to.y, wantKb[i].to.m, wantKb[i].to.d, "kb-to");
        CHECK_YMD(kb[i].ageTo, wantKb[i].ageTo.y, wantKb[i].ageTo.m, wantKb[i].ageTo.d,
                  "kb-ageTo");
    }
    CHECK_YMD(kb[0].ageFrom, 38, 0, 24, "kb0-ageFrom");

    // ---- Ketu maha bhukti tail (screen14): Shani 1981-12-08 -> 1983-01-05, Budha -> 1984-01-02
    // Balance starts 84.57 of 120 units in, so only the Saturn tail + Mercury print.
    const auto ketuB = bhuktiTimeline(birth, r0, 0, bal.years, balanceElapsedUnits(moon),
                                        static_cast<double>(kDasaCycle[0].years));
    CHECK(ketuB.size() == 2, "ketu tail count=%u", (unsigned)ketuB.size());
    CHECK(ketuB[0].lord == "Shani", "ketub0=%s", ketuB[0].lord.c_str());
    CHECK_YMD(ketuB[0].from, 1981, 12, 8, "ketu-shani-from");
    CHECK_YMD(ketuB[0].to, 1983, 1, 5, "ketu-shani-to");
    CHECK_YMD(ketuB[0].ageTo, 1, 0, 27, "ketu-shani-age");
    CHECK(ketuB[1].lord == "Budha", "ketub1=%s", ketuB[1].lord.c_str());
    CHECK_YMD(ketuB[1].to, 1984, 1, 2, "ketu-budha-to");
    CHECK_YMD(ketuB[1].ageTo, 2, 0, 24, "ketu-budha-age");

    // ---- Venus maha first bhukti (screen14): Sikuru -> 1987-05-02
    const auto vb = bhuktiTimeline(birth, fracYear(1984, 1, 2), 1, 20.0);
    CHECK_YMD(vb[0].to, 1987, 5, 2, "venus-sikuru-to");
    CHECK_YMD(vb[0].ageTo, 5, 4, 24, "venus-sikuru-age");

    if (g_fail == 0) std::printf("PHASE2_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

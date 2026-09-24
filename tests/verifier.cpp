// Engine verification harness (docs/remove_legacy.md R3+R4).
// Dual-engine since R4: the DOS block pins reconstruction values
// (AGENTS.md checkpoints) while the SWISS block pins swisseph values
// recorded in Session 127. Legacy screen renders and golden files are
// removed; shared engine-identical limbs (panchanga, houses, hora,
// chakra, JD, sunrise) are asserted once via the DOS block.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/verifier.cpp src/VargaEngine.cpp -o verifier
// Usage: ./verifier

#include <cmath>
#include <cstdio>
#include <string>
#include <vector>

#include "AstroStructures.hpp"
#include "AstroTime.hpp"
#include "Ayanamsa.hpp"
#include "Engine.hpp"
// R2 TODO: verifier needs only rasiName/findLongitude from here; relocate
// those engine-access helpers out of the legacy renderer header, then drop.
#include "ScreenRenderer.hpp"
#include "SunriseSunset.hpp"
#include "Vimshottari.hpp"

using namespace star;

static int g_pass = 0, g_fail = 0;

static void checkDms(const char* tag, double gotDec, int d, int m, int s, double tolSec) {
    const double want = d + m / 60.0 + s / 3600.0;
    const double err = std::fabs(gotDec - want) * 3600.0;
    if (err > tolSec) {
        ++g_fail;
        std::printf("FAIL %-12s got %.5f want %d:%d:%d (err %.2f\")\n", tag, gotDec, d, m, s, err);
    } else {
        ++g_pass;
        std::printf("ok   %-12s got %.5f want %d:%d:%d (err %.2f\")\n", tag, gotDec, d, m, s, err);
    }
}

static void checkYmd(const char* tag, YMD got, int y, int m, int d) {
    if (got.y != y || got.m != m || got.d != d) {
        ++g_fail;
        std::printf("FAIL %-12s got %d-%d-%d want %d-%d-%d\n", tag, got.y, got.m, got.d, y, m, d);
    } else {
        ++g_pass;
        std::printf("ok   %-12s %d-%d-%d\n", tag, got.y, got.m, got.d);
    }
}

static void checkStr(const char* tag, const std::string& got, const char* want) {
    if (got != want) {
        ++g_fail;
        std::printf("FAIL %-12s got '%s' want '%s'\n", tag, got.c_str(), want);
    } else {
        ++g_pass;
        std::printf("ok   %-12s '%s'\n", tag, got.c_str());
    }
}

static void checkInt(const char* tag, int got, int want) {
    if (got != want) {
        ++g_fail;
        std::printf("FAIL %-12s got %d want %d\n", tag, got, want);
    } else {
        ++g_pass;
        std::printf("ok   %-12s %d\n", tag, got);
    }
}

int main() {
    // Baseline scenario (AGENTS.md): Test User, 2000-08-17 14:05,
    // Ratnapura (7), Nirayana.
    const HoroscopeOwner owner{"Test User", 2000, 8, 17, 14, 5};
    const GeoCoord geo = cityByIndex(7).coord;
    const HoroscopeResult h = computeHoroscope(owner, geo, true, EngineKind::Dos);

    std::printf("=== CHECKPOINT 1: house table longitudes (screen05) ===\n");
    const auto lon = [&](const char* k) {
        return findLongitude(h.output, k)->ecliptic.toDecimal();
    };
    checkDms("Lagna", lon("Lagna"), 239, 7, 8, 2.0);
    checkDms("Chandra", lon("Chandra"), 325, 6, 45, 2.0);
    checkDms("Ravi", lon("Ravi"), 120, 55, 1, 2.0);
    checkDms("Budha", lon("Budha"), 115, 59, 17, 2.0);
    checkDms("Sikuru", lon("Sikuru"), 139, 14, 48, 2.0);
    checkDms("Kuja", lon("Kuja"), 106, 40, 47, 2.0);
    checkDms("Guru", lon("Guru"), 44, 29, 23, 2.0);
    checkDms("Shani", lon("Shani"), 36, 36, 38, 2.0);
    checkDms("Raahu", lon("Raahu"), 89, 5, 27, 2.0);
    checkDms("Kethu", lon("Kethu"), 269, 5, 27, 2.0);

    std::printf("=== CHECKPOINT 2: shadvarga seats (screen06) ===\n");
    const auto seat = [&](const char* planet, int vargaIdx) {
        const double dec = findLongitude(h.output, planet)->ecliptic.toDecimal();
        return rasiName(VargaEngine::GetShadvarga(dec)[vargaIdx]);
    };
    // GetShadvarga order: {Rashi, Navamsa, Hora, Deshkana, Dvadasansa, Trishansa}.
    checkStr("Lagna-Rashi", seat("Lagna", 0), "Wrschika");
    checkStr("Lagna-Navamsa", seat("Lagna", 1), "Meena");
    checkStr("Lagna-Hora", seat("Lagna", 2), "Sinha");
    checkStr("Lagna-Deshkana", seat("Lagna", 3), "Kataka");
    checkStr("Lagna-Dvadasansa", seat("Lagna", 4), "Thula");
    checkStr("Lagna-Trishansa", seat("Lagna", 5), "Wrushaba");
    checkStr("Ravi-Rashi", seat("Ravi", 0), "Sinha");
    checkStr("Ravi-Navamsa", seat("Ravi", 1), "Mesha");
    checkStr("Ravi-Hora", seat("Ravi", 2), "Sinha");
    checkStr("Ravi-Deshkana", seat("Ravi", 3), "Sinha");
    checkStr("Ravi-Dvadasansa", seat("Ravi", 4), "Sinha");
    checkStr("Ravi-Trishansa", seat("Ravi", 5), "Mesha");

    std::printf("=== CHECKPOINT 3: time engine + precession (screen12) ===\n");
    if (std::fabs(h.jd - 2451773.858) > 5e-4) {
        ++g_fail;
        std::printf("FAIL JD          got %.6f want 2451773.858\n", h.jd);
    } else {
        ++g_pass;
        std::printf("ok   JD          %.6f\n", h.jd);
    }
    const HMS ut = displayHms(h.birthDecHours - kTzHours);
    if (ut.h != 8 || ut.m != 35 || ut.s != 0) {
        ++g_fail;
        std::printf("FAIL UT          got %d:%d:%d want 8:35:0\n", ut.h, ut.m, ut.s);
    } else {
        ++g_pass;
        std::printf("ok   UT          8:35:0\n");
    }
    const AngularDegrees ay = AngularDegrees::fromDecimal(h.ayanamsaDeg);
    if (ay.deg != 23 || ay.min != 50 || ay.sec != 1) {
        ++g_fail;
        std::printf("FAIL Ayanamsa   got %d:%d:%d want 23:50:1\n", ay.deg, ay.min, ay.sec);
    } else {
        ++g_pass;
        std::printf("ok   Ayanamsa   23:50:1\n");
    }

    std::printf("=== PANCHANGAYA (screen12) ===\n");
    checkStr("Day", h.panchanga.weekday, "Thursday");
    checkStr("Neketha", h.panchanga.nakshatra, "Puvaputupa");
    if (h.panchanga.pada != 2) {
        ++g_fail;
        std::printf("FAIL Pada        got %d want 2\n", h.panchanga.pada);
    } else {
        ++g_pass;
        std::printf("ok   Pada        2\n");
    }
    checkStr("Thithiya", h.panchanga.tithiText, "Ava -Thiyawaka  - 3");
    checkStr("Yogaya", h.panchanga.yoga, "Sukarna");
    checkStr("Karanaya", h.panchanga.karana, "Kavlava");

    std::printf("=== CHECKPOINT 4: dasa timelines (screen14-16) ===\n");
    const YMD birth{2000, 8, 17};
    const double r0 = fracYear(2000, 8, 17);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    if (std::string(kDasaCycle[bal.lordCycleIdx].name) != "Guru" ||
        bal.ymd.y != 9 || bal.ymd.m != 10 || bal.ymd.d != 11) {
        ++g_fail;
        std::printf("FAIL balance    got %s %d-%d-%d want Guru 9-10-11\n",
                    kDasaCycle[bal.lordCycleIdx].name, bal.ymd.y, bal.ymd.m, bal.ymd.d);
    } else {
        ++g_pass;
        std::printf("ok   balance    %s %d-%d-%d (screen: Guru 9-10-11)\n",
                    kDasaCycle[bal.lordCycleIdx].name, bal.ymd.y, bal.ymd.m, bal.ymd.d);
    }
    const std::vector<DasaSpan> mahas = mahaTimeline(birth, r0, bal);
    checkYmd("Guru-end", mahas[0].to, 2010, 6, 28);
    checkYmd("Kuja-start", mahas[7].from, 2089, 6, 28);
    checkYmd("Kuja-end", mahas[7].to, 2096, 6, 28);
    const std::vector<DasaSpan> kb = bhuktiTimeline(birth, fracYear(2089, 6, 28), 4, 7.0);
    checkYmd("Kuja-Sikuru", kb[6].to, 2095, 7, 22);
    checkYmd("Kuja-Ravi", kb[7].to, 2095, 11, 28);
    checkYmd("Kuja-Sandu", kb[8].to, 2096, 6, 28);

    // ---- Baseline AVASTHA column (exact engine states) ----
    std::printf("=== AVASTHA (screen05) ===\n");
    const std::vector<std::pair<std::string, const char*>> avExp = {
        {"Chandra", "Bhojana"}, {"Ravi", "Nethrapani"}, {"Budha", "Gamana"},
        {"Sikuru", "Gamana"}, {"Kuja", "AAgama"}, {"Guru", "Gamana"},
        {"Shani", "AAgama"}, {"Raahu", "Gamana"}, {"Kethu", "Kavthuka"},
    };
    for (const auto& av : avExp) {
        int pi = -1;
        for (int i = 0; i < 13; ++i)
            if (av.first == kPlanetNames[static_cast<std::size_t>(i)]) pi = i;
        const char* got =
            (pi < 0) ? "" : h.output.avastha[static_cast<std::size_t>(pi)].c_str();
        checkStr(("Av-" + av.first).c_str(), got, av.second);
    }

    // ---- TRANSCRI3 scenario (2026-09-12 16:54 Colombo, Nirayana) ----
    std::printf("=== TRANSCRI3 Nirayana display-exact ===\n");
    const HoroscopeOwner o3{"Thatkala Kendra", 2026, 9, 12, 16, 54};
    const HoroscopeResult h3 =
        computeHoroscope(o3, kColomboFallback, true, EngineKind::Dos);
        const struct {
            const char* k;
            int d, m, s;
        } cells[] = {
            {"Lagna", 304, 31, 20}, {"Chandra", 162, 16, 44}, {"Ravi", 145, 31, 46},
            {"Budha", 158, 48, 50}, {"Sikuru", 187, 9, 27}, {"Kuja", 86, 21, 56},
            {"Guru", 111, 53, 32}, {"Shani", 348, 43, 6}, {"Raahu", 304, 29, 39},
            {"Kethu", 124, 29, 39}, {"Urenus", 41, 45, 50}, {"Neptune", 339, 3, 9},
            {"Pluto", 278, 40, 3},
        };
        for (const auto& c : cells) {
            const AngularDegrees got = findLongitude(h3.output, c.k)->ecliptic;
            const AngularDegrees want{c.d, c.m, c.s};
            if (got == want) {
                ++g_pass;
                std::printf("ok   T3-%-8s %d:%d:%d\n", c.k, got.deg, got.min, got.sec);
            } else {
                ++g_fail;
                std::printf("FAIL T3-%-8s got %d:%d:%d want %d:%d:%d\n", c.k, got.deg,
                            got.min, got.sec, want.deg, want.min, want.sec);
            }
        }

    // ---- TRANSCRI3 dasa + panchanga (Chandra 8-3-14; Saturday/Hata-1) ----
    {
        const DasaBalance b3 = dasaBalance(h3.moonNirayanaDeg);
        if (std::string(kDasaCycle[b3.lordCycleIdx].name) != "Sandu" && std::string(kDasaCycle[b3.lordCycleIdx].name) != "Chandra") {
            ++g_fail;
            std::printf("FAIL T3-balance-lord %s\n", kDasaCycle[b3.lordCycleIdx].name);
        } else {
            ++g_pass;
            std::printf("ok   T3-balance-lord %s\n", kDasaCycle[b3.lordCycleIdx].name);
        }
        // Note: kDasaCycle uses "Sandu" spelling (dasa-table slot, independent of Engine keys).
        checkYmd("T3-balance", b3.ymd, 8, 3, 14);
        checkStr("T3-day", h3.panchanga.weekday, "Saturday");
        checkStr("T3-neketha", h3.panchanga.nakshatra, "Hata");
        if (h3.panchanga.pada != 1) {
            ++g_fail;
            std::printf("FAIL T3-pada %d\n", h3.panchanga.pada);
        } else {
            ++g_pass;
            std::printf("ok   T3-pada 1\n");
        }
        checkStr("T3-thithiya", h3.panchanga.tithiText, "Pura-Diyawaka   - 2");
        checkStr("T3-yogaya", h3.panchanga.yoga, "Shubra");
        checkStr("T3-karanaya", h3.panchanga.karana, "Baalava");
    }

    // ---- Scenario 1: baseline Sayana house table (TRANSCRI2, 13 cells) ----
    std::printf("=== Scenario-1 Sayana display-exact (TRANSCRI2) ===\n");
    {
        const HoroscopeOwner o1{"Test User", 2000, 8, 17, 14, 5};
        const HoroscopeResult h1 =
            computeHoroscope(o1, cityByIndex(7).coord, false, EngineKind::Dos);
        const struct {
            const char* k;
            int d, m, s;
        } cells[] = {
            {"Lagna", 262, 57, 9}, {"Chandra", 348, 56, 46}, {"Ravi", 144, 45, 2},
            {"Budha", 139, 49, 18}, {"Sikuru", 163, 4, 49}, {"Kuja", 130, 30, 48},
            {"Guru", 68, 19, 24}, {"Shani", 60, 26, 39}, {"Raahu", 112, 55, 28},
            {"Kethu", 292, 55, 28}, {"Urenus", 318, 48, 7}, {"Neptune", 304, 33, 24},
            {"Pluto", 249, 49, 56},
        };
        for (const auto& c : cells) {
            const AngularDegrees got = findLongitude(h1.output, c.k)->ecliptic;
            const AngularDegrees want{c.d, c.m, c.s};
            if (got == want) {
                ++g_pass;
                std::printf("ok   S1-%-8s %d:%d:%d\n", c.k, got.deg, got.min, got.sec);
            } else {
                ++g_fail;
                std::printf("FAIL S1-%-8s got %d:%d:%d want %d:%d:%d\n", c.k, got.deg,
                            got.min, got.sec, want.deg, want.min, want.sec);
            }
        }
        // Sayana-mode balance follows the Sayana Moon (TRANSCRI2 dasa opens
        // Budha Maha 2000-08-17 -> 2014-09-20).
        const DasaBalance b1 = dasaBalance(h1.moonNirayanaDeg);
        checkStr("S1-bal-lord", kDasaCycle[b1.lordCycleIdx].name, "Budha");
        const YMD birth1{2000, 8, 17};
        const auto mahas1 = mahaTimeline(birth1, fracYear(2000, 8, 17), b1);
        checkYmd("S1-Budha-end", mahas1[0].to, 2014, 9, 20);
    }

    // ---- TRANSCRI4 scenario (2026-09-12 16:57 Colombo, Sayana) ----
    std::printf("=== TRANSCRI4 Sayana display-exact ===\n");
    {
        const HoroscopeOwner o4{"Thatkala Kendra", 2026, 9, 12, 16, 57};
        const HoroscopeResult h4 =
            computeHoroscope(o4, kColomboFallback, false, EngineKind::Dos);
        const struct {
            const char* k;
            int d, m, s;
        } cells[] = {
            {"Lagna", 329, 32, 36}, {"Chandra", 186, 30, 17}, {"Ravi", 169, 43, 46},
            {"Budha", 183, 0, 55}, {"Sikuru", 211, 21, 25}, {"Kuja", 110, 33, 53},
            {"Guru", 136, 5, 26}, {"Shani", 12, 54, 59}, {"Raahu", 328, 41, 32},
            {"Kethu", 148, 41, 32}, {"Urenus", 65, 57, 43}, {"Neptune", 3, 15, 2},
            {"Pluto", 302, 51, 55},
        };
        for (const auto& c : cells) {
            const AngularDegrees got = findLongitude(h4.output, c.k)->ecliptic;
            const AngularDegrees want{c.d, c.m, c.s};
            if (got == want) {
                ++g_pass;
                std::printf("ok   T4-%-8s %d:%d:%d\n", c.k, got.deg, got.min, got.sec);
            } else {
                ++g_fail;
                std::printf("FAIL T4-%-8s got %d:%d:%d want %d:%d:%d\n", c.k, got.deg,
                            got.min, got.sec, want.deg, want.min, want.sec);
            }
        }
    }

    // ---- TRANSCRI4 dasa + panchanga (Kuja 0-1-0; Saturday/Sita-4) ----
    {
        const HoroscopeOwner o4b{"Thatkala Kendra", 2026, 9, 12, 16, 57};
        const HoroscopeResult h4b =
            computeHoroscope(o4b, kColomboFallback, false, EngineKind::Dos);
        const DasaBalance b4 = dasaBalance(h4b.moonNirayanaDeg);
        checkStr("T4-bal-lord", kDasaCycle[b4.lordCycleIdx].name, "Kuja");
        checkYmd("T4-balance", b4.ymd, 0, 1, 0);
        checkStr("T4-day", h4b.panchanga.weekday, "Saturday");
        checkStr("T4-neketha", h4b.panchanga.nakshatra, "Sita");
        if (h4b.panchanga.pada != 4) {
            ++g_fail;
            std::printf("FAIL T4-pada %d\n", h4b.panchanga.pada);
        } else {
            ++g_pass;
            std::printf("ok   T4-pada 4\n");
        }
        checkStr("T4-thithiya", h4b.panchanga.tithiText, "Pura-Diyawaka   - 2");
        checkStr("T4-yogaya", h4b.panchanga.yoga, "Vydruthi");
        checkStr("T4-karanaya", h4b.panchanga.karana, "Baalava");
    }

    // ---- Native sunrise mechanism (no tables): must reproduce the DOS
    // 2026-09-12 Colombo sunrise display (rise 6:01:28, set 5:58:32). ----
    {
        // Native mechanism must reproduce the DOS 2026-09-12 Colombo
        // sunrise display (rise 6:01:28, set printed 5:58:32).
        const NativeSun t3sun = nativeSunrise(2026, 9, 12, 16.0 + 54.0 / 60.0,
                                              kColomboFallback.decimalLat(),
                                              kColomboFallback.decimalLon());
        const double riseH = t3sun.riseH;
        const double setH = 24.0 - t3sun.riseH;
        const HMS rr = displayHms(riseH);
        HMS ss = displayHms(setH);
        ss.h %= 12;
        checkInt("T3-rise-h", rr.h, 6);
        checkInt("T3-rise-m", rr.m, 1);
        checkInt("T3-rise-s", rr.s, 28);
        checkInt("T3-set-h", ss.h, 5);
        checkInt("T3-set-m", ss.m, 58);
        checkInt("T3-set-s", ss.s, 32);
    }

    // ---- SWISS ENGINE (dual block, R4 ruling 2026-09-24) ----
    // Same baseline profile through the Swiss backend. Expectations were
    // recorded from swisseph output (Session 127 probe) and frozen here;
    // the DOS block above stays as the reconstruction reference. Panchanga,
    // houses, hora, chakra, JD and sunrise are engine-identical (probe) and
    // are not duplicated; full Swiss text is pinned by test_swiss_goldens.
    std::printf("=== SWISS ENGINE (dual block) ===\n");
    const HoroscopeResult hs = computeHoroscope(owner, geo, true, EngineKind::Swiss);
    if (!hs.engineOk) {
        ++g_fail;
        std::printf("FAIL Swiss-engine %s\n", hs.engineError.c_str());
    } else {
        const auto slon = [&](const char* k) {
            return findLongitude(hs.output, k)->ecliptic.toDecimal();
        };
        checkDms("S-Lagna", slon("Lagna"), 239, 5, 18, 2.0);
        checkDms("S-Chandra", slon("Chandra"), 325, 4, 41, 2.0);
        checkDms("S-Ravi", slon("Ravi"), 120, 52, 33, 2.0);
        checkDms("S-Budha", slon("Budha"), 115, 56, 20, 2.0);
        checkDms("S-Sikuru", slon("Sikuru"), 139, 12, 1, 2.0);
        checkDms("S-Kuja", slon("Kuja"), 106, 38, 30, 2.0);
        checkDms("S-Guru", slon("Guru"), 44, 27, 36, 2.0);
        checkDms("S-Shani", slon("Shani"), 36, 30, 39, 2.0);
        checkDms("S-Raahu", slon("Raahu"), 89, 3, 35, 2.0);
        checkDms("S-Kethu", slon("Kethu"), 269, 3, 35, 2.0);
        checkDms("S-Urenus", slon("Urenus"), 294, 44, 26, 2.0);
        checkDms("S-Neptune", slon("Neptune"), 280, 46, 37, 2.0);
        checkDms("S-Pluto", slon("Pluto"), 226, 17, 38, 2.0);
        // Ayanamsa: Swiss Lahiri 23°51'57" vs DOS fitted 23°50'01".
        const AngularDegrees say = AngularDegrees::fromDecimal(hs.ayanamsaDeg);
        if (say.deg != 23 || say.min != 51 || say.sec != 57) {
            ++g_fail;
            std::printf("FAIL S-Ayanamsa  got %d:%d:%d want 23:51:57\n",
                        say.deg, say.min, say.sec);
        } else {
            ++g_pass;
            std::printf("ok   S-Ayanamsa  23:51:57\n");
        }
        // Documented flips vs DOS: Kuja Navamsa Dhanu->Wrschika seat
        // (modern display renders "Vrishchika"), Kuja avastha
        // AAgama->Gamana. DOS-literal spellings pin the seat index.
        const double kujaDec =
            findLongitude(hs.output, "Kuja")->ecliptic.toDecimal();
        checkStr("S-Kuja-Navamsa",
                 rasiName(VargaEngine::GetShadvarga(kujaDec)[1]), "Wrschika");
        checkStr("S-Kuja-Av",
                 hs.output.avastha[static_cast<std::size_t>(Planet::Kuja)].c_str(),
                 "Gamana");
        // Dasa: balance 9-10-26 (DOS 9-10-11); maha boundaries +15d.
        const DasaBalance sbal = dasaBalance(hs.moonNirayanaDeg);
        if (std::string(kDasaCycle[sbal.lordCycleIdx].name) != "Guru" ||
            sbal.ymd.y != 9 || sbal.ymd.m != 10 || sbal.ymd.d != 26) {
            ++g_fail;
            std::printf("FAIL S-balance   got %s %d-%d-%d want Guru 9-10-26\n",
                        kDasaCycle[sbal.lordCycleIdx].name,
                        sbal.ymd.y, sbal.ymd.m, sbal.ymd.d);
        } else {
            ++g_pass;
            std::printf("ok   S-balance   Guru 9-10-26\n");
        }
        const std::vector<DasaSpan> smahas = mahaTimeline(birth, r0, sbal);
        checkYmd("S-Guru-end", smahas[0].to, 2010, 7, 13);
        checkYmd("S-Kuja-start", smahas[7].from, 2089, 7, 13);
        checkYmd("S-Kuja-end", smahas[7].to, 2096, 7, 13);
    }

    std::printf("\n=== VERIFICATION SUMMARY ===\nPassed: %d\nFailed: %d\n",
                g_pass, g_fail);
    if (g_fail == 0) {
        std::printf("=== ALL TESTS PASSED ===\n");
        return 0;
    }
    std::printf("=== SOME TESTS FAILED ===\n");
    return 1;
}

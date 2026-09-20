// Panchanga + Antardasa (L3) + Hora verification, anchored on screen12/13.
// Build: g++ -std=c++2a -Wall -Wextra -O2 -Isrc tests/test_panchanga.cpp src/VargaEngine.cpp -o /tmp/test_panchanga
#include <cmath>
#include <cstdio>
#include <string>

#include "../src/Panchanga.hpp"
#include "../src/Vimshottari.hpp"
#include "../src/AstroTime.hpp"
#include "../src/Hora.hpp"

static int g_fail = 0;
#define CHECK(cond, ...) do { \
    if (!(cond)) { ++g_fail; std::printf("FAIL %d: ", __LINE__); std::printf(__VA_ARGS__); std::printf("\n"); } \
    else { std::printf("ok   "); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)

int main() {
    using namespace star;
    // Baseline Nirayana longitudes (screen05 DMS, exact).
    const double sun = 232.0 + 33.0 / 60.0 + 32.0 / 3600.0;
    const double moon = 9.0 + 23.0 / 60.0 + 49.0 / 3600.0;
    const double jdn0 = 2444947.0;  // civil-date JD: weekday contract (Invalid_Time proof)

    const PanchangaInfo p = computePanchanga(jdn0, sun, moon);
    CHECK(p.weekday == "Tuesday", "vaara %s", p.weekday.c_str());
    CHECK(p.nakshatra == "Asvida", "neketha %s", p.nakshatra.c_str());
    CHECK(p.pada == 3, "pada %d", p.pada);
    CHECK(p.tithi == 12, "tithi %d", p.tithi);
    CHECK(p.tithiText == "Pura-Doloswaka  -12", "tithiText '%s'", p.tithiText.c_str());
    CHECK(p.yoga == "Parigha", "yoga %s", p.yoga.c_str());
    CHECK(p.karana == "Bava", "karana %s", p.karana.c_str());

    // Machine-capture regression cells (tests/screen_test/output/*.txt).
    CHECK(tithiDisplay(20) == "Ava -Visheniya  - 5", "waning20 '%s'", tithiDisplay(20).c_str());
    CHECK(tithiDisplay(24) == "Ava -Navawaka   - 9", "waning24 '%s'", tithiDisplay(24).c_str());
    CHECK(tithiDisplay(2) == "Pura-Diyawaka   - 2", "waxing2 '%s'", tithiDisplay(2).c_str());
    CHECK(std::string(yogaName(6)) == "Sukarna", "yoga6 %s", yogaName(6));
    CHECK(std::string(yogaName(17)) == "Varyayan", "yoga17 %s", yogaName(17));
    CHECK(std::string(nakshatraDisplayName(1)) == "Berana", "nak1 %s", nakshatraDisplayName(1));
    // Invalid_Time weekday proof: civil 1975-03-02 is Sunday; full JD would give Monday.
    CHECK(weekdayIndex(2442474.0) == 0, "civil weekday %d", weekdayIndex(2442474.0));
    CHECK(weekdayIndex(2442475.201) == 1, "fullJD weekday %d", weekdayIndex(2442475.201));

    // Hora chain (sub_1AE29 mechanism): baseline Tuesday, wrapped ghati
    // from sunrise 6:08:15 -> Guru / Ravi / Budha (screen13 DOS triple).
    const double sunrise = 6.0 + 8.0 / 60.0 + 15.0 / 3600.0;
    const double birth = 12.0 + 55.0 / 60.0;
    const HoraTriple ht =
        horaChain(weekdayIndex(jdn0), sinhalaGhati(birth, sunrise));
    CHECK(ht.kala == "Guru", "kala %s", ht.kala.c_str());
    CHECK(ht.pancha == "Ravi", "pancha %s", ht.pancha.c_str());
    CHECK(ht.sukshama == "Budha", "sukshama %s", ht.sukshama.c_str());

    // Antardasa L3 inside Kuja-Budha bhukti (2023-07-02 -> 2024-06-29).
    const YMD birthYmd{1981, 12, 8};
    const double bStart = fracYear(2023, 7, 2);
    const double bEnd = fracYear(2024, 6, 29);
    // Budha index in dasa cycle = 8.
    const std::vector<DasaSpan> ad = antardasaTimeline(birthYmd, bStart, 8, bEnd - bStart);
    CHECK(ad.size() == 9, "antar count %u", (unsigned)ad.size());
    const char* wantOrder[9] = {"Budha", "Ketu", "Sikuru", "Ravi", "Sandu",
                                "Kuja", "Rahu", "Guru", "Shani"};
    double spanSum = 0.0;
    for (int i = 0; i < 9; ++i) {
        CHECK(ad[static_cast<size_t>(i)].lord == wantOrder[i], "antar%d lord %s", i,
              ad[static_cast<size_t>(i)].lord.c_str());
        if (i > 0)
            CHECK(ad[static_cast<size_t>(i)].from.y == ad[static_cast<size_t>(i - 1)].to.y &&
                      ad[static_cast<size_t>(i)].from.m == ad[static_cast<size_t>(i - 1)].to.m &&
                      ad[static_cast<size_t>(i)].from.d == ad[static_cast<size_t>(i - 1)].to.d,
                  "antar%d contiguous", i);
        spanSum += fracYear(ad[static_cast<size_t>(i)].to.y, ad[static_cast<size_t>(i)].to.m,
                            ad[static_cast<size_t>(i)].to.d) -
                   fracYear(ad[static_cast<size_t>(i)].from.y, ad[static_cast<size_t>(i)].from.m,
                            ad[static_cast<size_t>(i)].from.d);
    }
    CHECK(ad.front().from.y == 2023 && ad.front().from.m == 7 && ad.front().from.d == 2,
          "antar start %d-%d-%d", ad.front().from.y, ad.front().from.m, ad.front().from.d);
    CHECK(ad.back().to.y == 2024 && ad.back().to.m == 6 && ad.back().to.d == 29,
          "antar end %d-%d-%d", ad.back().to.y, ad.back().to.m, ad.back().to.d);
    CHECK(std::fabs(spanSum - (bEnd - bStart)) < 0.02, "antar span sum %.4f", spanSum);

    if (g_fail == 0) std::printf("PANCHANGA_ALL_GREEN\n");
    return g_fail > 125 ? 125 : g_fail;  // clamp: exit codes wrap past 255
}

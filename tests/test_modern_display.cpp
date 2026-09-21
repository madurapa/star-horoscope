// Modern display tests: corrected spellings, skill rules, numeric parity
// with the frozen byte-exact legacy layer (presentation-only change).
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_modern_display.cpp src/VargaEngine.cpp -o /tmp/test_modern_display
#include <cstdio>
#include <sstream>
#include <string>

#include "../src/Engine.hpp"
#include "../src/ModernRenderer.hpp"
#include "check.hpp"

using namespace star;

static HoroscopeResult baseline() {
    HoroscopeOwner o{"Test User", 2000, 8, 17, 14, 5};
    return computeHoroscope(o, cityByIndex(7).coord, true, EngineKind::Dos);
}

static bool hasLineOver(const std::string& s, size_t w) {
    std::istringstream ss(s);
    std::string ln;
    while (std::getline(ss, ln)) {
        if (modern::dispWidth(ln) > w) return true;
        if (!ln.empty() && (ln.back() == ' ' || ln.back() == '\t')) return true;
    }
    return false;
}

int main() {
    const HoroscopeResult h = baseline();
    const GeoCoord geo = cityByIndex(7).coord;
    HoroscopeOwner o{"Test User", 2000, 8, 17, 14, 5};
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    const int W = 80;

    const std::string houses = modern::renderHouseTable(h.output, W, false);
    // Corrected spellings present...
    STAR_CHECK(houses.find("Ravi") != std::string::npos, "modern Ravi");
    STAR_CHECK(houses.find("Chandra") != std::string::npos, "modern Chandra");
    STAR_CHECK(houses.find("Shukra") != std::string::npos, "modern Shukra");
    STAR_CHECK(houses.find("Uranus") != std::string::npos, "modern Uranus");
    STAR_CHECK(houses.find("Vrishchika") != std::string::npos, "modern Vrishchika");
    STAR_CHECK(houses.find("Puvaputupa") != std::string::npos, "nakshatra kept");
    STAR_CHECK(houses.find("Pada") != std::string::npos, "Pada column restored");
    STAR_CHECK(houses.find("Rasi Longitude") != std::string::npos, "full header words");
    STAR_CHECK(houses.find("Nakshatra") != std::string::npos, "modern Nakshatra header");
    // ...legacy literals gone...
    for (const char* bad :
         {"Rav1", "Urenes", "Pluuto", "Sandu", "Sikuru", "NEKETH", "GRHAYA"}) {
        STAR_CHECK(houses.find(bad) == std::string::npos, "no legacy %s", bad);
    }
    // ...same numbers (presentation-only change).
    STAR_CHECK(houses.find("239\xC2\xB0" "07'08\"") != std::string::npos, "lagna numbers");
    STAR_CHECK(houses.find("325\xC2\xB0" "06'45\"") != std::string::npos, "moon numbers");
    STAR_CHECK(houses.find("120\xC2\xB0" "55'01\"") != std::string::npos, "sun numbers");
    // Table skill rules: within width, no trailing spaces.
    STAR_CHECK(!hasLineOver(houses, 80), "house table fits 80, no trailing ws");

    const std::string shad = modern::renderShadvargaNames(h.output, W, false);
    STAR_CHECK(shad.find("Drekkana") != std::string::npos, "drekanna header");
    STAR_CHECK(shad.find("Trimshamsa") != std::string::npos, "trimshamsa header");
    STAR_CHECK(!hasLineOver(shad, 80), "shadvarga fits 80");

    const std::string cities = modern::renderCityList(W);
    STAR_CHECK(cities.find("Colombo") != std::string::npos, "Colombo fixed");
    STAR_CHECK(cities.find("Batticaloa") != std::string::npos, "Batticaloa #13");
    STAR_CHECK(cities.find("CLOMBO") == std::string::npos, "no CLOMBO");
    STAR_CHECK(cities.find("MATHARA") == std::string::npos, "no MATHARA");
    STAR_CHECK(cities.find("\xC2\xB0") == std::string::npos, "no coords in list");
    STAR_CHECK(cities.find("District Selection") != std::string::npos, "title case section");
    STAR_CHECK(houses.find("Nirayana Table of Houses") != std::string::npos,
               "title case houses");

    const std::string prof = modern::renderKeyValues(
        modern::birthProfileRows(o, "Ratnapura", h.panchanga.weekday), W, false);
    STAR_CHECK(prof.find("Full Name") != std::string::npos, "full name label");
    STAR_CHECK(prof.find("2000-08-17") != std::string::npos, "birth date");
    STAR_CHECK(prof.find("Thursday") != std::string::npos, "birth day");
    STAR_CHECK(prof.find("79\xC2\xB0") == std::string::npos, "bare city name");

    const std::string astro =
        modern::renderKeyValues(modern::astroRows(h.output), W, false);
    STAR_CHECK(astro.find("Julian Date") != std::string::npos, "astro JD label");
    STAR_CHECK(astro.find("2451773.858") != std::string::npos, "astro JD");
    STAR_CHECK(astro.find("Lagna Degree") != std::string::npos, "lagna degree");
    STAR_CHECK(astro.find("Lagna Navamsa") != std::string::npos, "lagna navamsa");

    const std::string times = modern::renderKeyValues(
        modern::timeRows(h.birthDecHours, h.lmstHours, geo, h.riseH, h.setH), W, false);
    STAR_CHECK(times.find("Local Mean Time (LMT)") != std::string::npos, "full time label");
    STAR_CHECK(times.find("Universal Time (UT)") != std::string::npos, "UT label");
    STAR_CHECK(times.find("08:35:00") != std::string::npos, "summary UT");

    const std::string pan =
        modern::renderKeyValues(modern::panchangaRows(h.panchanga), W, false);
    STAR_CHECK(pan.find("Nakshatra Pada") != std::string::npos, "pada row");
    STAR_CHECK(pan.find("Tithi") != std::string::npos, "tithi row");
    STAR_CHECK(pan.find("Ava -Thiyawaka - 3") != std::string::npos, "tithi single-spaced");
    STAR_CHECK(pan.find("Doloswaka  -12") == std::string::npos, "no pad artifact");

    const std::string dinfo = modern::renderKeyValues(modern::dasaInfoRows(bal), W, false);
    STAR_CHECK(dinfo.find("Starting") != std::string::npos, "dasa starting");
    STAR_CHECK(dinfo.find("Guru") != std::string::npos, "dasa lord");
    STAR_CHECK(dinfo.find("9 years 10 months 11 days") != std::string::npos, "dasa period");
    STAR_CHECK(dinfo.find("From birth") != std::string::npos, "dasa reference");

    const YMD birth{2000, 8, 17};
    const std::string dasa = modern::renderDasa(birth, fracYear(2000, 8, 17), bal,
                                                h.moonNirayanaDeg, W, false);
    STAR_CHECK(dasa.find("2010-06-28") != std::string::npos, "dasa ISO dates");
    STAR_CHECK(dasa.find("\nMahadasa\n") == std::string::npos, "no root label");
    STAR_CHECK(dasa.find("\xE2\x94\x9C\xE2\x94\x80 "
                         "Guru: 2000-08-17 to 2010-06-28 (0y 0m 0d to 9y 10m 11d)") !=
                   std::string::npos,
               "maha branch line");
    STAR_CHECK(dasa.find("\xE2\x94\x82  \xE2\x94\x9C\xE2\x94\x80 "
                         "Shani: 2010-06-28 to 2013-07-01") != std::string::npos,
               "direct leaf");
    STAR_CHECK(dasa.find("\xE2\x94\x82  \xE2\x94\x94\xE2\x94\x80 Athurudasa") ==
                       std::string::npos &&
                   dasa.find("\n   \xE2\x94\x94\xE2\x94\x80 Athurudasa") == std::string::npos,
               "no athuru branch line");
    STAR_CHECK(dasa.find("Shukra: 2053-06-28 to 2073-06-28") != std::string::npos,
               "dasa Shukra");
    STAR_CHECK(!hasLineOver(dasa, 80), "tree fits 80");
    {
        const YMD b2{2000, 8, 17};
        const std::string dc = modern::renderDasa(b2, fracYear(2000, 8, 17), bal,
                                                  h.moonNirayanaDeg, 80, true);
        std::string stripped;
        for (size_t i = 0; i < dc.size();) {
            if (dc[i] == '\033') {
                size_t e = dc.find('m', i);
                i = (e == std::string::npos) ? dc.size() : e + 1;
            } else {
                stripped += dc[i++];
            }
        }
        STAR_CHECK(stripped == dasa, "tree color fallback identical");
        STAR_CHECK(dc.find("\033[95mGuru") != std::string::npos, "maha lord magenta");
        STAR_CHECK(dc.find("\033[36m2000-08-17") != std::string::npos, "dates cyan");
        STAR_CHECK(dc.find("\033[37m(") != std::string::npos, "ages light gray");
    }

    // Banner: date + STAR logo + version between exact-width =- rules.
    const std::string banner = modern::renderBanner(80, false, true);
    STAR_CHECK(banner.find("Sri Lankan Vedic Astrology Engine") != std::string::npos,
               "banner title");
    STAR_CHECK(banner.find(std::string("v") + modern::kAppVersion) != std::string::npos,
               "banner version");
    STAR_CHECK(banner.find("|__   __|") != std::string::npos, "STAR logo");
    STAR_CHECK(banner.find(modern::systemDate()) != std::string::npos, "banner date");
    STAR_CHECK(banner.find(modern::pairRule(80)) != std::string::npos, "banner rule 80");
    STAR_CHECK(!hasLineOver(banner, 80), "banner fits 80, no trailing ws");
    const std::string compact = modern::renderBanner(50, false, true);
    STAR_CHECK(compact.find("Sri Lankan Vedic Astrology Engine") != std::string::npos,
               "compact title");
    STAR_CHECK(compact.find("|__   __|") == std::string::npos, "compact no logo");

    // Key-value labels carry color across all areas; fallback identical.
    {
        const std::string kc = modern::renderKeyValues({{"Full Name", "Test User"}}, 80, true);
        const std::string kp = modern::renderKeyValues({{"Full Name", "Test User"}}, 80, false);
        STAR_CHECK(kc.find("\033[1;93mFull Name") != std::string::npos,
                   "labels bold yellow");
        std::string ks;
        for (size_t i = 0; i < kc.size();) {
            if (kc[i] == '\033') {
                size_t e = kc.find('m', i);
                i = (e == std::string::npos) ? kc.size() : e + 1;
            } else {
                ks += kc[i++];
            }
        }
        STAR_CHECK(ks == kp, "key-value fallback identical");
    }

    // Color skill: fallback identical minus codes, alignment unchanged.
    const std::string plain = modern::fitCenter("LAGNA CHART", 79, false);
    std::string colored = modern::fitCenter("LAGNA CHART", 79, true);
    std::string stripped;
    for (size_t i = 0; i < colored.size();) {
        if (colored[i] == '\033') {
            size_t e = colored.find('m', i);
            i = (e == std::string::npos) ? colored.size() : e + 1;
        } else {
            stripped += colored[i++];
        }
    }
    STAR_CHECK(stripped == plain, "color fallback identical");
    STAR_CHECK(modern::dispWidth(colored) == modern::dispWidth(plain),
               "color keeps display width");
    {
        modern::Table t;
        t.head = {"A", "B"};
        t.rows = {{"x", "y"}};
        const std::string ct = modern::renderTable(t, 80, true);
        STAR_CHECK(ct.find("\033[96m") != std::string::npos, "headers bright cyan");
    }

    // One table style (minimal, borderless); stretched to the 80 floor.
    auto noBox = [](const std::string& t) {
        std::istringstream ss(t);
        std::string ln;
        while (std::getline(ss, ln)) {
            if (ln.find('|') != std::string::npos || (!ln.empty() && ln[0] == '+'))
                return false;
        }
        return true;
    };
    STAR_CHECK(noBox(houses), "houses borderless");
    {
        // Right-alignment mechanism: middle numeric cell hugs its right edge.
        modern::Table t;
        t.head = {"A", "N", "B"};
        t.rows = {{"x", "2", "y"}};
        t.rightCols = {1};
        const std::string mt = modern::renderTable(t, 80, false);
        STAR_CHECK(mt.find("2  y") != std::string::npos, "numbers right-aligned");
        STAR_CHECK(mt.find("2   y") == std::string::npos, "not left-aligned");
    }
    {
        // Framing rules span the full 80.
        std::istringstream ps(modern::renderShadvargaHouses(h.output, W, false));
        std::string ln;
        bool sawRule80 = false;
        while (std::getline(ps, ln)) {
            if (!ln.empty() && ln.find_first_not_of("─ ") == std::string::npos &&
                modern::dispWidth(ln) == 80)
                sawRule80 = true;
        }
        STAR_CHECK(sawRule80, "positions rules span 80");
    }
    STAR_CHECK(noBox(modern::renderShadvargaHouses(h.output, W, false)),
               "positions borderless");

    // Wide layout: boxed tables with centered headers, right numerics.
    {
        const std::string bh = modern::renderHouseTable(h.output, 96, false, true);
        std::istringstream bs(bh);
        std::string ln;
        bool sawBox = false, centeredHead = false;
        while (std::getline(bs, ln)) {
            if (!ln.empty() && ln.front() == '+' && ln.back() == '+' &&
                modern::dispWidth(ln) == 96)
                sawBox = true;
            if (ln.size() > 2 && ln.front() == '|' &&
                ln.find("Planet") != std::string::npos)
                centeredHead = ln[1] == ' ';
        }
        STAR_CHECK(sawBox, "boxed table spans 96");
        STAR_CHECK(centeredHead, "boxed header centered");
        STAR_CHECK(bh.find("239\xC2\xB0" "07'08\"") != std::string::npos,
                   "boxed numbers intact");
    }

    // Boxflow: narrow terminal stacks charts instead of side-by-side.
    const modern::ChartSet cs = modern::buildCharts(h.output);
    const std::string wide =
        modern::renderChartPair(cs.lagna, "Lagna Chart", cs.navamsa, "Navamsa Chart", 80, false);
    STAR_CHECK(wide.find("Lagna Chart") != std::string::npos, "wide pair titles");
    STAR_CHECK(wide.find("LAGNA CHART") == std::string::npos, "no all caps");
    STAR_CHECK(wide.find("\xE2\x94\x82   Sun    \xE2\x94\x82") != std::string::npos ||
                   modern::renderChartPair(cs.sun, "Sun Chart", cs.moon, "Moon Chart", 80,
                                           false)
                           .find("\xE2\x94\x82   Sun    \xE2\x94\x82") != std::string::npos,
               "center labels centered");
    const std::string narrow =
        modern::renderChartPair(cs.lagna, "Lagna Chart", cs.navamsa, "Navamsa Chart", 50, false);
    STAR_CHECK(narrow.find("Lagna Chart") != std::string::npos, "narrow stacked");
    STAR_CHECK(!hasLineOver(narrow, 50), "narrow fits 50");

    const std::string hora =
        modern::renderKeyValues(modern::horaRows("Kuja", "Kuja", "Kuja"), W, false);
    STAR_CHECK(hora.find("Kala") != std::string::npos, "short hora label");
    STAR_CHECK(hora.find("Kala Hora") == std::string::npos, "no hora suffix");
    const std::string chakra =
        modern::renderKeyValues(modern::chakraRows(h.panchanga.nakIndex), W, false);
    for (const char* a : {"Gana", "Yoni", "Linga", "Naadi", "Varna", "Ruxha", "Paxhi",
                          "Gothra", "Rajju", "Bhutha"})
        STAR_CHECK(chakra.find(a) != std::string::npos, "chakra %s", a);
    STAR_CHECK(chakra.find("Gana") < chakra.find("Yoni") &&
                   chakra.find("Yoni") < chakra.find("Linga") &&
                   chakra.find("Rajju") < chakra.find("Bhutha"),
               "chakra order");

    {
        const std::string f80 = modern::renderFooter(80);
        STAR_CHECK(!f80.empty(), "footer shown at 80");
        STAR_CHECK(f80.find("___") != std::string::npos, "footer art kept");
        STAR_CHECK(!hasLineOver(f80, 80), "footer fits 80, no trailing ws");
        STAR_CHECK(modern::renderFooter(40).empty(), "footer skipped when narrow");
    }

    if (::startest::g_fail == 0) std::printf("MODERN_DISPLAY_ALL_GREEN\n");
    return ::startest::exitCode();
}

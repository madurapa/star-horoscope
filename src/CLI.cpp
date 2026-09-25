// STAR.EXE interactive CLI implementation.
// Mirrors the original input windows (screens 01-04):
//   Thathkala Y/N -> owner details -> city list (+ manual geo) -> S/N method.
// Batch flags fill the same fields; anything still unset is prompted.

#include "CLI.hpp"
#include "Engine.hpp"
#include "Ephemeris.hpp"
#include "Lagna.hpp"
#include "ModernRenderer.hpp"
#include "VargaEngine.hpp"
#include "Ayanamsa.hpp"
#include "SunriseSunset.hpp"
#include "ScreenRenderer.hpp"
#include "Vimshottari.hpp"
#include "Hora.hpp"
#include "JsonOutput.hpp"

#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <string>
#include <cstdio>
#include <cmath>
#include <ctime>
#include "Compat.hpp"

namespace star {
namespace {

std::string readLine() {
    std::string s;
    if (!std::getline(std::cin, s)) return "";
    return s;
}

bool readInts(const char* prompt, int want, int* vals, bool modernMsg = false,
            const char* hint = nullptr, bool color = false) {
    for (;;) {
        std::cout << prompt << std::flush;
        if (std::cin.eof()) return false;
        std::string s = readLine();
        if (std::cin.eof() && s.empty()) return false;
        std::istringstream ss(s);
        bool ok = true;
        for (int i = 0; i < want; ++i) {
            if (!(ss >> vals[i])) { ok = false; break; }
        }
        std::string extra;
        if (ok && (ss >> extra)) ok = false;  // trailing garbage
        if (ok) return true;
        std::string msg;
        if (modernMsg && hint != nullptr) {
            char b[160];
            std::snprintf(b, sizeof(b), "Please enter %d number%s (%s).", want,
                          want == 1 ? "" : "s", hint);
            msg = b;
        } else if (modernMsg) {
            msg = want == 1 ? "Please enter 1 number."
                            : "Please enter numbers separated by spaces.";
        } else {
            std::cout << "Invalid input: please enter " << want
                      << (want == 1 ? " number." : " numbers separated by spaces.") << "\n";
            if (std::cin.eof()) return false;
            continue;
        }
        std::cout << "  " << modern::paint(modern::Theme::warn, "! " + msg, color) << "\n";
        if (std::cin.eof()) return false;
    }
}

// One-letter choice; empty line takes the default. Returns false on EOF.
bool readLetter(const char* prompt, char& out, const char* valid, char dflt,
                const char* errMsg, bool color) {
    for (;;) {
        std::cout << prompt << std::flush;
        if (std::cin.eof()) return false;
        std::string s = CLI::trim(readLine());
        if (std::cin.eof()) return false;
        if (s.empty()) {
            out = dflt;
            return true;
        }
        if (s.size() == 1) {
            for (const char* v = valid; *v; ++v) {
                if ((s[0] | 32) == (*v | 32)) {
                    out = *v;
                    return true;
                }
            }
        }
        std::cout << "  " << modern::paint(modern::Theme::warn, std::string("! ") + errMsg, color)
                  << "\n";
        if (std::cin.eof()) return false;
    }
}

}  // namespace

CLI::CLI(CLIConfig config) : config_(std::move(config)) {}

bool CLI::isLeapYear(int year) noexcept {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

int CLI::daysInMonth(int year, int month) noexcept {
    static const int kDays[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (month < 1 || month > 12) return 0;
    if (month == 2 && isLeapYear(year)) return 29;
    return kDays[month - 1];
}

std::string CLI::trim(std::string_view s) {
    const size_t a = s.find_first_not_of(" \t\r\n");
    if (a == std::string::npos) return "";
    const size_t b = s.find_last_not_of(" \t\r\n");
    return std::string(s.substr(a, b - a + 1));
}

std::string CLI::validateName(const std::string& name) {
    if (trim(name).empty()) return "Name must not be empty.";
    if (trim(name).size() > 60) return "Name must be at most 60 characters.";
    return "";
}

std::string CLI::validateDate(int year, int month, int day) {
    if (year < 1000 || year > 9999)
        return "Year must be 1000-9999.";
    if (month < 1 || month > 12)
        return "Month must be 1-12.";
    const int dim = daysInMonth(year, month);
    if (day < 1 || day > dim) {
        std::ostringstream os;
        os << "Day must be 1-" << dim << " for month " << month;
        if (month == 2) os << (isLeapYear(year) ? " (leap year)." : " (non-leap year).");
        else os << ".";
        return os.str();
    }
    return "";
}

std::string CLI::validateTime(int hour, int minute) {
    if (hour < 0 || hour > 23) return "Hour must be 0-23.";
    if (minute < 0 || minute > 59) return "Minute must be 0-59.";
    return "";
}

std::string CLI::validateCity(int city) {
    if (city < 1)
        return "District must be 1 or greater (1-" + std::to_string(kCityCount) +
               " list, >" + std::to_string(kCityCount) + " manual entry).";
    return "";
}

std::string CLI::validateGeo(int latDeg, int latMin, int lonDeg, int lonMin) {
    if (latDeg < 0 || latDeg > 90) return "Latitude degrees must be 0-90.";
    if (latMin < 0 || latMin > 59) return "Latitude minutes must be 0-59.";
    if (latDeg == 90 && latMin != 0) return "Latitude 90 must have 0 minutes.";
    if (lonDeg < 0 || lonDeg > 180) return "Longitude degrees must be 0-180.";
    if (lonMin < 0 || lonMin > 59) return "Longitude minutes must be 0-59.";
    if (lonDeg == 180 && lonMin != 0) return "Longitude 180 must have 0 minutes.";
    return "";
}

bool CLI::batchComplete() const {
    if (config_.thathkala) return config_.nirayana.has_value();
    if (trim(config_.name).empty()) return false;
    if (!validateDate(config_.birth_year, config_.birth_month, config_.birth_day).empty())
        return false;
    if (!validateTime(config_.birth_hour, config_.birth_minute).empty()) return false;
    if (!validateCity(config_.city_index).empty()) return false;
    if (config_.city_index > kCityCount && !config_.manual_geo_set) return false;
    if (!config_.nirayana.has_value()) return false;
    return true;
}

int CLI::run() {
    if (config_.verify_mode) return runVerify();
    prompted_ = false;
    if (!batchComplete()) {
        if (::isatty(STDIN_FILENO)) {
            runInteractive();
            if (std::cin.eof()) {
                std::cerr << "\n";
                return cliFail("Aborted (end of input).");
            }
            prompted_ = true;
        } else {
            return cliFail("Error: missing birth/district/method fields (no defaults)."
                           " Run interactively or pass --name/--year/--month/--day/"
                           "--hour/--minute/--city plus --nirayana/--sayana.");
        }
    }
    if (prompted_ && ::isatty(STDOUT_FILENO)) {
        // Hide the input Q&A (like the original CLRSCR): clear the viewport
        // AND the scrollback (3J) so the prompts cannot be scrolled back to
        // — only the computed results stay on screen. Never emitted into
        // pipes/files, and never in pure batch runs.
        std::cout << "\033[2J\033[3J\033[H" << std::flush;
    }
    return runBaselineModern();
}

bool CLI::promptModern() {
    const int W = modern::termWidth();
    const bool col = colorOn();
    std::cout << modern::renderBanner(W, col, true);
    auto divider = [&](const std::string& t) {
        std::cout << "\n"
                  << modern::sectionDivider(localizeKey(t, config_.locale), W, col) << "\n\n";
    };
    auto error = [&](const std::string& m) {
        std::cout << "  " << modern::paint(modern::Theme::warn, "! " + m, col) << "\n";
    };
    auto readMethod = [&](bool& nrayana) {
        char ch = 'N';
        if (!readLetter(localeText(Concept::UiPromptMethodSN, config_.locale), ch, "SN", 'N',
                        "Please answer S or N.", col))
            return false;
        nrayana = (ch == 'N');
        return true;
    };

    divider("Kendra Type");
    if (!config_.thathkala) {
        char ch = 'N';
        if (!readLetter(localeText(Concept::UiPromptThathkalaKendraYN, config_.locale), ch, "YN", 'N',
                        "Please answer Y or N.", col))
            return false;
        config_.thathkala = (ch == 'Y');
    }
    if (config_.thathkala) {
        if (!config_.nirayana.has_value()) {
            divider("Ayanamsa Method");
            bool nrayana = true;
            if (!readMethod(nrayana)) return false;
            config_.nirayana = nrayana;
        }
        return true;
    }

    divider("Horoscope Owner Details");
    if (trim(config_.name).empty()) {
        for (;;) {
            std::cout << localeText(Concept::UiPromptFullName, config_.locale) << std::flush;
            if (std::cin.eof()) return false;
            std::string s = readLine();
            if (std::cin.eof()) return false;
            const std::string err = validateName(s);
            if (err.empty()) {
                config_.name = trim(s);
                break;
            }
            error(err);
        }
    }
    if (!validateDate(config_.birth_year, config_.birth_month, config_.birth_day).empty()) {
        for (;;) {
            int v[3] = {config_.birth_year, config_.birth_month, config_.birth_day};
            if (!readInts(localeText(Concept::UiPromptBirthDate, config_.locale), 3, v, true,
                         localeText(Concept::UiHintDateEg, config_.locale), col))
                return false;
            const std::string err = validateDate(v[0], v[1], v[2]);
            if (err.empty()) {
                config_.birth_year = v[0];
                config_.birth_month = v[1];
                config_.birth_day = v[2];
                break;
            }
            error(err);
        }
    }
    if (!validateTime(config_.birth_hour, config_.birth_minute).empty()) {
        for (;;) {
            int v[2] = {config_.birth_hour, config_.birth_minute};
            if (!readInts(localeText(Concept::UiPromptBirthTime, config_.locale), 2, v, true,
                         localeText(Concept::UiHintTimeEg, config_.locale), col))
                return false;
            const std::string err = validateTime(v[0], v[1]);
            if (err.empty()) {
                config_.birth_hour = v[0];
                config_.birth_minute = v[1];
                break;
            }
            error(err);
        }
    }

    divider("District Selection");
    if (!validateCity(config_.city_index).empty()) {
        std::cout << modern::renderCityList(W, false, false) << "\n";
        for (;;) {
            int v[1] = {0};
            if (!readInts(localeText(Concept::UiPromptClosestDistrict, config_.locale), 1, v, true,
                         localeText(Concept::UiHintDistrictEg, config_.locale), col))
                return false;
            const std::string err = validateCity(v[0]);
            if (err.empty()) {
                config_.city_index = v[0];
                break;
            }
            error(err);
        }
    }
    if (config_.city_index > kCityCount && !config_.manual_geo_set) {
        for (;;) {
            int v[2] = {0, 0};
            if (!readInts(localeText(Concept::UiPromptLatitude, config_.locale), 2, v, true,
                         localeText(Concept::UiHintLatEg, config_.locale), col))
                return false;
            int w[2] = {0, 0};
            if (!readInts(localeText(Concept::UiPromptLongitude, config_.locale), 2, w, true,
                         localeText(Concept::UiHintLonEg, config_.locale), col))
                return false;
            const std::string err = validateGeo(v[0], v[1], w[0], w[1]);
            if (err.empty()) {
                config_.manual_geo = GeoCoord{v[0], v[1], w[0], w[1]};
                config_.manual_geo_set = true;
                break;
            }
            error(err);
        }
    }

    divider("Ayanamsa Method");
    if (!config_.nirayana.has_value()) {
        bool nrayana = true;
        if (!readMethod(nrayana)) return false;
        config_.nirayana = nrayana;
    }
    return true;
}

void CLI::runInteractive() {
    promptModern();
}

static GeoCoord resolveGeo(const CLIConfig& c) {
    if (c.city_index >= 1 && c.city_index <= kCityCount) return cityByIndex(c.city_index).coord;
    if (c.city_index > kCityCount && c.manual_geo_set) return c.manual_geo;
    // Batch mode with city > kCityCount but no manual geo cannot happen (validated);
    // fall back to Colombo seed rather than crashing.
    return kColomboFallback;
}

static HoroscopeOwner ownerFromConfig(const CLIConfig& c) {
    HoroscopeOwner o;
    if (c.thathkala) {
        std::time_t now = std::time(nullptr);
        std::tm local{};
#if defined(_WIN32)
        localtime_s(&local, &now);
#else
        localtime_r(&now, &local);
#endif
        o.name = "\"Thatkala Kendra\"";
        o.birth_year = local.tm_year + 1900;
        o.birth_month = local.tm_mon + 1;
        o.birth_day = local.tm_mday;
        o.birth_hour = local.tm_hour;
        o.birth_minute = local.tm_min;
        return o;
    }
    o.name = CLI::trim(c.name);
    o.birth_year = c.birth_year;
    o.birth_month = c.birth_month;
    o.birth_day = c.birth_day;
    o.birth_hour = c.birth_hour;
    o.birth_minute = c.birth_minute;
    return o;
}

bool CLI::colorOn() const {
    if (config_.color == "never") return false;
    if (config_.color == "always") return true;
    // auto: TTY stdout only, NO_COLOR respected, never into files.
    if (std::getenv("NO_COLOR") != nullptr) return false;
    if (!config_.output_file.empty()) return false;
    return ::isatty(STDOUT_FILENO) != 0;
}

static modern::JsonProvenance jsonProv(const CLIConfig& config, bool nirayana,
                                         const std::string& city) {
    modern::JsonProvenance prov;
    prov.nirayana = nirayana;
    prov.locale = config.locale;
    prov.cityIndex = config.thathkala ? 1 : config.city_index;
    prov.city = city;
    return prov;
}

int CLI::runBaselineModern() const {
    const bool nirayana = config_.nirayana.value_or(true);
    const GeoCoord geo = config_.thathkala ? kColomboFallback : resolveGeo(config_);
    const HoroscopeOwner owner = ownerFromConfig(config_);
    // Explicit engine kind (Swiss default per §4.5 flip; --engine dos
    // selects the frozen reconstruction; see docs/phase2_design.md).
    const EngineKind kind = config_.engine.value_or(EngineKind::Swiss);
    const HoroscopeResult h = computeHoroscope(owner, geo, nirayana, kind);
    if (!h.engineOk) {
        return cliFail(std::string("Error: swiss engine failed: ") + h.engineError);
    }

    const YMD birth{owner.birth_year, owner.birth_month, owner.birth_day};
    const double birthFrac = fracYear(owner.birth_year, owner.birth_month, owner.birth_day);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    const int W = modern::termWidth();
    const bool col = colorOn();
    // One table style per viewport: boxes need the full 90 layout.
    const bool boxed = (W >= modern::kWideLayout);
    auto emit = [&](const std::string& s) {
        writeOutput(s);
        if (!s.empty() && s.back() != '\n') writeOutput("\n");
    };
    auto show = [&](int n) {
        if (!config_.show_all_screens) {
            for (int f : config_.screen_filter)
                if (f == n) return true;
            return false;
        }
        return true;
    };
    const std::string city = config_.thathkala
        ? "Colombo (Thathkala default)"
        : (config_.city_index > kCityCount ? "Manual entry" : modern::cityLabel(config_.city_index));

    if (config_.output_format == "json") {
        emit(modern::renderJson(owner, h, kind, jsonProv(config_, nirayana, city), birth,
                                birthFrac, bal));
        return 0;
    }

    // Echo sections repeat what interactive users just typed: hidden then
    // (explicit --screen still shows them).
    const bool hideEcho = prompted_ && config_.show_all_screens;
    if (show(1)) {
        emit(modern::renderBanner(W, col, nirayana));
        if (!hideEcho)
            emit(localizeKey("Thathkala Kendra: ", config_.locale) +
                 std::string(config_.thathkala
                                 ? localeText(Concept::UiMiscYes, config_.locale)
                                 : localeText(Concept::UiMiscNo, config_.locale)) +
                 "\n");
    }
    // Grouped subsections, each under its own divider. Group 12 carries
    // the summary subsections, group 13 the Hora/Chakra ones.
    auto sub = [&](const std::string& title, const modern::KeyRows& rows) {
        emit(modern::sectionTitle(title, W, col, config_.locale) +
             modern::renderKeyValues(rows, W, col, config_.locale));
    };
    if (show(12)) {
        sub("Birth Profile",
            modern::birthProfileRows(owner, city, h.panchanga.weekday));
        sub("Astronomical & Chart Reference", modern::astroRows(h.output));
        sub("Time & Solar Metrics",
            modern::timeRows(h.birthDecHours, h.lmstHours, geo, h.riseH, h.setH));
        sub("Panchanga", modern::panchangaRows(h.panchanga));
        sub("Dasa Information", modern::dasaInfoRows(bal));
    }
    if (show(13)) {
        const HoraTriple ht =
            horaChain(weekdayIndex(h.jdn0), sinhalaGhati(h.birthDecHours, h.riseH));
        sub("Hora", modern::horaRows(ht.kala, ht.pancha, ht.sukshama));
        sub("Chakra", modern::chakraRows(h.panchanga.nakIndex));
    }
    if (show(2) && !hideEcho)
        emit(modern::renderProfile(owner, geo, city, W, col, config_.locale));
    if (show(3) && !hideEcho) emit(modern::renderCityList(W, col, true, config_.locale));
    if (show(4) && !hideEcho) {
        std::vector<std::pair<std::string, std::string>> opts;
        if (!config_.thathkala) {
            opts.emplace_back("District", std::to_string(config_.city_index) + " (" + city + ")");
            if (config_.city_index > kCityCount) {
                char gb[64];
                std::snprintf(gb, sizeof(gb), "%d\xC2\xB0%d'N %d\xC2\xB0%d'E", geo.lat_deg,
                              geo.lat_min, geo.lon_deg, geo.lon_min);
                opts.emplace_back("Manual Coordinates", gb);
            }
        }
        opts.emplace_back("Method", nirayana ? "Nirayana (Sidereal)" : "Sayana (Tropical)");
        emit(modern::sectionDivider(localizeKey("Selected Options", config_.locale), W, col) +
             "\n\n" + modern::renderKeyValues(opts, W, col, config_.locale));
    }
    if (show(5)) emit(modern::renderHouseTable(h.output, W, col, boxed, config_.locale));
    if (show(6))
        emit(modern::renderShadvargaNames(h.output, W, col, boxed, config_.locale));
    if (show(7))
        emit(modern::renderShadvargaHouses(h.output, W, col, boxed, config_.locale));
    if (show(8) || show(9) || show(10) || show(11)) {
        const modern::ChartSet cs = modern::buildCharts(h.output);
        if (show(8))
            emit(modern::renderChartPair(cs.lagna, "Lagna Chart", cs.navamsa, "Navamsa Chart",
                                         W, col, config_.locale));
        if (show(9))
            emit(modern::renderChartPair(cs.hora, "Hora Chart", cs.drekkana, "Drekkana Chart",
                                         W, col, config_.locale));
        if (show(10))
            emit(modern::renderChartPair(cs.dvadasamsa, "Dvadasamsa Chart", cs.trimshamsa,
                                         "Trimshamsa Chart", W, col, config_.locale));
        if (show(11))
            emit(modern::renderChartPair(cs.sun, "Ravi Chart", cs.moon, "Chandra Chart", W, col,
                                         config_.locale));
    }
    if (show(14))
        emit(modern::renderDasa(birth, birthFrac, bal, h.moonNirayanaDeg, W, col,
                                config_.locale));
    if (config_.show_all_screens) emit(modern::renderFooter(W));
    return 0;
}

int CLI::runVerify() const {
    // Baseline checkpoints (AGENTS.md checkpoints 1-4).
    const GeoCoord geo = cityByIndex(7).coord;  // Ratnapura baseline
    const HoroscopeOwner owner{"Test User", 2000, 8, 17, 14, 5};
    const HoroscopeResult h = computeHoroscope(owner, geo, true, EngineKind::Dos);

    int fail = 0;
    auto checkDms = [&](const char* tag, double gotDec, int d, int m, int s, double tolSec) {
        const double want = d + m / 60.0 + s / 3600.0;
        const double err = std::fabs(gotDec - want) * 3600.0;
        if (err > tolSec) {
            ++fail;
            std::printf("FAIL %-8s got %.5f want %d:%d:%d (err %.2f\")\n", tag, gotDec, d, m, s, err);
        } else {
            std::printf("ok   %-8s got %.5f want %d:%d:%d\n", tag, gotDec, d, m, s);
        }
    };

    const auto lon = [&](const std::string& k) {
        const PlanetLongitude* pl = findLongitude(h.output, k);
        if (pl == nullptr) {
            ++fail;
            std::printf("FAIL %-8s missing longitude\n", k.c_str());
            return 0.0;
        }
        return pl->ecliptic.toDecimal();
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

    if (std::fabs(h.jd - 2451773.858) > 5e-4) {
        ++fail;
        std::printf("FAIL JD got %.6f want 2451773.858\n", h.jd);
    } else {
        std::printf("ok   JD %.6f\n", h.jd);
    }

    const YMD birth{2000, 8, 17};
    const double r0 = fracYear(2000, 8, 17);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    if (bal.ymd.y != 9 || bal.ymd.m != 10 || bal.ymd.d != 11) {
        ++fail;
        std::printf("FAIL balance got %d-%d-%d want 9-10-11\n", bal.ymd.y, bal.ymd.m, bal.ymd.d);
    } else {
        std::printf("ok   balance %d-%d-%d (screen: 9-10-11)\n", bal.ymd.y, bal.ymd.m, bal.ymd.d);
    }
    const auto mahas = mahaTimeline(birth, r0, bal);
    auto checkYmd = [&](const char* tag, YMD got, int y, int m, int d) {
        if (got.y != y || got.m != m || got.d != d) {
            ++fail;
            std::printf("FAIL %s got %d-%d-%d want %d-%d-%d\n", tag, got.y, got.m, got.d, y, m, d);
        } else {
            std::printf("ok   %s %d-%d-%d\n", tag, got.y, got.m, got.d);
        }
    };
    checkYmd("Guru-end", mahas[0].to, 2010, 6, 28);
    checkYmd("Kuja-start", mahas[7].from, 2089, 6, 28);
    checkYmd("Kuja-end", mahas[7].to, 2096, 6, 28);
    const auto kb = bhuktiTimeline(birth, fracYear(2089, 6, 28), 4, 7.0);
    checkYmd("Kuja-Sikuru", kb[6].to, 2095, 7, 22);
    checkYmd("Kuja-Ravi", kb[7].to, 2095, 11, 28);
    checkYmd("Kuja-Sandu", kb[8].to, 2096, 6, 28);

    // Swiss block (dual gate): same profile through the Swiss backend.
    // Full 13-longitude table lives in tests/verifier.cpp; here the
    // headlines proving the Swiss path end to end.
    const HoroscopeResult hs = computeHoroscope(owner, geo, true, EngineKind::Swiss);
    if (!hs.engineOk) {
        ++fail;
        std::printf("FAIL Swiss-engine %s\n", hs.engineError.c_str());
    } else {
        const auto slon = [&](const char* k) {
            const PlanetLongitude* pl = findLongitude(hs.output, k);
            if (pl == nullptr) {
                ++fail;
                std::printf("FAIL %-8s missing longitude\n", k);
                return 0.0;
            }
            return pl->ecliptic.toDecimal();
        };
        checkDms("S-Lagna", slon("Lagna"), 239, 5, 18, 2.0);
        checkDms("S-Chandra", slon("Chandra"), 325, 4, 41, 2.0);
        const AngularDegrees say = AngularDegrees::fromDecimal(hs.ayanamsaDeg);
        if (say.deg != 23 || say.min != 51 || say.sec != 57) {
            ++fail;
            std::printf("FAIL S-Ayanamsa got %d:%d:%d want 23:51:57\n",
                        say.deg, say.min, say.sec);
        } else {
            std::printf("ok   S-Ayanamsa 23:51:57\n");
        }
        const DasaBalance sbal = dasaBalance(hs.moonNirayanaDeg);
        if (sbal.ymd.y != 9 || sbal.ymd.m != 10 || sbal.ymd.d != 26) {
            ++fail;
            std::printf("FAIL S-balance got %d-%d-%d want 9-10-26\n",
                        sbal.ymd.y, sbal.ymd.m, sbal.ymd.d);
        } else {
            std::printf("ok   S-balance 9-10-26\n");
        }
        const auto smahas = mahaTimeline(birth, r0, sbal);
        checkYmd("S-Guru-end", smahas[0].to, 2010, 7, 13);
        checkYmd("S-Kuja-start", smahas[7].from, 2089, 7, 13);
        checkYmd("S-Kuja-end", smahas[7].to, 2096, 7, 13);
    }

    if (fail == 0) std::printf("VERIFY_ALL_GREEN\n");
    return fail == 0 ? 0 : 1;
}

void CLI::printScreen(int screen_num, const std::string& content) const {
    writeOutput(formatScreen(screen_num, content));
}

void CLI::writeOutput(const std::string& content) const {
    if (config_.output_file.empty()) {
        std::cout << content;
    } else {
        std::ofstream f(config_.output_file, std::ios::app);
        f << content;
    }
}

std::string CLI::formatScreen(int screen_num, const std::string& content) const {
    char buf[32];
    std::snprintf(buf, sizeof(buf), "screen%02d.txt", screen_num);
    return std::string("=== ") + buf + " ===\n" + content +
           (content.empty() || content.back() == '\n' ? "" : "\n");
}

std::string CLI::loadConfigFilePublic(const std::string& path) {
    return loadConfigFile(path);
}

CLIConfig CLI::parseConfigFilePublic(const std::string& content) {
    return parseConfigFile(content);
}

std::string CLI::loadConfigFile(const std::string& path) {
    std::ifstream f(path);
    if (!f) return "";
    std::stringstream buffer;
    buffer << f.rdbuf();
    return buffer.str();
}

CLIConfig CLI::parseConfigFile(const std::string& content) {
    // No defaults: only keys present in the file are set; the rest stay
    // unset so the interactive windows (or flags) fill them in.
    CLIConfig config;
    bool sawGeo = false;
    std::istringstream iss(content);
    std::string line;
    auto parseInts = [](const std::string& v) {
        std::vector<int> out;
        std::string tok;
        std::istringstream ss(v);
        while (std::getline(ss, tok, ',')) {
            try {
                size_t pos = 0;
                int n = std::stoi(CLI::trim(tok), &pos);
                out.push_back(n);
            } catch (...) {}
        }
        return out;
    };
    while (std::getline(iss, line)) {
        size_t start = line.find_first_not_of(" \t");
        if (start == std::string::npos) continue;
        size_t end = line.find_last_not_of(" \t\r\n");
        line = line.substr(start, end - start + 1);

        if (line.empty() || line[0] == '#' || line[0] == ';') continue;

        size_t eq = line.find('=');
        if (eq == std::string::npos) continue;

        std::string key = line.substr(0, eq);
        std::string value = line.substr(eq + 1);

        auto trim = [](std::string& s) {
            size_t s1 = s.find_first_not_of(" \t");
            size_t e1 = s.find_last_not_of(" \t\r\n");
            if (s1 == std::string::npos) { s.clear(); return; }
            s = s.substr(s1, e1 - s1 + 1);
        };
        trim(key);
        trim(value);

        if (key == "name") config.name = value;
        else if (key == "birth_year") config.birth_year = std::stoi(value);
        else if (key == "birth_month") config.birth_month = std::stoi(value);
        else if (key == "birth_day") config.birth_day = std::stoi(value);
        else if (key == "birth_hour") config.birth_hour = std::stoi(value);
        else if (key == "birth_minute") config.birth_minute = std::stoi(value);
        else if (key == "city_index") config.city_index = std::stoi(value);
        else if (key == "nirayana") config.nirayana = (value == "true" || value == "1" || value == "yes");
        else if (key == "engine") {
            if (value == "dos") config.engine = EngineKind::Dos;
            else if (value == "swisseph") config.engine = EngineKind::Swiss;
        }
        else if (key == "thathkala") config.thathkala = (value == "true" || value == "1" || value == "yes");
        else if (key == "latdeg" || key == "lat_deg") { config.manual_geo.lat_deg = std::stoi(value); sawGeo = true; }
        else if (key == "latmin" || key == "lat_min") { config.manual_geo.lat_min = std::stoi(value); sawGeo = true; }
        else if (key == "londeg" || key == "lon_deg") { config.manual_geo.lon_deg = std::stoi(value); sawGeo = true; }
        else if (key == "lonmin" || key == "lon_min") { config.manual_geo.lon_min = std::stoi(value); sawGeo = true; }
        else if (key == "screen") {
            for (int n : parseInts(value)) {
                if (n >= 1 && n <= 14) {
                    config.show_all_screens = false;
                    config.screen_filter.push_back(n);
                }
            }
        }
        else if (key == "output_file") config.output_file = value;
        else if (key == "output_format") config.output_format = value;
        else if (key == "color") config.color = value;
        else if (key == "verify_mode") config.verify_mode = (value == "true" || value == "1" || value == "yes");

    }
    if (sawGeo) config.manual_geo_set = true;
    return config;
}

}  // namespace star

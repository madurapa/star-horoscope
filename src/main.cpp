// STAR.EXE interactive entry point.
// Sri Lankan Vedic Astrology Engine (native 64-bit Linux C++ console app).
//
// Behaviour mirrors the original program: with no (or partial) flags the
// binary opens the STAR input windows on stdin/stdout and validates every
// field (day-vs-month incl. leap-year Feb 29, hour/minute, city, S/N).
// Passing all fields as flags runs the same pipeline non-interactively.

#include "CLI.hpp"

#include <iostream>
#include <sstream>
#include <string>
#include <vector>

namespace {

bool parseInt(const char* s, int& out) {
    try {
        size_t pos = 0;
        int v = std::stoi(s, &pos);
        if (s[pos] != '\0') return false;
        out = v;
        return true;
    } catch (...) {
        return false;
    }
}

void printHelp() {
    std::cout << "STAR - Sri Lankan Vedic Astrology Engine\n"
              << "Usage: modern_star [options]\n"
              << "With no options the STAR input windows prompt for every field.\n"
              << "Options (all validated, no defaults):\n"
              << "  --name <string>        Owner name (non-empty)\n"
              << "  --year <1000-9999>     Birth year\n"
              << "  --month <1-12>         Birth month\n"
              << "  --day <1-31>           Birth day (checked vs month, leap-year Feb 29 ok)\n"
              << "  --hour <0-23>          Birth hour\n"
              << "  --minute <0-59>        Birth minute\n"
              << "  --city <n>             1-15 list city, >15 manual entry\n"
              << "  --latdeg <0-90> --latmin <0-59>    manual latitude (city > 15)\n"
              << "  --londeg <0-180> --lonmin <0-59>   manual longitude (city > 15)\n"
              << "  --nirayana / --sayana  Sidereal Nirayana vs tropical.\n"
              << "                         (--nrayana accepted: the binary spells it \"NRAYANA\")\n"
              << "  --thathkala            Thathkala Kendra mode: use current local\n"
              << "                         date/time + Colombo fallback (skip birth/city)\n"
              << "  --screen <n[,n...]>    Show only output group N 1-14:\n"
              << "                         1=header 2=profile 3=cities 4=options\n"
              << "                         5=houses 6=shadvarga 7=positions 8-11=charts\n"
              << "                         12=summary 13=hora+chakra 14=dasa timeline\n"
              << "                         (printed: header, birth profile, astro ref,\n"
              << "                         time metrics, panchanga, dasa info, profile,\n"
              << "                         cities, options, houses, shadvarga,\n"
              << "                         positions, charts, hora, chakra, dasa;\n"
              << "                         profile, cities and options hide in\n"
              << "                         interactive runs unless requested)\n"
              << "  --output <file>        Append output to file (default: stdout)\n"
              << "  --format <text|json>   Output format (default: text)\n"
              << "  --display <modern|legacy>  Corrected redesign (default) vs\n"
              << "                         byte-exact original (verification runs)\n"
              << "  --color <auto|always|never>  Headings color (default: auto)\n"
              << "  --verify               Run checkpoint verification, exit non-zero on fail\n"
              << "  --config <file>        Load key=value config file first\n"
              << "  --help, -h             Show this help\n";
}

}  // namespace

int main(int argc, char* argv[]) {
    try {
        star::CLIConfig config;

        // First pass: --config (lowest priority after built-in unset state).
        for (int i = 1; i + 1 < argc; ++i) {
            if (std::string(argv[i]) == "--config") {
                const std::string content = star::CLI(config).loadConfigFilePublic(argv[i + 1]);
                if (content.empty())
                    return star::cliFail(std::string("Error: cannot read config file '") +
                                         argv[i + 1] + "'");
                config = star::CLI(config).parseConfigFilePublic(content);
                break;
            }
        }

        int latDeg = -1, latMin = -1, lonDeg = -1, lonMin = -1;
        for (int i = 1; i < argc; ++i) {
            std::string arg = argv[i];
            auto need = [&](int& v, const char* what) {
                if (i + 1 >= argc) {
                    star::cliMsg(std::string("Error: ") + what + " needs a value");
                    return false;
                }
                if (!parseInt(argv[i + 1], v)) {
                    star::cliMsg(std::string("Error: bad integer for ") + what + ": '" +
                                 argv[i + 1] + "'");
                    return false;
                }
                ++i;
                return true;
            };

            if (arg == "--name" && i + 1 < argc) {
                config.name = argv[++i];
                const std::string err = star::CLI::validateName(config.name);
                if (!err.empty()) return star::cliFail("Error: --name: " + err);
            } else if (arg == "--year") {
                if (!need(config.birth_year, "--year")) return 1;
            } else if (arg == "--month") {
                if (!need(config.birth_month, "--month")) return 1;
            } else if (arg == "--day") {
                if (!need(config.birth_day, "--day")) return 1;
            } else if (arg == "--hour") {
                if (!need(config.birth_hour, "--hour")) return 1;
            } else if (arg == "--minute") {
                if (!need(config.birth_minute, "--minute")) return 1;
            } else if (arg == "--city") {
                if (!need(config.city_index, "--city")) return 1;
                const std::string err = star::CLI::validateCity(config.city_index);
                if (!err.empty()) return star::cliFail("Error: --city: " + err);
            } else if (arg == "--latdeg") {
                if (!need(latDeg, "--latdeg")) return 1;
            } else if (arg == "--latmin") {
                if (!need(latMin, "--latmin")) return 1;
            } else if (arg == "--londeg") {
                if (!need(lonDeg, "--londeg")) return 1;
            } else if (arg == "--lonmin") {
                if (!need(lonMin, "--lonmin")) return 1;
            } else if (arg == "--nirayana" || arg == "--nrayana") {
                config.nirayana = true;
            } else if (arg == "--sayana") {
                config.nirayana = false;
            } else if (arg == "--thathkala") {
                config.thathkala = true;
            } else if (arg == "--help" || arg == "-h") {
                printHelp();
                return 0;
            } else if (arg == "--screen" && i + 1 < argc) {
                std::string list = argv[++i];
                std::stringstream ss(list);
                std::string tok;
                while (std::getline(ss, tok, ',')) {
                    int n = 0;
                    if (!parseInt(tok.c_str(), n) || n < 1 || n > 14) {
                        return star::cliFail("Error: bad --screen value '" + tok +
                                               "' (want 1-14, see --help)");
                    }
                    config.show_all_screens = false;
                    config.screen_filter.push_back(n);
                }
            } else if (arg == "--output" && i + 1 < argc) {
                config.output_file = argv[++i];
            } else if (arg == "--format" && i + 1 < argc) {
                config.output_format = argv[++i];
                if (config.output_format != "text" && config.output_format != "json") {
                    return star::cliFail("Error: --format wants text|json");
                }
            } else if (arg == "--display" && i + 1 < argc) {
                config.display = argv[++i];
                if (config.display != "modern" && config.display != "legacy") {
                    return star::cliFail("Error: --display wants modern|legacy");
                }
            } else if (arg == "--color" && i + 1 < argc) {
                config.color = argv[++i];
                if (config.color != "auto" && config.color != "always" &&
                    config.color != "never") {
                    return star::cliFail("Error: --color wants auto|always|never");
                }
            } else if (arg == "--verify") {
                config.verify_mode = true;
            } else if (arg == "--config") {
                ++i;  // already consumed in the first pass
            } else {
                return star::cliFail("Error: unknown option '" + arg + "' (see --help)");
            }
        }

        // Batch range checks with field-specific messages (before prompting).
        if (config.birth_year != -1 || config.birth_month != -1 || config.birth_day != -1) {
            if (config.birth_year == -1 || config.birth_month == -1 || config.birth_day == -1) {
                return star::cliFail("Error: --year/--month/--day must be given together.");
            }
            const std::string err =
                star::CLI::validateDate(config.birth_year, config.birth_month, config.birth_day);
            if (!err.empty()) {
                return star::cliFail("Error: birth date: " + err);
            }
        }
        if (config.birth_hour != -1 || config.birth_minute != -1) {
            if (config.birth_hour == -1 || config.birth_minute == -1) {
                return star::cliFail("Error: --hour/--minute must be given together.");
            }
            const std::string err = star::CLI::validateTime(config.birth_hour, config.birth_minute);
            if (!err.empty()) {
                return star::cliFail("Error: birth time: " + err);
            }
        }
        const bool manualPartial =
            latDeg != -1 || latMin != -1 || lonDeg != -1 || lonMin != -1;
        if (manualPartial) {
            if (latDeg == -1 || latMin == -1 || lonDeg == -1 || lonMin == -1) {
                return star::cliFail("Error: --latdeg/--latmin/--londeg/--lonmin must be given "
                                       "together (city > 15).");
            }
            const std::string err = star::CLI::validateGeo(latDeg, latMin, lonDeg, lonMin);
            if (!err.empty()) {
                return star::cliFail("Error: manual geo: " + err);
            }
            config.manual_geo = star::GeoCoord{latDeg, latMin, lonDeg, lonMin};
            config.manual_geo_set = true;
        }
        if (config.city_index > 15 && !config.manual_geo_set) {
            // Defer to the interactive window when attached; fail in pipes.
            // (Checked again inside CLI::run; nothing to do here.)
        }

        star::CLI cli(config);
        return cli.run();
    } catch (const std::exception& e) {
        return star::cliFail(std::string("Error: ") + e.what());
    }
}

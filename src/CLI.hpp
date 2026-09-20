#pragma once
// STAR.EXE interactive CLI — mirrors the original program's input windows.
// No defaults: every field is unset until the user provides it, either via
// a batch flag or via the interactive prompt. All fields are validated
// (month range, day-vs-month incl. leap-year Feb 29, hour/minute, city,
// manual geo, S/N choices).

#include <cstdlib>
#include <iostream>
#include <optional>
#include <string>
#include <string_view>
#include <vector>

#if !defined(_WIN32)
#include <unistd.h>
#endif

#include "AstroStructures.hpp"

namespace star {

// Fatal CLI error: bright red on TTY stderr (honors NO_COLOR), plain in
// pipes/logs. cliFail returns the exit code for `return cliFail(...)`.
inline void cliMsg(const std::string& msg) {
    bool tty = false;
#if !defined(_WIN32)
    tty = ::isatty(STDERR_FILENO) != 0;
#endif
    const bool color = tty && std::getenv("NO_COLOR") == nullptr;
    if (color) std::cerr << "\033[91m";
    std::cerr << msg;
    if (color) std::cerr << "\033[0m";
    std::cerr << "\n";
}

inline int cliFail(const std::string& msg) {
    cliMsg(msg);
    return 1;
}

struct CLIConfig {
    // Input parameters. Unset = must be asked interactively.
    std::string name;              // empty = unset
    int birth_year = -1;           // -1 = unset
    int birth_month = -1;          // -1 = unset
    int birth_day = -1;            // -1 = unset
    int birth_hour = -1;           // -1 = unset
    int birth_minute = -1;         // -1 = unset
    int city_index = -1;           // -1 = unset; 1-15 table, >15 manual entry
    std::optional<bool> nirayana;  // nullopt = unset (true=NRAYANA, false=SAYANA)
    bool thathkala = false;
    // Manual geo for city > 15 (cities not in the list).
    GeoCoord manual_geo{};
    bool manual_geo_set = false;

    // Output options.
    bool show_all_screens = true;
    std::vector<int> screen_filter;  // specific output groups to show (1-14)
    std::string output_format = "text";  // text, json
    std::string output_file;  // empty = stdout (appended when set)
    // Display layer: "modern" (default, corrected + redesigned) or "legacy"
    // (byte-exact original, for verification runs).
    std::string display = "modern";
    // Color: "auto" (TTY only, NO_COLOR respected), "always", "never".
    std::string color = "auto";

    // Verification.
    bool verify_mode = false;
};

class CLI {
public:
    explicit CLI(CLIConfig config);
    int run();

    static std::string loadConfigFilePublic(const std::string& path);
    static CLIConfig parseConfigFilePublic(const std::string& content);

    // Validation helpers (also used by main.cpp for batch flags).
    static bool isLeapYear(int year) noexcept;
    static int daysInMonth(int year, int month) noexcept;
    // Empty string = valid; otherwise a human-readable reason.
    static std::string validateDate(int year, int month, int day);
    static std::string validateTime(int hour, int minute);
    static std::string validateName(const std::string& name);
    static std::string validateCity(int city);
    static std::string validateGeo(int latDeg, int latMin, int lonDeg, int lonMin);
    static std::string trim(std::string_view s);

private:
    CLIConfig config_;
    // True when the input windows prompted (interactive run): echo sections
    // (profile/cities/options/thathkala line) are hidden by default then,
    // since the user just typed them. Explicit --screen still shows them.
    bool prompted_ = false;

    // Returns false when stdin hits EOF (abort cleanly, non-zero exit).
    bool promptMissing();
    bool promptModern();
    void runInteractive();
    int runBaseline() const;
    int runBaselineLegacy() const;
    int runBaselineModern() const;
    bool colorOn() const;
    int runVerify() const;
    void printScreen(int screen_num, const std::string& content) const;
    void writeOutput(const std::string& content) const;
    std::string formatScreen(int screen_num, const std::string& content) const;
    static std::string loadConfigFile(const std::string& path);
    static CLIConfig parseConfigFile(const std::string& content);
    bool batchComplete() const;
};

}  // namespace star

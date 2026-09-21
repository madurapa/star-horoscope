// CLI validation tests: no defaults, day-vs-month incl. leap-year Feb 29.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_cli_valid.cpp src/CLI.cpp src/VargaEngine.cpp -o /tmp/test_cli_valid
#include <cstdio>

#include "../src/CLI.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    STAR_CHECK(CLI::isLeapYear(2000), "2000 leap");
    STAR_CHECK(!CLI::isLeapYear(1900), "1900 not leap");
    STAR_CHECK(CLI::isLeapYear(2024), "2024 leap");
    STAR_CHECK(!CLI::isLeapYear(2023), "2023 not leap");
    STAR_CHECK(CLI::daysInMonth(2024, 2) == 29, "feb29 leap");
    STAR_CHECK(CLI::daysInMonth(2023, 2) == 28, "feb28 non-leap");
    STAR_CHECK(CLI::daysInMonth(2023, 4) == 30, "apr30");
    STAR_CHECK(CLI::validateDate(2024, 2, 29).empty(), "2024-02-29 ok");
    STAR_CHECK(!CLI::validateDate(2023, 2, 29).empty(), "2023-02-29 rejected");
    STAR_CHECK(!CLI::validateDate(2023, 4, 31).empty(), "apr31 rejected");
    STAR_CHECK(!CLI::validateDate(2023, 13, 1).empty(), "month13 rejected");
    STAR_CHECK(!CLI::validateDate(999, 1, 1).empty(), "year999 rejected");
    STAR_CHECK(CLI::validateDate(2000, 8, 17).empty(), "baseline date ok");
    STAR_CHECK(CLI::validateTime(14, 5).empty(), "time ok");
    STAR_CHECK(!CLI::validateTime(24, 0).empty(), "hour24 rejected");
    STAR_CHECK(!CLI::validateTime(12, 60).empty(), "min60 rejected");
    STAR_CHECK(CLI::validateName("Test User").empty(), "name ok");
    STAR_CHECK(!CLI::validateName("   ").empty(), "blank name rejected");
    STAR_CHECK(CLI::validateCity(7).empty(), "city7 ok");
    STAR_CHECK(CLI::validateCity(16).empty(), "city16 list ok");
    STAR_CHECK(!CLI::validateCity(0).empty(), "city0 rejected");
    STAR_CHECK(CLI::validateGeo(6, 37, 80, 24).empty(), "ratnapura geo ok");
    STAR_CHECK(!CLI::validateGeo(91, 0, 80, 0).empty(), "lat91 rejected");
    STAR_CHECK(!CLI::validateGeo(6, 60, 80, 0).empty(), "latmin60 rejected");
    if (::startest::g_fail == 0) std::printf("CLI_VALID_ALL_GREEN\n");
    return ::startest::exitCode();
}

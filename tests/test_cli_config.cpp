// CLI config-file parsing test (parseConfigFilePublic / loadConfigFilePublic).
// No defaults: only keys present in the file are set; the rest stay unset.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_cli_config.cpp src/CLI.cpp src/VargaEngine.cpp -o /tmp/test_cli_config
#include <cstdio>
#include <filesystem>
#include <fstream>
#include <string>

#include "../src/CLI.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    const std::string content =
        "# baseline profile\n"
        "name = Test User\n"
        "birth_year = 2000\n"
        "birth_month = 8\n"
        "birth_day = 17\n"
        "birth_hour = 14\n"
        "birth_minute = 5\n"
        "city_index = 7\n"
        "nirayana = true\n";
    const CLIConfig c = CLI::parseConfigFilePublic(content);
    STAR_CHECK(c.name == "Test User", "name %s", c.name.c_str());
    STAR_CHECK(c.birth_year == 2000 && c.birth_month == 8 && c.birth_day == 17, "ymd");
    STAR_CHECK(c.birth_hour == 14 && c.birth_minute == 5, "hm");
    STAR_CHECK(c.city_index == 7, "city %d", c.city_index);
    STAR_CHECK(c.nirayana.has_value() && *c.nirayana, "nirayana");
    STAR_CHECK(c.show_all_screens, "screens default all");
    STAR_CHECK(c.output_format == "text", "format default text");
    STAR_CHECK(c.color == "auto", "color default auto");
    // Comments / blank lines / unknown keys are skipped; = -less lines skipped.
    const CLIConfig c2 = CLI::parseConfigFilePublic("; comment\n\nbogus line\nfoo = bar\ncity_index = 2\n");
    STAR_CHECK(c2.city_index == 2, "city2 %d", c2.city_index);
    STAR_CHECK(c2.name.empty(), "name unset without default");
    STAR_CHECK(c2.birth_year == -1, "year unset without default");
    STAR_CHECK(!c2.nirayana.has_value(), "nirayana unset without default");
    // screen/output/format/verify keys.
    const CLIConfig c3 = CLI::parseConfigFilePublic(
        "screen = 5,12\noutput_format = json\noutput_file = out.txt\nverify_mode = true\n"
        "color = never\n");
    STAR_CHECK(!c3.show_all_screens && c3.screen_filter.size() == 2, "screen filter");
    STAR_CHECK(c3.output_format == "json", "format json");
    STAR_CHECK(c3.output_file == "out.txt", "output file");
    STAR_CHECK(c3.verify_mode, "verify mode");
    STAR_CHECK(c3.color == "never", "color never");
    // loadConfigFile round-trip via a temp file (portable temp dir:
    // native Windows processes have no /tmp).
    const std::string tmp =
        (std::filesystem::temp_directory_path() / "test_cli_config.ini").string();
    { std::ofstream f(tmp); f << content; }
    STAR_CHECK(CLI::loadConfigFilePublic(tmp) == content, "load round-trip");
    STAR_CHECK(CLI::loadConfigFilePublic("/tmp/does-not-exist-xyz.ini").empty(), "missing empty");
    if (::startest::g_fail == 0) std::printf("CLI_CONFIG_ALL_GREEN\n");
    return ::startest::exitCode();
}

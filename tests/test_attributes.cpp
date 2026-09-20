// Direct production-code test for the binary-extracted tables
// (star_asm_findings.md sections 1-4): yoga names, tithi limbs, karana rule,
// YONI literals. Exercises Panchanga.hpp / Attributes.hpp directly.
// Build: g++ -std=c++20 -Wall -Wextra -O2 -Isrc tests/test_attributes.cpp src/VargaEngine.cpp -o /tmp/test_attributes
#include <cstdio>
#include <cstring>
#include <string>

#include "../src/Attributes.hpp"
#include "../src/Avastha.hpp"
#include "../src/Panchanga.hpp"
#include "check.hpp"

int main() {
    using namespace star;
    // Yoga: former wrong names + the decisive #26 Indra -> Mahendra.
    STAR_CHECK(std::string(yogaName(0)) == "Vishkamba", "yoga0 %s", yogaName(0));
    STAR_CHECK(std::string(yogaName(1)) == "Preethi", "yoga1 %s", yogaName(1));
    STAR_CHECK(std::string(yogaName(25)) == "Mahendra", "yoga25 %s", yogaName(25));
    STAR_CHECK(std::string(yogaName(26)) == "Vydruthi", "yoga26 %s", yogaName(26));
    STAR_CHECK(std::string(yogaName(18)) == "Parigha", "yoga18 %s", yogaName(18));
    // Tithi limbs: all 15 binary literals incl. the 5 former guesses.
    const char* limbs[15] = {"Pelaviya", "Diyawaka", "Thiyawaka", "Jalawaka", "Visheniya",
                             "Shatawaka", "Sathawaka", "Atawaka", "Navawaka", "Dasawaka",
                             "Ekoloswaka", "Doloswaka", "Theleswaka", "Thuduswaka",
                             "Pasaloswaka"};
    for (int i = 0; i < 15; ++i)
        STAR_CHECK(std::string(tithiLimbName(i + 1)) == limbs[i], "limb%d %s", i + 1,
                   tithiLimbName(i + 1));
    // Karana: enumerated binary table (sub_17FFE dispatch), weekday-free.
    STAR_CHECK(std::string(karanaName(0.0, 0)) == "Kinsthugana", "karana k0");
    STAR_CHECK(std::string(karanaName(0.0, 1)) == "Kinsthugana", "karana k0 weekday-free");
    STAR_CHECK(std::string(karanaName(57 * 6.0 + 3, 3)) == "Vanija", "karana k57 (binary, not Shakuna)");
    STAR_CHECK(std::string(karanaName(44 * 6.0, 0)) == "Chathuppada", "karana k44");
    STAR_CHECK(std::string(karanaName(44 * 6.0, 5)) == "Chathuppada", "karana k44 weekday-free");
    STAR_CHECK(std::string(karanaName(59 * 6.0, 3)) == "Naaga", "karana k59");
    STAR_CHECK(std::string(karanaName(136.84, 2)) == "Bava", "karana baseline %s",
               karanaName(136.84, 2));
    STAR_CHECK(std::string(karanaName(39.90732185, 1)) == "Vanija", "karana Test User D %s",
               karanaName(39.90732185, 1));
    STAR_CHECK(std::string(karanaName(39.90732185, 5)) == "Vanija", "karana Test User D weekday-free");
    // YONI literals: the Mushikadena* revert + Sinha 12-char field.
    STAR_CHECK(std::string(yoniFor(10)) == "Mushikadena*", "yoni10 %s", yoniFor(10));
    STAR_CHECK(std::strncmp(yoniFor(24), "Sinha", 5) == 0, "yoni24 prefix");
    STAR_CHECK(std::strlen(yoniFor(24)) == 12, "yoni24 len %zu", std::strlen(yoniFor(24)));
    // Gana/Linga holes (sub_1B689 stale slots, Session 19/19b): Keti (nak 3)
    // matches no Gana set -> port Raxha (6/9 DOS incl. both modes;
    // Maanusha x1 + blank x2 recorded); Siyavsa (nak 24) matches no Linga
    // set (binary 28-typo) -> port Sthree (6/8 DOS; city-dependence proven,
    // no deterministic rule exists).
    STAR_CHECK(std::string(ganaFor(2)) == "Raxha", "gana keti %s", ganaFor(2));
    STAR_CHECK(std::string(lingaFor(23)) == "Sthree", "linga siyavsa %s", lingaFor(23));
    STAR_CHECK(std::string(lingaFor(4)) == "Napunsaka", "linga mrig %s", lingaFor(4));
    // Avastha name order (confirmed, no change).
    STAR_CHECK(std::string(avasthaName(0)) == "Nidra", "av0");
    STAR_CHECK(std::string(avasthaName(11)) == "Kavthuka", "av11");
    if (::startest::g_fail == 0) std::printf("ATTRIBUTES_ALL_GREEN\n");
    return ::startest::exitCode();
}

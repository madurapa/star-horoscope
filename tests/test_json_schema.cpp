// Phase-4 JSON schema conformance (docs/json_schema.md v1).
// Pins the frozen shape + provenance echo, not values (values belong to
// the engine tests). No renderer golden involved.
// Build: via CMake (add_star_test links swisseph); standalone append
// /tmp/star-build/libswisseph.a -ldl -lm to the g++ line in other tests.
#include <cmath>
#include <cstdio>
#include <string>

#include "../src/Engine.hpp"
#include "../src/JsonOutput.hpp"
#include "check.hpp"

static bool finiteNum(const std::string& doc, const char* key) {
    auto p = doc.find(std::string("\"") + key + "\": ");
    if (p == std::string::npos) return false;
    double v = 0.0;
    return std::sscanf(doc.c_str() + p + std::string(key).size() + 4, "%lf", &v) == 1 &&
           std::isfinite(v);
}

int main() {
    using namespace star;
    const HoroscopeOwner owner{"Test \"User\"", 2000, 8, 17, 14, 5};
    const HoroscopeResult h =
        computeHoroscope(owner, cityByIndex(7).coord, true, EngineKind::Dos);
    modern::JsonProvenance prov;
    prov.display = "modern";
    prov.nirayana = true;
    prov.locale = Locale::En;
    prov.cityIndex = 7;
    prov.city = modern::cityLabel(7);
    const std::string doc = modern::renderJson(owner, h, EngineKind::Dos, prov);
    // Frozen shape: every v1 key present exactly as documented.
    for (const char* k :
         {"\"schema\": \"star-horoscope/1\"", "\"version\": \"", "\"name\": ",
          "\"birth_date\": \"2000-08-17\"", "\"birth_time\": \"14:05\"",
          "\"place\": {\"city_index\": 7, \"city\": \"Ratnapura\"}",
          "\"method\": \"nirayana\"", "\"engine\": \"dos\"", "\"display\": \"modern\"",
          "\"locale\": \"en\"", "\"julian_date\": ", "\"ayanamsa_deg\": ",
          "\"longitudes\": {"})
        STAR_CHECK(doc.find(k) != std::string::npos, "has %s", k);
    // Escaping: the quote in the name must not break the document.
    STAR_CHECK(doc.find("\"name\": \"Test \\\"User\\\"\"") != std::string::npos, "escaped");
    // Finite numbers.
    STAR_CHECK(finiteNum(doc, "julian_date"), "jd finite");
    STAR_CHECK(finiteNum(doc, "ayanamsa_deg"), "ayan finite");
    // 13 canonical keys in Planet order, DMS display strings.
    size_t pos = 0;
    static const char* want[13] = {"Lagna",   "Chandra", "Ravi",  "Budha", "Sikuru",
                                   "Kuja",    "Guru",    "Shani", "Raahu", "Kethu",
                                   "Urenus",  "Neptune", "Pluto"};
    for (int i = 0; i < 13; ++i) {
        std::string key = std::string("\"") + want[i] + "\": \"";
        size_t f = doc.find(key, pos);
        STAR_CHECK(f != std::string::npos, "key %s", want[i]);
        pos = f + key.size();
        // value looks like [ ]DDD:DD:DD (display split, no carry assumed)
        int a = 0, b = 0, c = 0;
        char tail = 0;
        STAR_CHECK(std::sscanf(doc.c_str() + pos, " %d:%d:%d%c", &a, &b, &c, &tail) == 4 &&
                       tail == '"',
                   "dms %s", want[i]);
    }
    // Provenance follows flags (sayana + legacy + si render through one path).
    modern::JsonProvenance p2 = prov;
    p2.display = "legacy";
    p2.nirayana = false;
    p2.locale = Locale::Ta;
    const std::string doc2 = modern::renderJson(owner, h, EngineKind::Swiss, p2);
    for (const char* k : {"\"method\": \"sayana\"", "\"engine\": \"swisseph\"",
                          "\"display\": \"legacy\"", "\"locale\": \"ta\""})
        STAR_CHECK(doc2.find(k) != std::string::npos, "prov %s", k);
    if (::startest::g_fail == 0) std::printf("JSON_SCHEMA_ALL_GREEN\n");
    return ::startest::exitCode();
}

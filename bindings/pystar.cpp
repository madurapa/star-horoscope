// Python bindings (nanobind): pure consumer of the frozen JSON schema.
// The engine stays C++; Python receives schema-v1 JSON strings and parses
// them with the stdlib json module (see bindings/smoke.py). No output-side
// enforcement lives here — shape is pinned by tests/test_json_schema.cpp.
// Build: cmake -S . -B build -DSTAR_PYTHON=ON (needs Python 3.12+ dev +
// pip-installed nanobind), then import from the build tree.
#include <nanobind/nanobind.h>
#include <nanobind/stl/optional.h>
#include <nanobind/stl/string.h>

#include <ctime>
#include <optional>
#include <stdexcept>

#include "../src/CLI.hpp"
#include "../src/Engine.hpp"
#include "../src/JsonOutput.hpp"

namespace nb = nanobind;
using namespace star;

// Mirror CLI::ownerFromConfig() thathkala branch (name literal sic).
static HoroscopeOwner thathkalaOwner() {
    HoroscopeOwner o;
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

static std::string horoscopeJson(const std::string& name, int year, int month, int day,
                                 int hour, int minute, int city, bool nirayana,
                                 const std::string& engine, const std::string& locale,
                                 std::optional<int> lat_deg, std::optional<int> lat_min,
                                 std::optional<int> lon_deg, std::optional<int> lon_min,
                                 bool thathkala) {
    std::string err;
    EngineKind kind = EngineKind::Swiss;
    if (engine == "dos")
        kind = EngineKind::Dos;
    else if (engine != "swisseph")
        throw nb::value_error("engine wants dos|swisseph");
    Locale loc = Locale::En;
    if (!parseLocale(locale, loc)) throw nb::value_error("locale wants en|si|ta");
    HoroscopeOwner owner;
    GeoCoord geo = kColomboFallback;
    int cityIndex = city;
    std::string cityLabel;
    const bool manualGeo =
        lat_deg.has_value() || lat_min.has_value() || lon_deg.has_value() || lon_min.has_value();
    if (thathkala) {
        // Mirror CLI thathkala: birth/city args unused, Colombo fallback.
        owner = thathkalaOwner();
        cityIndex = 1;
        cityLabel = "Colombo (Thathkala default)";
    } else {
        if (!(err = CLI::validateName(name)).empty()) throw nb::value_error(err.c_str());
        if (!(err = CLI::validateDate(year, month, day)).empty())
            throw nb::value_error(err.c_str());
        if (!(err = CLI::validateTime(hour, minute)).empty())
            throw nb::value_error(err.c_str());
        if (!(err = CLI::validateCity(city)).empty()) throw nb::value_error(err.c_str());
        owner = HoroscopeOwner{name, year, month, day, hour, minute};
        if (city > kCityCount) {
            // Mirror CLI: manual entry needs all four geo fields.
            if (!lat_deg.has_value() || !lat_min.has_value() || !lon_deg.has_value() ||
                !lon_min.has_value())
                throw nb::value_error("city > 26 needs lat_deg/lat_min/lon_deg/lon_min");
            if (!(err = CLI::validateGeo(*lat_deg, *lat_min, *lon_deg, *lon_min)).empty())
                throw nb::value_error(err.c_str());
            geo = GeoCoord{*lat_deg, *lat_min, *lon_deg, *lon_min};
            cityLabel = "Manual entry";
        } else {
            if (manualGeo)
                throw nb::value_error("manual geo needs city > 26 (else it would be ignored)");
            geo = cityByIndex(city).coord;
            cityLabel = modern::cityLabel(city);
        }
    }
    const HoroscopeResult h = computeHoroscope(owner, geo, nirayana, kind);
    if (!h.engineOk) throw std::runtime_error(h.engineError);
    const YMD birth{owner.birth_year, owner.birth_month, owner.birth_day};
    const double birthFrac = fracYear(owner.birth_year, owner.birth_month, owner.birth_day);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    modern::JsonProvenance prov;
    prov.nirayana = nirayana;
    prov.locale = loc;
    prov.cityIndex = cityIndex;
    prov.city = cityLabel;
    return modern::renderJson(owner, h, kind, prov, birth, birthFrac, bal);
}

NB_MODULE(pystar, m) {
    m.doc() = "STAR horoscope engine (frozen JSON schema consumer)";
    m.def("version", [] { return std::string(modern::kAppVersion); });
    m.def("schema", [] { return std::string("star-horoscope/2"); });
    m.def("horoscope", &horoscopeJson, nb::arg("name"), nb::arg("year"), nb::arg("month"),
          nb::arg("day"), nb::arg("hour"), nb::arg("minute"), nb::arg("city"),
          nb::arg("nirayana") = true, nb::arg("engine") = "swisseph",
          nb::arg("locale") = "en", nb::arg("lat_deg") = nb::none(),
          nb::arg("lat_min") = nb::none(), nb::arg("lon_deg") = nb::none(),
          nb::arg("lon_min") = nb::none(), nb::arg("thathkala") = false,
          "Compute a horoscope; returns a star-horoscope/2 JSON document.");
}

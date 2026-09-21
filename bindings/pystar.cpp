// Python bindings (nanobind): pure consumer of the frozen JSON schema.
// The engine stays C++; Python receives schema-v1 JSON strings and parses
// them with the stdlib json module (see bindings/smoke.py). No output-side
// enforcement lives here — shape is pinned by tests/test_json_schema.cpp.
// Build: cmake -S . -B build -DSTAR_PYTHON=ON (needs Python 3.12+ dev +
// pip-installed nanobind), then import from the build tree.
#include <nanobind/nanobind.h>
#include <nanobind/stl/string.h>

#include <stdexcept>

#include "../src/CLI.hpp"
#include "../src/Engine.hpp"
#include "../src/JsonOutput.hpp"

namespace nb = nanobind;
using namespace star;

static std::string horoscopeJson(const std::string& name, int year, int month, int day,
                                 int hour, int minute, int city, bool nirayana,
                                 const std::string& engine, const std::string& display,
                                 const std::string& locale) {
    std::string err;
    if (!(err = CLI::validateName(name)).empty()) throw nb::value_error(err.c_str());
    if (!(err = CLI::validateDate(year, month, day)).empty())
        throw nb::value_error(err.c_str());
    if (!(err = CLI::validateTime(hour, minute)).empty()) throw nb::value_error(err.c_str());
    if (!(err = CLI::validateCity(city)).empty()) throw nb::value_error(err.c_str());
    if (city > kCityCount)
        throw nb::value_error("city must be 1-26 (manual geo not exposed yet)");
    EngineKind kind = EngineKind::Swiss;
    if (engine == "dos")
        kind = EngineKind::Dos;
    else if (engine != "swisseph")
        throw nb::value_error("engine wants dos|swisseph");
    if (display != "modern" && display != "legacy")
        throw nb::value_error("display wants modern|legacy");
    Locale loc = Locale::En;
    if (!parseLocale(locale, loc)) throw nb::value_error("locale wants en|si|ta");
    const HoroscopeOwner owner{name, year, month, day, hour, minute};
    const HoroscopeResult h = computeHoroscope(owner, cityByIndex(city).coord, nirayana, kind);
    if (!h.engineOk) throw std::runtime_error(h.engineError);
    const YMD birth{year, month, day};
    const double birthFrac = fracYear(year, month, day);
    const DasaBalance bal = dasaBalance(h.moonNirayanaDeg);
    modern::JsonProvenance prov;
    prov.display = display.c_str();
    prov.nirayana = nirayana;
    prov.locale = loc;
    prov.cityIndex = city;
    prov.city = modern::cityLabel(city);
    return modern::renderJson(owner, h, kind, prov, birth, birthFrac, bal);
}

NB_MODULE(pystar, m) {
    m.doc() = "STAR horoscope engine (frozen JSON schema consumer)";
    m.def("version", [] { return std::string(modern::kAppVersion); });
    m.def("schema", [] { return std::string("star-horoscope/1"); });
    m.def("horoscope", &horoscopeJson, nb::arg("name"), nb::arg("year"), nb::arg("month"),
          nb::arg("day"), nb::arg("hour"), nb::arg("minute"), nb::arg("city"),
          nb::arg("nirayana") = true, nb::arg("engine") = "swisseph",
          nb::arg("display") = "modern", nb::arg("locale") = "en",
          "Compute a horoscope; returns a star-horoscope/1 JSON document.");
}

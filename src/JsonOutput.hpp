#pragma once
// Phase-4 JSON output (schema v1, frozen: docs/json_schema.md).
// Provenance-bearing machine output for pure consumers (Python/TS later):
// every document says which engine, display, method, locale, and app
// version produced it. Hand-rolled (no third-party JSON dep by design);
// strings are escaped, doubles are finite-checked by the caller contract
// (engine outputs are always finite — see test_json_schema).
// PROVENANCE: SCAFFOLD (shape per plans.md Phase 4; values from Engine).
#include <iomanip>
#include <sstream>
#include <string>

#include "Engine.hpp"
#include "ModernRenderer.hpp"

namespace star {
namespace modern {

// Minimal JSON string escaping (names are free text up to 60 chars).
inline std::string jsonEscape(std::string_view s) {
    std::string o;
    for (char c : s) {
        switch (c) {
            case '"': o += "\\\""; break;
            case '\\': o += "\\\\"; break;
            default:
                if (c >= 0x00 && c < 0x20) {
                    char b[8];
                    std::snprintf(b, sizeof(b), "\\u%04x", c);
                    o += b;
                } else {
                    o += c;
                }
        }
    }
    return o;
}

// Provenance captured at render time (CLI fills from its config).
struct JsonProvenance {
    const char* display = "modern";  // modern|legacy
    bool nirayana = true;
    Locale locale = Locale::En;
    int cityIndex = 0;      // <=0 = manual/unknown
    std::string city;       // resolved label ("Ratnapura", "Manual entry", ...)
};

inline std::string renderJson(const HoroscopeOwner& owner, const HoroscopeResult& h,
                              EngineKind kind, const JsonProvenance& prov) {
    char born[16], btime[8];
    std::snprintf(born, sizeof(born), "%04d-%02d-%02d", owner.birth_year, owner.birth_month,
                  owner.birth_day);
    std::snprintf(btime, sizeof(btime), "%02d:%02d", owner.birth_hour, owner.birth_minute);
    std::ostringstream js;
    js << "{\n";
    js << "  \"schema\": \"star-horoscope/1\",\n";
    js << "  \"version\": \"" << kAppVersion << "\",\n";
    js << "  \"name\": \"" << jsonEscape(owner.name) << "\",\n";
    js << "  \"birth_date\": \"" << born << "\",\n";
    js << "  \"birth_time\": \"" << btime << "\",\n";
    js << "  \"place\": {\"city_index\": " << prov.cityIndex << ", \"city\": \""
       << jsonEscape(prov.city) << "\"},\n";
    js << "  \"method\": \"" << (prov.nirayana ? "nirayana" : "sayana") << "\",\n";
    js << "  \"engine\": \"" << (kind == EngineKind::Swiss ? "swisseph" : "dos") << "\",\n";
    js << "  \"display\": \"" << jsonEscape(prov.display) << "\",\n";
    js << "  \"locale\": \"" << localeName(prov.locale) << "\",\n";
    js << "  \"julian_date\": " << std::fixed << std::setprecision(6) << h.jd << ",\n";
    js << "  \"ayanamsa_deg\": " << h.ayanamsaDeg << ",\n";
    js << "  \"longitudes\": {\n";
    bool first = true;
    // Phase-1 array read: canonical Planet order == houseTableOrder keys,
    // so JSON keys stay byte-identical (proven by pre/post diff, Session 54).
    for (int i = 0; i < 13; ++i) {
        const char* k = kPlanetNames[static_cast<std::size_t>(i)];
        const PlanetLongitude& pl = h.output.lonOf(static_cast<Planet>(i));
        if (!first) js << ",\n";
        first = false;
        js << "    \"" << k << "\": \"" << formatDMS(pl.ecliptic) << "\"";
    }
    js << "\n  }\n}\n";
    return js.str();
}

}  // namespace modern
}  // namespace star

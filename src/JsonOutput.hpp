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

#include "Attributes.hpp"
#include "Bhava.hpp"
#include "Engine.hpp"
#include "ModernRenderer.hpp"
#include "Vimshottari.hpp"

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
                              EngineKind kind, const JsonProvenance& prov,
                              const YMD& birth, double birthFrac, const DasaBalance& bal) {
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
    js << "\n  },\n";
    // Lagna reference (modern corrected rasi spellings throughout).
    const double lagnaDec = h.output.lonOf(Planet::Lagna).ecliptic.toDecimal();
    js << "  \"lagna\": {\"rasi\": \"" << rasiName(VargaEngine::GetRashiIndex(lagnaDec))
       << "\", \"degree\": \"" << formatDMS(h.output.lonOf(Planet::Lagna).rasiRel)
       << "\", \"navamsa\": \"" << rasiName(VargaEngine::GetNavamshaIndex(lagnaDec))
       << "\"},\n";
    // Equal houses from Lagna (Bhava houseOf; avastha deferred — needs
    // mode-longitude plumbing, see Avastha.hpp).
    js << "  \"houses\": {\n";
    first = true;
    for (int i = 0; i < 13; ++i) {
        const double lon = h.output.lonOf(static_cast<Planet>(i)).ecliptic.toDecimal();
        if (!first) js << ",\n";
        first = false;
        js << "    \"" << kPlanetNames[static_cast<std::size_t>(i)]
           << "\": " << houseOf(lon, lagnaDec);
    }
    js << "\n  },\n";
    // Avastha states (already planet-indexed by the engine; "" if blank).
    js << "  \"avastha\": {\n";
    first = true;
    for (int i = 0; i < 13; ++i) {
        if (!first) js << ",\n";
        first = false;
        js << "    \"" << kPlanetNames[static_cast<std::size_t>(i)]
           << "\": \"" << jsonEscape(h.output.avastha[static_cast<std::size_t>(i)]) << "\"";
    }
    js << "\n  },\n";
    // Shadvarga seats (modern rasi spellings).
    js << "  \"shadvarga\": {\n";
    first = true;
    for (int i = 0; i < 13; ++i) {
        const double lon = h.output.lonOf(static_cast<Planet>(i)).ecliptic.toDecimal();
        const std::array<int, 6> sv = VargaEngine::GetShadvarga(lon);
        if (!first) js << ",\n";
        first = false;
        js << "    \"" << kPlanetNames[static_cast<std::size_t>(i)] << "\": [";
        for (int v = 0; v < 6; ++v) js << (v ? ", " : "") << "\"" << rasiName(sv[v]) << "\"";
        js << "]";
    }
    js << "\n  },\n";
    // Panchanga limbs (engine strings).
    const PanchangaInfo& pg = h.panchanga;
    js << "  \"panchanga\": {\"weekday\": \"" << jsonEscape(pg.weekday) << "\", \"nakshatra\": \""
       << jsonEscape(pg.nakshatra) << "\", \"pada\": " << pg.pada << ", \"tithi\": \""
       << jsonEscape(pg.tithiText) << "\", \"yoga\": \"" << jsonEscape(pg.yoga)
       << "\", \"karana\": \"" << jsonEscape(pg.karana) << "\"},\n";
    // Time metrics (display clock splits, 12h sunset like the screens).
    auto hms = [](const HMS& t) {
        char b[40];  // wide: %02d on unbounded int trips -Wformat-truncation
        std::snprintf(b, sizeof(b), "%02d:%02d:%02d", t.h, t.m, t.s);
        return std::string(b);
    };
    HMS setHms = displayHms(h.setH);
    setHms.h %= 12;
    js << "  \"times\": {\"birth\": \"" << hms(displayHms(h.birthDecHours)) << "\", \"sinhala\": \""
       << hms(displayHms(sinhalaGhati(h.birthDecHours, h.riseH))) << "\", \"sunrise\": \""
       << hms(displayHms(h.riseH)) << "\", \"sunset\": \"" << hms(setHms)
       << "\", \"ut\": \"" << hms(displayHms(h.birthDecHours - kTzHours))
       << "\", \"lmst\": \"" << hms(displayHms(h.lmstHours)) << "\"},\n";
    // Dasa: opening balance + full maha timeline (ISO dates).
    const std::vector<DasaSpan> mahas = mahaTimeline(birth, birthFrac, bal);
    auto ymd = [](const YMD& d) {
        char b[16];
        std::snprintf(b, sizeof(b), "%04d-%02d-%02d", d.y, d.m, d.d);
        return std::string(b);
    };
    js << "  \"dasa\": {\"balance_lord\": \"" << kDasaCycle[bal.lordCycleIdx].name
       << "\", \"balance\": \"" << bal.ymd.y << "y " << bal.ymd.m << "m " << bal.ymd.d
       << "d\", \"mahas\": [\n";
    for (size_t i = 0; i < mahas.size(); ++i) {
        js << "    {\"lord\": \"" << mahas[i].lord << "\", \"from\": \"" << ymd(mahas[i].from)
           << "\", \"to\": \"" << ymd(mahas[i].to) << "\"}" << (i + 1 < mahas.size() ? "," : "")
           << "\n";
    }
    js << "  ]}\n,\n";
    // Hora lords + chakra attributes (yoni display-truncated like modern).
    const HoraTriple ht =
        horaChain(weekdayIndex(h.jdn0), sinhalaGhati(h.birthDecHours, h.riseH));
    const NakAttributes at = attributesFor(h.panchanga.nakIndex);
    js << "  \"hora\": {\"kala\": \"" << jsonEscape(ht.kala) << "\", \"panchama\": \""
       << jsonEscape(ht.pancha) << "\", \"sukshama\": \"" << jsonEscape(ht.sukshama)
       << "\"},\n";
    js << "  \"chakra\": {\"gana\": \"" << jsonEscape(ganaFor(h.panchanga.nakIndex))
       << "\", \"yoni\": \"" << jsonEscape(displayYoni(at.yoni)) << "\", \"linga\": \""
       << jsonEscape(at.linga) << "\", \"naadi\": \"" << jsonEscape(at.naadi)
       << "\", \"varna\": \"" << jsonEscape(at.varna) << "\", \"ruxha\": \""
       << jsonEscape(at.ruxha) << "\", \"paxhi\": \"" << jsonEscape(at.paxhi)
       << "\", \"gothra\": \"" << jsonEscape(at.gothra) << "\", \"rajju\": \""
       << jsonEscape(at.rajju) << "\", \"bhutha\": \"" << jsonEscape(at.bhutha) << "\"}\n}\n";
    return js.str();
}

}  // namespace modern
}  // namespace star

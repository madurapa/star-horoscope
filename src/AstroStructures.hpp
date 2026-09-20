#pragma once
// STAR.EXE Phase 1 — database model structures.
// Source mapping: docs/data_structures.md (dseg words 2793A/2793C/2793E/27940,
// city dispatcher PROGRAM 0x11096-0x113a7, Colombo fallback 0x10d61).
// C++20, header-only, no dependencies.

#include <array>
#include <climits>
#include <cmath>
#include <cstdint>
#include <map>
#include <string>

namespace star {

// ---------------------------------------------------------------- Horoscope input
struct HoroscopeOwner {
    std::string name;
    int birth_year   = 0;
    int birth_month  = 0;
    int birth_day    = 0;
    int birth_hour   = 0;
    int birth_minute = 0;
};

// ---------------------------------------------------------------- Geo model
// Mirrors dseg words: 2793A = lat deg, 2793C = lat min,
//                     2793E = lon deg, 27940 = lon min.
struct GeoCoord {
    int lat_deg = 0;
    int lat_min = 0;
    int lon_deg = 0;
    int lon_min = 0;

    [[nodiscard]] constexpr double decimalLat() const noexcept {
        const double mag = static_cast<double>(lat_deg < 0 ? -lat_deg : lat_deg) +
                           static_cast<double>(lat_min) / 60.0;
        return lat_deg < 0 ? -mag : mag;
    }
    [[nodiscard]] constexpr double decimalLon() const noexcept {
        const double mag = static_cast<double>(lon_deg < 0 ? -lon_deg : lon_deg) +
                           static_cast<double>(lon_min) / 60.0;
        return lon_deg < 0 ? -mag : mag;
    }
};

struct CityEntry {
    int index = 0;            // 1..15, as compared via @__Cmp against Real 1.0..15.0
    const char* label = "";   // screen list spelling ("CLOMBO", "A\"PURA", ...)
    GeoCoord coord;
};

// Colombo fallback seeded at 0x10d61 when Thathkala-Kendra path skips entry.
inline constexpr GeoCoord kColomboFallback{6, 50, 79, 50};

// Full dispatcher table (decoded at docs/data_structures.md section 3).
// Element 0 is unused so that table[i].index == i.
inline constexpr std::array<CityEntry, 16> kCities{{
    {0,  "",          {0,  0,  0,  0 }},
    {1,  "CLOMBO",    {6, 53, 79, 51}},   // 0x110bf
    {2,  "GALLE",     {5, 58, 80, 13}},   // 0x110f0
    {3,  "MATHARA",   {5, 54, 80, 33}},   // 0x11122
    {4,  "KANDY",     {7,  7, 80, 38}},   // 0x11153
    {5,  "HAMBANTOTA",{6,  3, 81,  7}},   // 0x11185
    {6,  "KALUTHARA", {6, 31, 79, 58}},   // 0x111b7
    {7,  "RATNAPURA", {6, 37, 80, 24}},   // 0x111e9 (baseline scenario)
    {8,  "PUTTLAM",   {7, 59, 79, 50}},   // 0x1121a
    {9,  "A\"PURA",   {8, 13, 80, 25}},   // 0x1124c
    {10, "POLONARU",  {7, 54, 81,  0}},   // 0x1127e
    {11, "JAFFNA",    {9, 36, 80,  1}},   // 0x112af
    {12, "TRINCO",    {8, 32, 81, 14}},   // 0x112e1
    {13, "MATHARA",   {7, 40, 81, 43}},   // 0x11313 (label sic in binary:
                                         // coords are Batticaloa 7°43'/81°42',
                                         // NOT Matara — never "correct" coords to label)
    {14, "BADULLA",   {6, 55, 81,  3}},   // 0x11345
    {15, "K\"GALA",   {7, 25, 80, 23}},   // 0x11377
}};

[[nodiscard]] inline constexpr const CityEntry& cityByIndex(int idx) noexcept {
    return kCities[(idx >= 1 && idx <= 15) ? static_cast<std::size_t>(idx) : 0];
}

// Hardcoded Sri Lanka zone: +5:30, no DST (docs/time_and_dasa_logic.md section 2).
inline constexpr int kTimezoneOffsetMin = 330;

// ---------------------------------------------------------------- Astro domains
enum class Planet : std::uint8_t {
    Lagna, Chandra, Ravi, Budha, Sikuru, Kuja, Guru,
    Shani, Raahu, Kethu, Urenus, Neptune, Pluto
};

// PROVENANCE: FITTED (Planet order == screen05 house-table order, ex-houseTableOrder).
inline constexpr std::array<const char*, 13> kPlanetNames{
    "Lagna", "Chandra", "Ravi", "Budha", "Sikuru", "Kuja", "Guru",
    "Shani", "Raahu", "Kethu", "Urenus", "Neptune", "Pluto"};

// ---------------------------------------------------------------- Per-slot display names
// Phase-1 array-indexed storage backbone: one canonical spelling table per
// (planet, output slot), replacing string-keyed aliases ("Sandu"/"Chandra"/
// "Chadra", "Rahu"/"Raahu", "Ketu"/"Kethu", "Neptun"/"Neptune", "Rav1"...).
// Every cell mirrors a tested legacy mapping (see tests/test_slot_names.cpp);
// behavior change needs re-baselining, never silent edits.
enum class NameSlot : std::uint8_t { House, Shadvarga, HoraA, HoraB, Dasa, Balance };

// PROVENANCE: FITTED (each cell mirrors a tested legacy mapping; see tests/test_slot_names.cpp).
[[nodiscard]] inline const char* planetSlotName(Planet p, NameSlot s) noexcept {
    static const char* const k[13][6] = {
        // House,     Shadvarga, HoraA,     HoraB,    Dasa,    Balance
        {"Lagna",  "Lagna",   "",        "",       "",      "Lagna"  },  // Lagna
        {"Sandu",  "Chandra", "Chandra", "Chadra", "Sandu", "Chandra"},  // Chandra
        {"Ravi",   "Rav1",    "Ravi",    "Ravi",   "Ravi",  "Rav1"   },  // Ravi
        {"Budha",  "Budha",   "Budha",   "Budha",  "Budha", "Budha"  },  // Budha
        {"Sikuru", "Sikuru",  "Sikuru",  "Sikuru", "Sikuru","Sikuru" },  // Sikuru
        {"Kuja",   "Kuja",    "Kuja",    "Kuja",   "Kuja",  "Kuja"   },  // Kuja
        {"Guru",   "Guru",    "Guru",    "Guru",   "Guru",  "Guru"   },  // Guru
        {"Shani",  "Shani",   "Shani",   "Shani",  "Shani", "Shani"  },  // Shani
        {"Raahu",  "Raahu",   "",        "",       "Rahu",  "Raahu"  },  // Raahu
        {"Kethu",  "Kethu",   "",        "",       "Ketu",  "Kethu"  },  // Kethu
        {"Urenus", "Urenes",  "",        "",       "",      "Urenes" },  // Urenus
        {"Neptun", "Neptune", "",        "",       "",      "Neptune"},  // Neptune
        {"Pluto",  "Pluuto",  "",        "",       "",      "Pluuto" },  // Pluto
    };
    const int pi = static_cast<int>(p);
    const int si = static_cast<int>(s);
    if (pi < 0 || pi > 12 || si < 0 || si > 5) return "";
    return k[pi][si];
}

// Rasi indices pinned by screen07 numeric matrix (Mesha=1 .. Meena=12).
// PROVENANCE: FITTED (screen07 numeric matrix).
enum class Rasi : std::uint8_t {
    Mesha = 1, Wrushaba, Mituna, Kataka, Sinha, Kanya,
    Thula, Wrschika, Dhanu, Makara, Kumba, Meena
};

enum class Varga : std::uint8_t { Rashi, Navamsaka, Hora, Deshkana, Dvadasansa, Trishansa };

// Vimshottari maha-dasa year lengths; order starts at Ketu (docs/time_and_dasa_logic.md).
// PROVENANCE: FITTED (classical order/periods, validated against screen14-16 timelines; no binary address in comment).
struct DasaLord {
    const char* name = "";
    int years = 0;
};
inline constexpr std::array<DasaLord, 9> kVimshottari{{
    {"Ketu", 7}, {"Sikuru", 20}, {"Ravi", 6}, {"Sandu", 10}, {"Kuja", 7},
    {"Rahu", 18}, {"Guru", 16}, {"Shani", 19}, {"Budha", 17},
}};
inline constexpr int kVimshottariTotalYears = 120;

// ---------------------------------------------------------------- Angles
// Integer D:M:S exactly as printed in screen05 (e.g. Lagna 334 50 42).
struct AngularDegrees {
    int deg = 0;   // 0..359 ecliptic (or 0..29 rasi-relative)
    int min = 0;   // 0..59
    int sec = 0;   // 0..59

    [[nodiscard]] constexpr long totalArcSec() const noexcept {
        return static_cast<long>(deg) * 3600L + static_cast<long>(min) * 60L + sec;
    }
    [[nodiscard]] constexpr bool operator==(const AngularDegrees& o) const noexcept {
        return deg == o.deg && min == o.min && sec == o.sec;
    }
    [[nodiscard]] constexpr bool operator!=(const AngularDegrees& o) const noexcept {
        return !(*this == o);
    }
    [[nodiscard]] double toDecimal() const noexcept {
        return static_cast<double>(deg) + static_cast<double>(min) / 60.0 +
               static_cast<double>(sec) / 3600.0;
    }
    // Raw DMS decomposition, matching the binary's display path:
    //  - negatives wrap UP into [0,360) (Invalid_Time Sikuru -13.26 prints
    //    346:44:22), positives NEVER wrap down (Lagna 591:11:18 prints raw);
    //  - seconds are rounded but NEVER carried (Invalid_City Shani prints
    //    213:52:60, not 213:53:00). Value-preserving: toDecimal() and
    //    totalArcSec() stay exact, so all computation is unaffected.
    [[nodiscard]] static AngularDegrees fromDecimal(double v) noexcept {
        while (v < 0.0) v += 360.0;
        int d = static_cast<int>(v);
        double f = (v - d) * 60.0;
        int m = static_cast<int>(f);
        // Overflow clamp (Phase-1 safe item): lround() on unobserved
        // magnitudes would overflow int (UB); clamp to int range.
        // Observed values (incl. non-carry 60s) pass through untouched.
        const long sl = std::lround((f - m) * 60.0);
        const int s = (sl > INT_MAX) ? INT_MAX : ((sl < INT_MIN) ? INT_MIN : static_cast<int>(sl));
        return {d, m, s};
    }
};

struct PlanetLongitude {
    AngularDegrees ecliptic;   // full 0..359 longitude (screen05 LONGITUDE cols)
    AngularDegrees rasiRel;    // RASI LONGITUDE cols (0..29 + rasi name)
};

// ---------------------------------------------------------------- Engine output (Phase 4 assert target)
struct AstroEngineOutput {
    std::map<std::string, PlanetLongitude> longitudes;  // keyed "Lagna","Chandra",...
    // Phase-1 array-indexed storage: same values keyed by Planet instead of
    // spelling aliases (populated by Engine; consumers migrate one site at
    // a time, then the alias keys drop).
    std::array<PlanetLongitude, 13> lonByPlanet{};
    [[nodiscard]] const PlanetLongitude& lonOf(Planet p) const noexcept {
        return lonByPlanet[static_cast<std::size_t>(p)];
    }
    std::array<std::string, 13> avastha{};  // Planet-indexed AVASTHA ("" if blank)
    double julianDate = 0.0;
    AngularDegrees ayanamsa{};
};

}  // namespace star

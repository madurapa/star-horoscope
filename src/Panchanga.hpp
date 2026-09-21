#pragma once
// STAR.EXE Panchanga (five-limb almanac) engine.
// Provenance: tests/screens/screen12.txt PANCHANGAYA block for the baseline
//   (Test User, 2000-08-17 14:05, Ratnapura, Nirayana):
//     DAY: Thursday | NEKATHA: Puvaputupa | PADAYA: 2
//     THITIYA: Ava -Thiyawaka - 3 | YOGAYA: Sukarna | KARANAYA: Kavlava
// All five limbs derive from the Nirayana Sun/Moon longitudes + JD with
// closed-form classical rules (no binary tables needed):
//   Vaara    = weekday from JD (floor(JD+1.5) mod 7, 0=Sunday).
//   Tithi    = floor(elongation/12)+1 (1..30); waxing iff elongation < 180.
//   Nakshatra= floor(moon/13.333..) (0..26); Pada = floor(rem/3.333..)+1.
//   Yoga     = floor((sun+moon mod 360)/13.333..) (0..26).
//   Karana   = floor(elongation/6) (0..59): 0 Kinsthugana, 57 Shakuna,
//              58 Chathuppada, 59 Naaga, else the repeating seven
//              Bava/Baalava/Kavlava/Thithila/Garaja/Vanija/Vishti
//              (binary-extracted classical order, no weekday term).
// Display spellings follow screen05/screen12 (Sinhala terms in Latin script).

#include <cmath>
#include <string>

namespace star {

// PROVENANCE: DECODED (Real48 40/3, inherits AstroTime::kNakshatraSpan).
inline constexpr double kNakSpanPanch = 13.333333333328483;   // real48 40/3 (AstroTime::kNakshatraSpan)
inline constexpr double kPadaSpanPanch = 10.0 / 3.0;  // 3.333... deg

// 27 nakshatra display names — BINARY-LITERAL spellings assembled from the
// four scenario transcripts (screen05 + TRANSCRI2/3/4) and the 8 machine
// captures (house-table NEKETH + screen12/13 NEKATHA share one table — no
// capture shows a divergent NEKATHA spelling for any index). Attested
// deviations from classical: Berana (Bharani), Ada (Ardra), Pushha (Pushya),
// Suvana (Sravana), Siyavsa (Siyavasa), Keti, Rehena, Muvasirasa, Maa,
// Puvapal, Puvasala, Hata, Denata, Revathee (see prior notes).
// (A prior "screen12 Siyavasa" claim was unfounded — machines show Siyavsa
// in the table and no NEKATHA evidence exists; corrected 2026-09-16.)
// PROVENANCE: FITTED (assembled from four scenario transcripts + 8 machine captures; no binary tables per header).
inline const char* nakshatraDisplayName(int idx0) {
    static const char* kNames[27] = {
        "Asvida", "Berana", "Keti", "Rehena", "Muvasirasa", "Ada",
        "Punavasa", "Pushha", "Aslisa", "Maa", "Puvapal", "Utrapal",
        "Hata", "Sita", "Saa", "Visa", "Anura", "Deta",
        "Mula", "Puvasala", "Utrasala", "Suvana", "Denata", "Siyavsa",
        "Puvaputupa", "Utraputupa", "Revathee"};
    if (idx0 < 0) idx0 = 0;
    if (idx0 > 26) idx0 = 26;
    return kNames[idx0];
}

[[nodiscard]] inline int nakshatraIndex(double moonDeg) noexcept {
    double v = std::fmod(moonDeg, 360.0);
    if (v < 0.0) v += 360.0;
    int n = static_cast<int>(v / kNakSpanPanch);
    if (n < 0) n = 0;
    if (n > 26) n = 26;
    return n;
}

[[nodiscard]] inline int nakshatraPadaOf(double moonDeg) noexcept {
    double v = std::fmod(moonDeg, 360.0);
    if (v < 0.0) v += 360.0;
    const double rem = v - nakshatraIndex(v) * kNakSpanPanch;
    int p = static_cast<int>(rem / kPadaSpanPanch) + 1;
    if (p < 1) p = 1;
    if (p > 4) p = 4;
    return p;
}

// Weekday from the CIVIL-date JD (jdn0, noon of the birth date — NOT the
// full JD+UT). Proven by screen_test Invalid_Time (1975-03-02, Sunday):
// full JD 2442475.201 -> floor(+1.5)%7 = Monday ✗, while jdn0 2442474.0 ->
// Sunday ✓. 0=Sunday .. 6=Saturday (JD 2451545.0 = Saturday noon).
[[nodiscard]] inline int weekdayIndex(double jd) noexcept {
    long n = static_cast<long>(std::floor(jd + 1.5));
    int w = static_cast<int>(n % 7L);
    if (w < 0) w += 7;
    return w;
}

inline const char* weekdayName(int w) {
    static const char* kDays[7] = {
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    if (w < 0 || w > 6) return "?";
    return kDays[w];
}

// Solar-lunar elongation in [0, 360).
[[nodiscard]] inline double elongationDeg(double sunDeg, double moonDeg) noexcept {
    double e = std::fmod(moonDeg - sunDeg, 360.0);
    if (e < 0.0) e += 360.0;
    return e;
}

// Tithi number 1..30 (1..15 waxing = Pura, 16..30 waning = Ava).
[[nodiscard]] inline int tithiNumber(double elongDeg) noexcept {
    int t = static_cast<int>(elongDeg / 12.0) + 1;
    if (t < 1) t = 1;
    if (t > 30) t = 30;
    return t;
}

// Sinhala tithi limb names, 1..15 within each paksha. BINARY-EXTRACTED
// (STAR.EXE.asm inline Pascal literals, star_asm_findings.md section 2):
// all 15 recovered literally, settling the 5 former guesses (#3 Thiyawaka,
// #8 Atawaka, #10 Dasawaka, #11 Ekoloswaka, #15 Pasaloswaka).
// PROVENANCE: DECODED (STAR.EXE.asm inline Pascal literals, all 15 recovered literally).
inline const char* tithiLimbName(int limb1to15) {
    static const char* kLimbs[15] = {
        "Pelaviya", "Diyawaka", "Thiyawaka", "Jalawaka", "Visheniya", "Shatawaka",
        "Sathawaka", "Atawaka", "Navawaka", "Dasawaka", "Ekoloswaka", "Doloswaka",
        "Theleswaka", "Thuduswaka", "Pasaloswaka"};
    if (limb1to15 < 1 || limb1to15 > 15) return "?";
    return kLimbs[limb1to15 - 1];
}

// Full tithi display. Waxing: "Pura-<limb %-11s>-<tithi %2d>" (limb==tithi,
// e.g. "Pura-Doloswaka  -12", "Pura-Diyawaka   - 2"). Waning: the binary
// prints the LIMB number, not 1-30 ("Ava -Visheniya  - 5" for tithi 20,
// "Ava -Shatawaka  - 6" for 21, "Ava -Sathawaka  - 7" for 22,
// "Ava -Navawaka   - 9" for 24) with a space after Ava: "Ava -%-11s-%2d".
// New moon (tithi 30) is special: "Amaawaka-15" with NO paksha prefix
// (Moon06 fuzz proof; limb number still 15). Both forms are 19 chars and
// feed the renderer's %-19s slot.
// PROVENANCE: FITTED (Moon06 fuzz proof + measured %-11s/%2d columns; no asm address).
inline std::string tithiDisplay(int tithi1to30) {
    char buf[64];
    if (tithi1to30 == 30) {
        std::snprintf(buf, sizeof(buf), "Amaawaka-15");
        return std::string(buf);
    }
    const bool waxing = tithi1to30 <= 15;
    const int limb = waxing ? tithi1to30 : tithi1to30 - 15;
    if (waxing)
        std::snprintf(buf, sizeof(buf), "Pura-%-11s-%2d", tithiLimbName(limb), tithi1to30);
    else
        std::snprintf(buf, sizeof(buf), "Ava -%-11s-%2d", tithiLimbName(limb), limb);
    return std::string(buf);
}

// 27 yogas; index = floor((sun+moon mod 360)/13.333..), 0-based.
// Binary spellings attested: #1 Vishkamba (Seas02 fuzz, not Vishkambha),
// #2 Preethi (Moon21 fuzz, not Priti), #3 Aaushmaan (Moon22/Rnd03 fuzz,
// not Ayushmana), #4 Savbhagya (Moon23 fuzz, not Saubhagya),
// #6 Athiganda (Moon25 fuzz, not Atiganda), #7 Sukarna (machine "Sukarna",
// not Sukarma), #9 Drathi (Moon02 fuzz, not Dhriti), #11 Wruddhi
// (Seas04/09 fuzz, not Vriddhi), #12 Drava (Moon06 fuzz, not Dhruva),
// #13 Vyaghatha (Moon07 fuzz, not Vyaghata), #16 Siddi (Seas05/10 fuzz,
// not Siddhi), #17 Vyathipatha (Moon11 fuzz, not Vyatipata),
// #18 Varyayan (machine "Varyayan" x2, not Variyana), #19 Parigha
// (screen12), #21 Sidda (Lagna00-06 fuzz, not Siddha), #22 Saadaya (T2,
// not Sadhya), #23 Shubra (T3, idx 23), #25 Brahhma (Moon18 fuzz, not
// Brahma), #26 Mahendra (Seas07 fuzz, not Indra), #27 Vydruthi (T4, not
// Vaidhriti), plus Shobhana, Shubha, Harshana, Vajra (machines).
// Remainder unobserved (disclosed).
// PROVENANCE: FITTED (attested entries per fuzz/machine proofs in comment above).
// PROVENANCE: UNOBSERVED (remainder of the 27, disclosed above).
inline const char* yogaName(int idx0) {
    static const char* kYogas[27] = {
        "Vishkamba", "Preethi", "Aaushmaan", "Savbhagya", "Shobhana",
        "Athiganda", "Sukarna", "Drathi", "Shula", "Ganda",
        "Wruddhi", "Drava", "Vyaghatha", "Harshana", "Vajra",
        "Siddi", "Vyathipatha", "Varyayan", "Parigha", "Shiva",
        "Sidda", "Saadaya", "Shubha", "Shubra", "Brahhma",
        "Mahendra", "Vydruthi"};
    if (idx0 < 0) idx0 = 0;
    if (idx0 > 26) idx0 = 26;
    return kYogas[idx0];
}

[[nodiscard]] inline int yogaIndex(double sunDeg, double moonDeg) noexcept {
    double s = std::fmod(sunDeg + moonDeg, 360.0);
    if (s < 0.0) s += 360.0;
    int n = static_cast<int>(s / kNakSpanPanch);
    if (n < 0) n = 0;
    if (n > 26) n = 26;
    return n;
}

// Karana display: BINARY-EXTRACTED enumerated table (STAR.EXE sub_17FFE
// karana dispatch, asm lines 12485-12769; Session 18 re-decode — the
// "textbook (k-1)%7" hypothesis fit k<=30 but broke on 27 fuzz rows).
// The binary branches on ax = floor(elong/6)+1 (1..60) with LITERAL value
// sets per name (hex immediates in the cmp chain); the lower half happens
// to equal the classical cycle, the upper half does not:
//   Bava:      2,9,16,23,30,34,41,52
//   Baalava:   3,10,17,24,31,38,49,56
//   Kavlava:   4,11,18,25,35,42,46,53
//   Thithila:  5,12,19,26,32,39,50,57
//   Garaja:    6,13,20,27,36,43,47,54
//   Vanija:    7,14,21,28,33,40,51,58
//   Vishti:    8,15,22,29,37,44,48,55
//   Kinsthugana: 1 | Shakuna: 59 | Chathuppada: 45 | Naaga: 60.
// Note the misplaced fixed karanas (classical Shakuna is k=57, Chatushpada
// k=58; the binary has Vanija at k=57 and Chathuppada at k=44) — the
// "table itself is wrong" hypothesis from the review, confirmed. There is
// NO weekday term (same k on different weekdays always agrees in 88 rows).
// Validated 87/87 on tests/screen_test/karana_data.txt (1 unknown-weekday row
// skipped) incl. baseline k=22 Bava, Test User D k=6 Vanija, Test User E k=0 Kinsthugana.
// PROVENANCE: DECODED (sub_17FFE karana dispatch, STAR.EXE.asm 12485-12769; Session 18 re-decode; 87/87 rows).
inline const char* karanaName(double elongDeg, int /*weekday*/) {
    static const char* kTab[61] = {
        // PROVENANCE: UNOBSERVED (k >= 0 so ax >= 1; entry unreachable).
        "?",  // 0 (unreachable: k >= 0 so ax >= 1)
        "Kinsthugana", "Bava", "Baalava", "Kavlava", "Thithila", "Garaja",
        "Vanija", "Vishti", "Bava", "Baalava", "Kavlava", "Thithila",
        "Garaja", "Vanija", "Vishti", "Bava", "Baalava", "Kavlava",
        "Thithila", "Garaja", "Vanija", "Vishti", "Bava", "Baalava",
        "Kavlava", "Thithila", "Garaja", "Vanija", "Vishti", "Bava",
        "Baalava", "Thithila", "Vanija", "Bava", "Kavlava", "Garaja",
        "Vishti", "Baalava", "Thithila", "Vanija", "Bava", "Kavlava",
        "Garaja", "Vishti", "Chathuppada", "Kavlava", "Garaja", "Vishti",
        "Baalava", "Thithila", "Vanija", "Bava", "Kavlava", "Garaja",
        "Vishti", "Baalava", "Thithila", "Vanija", "Shakuna", "Naaga"};
    int k = static_cast<int>(elongDeg / 6.0);  // 0..59 half-tithis
    if (k < 0) k = 0;
    if (k > 59) k = 59;
    return kTab[k + 1];
}

struct PanchangaInfo {
    std::string weekday;    // e.g. "Tuesday"
    std::string nakshatra;  // e.g. "Asvida"
    int nakIndex = 0;       // 0-based nakshatra (Moon mansion, feeds screen13)
    int pada = 0;           // 1..4
    int tithi = 0;          // 1..30
    std::string tithiText;  // e.g. "Pura-Doloswaka  -12"
    std::string yoga;       // e.g. "Parigha"
    std::string karana;     // e.g. "Bava"
};

[[nodiscard]] inline PanchangaInfo computePanchanga(double jd, double sunNirayanaDeg,
                                                     double moonNirayanaDeg) {
    PanchangaInfo p;
    const int wday = weekdayIndex(jd);
    p.weekday = weekdayName(wday);
    const int nak = nakshatraIndex(moonNirayanaDeg);
    p.nakIndex = nak;
    p.nakshatra = nakshatraDisplayName(nak);
    p.pada = nakshatraPadaOf(moonNirayanaDeg);
    const double elong = elongationDeg(sunNirayanaDeg, moonNirayanaDeg);
    p.tithi = tithiNumber(elong);
    p.tithiText = tithiDisplay(p.tithi);
    p.yoga = yogaName(yogaIndex(sunNirayanaDeg, moonNirayanaDeg));
    p.karana = karanaName(elong, wday);
    return p;
}

}  // namespace star

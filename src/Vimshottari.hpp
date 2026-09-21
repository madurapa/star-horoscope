#pragma once
// STAR.EXE Phase 2 — Vimshottari Dasa timeline engine.
// Provenance: sub_23A58 (nakshatra/pada finder), PROGRAM 0x12e3e (balance seed),
// PROGRAM 0x157fc-0x15bd4 (lord dispatch + balance YMD), sub_1633A + sub_15FF8
// (fractional-year boundaries). All spans are computed in fractional civil
// years R = Y + M/12 + D/365 and split with the sub_15FF8 rule.

#include <array>
#include <cmath>
#include <string>
#include <vector>

#include "AstroTime.hpp"

namespace star {

// Nakshatra lord cycle, Ashwini-first (baseline: Ashwini -> Ketu).
// Names use the dasa-table spellings from segment 05FF (Ravi/Sandu/Kuja/...).
struct DasaLordYear { const char* name; int years; };
// PROVENANCE: DECODED (lord dispatch + balance seed/YMD blocks, PROGRAM 0x12e3e/0x157fc-0x15bd4; dasa-table spellings from segment 05FF).
inline constexpr std::array<DasaLordYear, 9> kDasaCycle{{
    {"Ketu", 7}, {"Sikuru", 20}, {"Ravi", 6}, {"Sandu", 10}, {"Kuja", 7},
    {"Rahu", 18}, {"Guru", 16}, {"Shani", 19}, {"Budha", 17},
}};

struct DasaBalance {
    int lordCycleIdx = 0;  // 0-based into kDasaCycle
    double years = 0.0;    // remaining balance in fractional years
    YMD ymd{};             // Trunc-split display value (screen12 "2 0 23")
};

struct DasaSpan {
    std::string lord;
    YMD from{};
    YMD to{};
    YMD ageFrom{};  // elapsed since birth (splitYmd of frac difference)
    YMD ageTo{};
};

// 1-based nakshatra number (sub_23A58 loop: first i with i*SPAN >= moon).
// PROVENANCE: DECODED (sub_23A58 nakshatra/pada finder).
[[nodiscard]] inline int nakshatraNumber(double moonDeg) {
    int n = static_cast<int>(moonDeg / kNakshatraSpan) + 1;
    if (n < 1) n = 1;
    if (n > 27) n = 27;
    return n;
}

// 1-based pada within the nakshatra: Trunc(remainder / PADA_SPAN) + 1.
// PROVENANCE: DECODED (sub_23A58 nakshatra/pada finder).
[[nodiscard]] inline int nakshatraPada(double moonDeg) {
    const double rem = moonDeg - (nakshatraNumber(moonDeg) - 1) * kNakshatraSpan;
    int p = static_cast<int>(rem / kPadaSpan) + 1;
    if (p < 1) p = 1;
    if (p > 4) p = 4;
    return p;
}

// Balance seed (PROGRAM 0x12e3e): elapsed degrees within the nakshatra,
// i.e. moon - (nak-1)*SPAN. For nak 1 this is the full Moon longitude.
// PROVENANCE: DECODED (PROGRAM 0x12e3e balance seed).
[[nodiscard]] inline double balanceElapsedDeg(double moonDeg) {
    return moonDeg - (nakshatraNumber(moonDeg) - 1) * kNakshatraSpan;
}

// Balance in years (PROGRAM 0x15ad9): (SPAN - elapsed)/SPAN * lordYears.
// PROVENANCE: DECODED (PROGRAM 0x15ad9 + Trunc-split display 0x15b38-0x15bd4).
[[nodiscard]] inline DasaBalance dasaBalance(double moonDeg) {
    const int nak = nakshatraNumber(moonDeg);
    const int lord = (nak - 1) % 9;
    const double years =
        (kNakshatraSpan - balanceElapsedDeg(moonDeg)) / kNakshatraSpan * kDasaCycle[lord].years;
    DasaBalance out;
    out.lordCycleIdx = lord;
    out.years = years;
    // Display split uses Trunc for days (PROGRAM 0x15b38-0x15bd4).
    out.ymd.y = static_cast<int>(years);
    const double fm = (years - std::floor(years)) * kMonthsPerYear;
    out.ymd.m = static_cast<int>(fm);
    out.ymd.d = static_cast<int>((fm - std::floor(fm)) * kMonthDays);
    return out;
}

// Civil date difference with fixed 30-day month borrowing (screen14-16 "Age"
// columns, e.g. 2001-06-04 minus 2000-08-17 = 0-9-17; 2002-05-10 minus
// 2000-08-17 = 1-8-23). Verified against screen14 rows.
// PROVENANCE: FITTED (six screen rows; no binary address).
[[nodiscard]] inline YMD dateDiffYmd(YMD from, YMD to) {
    YMD out;
    out.d = to.d - from.d;
    int borrowM = 0;
    if (out.d < 0) { out.d += 30; borrowM = 1; }
    out.m = to.m - borrowM - from.m;
    int borrowY = 0;
    if (out.m < 0) { out.m += 12; borrowY = 1; }
    out.y = to.y - borrowY - from.y;
    return out;
}

// Elapsed Vimshottari units (of 120) at birth within the opening maha.
[[nodiscard]] inline double balanceElapsedUnits(double moonDeg) {
    return balanceElapsedDeg(moonDeg) / kNakshatraSpan * kVimshottariTotalYears;
}

// Full 120-year maha timeline from the birth fractional epoch.
// PROVENANCE: DECODED (sub_1633A pattern + baseline tail proof).
[[nodiscard]] inline std::vector<DasaSpan> mahaTimeline(const YMD& birth, double birthFrac,
                                                        const DasaBalance& bal) {
    std::vector<DasaSpan> out;
    double cursor = birthFrac;
    for (int k = 0; k < 9; ++k) {
        const int idx = (bal.lordCycleIdx + k) % 9;
        const double span = (k == 0) ? bal.years : kDasaCycle[idx].years;
        DasaSpan s;
        s.lord = kDasaCycle[idx].name;
        s.from = splitYmd(cursor);
        s.to = splitYmd(cursor + span);
        s.ageFrom = dateDiffYmd(birth, s.from);
        s.ageTo = dateDiffYmd(birth, s.to);
        out.push_back(s);
        cursor += span;
    }
    return out;
}

// Nine bhukti spans within one maha (sub_1633A pattern).
// Full mahas (elapsedUnits == 0): full spans laid forward from the start,
// lords cycling forward from the maha lord.
// Balance (first) maha: spans are anchored BACKWARD from the maha end using
// full-maha-year proportionality (mahaYearsFull * Yi / 120); only the tail
// from the birth bhukti prints, with the first shown span running from the
// maha start (birth) to the first backward boundary. Baseline proof:
// Guru balance 9-10-11, backward spans 16*Yi/120 from maha end 2010-06-28,
// so Rahu (2.4y) runs 2008-02-04 -> 2010-06-28, while Budha's backward start
// predates birth and Budha runs birth 2000-08-17 -> 2001-06-04 (screen14).
// PROVENANCE: DECODED (sub_1633A pattern + screen14 baseline proof).
[[nodiscard]] inline std::vector<DasaSpan> bhuktiTimeline(const YMD& birth, double mahaStartFrac,
                                                          int mahaLordIdx, double mahaYears,
                                                          double elapsedUnits = 0.0,
                                                          double mahaYearsFull = -1.0) {
    std::vector<DasaSpan> out;
    if (elapsedUnits <= 0.0) {
        double cursor = mahaStartFrac;
        for (int k = 0; k < 9; ++k) {
            const int idx = (mahaLordIdx + k) % 9;
            const double span = mahaYears * kDasaCycle[idx].years / kVimshottariTotalYears;
            DasaSpan s;
            s.lord = kDasaCycle[idx].name;
            s.from = splitYmd(cursor);
            s.to = splitYmd(cursor + span);
            s.ageFrom = dateDiffYmd(birth, s.from);
            s.ageTo = dateDiffYmd(birth, s.to);
            out.push_back(s);
            cursor += span;
        }
        return out;
    }
    // Tail case: locate first shown bhukti, lay full spans backward from the end.
    const double mFull = (mahaYearsFull < 0.0) ? mahaYears : mahaYearsFull;
    const double mahaEnd = mahaStartFrac + mahaYears;
    int first = 0;
    double cum = 0.0;
    for (int k = 0; k < 9; ++k) {
        const int idx = (mahaLordIdx + k) % 9;
        cum += kDasaCycle[idx].years;
        if (cum > elapsedUnits) { first = k; break; }
    }
    double tailFull = 0.0;  // full spans after the first shown lord
    for (int k = 8; k > first; --k) {
        const int idx = (mahaLordIdx + k) % 9;
        tailFull += mFull * kDasaCycle[idx].years / kVimshottariTotalYears;
    }
    double cursor = mahaStartFrac;
    for (int k = first; k < 9; ++k) {
        const int idx = (mahaLordIdx + k) % 9;
        const double span = (k == first)
                                ? (mahaEnd - tailFull - cursor)
                                : (mFull * kDasaCycle[idx].years / kVimshottariTotalYears);
        DasaSpan s;
        s.lord = kDasaCycle[idx].name;
        s.from = splitYmd(cursor);
        s.to = splitYmd(cursor + span);
        s.ageFrom = dateDiffYmd(birth, s.from);
        s.ageTo = dateDiffYmd(birth, s.to);
        out.push_back(s);
        cursor += span;
    }
    return out;
}

// Nine antardasa (third-level) spans within one bhukti (sub_1633A pattern,
// third recursion). Lords cycle forward from the bhukti lord; each span is
// bhuktiYears * Yi / 120. No screen ground truth pins L3 dates (screens
// 14-18 stop at Athuru level), so this is a structural extension tested for
// contiguity, lord order and span-sum conservation.
// PROVENANCE: UNOBSERVED (no screen ground truth pins L3 dates; structural extension).
[[nodiscard]] inline std::vector<DasaSpan> antardasaTimeline(const YMD& birth, double bhuktiStartFrac,
                                                             int bhuktiLordIdx, double bhuktiYears) {
    std::vector<DasaSpan> out;
    double cursor = bhuktiStartFrac;
    for (int k = 0; k < 9; ++k) {
        const int idx = (bhuktiLordIdx + k) % 9;
        const double span = bhuktiYears * kDasaCycle[idx].years / kVimshottariTotalYears;
        DasaSpan s;
        s.lord = kDasaCycle[idx].name;
        s.from = splitYmd(cursor);
        s.to = splitYmd(cursor + span);
        s.ageFrom = dateDiffYmd(birth, s.from);
        s.ageTo = dateDiffYmd(birth, s.to);
        out.push_back(s);
        cursor += span;
    }
    return out;
}

}  // namespace star

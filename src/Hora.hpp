#pragma once
// STAR.EXE KALA/PANCHAMA/SUKSHAMA engine — DECODED from the binary
// (sub_1AE29, STAR.EXE.asm lines 15906-16550; Session 19 — replaces the
// black-box horaAt + (Kala+3b) fit, which matched 9/9 Kala by geographic
// luck but differed on 38/108 DOS triples and guessed the middle tier).
//
// Mechanism (three chained lord-cycle loops over the WRAPPED sinhala ghati
// X = 2.5*(birth - sunrise), +60 if negative; two lord numberings ping-pong
// at each stage, which is why the binary keeps two remap tables):
//   A-order (Chaldean fast-from-Sun): 1 Ravi, 2 Sikuru, 3 Budha, 4 Chandra,
//     5 Shani, 6 Guru, 7 Kuja. Display table DS:7AF9 (Moon "Chandra").
//   B-order (weekday order): 1 Ravi, 2 Chandra, 3 Kuja, 4 Budha, 5 Guru,
//     6 Sikuru, 7 Shani. Display table DS:7B47 (Moon "Chadra" — the slot
//     spelling quirk is load-bearing: the remap string-compares need it).
//   weekday -> A: Sun1 Mon4 Tue7 Wed3 Thu6 Fri2 Sat5 (consecutive days are
//     +3 mod 7, the classical 24-hora/day shift; asm 15930-16011).
//   Loop 1 (KALA, max 24 iters): smallest n in 1..24 with
//     (n-1)*2.5 < X <= n*2.5, i.e. n = ceil(X/2.5); KalaA = A0 + (n-1)
//     steps (mod 7). Unmatched (X <= 0 or X > 60, garbage input only) runs
//     to 24 (23 steps). Display 7AF9[KalaA].
//   Remap 1 (A-name -> B-number, exact inverse of remap 2): {1:1, 2:6,
//     3:4, 4:2, 5:7, 6:5, 7:3} (asm 16115-16205).
//   var_1A = frac(X/2.5)*60 (asm 16211-16260; the old fit's var_1A was right).
//   Loop 2 (PANCHAMA, max 5 iters): smallest n in 1..5 with
//     (n-1)*12 < var_1A <= n*12; PanchaB = KalaB + (n-1) steps.
//     Unmatched (var_1A <= 0, i.e. birth exactly at sunrise) runs to 5
//     (4 steps). Display 7B47[PanchaB].
//   rem = var_1A - (n2-1)*12 (n2 = 5 if unmatched).
//   Remap 2 (B-name -> A-number): {1:1, 2:4, 3:7, 4:3, 5:6, 6:2, 7:5}.
//   Loop 3 (SUKSHAMA, max 3 iters): smallest n in 1..3 with
//     (n-1)*4 < rem <= n*4 (+0/+1/+2 tiers at exact bounds 4 and 8 —
//     the "unobserved middle tier" needed no observation); SukA =
//     PanchaA + (n-1) steps. Unmatched (rem <= 0) runs to 3 (2 steps).
//     Display 7AF9[SukA] (Moon "Chandra").
// Validated 108/108 DOS triples (106 fuzz + Test User D/Test User E), incl. Lagna00
// (pre-dawn wrapped ghati), the Test User A rem-3.99 boundary (+0 tier,
// exact integer bound — no dust sensitivity), and Chandra/Chadra slots.
// Real48-vs-double dust can only bite within ~1e-9 of an integer bound.
// The var_8 = 8 table-overread (ghati > 60, birth > 24 h after sunrise)
// is unreachable on valid input; emulated as blank Kala with the chain
// continuing from the wrapped value.

#include <cmath>
#include <string>

namespace star {

struct HoraTriple {
    std::string kala;     // display spelling (Moon "Chandra")
    std::string pancha;   // display spelling (Moon "Chadra")
    std::string sukshama; // display spelling (Moon "Chandra")
};

// Lord tables (binary orderings; see header note).
// PROVENANCE: DECODED (display table DS:7AF9, Moon "Chandra").
inline const char* horaAName(int idx1to7) {
    static const char* kA[8] = {"?", "Ravi", "Sikuru", "Budha", "Chandra",
                                "Shani", "Guru", "Kuja"};
    if (idx1to7 < 1 || idx1to7 > 7) return "";
    return kA[idx1to7];
}

// PROVENANCE: DECODED (display table DS:7B47, Moon "Chadra" slot, load-bearing).
inline const char* horaBName(int idx1to7) {
    static const char* kB[8] = {"?", "Ravi", "Chadra", "Kuja", "Budha",
                                "Guru", "Sikuru", "Shani"};
    if (idx1to7 < 1 || idx1to7 > 7) return "";
    return kB[idx1to7];
}

// Weekday (0=Sunday) -> A-number (asm 15930-16011).
// PROVENANCE: DECODED (asm 15930-16011; +3 mod 7 classical hora shift).
[[nodiscard]] inline int horaWeekdayA(int weekday) noexcept {
    static const int kMap[7] = {1, 4, 7, 3, 6, 2, 5};
    if (weekday < 0 || weekday > 6) return 1;
    return kMap[weekday];
}

// A-number -> B-number (asm 16115-16205) and inverse (asm 16342-16420).
// PROVENANCE: DECODED (asm 16115-16205).
[[nodiscard]] inline int horaAtoB(int a) noexcept {
    static const int kMap[8] = {0, 1, 6, 4, 2, 7, 5, 3};
    if (a < 1 || a > 7) return 1;
    return kMap[a];
}

// PROVENANCE: DECODED (asm 16342-16420, exact inverse of remap 1).
[[nodiscard]] inline int horaBtoA(int b) noexcept {
    static const int kMap[8] = {0, 1, 4, 7, 3, 6, 2, 5};
    if (b < 1 || b > 7) return 1;
    return kMap[b];
}

// Full sub_1AE29 chain, emulating the loop structure literally (wrap-check
// at top of each iteration, single-subtract; match exits before ++, forced
// exit after ++ on the last iteration — the value can be 8 there, which the
// binary reads past the 7-entry name table into unknown bytes).
// weekday: 0=Sunday..6=Saturday (civil-date JD).
// ghatiX: WRAPPED sinhala ghati in [0, 60) (sinhalaGhati() output).
// PROVENANCE: DECODED (sub_1AE29 chained-loop mechanism; validated 108/108 DOS triples).
[[nodiscard]] inline HoraTriple horaChain(int weekday, double ghatiX) {
    HoraTriple out;
    // Loop 1 (KALA, max 24 iters, step 2.5 on X).
    int v = horaWeekdayA(weekday);
    for (int n = 1; n <= 24; ++n) {
        if (v > 7) v -= 7;
        if ((n - 1) * 2.5 < ghatiX && ghatiX <= n * 2.5) break;
        ++v;
    }
    // PROVENANCE: UNOBSERVED (ghati > 60 unreachable on valid input; emulated as blank Kala).
    const int kalaA = v;  // 1..7, or 8 (ghati > 60, garbage input only)
    out.kala = (kalaA >= 1 && kalaA <= 7) ? horaAName(kalaA) : "";
    // Remap 1 (A-name -> B-number); no match (index 8) keeps the value,
    // and loop 2's top-wrap maps 8 -> 1 — exactly as the binary falls through.
    int kalaB = (kalaA >= 1 && kalaA <= 7) ? horaAtoB(kalaA) : kalaA;
    // var_1A = frac(X/2.5)*60.
    const double q = ghatiX / 2.5;
    const double v1a = (q - std::floor(q)) * 60.0;
    // Loop 2 (PANCHAMA, max 5 iters, step 12).
    v = kalaB;
    int n2 = -1;
    for (int n = 1; n <= 5; ++n) {
        if (v > 7) v -= 7;
        if ((n - 1) * 12.0 < v1a && v1a <= n * 12.0) {
            n2 = n;
            break;
        }
        ++v;
    }
    const int eff2 = (n2 < 0) ? 5 : n2;
    // PROVENANCE: UNOBSERVED (var_1A <= 0, i.e. birth exactly at sunrise; emulated as blank Pancha).
    const int panB = v;  // 1..7, or 8 (var_1A <= 0, i.e. birth at sunrise)
    out.pancha = (panB >= 1 && panB <= 7) ? horaBName(panB) : "";
    const double rem = v1a - (eff2 - 1) * 12.0;
    int panA = (panB >= 1 && panB <= 7) ? horaBtoA(panB) : panB;
    // Loop 3 (SUKSHAMA, max 3 iters, step 4).
    v = panA;
    for (int n = 1; n <= 3; ++n) {
        if (v > 7) v -= 7;
        if ((n - 1) * 4.0 < rem && rem <= n * 4.0) break;
        ++v;
    }
    // PROVENANCE: UNOBSERVED (rem <= 0; emulated as blank Sukshama).
    const int sukA = v;  // 1..7, or 8 (rem <= 0)
    out.sukshama = (sukA >= 1 && sukA <= 7) ? horaAName(sukA) : "";
    return out;
}

}  // namespace star

#pragma once
// STAR.EXE screen13 attributes (Moon-nakshatra based) + Hora sub-line.
// FULLY DECODED from the binary (sub_1B689): GANA/YONI/RUXHA/LINGA/NAADI/
// VARNA/RAJJU via per-nakshatra dispatch, PAXHI/GOTHRA/BHUTHA via nak-range
// groups. See docs/status_and_plans.md Session 13 for the decode record.
// Validated: all 11 observed Moon nakshatras (8 machines + T2/T3/T4 +
// baseline) match literally, including '#'/'*' markers (binary-literal,
// e.g. 'Nuga#', 'Sunakhi*', 'Muvadena*') and the 'Chadra' Panchama quirk
// (handled in Hora.hpp, not here).
// Two disclosed anomalies reproduced literally:
//  - LINGA Napunsaka checks nak == 28 (out of the 1-27 range; probable
//    binary typo for 24): Siyavsa (24) Moon yields BLANK Linga.
//  - BHUTHA group 5 (nak 22-27) = 'Aakasha' (double-a binary literal).

#include <string>
#include <utility>

namespace star {

// Classical Gana by 1-based nakshatra, decoded chains (sub_1B689 Gana
// select, STAR.EXE.asm ~17721-17800; Session 19 verified sets):
// Deva {1,5,7,8,13,15,17,22,27}, Maanusha {2,4,6,11,12,20,21,25,26},
// Raxha {9,10,14,16,18,19,23,24}; Keti (3) matches NO set, so the binary
// keeps a STALE stack slot (var_4F2, no default store). City-dependence
// PROVEN (Session 19b): Moon17|2000-01-17|12:00|Galle -> Maanusha vs
// KetW1|same datetime|Colombo -> Raxha (identical nak/pada/tithi/weekday/
// mode) — no deterministic rule can fit. DOS: Raxha x6 (both modes),
// Maanusha x1, blank x2 (both Keti-pada-1 Colombo; stale-empty).
// Port returns Raxha (majority).
// "Maanusha" is the binary spelling.
// PROVENANCE: DECODED (sub_1B689 Gana select, STAR.EXE.asm ~17721-17800; Session 19 verified sets).
inline const char* ganaFor(int nak0) {
    const int n = nak0 + 1;  // 1-based
    switch (n) {
        case 1: case 5: case 7: case 8: case 13: case 15: case 17: case 22: case 27:
            return "Deva";
        case 2: case 4: case 6: case 11: case 12: case 20: case 21: case 25: case 26:
            return "Maanusha";
        default:
            // PROVENANCE: NONDETERMINISTIC (Keti matches no set; stale var_4F2, city-dependent; port default = observed majority, Session 19b).
            return "Raxha";  // {3,9,10,14,16,18,19,23,24} + fallthrough
    }
}

// YONI (27-entry direct table, init order = nak order; '*' literal).
// BINARY-LITERAL per STAR.EXE.asm line 16624: aMushikadena db 12,'Mushikadena*'.
// The 2026-09-16 transcription to "Mushikaden" was field-width truncation on the
// DOS capture, not the stored string — restored. Index 24 is DOS-literal "Sinha"
// + 7 trailing spaces (binary 12-char field quirk).
// Index 15 "Vyagradena*": asterisk restored per owner ruling 2026-09-19
// (docs/plans.md §4.2, ex refactor_plans/FINAL_PLAN.md) — binary-literal kept as-is.
// PROVENANCE: DECODED (binary-literal 27-entry table, STAR.EXE.asm:16624 db 12,'Mushikadena*').
inline const char* yoniFor(int nak0) {
    static const char* kYoni[27] = {
        "Ashva", "Eth", "Eludena*", "Sarpa", "Sepini*", "Sunakha", "Balal",
        "Elu", "Belali*", "Mushika", "Mushikadena*", "Gavadena*", "Meedena",
        "Vyagra", "Meegon", "Vyagradena*", "Muvadena*", "Muva", "Sunakhi*",
        "Vendiri", "Mugatidena", "Vanduru", "Sinhadena*", "Velamba*", "Sinha       ",
        "Gon", "Ethini"};
    if (nak0 < 0 || nak0 > 26) return "";
    return kYoni[nak0];
}

// RUXHA tree (27-entry direct table; '#' literal).
// PROVENANCE: DECODED (sub_1B689 per-nakshatra dispatch).
inline const char* ruxhaFor(int nak0) {
    static const char* kRuxha[27] = {
        "Godaka", "Nelli", "Athikka", "Madan", "Kaluvara", "Kihira", "Una",
        "Bo#", "Domba#", "Nuga#", "Kela#", "Alari#", "Dimbul", "Beli",
        "Kumbuk", "Sapu", "Munamal", "Vetake#", "Imbul#", "Hopalu#", "Kos#",
        "Vara#", "Samadara", "Kolong", "Mee Amba#", "Kohomba", "Mee#"};
    if (nak0 < 0 || nak0 > 26) return "";
    return kRuxha[nak0];
}

// LINGA by 1-based nakshatra (decoded cmp-chains; Session 19 verified the
// sets against STAR.EXE.asm 17830-17930: Purusha {1,2,4,6,7,8,10,14,15,18,
// 22,25,26}, Sthree {3,9,11,12,13,16,17,20,21,23,27}, Napunsaka {5,19,28}).
// HOLE: nak 24 (Siyavsa) matches NO set (the 28 is a binary typo for 24),
// so the binary keeps a STALE stack slot (var_7F2, no default store —
// Session 19 structural proof). City-dependence PROVEN (Session 19b):
// Moon11|2000-01-11|12:00|Galle -> Sthree vs TriOCB|same datetime|Colombo
// -> Purusha (identical nak/pada/tithi/weekday/mode) — no deterministic
// rule can fit; content is runtime stack history. DOS: Sthree x6,
// Purusha x2 (Rnd08, TriOCB). Port returns Sthree (majority).
// PROVENANCE: DECODED (cmp-chains, STAR.EXE.asm 17830-17930; Session 19 verified sets).
[[nodiscard]] inline const char* lingaFor(int nak0) {
    const int n = nak0 + 1;
    switch (n) {
        case 1: case 2: case 4: case 6: case 7: case 8: case 10: case 14:
        case 15: case 18: case 22: case 25: case 26:
            return "Purusha";
        case 3: case 9: case 11: case 12: case 13: case 16: case 17: case 20:
        case 21: case 23: case 27:
            return "Sthree";
        case 24:
            // PROVENANCE: NONDETERMINISTIC (no binary set covers 24; stale var_7F2, city-dependent; port default = observed majority, Session 19b).
            return "Sthree";  // HOLE: no binary set covers 24 (see above)
        case 5: case 19:
            return "Napunsaka";
        default:
            return "";
    }
}

// NAADI by 1-based nakshatra (decoded cmp-chains; 9/9/9 complete).
// PROVENANCE: DECODED (decoded cmp-chains; 9/9/9 complete).
inline const char* naadiFor(int nak0) {
    const int n = nak0 + 1;
    switch (n) {
        case 1: case 6: case 7: case 12: case 13: case 18: case 19: case 24:
        case 25:
            return "Poorva";
        case 2: case 5: case 8: case 11: case 14: case 17: case 20: case 23:
        case 26:
            return "Madya";
        case 3: case 4: case 9: case 10: case 15: case 16: case 21: case 22:
        case 27:
            return "Anthya";
        default:
            return "";
    }
}

// PAXHI bird by 1-based nak RANGE (threshold chain on var_DF4).
// PROVENANCE: DECODED (threshold chain on var_DF4, sub_1B689).
inline const char* paxhiFor(int nak0) {
    const int n = nak0 + 1;
    if (n >= 1 && n <= 5) return "Bheruda";
    if (n >= 6 && n <= 11) return "Pingala";
    if (n >= 12 && n <= 16) return "Kaka";
    if (n >= 17 && n <= 22) return "Kukuta";
    if (n >= 23 && n <= 27) return "Maura";
    return "";
}

// GOTHRA rishi by 1-based nak RANGE.
// PROVENANCE: DECODED (range-group dispatch, sub_1B689).
inline const char* gothraFor(int nak0) {
    const int n = nak0 + 1;
    if (n >= 1 && n <= 4) return "Marivi";
    if (n >= 5 && n <= 8) return "Athri";
    if (n >= 9 && n <= 12) return "Vashista";
    if (n >= 13 && n <= 16) return "Angeera";
    if (n >= 17 && n <= 20) return "Pulasthi";
    if (n >= 21 && n <= 23) return "Pulaga";
    if (n >= 24 && n <= 27) return "Kruthu";
    return "";
}

// VARNA by 1-based nakshatra (decoded cmp-chains; complete).
// PROVENANCE: DECODED (decoded cmp-chains; complete).
inline const char* varnaFor(int nak0) {
    const int n = nak0 + 1;
    switch (n) {
        case 1: case 7: case 13: case 19: case 25:
            return "Brahmana";
        case 2: case 8: case 14: case 20: case 26:
            return "Kshathriya";
        case 3: case 9: case 15: case 21: case 27:
            return "Vyshya";
        case 4: case 10: case 16: case 22:
            return "Shudra";
        case 5: case 11: case 17: case 23:
            return "Panchama";
        case 6: case 12: case 18: case 24:
            return "Sankara";
        default:
            return "";
    }
}

// RAJJU by 1-based nakshatra (decoded cmp-chains; complete).
// PROVENANCE: DECODED (decoded cmp-chains; complete).
inline const char* rajjuFor(int nak0) {
    const int n = nak0 + 1;
    switch (n) {
        case 1: case 9: case 10: case 18: case 19: case 27:
            return "Pada";
        case 2: case 8: case 11: case 17: case 20: case 26:
            return "Ooru";
        case 3: case 7: case 12: case 16: case 21: case 25:
            return "Nabhi";
        case 4: case 6: case 13: case 15: case 22: case 24:
            return "Bahu";
        case 5: case 14: case 23:
            return "Shiro";
        default:
            return "";
    }
}

// BHUTHA element by 1-based nak RANGE ('Aakasha' double-a literal).
// PROVENANCE: DECODED (range groups, sub_1B689; 'Aakasha' binary-literal).
inline const char* bhuthaFor(int nak0) {
    const int n = nak0 + 1;
    if (n >= 1 && n <= 5) return "Patavi";
    if (n >= 6 && n <= 11) return "Aapo";
    if (n >= 12 && n <= 15) return "Thejo";
    if (n >= 16 && n <= 21) return "Vaayo";
    if (n >= 22 && n <= 27) return "Aakasha";
    return "";
}

struct NakAttributes {
    const char* yoni;
    const char* ruxha;
    const char* linga;
    const char* naadi;
    const char* paxhi;
    const char* gothra;
    const char* varna;
    const char* rajju;
    const char* bhutha;
};

// Full-table attributes for any Moon nakshatra (0-based).
[[nodiscard]] inline NakAttributes attributesFor(int nak0) {
    return {yoniFor(nak0), ruxhaFor(nak0), lingaFor(nak0), naadiFor(nak0),
            paxhiFor(nak0), gothraFor(nak0), varnaFor(nak0), rajjuFor(nak0),
            bhuthaFor(nak0)};
}

}  // namespace star

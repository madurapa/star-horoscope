#pragma once
// STAR modern display layer (--display modern, the default).
// Same engine numbers as the frozen byte-exact ScreenRenderer.hpp, presented
// with corrected spellings (see docs/modern_display.md) and a redesigned,
// responsive layout. Presentation only: no math changes.
//
// TERMINAL TARGET: UTF-8 required. Box drawing (`─ │ ├ └`), the degree
// sign (°), and boxed tables are used throughout with no ASCII fallback
// (owner ruling 2026-09-19, FINAL_PLAN §4.3).
//
// ASCII skill rules implemented here (.agents/skills/ascii-*):
// - ascii-table-renderer: one style per viewport (boxed `+ - |` on the 90
//   layout, ruled compact below); centered headers; right-aligned numerics;
//   exact-data columns never cut; empty cells render `-`; every line within
//   width; no trailing spaces.
// - ascii-cli-logo-banner: header block + compact single-line title under
//   60 cols; footer art block.
// - ascii-ansi-colorizer: central Theme struct; scoped palette; plain-text
//   fallback byte-identical minus codes; --color + NO_COLOR supported.
// - ascii-diagram-boxflow: width-capped diagrams; kendra pairs stack when
//   narrow; dasa Mahadasa/Athurudasa Unicode tree.

#include <array>
#include <cstdlib>
#include <ctime>
#include <map>
#include <sstream>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

#include "AstroStructures.hpp"
#include "AstroTime.hpp"
#include "Ayanamsa.hpp"
#include "Hora.hpp"
#include "Panchanga.hpp"
#include "ScreenRenderer.hpp"
#include "SunriseSunset.hpp"
#include "VargaEngine.hpp"
#include "Vimshottari.hpp"

#if !defined(_WIN32)
#include <sys/ioctl.h>
#include <unistd.h>
#endif

namespace star {
namespace modern {

// Central color theme (one place to retheme the whole CLI): dark-terminal
// palette with distinct roles per element. Plain-text fallbacks always keep
// byte-identical structure (see tests/test_modern_display.cpp).
struct Theme {
    static constexpr const char* reset = "\033[0m";
    static constexpr const char* section = "\033[1;96m";  // dividers, titles, logo
    static constexpr const char* header = "\033[96m";     // table headers
    static constexpr const char* label = "\033[1;93m";    // key labels
    static constexpr const char* value = "\033[92m";      // key values, measures
    static constexpr const char* special = "\033[95m";    // planet/dasa names
    static constexpr const char* dates = "\033[36m";      // tree dates
    static constexpr const char* faint = "\033[37m";      // tree ages (readable gray)
    static constexpr const char* subtle = "\033[90m";     // dashes, borders, separators
    static constexpr const char* err = "\033[91m";        // fatal errors (TTY stderr)
    static constexpr const char* warn = "\033[33m";       // input validation issues
};

inline std::string paint(const char* code, const std::string& s, bool on) {
    return on ? std::string(code) + s + Theme::reset : s;
}

// ---------------------------------------------------------------- utilities

// Display width: our charset is ASCII + U+00B0 (°), all width 1, so count
// UTF-8 lead bytes only; ANSI escape sequences contribute zero width.
inline size_t utf8Len(unsigned char c) {
    if (c < 0x80) return 1;
    if (c < 0xE0) return 2;
    if (c < 0xF0) return 3;
    return 4;
}

inline size_t dispWidth(const std::string& s) {
    size_t w = 0;
    for (size_t i = 0; i < s.size();) {
        unsigned char c = static_cast<unsigned char>(s[i]);
        if (c == 0x1B) {
            const size_t e = s.find('m', i);
            i = (e == std::string::npos) ? s.size() : e + 1;
            continue;
        }
        if ((c & 0xC0) != 0x80) ++w;
        ++i;
    }
    return w;
}

// Centered line with color on the text only; padding stays outside codes.
inline std::string paintCentered(const std::string& text, int width, const char* code,
                                 bool color) {
    const size_t d = dispWidth(text);
    std::string core = paint(code, text, color);
    if (static_cast<int>(d) >= width) return core;
    return std::string((static_cast<size_t>(width) - d) / 2, ' ') + core;
}

// Truncate to display width, adding "..." (stays on char boundaries).
inline std::string truncateDisp(const std::string& s, size_t w) {
    if (dispWidth(s) <= w) return s;
    const size_t keep = (w <= 3) ? w : w - 3;
    std::string o;
    size_t n = 0;
    for (size_t i = 0; i < s.size() && n < keep;) {
        const size_t len = utf8Len(static_cast<unsigned char>(s[i]));
        o += s.substr(i, len);
        i += len;
        ++n;
    }
    return (w <= 3) ? o : o + "...";
}

// Greedy word wrap at display width; overlong words are hard-cut on char
// boundaries. Never returns an empty list.
inline std::vector<std::string> wrapWords(const std::string& s, size_t w) {
    if (w == 0) return {""};
    std::vector<std::string> lines;
    std::string cur;
    std::istringstream ss(s);
    std::string tok;
    bool any = false;
    while (ss >> tok) {
        any = true;
        while (dispWidth(tok) > w) {
            if (!cur.empty()) {
                lines.push_back(cur);
                cur.clear();
            }
            std::string part;
            size_t n = 0, i = 0;
            while (i < tok.size() && n < w) {
                const size_t len = utf8Len(static_cast<unsigned char>(tok[i]));
                part += tok.substr(i, len);
                i += len;
                ++n;
            }
            lines.push_back(part);
            tok = tok.substr(i);
        }
        if (cur.empty())
            cur = tok;
        else if (dispWidth(cur) + 1 + dispWidth(tok) <= w)
            cur += " " + tok;
        else {
            lines.push_back(cur);
            cur = tok;
        }
    }
    if (!cur.empty() || !any) lines.push_back(cur);
    return lines;
}

inline std::string padR(const std::string& s, size_t w) {
    const size_t d = dispWidth(s);
    if (d >= w) return s;
    return s + std::string(w - d, ' ');
}

inline std::string padL(const std::string& s, size_t w) {
    const size_t d = dispWidth(s);
    if (d >= w) return s;
    return std::string(w - d, ' ') + s;
}

// Responsive width: COLUMNS/ioctl, clamped; 80 fallback. Wide layouts get
// the full 90 so boxed tables (widest needs 89) fit with a margin.
inline int termWidth() {
    int w = 80;
    if (const char* c = std::getenv("COLUMNS")) {
        try {
            w = std::stoi(c);
        } catch (...) {}
    }
#if !defined(_WIN32)
    struct winsize ws{};
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == 0 && ws.ws_col > 0)
        w = ws.ws_col;
#endif
    if (w < 40) w = 40;
    if (w > 90) w = 90;
    return w;
}

// Boxed tables need 89 columns (widest table); at the full 90 layout they
// always fit, below that the ruled compact variant is used — one style per
// viewport, never mixed, never truncated.
inline constexpr int kWideLayout = 90;

inline std::string rule(char c, int width) {
    return std::string(static_cast<size_t>(width), c);
}

// Center visible text; color codes wrap the text only, never the padding
// (colorizer rule: never colorize spaces, never shift alignment). Only the
// left pad is emitted, so centered lines carry no trailing spaces and stay
// copy/paste safe.
inline std::string fitCenter(const std::string& text, int width, bool color,
                             const char* code = "1;96") {
    const size_t d = dispWidth(text);
    std::string core =
        color ? std::string("\033[") + code + "m" + text + Theme::reset : text;
    if (static_cast<int>(d) >= width) return core;
    const int left = (width - static_cast<int>(d)) / 2;
    return std::string(static_cast<size_t>(left), ' ') + core;
}

// Section divider: ─── Title ───, exactly width (U+2500, width 1).
// Uniform gap: one blank line before, one after — same for every section.
inline std::string sectionDivider(const std::string& title, int width, bool color) {
    const size_t d = dispWidth(title);
    std::string core = paint(Theme::section, title, color);
    if (static_cast<int>(d) + 2 >= width) return core;
    const int dashes = width - static_cast<int>(d) - 2;
    const int left = dashes / 2;
    const int right = dashes - left;
    auto dash = [&](int n) {
        std::string s;
        for (int i = 0; i < n; ++i) s += "\xE2\x94\x80";
        return paint(Theme::subtle, s, color);
    };
    return dash(left) + " " + core + " " + dash(right);
}

inline std::string sectionTitle(const std::string& text, int width, bool color) {
    // Airy, uniform rhythm: two blank lines before and after every divider.
    return "\n\n" + sectionDivider(text, width, color) + "\n\n";
}

// ------------------------------------------------------------------ tables
// table-renderer: light `+ - |` borders (minimal under 60 cols), capped
// widths, `-` for empty, left aligned, no trailing spaces.

struct Table {
    std::vector<std::string> head;
    std::vector<std::vector<std::string>> rows;
    // Columns holding exact data (longitudes, dates, counts): never shrunk,
    // wrapped, or truncated. Text columns absorb all width pressure instead.
    std::vector<size_t> noWrapCols;
    // Pure-number columns render right-aligned (positions, counts).
    std::vector<size_t> rightCols;
    // Name columns render magenta, measure columns green.
    std::vector<size_t> specialCols;
    std::vector<size_t> valueCols;
};

inline bool isNoWrap(const Table& t, size_t c) {
    for (size_t v : t.noWrapCols)
        if (v == c) return true;
    return false;
}

inline bool isSpecial(const Table& t, size_t c) {
    for (size_t v : t.specialCols)
        if (v == c) return true;
    return false;
}

inline bool isValue(const Table& t, size_t c) {
    for (size_t v : t.valueCols)
        if (v == c) return true;
    return false;
}

inline bool isRight(const Table& t, size_t c) {
    for (size_t v : t.rightCols)
        if (v == c) return true;
    return false;
}

// One table style per viewport, never mixed. Wide layout (90 cols):
// boxed `+ - |` tables with centered headers and right-aligned numerics.
// Below that: the ruled compact variant (header + full-width rules +
// rows + closing rule). Column widths adapt to fit: exact-data columns
// are never shrunk, wrapped, or truncated — text columns wrap instead.
// Short tables stretch evenly so edges align with the section dividers.
inline std::string renderTable(const Table& t, int maxWidth, bool color = false,
                               bool boxed = false) {
    const size_t n = t.head.size();
    if (n == 0 || maxWidth < 20) return "";
    std::vector<size_t> w(n, 0);
    for (size_t c = 0; c < n; ++c) w[c] = dispWidth(t.head[c]);
    for (const auto& r : t.rows)
        for (size_t c = 0; c < n && c < r.size(); ++c)
            w[c] = std::max(w[c], dispWidth(r[c].empty() ? "-" : r[c]));
    // Boxed width for the style decision below.
    auto boxW = [&] {
        size_t s = 1;
        for (size_t v : w) s += v + 3;
        return s;
    };
    auto ruleW = [&] {
        size_t s = 0;
        for (size_t v : w) s += v + 2;
        return s - 2;
    };
    auto total = [&] { return boxed ? boxW() : ruleW(); };
    // Shrink wrappable text columns (never exact-data columns) to fit.
    constexpr size_t kMinWrap = 6;
    while (total() > static_cast<size_t>(maxWidth)) {
        size_t bi = n;
        for (size_t c = 0; c < n; ++c) {
            if (isNoWrap(t, c) || w[c] <= kMinWrap) continue;
            if (bi == n || w[c] > w[bi]) bi = c;
        }
        if (bi == n) break;
        --w[bi];
    }
    // Fill the layout width: spread leftover space evenly so edges align
    // (callers cap the width; termWidth caps at 90).
    {
        const size_t target = static_cast<size_t>(maxWidth);
        if (total() < target) {
            const size_t extra = target - total();
            const size_t per = extra / n, rem = extra % n;
            for (size_t c = 0; c < n; ++c) w[c] += per + (c < rem ? 1 : 0);
        }
    }
    auto cellAt = [&](const std::vector<std::string>& r, size_t c) -> std::string {
        const std::string v = c < r.size() ? r[c] : "";
        return v.empty() ? "-" : v;
    };
    // Wrap cells that exceed their column (exact-data columns always fit by
    // construction, so they stay single-line).
    auto rowLines = [&](const std::vector<std::string>& r) {
        std::vector<std::vector<std::string>> parts(n);
        size_t lines = 1;
        for (size_t c = 0; c < n; ++c) {
            const std::string v = cellAt(r, c);
            parts[c] = (dispWidth(v) > w[c] && !isNoWrap(t, c)) ? wrapWords(v, w[c])
                                                                : std::vector<std::string>{v};
            lines = std::max(lines, parts[c].size());
        }
        return std::make_pair(parts, lines);
    };
    auto dashRule = [&](size_t tw) {
        std::string r;
        for (size_t i = 0; i < tw; ++i) r += "\xE2\x94\x80";
        return r;
    };
    // Centered header cells; gray (not bold) when colored. Codes wrap text
    // only, padding stays outside so alignment never shifts.
    auto headCell = [&](size_t c) {
        const size_t d = dispWidth(t.head[c]);
        std::string v = (d <= w[c]) ? t.head[c] : truncateDisp(t.head[c], w[c]);
        if (color) v = paint(Theme::header, v, true);
        const size_t vd = dispWidth(t.head[c]) <= w[c] ? dispWidth(t.head[c]) : w[c];
        const size_t left = (w[c] > vd) ? (w[c] - vd) / 2 : 0;
        const size_t right = (w[c] > vd) ? w[c] - vd - left : 0;
        return std::string(left, ' ') + v + std::string(right, ' ');
    };
    auto paintCell = [&](const std::string& v, size_t c) {
        std::string str = v;
        if (color) {
            if (isSpecial(t, c))
                str = paint(Theme::special, str, true);
            else if (isValue(t, c))
                str = paint(Theme::value, str, true);
        }
        return isRight(t, c) ? padL(str, w[c]) : padR(str, w[c]);
    };
    auto align = [&](const std::string& v, size_t c) { return paintCell(v, c); };
    std::string out;
    if (boxed) {
        std::string b = "+";
        for (size_t c = 0; c < n; ++c) b += std::string(w[c] + 2, '-') + "+";
        b = paint(Theme::subtle, b, color);
        out += b + "\n";
        std::string h = paint(Theme::subtle, "|", color);
        for (size_t c = 0; c < n; ++c)
            h += " " + headCell(c) + paint(Theme::subtle, " |", color);
        out += h + "\n" + b + "\n";
        for (const auto& r : t.rows) {
            const auto rl = rowLines(r);
            for (size_t ln = 0; ln < rl.second; ++ln) {
                std::string line = paint(Theme::subtle, "|", color);
                for (size_t c = 0; c < n; ++c) {
                    const std::string v = ln < rl.first[c].size() ? rl.first[c][ln] : "";
                    line += " " + paintCell(v, c) + paint(Theme::subtle, " |", color);
                }
                out += line + "\n";
            }
        }
        out += b + "\n";
        return out;
    }
    std::string rule = paint(Theme::subtle, dashRule(ruleW()), color);
    out += rule + "\n";
    {
        std::string h;
        for (size_t c = 0; c < n; ++c) {
            if (c) h += "  ";
            h += headCell(c);
        }
        while (!h.empty() && h.back() == ' ') h.pop_back();
        out += h + "\n" + rule + "\n";
    }
    for (const auto& r : t.rows) {
        const auto rl = rowLines(r);
        for (size_t ln = 0; ln < rl.second; ++ln) {
            std::string line;
            for (size_t c = 0; c < n; ++c) {
                if (c) line += "  ";
                const std::string v = ln < rl.first[c].size() ? rl.first[c][ln] : "";
                line += align(v, c);
            }
            while (!line.empty() && line.back() == ' ') line.pop_back();
            out += line + "\n";
        }
    }
    out += rule + "\n";
    return out;
}

// ------------------------------------------------------------ name tables

inline const char* planetName(int idx) {
    static constexpr const char* k[13] = {
        "Lagna", "Chandra", "Ravi", "Budha", "Shukra", "Kuja", "Guru",
        "Shani", "Rahu", "Ketu", "Uranus", "Neptune", "Pluto"};
    return (idx >= 0 && idx < 13) ? k[idx] : "?";
}

// Legacy engine key -> corrected display name.
inline std::string displayPlanet(std::string_view key) {
    if (key == "Chandra" || key == "Sandu") return "Chandra";
    if (key == "Sikuru") return "Shukra";
    if (key == "Raahu" || key == "Rahu") return "Rahu";
    if (key == "Kethu" || key == "Ketu") return "Ketu";
    if (key == "Urenus") return "Uranus";
    if (key == "Neptune" || key == "Neptun") return "Neptune";
    return std::string(key);  // Lagna Ravi Budha Kuja Guru Shani Pluto already correct
}

inline const char* rasiName(int idx) {
    static constexpr const char* k[12] = {
        "Mesha", "Vrishabha", "Mithuna", "Kataka", "Simha", "Kanya",
        "Tula", "Vrishchika", "Dhanu", "Makara", "Kumbha", "Meena"};
    return (idx >= 1 && idx <= 12) ? k[idx - 1] : "?";
}

inline const char* vargaName(int idx) {
    static constexpr const char* k[6] = {
        "Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"};
    return (idx >= 0 && idx < 6) ? k[idx] : "?";
}

inline const char* cityLabel(int idx) {
    static constexpr const char* k[16] = {
        "?", "Colombo", "Galle", "Matara", "Kandy", "Hambantota",
        "Kalutara", "Ratnapura", "Puttalam", "Anuradhapura", "Polonnaruwa",
        "Jaffna", "Trincomalee", "Batticaloa", "Badulla", "Kegalle"};
    return (idx >= 1 && idx <= 15) ? k[idx] : "?";
}

// Vimshottari cycle name -> corrected display name.
inline std::string dasaName(const std::string& d) {
    if (d == "Sikuru") return "Shukra";
    if (d == "Sandu") return "Chandra";
    if (d == "Rahu") return "Rahu";
    return d;  // Ketu Ravi Kuja Guru Shani Budha already correct
}

inline std::string formatDeg(const AngularDegrees& a) {
    char b[32];
    std::snprintf(b, sizeof(b), "%d\xC2\xB0%02d'%02d\"", a.deg, a.min, a.sec);
    return std::string(b);
}

inline std::string formatYmd(YMD v) {
    char b[16];
    std::snprintf(b, sizeof(b), "%04d-%02d-%02d", v.y, v.m, v.d);
    return std::string(b);
}

inline std::string formatAge(YMD v) {
    char b[32];
    std::snprintf(b, sizeof(b), "%dy %dm %dd", v.y, v.m, v.d);
    return std::string(b);
}

// ---------------------------------------------------------------- sections

inline constexpr const char* kAppVersion = "2.8.3";

// Closing art for full modern runs: top/bottom spacing, block-centered,
// plain (no color — the art is busy enough). Skipped when the terminal is
// narrower than the art itself; wrapping would destroy it.
inline std::array<std::string, 11> footerArt() {
    return {"   ___     ___     ___     ___              _      _   _    ___    _  __",
            "  / __|   / _ \\   / _ \\   |   \\     o O O  | |    | | | |  / __|  | |/ /",
            " | (_ |  | (_) | | (_) |  | |) |   o       | |__  | |_| | | (__   | ' <",
            "  \\___|   \\___/   \\___/   |___/   TS__[O]  |____|  \\___/   \\___|  |_|\\_\\",
            "_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"| {======|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|",
            "`\"-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'./o--000'\"`-0-0-'\"`-0-0-'\"`-0-0-'\"`-0-0-'",
            "",
            "     o   \\ o /  _ o        __|    \\ /     |__         o _  \\ o /   o",
            "    /|\\    |     /\\   __\\o   \\o    |    o/     o/__   /\\     |    /|\\",
            "    / \\   / \\   | \\  /) |    ( \\  /o\\  / )    |   (\\  / |   / \\   / \\",
            "-------------------------------------------------------------------------"};
}

inline std::string renderFooter(int width) {
    const auto art = footerArt();
    size_t maxLen = 0;
    for (const auto& ln : art) maxLen = std::max(maxLen, dispWidth(ln));
    if (maxLen == 0 || maxLen > static_cast<size_t>(width)) return "";
    std::string out = "\n\n";
    for (const auto& ln : art) out += ln + "\n";
    out += "\n";
    return out;
}

// System date as "Thursday, 17 September 2026".
inline std::string systemDate() {
    static constexpr const char* kDays[7] = {"Sunday",   "Monday", "Tuesday", "Wednesday",
                                             "Thursday", "Friday", "Saturday"};
    static constexpr const char* kMonths[12] = {
        "January", "February", "March",     "April",   "May",      "June",
        "July",    "August",   "September", "October", "November", "December"};
    std::time_t now = std::time(nullptr);
    std::tm local{};
#if defined(_WIN32)
    localtime_s(&local, &now);
#else
    localtime_r(&now, &local);
#endif
    char b[64];
    std::snprintf(b, sizeof(b), "%s, %d %s %d", kDays[local.tm_wday], local.tm_mday,
                  kMonths[local.tm_mon], local.tm_year + 1900);
    return std::string(b);
}

// "=-" rule, exactly width characters (banner skill: exact-width rules).
inline std::string pairRule(int width, bool color = false) {
    std::string r;
    while (static_cast<int>(r.size()) + 2 <= width) r += "=-";
    while (static_cast<int>(r.size()) < width) r += "=";
    return paint(Theme::subtle, r, color);
}

inline std::array<std::string, 6> starLogo() {
    return {"  _____  _______         _____",
            " / ____||__   __| /\\    |  __ \\",
            "| (___     | |   /  \\   | |__) |",
            " \\___ \\    | |  / /\\ \\  |  _  /",
            " ____) |   | | / ____ \\ | | \\ \\",
            "|_____/    |_|/_/    \\_\\|_|  \\_\\"};
}

// Key-value list in `Label : value` form (profile, summary, attributes):
// labels bold when colored, values wrap with a hanging indent, no trailing
// whitespace, every line within width.
inline std::string renderKeyValues(const std::vector<std::pair<std::string, std::string>>& rows,
                                   int width, bool color) {
    size_t lab = 0;
    for (const auto& r : rows) lab = std::max(lab, dispWidth(r.first));
    std::string out;
    for (const auto& r : rows) {
        std::string label = paint(Theme::label, r.first, color);
        const std::string val = r.second.empty() ? "-" : r.second;
        const size_t vw =
            (width > static_cast<int>(lab) + 4) ? static_cast<size_t>(width) - lab - 3 : 10;
        const std::vector<std::string> parts = wrapWords(val, vw);
        out += padR(label, lab) + " " + paint(Theme::subtle, ":", color) + " ";
        bool first = true;
        for (const std::string& part : parts) {
            if (!first) out += std::string(lab + 3, ' ');
            first = false;
            out += paint(Theme::value, part, color) + "\n";
        }
    }
    return out;
}

inline std::string renderBanner(int width, bool color, bool nirayana) {
    (void)nirayana;
    std::string out = pairRule(width, color) + "\n\n";
    out += paintCentered(systemDate(), width, Theme::subtle, color) + "\n";
    if (width < 60) {
        // Compact: single-line title, no logo.
        out += "Sri Lankan Vedic Astrology Engine\n";
        out += paintCentered(std::string("v") + kAppVersion, width, Theme::subtle, color) +
                 "\n\n";
        out += pairRule(width, color) + "\n";
        return out;
    }
    const auto logo = starLogo();
    size_t maxLen = 0;
    for (const auto& ln : logo) maxLen = std::max(maxLen, dispWidth(ln));
    const size_t pad = maxLen < static_cast<size_t>(width) ? (width - maxLen) / 2 : 0;
    for (const auto& ln : logo) {
        // Padding stays outside the codes: never colorize spaces.
        out += std::string(pad, ' ') + paint(Theme::section, ln, color) + "\n";
    }
    out += "\n";
    out += fitCenter("Sri Lankan Vedic Astrology Engine", width, false) + "\n";
    out += paintCentered(std::string("v") + kAppVersion, width, Theme::subtle, color) +
             "\n\n";
    out += pairRule(width, color) + "\n";
    return out;
}

inline std::string renderProfile(const HoroscopeOwner& o, const GeoCoord& geo,
                                 const std::string& city, int width, bool color) {
    std::string out = sectionTitle("Horoscope Profile", width, color);
    char b[256];
    std::snprintf(b, sizeof(b), "%04d-%02d-%02d at %02d:%02d", o.birth_year, o.birth_month,
                  o.birth_day, o.birth_hour, o.birth_minute);
    const std::string born = b;
    std::snprintf(b, sizeof(b), "%s (%d\xC2\xB0%02d'N %d\xC2\xB0%02d'E)", city.c_str(),
                  geo.lat_deg, geo.lat_min, geo.lon_deg, geo.lon_min);
    out += renderKeyValues({{"Name", o.name}, {"Born", born}, {"Place", b}}, width, color);
    return out;
}

inline std::string renderCityList(int width, bool color = false, bool withTitle = true) {
    std::string out = withTitle ? sectionTitle("City Selection", width, color) : "";
    std::vector<std::string> entries;
    size_t maxLen = 0;
    for (int i = 1; i <= 15; ++i) {
        char b[48];
        std::snprintf(b, sizeof(b), "%d. %s", i, cityLabel(i));
        entries.emplace_back(b);
        maxLen = std::max(maxLen, dispWidth(entries.back()));
    }
    const size_t colW = maxLen + 3;
    size_t cols = static_cast<size_t>(width) / colW;
    if (cols < 1) cols = 1;
    if (cols > 5) cols = 5;
    for (size_t i = 0; i < entries.size();) {
        const size_t rowEnd = std::min(entries.size(), i + cols);
        std::string line = "  ";
        for (size_t j = i; j < rowEnd; ++j)
            line += (j + 1 == rowEnd) ? entries[j] : padR(entries[j], colW);
        out += line + "\n";
        i = rowEnd;
    }
    return out;
}

inline std::string renderHouseTable(const AstroEngineOutput& output, int width,
                                    bool color, bool boxed = false) {
    std::string out = sectionTitle("Nirayana Table of Houses", width, color);
    Table t;
    t.head = {"Planet", "Longitude", "Nakshatra", "Pada", "Rasi", "Rasi Longitude", "Avastha"};
    t.noWrapCols = {1, 3, 5};  // exact DMS/count cells are never shrunk or wrapped
    t.rightCols = {3};  // counts right-aligned
    t.specialCols = {0};
    t.valueCols = {1, 3, 5};
    for (int i = 0; i < 13; ++i) {
        const PlanetLongitude& pl =
            output.lonOf(static_cast<Planet>(i));
        const double dec = pl.ecliptic.toDecimal();
        std::string nak, pada;
        if (VargaEngine::normUp(dec) <= 360.0) {
            int nak0 = static_cast<int>(dec / 13.333333333333334);
            if (nak0 < 0) nak0 = 0;
            if (nak0 > 26) nak0 = 26;
            nak = nakshatraName(nak0);
            pada = std::to_string(nakshatraPada(dec));
        }
        const int rasi = VargaEngine::GetRashiIndex(dec);
        const std::string av = output.avastha[static_cast<std::size_t>(i)];
        t.rows.push_back({displayPlanet(kPlanetNames[static_cast<std::size_t>(i)]),
                          formatDeg(pl.ecliptic), nak, pada,
                          rasiName(rasi), formatDeg(pl.rasiRel), av});
    }
    out += renderTable(t, width, color, boxed);
    return out;
}

inline std::string renderShadvargaNames(const AstroEngineOutput& output, int width,
                                        bool color, bool boxed = false) {
    std::string out = sectionTitle("Shadvarga Charts", width, color);
    Table t;
    t.head = {"Graha", "Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"};
    t.specialCols = {0};  // seats are rasi names: plain descriptors
    for (int i = 0; i < 13; ++i) {
        const PlanetLongitude& pl =
            output.lonOf(static_cast<Planet>(i));
        const std::array<int, 6> sv =
            VargaEngine::GetShadvarga(pl.ecliptic.toDecimal());
        t.rows.push_back({displayPlanet(kPlanetNames[static_cast<std::size_t>(i)]),
                          rasiName(sv[0]), rasiName(sv[1]), rasiName(sv[2]),
                          rasiName(sv[3]), rasiName(sv[4]), rasiName(sv[5])});
    }
    out += renderTable(t, width, color, boxed);
    return out;
}

inline std::string renderShadvargaHouses(const AstroEngineOutput& output, int width,
                                         bool color, bool boxed = false) {
    // Array read; the old null-fallback was dead (Engine always provides
    // Lagna; see renderScreen0914 note).
    std::array<int, 6> lagSv = VargaEngine::GetShadvarga(
        output.lonOf(Planet::Lagna).ecliptic.toDecimal());
    std::string out =
        sectionTitle("Shadvarga Positions", width, color);
    Table t;
    t.head = {"Graha", "Rashi", "Navamsa", "Hora", "Drekkana", "Dvadasamsa", "Trimshamsa"};
    t.rightCols = {1, 2, 3, 4, 5, 6};
    t.specialCols = {0};
    t.valueCols = {1, 2, 3, 4, 5, 6};
    auto rel = [](int s, int l) {
        if (l < 1 || l > 12) return s;
        return ((s - l + 12) % 12) + 1;
    };
    for (int i = 0; i < 13; ++i) {
        const Planet p = static_cast<Planet>(i);
        if (p == Planet::Lagna) continue;
        const PlanetLongitude& pl = output.lonOf(p);
        const std::array<int, 6> sv =
            VargaEngine::GetShadvarga(pl.ecliptic.toDecimal());
        t.rows.push_back({displayPlanet(kPlanetNames[static_cast<std::size_t>(i)]),
                          std::to_string(rel(sv[0], lagSv[0])),
                          std::to_string(rel(sv[1], lagSv[1])),
                          std::to_string(rel(sv[2], lagSv[2])),
                          std::to_string(rel(sv[3], lagSv[3])),
                          std::to_string(rel(sv[4], lagSv[4])),
                          std::to_string(rel(sv[5], lagSv[5]))});
    }
    out += renderTable(t, width, color, boxed);
    return out;
}

// ---- kendra charts (boxflow: stack when too narrow for side-by-side) ----

struct ChartSet {
    KendraChart lagna, navamsa, hora, drekkana, dvadasamsa, trimshamsa, sun, moon;
};

inline ChartSet buildCharts(const AstroEngineOutput& output) {
    // Phase-1 array read (pmap resolves the legacy string keys).
    auto seats = [&](Planet p, int varga) {
        return VargaEngine::GetShadvarga(
            output.lonOf(p).ecliptic.toDecimal())[static_cast<size_t>(varga)];
    };
    const std::vector<std::string> keys = {"Chandra", "Ravi",   "Budha", "Sikuru", "Kuja",
                                           "Guru",    "Shani",  "Raahu", "Kethu"};
    const std::map<std::string, Planet> pmap = {{"Chandra", Planet::Chandra},
                                                {"Ravi", Planet::Ravi},
                                                {"Budha", Planet::Budha},
                                                {"Sikuru", Planet::Sikuru},
                                                {"Kuja", Planet::Kuja},
                                                {"Guru", Planet::Guru},
                                                {"Shani", Planet::Shani},
                                                {"Raahu", Planet::Raahu},
                                                {"Kethu", Planet::Kethu}};
    auto planetSeats = [&](int varga) {
        std::vector<std::pair<std::string, int>> ps;
        for (const auto& k : keys) ps.push_back({kendraGlyph(pmap.at(k)), seats(pmap.at(k), varga)});
        return ps;
    };
    ChartSet c;
    c.lagna = makeKendra(seats(Planet::Lagna, 0), rasiName(seats(Planet::Lagna, 0)), "Lagna", planetSeats(0));
    c.navamsa = makeKendra(seats(Planet::Lagna, 1), rasiName(seats(Planet::Lagna, 1)), "Navamsa",
                           planetSeats(1));
    c.hora = makeKendra(seats(Planet::Lagna, 2), rasiName(seats(Planet::Lagna, 2)), "Hora", planetSeats(2));
    c.drekkana = makeKendra(seats(Planet::Lagna, 3), rasiName(seats(Planet::Lagna, 3)), "Drekkana",
                            planetSeats(3));
    c.dvadasamsa = makeKendra(seats(Planet::Lagna, 4), rasiName(seats(Planet::Lagna, 4)), "Dvadasamsa",
                              planetSeats(4));
    c.trimshamsa = makeKendra(seats(Planet::Lagna, 5), rasiName(seats(Planet::Lagna, 5)), "Trimshamsa",
                              planetSeats(5));
    c.sun = makeKendra(seats(Planet::Ravi, 0), rasiName(seats(Planet::Ravi, 0)), "Sun", planetSeats(0));
    c.moon =
        makeKendra(seats(Planet::Chandra, 0), rasiName(seats(Planet::Chandra, 0)), "Moon", planetSeats(0));
    return c;
}

inline std::string renderChartPair(const KendraChart& left, const std::string& leftTitle,
                                   const KendraChart& right, const std::string& rightTitle,
                                   int width, bool color) {
    std::string out;
    if (width >= 80) {
        // Each chart gets its own title, centered over its 39/40 columns.
        out += "\n\n" + sectionDivider(leftTitle, 39, color) +
               sectionDivider(rightTitle, 40, color) + "\n\n";
        std::string pair = renderKendraPair(left, "", right, "", true);
        // Drop trailing blank/whitespace-only lines (the empty legacy titles
        // and separators); keep every art line.
        while (pair.size() >= 2 && pair.back() == '\n') {
            const size_t p = pair.size() - 2;
            const size_t ls = pair.rfind('\n', p);
            const std::string last =
                (ls == std::string::npos) ? pair.substr(0, p + 1) : pair.substr(ls + 1, p - ls);
            bool blank = true;
            for (char ch : last)
                if (ch != ' ' && ch != '\t' && ch != '\r') {
                    blank = false;
                    break;
                }
            if (!blank) break;
            pair.erase((ls == std::string::npos) ? 0 : ls + 1);
        }
        out += pair;
        return out;
    }
    // Narrow: stack the two charts (boxflow split strategy).
    for (const KendraChart* k : {&left, &right}) {
        out += sectionTitle(k == &left ? leftTitle : rightTitle, 40, color);
        for (const std::string& ln : renderKendraSingle(*k, true)) out += ln + "\n";
    }
    return out;
}

// ---- summary (screen12 content, relabelled) ----

using KeyRows = std::vector<std::pair<std::string, std::string>>;

// Collapse whitespace runs to single spaces (the binary's "%-11s" padded
// fields print e.g. "Doloswaka  -12"; engine data itself is untouched).
inline std::string normalizeSpaces(const std::string& s) {
    std::string o;
    bool sp = true;
    for (char c : s) {
        if (c == ' ' || c == '\t') {
            if (!sp) o += ' ';
            sp = true;
        } else {
            o += c;
            sp = false;
        }
    }
    while (!o.empty() && o.back() == ' ') o.pop_back();
    return o;
}

// Summary subsections (grouped for laypeople; titles live with the CLI).
// Panchanga limbs split into plain rows; "%-11s" padding artifacts in
// engine strings are normalized to single spaces for display.
inline KeyRows birthProfileRows(const HoroscopeOwner& owner, const std::string& city,
                                const std::string& weekday) {
    char born[16];
    std::snprintf(born, sizeof(born), "%04d-%02d-%02d", owner.birth_year, owner.birth_month,
                  owner.birth_day);
    return {{"Full Name", owner.name},
            {"Birth Date", born},
            {"Birth Day", weekday},
            {"Birth Place", city}};
}

inline KeyRows astroRows(const AstroEngineOutput& output) {
    // Array read; Engine always provides Lagna (see renderScreen07 note).
    const double lagnaDec = output.lonOf(Planet::Lagna).ecliptic.toDecimal();
    const AngularDegrees lagnaRel = output.lonOf(Planet::Lagna).rasiRel;
    return {{"Julian Date", formatJulianDate(output.julianDate)},
            {"Ayanamsa", formatDeg(output.ayanamsa)},
            {"Lagna", rasiName(VargaEngine::GetRashiIndex(lagnaDec))},
            {"Lagna Degree", formatDeg(lagnaRel)},
            {"Lagna Navamsa",
             rasiName(VargaEngine::GetNavamshaIndex(lagnaDec))}};
}

inline KeyRows timeRows(double birthDecHours, double lmstHours, const GeoCoord& geo,
                        double riseH, double setH) {
    auto hms = [](const HMS& h) {
        char b[16];
        std::snprintf(b, sizeof(b), "%02d:%02d:%02d", h.h, h.m, h.s);
        return std::string(b);
    };
    HMS setHms = displayHms(setH);
    setHms.h %= 12;  // 12-hour clock as printed ("05:51:45")
    return {{"Birth Time", hms(displayHms(birthDecHours))},
            {"Sinhala Time", hms(displayHms(sinhalaGhati(birthDecHours, riseH)))},
            {"True Local Mean Time",
             hms(displayHms(trueLocalMeanHours(birthDecHours, geo.decimalLon())))},
            {"Universal Time (UT)", hms(displayHms(birthDecHours - kTzHours))},
            {"Universal Sidereal", hms(displayHms(printedUniversalSiderealHours(lmstHours)))},
            {"Local Mean Sidereal", hms(displayHms(lmstHours))},
            {"Sunrise", hms(displayHms(riseH))},
            {"Sunset", hms(setHms)}};
}

inline KeyRows panchangaRows(const PanchangaInfo& pg) {
    char nak[64];
    std::snprintf(nak, sizeof(nak), "%s", pg.nakshatra.c_str());
    char pada[8];
    std::snprintf(pada, sizeof(pada), "%d", pg.pada);
    return {{"Tithi", normalizeSpaces(pg.tithiText)},
            {"Nakshatra", nak},
            {"Nakshatra Pada", pada},
            {"Yoga", pg.yoga},
            {"Karana", pg.karana}};
}

inline KeyRows dasaInfoRows(const DasaBalance& bal) {
    char period[64];
    std::snprintf(period, sizeof(period), "%d years %d months %d days", bal.ymd.y, bal.ymd.m,
                  bal.ymd.d);
    return {{"Starting", dasaName(kDasaCycle[bal.lordCycleIdx].name)},
            {"Period", period},
            {"Reference", "From birth"}};
}


inline KeyRows horaRows(const std::string& kala, const std::string& pancha,
                      const std::string& sukshama) {
    return {{"Kala", kala}, {"Panchama", pancha}, {"Sukshama", sukshama}};
}

inline KeyRows chakraRows(int nakIndex) {
    const NakAttributes at = attributesFor(nakIndex);
    return {{"Gana", ganaFor(nakIndex)},
            {"Yoni", displayYoni(at.yoni)},
            {"Linga", at.linga},
            {"Naadi", at.naadi},
            {"Varna", at.varna},
            {"Ruxha", at.ruxha},
            {"Paxhi", at.paxhi},
            {"Gothra", at.gothra},
            {"Rajju", at.rajju},
            {"Bhutha", at.bhutha}};
}

// ---- dasa: Mahadasa branches with Athuru leaves directly attached. ----
// Ages stay compact (`0y 0m 0d`): the full-word form overflows 80 columns
// and tree art cannot wrap, while the Summary carries full prose anyway.

inline std::string renderDasa(const YMD& birth, double birthFrac, const DasaBalance& bal,
                              double moonNirayanaDeg, int width, bool color) {
    const std::vector<DasaSpan> mahas = mahaTimeline(birth, birthFrac, bal);
    std::string out = sectionTitle("Mahadasa and Athurudasa Timeline", width, color);
    // No root label: it would duplicate the section title and confuse.
    // The divider's blank lines keep the spacing.
    // Scoped palette (colorizer skill): Mahadasa lords yellow, Athuru
    // lords magenta, dates cyan, ages light gray. Plain fallback keeps the
    // identical structure.
    auto spanLine = [&](const std::string& lord, const DasaSpan& s, bool leaf) {
        char d[64], a[64];
        std::snprintf(d, sizeof(d), "%s to %s", formatYmd(s.from).c_str(),
                      formatYmd(s.to).c_str());
        std::snprintf(a, sizeof(a), "(%s to %s)", formatAge(s.ageFrom).c_str(),
                      formatAge(s.ageTo).c_str());
        std::string L = dasaName(lord), D = d, A = a;
        if (color) {
            if (!leaf) L = paint(Theme::special, L, true);
            D = paint(Theme::dates, D, true);
            A = paint(Theme::faint, A, true);
        }
        return L + ": " + D + " " + A;
    };
    for (size_t i = 0; i < mahas.size(); ++i) {
        const DasaSpan& m = mahas[i];
        const bool last = (i + 1 == mahas.size());
        const int lordIdx = [&] {
            for (size_t k = 0; k < kDasaCycle.size(); ++k)
                if (m.lord == kDasaCycle[k].name) return static_cast<int>(k);
            return 0;
        }();
        out += (last ? "\xE2\x94\x94\xE2\x94\x80 " : "\xE2\x94\x9C\xE2\x94\x80 ") +
               spanLine(m.lord, m, false) + "\n";
        const bool isFirst = (i == 0);
        std::vector<DasaSpan> bh;
        if (isFirst) {
            bh = bhuktiTimeline(birth, birthFrac, lordIdx, bal.years,
                                balanceElapsedUnits(moonNirayanaDeg),
                                static_cast<double>(kDasaCycle[lordIdx].years));
        } else {
            const double span = m.to.y != 0
                ? (fracYear(m.to.y, m.to.m, m.to.d) - fracYear(m.from.y, m.from.m, m.from.d))
                : static_cast<double>(kDasaCycle[lordIdx].years);
            bh = bhuktiTimeline(birth, fracYear(m.from.y, m.from.m, m.from.d), lordIdx, span);
        }
        const std::string stem = last ? "   " : "\xE2\x94\x82  ";
        for (size_t j = 0; j < bh.size(); ++j) {
            out += stem + ((j + 1 == bh.size()) ? "\xE2\x94\x94\xE2\x94\x80 "
                                                : "\xE2\x94\x9C\xE2\x94\x80 ") +
                   spanLine(bh[j].lord, bh[j], true) + "\n";
        }
    }
    return out;
}

}  // namespace modern
}  // namespace star

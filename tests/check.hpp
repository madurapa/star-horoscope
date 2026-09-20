// Shared test helpers: single CHECK definition + exit-code clamp.
// Migration: new tests include this; the 8 legacy files keep their local
// CHECK until they are migrated (tracked, not churned while green).
#pragma once
#include <cstdio>

namespace startest {
inline int g_fail = 0;
#define STAR_CHECK(cond, ...) do { \
    if (!(cond)) { ++::startest::g_fail; std::printf("FAIL %d: ", __LINE__); \
        std::printf(__VA_ARGS__); std::printf("\n"); } \
    else { std::printf("ok   "); std::printf(__VA_ARGS__); std::printf("\n"); } \
} while (0)
// Exit codes wrap past 255; clamp so CI never sees a false-green 0.
inline int exitCode() { return g_fail > 125 ? 125 : g_fail; }
}  // namespace startest

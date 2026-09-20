#pragma once
// MSVC compatibility shims for the POSIX bits used by the CLI
// (isatty + STD*_FILENO; ioctl stays behind its own _WIN32 guard).
// MinGW already provides unistd.h, so EVERY guard here is _MSC_VER,
// never _WIN32 (a _WIN32 guard would silently break the MinGW build).
#if defined(_MSC_VER)
#include <io.h>
#define isatty _isatty
#ifndef STDIN_FILENO
#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2
#endif
#else
#include <unistd.h>
#endif

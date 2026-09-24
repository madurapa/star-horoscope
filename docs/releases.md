# Release notes

Copy-paste source for GitHub release bodies. Newest on top; write the
section BEFORE pushing the tag so the notes exist at release time.
When pasting, skip the `## vX.Y.Z` marker line and copy from the
`###` highlight title down — GitHub already shows the tag version
at the top of every release.

---

## v3.1.0

### Locales single-sourced, schema v2

- JSON schema `star-horoscope/2`: the `"display"` key is gone
  everywhere (CLI, pystar, console, docs).
- `tools/gen_locales.py` is the single source for generated
  language tables; `locales_check` fails the gate on drift;
  jyotichart chart markers use core wording.
- `--verify` now asserts both engines (was DOS-only).

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v3.0.0

### Legacy removal: Swiss product, DOS reference

Breaking: the `--display` flag is gone (modern output only),
`renderScreen*` renderers deleted, `tests/screens/` and DOS-capture
goldens removed, `tools/` DOS extract/capture/compare scripts
retired, `legacy/` directory deleted (frozen on the `legacy`
branch), and the JSON schema drops the `"display"` key.

- Product gate is Swiss-first: `tests/corpus/` and
  `tests/swiss_goldens/`; the verifier asserts both engines
  (DOS block pins balance 9-10-11, Swiss block all longitudes
  moved ~2' and dasa +15d to 9-10-26).
- `--engine dos|swisseph` (default swisseph); `--verify` still
  pins the DOS checkpoints.
- Glossary is modern-vocabulary-only; quirks archived as the
  DOS-engine record; AGENTS/README/CONTRIBUTING and the plan
  docs rewritten around the product.
- `pystar.horoscope()` drops the `display` argument.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.13.2

- macOS asset renamed to `star.dmg` (dmg needs no platform
  qualifier on Mac)

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.13.1

### macOS drag-to-Applications disk image

- macOS asset is now `star.dmg` (binary + `/Applications`
  shortcut inside) instead of a bare binary
- Unsigned builds need one-time approval: macOS right-click >
  Open, Windows SmartScreen > Run anyway (documented in README)

Binaries in this release: Linux (GCC, static), macOS (Clang,
.dmg), Windows (MSVC, static CRT) — all built from this tag by
`.github/workflows/release.yml`.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.13.0

### Download-and-run portable binaries

- Release assets need no install: Linux binary fully static,
  Windows needs no VC++ redistributable (static CRT), macOS uses
  system libraries only — download from this page and run, like
  the original STAR.EXE
- Since v2.8.19: 26 districts, Sinhala/Tamil first draft
  (`--locale si|ta`), frozen JSON schema (`--format json`),
  optional `pystar` Python bindings, extended dasha/yoga wording
- Full gate on every build: tests + `VERIFY_ALL_GREEN`, on
  Linux (GCC), macOS (Clang), and Windows (MSVC)

Binaries in this release: Linux (GCC, static), macOS (Clang),
Windows (MSVC, static CRT) — all built from this tag by
`.github/workflows/release.yml`.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.8.19

### Synthetic birth data + completed kendra chart table

- Birth-data privacy: all built-in profiles now use synthetic dummy
  data, and every DOS-derived golden was re-baselined from fresh
  DOSBox captures of the original program
- Kendra chart table completed (55 → 82 fixed glyph cells): all 8
  charts on screens 08–11 render line-exact against the original,
  with every repeated placement landing on the same cell
- Ground-truth references (checkpoints, CLI hints, comment proofs)
  re-anchored to the new baseline (Lagna 239:7:8, Guru balance
  9-10-11)
- Full gate on every build: 25/25 tests + `VERIFY_ALL_GREEN`

Binaries in this release: Linux (GCC), macOS (Clang), Windows
(MSVC) — all built from this tag by
`.github/workflows/release.yml`.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.8.17

### Native Windows builds (MSVC) and 64-bit everywhere

- Windows releases now build with MSVC (VS2022 x64); MinGW retired
  from CI (small `_MSC_VER` compat shims, same UCRT math, goldens
  hold byte-exact)
- All binaries are 64-bit, enforced by the build on every platform
- Release assets renamed: `star_linux`, `star_macos`, `star.exe`
- README refresh: the original DOS program (opening screenshot +
  DOSBox-X instructions), cross-platform intro, fixed quick-build
- Full gate on every build: 25/25 tests + `VERIFY_ALL_GREEN`, on
  Linux (GCC), macOS (Clang), and Windows (MSVC)

Binaries in this release: Linux (GCC), macOS (Clang), Windows
(MSVC) — all built from this tag by
`.github/workflows/release.yml`.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

---

## v2.8.12

### Swiss engine becomes the default

Flagless runs now compute with the Swiss Ephemeris feed (Moshier +
Lahiri), validated against the frozen DOS reconstruction:

- `--engine dos|swisseph` (default: swisseph; `dos` = frozen
  reconstruction of STAR.EXE)
- `--verify` and the test corpus stay pinned to DOS, unconditionally
- L1 differential bounds over a frozen 36,783-case grid (1900–2100):
  inner planets arcminutes, Saturn 30', Uranus 24', Pluto 81',
  nodes 2', ayanamsa 118"
- L2 independent anchors green (J2000 identity, March-2026 equinox
  crossing, ayanamsa rate 50.287"/yr)
- L3 Swiss goldens frozen (`tests/swiss_goldens`, 3 profiles)
- Full gate on every build: 25/25 tests + `VERIFY_ALL_GREEN`

Binaries in this release: Linux (GCC), macOS (Clang), Windows
(MinGW-UCRT64) — all built from this tag by
`.github/workflows/release.yml`.

Full changelog: CHANGELOG.md. Provenance: NOTICE.md.
License: GNU AGPL-3.0 (see LICENSE).

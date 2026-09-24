# Modern display layer

The modern display (`src/ModernRenderer.hpp`) presents engine numbers with
corrected spellings (per `docs/glossary.md`) and a redesigned, responsive
layout. Presentation only: no engine math, map keys, varga seats, or dasa
dates change. The shared DOS-literal tables and kendra geometry it builds
on live in `src/ScreenRenderer.hpp` (legacy renderers removed, R2). A
cross-check test (`tests/test_modern_display.cpp`) pins the modern
spellings, numbers, and layout rules; engine numbers are additionally
pinned by the dual-engine verifier and `test_swiss_goldens`.

## ASCII skill rules applied (`.agents/skills/ascii-*`)

The skills ship Python scripts, but this is a native C++ app, so the rules
are implemented in `ModernRenderer.hpp` / `CLI.cpp` following each skill's
contract:

- `ascii-table-renderer`: ONE style everywhere so tables never disagree:
  header + full-width rule + rows + closing rule (box `+ - |` borders
  cannot fit 80 columns without cutting data — proven by column math — so
  the original's rule framing is used instead). Tables stretch evenly to
  the 80 floor and cap at the 80 ceiling; exact-data columns are never
  shrunk, wrapped, or truncated — text columns wrap instead; pure-number
  columns right-align; empty cells render `-`; no trailing spaces.
- `ascii-cli-logo-banner`: header block = exact-width `=-` rules around the
  system date (`Thursday, 17 September 2026`), a centered STAR logo, the
  engine name, and `v2.1.0`; compact mode (single-line title, no logo) when
  width < 60; every line within width.
- `ascii-ansi-colorizer`: one central `Theme` (retheme in a single
  struct). Roles for dark terminals: section titles bold bright cyan,
  key labels bold bright yellow, key values/measure cells bright green,
  planet/dasa names bright magenta, table headers bright cyan, tree dates
  cyan, tree ages light gray, divider dashes / table borders / separators
  dim gray, input validation yellow, fatal TTY-stderr red. Deviations from
  the first proposal, all deliberate: dates stay cyan (green is the
  key-value color; cyan keeps tree layers distinct), ages stay readable
  light gray (`90m` is near-black on dark terminals), kendra art stays
  monochrome, Athuru lords stay default-white against magenta Mahadasa
  lords. Codes wrap visible text only (never spaces, never alignment);
  plain-text fallback is byte-identical minus codes;
  `--color auto|always|never` plus `NO_COLOR` env support; never colorizes
  piped/file output (stderr colors only on TTY).
- `ascii-diagram-boxflow`: width-capped diagrams; kendra pair stacks
  vertically when the terminal is too narrow for side-by-side (79 cols
  needed), each chart carrying its own title centered over its 39/40
  columns; Mahadasa -> Athurudasa shown as a Unicode tree (`├─` / `└─` /
  `│`) with a `Mahadasa` root, per lord branches carrying full date and age
  ranges, Athuru leaves attached directly (no intermediate branch). Ages
  stay compact (`0y 0m 0d`): full words overflow 80 cols and tree art cannot
  wrap; the Summary carries full prose instead.

## House style (all modern screens, input + output)

- Section dividers: `─── Title ───` (U+2500) exactly terminal width, one
  blank line before and after — same gap everywhere.
- Titles in Title Case, centered (`Horoscope Profile`, `City Selection`,
  `Nirayana Table of Houses`, `Summary`, `Lagna Chart`, ...).
- Input prompts indented 2 spaces with `[default]` hints (`[y/N]`,
  `[s/N]`, `[1-15, >15 Other]`); empty line takes the default where one is
  shown, otherwise the field is required. Errors as `  ! message` (red on
  color terminals).
- City list shows names only (coordinates live on the profile/summary
  place lines); columns flow to terminal width.
- Display order by importance: header, **summary**, profile, cities,
  options, houses, shadvarga, positions, charts, hora, dasa timeline
  (`--screen` numbers still address content: 12=summary wherever printed).
  After interactive input, the echo sections (profile, cities, options,
  thathkala line) hide by default — explicit `--screen` still shows them.
- Layout cap is 90 columns; tables/dividers/banner fill the layout width
  (stretch when short, wrap text when over). Narrower terminals keep
  stacking/wrapping. No emitted line exceeds the layout width.
- Key-value lists (profile, summary subsections, options) use
  `Label : value` colon form with hanging-indent wraps instead of tables.
  Group 12 prints five subsections (Birth Profile, Astronomical & Chart
  Reference, Time & Solar Metrics, Panchanga, Dasa Information); group 13
  prints Hora (Kala/Panchama/Sukshama) and Chakra (10 attributes in
  Gana..Bhutha order). Panchanga limbs split into layperson rows
  (`Tithi`, `Nakshatra`, `Nakshatra Pada`, `Yoga`, `Karana`); engine
  padding artifacts collapse to single spaces (`Doloswaka  -12` ->
  `Doloswaka -12`, data itself untouched).
- Pure-number columns right-align (house Pada, all Shadvarga Positions
  cells); exact-data columns are still never cut.
- Sections breathe: two blank lines before and after every divider.
- After interactive input, echo sections (profile, cities, options,
  thathkala line) hide by default; explicit `--screen` still shows them.
  Display order: header, summary subsections, profile, cities, options,
  houses, shadvarga, positions, charts, hora, chakra, dasa timeline.
- Full modern runs close with the ASCII footer art left-aligned flush
  with all full-width content (top/bottom spacing, skipped when the
  terminal is narrower than the art).
- Interactive input opens with the same top banner as the results; prompts
  use `Full Name`, structured errors carry field examples
  (`YYYY MM DD, eg: 1981 12 08`).
- Summary is a headerless key-value table; all item labels Title Case
  (`Birth Place`, `Julian Date`, `Kala Hora`, ...).

## Correction catalog

Single-sourced in `docs/glossary.md` (modern vocabulary + regeneration
tooling) — not duplicated here, so the two can never disagree. (An older
revision of this section carried its own Legacy→Modern table, including
stale `Sun/Moon chart` titles since corrected to Surya/Chandra.)

### Deliberately retained (transliteration, not typos)

Nakshatra names (`Asvida`, `Deta`, ...), tithi/yoga/karana names,
gana/yoni/ruxha/linga/naadi/paxhi/gothra/varna/rajju/bhutha tables, hora
lord names, `Thathkala Kendra`, weekday names. Re-transliterating this
vocabulary risks inventing wrong forms; tracked as future work.

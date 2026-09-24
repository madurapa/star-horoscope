# JSON schema v1 (frozen) — `star-horoscope/1`

Machine output for pure consumers (Python/TypeScript later). Produced by
`--format json`; the document always says how it was made. Hand-specified,
no third-party dependency (hand-rolled writer in `src/JsonOutput.hpp`);
the schema documents shape and rejects nothing (plan rule: strict schemas
reject legitimate values).

## Document

```json
{
  "schema": "star-horoscope/1",
  "version": "2.10.2",
  "name": "Test User",
  "birth_date": "2000-08-17",
  "birth_time": "14:05",
  "place": {"city_index": 7, "city": "Ratnapura"},
  "method": "nirayana",
  "engine": "swisseph",
  "locale": "en",
  "julian_date": 2451773.857639,
  "ayanamsa_deg": 23.865845,
  "longitudes": {
    "Lagna": "239:05:18",
    "Chandra": "325:04:41",
    "...": "..."
  },
  "lagna": {"rasi": "Vrishchika", "degree": " 29:07:08", "navamsa": "Meena"},
  "houses": {"Lagna": 1, "Chandra": 4, "...": 0},
  "shadvarga": {
    "Lagna": ["Vrishchika", "Meena", "Simha", "Kataka", "Tula", "Vrishabha"],
    "...": ["..."]
  },
  "panchanga": {
    "weekday": "Thursday", "nakshatra": "Puvaputupa", "pada": 2,
    "tithi": "Ava -Thiyawaka  - 3", "yoga": "Sukarna", "karana": "Kavlava"
  },
  "times": {
    "birth": "14:05:00", "sinhala": "20:05:37", "sunrise": "06:02:45",
    "sunset": "05:57:15", "ut": "08:35:00", "lmst": "11:40:44"
  },
  "dasa": {
    "balance_lord": "Guru", "balance": "9y 10m 26d",
    "mahas": [
      {"lord": "Guru", "from": "2000-08-17", "to": "2010-07-13"}
    ]
  },
  "hora": {"kala": "Kuja", "panchama": "Kuja", "sukshama": "Kuja"},
  "chakra": {
    "gana": "Maanusha", "yoni": "Sinha     ", "linga": "Purusha",
    "naadi": "Poorva", "varna": "Brahmana", "ruxha": "Mee Amba#",
    "paxhi": "Maura", "gothra": "Kruthu", "rajju": "Nabhi",
    "bhutha": "Aakasha"
  }
}
```

## Field rules (frozen)

- `schema`: always exactly `star-horoscope/1`. Consumers switch on this,
  never on `version`.
- `version`: the app version that produced the document (varies).
- `name`: owner name, JSON-escaped (`\"`, `\\`, `\u00XX`).
- `birth_date`: `YYYY-MM-DD`; `birth_time`: `HH:MM` (24h).
- `place.city_index`: list index, or `<= 0` for manual/unknown geography;
  `place.city`: resolved label (`Ratnapura`, `Manual entry`, ...).
- `method`: `nirayana`|`sayana`. `engine`: `dos` (frozen DOS
  reconstruction) | `swisseph` (default). `locale`: requested locale.
- `julian_date`: 6 decimals; `ayanamsa_deg`: engine degrees, finite.
- `longitudes`: exactly the 13 canonical engine keys in Planet order
  (`Lagna` first); values are `D[: ]DD:MM:SS` display strings (padded with
  a leading space below 100°). Values are strings, not numbers, because
  the DOS display format (no seconds carry, e.g. `213:52:60`) is not
  valid sexagesimal arithmetic — parse with the same display rule.
- `lagna`: reference triple (modern rasi spellings) plus the six
  varga `seats` (1-12) everything else derives houses from.
- `houses`: Equal-house index per planet from Lagna.
- `avastha`: engine avastha state per planet ("" if blank).
- `details`: per-planet nakshatra/pada/rasi_longitude (the houses
  table columns; `°'"` display form).
- `shadvarga`: six seats per planet, Rashi..Trimshamsa order (modern
  rasi spellings).
- `panchanga`: engine limb strings; `pada` integer.
- `times`: clock splits (`HH:MM:SS`); sunset on the 12-hour clock;
  `lmt` (true local mean) and `gmst` (Greenwich mean sidereal) included.
- `dasa`: opening balance plus all 9 maha spans (ISO dates), each
  with its `bhuktis` drill-down (lord/from/to/age, same anchoring as
  the text timeline).
- `hora`: kala/panchama/sukshama lords (display spellings).
- `chakra`: nine attribute values (yoni display-truncated to 10).

## Evolution policy

v1 is frozen: additive fields only, never renames, removals, or
reordering of `longitudes`. A breaking shape ships as `star-horoscope/2`
alongside v1, never replacing it.

> Erratum 2026-09-24 (remove_legacy): the `"display"` key was removed
> under the v1 identifier when the legacy display died (all consumers
> in-repo, updated atomically; no API promises exist before v3). The
> version decision rides with the v3.0.0 cut (R8).

# Parking lot — parked items awaiting owner review

Parked 2026-09-25. Nothing here is forgotten; nothing here starts
without an explicit go.

## Parked: translation review

- `docs/translator_handoff.md` (§0 363 concepts + §1–§6 new strings)
  waits for the reviewer. On return: transcribe → regen → gate →
  commit with reviewer name (checklist in the file).

## Needs owner decision (do not start blind)

- Single-binary merge (star-report + star-gui): now, later, or never?
- Code-signing cert purchase (SmartScreen/Gatekeeper friction).
- macOS notarization + Developer ID.
- Windows console flash on GUI double-click: accept or go windowed?

## Ready to execute on a word

- GUI polish: form-label concepts, district combobox, in-app
  chart-style selector, dasa drill-down, table column sizing.
- Release cut: everything since v3.2.0 (Qt shell/views/PDF,
  services, binding geo) needs version bump + notes + tag.
- CI watch: macOS/Windows GUI artifacts need eyes on a real
  workflow run (Linux proven locally only).

## Background threads (no action)

- SwissEph vendor sync aging; `pystar` wheel matrix.

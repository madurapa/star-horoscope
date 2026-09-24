# Provenance

This project is an independent reconstruction of a DOS-era Sri Lankan
Vedic astrology program (commonly referred to as STAR.EXE) whose original
author is unknown and whose source code was never available. The program
was freely distributed in Sri Lanka and fell out of use only because
modern operating systems can no longer run 16-bit DOS binaries.

This codebase was built by black-box analysis of the program's own
output (screen captures across many input scenarios) combined with
static disassembly of the binary, in order to restore free public access
to functionality that would otherwise be permanently lost. It is not a
copy of the original source code (none exists), makes no claim of
authorship over the original program, and is not a commercial product.

Where this project's output intentionally reproduces a quirk, rounding
behavior, or apparent bug from the original program, that reproduction
is documented in docs/quirks.md and is deliberate, not an oversight.

## Frozen reference tree

The pre-removal tree — original `STAR.EXE` binary, disassembly,
extraction scripts, legacy display, and DOS-pinned goldens — is
frozen on the `legacy` branch (`origin/legacy` at v2.35.0,
commit `eeda1eb`), the court of last resort for arbitration. No
release tag marks that commit; the branch is the reference.

## Third-party software

- Swiss Ephemeris, v2.10.3final (https://github.com/aloistr/swisseph),
  by Dieter Koch and Alois Treindl (Astrodienst AG). Sources vendored
  under third_party/swisseph/ (see VERSION there for the pin).
  Used under the terms of the GNU Affero General Public License;
  the upstream license notice is preserved in
  third_party/swisseph/LICENSE.

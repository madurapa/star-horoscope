# Beyond legacy: unstick plan (DRAFT — no action until owner says go)

> Status 2026-09-24: largely realized via `docs/remove_legacy.md`
> (owner rulings there supersede this draft where they differ):
> Swiss default is live, the verifier is dual-engine, modern goldens
> (`tests/corpus/`, `tests/swiss_goldens/`) are the product gate, and
> the DOS engine remains as the frozen reference. v3.0.0 flag day and
> the keep/correct/drop divergence ledger are still open (R8).

## The problem, stated plainly

Every new feature currently pays a fidelity tax: modern output must keep
DOS numbers byte-equal, quirks reproduce deliberately, and goldens change
only by re-baselining against a 16-bit program. That contract served the
reconstruction era. With **both engines** in the tree, it now blocks the
product era: Swiss-backed modern output cannot clean up anything without
"diverging", so nothing gets cleaned up.

## The proposal in one paragraph

Freeze DOS fidelity as a *reference layer* (immutable, runnable on
demand) and promote the modern display + Swiss engine to the *product
layer* with its own goldens, its own correction policy, and documented
divergences. Nothing is deleted; the default gate changes.

## What freezes (never weakens)

- `legacy/` archive, all git tags, and `--engine dos --display legacy`
  byte-exact output, exactly as of the freeze tag.
- The current golden suite (`tests/screens/`, `tests/corpus/`,
  `tests/screen_test/`, Swiss goldens) frozen at that tag and runnable
  on demand (`--verify` keeps a `--legacy` mode).
- NOTICE.md provenance story. No-defaults input validation. Privacy rule.

## What changes

- The default gate becomes modern-first: `tests/` gain a modern suite
  (goldens per display×engine matrix) that is allowed — expected — to
  differ from DOS where the model is cleaner.
- Each fidelity-bound behavior gets a recorded ruling: **keep** (still
  matches DOS), **correct** (modern diverges with reason + magnitude),
  or **drop** (DOS artifact with no astrological meaning). `docs/quirks.md`
  becomes the divergence ledger: before/after + reason per item.
- `--verify`/corpus gain an engine dimension instead of pinning DOS
  unconditionally. `--display legacy` and `--engine dos` remain forever
  as reference modes, not product blockers.
- Flag day is **v3.0.0**: the first intentional divergence lands with a
  major bump (breaking output changes = major, per semver honesty).

## Phases (gates hold throughout; a red gate still reverts)

- **P0 — Inventory (docs only).** Walk `docs/quirks.md` + the 23|24-class
  behaviors and table every item with a proposed disposition
  (keep/correct/drop) + magnitude. Owner reviews the table. No code.
- **P1 — Matrix scaffolding.** Modern goldens per display×engine land
  beside (never replacing) legacy goldens. Both suites green, zero
  behavior change. This is pure test code.
- **P2 — Divergence execution.** Item by item from the P0 table, each
  with justification + CHANGELOG note. v3.0.0 cut at the first landing.
- **P3 — Product docs.** README/CHANGELOG rewritten around the modern
  product; legacy documented as the reference mode it becomes.

## Standing rules that survive

- Owner rules each divergence (same habit as today, different default).
- No silent edits: every behavior change carries justification +
  version note, same as the golden rule does now.
- Privacy, provenance, input validation: untouched.

## Risks and mitigations

- *Losing DOS arbitration* → mitigated by the frozen layer (tag +
  runnable reference + pinned suite). Arbitration gets slower, never
  impossible.
- *Death by a thousand corrections* → mitigated by the P0 table:
  closed list, owner-ruled, no drive-by normalization.
- *User trust* → every divergence is user-visible and documented with
  before/after. Nothing silent, ever.

## Explicit non-goals (still)

- No engine rewrite (Swiss stays), no new required dependencies,
  no API stability promises before v3.

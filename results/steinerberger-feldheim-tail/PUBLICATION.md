# Steinerberger's quantitative Feldheim-tail conjecture

## Checked scope

The existing original two-clause disproof is fully formalized in the four
`SteinerbergerFeldheim` modules. The [receipt](verification/receipt.json)
records strict source compilation, all-owned transitive axiom checks, and
exact stock-kernel replay. The [independent review](LEAN_REVIEW.md) checks
the source statement and probability interpretation. Separate smoothing,
log-concavity, rate, and smaller-constant supplements remain outside the
formal endpoints.

The publication branch was based on main commit
`62710c41d618c9198ecc01d9e08ba869fcdda707`. The README keeps the existing
rank and position: after Steinerberger's greedy-energy Fourier conjecture
and before Simon's stable-infimum conjecture. Only the existing Lean-status
cell changes. No new result entry or additional conjecture count is added.

## Local site validation

With Python 3.12.14 and Pandoc 3.1.11.1, the README rank/status checker, all eleven site regression tests, the full canonical-URL site build, and the site checker passed. The build produced 159 result pages and 676 HTML pages; the checker verified links, anchors, assets, source scopes, attribution, metadata, and 32,749 MathML formulas. Exact commit validation is recorded in the publication PR and issue #563.

## Repository-wide verification blocker

The unchanged command

```bash
scripts/verify_lean.sh Conjectures.SteinerbergerFeldheim
```

was attempted with the shared dependency cache mounted read-only. It exited
with status 1 before project verification. Lake attempted to remove and
rebuild missing dependency archives, starting at
`Mathlib/Tactic/Translate/Core.ltar`, and then other Mathlib tactic modules.
The supplied cache contains usable imported objects but lacks the complete
Lake build-artifact state. The mount prevented any shared-cache writes.
The [exact failure log](verification/repository-lean.log) is preserved.

A private copy-on-write overlay successfully began rebuilding those
dependencies. It was interrupted with exit 130 to avoid duplicating the
multi-gigabyte cache in the constrained runtime. Its [partial log](verification/repository-lean-overlay.log)
is preserved and is not a passing repository gate.

This dependency-artifact failure is distinct from the complete four-module
proof closure. The dedicated [verification workflow](../../.github/workflows/lean-steinerberger-feldheim.yml)
and unchanged repository-wide workflow can run on a complete hosted cache.
No pending, failed, skipped, or blocked required merge gate is labeled green.

## Publication tracking

The discovery was already published and issue [#396](https://github.com/1337isnot1337/solved-conjectures/issues/396)
is closed as completed. The separate Lean verification/deployment follow-up
is [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
That issue records the publication PR, exact checked tree, hosted CI status,
merged commit, and current-mode website deployment evidence as they become
available. The local scoped receipt alone does not certify those stages.

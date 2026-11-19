# Line-size sets

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Erdős Problem 607 / OEIS A401948: sharp counting asymptotic with exact leading prefactor.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/erdos-607-line-sizes/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Seven foundation modules are checked: the incidence cost bound for actual real
affine lines, the unique positive core and its cost formula, ordinary-line
existence for every finite noncollinear real-plane configuration, selected-graph
degree and cost identities, and the exact core-to-gap bijection with its weight.
Each component passed source checks, axiom auditing, and independent kernel
replay. The Sylvester–Gallai dependency is a locally checked, pinned CC0 port
with its source and license recorded in `lean/Conjectures/LineSizeImported`.

Geometric sufficiency, the exact generating-function correspondence, and the
sharp asymptotic remain in progress. See [the formalization obligations](LEAN_PLAN.md)
and [the status report](../../docs/lean-status.md).

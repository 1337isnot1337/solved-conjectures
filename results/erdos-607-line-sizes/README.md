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

The exact realizability criterion is proved for actual finite sets of real
plane points. The geometric construction, filling, padding, ordinary-line
theorem, and collinear cases give equality of the geometric record count
with the canonical tuple count for every natural n. The core/gap weight
equivalence is also checked. The Sylvester–Gallai dependency is a pinned
CC0 port with its license and provenance preserved.

The exact saddle constant, unique saddle, curvature, global phase bound,
and mean/variance identities have passed source, axiom, and independent
kernel checks. The exponential-series integral supplies the constant.

The generating-function evaluation, uniform corrected Euler product,
Fourier local limit, tail control, and sharp coefficient asymptotic remain
in progress. See [the obligations](LEAN_PLAN.md) and
[the checked scope and receipts](../../docs/lean-status.md).

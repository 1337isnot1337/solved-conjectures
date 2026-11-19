# Liu–Zhu packing and Natalchenko–Sagdeev covering

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Sharp densities for every symmetric four-point set of integers. For odd coprime steps the proof determines the longest interval that can be covered exactly once.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/symmetric-four-point-density/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The complete theorem for every translated symmetric four-point integer set, both periodic constructions, literal translate semantics, and the sharp local interval lengths are formalized. Common-divisor normalization is proved. The full stated result passed source compilation, axiom audit, and independent kernel replay. See [the checked Lean scope](LEAN.md) and [the status report](../../docs/lean-status.md).

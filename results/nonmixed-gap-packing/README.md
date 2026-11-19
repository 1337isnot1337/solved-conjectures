# Packing with two nonmixed gaps

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Natalchenko–Sagdeev’s main packing conjecture for arbitrary gap counts. The same formula gives the circle parameter in their Section 4 question.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/nonmixed-gap-packing/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The complete three-case formula for positive coprime steps and arbitrary positive gap counts is formalized. It proves both the supremum of packing densities and the actual real circle maximum, with periodic attainment and literal tile semantics. Common-divisor normalization is proved. The full stated result passed source compilation, axiom audit, and independent kernel replay. See [the checked Lean scope](LEAN.md) and [the status report](../../docs/lean-status.md).

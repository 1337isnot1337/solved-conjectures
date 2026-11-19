# Six-speed Loneliness Spectrum Conjecture

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

The values below 1/6 are exactly (P−1)/(6P) for P ≥ 7 congruent to ±1 modulo 6. Cordella’s nine sporadic sextuples exhaust the exceptions to the three known families.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/six-speed-spectrum/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

Partial formalization. The general pair-sum maximum theorem and the displayed finite examples have checked global loneliness values. Exhaustiveness and the full classification remain open in Lean. See [the status report](../../docs/lean-status.md) for exact scope.

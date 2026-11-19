# Batista's Egyptian fractions

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

OEIS A398581: the lexicographically first triple uniquely maximizes the last denominator for admissible `k ≢ 1 (mod 5)`.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/batista-egyptian-fractions/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The stated result is marked formally verified. See [the status report](../../docs/lean-status.md) for checked scope and remaining dependencies.

# Five-speed Loneliness Spectrum Conjecture

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

The values below 1/5 are exactly s/(5s+1) for positive integers s. Cordella’s twelve sporadic primitive quintuples exhaust the exceptions to the two known families.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/five-speed-spectrum/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

No Lean formalization is currently listed for this result. See [the status report](../../docs/lean-status.md) for checked scope and remaining dependencies.

## Supporting files

- [`cover.json`](cover.json)
- [`sieve.cpp`](sieve.cpp)

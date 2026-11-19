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

Partial formalization. Lean proves the exact value of every member of the first infinite family, both primitive critical-family reductions, and the real maxima of all twelve listed sporadic examples. It also proves continuity, attainment, and rational approximation for the actual nearest-integer distance function. The coordinate-coalescence construction, rational subspace extension, and the one-, two-, and three-speed lower bounds are also proved. The exhaustive classification outside the critical families and its geometric norm bound remain open. See [the critical-family proof](CRITICAL_FAMILIES_LEAN.md), [coalescence](COALESCENCE_LEAN.md), [subspace extension](SUBSPACE_EXTENSION_LEAN.md), and [the status report](../../docs/lean-status.md).

## Supporting files

- [`CRITICAL_FAMILIES_LEAN.md`](CRITICAL_FAMILIES_LEAN.md)
- [`NORM_REDUCTION_LEAN.md`](NORM_REDUCTION_LEAN.md)
- [`generate_lean_examples.py`](generate_lean_examples.py)
- [`cover.json`](cover.json)
- [`sieve.cpp`](sieve.cpp)

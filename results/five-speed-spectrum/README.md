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

Partial formalization. Lean proves both critical-family reductions, all twelve listed example values, and the realization of every `s/(5s+1)`. It also proves the unconditional four-speed coordinate cutoff 5,832 and the complete finite plane certificate with 122,880 indexed cases.

The geometric plane classification and five-speed cutoff retain `FourSpeedGap` as an explicit input. With that input, every positive primitive tuple below `1/5` either has all coordinates at most 279,841 or contains a dilated critical quadruple. The bounded enumeration and discharge of the gap input remain separate accepted-proof obligations. See [the plane classification](PLANE_REDUCTION_LEAN.md), [the pigeonhole cutoffs](PIGEONHOLE_REDUCTION_LEAN.md), [the critical-family proof](CRITICAL_FAMILIES_LEAN.md), and [the status report](../../docs/lean-status.md).

## Supporting files

- [`CRITICAL_FAMILIES_LEAN.md`](CRITICAL_FAMILIES_LEAN.md)
- [`NORM_REDUCTION_LEAN.md`](NORM_REDUCTION_LEAN.md)
- [Finite critical-plane certificates](PLANE_CERTIFICATES.md)
- [Geometric plane classification](PLANE_REDUCTION_LEAN.md)
- [Pigeonhole cutoffs](PIGEONHOLE_REDUCTION_LEAN.md)
- [`generate_plane_certificates.py`](generate_plane_certificates.py)
- [`generate_lean_examples.py`](generate_lean_examples.py)
- [`cover.json`](cover.json)
- [`sieve.cpp`](sieve.cpp)

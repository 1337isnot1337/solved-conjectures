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

Lean also proves the complete threshold classification at `1/6`: every positive
primitive five-speed tuple at or below that value is a permutation of
`[1,2,3,4,5]` or `[1,3,4,5,9]`, and both have value exactly `1/6`. Gcd normalization
extends this to all positive five-element lists. The proof includes an
independent unconditional five-speed lower bound and preserves the existing
Renault proof. Its full 250-module closure, 7,070 finite frames, and 7,586
required theorem endpoints passed fresh sources, the complete axiom audit,
and exact stock kernel replay. See the [tight-five checkpoint](../../docs/verification/loneliness-five-runner-exact-44549751944/README.md).
The full spectrum classification below `1/5` remains partial.

The four-speed gap input is now proved. Every positive distinct four-speed
tuple below `2/9` is a positive scaling and permutation of `(1,2,3,4)` or
`(1,3,4,7)`, and its value is exactly `1/5`. The four-speed runner bound follows.
The proof's complete 84-module closure has source, axiom, and independent
kernel component coverage.

The geometric plane classification and five-speed cutoff can use that proved
input. Every positive primitive tuple below `1/5` is then bounded by 279,841
or contains a dilated critical quadruple. The bounded five-speed enumeration
remains open. See the [four-speed proof](FOUR_SPEED_GAP_LEAN.md),
[plane classification](PLANE_REDUCTION_LEAN.md),
[pigeonhole cutoffs](PIGEONHOLE_REDUCTION_LEAN.md), and
[status report](../../docs/lean-status.md).

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

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

The realization direction is complete in Lean. For every `P ≥ 7`
congruent to `1` or `5` modulo six, the formal proof constructs six
distinct positive integer speeds with gcd one and exact global loneliness
$`(P-1)/(6P)`$. This includes both infinite branches, the progression
parameter zero, and the separate `P=11` case. Each value is attained,
and the corresponding upper bound holds at every real time.

The exact 11-module closure passed fresh strict compilation, an audit of all
392 owned declarations including 30 private declarations, and independent
stock-kernel replay of all 11 modules. All 15 required endpoints are theorems.
[Exact scope](../../docs/lean-status.md#six-speed-spectrum-complete-realization) ·
[Raw receipt](../../docs/verification/six-spectrum-realization-44527134869/receipt.json).

The general pair-sum maximum theorem and displayed finite examples also have
checked global values. Universal classification of the three families and
exhaustiveness outside them remain incomplete in Lean.

Reproduce the realization gate from the repository root with the pinned Lean
toolchain and Mathlib cache:

```sh
python3 scripts/verify_six_spectrum_realization.py
```

### Actual lattice and conditional norm components

The registered components construct the full integer-point lattice of
every rational coordinate subspace, prove its span and rank, and identify its
squared covolume with the Gram determinant of an actual integer lattice basis.
They prove squared covolume at least one. In rank four in six coordinates,
the lower bound is six when the subspace contains an integer vector whose
coordinates are nonzero and pairwise unequal up to sign.

Suppose an integer matrix has r columns lying in a rational subspace of
dimension r, and its Gram determinant is positive. The proof gives an
exact factorization of the column Gram determinant as a nonzero integer
square times the full lattice's squared covolume. It therefore bounds the
full lattice's squared covolume by the column Gram determinant. The endpoints do not
identify that integer with the cardinality of a finite quotient.

The rectangular components also prove integer-parameter recovery under an
integer left inverse, primitive basis transfer, Cauchy--Binet and integer Gram
identities, and the literal map Gram determinants 3, 9 and 8. The six-by-four
Gram lower bound assumes positive Gram determinant, nonzero rows and rows
that are pairwise unequal up to sign; it derives the bound six internally.

The original norm constants 9075, 54450 and 163350 now use the covolume of the
actual full integer-point lattice. The 9075 theorem assumes rank four,
containment of the speed vector, and distinct positive primitive speeds.
The 54450 and 163350 theorems hold for every rational coordinate subspace,
without a rank or containment premise. All three norm theorems retain
`hfour : CoordinateSubspace.LonelyRunnerBound 4` and `hplane`, the containing-plane gap
hypothesis, as well as positivity, primitivity and loneliness at most `1/6`.
These are component theorems. The unconditional plane-gap deduction and the
remaining exhaustive classification are not supplied here; the six-speed
spectrum result remains partially formalized.

[Exact scope and evidence](../../docs/lean-status.md#rational-integer-point-lattices-and-six-speed-norm-components).

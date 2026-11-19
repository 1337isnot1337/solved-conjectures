# Checked Lean scope

`NonmixedGap.nonmixed_gap_density_general` proves the literal three-branch
formula in [the proof](PROOF.md) for all positive integer `a`, `b`, `k`, and `m`,
using the gap lengths divided by their greatest common divisor.
`nonmixed_gap_density` and `nonmixed_gap_density_nat` state the coprime cases.
The quotient and remainder of `a-b` are computed by integer Euclidean division,
so both orders of the gap lengths are covered.

The two conclusions are equality of the supremum of actual packing upper
densities with the displayed formula, and equality of the actual real circle
maximum with the same formula. `nonmixed_gap_general_periodic_optimum` supplies periodic
centers attaining the formula whose translates of the explicit tile are
pairwise disjoint.

The entry module is
[`NonmixedGapGeneral.lean`](../../lean/Conjectures/NonmixedGapGeneral.lean).
Its imports prove the normalized-lift counting lemma, the adaptive interval
bound, actual density limits, periodic modular-window packings, rational-time
character bounds, and the real-time circle endpoint. `packs_iff_avoids` connects
the forbidden-difference definition to disjoint translates of the literal tile.

The circle proof uses the checked `Loneliness` distance and continuity modules.
It does not replace the maximum over real time with an unproved finite search.
No counting lemma, recognizer, asymptotic statement, or published theorem is
left as a hypothesis. Common-divisor normalization is proved by exact residue-class counts and
periodic block expansion. The paper's example with gap lengths five and three
and counts two and two has both values `3/19`; centers with residues `0,1,2`
modulo `19` are checked as a literal optimal tile packing.

## Validation

All twelve source modules compiled with the pinned toolchain. An axiom audit
checked 325 declarations in the `NonmixedGap` namespace. Independent
`leanchecker` replay passed all twelve modules. Allowed transitive axioms are only
`propext`, `Classical.choice`, and `Quot.sound`.
Run `scripts/verify_lean.sh` from the repository root for the accepted-package
source build, axiom audit, and kernel replays. Local module checks and hosted
CI are recorded separately.

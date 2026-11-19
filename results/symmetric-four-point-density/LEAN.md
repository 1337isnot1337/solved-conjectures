# Checked Lean scope

`SymmetricFourPoint.translated_symmetric_four_point_densities` proves the exact
packing and covering densities of `{q,q+a,q+b,q+a+b}` for every integer `q` and
every pair of natural numbers with `0 < a < b`. There is no coprimality premise.
The formulas use the steps divided by their greatest common divisor. Both odd and opposite-parity cases are included.
The definitions use the supremum of actual upper center densities for packings
and the infimum of actual lower center densities for coverings. They apply to
arbitrary center sets, including nonperiodic sets.

The entry module is
[`SymmetricFourPointTranslated.lean`](../../lean/Conjectures/SymmetricFourPointTranslated.lean).
Its imports contain the local obstruction, finite-window counting, periodic
rectangle constructions, real density limits, literal tile semantics, and local
sharpness proofs. Shared interval and residue-count arguments are in
[`NonmixedGapDensity.lean`](../../lean/Conjectures/NonmixedGapDensity.lean) and
[`NonmixedGapResidues.lean`](../../lean/Conjectures/NonmixedGapResidues.lean).

## Main declarations

- `densities_odd` and `densities_opposite_parity`: the exact two parity cases.
- `odd_packing_witness`, `odd_covering_witness`, and `even_odd_tiling`: explicit periodic attainment.
- `packing_uncovered` and `no_exact_cover_interval`: universal local obstructions.
- `sharp_packing_interval` and `sharp_covering_interval`: intervals of lengths `P-1` and `Q-1` can be covered exactly once, so the obstruction lengths are optimal.
- `packing_iff_disjoint_translates` and `covering_iff_translates_cover`: equivalence with the literal four-point tile definitions.

All these names are in the `SymmetricFourPoint` namespace. No finite numerical
screen or unformalized published theorem is a premise. Common-divisor reduction uses exact residue-class counts and periodic block
expansion. Translating the tile preserves the same set of centers and hence
preserves both density problems. The local obstruction lengths refer to the
coprime normalized statement, as in the proof note.

## Validation

All ten source modules compiled with the pinned toolchain. Independent
`leanchecker` replay passed each module. A namespace audit rejected every
transitive axiom except `propext`, `Classical.choice`, and `Quot.sound`.
The combined extension audit also passed. Run `scripts/verify_lean.sh` from the
repository root to rebuild and replay the accepted package. Local module checks
and hosted CI are separate receipts.

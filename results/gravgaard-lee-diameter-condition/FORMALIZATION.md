# Lean formalization

[The Lean theorem](../../lean/Conjectures/GravgaardLeeDiameter.lean)
`GravgaardLeeDiameter.diameter_condition` proves the exact positive sum hull
for any finite indexed family of digit bounds at least two whose total
diameter is at least one. Repeated bounds and equality at the threshold are
included. The summands are the actual infinite Lüroth series defined in
`GravgaardLeeLargeLuroth.largeDigitSet`. The companion theorem
`all_residues_iff` proves the exact threshold for coverage modulo one.
`diameter_boundary_example` checks the written example with 53 copies of
the bound 62 and 20 copies of the bound 138.

This formalizes the repository’s answer to the question following
[Theorem 2.3 of Gravgaard and Lee](https://arxiv.org/html/2506.12513v2#S2.SS1).
The source resolution is credited to Cinna Davis in commit `7388bb60`.
Lean formalization contributed by [AlexisFimeyer](https://github.com/AlexisFimeyer) in [PR #596](https://github.com/1337isnot1337/solved-conjectures/pull/596).
The original proof and its attribution and priority discussion are recorded
in the [written proof](PROOF.md) and [audit](AUDIT.md).

## Proof

The Lean proof reuses the checked Lüroth series, affine prefix formulas,
and endpoint estimates. It covers the compact sum by direct simultaneous
cylinder refinement. At a coordinate with original diameter $a$, current
cylinder scale $q$, and least available digit $d$, set $b=q/[d(d-1)]$.
The split separates digit $d$ from all larger digits. Each child has width
at least $ab$, the intervening gap has width at most $(1-a)b$, and the
quantity $b$ can only decrease under refinement.

At each step split a coordinate of maximal $b$. The widths of the other
coordinates sum to at least $(1-a)b$, so the two child sum intervals cover
the parent sum interval. The inequalities needed to repeat the split are
preserved. If the maximal $b$ were bounded below by a positive constant
among admissible states, each refinement would reduce the total width by
a uniform positive amount. This contradicts the infimum of those widths.
Thus arbitrarily fine states approximate the target by sums of closed-set
points. Compactness yields an exact representation.

To obtain genuine infinite expansions, approach the target from below
in the compact sum. A compact limit representation must contain a genuine
summand because every excluded finite endpoint is isolated from the left.
Each finite endpoint is then repaired using a longer prefix of this
genuine summand and an alternating floor rule at the two cylinder scales.
The rule preserves the sum, makes both tails positive and infinite, and
respects both digit bounds. A finite induction repairs all coordinates.

## Verification

The [local receipt](verification/receipt.json) records the eight-module
strict build, the complete owned-declaration transitive axiom audit, and
stock-kernel replay with Lean 4.35.0. Reproduce the scoped check from the
repository root with the pinned dependencies installed.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.GravgaardLeeDiameter \
  --require GravgaardLeeDiameter.diameter_condition \
  --require GravgaardLeeDiameter.all_residues_iff \
  --out /tmp/gravgaard-lee-diameter-verification
```

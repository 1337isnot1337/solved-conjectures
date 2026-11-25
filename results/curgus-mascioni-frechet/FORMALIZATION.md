# Lean verification

**Complete for the nonuniqueness counterexample, partial for the full entry.** This formalizes the section “Nonuniqueness without translation artifacts” of the [written proof](PROOF.md). It does not formalize general attainment, the limiting lower-degree optimum, or the separate cubic optimum and uniqueness calculation.

The problem was posed by Branko Ćurgus and Vania Mascioni in [Example 12.3, p. 21 of their preprint](https://faculty.curgus.wwu.edu/Papers/RootsOperFinal.pdf#page=21). Their Example 12.2 gives the related quadratic root formula. The repo credits Cinna Davis for the written resolution and does not claim exclusive priority.

For the actual polynomial operator `I + D²/2`, `arbitrary_quadratic_root_bound` gives root multisets with multiplicity for each quadratic and its image, and an actual permutation of the two root labels with cost at most 1. `operator_linear_unchanged` covers degree one. For every real `s ∈ [0,1]`, `interval_root_extremizers` gives the precise multisets for `X² − s` and its image, proves all permutation costs are at least 1, and supplies a cost-1 permutation. `degree_centered` checks that these are genuine quadratics. `no_isometric_relabelling` rules out a Euclidean isometry after either permutation when the parameters differ. Nonzero scalar multiples do not affect the roots.

## Reproduction

Use the repository's pinned Lean 4.35.0 and Mathlib and a prepared Lake build directory.

```sh
cd lean
lake env lean -j1 -DwarningAsError=true -o .lake/build/lib/lean/Conjectures/CurgusMascioniQuadratic.olean Conjectures/CurgusMascioniQuadratic.lean
lake env lean -j1 -DwarningAsError=true ../results/curgus-mascioni-frechet/verification/TargetAudit.lean
lake env leanchecker Conjectures.CurgusMascioniQuadratic
```

Pinned strict build, all 50 owned declarations (42 theorems), eight named endpoints, and stock kernel replay passed. [Exact scoped receipt](verification/lean-receipt.json). Aggregate CI is separate.

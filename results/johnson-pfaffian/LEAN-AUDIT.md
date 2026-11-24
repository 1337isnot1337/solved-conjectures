# Johnson's conjecture

## Complete statement

`JohnsonPfaffian.johnson_conjecture_fin` proves Conjecture 7.1 of William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, [arXiv:2610.24371v1](https://arxiv.org/pdf/2610.24371v1), printed page 14, in its full stated scope.

For every natural `u`, every strictly increasing tuple `x : Fin (2*u) → ℝ`, every function `f : ℝ → ℝ` that is positive, nonincreasing and log-convex on `(0,∞)`, and every perfect matching of the `2*u` vertices, the Pfaffian of the skew distance-kernel matrix is at least the matching's product. The theorem also includes the empty order by the usual empty-product convention.

The hypotheses are exactly `∀ x > 0, 0 < f x`, `AntitoneOn f (Set.Ioi 0)`, and `ConvexOn ℝ (Set.Ioi 0) (fun x => Real.log (f x))`. No differentiability, global continuity, or values outside the positive half-line are assumed. The finite tuple is extended internally only to reuse an intermediate kernel factorization; the final hypotheses impose no condition on an infinite extension.

A matching is an arbitrary list of ordered pairs whose flattened endpoints form a permutation of `List.range (2*u)`. The endpoint is not restricted to the canonical ordering used internally to enumerate all matchings. Pair orientation merely selects the positive upper-triangular entry. The Pfaffian is the literal signed matching expansion, with sign `(-1)` raised to the number of chord crossings, matching the convention used in Johnson's source and upstream Lean development. The skew matrix's lower entries are determined by antisymmetry and do not enter that expansion.

The stronger theorem `JohnsonPfaffian.CircularData.matching_bound` proves the same matching inequality for every finite product of circular interval factors with parameters at least one and arbitrary positive diagonal factors. Its uncrossing inequality is proved; it is not an extra hypothesis of that endpoint.

## Recorded argument and attribution

This formalizes the existing [complete argument](PROOF.md), first published in this repository at commit [`c631b2e9530ee7313249282dd6815919ef53f709`](https://github.com/1337isnot1337/solved-conjectures/commit/c631b2e9530ee7313249282dd6815919ef53f709). The repository's proof credit remains **Cinna Davis and GPT-6.2 Astra**, in its stated order. The original conjecture and the imported mathematical endpoint inequality are due to **William Johnson**.

Johnson's Proposition 4.2 on printed pages 8–9 is not assumed as an axiom: the existing project development proves its additive-interval endpoint inequality in every even order, and the complete closure is rebuilt and replayed with this result. Johnson's kernel uncrossing argument immediately after Conjecture 7.1 is also credited. The source's rainbow bound and its Albouy–Moeckel nonvanishing result are prior results, not additional conjectures solved by this entry.

The source's [upstream Lean repository](https://github.com/wlpjohnson-math/convex-pfaffian-positivity-lean) and the pinned mathlib were checked for reuse and duplicate scope. The upstream source documents interval decomposition, coefficient positivity, endpoint and rainbow bounds; the exact arbitrary-order, every-matching Conjecture 7.1 is the missing result completed here. Existing checked project components are reused.

The [bounded priority audit](PRIOR_AUDIT.md), [additional search record](PRIOR_SCAN.json), and three existing mathematical reviews remain unchanged. A kernel-checked proof does not establish worldwide priority or external peer review. This is one existing conjecture entry, including its stronger circular-product theorem; it is not counted once per order or per auxiliary theorem.

## Proof correspondence

| Source argument | Lean implementation |
| --- | --- |
| Actual matching-sum Pfaffian, coefficient positivity, and Johnson's all-order endpoint inequality | Existing `JohnsonPfaffianMatching`, `Coefficients`, `Positive`, `Prefix`, `Expansion`, `Endpoint`, and `Outer` modules, with the complete transitive closure checked again. |
| Circular supports remain circular under cyclic rotation and increasing restriction | [JohnsonPfaffianCircular.lean](../../lean/Conjectures/JohnsonPfaffianCircular.lean). A circular support is a linear interval or the complement of one. Empty and full supports are included. |
| Complement gauge and finite product expansion into nonnegative interval coefficients | [JohnsonPfaffianCircularAdditive.lean](../../lean/Conjectures/JohnsonPfaffianCircularAdditive.lean). Positive square-root factors restore the exact diagonal scaling, and intersections of supports include the empty-selection/full-support case. |
| An adjacent matched edge exists in every nonempty noncrossing perfect matching; deletion proves all orders | [JohnsonPfaffianNoncrossing.lean](../../lean/Conjectures/JohnsonPfaffianNoncrossing.lean). The proof uses a minimum-span edge, rotates it to the endpoint, restricts the circular data, and inducts on the order. |
| Every crossing can be removed while increasing the matching product and strictly decreasing total span | [JohnsonPfaffianAllMatching.lean](../../lean/Conjectures/JohnsonPfaffianAllMatching.lean). The replacement preserves the complete endpoint partition and is canonicalized through the exhaustive matching enumeration. Natural-number strong induction proves termination. |
| Factorwise uncrossing for all circular interval products | [JohnsonPfaffianCircularUncrossing.lean](../../lean/Conjectures/JohnsonPfaffianCircularUncrossing.lean). The two alternating four-vertex membership patterns are excluded by circularity; multiplication preserves the resulting inequalities. |
| Mixed differences of `log f` produce the exact distance kernel | [JohnsonPfaffianKernel.lean](../../lean/Conjectures/JohnsonPfaffianKernel.lean). The existing all-order coefficient nonnegativity and telescoping results are connected to the finite circular-factor representation, with exact equality of every upper entry. |
| Original finite-tuple and arbitrary-matching statement | [JohnsonPfaffian.lean](../../lean/Conjectures/JohnsonPfaffian.lean), especially `johnson_conjecture_fin`. |

Seven existing source files received only explicit dependency imports and strict-linter compatibility fixes. The mathematical hypotheses of those reused results were preserved. The new all-order proof uses seven new modules. The full checked closure contains thirty modules, including the existing Gilmore matching infrastructure.

## Statement audit

An independent proof review checked the complete kernel-to-matching chain before final verification: finite quantifiers, exhaustive matching semantics, crossing signs, the complement scaling, restriction and cyclic relabeling, empty intersections, diagonal restoration, adjacent-edge induction, span-decreasing uncrossing, and exact source-kernel representation. The integrator compared the final statement with the original Conjecture 7.1 and checked that the intermediate uncrossing condition is discharged. The stronger circular-product endpoint then received its direct factorwise proof.

The full conjecture has no remaining project-specific hypothesis. The entry does not assert the exploratory stronger multivariate coefficientwise domination discussed in the written proof's boundary section.

## Verification

The [complete target receipt](../../docs/verification/johnson-20261124/receipt.json) finished on 24 November 2026 at 17:06:28 UTC. It records fresh compilation of the exact thirty-module project import closure with warnings as errors, an audit of all 1,195 owned declarations (1,006 theorems, including 28 private declarations), and unchanged stock Lean kernel replay of the whole closure. All eight required endpoints are present. These counts describe the entire closure, including reused lemmas, not newly proved conjectures.

Lean is pinned to `4.35.0`; mathlib is pinned to `56a005855ea17e0b0958f73ec801ae140b0a1679`. The only permitted transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`. No `sorry`, `admit`, unproved project-specific axiom, or native decision oracle is used. The receipt verifies that project source, toolchain, manifest, build configuration and verification-script hashes did not change during the check.

The dedicated `lean-johnson.yml` workflow reproduces the check with `scripts/verify_lean_target.py`. This complete target receipt does not claim that the repository-wide gate for unrelated entries has passed; local publication checks and hosted aggregate results are recorded separately. The existing Python checker is supplementary only and is not a premise of the Lean proof.

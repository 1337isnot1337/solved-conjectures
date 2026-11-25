# Feldheim–Feldheim’s weighted tail conjecture

Status: passed for the complete original Conjecture 1. All twenty source modules passed the integrated strict build, complete declaration audit and exact stock-kernel replay at 2026-11-24 19:12:27 UTC.

The terminal declaration is `Conjectures.FeldheimWeightedTail.feldheim_feldheim_conjecture` in `Conjectures/FeldheimWeightedTail.lean`. It matches Conjecture 1 in §1.1, page 2, of Naomi Dvora Feldheim and Ohad Noy Feldheim, *Mean and Minimum of Independent Random Variables*. The author-hosted manuscript at https://u.cs.biu.ac.il/~feldhen/Papers/MinMean.pdf was read directly. The recorded argument is the existing entry `results/feldheim-weighted-tail/PROOF.md` at commit `2f800fa5191a1d747f126fa20f7e9c2b3730b085`, recorded by Cinna Davis.

| Original condition or quantity | Literal Lean representation |
| --- | --- |
| Arbitrary underlying probability space | Arbitrary type Ω with a measurable space, a measure P, and `IsProbabilityMeasure P` |
| Random variables X and Y | Arbitrary measurable functions `X Y : Ω → ℝ` |
| Independence | `IndepFun X Y P` |
| Nonnegative laws | `∀ᵐ ω ∂P, 0 ≤ X ω` and the corresponding condition for Y |
| Neither law compactly supported | For each variable, no compact set K contains its values almost surely |
| Every fixed positive weight below one | A real parameter t with `0 < t` and `t < 1`; t is fixed across the threshold limit |
| Weighted-sum upper-tail numerator | `P.real` of the weighted-sum event `m < t*X ω+(1-t)*Y ω` |
| Product of the individual upper tails | Product of the actual strict upper-tail measures for X and Y |
| Threshold tends to infinity | `atTop` on the full real line, without a restriction to integer thresholds |
| Infinite limsup | `Filter.limsup (fun m => ENNReal.ofReal (actual ratio)) atTop = ⊤` |

For nonnegative variables, `not_compactly_supported_iff_not_bounded` proves that the literal noncompact-support condition is equivalent to the absence of an almost-sure finite upper bound. `real_tail_positive_iff_not_bounded` then proves positivity of every actual upper tail. Probability finiteness ensures that the real-valued measures are finite, and the denominator is positive at every finite threshold. The ENNReal wrapper expresses infinity without adding an infinite value to the real number type.

The law theorem is stronger: it permits arbitrary probability laws unbounded above. The original nonnegative statement is supplied explicitly as a corollary, using the proved support equivalence. This strengthening does not remove any case of the original conjecture.

The conclusion is an infinite limsup, not a claim that the ratio converges to infinity. Its real-valued intermediate form says that every prescribed height is exceeded beyond every prescribed threshold. This is the exact strength needed for the original limsup.

## Proof-scope audit

The terminal declaration has no premise asserting a convex approximation, Wright stability, an inverse-level sequence, an affine window, a Stieltjes formula, a conditional density, or the probability conclusion. The law, analytic, window, product-measure, and atom-safe integral bridges are proved in the imported source closure. The reduction lemma's explicit integral premise is discharged by `log_tail_increment_le_inverse_tail_integral` in the terminal declaration.

No equality of the two laws, no equal-weight restriction, no density, no absence of atoms, no moment condition, and no smoothness condition is imposed. The product-measure conditioning identity is proved for actual measures and transferred from arbitrary independent random variables by their joint law.

The recorded proof's continuous interpolation is replaced by actual forward moving averages, whose continuity, preservation of the same Wright error, and pointwise convergence are proved. Its convex-envelope reduction is replaced by an actual supporting-slope construction and supremum of affine minorants. These adaptations retain the whole original probability statement. The atom-safe integral uses the inequality in the repository's §4 equation (9); it does not rely on the equality formulation printed in the older author PDF.

The author-hosted PDF uses Lemma 2.6 for the inverse-increment method, while the recorded arXiv-v3 citation says Lemma 2.7. Since the v3 PDF/HTML retrieval was blocked, the numbering remains version-qualified. The conjecture statement itself was directly checked in the accessible primary manuscript. The source's uncertainty about worldwide priority is preserved.

The higher-dimensional norm consequence and supplementary finite-threshold claims are separate in the existing entry and remain unformalized by this package. The completed-result count is one original conjecture, never one count per helper or strengthening.

# Independent root review

Reviewed 21 November 2026. The complete analytic disproof passes this final mathematical and source-scope review. This note distinguishes the new strictness deduction from the published Gaussian-process ingredients and records the resolved source-reading question.

## Exact target

I read [Conjecture 3.6 in the original paper](https://arxiv.org/html/2507.11626v1#S3.SS4). It explicitly permits equality in the ultra-log-concavity inequalities and requires a positive infinite sequence beginning with one. The family's terms c to the power k divided by k factorial, for every c>0, meet all those hypotheses. The paper uses Gaussian-bounded sets to mean nonempty compact convex subsets of a separable real Hilbert space with finite first intrinsic volume. Its conclusion is realization by an actual set, rather than a point in a completion of a space of convex bodies.

## Independent mathematical check

Let R be the global range of a separable isonormal process on K. Symmetry under negation and Sudakov's identity give

```math
\mathbb E R=\frac{2V_1(K)}{\sqrt{2\pi}}.
```

The expectation is finite. For each deterministic point t, the limiting local range is twice its deterministic local oscillation, and cannot exceed R. Taking a countable sequence of deterministic points approaching the supremum of those oscillations gives

```math
R\geq2\mathop{\mathrm{osc}}(K)\quad\text{almost surely}.
```

This avoids an uncountable intersection of probability-one events. Countable separable indexing sets for the required local ranges can be combined with the global one. The resulting bound also makes the maximal oscillation finite; if it were infinite, a sequence of increasing finite oscillations would force R to be infinite almost surely.

For two distinct points u,v of K, the same global range dominates the absolute Gaussian increment. Its variance is the positive number given by the squared distance between u and v. Hence it has positive probability of exceeding the fixed finite value twice the maximal oscillation. It follows that the expected range is strictly larger than that value. This is the additional strictness argument; Gaussian continuity is not assumed.

Vitale's Theorem 3 identifies maximal oscillation with the limit of the normalized intrinsic-volume ratios. Combining it with the strict expectation inequality gives

```math
\lim_{j\to\infty}\frac{jV_j(K)}{V_{j-1}(K)}\lt V_1(K)
```

for every nontrivial Gaussian-bounded compact, using Vitale's zero convention when the dimension is finite. In the proposed positive sequence all ratios are defined and equal c, while V1=c. The contradiction is exact for every c>0. This disproves the entire sufficiency assertion, with no finite-dimensional approximation standing in for the proposed infinite sequence.

## Published normalization and the OCR correction

The full primary article is appended to the [author's lecture packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf): Richard A. Vitale, *Intrinsic volumes and Gaussian processes*, Advances in Applied Probability 33 (2001), 354–364, [DOI 10.1017/S0001867800010831](https://doi.org/10.1017/S0001867800010831).

I independently viewed actual locally rendered images of printed pages 356 and 357. Page 356 gives Sudakov's factor square-root of 2 pi and defines local oscillation as half the limiting range. Page 357 defines the normalized ratio as j times Vj divided by square-root of 2 pi times V(j-1), and Theorem 3 identifies its limit. These are the constants used above. The earlier slides in the packet are not substituted for these published formulas.

Theorem 1 on printed page 356 visibly states the non-strict bound

```math
V_j(K)\leq\frac{V_1(K)^j}{j!},\qquad j=2,3,\ldots.
```

The lower bar is unambiguous in the actual image. OCR had lost it. A literal strict inequality there would already have excluded this family, so integration was held until the source image was obtained. That specific prior-theorem concern is now resolved. The source and image hashes and the earlier failed image-access claims are preserved in [SOURCE_GLYPH_GATE.md](SOURCE_GLYPH_GATE.md). The paper itself is not republished in this repository. Proposition 1's word "decreasing" is also not an all-index strictness statement: the same source allows finite-dimensional sets with an eventually zero ratio sequence.

## Material prior work and the novelty boundary

[Long's 2024 primary preprint](https://arxiv.org/html/2305.13428v3) contains enough ingredients for a different short proof of the obstruction. I checked its second-volume formula, the centered support-function/Wiener-chaos facts, the completion-point discussion and the relevant distance formulas. Centering removes the first chaos; the strengthened variance estimate and positive variance of a nontrivial support random variable yield a strict first/second-volume inequality. The variance is positive because that support variable dominates a nondegenerate Gaussian variable and therefore cannot be constant.

The inspected source states the non-strict first/second-volume bound, not this strict consequence. It excludes a distinguished completion point from the Gaussian-bounded image, but does not display the distance-to-that-point formula which would make the same strict obstruction explicit. Both are short further deductions from Long's results. The package openly records them in [NOVELTY.md](NOVELTY.md). No claim is made that Vitale's limit theorem, Long's support-function formulas or their Gaussian estimates are new.

The resulting contribution is a new application and strictness deduction refuting the later sequence-realizability conjecture. No earlier explicit resolution or equivalent strict obstruction was found in the documented current-paper, source-index, repository and public-archive checks. Long's journal full text was inaccessible; the primary v3 preprint was read. That access limit and the ordinary limits of search indexing remain explicit. Discovery of an earlier equivalent result would require reclassification.

## Outcome

The written proof has three separate mathematical reviews and a documented current source audit. It is analytic throughout, needs no numerical certificate, and has no Lean formalization. The former source-symbol hold is resolved by actual image inspection, rather than by an inference from OCR or a screenshot placeholder.

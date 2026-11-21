# Independent analysis review

Review date: 2026-11-21. Scope: the full proposed disproof in `PROOF.md`, independently checked against the original conjecture and the established Gaussian-process input. Mathematical review passes. This review does not decide the separate prior-resolution audit.

## Original statement and hypotheses

I independently read Dospolova, Germanskov, and Zaporozhets, [*On Steiner entire function*, arXiv:2507.11626v1](https://arxiv.org/pdf/2507.11626), Section 3.4, Conjecture 3.6, printed pages 9–10. The asserted condition is weak ultra-log-concavity of a strictly positive infinite sequence with initial term one. Equality in all the inequalities is allowed. The paper's GB sets are convex compact subsets of a separable real Hilbert space with finite first intrinsic volume, and the intrinsic volumes are defined by finite-dimensional inner approximation. The proof preserves those conventions.

Consequently the sequence $`a_k=c^k/k!`$ with arbitrary $`c>0`$ meets the exact sequence hypotheses, including strict positivity. The source conjecture has no additional strict log-concavity, vanishing quasi-width, or Gaussian-continuity assumption that would exclude this family.

## Primary theorem and normalization

I independently read printed pages 355–357 of Richard A. Vitale, *Intrinsic volumes and Gaussian processes*, Advances in Applied Probability 33 (2001), 354–364, [DOI 10.1017/S0001867800010831](https://doi.org/10.1017/S0001867800010831). The complete article is appended to the [author's lecture packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf), on zero-based PDF pages 31–41. In particular, the needed pages are zero-based PDF pages 33–34. Some preceding slides omit normalization factors; the published article is the source used for this review.

Printed page 355 specifies the countable dense-set convention for Gaussian suprema. Printed page 356 states the intrinsic-width identity and defines local oscillation as half the limiting local range. Printed page 357 defines the quasi-width with its factor $`\sqrt{2\pi}`$ and states Theorem 3. In the notation of the proposed proof, these give precisely

```math
\frac{\mathbb E R}{2}
=\frac{V_1(K)}{\sqrt{2\pi}},
\qquad
\lim_{j\to\infty}
\frac{jV_j(K)}{\sqrt{2\pi}\,V_{j-1}(K)}
=\mathop{\mathrm{osc}}(K).
```

The first identity also uses the sign symmetry of the centered Gaussian family. Translation to include the origin preserves every relevant range and increment and makes the individual supremum and negative infimum nonnegative. Finite first intrinsic volume supplies their finite expectations.

## Strictness argument

The proof handles the possible positive oscillation of a discontinuous GB process. It does not make the false assumption that GB implies Gaussian continuity.

For each deterministic point, its limiting local range is at most the global range almost surely. A countable sequence of deterministic points can approach the supremum of the local oscillation constants. Combining their countable dense indexing sets with the global one permits all the inequalities to hold on a single probability-one event. Thus the argument avoids an uncountable intersection and establishes

```math
R\geq2\mathop{\mathrm{osc}}(K)
\quad\text{almost surely}.
```

The same argument also proves that the deterministic supremum of the oscillation constants is finite: otherwise a countable sequence with unbounded constants would contradict almost-sure finiteness of the GB range.

Two distinct points give a Gaussian increment of variance equal to their squared distance. Its absolute value is bounded above by the global range and has unbounded support. Therefore the global range exceeds the finite lower bound on an event of positive probability. Since the range is integrable, its expectation is strictly larger than that bound. All constants cancel correctly to give

```math
\lim_{j\to\infty}\frac{jV_j(K)}{V_{j-1}(K)}
\lt V_1(K)
```

for every nontrivial GB compact. The finite-dimensional convention for eventual zero volumes is harmless and is unnecessary for the strictly positive counterexample sequence.

## Final contradiction and scope

For the proposed family, direct factorial cancellation proves every source inequality with equality, and every ratio $`j a_j/a_{j-1}`$ equals $`c=a_1`$. This contradicts the strict necessary condition. Positive first intrinsic volume rules out a singleton, so the strictness lemma applies to any hypothetical realization.

This is a full refutation of the conjectured sufficiency direction for all positive scales $`c`$. It is not a numerical obstruction, a finite-dimensional special case, or a claim that an unspecified limiting object has the required compactness. No computational test is needed for the argument.

Two presentation corrections were reported to the author: a missing backslash before `quad` in the first family display and the repository's requested formatting for named mathematical operators. Neither affects the proof.

## Primary-source inequality glyph checked locally

A final priority check concerned Vitale's Theorem 1 on printed page 356. Web extraction rendered its bound with a strict sign, while web screenshot calls returned only text placeholders rather than usable images. Those calls were not visual evidence.

The complete [primary PDF packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf) was subsequently downloaded successfully with the local runtime, rendered by Poppler, and inspected as an actual PNG with `view_image`. PDF page 34, printed page 356, unambiguously displays the **nonstrict** bound

```math
V_j(K)\leq \frac{V_1(K)^j}{j!},\qquad j=2,3,\ldots.
```

The input PDF has SHA-256 `5213006d5754b7c1c4ee71f5de137b97d5316784b215bff9995da1e186f516cc`. The local source and rendered page are `agent-analysis/vitale-priority-source.pdf` and `agent-analysis/vitale-theorem1.png`. The source itself is retained as an inspection input, not claimed as a new deliverable. The printed theorem therefore does not already supply the strict obstruction proved here.

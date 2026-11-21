# Dospolova–Germanskov–Zaporozhets's conjecture

This package gives a proposed complete disproof of Conjecture 3.6 in Maria Dospolova, Mikhail Germanskov, and Dmitry Zaporozhets, [*On Steiner entire function*, arXiv:2507.11626v1](https://arxiv.org/html/2507.11626v1#S3.SS4).

The conjecture says that positivity, the normalization $`a_0=1`$, and

```math
a_k^2\geq\frac{k+1}{k}a_{k-1}a_{k+1}\qquad(k\geq1)
```

characterize the intrinsic-volume sequences of infinite-dimensional Gaussian-bounded compact convex sets in a separable real Hilbert space.

For every real $`c>0`$, the sequence $`a_k=c^k/k!`$ satisfies all those inequalities with equality. Nevertheless it cannot be the intrinsic-volume sequence of any such set. The proof uses Vitale's normalized intrinsic-volume ratios and a strict comparison between the expected global Gaussian range and deterministic local oscillation. It permits bounded but discontinuous Gaussian processes.

The full universal conjecture is refuted by an entire family of positive infinite sequences. This is one resolution, not one result for each choice of $`c`$.

## Contents and status

- [PROOF.md](PROOF.md): the complete argument, including the countable separability step and all normalization constants.
- [NOVELTY.md](NOVELTY.md): the source and priority audit, including the recent papers and the important alternative deduction from Long's earlier theorems.
- [ANALYSIS_REVIEW.md](ANALYSIS_REVIEW.md): an independent mathematical and primary-source review.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): a second independent mathematical and primary-source review.
- [ROOT_REVIEW.md](ROOT_REVIEW.md): final independent proof review, actual source-image inspection, and comparison with earlier results.
- [SOURCE_GLYPH_GATE.md](SOURCE_GLYPH_GATE.md): the resolved OCR ambiguity in an earlier theorem and its correction history.

Three independent mathematical reviews passed. No computation or Lean verification is part of the proof. Actual source-image inspection confirms that Vitale's Theorem 1 states a nonstrict inequality; its lower bar was lost in OCR. The bounded novelty audit and the distinction between the new strictness deduction and Long's earlier ingredients are documented in NOVELTY.md. No earlier explicit resolution or equivalent strict obstruction was found within the recorded search limits. The result remains unrefereed.

Coordination: [issue #199](https://github.com/1337isnot1337/solved-conjectures/issues/199).

A [partial Lean formalization](../../lean/Conjectures/DospolovaGermanskovZaporozhets.lean) checks the factorial equalities and abstract strict Gaussian-tail step. The intrinsic-volume and Gaussian-process bridge remains open in Lean. Strict compilation and isolated kernel replay passed; the full repository gate is pending.

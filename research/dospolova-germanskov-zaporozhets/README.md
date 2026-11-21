# Dospolova–Germanskov–Zaporozhets's conjecture

**Priority hold, 2026-11-21:** this package is not eligible for the new-resolution count until the inequality in Vitale's 2001 Theorem 1 is verified from an actual rendering. The available scan's text extraction gives a strict inequality that would already exclude our family. No reviewer has received usable image bytes. See [SOURCE_GLYPH_GATE.md](SOURCE_GLYPH_GATE.md).

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

Both independent mathematical reviews passed. No computation or Lean verification is part of the proof. The priority audit has an unresolved potentially decisive source ambiguity, described above. Final repository integration is on hold.

Coordination: [issue #199](https://github.com/1337isnot1337/solved-conjectures/issues/199).

# Scope and independent audit

The target is [Balitskiy–Mitrofanov–Polyanskii, arXiv:2603.12495v2, Conjecture 6.1 and Fig. 11](https://arxiv.org/pdf/2603.12495v2#page=25), stated as the Meylender–Thalmaier conjecture. Both components are decided: the strict systolic bound is true for every genuine truncated square, but the depicted trapezoid is not an optimizer. We do not identify the actual optimizers or address arbitrary pentagons or the half-symmetric Viterbo question. The two components are counted as one conjecture.

The optimizer audit checked the support-function normal shapes, cover equivalence, exact parameter conversion and area normalization. The main counterexample uses a parallelogram on an open parameter range; a separate rational pentagon was independently replayed.

The strict-bound audit checked lattice coverage from the primary simplex-translation lemma, both exact Steiner symmetrizations, rectangular grid fibers and edge integration, the two overlap bounds, and all possible equality shapes. In the triangle case, the independent replay verified the support normals, both row/sign alternatives and the strict determinant separation. No numerical optimization is used in the universal proof.

A bounded exact source and follow-up search found no prior resolution of either claim. No Lean verification, external review or absolute priority claim is made.

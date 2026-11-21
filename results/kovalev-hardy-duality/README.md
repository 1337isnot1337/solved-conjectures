# Kovalev's conjecture

This package gives a proposed complete disproof of Conjecture 6.1 in Leonid V. Kovalev's *Hardy-type norms of matrices*, [arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373), printed page 9. It constructs positive diagonal counterexamples to the conjecture's lower inequality in every matrix order at least 500001. The argument is uniform in the order; no list of finite-dimensional checks is used.

The conjecture proposes two inequalities between a spherical fourth-moment norm and the dual of the spherical first-moment norm. A supporting functional, with the source's normalized trace pairing, gives matrices whose dual norm is exactly one. For an input with one large singular value and many equal small singular values, conditional Jensen and the variance of a chi-square average reduce the disputed bound to two fixed one-dimensional Gaussian integrals. Classical modified-Bessel formulas and elementary rational estimates then give a strictly positive separation from the conjectured constant.

The lower inequality is false, which refutes the full conjunction. This package does not settle the remaining upper inequality or determine the smallest possible counterexample dimension. The threshold 500001 is chosen to keep the uniform proof simple.

## Evidence

- [Complete analytic proof](PROOF.md), including the explicit matrix family and all constant estimates.
- [Primary sources and reading record](SOURCES.md).
- [Independent source and prior-resolution audit](PRIOR_AUDIT.md).
- [Independent mathematical review](ALGEBRA_REVIEW.md).
- [Root mathematical and arithmetic review](ROOT_REVIEW.md).
- [Supplementary exact arithmetic](verify.py) and [recorded output](check-output.json).
- [Independently written constant checker](review_constants.py).
- [GitHub discussion](https://github.com/1337isnot1337/solved-conjectures/issues/209).

## Reproduction

```bash
python3 verify.py
python3 review_constants.py
```

Both checkers use only Python's standard library and exact rational arithmetic. They verify the finite comparisons in the written analytic proof. The proof's positive separation above the rational upper bound for the conjectured threshold is

```math
\frac{8370960719747393508158728849}
{20430400000000000000000000000000}>0.
```

The first independent mathematical review and the separate source/priority audit passed. The argument remains unrefereed; internal review is not journal peer review. No Lean formalization is claimed. The current audit found no earlier resolution within its documented coverage.

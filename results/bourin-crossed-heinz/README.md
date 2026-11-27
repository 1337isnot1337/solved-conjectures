# Bourin’s crossed-Heinz inequality

**Lean status:** none.

If both input matrices have all their eigenvalues in one positive interval whose upper endpoint is at most √2 times its lower endpoint, Bourin’s crossed-Heinz inequality holds for every exponent and every unitarily invariant norm, in every finite dimension. The proof gives the leading deficit for each sum of the largest singular values, including at repeated eigenvalues. It also identifies the ranks at which equality persists for every positive-definite shift. The unrestricted conjecture remains open.

A second dimension-free theorem gives a quantitative neighbourhood of every positive definite pair of equal matrices, including repeated eigenvalues and every interior exponent. [Theorem and rank equality](ARBITRARY-CENTRES.md) · [Sources and independent review](ARBITRARY-CENTRES-REVIEW.md) · [Rational checks](verify_arbitrary_centres.py)

For every prescribed rank, the largest normalized gap over all dimensions and exponents can be computed to any positive rational accuracy. The proof gives an explicit size bound for an actual matrix witness with positive gap. Deciding exact vanishing remains open. [Computation theorem](EFFECTIVE-GAP.md) · [Dimension bound](FINITE-WITNESS.md) · [Review and exact checks](FINITE-WITNESS-REVIEW.md)

[Dimension-free spectral interval](UNIFORM-BAND.md) · [Asymptotic deficit on every common-shift ray](COMMON-SHIFT.md) · [Independent review and comparison with prior work](SHIFT-REVIEW.md) · [Exact arithmetic checks](verify_common_shift.py) · [Bourin’s Question 4](https://arxiv.org/pdf/0805.1954#page=6) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/214)

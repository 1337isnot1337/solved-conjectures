# Ferreira–Simon's stochastic-order conjecture

For the standard positive stable variable $`Z_\alpha`$ with Laplace transform $`e^{-t^\alpha}`$, the family

```math
\frac{Z_\alpha^{-\alpha}}{\Gamma(1-\alpha)},\qquad 0<\alpha<1,
```

decreases in the usual stochastic order. The proof constructs one coupling that is almost surely strictly decreasing for every pair of real parameters in the interval.

This proves Remark 7(b) of Ferreira and Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1](https://arxiv.org/pdf/2512.04940), printed page 18. The same stochastic assertion was proposed earlier in Simon's 2014 paper, Remark 9; those formulations count as one conjecture.

The construction uses the arrival times of a rate-one Poisson process. The normalized variable is the reciprocal of a sequence norm with exponent $`1/\alpha`$. The strict norm inequality gives the comparison for all parameters on one probability-one event. The proof also obtains the exponential and zero endpoint limits and the source's Mittag–Leffler bounds.

- [Complete proof](PROOF.md)
- [Source and priority audit](SOURCES.md)
- [Independent mathematical audit](AUDIT.md)
- [Issue 170](https://github.com/1337isnot1337/solved-conjectures/issues/170)

The proof is analytic and probabilistic. No numerical or finite-case inference is used, so there is no computational verifier to substitute for the written argument. The audit independently checks the stable scale, the order direction, the simultaneous event and both endpoints.

Status: complete proposed proof, independently reviewed internally; unrefereed. No earlier full resolution was found in the documented search. The classical Poisson series and sequence-norm inequality are credited as prior mathematics. Inaccessible older papers and search limitations are recorded in the source audit.

**Lean status:** none verified. [Unverified research candidate](../../lean/Conjectures/FerreiraSimonStochastic.lean) for the deterministic strict sequence comparison; the probabilistic construction, exact marginal laws, and stochastic-order conclusion still require formalization. No complete or partial verification badge is claimed without a successful gate.

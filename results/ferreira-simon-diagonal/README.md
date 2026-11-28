# Ferreira–Simon's diagonal Mittag–Leffler conjecture

The function $`\alpha\mapsto E_{\alpha,\alpha}(-1)`$ is strictly increasing throughout $`0<\alpha<1`$:

```math
E_{\alpha,\alpha}(-1)\lt E_{\beta,\beta}(-1)
\qquad(0<\alpha<\beta<1).
```

This proves the full conjecture in Remark 5(b) of Ferreira and Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1](https://arxiv.org/pdf/2512.04940), printed page 14. The argument minus one is part of the original statement; the proof covers the whole real parameter interval.

The classical Pollard integral expresses the diagonal value as an expectation. Its classical sine quantile has a logarithm whose absolute value strictly decreases with the parameter. Pairing reciprocal quantiles gives a bounded integrand with a definite derivative sign. The resulting pointwise comparison proves strict monotonicity, the endpoint limits zero and $`1/e`$, and the source's proposed bound on a crossing point.

- [Complete proof](PROOF.md)
- [Sources and exact-scope comparisons](SOURCES.md)
- [Independent priority audit](PRIOR-AUDIT.md)
- [Independent mathematical audit](AUDIT.md)
- [Issue 171](https://github.com/1337isnot1337/solved-conjectures/issues/171)

The analytic proof uses no numerical tests or computer algebra. The independent audit reconstructs the integral normalization, quantile Jacobian, parameter derivative and strict integral comparison. The classical quantile is credited to James's *Lamperti-type laws*.

Status: complete proposed proof, independently reviewed internally; unrefereed. No earlier resolution was found in the sources checked. Search limits and a later paper available only through an extracted version are recorded explicitly. The endpoint limits and crossing consequence are not separate resolution claims.

**Lean status:** none.

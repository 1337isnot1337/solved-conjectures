# Gaussian product conjecture: prior resolution

Checked 21 November 2026. Excluded from new research targets and from the campaign's resolution count.

Frédéric Ouimet and Dylan Greaves, [*A proof of the strong Gaussian product inequality conjecture*, arXiv:2609.20234v1](https://arxiv.org/html/2609.20234v1), Theorem 1, treats every centered Gaussian vector, including singular covariance, and every collection of positive real exponents:

```math
\mathbb E\prod_{i=1}^n|X_i|^{\alpha_i}
\geq\prod_{i=1}^n\mathbb E|X_i|^{\alpha_i}.
```

It also characterizes equality when all marginal variances are positive. This includes Frenkel's original equal-even-exponent conjecture.

The actual proof was read. Its orthant-wise convex minimization, principal-minor orthogonality identity, positive Jacobian weights, Jensen comparison, and Mellin integration cover the full statement. The singular case follows by bounded-continuous approximation; its strictness argument uses a correlated bivariate marginal. No gap was identified in this scope check. No Lean work was performed.

The [live arXiv history](https://arxiv.org/abs/2609.20234) displays v1 on 27 July 2026. Some secondary indexes instead display 18 September 2026. Both precede this campaign; the precise display discrepancy has no effect on exclusion. The November [Hirose equicorrelation paper](https://doi.org/10.1016/j.jmaa.2026.130776) still uses open-conjecture language but only proves a restricted covariance class. That passage does not override the full earlier theorem.

This is an audit of an existing result, not a new proof or a claim of independent priority. The next candidate is the distinct Standard Simplex conjecture for Gaussian noise stability; its scope and priority screen are being documented separately.

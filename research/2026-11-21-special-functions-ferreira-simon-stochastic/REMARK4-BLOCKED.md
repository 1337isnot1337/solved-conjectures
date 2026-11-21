# Ferreira–Simon's Mittag–Leffler monotonicity conjecture

Research checkpoint, 21 November 2026. Unresolved; not a result and not counted.

## Exact target

Remark 4, printed pages 12–13 of Ferreira and Simon, [Mittag-Leffler functions and convex ordering, arXiv:2512.04940v1](https://arxiv.org/pdf/2512.04940), proposes the crossing bound

```math
x_{\alpha,\beta,\lambda}\le1
\qquad(0<\alpha<\beta<1,\ \lambda>1),
```

where Corollary 3 proves that the difference

```math
E_\alpha(-\lambda x^\alpha)-E_\beta(-\lambda x^\beta)
```

changes sign exactly once, from negative to positive, at that crossing. The conjecture would imply that the function of $`\alpha`$ decreases for every $`\lambda,x\ge1`$. By the proved single-crossing property, it suffices to prove the comparison at $`x=1`$ for every $`\lambda\ge1`$.

The source already proves the case $`\beta\le\beta_0\approx0.46163`$, where $`\Gamma(1+\beta_0)`$ is minimal, by Theorem C. The case $`\lambda=1`$ follows from its Theorem B. Neither is a new result here.

## Attempt and obstruction

Pollard's integral writes the function as a Laplace transform of a Lamperti ratio with the additional scale $`\lambda^{1/\alpha}`$. The classical sine quantile shows contraction of the logarithm of the unscaled Lamperti ratio as $`\alpha`$ increases. This contraction proved useful for the different diagonal conjecture in Remark 5(b), but here its effect competes with the change in $`\lambda^{1/\alpha}`$. A pointwise comparison of the naively paired quantile integrands fails already at their median. No integral estimate resolving this competition has been established.

The Poisson-arrival coupling for the different Remark 7(b) orders $`M_\alpha/\Gamma(1-\alpha)`$. Removing that scale reverses part of the comparison and does not prove Remark 4. No implication from that completed result is asserted.

At the boundary $`\alpha=1`$, differentiation of the defining series gives

```math
\left.\frac{\partial}{\partial\alpha}E_\alpha(-\lambda)\right|_{\alpha=1}
=\lambda e^{-\lambda}(\log\lambda-\mathop{\mathrm{Ei}}(\lambda))
+1-e^{-\lambda}.
```

This is a local diagnostic, not a full-parameter proof. No counterexample to the target has been obtained.

## Adjacent literature and remaining work

The source points to Lemma 6 of Ashurov and Zunnunov's paper, [arXiv:2103.05287](https://arxiv.org/abs/2103.05287), for a related contour argument. The precise quantitative assumptions of that lemma still need a direct full-text audit before using it. Ashurov and Sulaymonov, [arXiv:2501.01724](https://arxiv.org/abs/2501.01724), concern related parameter monotonicity and inverse diffusion problems; their recorded results do not by themselves establish the full threshold claimed here. A complete priority search has not been performed because there is no proposed resolution.

This target is distinct from the completed stochastic-order and diagonal Mittag–Leffler results. It remains open in this research record.

# Independent review of the Chen–Hazan interface note

21 November 2026. Reviewed `agents/conjectures/chen-hazan-best-comparator-interface.md`, Sections 2–3, against the current Hu–Simchi-Levi Algorithm 1 and the original Chen–Hazan target. This is a mathematical review of two scope tests, not a prize solution or an audit of the entire Hu–Simchi-Levi manuscript.

## Flat-gradient example

The piecewise function is continuously differentiable. Its derivative is the clipping of an affine function to the interval $`[0,\varepsilon]`$, so its Lipschitz constant is at most one. Its infimum is zero and its value at the specified initial point is exactly one.

For the stated specialization of Algorithm 1, the published loss includes a factor $`1/G`$, which equals one here. The momentum update really is $`m_{t+1}=s_t`$ because the published parameter $`a`$ is one when the variance is zero. Thus there is no missing factor in the displayed update or loss.

The induction keeps every queried point on the constant-gradient part: the maximum total displacement before time $`T`$ is at most $`(T-1)\varepsilon/64`$, whereas the length of the flat-gradient interval to the left of the initial point is $`(T-1/2)\varepsilon`$. The online losses are therefore exactly zero on the first round and $`-u/T`$ thereafter.

Projected OGD on $`[0,1]`$ with online stepsize $`\sqrt T`$ has the displayed $`T^{-1/2}`$ regret certificate for every sequence in the stated gradient-bounded loss class. This is a best-comparator guarantee. It is not the zero regret of a constant action against itself. Substitution into a hypothetical additive-free bound for this particular reduction would compare $`T^{-1}`$ with $`C T^{-3/2}`$, giving the stated contradiction for large horizons.

The conclusion must remain limited to this update and this choice of loss scaling/certificate. Another reduction may choose losses of a different size or a different online domain. The note keeps this limitation explicit.

## Auxiliary Rademacher game

The stepsize selected by the online action lies in $`[\eta/2,\eta]`$ and is predictable before the gradient sample. Since $`\beta\eta\le1`$, the descent coefficient is at least $`\eta/4`$. Summing the smoothness inequality gives the stated bound

```math
\frac1T\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|^2
\le \frac{4M}{\eta T}+2\beta\eta\sigma^2
\le \frac{6GB}{T}.
```

Both inequalities use the stated conditional unbiasedness and conditional second-moment bound, not independence of the entire iterate sequence.

For the unrelated one-coordinate Rademacher losses, the current sign is independent of the current action. The best fixed action contributes the absolute value of the sign sum, giving exactly

```math
\mathbb E\mathop{\mathrm{Reg}}^{\mathrm{best}}_T
=\frac B{\sqrt T}\,\mathbb E|S_T|.
```

The interpolation inequality between first, second, and fourth moments yields $`\mathbb E|S_T|\ge\sqrt{T/3}`$. A valid pathwise or deterministic worst-case certificate must consequently have expectation, or value respectively, at least $`B/\sqrt3`$. The final constant $`6\sqrt3`$ follows. The distinction between a deterministic certificate and an expected data-dependent certificate is correctly retained.

If $`M=0`$, the initial point is a global minimizer and has zero gradient. If $`\beta=0`$, a globally differentiable function with zero Lipschitz constant for its gradient is affine; the finite initial-gap assumption forces the gradient to vanish. The degenerate cases are therefore consistent.

## Verdict and scope

Both arguments pass this review. Section 2 rules out a proposed deletion of additive terms from one published reduction. Section 3 exposes an ambiguity in interpreting a displayed inequality when arbitrary unrelated auxiliary losses may inflate the online regret certificate. Neither argument establishes the intended efficient adaptive black-box reduction, and neither is an impossibility theorem for every permitted reduction. The note correctly claims no completed bounty.

Primary sources: [Chen–Hazan, COLT 2024](https://proceedings.mlr.press/v247/chen24e/chen24e.pdf), Sections 2 and 4; [Hu–Simchi-Levi, arXiv:2607.17607v4](https://arxiv.org/pdf/2607.17607v4), Algorithm 1 and Theorem 6.1. Source PDFs are already archived in `agents/demath_zzz/chen-hazan-2024/`.

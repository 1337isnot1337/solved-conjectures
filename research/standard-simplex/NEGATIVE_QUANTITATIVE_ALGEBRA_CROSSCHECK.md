# Algebra cross-check for the negative quantitative corollary

Algebra lane, 21 November 2026.

This note checks the global mass-penalty reduction and the mirrored-strip upper bound requested by the combinatorics lane. It is not a competing corollary draft and does not independently certify a small-positive-deficit localization that has not yet been incorporated into the final corollary.

## Global mass penalty and the large-deficit branch

Write

```math
\Delta=S_{-t}(\mathcal A)-S_{-t}(\mathcal C),\qquad
e=(\gamma_d(A_i)-1/q)_{i=1}^q,\qquad
L=q^{3/2}.
```

The proportional balancing construction applies to every competitor. Its first-moment consequence and the absolute Hermite remainders give

```math
\Delta\ge\|e\|^2-2Lt\|e\|-2t^2
\ge\frac12\|e\|^2-Bt^2,
\qquad B=2L^2+2.
```

The second inequality is exactly $`2Lt\|e\|\le\|e\|^2/2+2L^2t^2`$.

Suppose $`\Delta\ge at`$ and $`t\le a/B`$, where $`a>0`$ depends only on $`q`$. Then $`Bt^2\le at\le\Delta`$, so the global bound implies

```math
\Delta\ge\frac14\|e\|^2.
```

The orbit distance $`d_{\mathscr S}`$ is at most two, because the sum of cellwise symmetric differences equals twice the probability of a label disagreement. Consequently

```math
\Delta\ge\frac a4t\,d_{\mathscr S}(\mathcal A)^2.
```

Averaging these two lower bounds gives the proposed simultaneous estimate

```math
\Delta\ge\frac18\|e\|^2+
\frac a8t\,d_{\mathscr S}(\mathcal A)^2.
```

For the small-deficit branch, once the same-polar core hypotheses have been established, the already reviewed absorption bound and [WEIGHTED_DISTANCE.md](WEIGHTED_DISTANCE.md) give

```math
\Delta\ge\frac12\|e\|^2+
\frac{v}{4\binom q2 C_{q-1}}\,
t\,d_{\mathscr S}(\mathcal A)^2,
```

where $`v=\min(\kappa\ell/8,b)`$ and $`C_r=5(8/7)^{(r-1)/2}`$. This implication is valid; obtaining its neighborhood from a small positive deficit is a separate step in the final draft.

## Mirrored-strip upper bound

Fix a compact patch $`D`$ inside one regular facet, with tangent Gaussian measure $`p_D>0`$. Exchange labels on the normal strips $`D\times(0,u)`$ and $`D\times(-u,0)`$, where $`u`$ is small enough to avoid other facets. This preserves all masses exactly, so $`e=0`$.

For $`F=1_{C_i}-1_{C_j}`$, differentiation of the bounded Gaussian convolution gives

```math
|\partial_n T_{-t}F(x)|
\le\frac{t}{\sqrt{1-t^2}}\mathbb E|G_1|
\le K_0t
\qquad(0\lt t\le1/4),
```

with $`K_0=\sqrt{2/\pi}/\sqrt{15/16}`$. Reflection in the facet makes this potential zero on its tie hyperplane. Thus

```math
J_t\le2K_0t\,p_D[\phi(0)-\phi(u)].
```

The exponential transfer weight is at most one and $`\min(s,1)\le s`$ for $`s\ge0`$, so

```math
W_\alpha\le2p_D[\phi(0)-\phi(u)].
```

The exact negative comparison, with zero mass error, is

```math
\Delta=2J_t-t\|\delta M\|_F^2+\mathcal R,
\qquad |\mathcal R|\le Ht^2W_\alpha.
```

Dropping the nonpositive first-moment term is legitimate for an upper bound. Therefore

```math
\begin{aligned}
\Delta
&\le[4K_0t+2Ht^2]p_D[\phi(0)-\phi(u)]
\\ &\le(2K_0+Ht)p_D\phi(0)\,t u^2,
\end{aligned}
```

where $`1-e^{-u^2/2}\le u^2/2`$ was used in the last step. This is uniform of order $`t u^2`$ for the allowed correlations and all cylindrical extensions. It uses the absolute remainder estimate, not positivity of $`T_{-t}`$.

Both requested reductions pass. No new source search or priority claim is attached to this cross-check.

# Dospolova–Germanskov–Zaporozhets's intrinsic-volume sequence conjecture

## Status

Excluded from new-resolution claims on 2026-11-20. The factorial-sequence obstruction follows immediately from Yusen Long's earlier published results. No result count or completed-result entry is assigned.

## Target statement

Dospolova, Germanskov, and Zaporozhets, *On Steiner entire function*, [arXiv:2507.11626v1](https://arxiv.org/pdf/2507.11626), Conjecture 3.6, printed pages 9–10, assert that a positive sequence with $a_0=1$ is the intrinsic-volume sequence of an infinite-dimensional compact Gaussian-bounded convex set if and only if

```math
a_k^2\geq\frac{k+1}{k}a_{k-1}a_{k+1}\qquad(k\geq1).
```

The primary statement uses a non-strict inequality and has no extra hypothesis excluding equality sequences. The [arXiv record](https://arxiv.org/abs/2507.11626) currently lists only the version submitted on 15 July 2025.

## Decisive earlier source

Yusen Long, *Hyperbolic embedding of infinite-dimensional convex bodies*, [arXiv:2305.13428v3](https://arxiv.org/html/2305.13428v3), dated 26 September 2024; *Geometriae Dedicata* 219, article 17 (2025), [DOI 10.1007/s10711-024-00957-5](https://link.springer.com/article/10.1007/s10711-024-00957-5). The publisher records publication on 15 January 2025.

The full primary manuscript was inspected independently by root and the analysis lane. Its Theorem 1.2 gives the second intrinsic volume in terms of the Gaussian support function. Lemma 4.8 removes its first Wiener-chaos component after translation to its Steiner point, and Proposition 4.9 supplies the corresponding spectral-gap inequality. These results apply to compact Gaussian-bounded sets in separable Hilbert space, including infinite-dimensional sets.

## Attributed deduction

Translate a nonpoint Gaussian-bounded convex set $K$ so that its Steiner point is zero. Write $h=h_K(X)$ for its Gaussian support function and $D$ for the Malliavin derivative. Long's results give

```math
V_1(K)=\sqrt{2\pi}\,\mathbb E h,
\qquad
V_2(K)=\pi\left(\mathbb E h^2-\mathbb E\|Dh\|^2\right),
\qquad
\mathbb E\|Dh\|^2\geq2\mathop{\mathrm{Var}}(h).
```

Therefore

```math
\begin{aligned}
V_1(K)^2-2V_2(K)
&=2\pi\left(\mathbb E\|Dh\|^2-\mathop{\mathrm{Var}}(h)\right)\\
&\geq2\pi\mathop{\mathrm{Var}}(h)\gt0.
\end{aligned}
```

The strictness requires only an elementary observation. A nonpoint translated set contains a nonzero point $t$. Its support function dominates $X_t$, a nondegenerate Gaussian variable with an unbounded upper tail. Since $h$ belongs to $L^2$, it cannot be an almost-sure constant. Thus its variance is positive.

For every $c\gt0$, the positive sequence $a_k=c^k/k!$ satisfies all the proposed inequalities with equality. In particular $a_1^2=2a_2$. The strict inequality just deduced rules out its realization by any nonpoint Gaussian-bounded convex set. A point has $V_1=0$, so it cannot realize this sequence either.

This is a direct consequence of the older source, not a new theorem established by this research project. A separate proof through finite support functions and the even Gaussian Poincaré inequality was considered during screening, but it does not change that priority conclusion.

## Additional source check

The same authors' follow-up, *Regularity of Gaussian processes, metric entropy and the Wills functional*, [arXiv:2611.21460](https://arxiv.org/pdf/2611.21460), submitted 16 November 2026, was inspected at its introduction, main statements, and intrinsic-volume preliminaries. It studies regularity and growth exponents. Its existence does not remove the decisive earlier implication above.

The project therefore excludes this target under the requirement that an accepted resolution must not already follow directly from an earlier published theorem. This checkpoint records the useful deduction and its source without presenting it as a newly solved open conjecture.

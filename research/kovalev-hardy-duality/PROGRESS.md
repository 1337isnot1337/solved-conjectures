# Kovalev's conjecture

Status: unresolved. This note records an exact reduction and excludes one local counterexample route. It does not establish either bound of the conjecture.

## Original statement and source

Leonid V. Kovalev, *Hardy-type norms of matrices*, [arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373), submitted 19 July 2026, Conjecture 6.1, printed page 9, asks whether every real matrix of order strictly greater than two satisfies

```math
c_n\|A\|_{H^4}\leq\|A\|_{H^1_*}\leq\|A\|_{H^4},
\qquad
c_n=\frac{2/n}{\|P_2\|_{H^1}\|P_2\|_{H^4}}.
```

Here the Hardy norm is the mean of the Euclidean norm of the image of a uniformly distributed point of the unit sphere, and the duality pairing is the normalized trace. The source gives

```math
c_n=\frac{2^{5/4}}{\sqrt\pi}
\frac{\Gamma((n+1)/2)}{\Gamma(n/2)}
\frac{(n+2)^{1/4}}{n^{3/4}}.
```

The target includes all matrix sizes greater than two and both inequalities. A fixed-size computation or one bound alone would not be a full resolution of this target.

The full primary PDF was read locally from [the arXiv PDF](https://arxiv.org/pdf/2607.17373). Its SHA-256 is `5c6423b5bfa42808a1729f4d6aa40123b821e56b6b6cb18a6e5f22e0ac8f592c`. The copyright-protected PDF is not included in this research directory.

## Gaussian-gradient reduction

Let independent standard normal variables be denoted by $`G_1,\ldots,G_n`$, and put

```math
N(b)=\mathbb E\sqrt{\sum_i b_i^2G_i^2},
\qquad
m_n=\mathbb E\chi_n
=\sqrt2\frac{\Gamma((n+1)/2)}{\Gamma(n/2)}.
```

For every nonzero nonnegative vector, define

```math
g_i(b)=\frac{\partial N}{\partial b_i}
=\mathbb E\frac{b_iG_i^2}{\sqrt{\sum_jb_j^2G_j^2}}.
```

The derivative formula is justified by dominated convergence: the absolute difference quotient in a coordinate is at most the corresponding absolute normal variable, and the denominator is positive almost surely. In particular, a zero coordinate of the vector has zero gradient coordinate.

Orthogonal invariance reduces the matrix norm to its singular values. The independence of the Gaussian radius and direction gives

```math
\|\mathop{\mathrm{diag}}(b)\|_{H^1}=\frac{N(b)}{m_n}.
```

With the normalized trace pairing, every point of the dual unit sphere is, up to left and right orthogonal factors, the gradient vector

```math
a_i=\frac{n}{m_n}g_i(b)
```

for some nonzero vector. To see the converse as well, maximize the trace pairing with a given dual unit vector over the primal unit sphere. A maximizer exists in finite dimension; the differentiability of the primal norm implies that the supporting dual vector is its normalized gradient.

The elementary fourth spherical moment identity is

```math
\|\mathop{\mathrm{diag}}(a)\|_{H^4}^4
=\frac{(\sum_i a_i^2)^2+2\sum_i a_i^4}{n(n+2)}.
```

Thus write

```math
V(g)=\left(\sum_i g_i^2\right)^2+2\sum_i g_i^4.
```

Kovalev's full conjecture is equivalent to the following pair of bounds, simultaneously for every integer greater than two and every nonzero nonnegative vector:

```math
\frac{(n+2)m_n^4}{n^3}\leq V(g(b))\leq\frac{\pi^2}{8}.
```

The lower equality candidate has all coordinates of the input equal. The upper equality candidate has exactly two equal nonzero coordinates. The constant on the right is independent of the ambient dimension, but this reduction does not prove either bound.

## Values at projections

For a vector with exactly $`r`$ equal nonzero coordinates, the nonzero gradient coordinates equal $`m_r/r`$. Consequently

```math
V_r=\frac{(r+2)m_r^4}{r^3},
\qquad
V_1=\frac{12}{\pi^2},\quad
V_2=\frac{\pi^2}{8},\quad
V_3=\frac{320}{27\pi^2}.
```

These identities explain the projection candidate in the source. They do not reduce arbitrary singular values to projections.

## Exact local checks

For the three-coordinate vector $`b=(1,1,t)`$, with positive $`t`$ tending to zero, the sphere integral can be performed explicitly:

```math
\frac{N(1,1,t)}{m_3}
=\frac12\left(t+
\frac{\arcsin\sqrt{1-t^2}}{\sqrt{1-t^2}}\right)
=\frac\pi4+\frac\pi8t^2-\frac13t^3+O(t^4).
```

Differentiating this expression, and using homogeneity for the other two coordinates, gives

```math
V(g(1,1,t))=\frac{\pi^2}{8}-\frac{2\pi}{3}t^3+O(t^4).
```

The quadratic coefficient cancels. The first nonzero perturbation coefficient is negative, so adding a small third singular value does not disprove the proposed upper bound. The cubic term also shows why a formal expansion that requires a third negative moment of a two-dimensional Gaussian radius is unsafe.

At the all-equal vector, let $`v`$ have coordinate sum zero. Direct differentiation gives

```math
\left.\frac{d^2}{dt^2}V(g(\mathbf1+tv))\right|_{t=0}
=\frac{8m_n^4(n-2)}{n^3(n+2)^2}\|v\|_2^2.
```

Thus the lower equality candidate is a strict local minimum for every size in the conjecture. This is another local consistency check, not a global proof.

## Stationary-point obstruction

For a fixed positive vector, define the common Stieltjes function

```math
I(s)=\frac1{\sqrt\pi}\int_0^\infty
\frac{t^{-1/2}}{1+2st}
\prod_j(1+2b_j^2t)^{-1/2}\,dt.
```

Then $`g_i=b_iI(b_i^2)`$. In the positive orthant the Hessian of the Gaussian norm has kernel precisely the scaling direction. Since the objective is invariant under scaling of the input, an interior stationary point must satisfy, for some constant $`\kappa`$,

```math
g_i\left(S+2g_i^2\right)=\kappa b_i,
\qquad S=\sum_jg_j^2.
```

Equivalently, every positive squared input coordinate must solve

```math
S I(s)+2sI(s)^3=\kappa.
```

A useful shape theorem for this scalar expression would constrain the possible singular-value levels. No such theorem has been proved here. Even a reduction to two levels would require a further global comparison, including the boundary of the orthant.

## Priority screening and limits

Initial searches on 21 November 2026 used both web engines, the exact arXiv identifier, the paper title, the author name with Hardy duality, and global GitHub issues. They located the primary source and the older two-dimensional work, but no resolution of Conjecture 6.1. A scan of the fetched Principia and TrureTuring archive paths found older Kovalev square-root-section targets, not this matrix-norm assertion.

The older source is Kovalev and Yang, *Near-isometric duality of Hardy norms with applications to harmonic mappings*, [arXiv:2001.09465](https://arxiv.org/abs/2001.09465), followed by the sharp planar result of Brevig, Ortega-Cerda, and Seip cited as reference 3 of the 2026 paper. These are primary prior leads, and the 2026 source explicitly distinguishes their two-dimensional results from its new conjecture.

This is an initial screening, not a completed novelty audit. A full result would still require current citation/follow-up searches, repository issue-history checks, and direct inspection of any claimed resolution. No solved status is requested.

# Balanced stable polynomials and the Gyires norm problem

Research note, 20 November 2026 (America/Chicago). This note gives an exact reformulation and records an unproved extension. It does not prove Gyires's conjecture.

## The unproved extension

Let `p` be a homogeneous real-stable polynomial of degree `n` in `n` variables, with nonnegative coefficients and

```math
p(\mathbf1)=1,\qquad \partial_i p(\mathbf1)=1\quad(1\le i\le n).
```

Write `p(x)=sum_{|alpha|=n} p_alpha x^alpha`, let `c=p_(1,...,1)`, and put `d_n=n!/n^n`. A possible sufficient extension of the stronger Gram form of Gyires's inequality is

```math
\boxed{\quad \|p\|_F^2=\sum_\alpha\alpha!p_\alpha^2
\ \le\ \frac{c^2}{d_n}.\quad} \tag{U}
```

This statement is **unproved** here. No source establishing it has been found in the primary sources reviewed. It specializes to the stronger Gram inequality when `p` is the product of the row linear forms of a doubly stochastic matrix. Equality holds for `p=(sum_i x_i/n)^n`, by direct calculation.

The reason to consider the larger class is that derivatives and specialization at zero preserve real stability, whereas they need not preserve a product representation. That observation alone does not produce an induction: the polynomial after one elimination need not satisfy the displayed normalization, and the variable scaling needed to restore balance changes its Fischer norm.

## Polarization and an exact collision formula

Fix an integer `m>=n`. Replace each variable `x_i` by a group of `m` variables `z_(i,1),...,z_(i,m)`, and define

```math
P_m(z)=\sum_\alpha p_\alpha
\prod_{i=1}^n
\frac{e_{\alpha_i}(z_{i,1},\ldots,z_{i,m})}
{\binom m{\alpha_i}}.
```

This is the usual multiaffine polarization. It is homogeneous of degree `n`, has nonnegative coefficients, and its coefficients sum to one. The polarization theorem preserves stability, so its coefficients define a strongly Rayleigh probability measure `mu_m` on the `n`-element subsets of `n` groups of size `m`.

Every individual variable has marginal probability `1/m`: symmetry inside each group and the original derivative normalization give this directly. If an `n`-element subset `S` contains `alpha_i` elements of group `i`, then

```math
\mu_m(S)=\frac{p_\alpha}{\prod_i\binom m{\alpha_i}}.
```

Let `T` be the event that `S` contains exactly one element from each group. There are `m^n` such subsets, each having probability `c/m^n`, and hence

```math
\Pr_{\mu_m}(T)=c. \tag{1}
```

For two independent samples `S,S'` from `mu_m`, their collision probability is

```math
\Pr(S=S')
=\sum_S\mu_m(S)^2
=\sum_\alpha\frac{p_\alpha^2}
{\prod_i\binom m{\alpha_i}}. \tag{2}
```

Since `sum_i alpha_i=n`, the finite sum in (2) gives the exact limit

```math
\lim_{m\to\infty}m^n\Pr(S=S')
=\sum_\alpha\alpha!p_\alpha^2
=\|p\|_F^2. \tag{3}
```

Indeed, `binom(m,a)=m^a/a!+O(m^(a-1))` for each fixed nonnegative integer `a`. Thus (U) asks for a comparison between a transversal probability and the scaled collision probability of these polarized measures:

```math
\Pr_{\mu_m}(T)^2
\ \ge\ d_n\lim_{r\to\infty}r^n
\Pr_{\mu_r}(S=S'). \tag{4}
```

The right side uses the limiting family, not an asserted finite-`m` bound. No finite collision inequality with a sharp uniform-matroid constant is assumed.

## What ordinary negative association supplies

Strongly Rayleigh measures are negatively associated. Applying this to the coordinate inclusion events for any fixed `n`-element set `S` gives

```math
\mu_m(S)\le\prod_{a\in S}\Pr(a\in S)=m^{-n}.
```

Therefore

```math
\Pr(S=S')\le \max_S\mu_m(S)\le m^{-n},
```

and (3) recovers only

```math
\|p\|_F^2\le1. \tag{5}
```

This does not provide the dependence on the transversal probability required in (U). Weighted AM–GM gives `p(x)>=prod_i x_i` from the normalized coefficient means, while `p(1)=1`, so the capacity is one. Gurvits's capacity bound separately supplies `c>=d_n`. Combining that lower bound with (5) gives `c^2/||p||_F^2>=d_n^2`, not the required `d_n`.

The missing statement is therefore a joint bound relating the two quantities, rather than either standard marginal estimate alone. The normalization and the stability of the polarized measures do not justify silently replacing that missing statement with negative association.

## Primary references and scope

- J. Borcea, P. Branden and T. M. Liggett, *Negative dependence and the geometry of polynomials*, Journal of the American Mathematical Society 22 (2009), 521-567; [author preprint](https://arxiv.org/abs/0707.2340). This is the source for the strongly Rayleigh framework and its negative-dependence properties.
- The multivariate polarization principle follows from the Grace-Walsh-Szego theorem; it is discussed in J. Leake, *A representation theoretic explanation of the Borcea-Branden characterization*, [DOI 10.1007/s00209-021-02825-4](https://doi.org/10.1007/s00209-021-02825-4).
- L. Gurvits, *Van der Waerden/Schrijver-Valiant like conjectures and stable (aka hyperbolic) homogeneous polynomials: One theorem for all*, Electronic Journal of Combinatorics 15 (2008), R66, [DOI 10.37236/790](https://doi.org/10.37236/790). Its coefficient-capacity theorem is a lower bound for `c`; it is not (U).
- [Minc Conjecture 20: Gyires's ratio inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html) is the original target. The sufficient product case and the separate equality issue are stated in [gyires_interior_reduction.md](gyires_interior_reduction.md).

The collision identities (1)-(3) follow directly from the displayed definition of polarization. No priority claim is made for them, and no new resolved conjecture is asserted.

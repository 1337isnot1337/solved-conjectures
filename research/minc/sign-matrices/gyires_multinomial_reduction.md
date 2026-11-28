# Gyires's stronger Gram inequality as a multinomial density bound

Date: 20 November 2026 (America/Chicago).

This note records an exact reformulation and the remaining inequality. It does not resolve Gyires's conjecture. The normalized-coefficient obstruction below was already recorded in ../inequalities/gyires_interior_reduction.md; it is included here only to prevent a false log-concavity argument.

## The occupation law

Let $`A=(a_{ij})`$ be an $`n\times n`$ doubly stochastic matrix and set

```math
p_A(z)=\prod_{i=1}^n\left(\sum_{j=1}^n a_{ij}z_j\right)
      =\sum_{|\alpha|=n}\mu_A(\alpha)z^\alpha,
\qquad d_n=\frac{n!}{n^n}.
```

Choose independent random variables $`X_i`$ with
$`\mathbb P(X_i=j)=a_{ij}`$. Then $`\mu_A`$ is the law of their occupation vector. In particular, it is a probability measure and
$`\mathbb E_{\mu_A}\alpha_j=\sum_i a_{ij}=1`$.

The reference law is the multinomial distribution with $`n`$ trials and equal cell probabilities:

```math
\pi(\alpha)=\frac{n!}{\alpha!\,n^n}=\frac{d_n}{\alpha!}.
```

Write $`f_A=\mu_A/\pi`$ on the compositions of $`n`$, and let
$`\mathbf1=(1,\ldots,1)`$. Directly,

```math
f_A(\mathbf1)=\frac{\mathop{\mathrm{per}}A}{d_n}.
\tag{1}
```

The permanent Cauchy--Binet expansion gives

```math
\mathop{\mathrm{per}}(AA^{\mathsf T})
 =\sum_{|\alpha|=n}\alpha!\,\mu_A(\alpha)^2.
\tag{2}
```

For completeness, expand each entry of $`AA^{\mathsf T}`$ in its defining sum. A term specifies two assignments of the row indices to intermediate columns with the same occupation vector $`\alpha`$. The $`\alpha!`$ bijections inside those column classes account for its multiplicity. Equivalently, (2) is the Fischer norm identity
$`\|p_A\|_F^2=\mathop{\mathrm{per}}(AA^{\mathsf T})`$, with
$`\|z^\alpha\|_F^2=\alpha!`$.

Consequently,

```math
\|f_A\|_{L^2(\pi)}^2
 =\frac{\mathop{\mathrm{per}}(AA^{\mathsf T})}{d_n}.
\tag{3}
```

The stronger Gram form of Gyires is therefore exactly

```math
\boxed{\quad
\|f_A\|_{L^2(\pi)}
\le f_A(\mathbf1).
\quad}
\tag{4}
```

In divergence notation, (4) is

```math
D_2(\mu_A\|\pi)
\le 2\log\frac{\mathop{\mathrm{per}}A}{d_n},
```

where $`D_2(\mu\|\pi)=\log\sum_\alpha\mu(\alpha)^2/\pi(\alpha)`$.
This is an equivalence, not an additional estimate.

## Why the obvious coefficient shortcut fails

If $`f_A`$ had its maximum at $`\mathbf1`$, then
$`\sum_\alpha\pi(\alpha)f_A(\alpha)^2
\le f_A(\mathbf1)\sum_\alpha\pi(\alpha)f_A(\alpha)
=f_A(\mathbf1)`$.
The van der Waerden inequality would then imply (4). But that pointwise hypothesis is false.

For $`A=(I_4+P_4)/2`$, where $`P_4`$ is a four-cycle permutation matrix,

```math
\alpha!\mu_A(\alpha)=\frac14
\quad\text{at }\alpha=(2,0,2,0),(0,2,0,2),
\qquad
\mu_A(\mathbf1)=\frac18.
```

Thus $`f_A`$ is twice as large at those two compositions as at their midpoint $`\mathbf1`$. Ordinary midpoint log-concavity of the relative density fails as well. The generating polynomial $`p_A`$ is real stable, but this does not imply that stronger relative-density property.

## An exact occupancy-channel form

There is also a finite Markov-chain formulation. For a composition $`\alpha`$, start $`\alpha_i`$ labelled particles in state $`i`$, move each particle independently with transition matrix $`A`$, and retain only the final occupation vector. Let $`K_A(\alpha,\beta)`$ be the resulting transition probabilities.

Because $`A`$ is doubly stochastic, the multinomial law $`\pi`$ is stationary. Reversing all particle moves shows

```math
\pi(\alpha)K_A(\alpha,\beta)
=\pi(\beta)K_{A^{\mathsf T}}(\beta,\alpha).
\tag{5}
```

Also $`K_AK_B=K_{AB}`$. These statements follow either from the labelled-particle construction or from expansion of
$`\prod_i(\sum_j a_{ij}z_j)^{\alpha_i}`$.

Starting from $`\mathbf1`$, the occupation law is $`\mu_A`$, so

```math
K_A(\mathbf1,\mathbf1)=\mathop{\mathrm{per}}A,
\qquad
K_{AA^{\mathsf T}}(\mathbf1,\mathbf1)
=\mathop{\mathrm{per}}(AA^{\mathsf T}).
```

Thus the unresolved statement is the following return-probability estimate for this specific family of particle channels:

```math
d_n\,K_{AA^{\mathsf T}}(\mathbf1,\mathbf1)
\le K_A(\mathbf1,\mathbf1)^2.
\tag{6}
```

Stationarity and adjointness alone only give the usual Cauchy--Schwarz comparison in the opposite direction with a different normalization. They do not prove (6). Any successful channel argument must use the independent-particle origin of $`K_A`$ and the constraints on $`A`$.

## Precise remaining gap

The missing step is (4) for every product of $`n`$ nonnegative row linear forms whose coefficient mean is $`\mathbf1`$. Existing stability, negative-association, and capacity bounds do not imply it by the arguments checked so far. The central-density maximum and ordinary relative midpoint log-concavity are false. The self-Gram polynomial is also neither stable nor Lorentzian in general, as documented separately in gyires_self_gram_obstruction.md.

The current original target is [Lavi's Conjecture 20 page](https://yair-lavi.com/mincs-list/conjecture-20/index.html). Its symmetrized inequality follows from (4) applied to $`A`$ and $`A^{\mathsf T}`$, together with the Fischer-space Cauchy--Schwarz inequality; this stronger reformulation alone is not a proof of the original conjecture.

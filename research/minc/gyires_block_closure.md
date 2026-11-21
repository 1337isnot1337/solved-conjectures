# Gyires's ratio inequality: a block-closure reduction

Research checkpoint, 20 November 2026. **This is a partial theorem, not a resolution of Minc Conjecture 20.** It applies to matrices of arbitrarily large order, but only to a decomposable subclass. It is not a new named solution and is **not counted** in the MINCs campaign.

## Original target and prior art

Gyires's conjecture asserts, for every real nonnegative doubly stochastic matrix `A` of order `n`,

```math
4\operatorname{per}(A)^2\ \ge\ d_n\bigl(\operatorname{per}(AA^\mathsf T)+\operatorname{per}(A^\mathsf T A)+2\operatorname{per}(A^2)\bigr),\qquad d_n=\frac{n!}{n^n},
```

with equality only at `J_n`. See [the live Minc entry](https://yair-lavi.com/mincs-list/conjecture-20/index.html) and Cheon--Wanless (2005), Conjecture 20. The inequality remains open for arbitrary order.

The **strong Gram inequality**

```math
\mathcal G_n(A):\qquad \operatorname{per}(A)^2\ \ge\ d_n\operatorname{per}(AA^\mathsf T)
```

is sufficient when also applied to `A^T`. This reduction is **not new**: Chris Ozols's [4-by-4 proof](https://github.com/cozuya/gyires-permanent-4x4) explicitly uses it and proves the strong inequality for every `A\in\Omega_4`, strictly unless `A=J_4`. The campaign's [spectral-radius note](inequalities/gyires_spectral.md) establishes it for `\|A-J_n\|_{op}\le n^{-1/2}`, depending on cited results of Lavi. This file documents a separate, elementary closure consequence of those results.

## Lemma 1: block closure for the strong inequality

Suppose `B\in\Omega_r` and `C\in\Omega_s` satisfy `\mathcal G_r(B)` and `\mathcal G_s(C)`. Then `A=B\oplus C\in\Omega_{r+s}` satisfies `\mathcal G_{r+s}(A)`, **strictly** for positive `r,s`.

Indeed, the permanent and Gram permanent are multiplicative across direct sums:

```math
\begin{aligned}
\operatorname{per}(A)^2
&=\operatorname{per}(B)^2\operatorname{per}(C)^2\\
&\ge d_r d_s\operatorname{per}(BB^\mathsf T)\operatorname{per}(CC^\mathsf T)\\
&=d_r d_s\operatorname{per}(AA^\mathsf T).
\end{aligned}
```

The constants satisfy

```math
\frac{d_{r+s}}{d_r d_s}
=\binom{r+s}{r}\left(\frac{r}{r+s}\right)^r
\left(\frac{s}{r+s}\right)^s<1.
```

The last expression is the probability that a nondegenerate binomial random variable `\mathrm{Bin}(r+s,r/(r+s))` equals `r`; it is strictly less than one. Every doubly stochastic Gram matrix has positive permanent (by van der Waerden), so the inequality is strict.

Induction proves the closure for any finite number of positive-size blocks. Independent row/column permutations preserve both sides, so an arbitrary block-diagonal matrix up to those permutations is covered.

## Lemma 2: the strong inequality implies Gyires

For any real `n\times n` matrices `M,N`, let

```math
f_M(x)=\prod_{i=1}^n\left(\sum_{j=1}^n m_{ij}x_j\right)
=\sum_{|\alpha|=n}c_\alpha(M)x^\alpha.
```

The elementary permanent Cauchy--Binet expansion gives

```math
\operatorname{per}(MN^\mathsf T)
=\sum_{|\alpha|=n}\alpha!\,c_\alpha(M)c_\alpha(N).
```

Thus, by `2xy\le x^2+y^2` term by term,

```math
2\operatorname{per}(MN^\mathsf T)
\le\operatorname{per}(MM^\mathsf T)+\operatorname{per}(NN^\mathsf T).
```

Use `M=A` and `N=A^\mathsf T`. If both `\mathcal G_n(A)` and `\mathcal G_n(A^\mathsf T)` hold, then

```math
\begin{aligned}
\operatorname{per}(AA^\mathsf T)&+\operatorname{per}(A^\mathsf T A)+2\operatorname{per}(A^2)\\
&\le 2\left[\operatorname{per}(AA^\mathsf T)+\operatorname{per}(A^\mathsf T A)\right]\\
&\le\frac{4\operatorname{per}(A)^2}{d_n}.
\end{aligned}
```

If either strong inequality is strict, the resulting Gyires inequality is strict.

## Exact all-order corollary

Let `A` be doubly stochastic and, after separate permutations of rows and columns, equal to

```math
A_1\oplus\cdots\oplus A_b.
```

Suppose each block `A_i` satisfies either:

1. `\dim(A_i)=1,2,` or `4`; or
2. `\|A_i-J_{n_i}\|_{op}\le n_i^{-1/2}`, using the separately documented **conditional-on-cited-inputs** spectral theorem.

Then Gyires's inequality holds for `A`. It is strict if there are at least two blocks. The first alternative is unconditional: order four is Ozols's existing strong theorem; order one is trivial; for order two, with

```math
B=\begin{pmatrix}a&1-a\\1-a&a\end{pmatrix},\qquad q=a(1-a)\in[0,1/4],
```

we have

```math
\operatorname{per}(B)=1-2q,\quad
\operatorname{per}(BB^\mathsf T)=(1-2q)^2+4q^2,
```

and hence

```math
\operatorname{per}(B)^2-d_2\operatorname{per}(BB^\mathsf T)
=\frac{(1-2q)^2-4q^2}{2}
=\frac{1-4q}{2}\ge0.
```

Apply Lemma 1 to `A` and separately to `A^T` (block transposition preserves each hypothesis), then Lemma 2.

This corollary covers an unbounded-order class, including matrices globally far from `J_n`. It does **not** cover general indecomposable matrices of orders at least five and therefore **does not solve Gyires's conjecture**.

## Source audit and nonclaims

- [Yair Lavi, Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html), accessed 20 November 2026: still explicitly open.
- [Cheon and Wanless, An update on Minc's survey (2005)](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf): original formulation and Chang's cases.
- [Chris Ozols, Gyires order-four repository (2026)](https://github.com/cozuya/gyires-permanent-4x4): **existing** complete proof of the stronger order-four estimate, including equality.
- [Campaign spectral-Gyires note](inequalities/gyires_spectral.md): already derived all-order spectral sufficient condition; its historical priority is not claimed here.

The block-closure argument is elementary and may occur in older literature. No priority claim has been established for the resulting subclass. No computational experiment is used as evidence for the all-order assertion. **New completed unqualified Minc entries: zero.**

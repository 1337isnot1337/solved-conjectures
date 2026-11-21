# Dospolova–Germanskov–Zaporozhets's conjecture

Status: proposed complete disproof of Conjecture 3.6 of arXiv:2507.11626v1. Two independent mathematical reviews passed. The documented prior-resolution search found no earlier explicit resolution; final integration review is pending. The argument is structural and gives the entire family $`a_k=c^k/k!`$, for every real $`c>0`$.

## The precise target

Maria Dospolova, Mikhail Germanskov, and Dmitry Zaporozhets, *On Steiner entire function*, [arXiv:2507.11626v1](https://arxiv.org/html/2507.11626v1#S3.SS4), Conjecture 3.6, assert that a positive sequence $`a_0=1,a_1,a_2,\ldots`$ is the intrinsic-volume sequence of some infinite-dimensional Gaussian-bounded set if and only if

```math
a_k^2\geq\frac{k+1}{k}a_{k-1}a_{k+1}
\qquad(k\geq1).
```

The paper explicitly uses "Gaussian bounded" (GB) only for nonempty convex compact subsets of a separable real Hilbert space with finite first intrinsic volume. Its infinite-dimensional intrinsic volumes are the suprema over finite-dimensional convex compact subsets. We preserve those conventions.

We prove a necessary condition which excludes the positive sequences

```math
a_k=\frac{c^k}{k!},\qquad k\geq0,\quad c>0.
```

These sequences satisfy every displayed ultra-log-concavity inequality with equality. Nevertheless no such sequence is the intrinsic-volume sequence of a nontrivial GB compact, in any dimension.

## The Gaussian normalization

We use the normalization of the published paper by Richard A. Vitale, *Intrinsic volumes and Gaussian processes*, Advances in Applied Probability 33 (2001), 354–364, DOI [10.1017/S0001867800010831](https://doi.org/10.1017/S0001867800010831). The [author's lecture packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf) includes the entire published article on PDF pages 32–42 (printed pages 354–364).

Let $`X_t`$ be the isonormal process indexed by a GB compact $`K`$:

```math
\mathbb E X_t=0,
\qquad \mathbb E(X_sX_t)=\langle s,t\rangle.
```

Use the separable version, with each supremum taken over a fixed countable dense subset, as specified in Vitale's Section 2. Translation allows us to assume $`0\in K`$; it preserves intrinsic volumes, increments, ranges, and oscillations. Define the measurable random variables

```math
S=\sup_{t\in K}X_t,\qquad I=\inf_{t\in K}X_t,
\qquad R=S-I.
```

Sudakov's intrinsic-width identity, stated on printed page 356, gives

```math
V_1(K)=\sqrt{2\pi}\,\mathbb E S.
```

The centered Gaussian law is invariant under $`X\mapsto-X`$, so $`\mathbb E(-I)=\mathbb E S`$. In particular,

```math
\frac{\mathbb E R}{2}
=\mathbb E S
=\frac{V_1(K)}{\sqrt{2\pi}}<\infty.
\tag{1}
```

Vitale defines $`\mathop{\mathrm{osc}}_K(t)`$ to be half the limiting local range: for each fixed $`t\in K`$, almost surely,

```math
2\mathop{\mathrm{osc}}_K(t)
=\lim_{\varepsilon\downarrow0}
\left(\sup_{s\in K\cap B(t,\varepsilon)}X_s
-\inf_{s\in K\cap B(t,\varepsilon)}X_s\right).
```

By the Itô–Nisio theorem this limit is a nonrandom nonnegative constant. Put

```math
\mathop{\mathrm{osc}}(K)=\sup_{t\in K}\mathop{\mathrm{osc}}_K(t).
```

For positive intrinsic volumes, Vitale's normalized quasi-widths and his Theorem 3 on printed page 357 give

```math
m_j(K)=\frac{jV_j(K)}{\sqrt{2\pi}\,V_{j-1}(K)},
\qquad
\lim_{j\to\infty}m_j(K)=\mathop{\mathrm{osc}}(K).
\tag{2}
```

For finite-dimensional sets the eventual $`0/0`$ terms are defined as zero; this convention is not needed for the proposed positive sequence. The factors $`\sqrt{2\pi}`$ in (1) and (2), and the factor two in the local range, are essential. We use the published Vitale normalization rather than identifying differently normalized quantities by name.

## A strict necessary condition

**Lemma.** For every GB compact $`K`$ containing two distinct points,

```math
\mathop{\mathrm{osc}}(K)
<\frac{V_1(K)}{\sqrt{2\pi}}.
\tag{3}
```

**Proof.** For each fixed $`t\in K`$, every local range in the definition of $`2\mathop{\mathrm{osc}}_K(t)`$ is at most the global range $`R`$. Thus

```math
R\geq2\mathop{\mathrm{osc}}_K(t)
```

almost surely. Choose a countable sequence of deterministic points $`t_r\in K`$ whose local oscillation constants approach $`\mathop{\mathrm{osc}}(K)`$. Intersecting the corresponding probability-one events gives

```math
R\geq2\mathop{\mathrm{osc}}(K)
\quad\hbox{almost surely}.
\tag{4}
```

This step does not require an uncountable intersection of full-probability events. The countable separable sets used to realize these local suprema can be combined with the set used for the global supremum. Vitale's separable convention makes these choices immaterial almost surely. Finiteness of $`R`$ and (4) also imply that $`\mathop{\mathrm{osc}}(K)<\infty`$.

Choose distinct $`u,v\in K`$, and include them in the countable indexing set. Write $`d=\|u-v\|>0`$. Then

```math
R\geq|X_u-X_v|,
\qquad X_u-X_v\sim N(0,d^2).
```

A nondegenerate normal random variable has positive probability of exceeding any fixed finite bound in absolute value. Consequently

```math
\mathbb P\{R>2\mathop{\mathrm{osc}}(K)\}>0.
```

Together with (4) and the finite expectation in (1), this proves

```math
\mathbb E R>2\mathop{\mathrm{osc}}(K).
```

Equation (1) now gives (3). This argument permits $`\mathop{\mathrm{osc}}(K)>0`$ and does not assume Gaussian continuity. ∎

Combining (2) and (3) yields the necessary intrinsic-volume condition

```math
\lim_{j\to\infty}\frac{jV_j(K)}{V_{j-1}(K)}\lt V_1(K)
\qquad\text{for every nontrivial GB compact }K.
\tag{5}
```

## Refutation

Fix any $`c>0`$ and put $`a_k=c^k/k!`$. Directly,

```math
\frac{k+1}{k}a_{k-1}a_{k+1}
=\frac{k+1}{k}\frac{c^{2k}}{(k-1)!(k+1)!}
=\frac{c^{2k}}{(k!)^2}
=a_k^2.
```

Hence the sequence satisfies all hypotheses in the conjectured sufficiency direction. Suppose it were the intrinsic-volume sequence of a GB compact $`K`$. Since $`V_1(K)=c>0`$, the set contains two distinct points. But for every $`j\geq1`$,

```math
\frac{jV_j(K)}{V_{j-1}(K)}=c=V_1(K),
```

contradicting (5). Such a $`K`$ does not exist. Therefore Conjecture 3.6 is false.

The counterexample is an entire one-parameter family of infinite positive sequences. No finite-dimensional positive case, numerical search, or assertion about an unspecified limit object is substituted for the source's existence statement.

## What the argument does not claim

We do not claim that all GB compact sets are Gaussian continuous, that their tail Gaussian widths tend to zero, or that their Steiner entire functions have zero exponential type. Those assertions would be false in this generality. We only prove the strict inequality between total expected Gaussian width and maximal deterministic local oscillation.

We also do not prove strictness of every individual ultra-log-concavity inequality. The limiting necessary condition (5) is sufficient for this complete disproof.

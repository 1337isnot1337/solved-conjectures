# Chow's conjecture

This note proves the consecutive-interlacing assertion recorded by Chow. The argument uses the published Savage–Visontai refinement theorem. The exact deduction and the separate strictness argument were independently reviewed in this research session. See [NOVELTY.md](NOVELTY.md) for the bounded priority audit and attribution.

## Statement and conventions

Let $\mathfrak D_n$ be the even-signed permutations of $1,\ldots,n$, and put

```math

 D_n(x)=\sum_{\sigma\in\mathfrak D_n}x^{\operatorname{des}_D(\sigma)},\qquad
 \operatorname{des}_D(\sigma)
 ={\bf1}_{\sigma_1+\sigma_2<0}
  +\#\{1\le i<n:\sigma_i>\sigma_{i+1}\}.

```

These are the ordinary type-D Eulerian polynomials, not derangement polynomials.

Chow's Section 5 asks for consecutive interlacing. If the zeros of $D_n$ are $a_1\le\cdots\le a_n$ and those of $D_{n+1}$ are $b_1\le\cdots\le b_{n+1}$, the assertion is

```math

 b_1\le a_1\le b_2\le a_2\le\cdots\le b_n\le a_n\le b_{n+1}.

```

We obtain strict inequalities for every $n\ge3$; the $n=2$ case is weak because $D_2=(1+x)^2$.

## Published input

Savage and Visontai define polynomials $T_{n,i}$, $0\le i<2n$, whose sum $T_n$ equals $2D_n$ for $n\ge2$. Their Lemma 3.14 gives

```math

 T_{n+1,i}(x)
 =x\sum_{\ell<t_i}T_{n,\ell}(x)+\sum_{\ell=t_i}^{2n-1}T_{n,\ell}(x),
 \qquad
 t_i=\left\lceil\frac{ni}{n+1}\right\rceil.
 \tag{1}

```

The initial row is $(2,2x,2x,2x^2)$.

The proof of their Theorem 3.15 establishes, for every $n\ge4$ and $i<j$, compatibility of both pairs

```math

 (T_{n,i},T_{n,j}),\qquad (xT_{n,i},T_{n,j}).

```

Their Lemma 2.5 therefore says that the row is ordered pairwise interlacing. This is stronger than merely asserting real-rootedness of each summand.

Equation (1) at $i=0$ gives the identity

```math

 T_{n+1,0}=T_n. \tag{2}

```


## Proof of the weak interlacing assertion

Fix $n\ge3$ and use the pairwise interlacing row $T_{n+1,i}$. A first member of an ordered interlacing family interlaces every nonnegative sum of its members. This is Corollary 2.6 of Savage–Visontai, with the first weight vector $(1,0,\ldots,0)$ and the second $(1,\ldots,1)$. Hence

```math

 T_n=T_{n+1,0}\preceq
 \sum_{i=0}^{2n+1}T_{n+1,i}=T_{n+1}.

```

Dividing both polynomials by two gives $D_n\preceq D_{n+1}$.

For $n=2$,

```math

 D_2=(1+x)^2,\qquad
 D_3=(x+1)(x^2+10x+1).

```

The three zeros of $D_3$ are $-5-2\sqrt6,-1,-5+2\sqrt6$, which interlace the double zero $-1$ of $D_2$. This finishes the full all-rank assertion.

## Strictness

We give the additional argument because weak compatibility alone should not be described as strict interlacing.

### Lemma 1: no refined row has a common zero

For every $m\ge2$, the polynomials $T_{m,0},\ldots,T_{m,2m-1}$ have no common complex zero.

Proof. The row $m=2$ includes the nonzero constant 2. In (1), the integer cutoffs $t_i$, for $0\le i\le2n+1$, start at 0, end at $2n$, and increase by either 0 or 1. Thus every cutoff $j=0,\ldots,2n$ occurs. For two entries whose cutoffs are $j$ and $j+1$, their difference is

```math

 (x-1)T_{n,j}(x).

```

If every entry in row $n+1$ vanished at $z\ne1$, every entry of row $n$ would vanish there. Induction excludes that. At $z=1$, all entries are positive by the initial row and (1). Thus $1$ cannot be a common zero either. $\square$

### Lemma 2: strictness of the sum

Suppose $f$ has degree $d$, positive leading coefficient, and simple real zeros $a_1<\cdots<a_d$. Suppose $f\preceq g_j$ for polynomials $g_j$ with positive leading coefficients, each of degree $d$ or $d+1$. At every $a_i$, all nonzero numbers $g_j(a_i)$ have the same sign: they have the sign of $-f'(a_i)$. This follows directly by placing the zeros of $g_j$ around those of $f$.

If the $g_j$ have no common zero, their sum is nonzero at each $a_i$. If that sum has degree $d+1$, the signs at consecutive $a_i$, together with its signs at the two ends of the real line, force a zero in each of the $d+1$ intervening intervals. Consequently the sum has simple roots and is strictly interlaced by $f$.

### Induction

The polynomial $D_3=(x+1)(x^2+10x+1)$ has simple negative zeros. Suppose $D_n$ has simple negative zeros, with $n\ge3$. Set $f=T_n=T_{n+1,0}$ and let $g_j$ run through the row $T_{n+1,j}$. The published ordered interlacing property gives $f\preceq g_j$, and Lemma 1 excludes a common zero. Their sum is $T_{n+1}=2D_{n+1}$, of degree $n+1$. Lemma 2 gives strict interlacing and simplicity. All zeros are negative because the coefficients and constant term of $D_{n+1}$ are positive.

This proves strict consecutive interlacing for every $n\ge3$.

## What the proof does and does not establish about priority

The weak assertion is an immediate consequence of two parts of the 2015 Savage–Visontai paper. Its proof is the same first-entry/sum argument they use for s-Eulerian polynomials in their Theorem 2.7. This is explicitly credited, rather than represented as a new compatibility method.

Chow's 2022 paper nevertheless treats the type-D assertion as supported by computation and requiring further research. The specialist SymCat page dated 19 November 2026 still lists it as open. The literature search found no earlier explicit conclusion resolving the consecutive-interlacing assertion. The proof is a short consequence of established stronger results, and the priority record does not assert that the consequence was unknown to every specialist. The simplicity of individual polynomials was already known; the claimed target is their consecutive interlacing.

## Sources

1. C. D. Savage and M. Visontai, *The s-Eulerian polynomials have only real roots*, Transactions of the American Mathematical Society 367 (2015), 1441–1466. [arXiv:1208.3831v3](https://arxiv.org/abs/1208.3831v3); [full HTML](https://arxiv.org/html/1208.3831v3). Lemmas 2.5, 3.9, 3.14; Corollary 2.6; Theorem 2.7; proof of Theorem 3.15.
2. C.-O. Chow, *New proofs of interlacing of zeros of Eulerian polynomials*, Journal of Mathematical Analysis and Applications 510 (2022), 126019. [DOI](https://doi.org/10.1016/j.jmaa.2022.126019). Section 2 defines weak interlacing; Section 5 states the type-D question. [Author-uploaded full text](https://www.researchgate.net/publication/358198956_New_proofs_of_interlacing_of_zeros_of_Eulerian_polynomials).
3. P. Alexandersson, [Real-rooted polynomials: open problems](https://www.symmetricfunctions.com/realRootedOpenProblems.htm), page dated 19 November 2026, checked 20 November 2026.
4. S.-M. Ma, *The half interlacing property among the types A, B and D Eulerian polynomials*, [arXiv:2608.02357](https://arxiv.org/abs/2608.02357). Its within-rank assertion is different from consecutive type-D interlacing.

5. A. L. B. Yang and P. B. Zhang, *Descent generating polynomials and the Hermite–Biehler theorem*, Journal of Algebraic Combinatorics (2021/2022), [DOI](https://doi.org/10.1007/s10801-021-01101-2); [author PDF](https://zhangbiaomath.github.io/papers/2022-jaco-Eulerian.pdf). Theorem 2.5 and equation (11) explicitly restate the two published ingredients used here.

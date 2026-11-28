# Fang–Zhang–Zhao's Sturm conjecture

> Priority correction, 21 November 2026: this target was already proved in [TT issue 18758](https://github.com/the-omega-institute/trureturing/issues/18758). The following independent argument or earlier search record is retained for provenance, not counted as a new resolution. See [the scope audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md).

Complete proposed proof, 21 November 2026. Two independent internal mathematical reviews found no gap. The [priority audit](NOVELTY.md) records the sources checked and access limits. This work is unrefereed.

## Statement

For a real parameter `q>1` and an integer `m>=2`, the polynomials

```math
H_n^{[m]}(q,t)=\sum_{k+l=n-1}q^{m\binom{k+1}{2}}\mathop{\mathrm{PP}}(k,l,m;q)t^k
```

have simple negative roots and strictly interlace as `n` increases. Here `PP(k,l,m;q)` is the volume generating polynomial of plane partitions in a `k` by `l` by `m` box. The case `q=1` is Theorem 1.2 of Fang–Zhang–Zhao (2025). Thus this would prove their Conjecture 4.1, which asks for positive integral `q` and `m=2,3`, and a stronger real-parameter, all-`m` statement.

Source: H. Fang, C. X. T. Zhang, J. J. Y. Zhao, *Analytic properties arising from the Baxter numbers*, arXiv:2505.05873v1, Section 4. Original full text: https://arxiv.org/html/2505.05873v1 .

## Notation

Write `[r]_q=(q^r-1)/(q-1)`, `[r]_q!=product_{i=1}^r[i]_q`, and use the usual Gaussian binomial coefficients. Let

```math
b_{N,k}=q^{\binom{k+1}{2}}{N\brack k}_q,
\qquad B_N(t)=\sum_k b_{N,k}t^k=\prod_{i=1}^N(1+q^it).
```

A polynomial with positive constant term and negative roots of magnitudes `0<r_1<...<r_d` is strictly `q`-separated if `q r_i<r_{i+1}` for every `i`. Weak separation permits equality.

For positive-leading-coefficient polynomials with only negative roots, `f≼g` denotes the interlacing/alternating-left convention in Fang–Zhang–Zhao, Section 1. This includes `f≼f`. Positive constants interlace positive linear polynomials in the usual empty-root convention.

The Hadamard product is coefficientwise multiplication, written `f*g`.

## Inputs from the existing paper

We use Garloff–Wagner's Hadamard theorem exactly as quoted in Fang–Zhang–Zhao, Theorem 2.1 and Corollary 2.1:

1. A nonzero Hadamard product of two polynomials with positive leading coefficients and only nonpositive roots has only nonpositive roots, simple except possibly at zero.
2. If `f≼g` and `p≼r`, then `f*p≼g*r`.
3. In the same situation the two products have no common nonzero root unless the two input pairs are both proportional, or both related by multiplication by `t` and a positive constant.
4. In particular, if both input pairs have degrees differing by one, have only negative roots and interlace, their Hadamard products strictly interlace.

This is prior mathematics, not a new claim. The original reference is J. Garloff and D. G. Wagner, *Hadamard products of stable polynomials are stable*, J. Math. Anal. Appl. 202 (1996), 797–809, Theorem 4. Primary PDF: https://www-home.htwg-konstanz.de/~garloff/Garloff_Wagner_Hadamard_Products.pdf .

## Lemma 1: strict separation supplied by a geometric factor

Let `f` be nonzero with positive constant and leading coefficients and only negative roots. If `deg f<=N`, then `G=B_N*f` either is a positive constant or has strictly `q`-separated negative roots.

Proof. The roots of `B_N` are exactly `-q^{-1},...,-q^{-N}`. Therefore `B_N(t)≼B_N(qt)`. Also `f≼f`. Garloff–Wagner gives

```math
G(t)\preceq G(qt).
```

The constants of both products are positive. Neither input pair has the simultaneous exceptional proportionality in part 3: for `N>=1`, `B_N(qt)` is not proportional to `B_N(t)`, and cannot be a constant multiple of `t B_N(t)` because both constants are nonzero. Thus `G(t)` and `G(qt)` have no common root. The interlacing is strict whenever `deg G>=1`.

For negative roots with magnitudes `r_1<...<r_d`, the strict alternating-left relation `G(t)≺G(qt)` says precisely `q r_i<r_{i+1}`. The case `deg G=0` is empty. QED.

## Lemma 2: a Jackson version of Markov interlacing

Let `q>1`. Let `g` have degree `d>=2`, positive constant and leading coefficients, and strictly `q`-separated negative roots. Let `f` have degree `d-1`, positive leading coefficient, and strictly interlace `g`. Then the Jackson derivatives

```math
D_q p(t)=\frac{p(qt)-p(t)}{(q-1)t}
```

have only negative simple roots and `D_q f` strictly interlaces `D_q g`. If `d=2`, `D_q f` is a positive constant and the statement uses the empty-root convention.

Proof. Write the roots of `g` as `-r_i`, with `0<r_1<...<r_d` and `q r_i<r_{i+1}`. At the two endpoints `y=r_i` and `y=r_{i+1}/q`, the expression

```math
D_qg(-y)=\frac{g(-qy)-g(-y)}{-(q-1)y}
```

has opposite nonzero signs: the first endpoint has sign `(-1)^{i+1}`, and the second has sign `(-1)^i`. Hence it has a root `x_i=-y_i` in each interval

```math
r_i\lt y_i\lt r_{i+1}/q, \qquad i=1,\ldots,d-1.
```

Its degree is `d-1`, so these are all its roots, and they are simple. In particular, the closed interval `[qx_i,x_i]` contains no root of `g`, and `g(qx_i)=g(x_i)≠0`.

Strict interlacing with positive leading coefficients gives the partial-fraction expansion

```math
R(t)=\frac{f(t)}{g(t)}=\sum_{j=1}^d\frac{c_j}{t+r_j},
\qquad c_j=\frac{f(-r_j)}{g'(-r_j)}>0.
```

Thus `R'(t)<0` on every interval avoiding poles. Since `qx_i<x_i`, we have `R(qx_i)>R(x_i)`. Consequently,

```math
D_q f(x_i)=g(x_i)\frac{R(qx_i)-R(x_i)}{(q-1)x_i}
```

has sign opposite to `g(x_i)`. Since `r_i<y_i<r_{i+1}`, the sign of `g(x_i)` is `(-1)^i` (its constant is positive), so the sign of `D_q f(x_i)` is `(-1)^{i+1}`. These signs alternate. The degree of `D_q f` is `d-2`, and its leading coefficient is positive. It therefore has exactly one simple root between each consecutive pair of roots of `D_qg`, proving strict interlacing. QED.

Only the strict, adjacent-degree version is needed below. No general unrestricted real-root-preserver claim is being made for `D_q`.

## The inductive family

For `N>=m-1`, define

```math
F_{N,m}(t)=\sum_{k=0}^{N-m+1}\left(\prod_{i=0}^{m-1}b_{N,k+i}\right)t^k.
```

Its degree is `N-m+1`; all coefficients are positive. For `m=1`, `F_{N,1}=B_N`, and `B_{N-1}≼B_N` because their zeros are nested.

Suppose the sequence `F_{N,m-1}` is real-rooted and consecutive rows interlace, allowing the weak base case `m-1=1`. Define, for `N>=m-1`,

```math
G_{N,m}=B_N*F_{N-1,m-1}.
```

Each has degree `N-m+1`. Both input sequences have adjacent degrees and consecutive interlacing. Garloff–Wagner Corollary 2.1 therefore gives strict consecutive interlacing

```math
G_{N,m}\prec G_{N+1,m}.
```

Lemma 1 gives strict `q`-separation of each nonconstant `G_{N,m}`.

The elementary Gaussian-binomial identity

```math
[k]_q b_{N,k}=q^k[N]_q b_{N-1,k-1}
```

implies, by direct coefficient comparison,

```math
D_qG_{N,m}(t)=q[N]_q F_{N-1,m}(qt).
```

Indeed, the coefficient of `t^k` on the left is

```math
[k+1]_q b_{N,k+1}\prod_{i=0}^{m-2}b_{N-1,k+1+i}
=q^{k+1}[N]_q\prod_{i=0}^{m-1}b_{N-1,k+i}.
```

For `N>=m`, apply Lemma 2 to `G_{N,m}` and `G_{N+1,m}`. It follows that

```math
F_{N-1,m}(qt)\prec F_{N,m}(qt),
```

and hence `F_{N-1,m}≺F_{N,m}`. This proves the induction for every integer `m>=2`. Each family begins with the positive constant `F_{m-1,m}`.

## Transfer to Hoggatt polynomials

Put `d=N-m+1`, so the Hoggatt index is `n=d+1=N-m+2`. MacMahon's product formula gives

```math
\mathop{\mathrm{PP}}(k,d-k,m;q)
=\frac{\prod_{i=0}^{m-1}{N\brack k+i}_q}
{\prod_{j=1}^{m-1}{N\brack j}_q}.
```

Also

```math
\sum_{i=0}^{m-1}\binom{k+i+1}{2}
=m\binom{k+1}{2}+\binom m2 k+\binom{m+1}{3}.
```

It follows that

```math
F_{N,m}(t)
=q^{\binom{m+1}{3}}\left(\prod_{j=1}^{m-1}{N\brack j}_q\right)
H_{N-m+2}^{[m]}\left(q,q^{\binom m2}t\right).
```

The multiplicative prefactor is positive. The change of variable is independent of `N`. Therefore the strict interlacing and negative simple roots transfer directly to the `H_n^{[m]}` sequence.

Together with the source's already proved `q=1` theorem, this gives all positive integer `q` and all integer `m>=2`.

## Review points

- Check that the quoted Garloff–Wagner non-common-root criterion permits the identical pair `f,f` in Lemma 1; only simultaneous proportionality of both pairs is excluded in the original formulation.
- Check the `q`-separation orientation in Lemma 1.
- Check signs at the endpoints and poles in Lemma 2.
- Check the Gaussian-binomial weighting and the `N`-independent Hoggatt argument scale.
- Check priority against the November 2026 `q`-Narayana preprint, which reportedly retains the original unscaled adjacent-index question as separate.

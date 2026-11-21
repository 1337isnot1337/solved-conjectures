# Karp–Vishnyakova–Zhang's conjecture

## Statement and scope

D. Karp, A. Vishnyakova and Y. Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, Results in Mathematics **80** (2025), 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4), Section 3, Example 8, [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), conjecture that the kernel

```math
K_q(x,y)=\frac1{\Gamma_q(x+y)},\qquad 0<q<1,
```

is strictly sign regular of all orders on the positive quadrant. Here

```math
\Gamma_q(z)=\frac{(1-q)^{1-z}(q;q)_\infty}{(q^z;q)_\infty},
\qquad
(a;q)_n=\prod_{j=0}^{n-1}(1-aq^j).
```

Their Definition 2.1 means that each order has one fixed, nonzero determinant sign for every pair of strictly increasing node lists. We prove the full statement, with its signature identified explicitly.

**Theorem.** For every integer $`r\ge1`$, every $`0<q<1`$, and every two lists

```math
0<x_1<\cdots<x_r,\qquad 0<y_1<\cdots<y_r,
```

one has

```math
(-1)^{r(r-1)/2}
\det\left[\frac1{\Gamma_q(x_i+y_j)}\right]_{i,j=1}^{r}>0.
```

The proof uses finite Cauchy–Binet identities and two classical convergent series. It does not assume that entrywise products preserve sign regularity.

## 1. A generalized Vandermonde lemma

For positive nodes $`0<t_1<\cdots<t_r`$ and integers $`0\le k_1<\cdots<k_r`$,

```math
\det[t_i^{k_j}]_{i,j=1}^r>0. \tag{1}
```

For completeness, a nonzero linear combination of $`r`$ distinct nonnegative integer powers has at most $`r-1`$ positive zeros. This follows by induction: divide out its smallest power, differentiate, and apply Rolle's theorem to the remaining at most $`r-1`$ powers. Thus the determinant in (1) never vanishes. Its sign is constant on the connected region of ordered positive nodes. To determine that sign, coalesce the nodes near a fixed positive $`t`$. The corresponding Wronskian is

```math
\det\left[\frac{d^{i-1}}{dt^{i-1}}t^{k_j}\right]_{i,j=1}^{r}
=t^{\sum_jk_j-r(r-1)/2}\prod_{1\le i<j\le r}(k_j-k_i)>0.
```

Taylor expansion of the rows gives the sign in (1), since the node Vandermonde and the factorial divisors in that expansion are positive.

Consequently, if $`0\le k_1<\cdots<k_r`$ and $`0\le n_1<\cdots<n_r`$, then

```math
\varepsilon_r\det[q^{k_i n_j}]_{i,j=1}^{r}>0,
\qquad \varepsilon_r=(-1)^{r(r-1)/2}. \tag{2}
```

Indeed, the nodes $`q^{k_i}`$ are strictly decreasing; reversing the rows puts them in increasing order and has sign $`\varepsilon_r`$.

## 2. A positive double-series factorization

Put

```math
P_q(z)=(z;q)_\infty,\qquad d_n=(q;q)_n.
```

For $`0<u,v<1`$ we claim

```math
\frac{P_q(uv)}{P_q(u)P_q(v)}
=\sum_{k,n\ge0}\frac{q^{kn}u^k v^n}{d_kd_n}. \tag{3}
```

The two series identities used here are Euler's first sum and the $`q`$-binomial series:

```math
\sum_{k=0}^{\infty}\frac{z^k}{(q;q)_k}
=\frac1{(z;q)_\infty},
\qquad
\sum_{n=0}^{\infty}\frac{(a;q)_n}{(q;q)_n}z^n
=\frac{(az;q)_\infty}{(z;q)_\infty},
\quad |z|<1. \tag{4}
```

These are [DLMF 17.5.4](https://dlmf.nist.gov/17.5.E4) and [DLMF 17.5.2](https://dlmf.nist.gov/17.5.E2). Summing first in $`k`$ gives

```math
\begin{aligned}
\sum_{k,n\ge0}\frac{q^{kn}u^k v^n}{d_kd_n}
&=\sum_{n\ge0}\frac{v^n}{d_nP_q(uq^n)}\\
&=\frac1{P_q(u)}\sum_{n\ge0}\frac{(u;q)_n}{d_n}v^n\\
&=\frac{P_q(uv)}{P_q(u)P_q(v)}.
\end{aligned}
```

All summands are positive. Also $`d_n\ge(q;q)_\infty>0`$, so the double series is bounded above by

```math
\frac1{(q;q)_\infty^2(1-u)(1-v)}.
```

This proves absolute convergence and justifies the iterated summation; it also proves locally uniform convergence on $`(0,1)^2`$.

## 3. Every minor has the required strict sign

Write the right side of (3) as $`S_q(u,v)`$ and truncate both indices:

```math
S_{q,N}(u,v)=\sum_{k,n=0}^{N}\frac{q^{kn}u^k v^n}{d_kd_n}.
```

Fix ordered nodes $`0<u_1<\cdots<u_r<1`$ and $`0<v_1<\cdots<v_r<1`$. The matrix with entries $`S_{q,N}(u_i,v_j)`$ factors as

```math
A_N C_N B_N,
\quad
(A_N)_{ik}=\frac{u_i^k}{d_k},
\quad (C_N)_{kn}=q^{kn},
\quad (B_N)_{nj}=\frac{v_j^n}{d_n},
\qquad 0\le k,n\le N.
```

For $`N\ge r-1`$, applying the finite Cauchy–Binet formula twice gives

```math
\det[S_{q,N}(u_i,v_j)]
=\sum_{\substack{I,J\subseteq\{0,\ldots,N\}\\|I|=|J|=r}}
\det A_N[:,I]\,\det C_N[I,J]\,\det B_N[J,:]. \tag{5}
```

The index sets in (5) are listed in increasing order. Every minor of $`A_N`$ or $`B_N`$ occurring here is strictly positive by (1), transpose invariance, and the positivity of $`d_n`$. Every middle minor has sign $`\varepsilon_r`$ by (2). Thus every term in (5) has that same strict sign.

The term with $`I=J=\{0,\ldots,r-1\}`$ is independent of $`N`$ and has strictly positive magnitude $`c`$. Therefore, for all $`N\ge r-1`$,

```math
\varepsilon_r\det[S_{q,N}(u_i,v_j)]\ge c>0. \tag{6}
```

Entrywise convergence and continuity of the finite determinant now imply

```math
\varepsilon_r\det[S_q(u_i,v_j)]\ge c>0. \tag{7}
```

This fixed-term bound is what preserves strictness in the infinite limit. A limit of positive determinants alone would only imply a nonnegative result.

Equation (3) says that $`P_q(u_iv_j)`$ is obtained from $`S_q(u_i,v_j)`$ by multiplying row $`i`$ by $`P_q(u_i)>0`$ and column $`j`$ by $`P_q(v_j)>0`$. Hence

```math
\varepsilon_r\det[P_q(u_iv_j)]_{i,j=1}^{r}>0. \tag{8}
```

## 4. Return to the reciprocal q-gamma kernel

Set $`u_i=q^{x_i}`$ and $`v_j=q^{y_j}`$. Both node lists are strictly decreasing. Reversing both the rows and the columns multiplies the determinant by $`\varepsilon_r^2=1`$, so (8) retains its sign for these nodes.

Finally, the defining product [DLMF 5.18.4](https://dlmf.nist.gov/5.18.E4) gives

```math
\frac1{\Gamma_q(x_i+y_j)}
=\frac{(1-q)^{x_i}(1-q)^{y_j}}{(1-q)(q;q)_\infty}
P_q(u_iv_j).
```

Every additional factor is a positive row factor, column factor, or common scalar. Consequently its determinant has the same strict sign as (8). This proves the theorem.

## Consequence for the discrete reciprocal kernel

The recurrence for $`\Gamma_q`$ gives

```math
\frac1{(q^x;q)_n}
=\frac{\Gamma_q(x)}{(1-q)^n\Gamma_q(x+n)}.
```

Thus the discrete kernel $`(x,n)\mapsto1/(q^x;q)_n`$ is also strictly sign regular of all orders on $`(0,\infty)\times\mathbb N_0`$, with the same signature. To include $`n=0`$ without a boundary argument, choose, for any finite node list, $`0<\delta<\min_i x_i`$ and apply the theorem to $`x_i-\delta`$ and $`n_j+\delta`$. The remaining factors are positive. This strengthens the source's order-three lemma, but is a consequence of the same conjecture and is not counted as a separate resolution.

## Independent interpretation

The factorization is also visible in the Jackson beta integral [DLMF 5.18.11–12](https://dlmf.nist.gov/5.18#iii):

```math
\frac{\Gamma_q(x)\Gamma_q(y)}{\Gamma_q(x+y)}
=\int_0^1 t^{x-1}\frac{(qt;q)_\infty}{(q^y t;q)_\infty}\,d_qt.
```

The kernel $`t^{x-1}`$ has positive minors, while the expansion of $`1/(q^y t;q)_\infty`$ factors it into a positive monomial kernel and a reversed monomial kernel. The proof above spells this composition out with finite matrices, so no unproved infinite composition or strictness assertion is needed.

## Status

This is a complete ordinary mathematical proof of the source's full $`0<q<1`$ conjecture, independently reviewed by the root agent; the bounded priority audit is in [SOURCES.md](SOURCES.md). No numerical checks or formal verification are premises. No assertion about $`q>1`$ is needed or made. The argument remains unrefereed; independent internal review is not outside peer review.

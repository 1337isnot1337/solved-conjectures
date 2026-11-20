# Karp–Vishnyakova–Zhang's reciprocal q-gamma conjecture

Status: previously resolved. [Knowledge Sense, 13 October 2026](https://github.com/KnowledgeSense/math/blob/b95a52a54597e8b01c1a28486f2a9b29a3a54c58/preprints/Strict-Sign-Regularity-of-the-Reciprocal-Jackson-q-Gamma-Kernel-October-13-2026/build/source/strict-sign-regularity-of-the-reciprocal-jackson-q-gamma-kernel.tex), already proves the exact reciprocal Jackson q-gamma conjecture for every order and every admissible grid. This independently developed proof is retained as exposition and is excluded from new-resolution claims. See [the corrected prior-work audit](../../results/kvz-reciprocal-qgamma/NOVELTY.md).

## Statement and source

Fix $0\lt q\lt1$. For $z>0$, write

```math
\Gamma_q(z)=(1-q)^{1-z}\frac{(q;q)_\infty}{(q^z;q)_\infty},
\qquad
(a;q)_k=\prod_{j=0}^{k-1}(1-aq^j),
\qquad (a;q)_0=1.
```

The infinite product has its usual meaning. In the ranges used below, every factor is positive, the product converges, and its limit is positive.

Karp, Vishnyakova, and Zhang conjecture in Section 3, item 8 of *Unimodality preservation by ratios of functional series and integral transforms* that the kernel $1/\Gamma_q(x+y)$ is strictly sign regular of every order on $(0,\infty)^2$. The source is [arXiv:2408.01755v2](https://arxiv.org/abs/2408.01755v2), page 7; the published paper is Results in Mathematics 80 (2025), article 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4).

We prove the following exact signature, in the full domain of the conjecture.

**Theorem.** For every integer $r\geq1$, every $0\lt x_1\lt\cdots\lt x_r$, and every $0\lt y_1\lt\cdots\lt y_r$,

```math
(-1)^{\binom r2}
\det\left[\frac1{\Gamma_q(x_i+y_j)}\right]_{i,j=1}^r>0. \tag{1}
```

The proof uses two positive series expansions and finite Cauchy–Binet identities. The strict total positivity of the positive gamma kernel is already known and is not claimed as a new result. We include its short series argument in the form needed here, including the integer endpoint zero.

## 1. Two classical elementary facts

### Exponential determinants

If $u_1\lt\cdots\lt u_r$ and $v_1\lt\cdots\lt v_r$ are real, then

```math
\det[e^{u_i v_j}]_{i,j=1}^r>0. \tag{2}
```

Here is a self-contained justification. A nonzero linear combination of $r$ exponentials with distinct real exponents has at most $r-1$ distinct real zeros. Induct on $r$: divide the combination by its first exponential and differentiate. Rolle's theorem reduces the claim to a combination of at most $r-1$ exponentials. If the derivative is identically zero, the original divided combination is a nonzero constant and has no zeros. Therefore the determinant in (2) cannot vanish.

For fixed $u_1,\ldots,u_r$, its sign is constant on the connected domain of increasing $v$-tuples. To determine the sign, put $v_j=\varepsilon(j-1)$ and let $\varepsilon\downarrow0$. Taylor expansion gives the leading term

```math
\varepsilon^{\binom r2}
\frac{\displaystyle\prod_{i<j}(u_j-u_i)
      \prod_{i<j}(j-i)}{\displaystyle\prod_{j=0}^{r-1}j!}>0.
```

This proves (2). In particular, when $t_1\lt\cdots\lt t_r$ and $0\leq k_1\lt\cdots\lt k_r$,

```math
(-1)^{\binom r2}\det[q^{t_i k_j}]_{i,j=1}^r>0, \tag{3}
```

because $k_j\log q$ is decreasing and reversing its order requires $\binom r2$ column transpositions.

### The q-binomial series

For $0\leq a\lt1$ and $0\leq z\lt1$,

```math
\sum_{k=0}^{\infty}\frac{(a;q)_k}{(q;q)_k}z^k
=\frac{(az;q)_\infty}{(z;q)_\infty}. \tag{4}
```

This is the classical q-binomial series, [DLMF 17.5.2](https://dlmf.nist.gov/17.5.E2). To verify it directly, write the sum as $F_a(z)$. Its coefficients are bounded by $1/(q;q)_\infty$, so the series converges absolutely for $|z|\lt1$. The coefficient recurrence gives

```math
(1-z)F_a(z)=(1-az)F_a(qz).
```

Iterate this equation and use $F_a(q^N z)\to F_a(0)=1$. The resulting products converge to the quotient in (4). Taking $a=0$ yields

```math
\frac1{(z;q)_\infty}
=\sum_{\ell=0}^{\infty}\frac{z^\ell}{(q;q)_\ell}. \tag{5}
```

The product convergence and positivity follow, for example, from the convergence of $\sum_{j\geq0}zq^j$ and the logarithmic expansion of $\log(1-zq^j)$ after finitely many initial factors.

## 2. Strict total positivity of the q-Pochhammer kernel

For $a\geq0$ and $b>0$, set

```math
H(a,b)=\frac1{(q^{a+b};q)_\infty}
=\sum_{\ell=0}^{\infty}
\frac{q^{a\ell}q^{b\ell}}{(q;q)_\ell}. \tag{6}
```

The series converges since $a+b>0$ and $(q;q)_\ell\geq(q;q)_\infty>0$.

Let $0\leq a_1\lt\cdots\lt a_r$ and $0\lt b_1\lt\cdots\lt b_r$. Truncate the sum in (6) at $\ell=N$. Finite Cauchy–Binet gives

```math
\begin{aligned}
\det[H_N(a_i,b_j)]_{i,j=1}^r
=\sum_{0\leq\ell_1<\cdots<\ell_r\leq N}
\frac{
 \det[q^{a_i\ell_j}]_{i,j=1}^r
 \det[q^{b_i\ell_j}]_{i,j=1}^r
}{\prod_{j=1}^r(q;q)_{\ell_j}}. \tag{7}
\end{aligned}
```

Both determinants in each summand have sign $(-1)^{\binom r2}$ by (3), so every summand is strictly positive. Once $N\geq r-1$, the term $\ell_j=j-1$ occurs and is a fixed positive lower bound for the determinant. Entrywise convergence $H_N\to H$ and continuity of the finite determinant therefore imply

```math
\det[H(a_i,b_j)]_{i,j=1}^r>0. \tag{8}
```

This proof includes $a_1=0$; no limiting strictness assertion at zero is needed.

For each integer $k\geq0$ and $y>0$,

```math
(q^y;q)_k=(q^y;q)_\infty H(k,y). \tag{9}
```

The factor $(q^y;q)_\infty$ is positive and depends only on the column variable. Thus (8) implies

```math
\det[(q^{y_j};q)_{k_i}]_{i,j=1}^r>0 \tag{10}
```

for every $0\leq k_1\lt\cdots\lt k_r$ and every $0\lt y_1\lt\cdots\lt y_r$.

The same argument proves the already-known strict total positivity of $\Gamma_q(a+b)$: it differs from $H(a,b)$ by positive row and column factors. Here it is used as an ingredient, with a proof supplied, rather than counted as another resolution.

## 3. Compose with the exponential kernel

Apply (4) with $a=q^y$ and $z=q^x$, where $x,y>0$:

```math
J(x,y):=\sum_{k=0}^{\infty}
q^{kx}\frac{(q^y;q)_k}{(q;q)_k}
=\frac{(q^{x+y};q)_\infty}{(q^x;q)_\infty}. \tag{11}
```

Every entry converges absolutely, since $0\lt(q^y;q)_k\leq1$ and its summand is bounded by $q^{kx}/(q;q)_\infty$.

Let $J_N$ be the partial sum through $k=N$. A second finite Cauchy–Binet identity gives

```math
\begin{aligned}
\det[J_N(x_i,y_j)]_{i,j=1}^r
=\sum_{0\leq k_1<\cdots<k_r\leq N}
\frac{
 \det[q^{x_i k_j}]_{i,j=1}^r
 \det[(q^{y_j};q)_{k_i}]_{i,j=1}^r
}{\prod_{j=1}^r(q;q)_{k_j}}. \tag{12}
\end{aligned}
```

The first determinant in each summand has sign $(-1)^{\binom r2}$ by (3). The second is positive by (10). Consequently every summand in (12) has the same strict sign.

For $N\geq r-1$, the summand $k_j=j-1$ is already strictly signed and is independent of $N$. After multiplying (12) by $(-1)^{\binom r2}$, the result is a nondecreasing sequence of positive real numbers bounded below by that fixed summand. Entrywise convergence $J_N\to J$ therefore gives

```math
(-1)^{\binom r2}\det[J(x_i,y_j)]_{i,j=1}^r>0. \tag{13}
```

No exchange between an unproved infinite determinant expansion and a limit is used: both Cauchy–Binet formulas are finite, and the passage to the limit uses continuity of an $r\times r$ determinant.

Finally, the definition of $\Gamma_q$ and (11) give the exact identity

```math
\frac1{\Gamma_q(x+y)}
=\frac{(1-q)^y}{\Gamma_q(x)}J(x,y). \tag{14}
```

The factor $1/\Gamma_q(x)$ is a positive row factor, and $(1-q)^y$ is a positive column factor. Equation (13) now proves (1). This establishes the full reciprocal q-gamma conjecture. ∎

## 4. An explicit strict lower bound

The fixed summand used above can be evaluated. Put $t_i=q^{x_i}$ and $s_i=q^{y_i}$; both sequences are strictly decreasing. For $k=0,\ldots,r-1$, the polynomial $(s;q)_k$ has leading coefficient $(-1)^kq^{\binom k2}$. Therefore

```math
\det[(q^{y_j};q)_{i-1}]_{i,j=1}^r
=q^{\binom r3}\prod_{i<j}(s_i-s_j).
```

The consecutive-power exponential determinant gives the other Vandermonde factor. Thus the proof also yields

```math
\begin{aligned}
&(-1)^{\binom r2}
\det\left[\frac1{\Gamma_q(x_i+y_j)}\right]_{i,j=1}^r\\
&\quad\geq
\left(\prod_{i=1}^r\frac1{\Gamma_q(x_i)}\right)
(1-q)^{\sum_{j=1}^r y_j}
\frac{q^{\binom r3}}{\prod_{k=0}^{r-1}(q;q)_k}
\prod_{i<j}(q^{x_i}-q^{x_j})
\prod_{i<j}(q^{y_i}-q^{y_j})>0. \tag{15}
\end{aligned}
```

The bound is not needed for the sign conclusion. It records a specific finite contribution that prevents strictness from being lost in the infinite-series limit.

## Scope and attribution

The exponential determinant sign, q-binomial series, and Cauchy–Binet identity are classical. The positive $\Gamma_q$ Hankel kernel was already treated by Salazar, [arXiv:2606.31647v2](https://arxiv.org/abs/2606.31647v2), whose stated scope explicitly excludes the reciprocal problem. Our result is the complete reciprocal-kernel assertion, with all determinant sizes and all ordered positive real arguments.

The parent agent proposed a q-beta composition and an independent Newton-polynomial route to the q-Pochhammer positivity input. The analysis agent checked the composition, replaced that input by the direct atomic expansion in Section 2, and wrote this proof. No numerical check is used as a proof step. The ordinary gamma analogue is not counted as a separate new resolution.

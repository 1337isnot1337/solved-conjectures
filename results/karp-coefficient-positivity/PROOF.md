# Karp's coefficient-positivity conjecture

Status: previously resolved. [Principia Math In Progress, MathDB 323156](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-323156/mathdb-323156-solution.tex), dated 11 September 2026, already proves the exact full conjecture. This independently developed proof is retained as exposition and is excluded from new-resolution claims. See [the corrected prior-work audit](NOVELTY.md).

## Statement and attribution

The source is D. Karp, *Positivity of Toeplitz determinants formed by rising factorial series and properties of related polynomials*, [arXiv:1203.1482v1](https://arxiv.org/abs/1203.1482v1), Section 1, equation (3) and Conjecture 1, page 2. The journal version is Journal of Mathematical Sciences 193(1) (2013), 106–114, DOI [10.1007/s10958-013-1438-y](https://doi.org/10.1007/s10958-013-1438-y).

The primary paper attributes the conjecture to Karp. Karp–Sitnik is the attribution of the earlier theorem proving nonnegativity at real nonnegative arguments. The stronger assertion here concerns every individual coefficient.

Write $(x)_0=1$ and $(x)_k=x(x+1)\cdots(x+k-1)$ for $k\geq1$.

**Theorem.** Suppose $n\geq3$, $\alpha,\beta>0$, and $f_0,\ldots,f_n$ are nonnegative real numbers satisfying

```math
f_k^2>f_{k-1}f_{k+1},\qquad 1\leq k\leq n-1.
```

Then

```math
Q_n^{\alpha,\beta}(x)
=\sum_{k=0}^n f_kf_{n-k}\binom nk
\left[(x+\alpha)_k(x+\beta)_{n-k}
 -(x+\alpha+\beta)_k(x)_{n-k}\right] \tag{1}
```

has degree $n-2$ and strictly positive coefficients at every $x^j$, $0\leq j\leq n-2$.

The proof applies to every positive pair of shifts and every sequence under the source's hypotheses. It does not assume the stronger Pólya-frequency condition or a restriction to unit shifts. It makes no assertion about Hurwitz stability or real-rootedness.

## 1. An elementary order-two positivity fact for Stirling numbers

Let $c(n,j)$ be the unsigned Stirling number of the first kind, the number of permutations of $[n]$ with $j$ cycles. Set $c(0,0)=1$ and $c(n,j)=0$ outside $0\leq j\leq n$. Thus

```math
(u)_n=\sum_{j=0}^n c(n,j)u^j,
\qquad
c(n+1,j)=n\,c(n,j)+c(n,j-1). \tag{2}
```

**Lemma 1.** If $0\leq a\lt b$ and $0\leq i\leq j$, then

```math
c(a,i)c(b,j)-c(a,j)c(b,i)\geq0. \tag{3}
```

**Proof.** Each row $c(n,\cdot)$ is log-concave and has no internal zeros. Here is a short proof of the needed log-concavity. If a nonnegative sequence $t$ has these properties, so does $b_k=N t_k+t_{k-1}$ for $N>0$. Indeed,

```math
b_k^2-b_{k-1}b_{k+1}
=N^2(t_k^2-t_{k-1}t_{k+1})
 +(t_{k-1}^2-t_{k-2}t_k)
 +N(t_{k-1}t_k-t_{k-2}t_{k+1})\geq0.
```

The last inequality follows from the decreasing successive ratios of the nonzero entries of $t$; boundary zeros cause no problem. The support remains an interval. Starting with $c(1,1)=1$, recurrence (2) proves the claim about every row.

For $1\leq i\lt j\leq h$, log-concavity of row $h$ gives

```math
\begin{aligned}
&c(h,i)c(h+1,j)-c(h,j)c(h+1,i)\\
&\qquad=c(h,i)c(h,j-1)-c(h,j)c(h,i-1)\geq0.
\end{aligned}
```

Consequently $c(h,j)/c(h,i)$ is nondecreasing in $h\geq j$. Iterating from $h=a$ to $h=b$ proves (3) when $1\leq i\lt j\leq a$.

The remaining cases follow directly from the zero convention. If $i=j$, the minor is zero. If $j>a$, its second product is zero. If $i=0$ and $a>0$, both entries in column zero are zero. If $a=i=0\lt j$, the minor equals $c(b,j)$. This covers all cases. ∎

This order-two positivity is classical. The proof is included to make the argument independent of any general total-positivity theorem.

## 2. Symmetric truncated Vandermonde sums

For $1\leq m\leq\lfloor n/2\rfloor$, put

```math
S_{n,m}(u,v)
=\sum_{k=m}^{n-m}\binom nk (u)_k(v)_{n-k}. \tag{4}
```

This polynomial is symmetric in $u,v$. Let its homogeneous part of total degree $d$ be

```math
P_d(u,v)=\sum_{i=0}^d a_i u^iv^{d-i},
\qquad
a_i=\sum_{k=m}^{n-m}\binom nk c(k,i)c(n-k,d-i). \tag{5}
```

The dependence of $a_i$ and $P_d$ on $n,m$ is suppressed. There are no nonzero terms of degree below 2, because both factors in every summand of (4) are divisible by their arguments. Symmetry gives $a_i=a_{d-i}$.

**Lemma 2.** For $0\leq i\lt d/2$,

```math
(i+1)a_{i+1}-(d-i)a_i\geq0. \tag{6}
```

Equivalently, $a_i/\binom di$ is nondecreasing up to the middle of its symmetric sequence.

**Proof.** The coefficient $a_i$ counts permutations of $[n]$ with $d$ cycles colored red or blue, exactly $i$ red cycles, and between $m$ and $n-m$ vertices in red cycles.

Consider the difference on the left of (6). Its positive term counts such permutations with $i+1$ red cycles and one distinguished red cycle. Its negative term counts such permutations with $i$ red cycles and one distinguished blue cycle. Change only the color of the distinguished cycle. If both colorings satisfy the vertex-count restriction, this operation pairs the two objects and cancels their contributions.

Write $\ell\geq1$ for the length of the distinguished cycle. In an unpaired positive object, let $a$ be the number of vertices in the other red cycles and $b$ the number in the blue cycles. The original red size is $a+\ell=n-b$, so admissibility says $m\leq b\leq n-m$. After changing the distinguished cycle to blue, the red size becomes $a$. Since $a\lt a+\ell\leq n-m$, failure of admissibility is exactly $a\lt m$.

The negative unpaired objects have the same description after exchanging $a$ and $b$. Put $j=d-i-1$. Choosing the label sets, then the permutations on them, and finally the distinguished cycle gives the exact identity

```math
\begin{aligned}
&(i+1)a_{i+1}-(d-i)a_i\\
&=\sum_{\substack{0\leq a\lt m,\ m\leq b\leq n-m\\a+b\lt n}}
\frac{n!}{a!b!(n-a-b)}
\left[c(a,i)c(b,j)-c(a,j)c(b,i)\right]. \tag{7}
\end{aligned}
```

For clarity, the prefactor is

```math
\binom{n}{a,b,\ell}(\ell-1)!
=\frac{n!}{a!b!\ell},\qquad \ell=n-a-b.
```

There is no further factor for marking: the distinguished cycle is already selected by its label set and cyclic order. All other red and blue cycles are counted by the two Stirling numbers.

Every summand in (7) is nonnegative. Indeed $a\lt m\leq b$ gives $a\lt b$, while $i\lt d/2$ gives $i\leq j=d-i-1$. Apply Lemma 1. This proves (6). ∎

The cancellation in this proof uses the Stirling-weighted family of permutations. The analogous assertion for an arbitrary fixed list of cycle lengths would be false.

## 3. A coefficientwise nonnegative derivative quotient

**Lemma 3.** The polynomial

```math
C_{n,m}(u,v)
=\frac{(\partial_v-\partial_u)S_{n,m}(u,v)}{u-v} \tag{8}
```

has nonnegative coefficients in $u,v$ and total degree at most $n-2$.

**Proof.** A symmetric polynomial has an antisymmetric numerator in (8), so division by $u-v$ is exact. Treat a homogeneous part (5) of degree $d$ and put

```math
\Delta_i=(i+1)a_{i+1}-(d-i)a_i.
```

Symmetry gives $\Delta_{d-1-i}=-\Delta_i$, while Lemma 2 gives $\Delta_i\geq0$ for $i\lt d/2$. Pairing terms in the derivative yields the explicit expansion

```math
\frac{(\partial_v-\partial_u)P_d(u,v)}{u-v}
=\sum_{i=0}^{\lfloor(d-2)/2\rfloor}
\Delta_i(uv)^i
\sum_{t=0}^{d-2-2i}u^{d-2-2i-t}v^t. \tag{9}
```

All coefficients on the right are nonnegative. When $d$ is odd, its unpaired middle derivative coefficient is zero by symmetry. Summing (9) over $2\leq d\leq n$ proves the lemma. ∎

**Lemma 4.** For $\alpha,\beta>0$, every coefficient in $x$ of

```math
E_{n,m}(x)
=S_{n,m}(x+\alpha,x+\beta)
 -S_{n,m}(x+\alpha+\beta,x) \tag{10}
```

is nonnegative. Its degree is at most $n-2$.

**Proof.** The expression is symmetric in $\alpha,\beta$, so suppose $\alpha\geq\beta$. Along

```math
u_t=x+\alpha+\beta-t,\qquad v_t=x+t,
\qquad 0\leq t\leq\beta,
```

the fundamental theorem of calculus and (8) give

```math
E_{n,m}(x)
=\int_0^\beta
(\alpha+\beta-2t)
C_{n,m}(x+\alpha+\beta-t,x+t)\,dt. \tag{11}
```

The scalar factor satisfies $\alpha+\beta-2t\geq\alpha-\beta\geq0$. The two constant shifts of $x$ are nonnegative. By Lemma 3, the polynomial inside the integral therefore has nonnegative coefficients in $x$, for each $t$ in the integration interval. Integrating its finitely many coefficients preserves nonnegativity. Its degree is at most $n-2$. ∎

This proves exactly the required coefficient assertion for arbitrary fixed positive shifts. No claim about coefficient signs after expanding simultaneously in $\alpha$ and $\beta$ is needed.

## 4. Decompose the original polynomial into central tails

Set $w_k=f_kf_{n-k}$. Then $w_k=w_{n-k}$. Strict log-concavity makes

```math
w_0\lt w_1\lt \cdots\lt w_{\lfloor n/2\rfloor}. \tag{12}
```

Here is the boundary check. Every interior $f_k$ is positive, since otherwise the strict inequality at $k$ would be impossible. If an endpoint vanishes, $w_0=0\lt w_1$. If both endpoints are positive, the ratios $r_k=f_k/f_{k-1}$ strictly decrease. For $1\leq k\leq\lfloor n/2\rfloor$,

```math
\frac{w_k}{w_{k-1}}=\frac{r_k}{r_{n-k+1}}>1.
```

For later $k$ when an endpoint vanishes, the same argument uses only positive interior entries. Thus (12) holds in every case allowed by the theorem.

The rising-factorial Vandermonde identity says

```math
\sum_{k=0}^n\binom nk(u)_k(v)_{n-k}=(u+v)_n. \tag{13}
```

It follows, for example, by multiplying $(1-z)^{-u}$ and $(1-z)^{-v}$ as formal power series. In particular, the unweighted sum of the bracketed terms in (1) is zero.

Use the decomposition

```math
w_k=w_0+
\sum_{m=1}^{\min(k,n-k)}(w_m-w_{m-1}).
```

Substitute it into (1), cancel the $w_0$ term by (13), and interchange the finite sums. This gives

```math
Q_n^{\alpha,\beta}(x)
=\sum_{m=1}^{\lfloor n/2\rfloor}
(w_m-w_{m-1})E_{n,m}(x). \tag{14}
```

Every scalar weight is positive by (12). Every tail has nonnegative coefficients and degree at most $n-2$ by Lemma 4. It remains to prove strict positivity in all the required degrees.

## 5. Strict positivity comes from the first tail

Removing only the two endpoint terms from (13) gives

```math
E_{n,1}(x)
=(x+\alpha+\beta)_n+(x)_n
 -(x+\alpha)_n-(x+\beta)_n. \tag{15}
```

Since $(x)_n=\sum_{d=0}^n c(n,d)x^d$ has nonnegative coefficients, every coefficient of this mixed finite difference is nonnegative. The leading monomial $x^n$ alone makes every coefficient $x^j$, $0\leq j\leq n-2$, strictly positive. Its contribution is

```math
\binom nj\left[(\alpha+\beta)^{n-j}
 -\alpha^{n-j}-\beta^{n-j}\right]>0, \tag{16}
```

because $n-j\geq2$ and $\alpha,\beta>0$. All lower-degree monomials in $(x)_n$ contribute nonnegative amounts.

Finally, $w_1-w_0>0$. Combining (14)–(16) gives the explicit lower bound

```math
[x^j]Q_n^{\alpha,\beta}(x)
\geq(f_1f_{n-1}-f_0f_n)\binom nj
\left[(\alpha+\beta)^{n-j}
 -\alpha^{n-j}-\beta^{n-j}\right]>0
```

for every $0\leq j\leq n-2$. The degree bound from Lemma 4 and positivity at $j=n-2$ show that the degree is exactly $n-2$. This proves Conjecture 1 in its full parameter range. ∎

## Scope and audit

The parent agent found the marked-cycle cancellation in Lemma 2. The analysis agent independently checked the count, developed the coefficientwise derivative and tail reductions, and wrote this proof. A separate combinatorics agent checked the cancellation, boundary ranges, prefactor, and minor orientation. The parent then reviewed the complete written proof, including the Stirling zero cases, derivative signs, endpoint cases, and strict lower bound, and replayed the committed verifier.

The companion verifier checks literal colored permutations, the marked-cycle identity in exact integer arithmetic, and the original polynomial at rational shifts. Finite computations are diagnostic checks; no part of the proof depends on a bounded value of $n$. These reviews were internal; no outside peer review or author confirmation is claimed.

The source's Hurwitz-stability conjecture is a different assertion and already has public counterexamples. Its Pólya-frequency real-zero conjecture has a separate recent proof claim. Neither is used or counted as a new result here.

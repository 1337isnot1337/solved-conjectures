# Karp–Vishnyakova–Zhang's gamma-quotient conjecture

Status: complete proof with two independent internal mathematical reviews. The theorem proves all-order sign regularity and gives the parameter-dependent signature. The source's separate fixed order-three signature is corrected. No outside peer review is claimed. See NOVELTY.md for the bounded prior-resolution audit.

## 1. Statement and scope

The source is Karp, Vishnyakova, and Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, [arXiv:2408.01755](https://arxiv.org/html/2408.01755v2), Section 3, item 11; [published version](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf), Results in Mathematics 80 (2025), 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4).

For a real kernel $`K(x,y)`$, sign regularity of all orders means that, at each order $`r`$, all determinants

```math
\det[K(x_i,y_j)]_{i,j=1}^r,
\qquad x_1<\cdots\lt x_r,\quad y_1<\cdots\lt y_r,
```

have one common weak sign. Strict sign regularity means that these determinants never vanish. A kernel is strictly totally positive when all these signs are positive.

Write

```math
F_\delta(s)=\frac{\Gamma(s+\delta)}{\Gamma(s)},
\qquad s>0,\quad\delta>0.
```

**Theorem.** If $`\delta`$ is not an integer, the kernel $`F_\delta(x+y)`$ on the positive quadrant is strictly sign regular of every order. At order $`r`$ its signature is

```math
\varepsilon_r(\delta)
=\mathop{\mathrm{sgn}}\left[
(-1)^{\binom r2}\prod_{j=0}^{r-1}\delta^{\underline j}
\right],
\qquad
\delta^{\underline0}=1,\qquad
\delta^{\underline j}=\delta(\delta-1)\cdots(\delta-j+1).
\tag{1}
```

If $`\delta=m`$ is a positive integer, all minors through order $`m+1`$ are nonzero with sign $`(-1)^{\binom r2}`$, and all larger minors vanish.

Consequently, for arbitrary real $`c>d`$,

```math
K_{c,d}(x,y)=\frac{\Gamma(c+x+y)}{\Gamma(d+x+y)}
\tag{2}
```

has the same signature on every Cartesian domain where $`d+x+y>0`$. The conclusion also applies to each finite ordered grid satisfying this positivity condition.

The proof uses the gamma convolution identity and two continuous determinant composition formulas. Both component sign calculations are proved below.

## 2. A Wronskian criterion with its proof

Let $`f_1,\ldots,f_r`$ be smooth real functions on an interval. Define their initial Wronskians by

```math
W_k(t)=\det[f_j^{(i-1)}(t)]_{i,j=1}^k,
\qquad 1\leq k\leq r.
```

**Lemma.** Suppose every $`W_k`$ is everywhere nonzero. Then

```math
\det[f_j(t_i)]_{i,j=1}^r\ne0
\qquad(t_1<\cdots\lt t_r),
```

and its sign is the sign of $`W_r`$.

**Proof.** We first prove by induction that every nonzero linear combination of the first $`k`$ functions has at most $`k-1`$ distinct zeros. This is immediate for $`k=1`$ because $`f_1=W_1`$ never vanishes.

Divide a proposed linear combination of $`k`$ functions by $`f_1`$ and differentiate. The resulting functions, apart from the vanished constant term, are

```math
g_j=\left(\frac{f_{j+1}}{f_1}\right)',
\qquad 1\leq j\leq k-1.
```

Their initial Wronskians satisfy

```math
W(g_1,\ldots,g_\ell)
=\frac{W(f_1,\ldots,f_{\ell+1})}{f_1^{\ell+1}}.
\tag{3}
```

To verify (3), use the identity $`W(af_1,\ldots,af_n)=a^nW(f_1,\ldots,f_n)`$, obtained from the triangular Leibniz-rule matrix, with $`a=1/f_1`$. The resulting first column is the constant function one; expansion along that column leaves the Wronskian of the derivatives of the remaining functions.

Thus all initial Wronskians of the $`g_j`$ are nonzero. If the original combination has $`k`$ distinct zeros, Rolle's theorem gives at least $`k-1`$ distinct zeros of its derivative after division by $`f_1`$. The induction hypothesis permits at most $`k-2`$, unless that derivative is identically zero. In the latter case the nonvanishing Wronskian makes all coefficients except the first zero, and the original combination is a nonzero multiple of $`f_1`$, again impossible.

A vanishing evaluation determinant would give such a combination with $`r`$ distinct zeros. Hence the determinant never vanishes. The ordered-node domain is connected, so its sign is constant. Let its nodes coalesce to an interior point $`t`$. Taylor expansion gives

```math
\det[f_j(t_i)]
=\frac{W_r(t)}{\prod_{i=0}^{r-1}i!}
\prod_{i\lt j}(t_j-t_i)
+o\!\left(\prod_{i\lt j}(t_j-t_i)\right)
```

along equally spaced coalescing nodes. The Vandermonde factor is positive, proving the asserted sign. This proves the lemma.

## 3. The power kernel

Fix $`0<v_1<\cdots<v_r`$ and put $`f_j(u)=(u+v_j)^\delta`$ for $`u>0`$. Direct differentiation and a Vandermonde determinant give

```math
\begin{aligned}
W_k(u)
&=\left(\prod_{i=0}^{k-1}\delta^{\underline i}\right)
\left(\prod_{j=1}^k(u+v_j)^\delta\right)
\det[(u+v_j)^{-(i-1)}]_{i,j=1}^k
\\ &=(-1)^{\binom k2}
\left(\prod_{i=0}^{k-1}\delta^{\underline i}\right)
\left(\prod_{j=1}^k(u+v_j)^{\delta-k+1}\right)
\prod_{i\lt j}(v_j-v_i).
\end{aligned}
\tag{4}
```

If $`\delta`$ is not an integer, every factor in (4) is nonzero. The lemma proves

```math
\mathop{\mathrm{sgn}}
\det[(u_i+v_j)^\delta]_{i,j=1}^r
=\varepsilon_r(\delta)
\qquad(0\lt u_1<\cdots\lt u_r).
\tag{5}
```

If $`\delta=m`$ is a positive integer, this proof works through $`r=m+1`$, where all the falling factorials in (4) are positive. For larger orders, the rank is at most $`m+1`$ because each column is a polynomial in $`u`$ of degree $`m`$. This proves exactly the integer case stated for the power kernel.

## 4. The gamma-density kernel is strictly totally positive

For $`a,u>0`$, define

```math
G(a,u)=\frac{u^{a-1}e^{-u}}{\Gamma(a)}.
\tag{6}
```

For increasing positive $`a_i`$ and $`u_j`$, positive row and column factors reduce its determinant to

```math
\det[e^{a_i\log u_j}]_{i,j=1}^r.
```

For increasing $`a_i`$, the initial Wronskians of the functions $`e^{a_i t}`$ are

```math
e^{(a_1+\cdots+a_k)t}\prod_{i\lt j}(a_j-a_i)>0.
```

The lemma applied at the increasing nodes $`\log u_j`$ proves positivity of the transposed evaluation determinant. Therefore $`G`$ is strictly totally positive at every order. Transposing a square matrix does not change its determinant.

## 5. The gamma convolution identity

For $`x,y,\delta>0`$,

```math
F_\delta(x+y)
=\int_0^\infty\int_0^\infty
G(x,u)(u+v)^\delta G(y,v)\,du\,dv.
\tag{7}
```

Indeed, substitute $`r=u+v`$ and $`t=u/(u+v)`$. The Jacobian is $`r`$, and the right side becomes

```math
\frac{1}{\Gamma(x)\Gamma(y)}
\left(\int_0^\infty e^{-r}r^{x+y+\delta-1}\,dr\right)
\left(\int_0^1t^{x-1}(1-t)^{y-1}\,dt\right)
=\frac{\Gamma(x+y+\delta)}{\Gamma(x+y)}.
```

All integrands are nonnegative and integrable. The identity is also the positive $`\delta`$th moment of the sum of two independent gamma random variables.

## 6. Determinant composition and strictness

For completeness, the continuous Cauchy–Binet identity used here is

```math
\det\left[\int A_i(t)B_j(t)\,dt\right]_{i,j=1}^r
=\int_{t_1<\cdots\lt t_r}
\det[A_i(t_j)]_{i,j=1}^r
\det[B_j(t_i)]_{i,j=1}^r\,dt_1\cdots dt_r.
\tag{8}
```

It follows by expanding both determinants, applying Fubini, and partitioning the full product domain into the $`r!`$ ordered regions. The simultaneous permutation of the integration variables changes the sign of each determinant, so their product is symmetric; the $`r!`$ factor from the full-domain formula cancels upon restricting to one ordered region. We only use (8) when all expanded terms are absolutely integrable.

Apply (8) twice to (7). For increasing positive $`x_i`$ and $`y_j`$,

```math
\begin{aligned}
\det[F_\delta(x_i+y_j)]_{i,j=1}^r
={}&\int_{0\lt u_1<\cdots\lt u_r}
\int_{0\lt v_1<\cdots\lt v_r}
\det[G(x_i,u_j)]_{i,j=1}^r
\\ &\qquad\times\det[(u_i+v_j)^\delta]_{i,j=1}^r
\det[G(y_i,v_j)]_{i,j=1}^r\,d\boldsymbol v\,d\boldsymbol u.
\end{aligned}
\tag{9}
```

The transpose in the second gamma factor has already been removed because it leaves the determinant unchanged.

Absolute integrability follows directly from expansion. For all positive $`u,v`$,

```math
(u+v)^\delta\leq(1+u)^\delta(1+v)^\delta.
```

Each term of the expanded integrand in (9) is therefore bounded in absolute value by a product of gamma densities times a polynomial-power weight in each variable. All such one-dimensional integrals are finite. There are only finitely many expansion terms, so the required Fubini operations are valid.

If $`\delta`$ is not an integer, the first and third determinants in (9) are strictly positive everywhere on the ordered domain. The middle determinant is everywhere nonzero with sign $`\varepsilon_r(\delta)`$ by (5). Thus the entire integrand has that strict sign. It is continuous on the ordered domain, which has positive measure. Its integral has the same strict sign.

For an integer $`\delta=m`$, the same argument proves strictness through order $`m+1`$. Beyond that order the middle determinant vanishes identically. Equation (9) then proves vanishing of every larger minor. This also agrees with the elementary identity $`F_m(s)=s(s+1)\cdots(s+m-1)`$.

This proves the theorem for the positive quadrant.

## 7. Translation and the source's parameters

Let $`\delta=c-d>0`$. Given an ordered grid satisfying $`d+x_i+y_j>0`$, its smallest argument is $`d+x_1+y_1>0`$. Choose real $`a,b`$ with

```math
a+b=d,\qquad x_1+a>0,\qquad y_1+b>0.
```

Such a choice exists: the permissible interval for $`a`$ is

```math
-x_1\lt a\lt d+y_1,
```

which is nonempty by the assumed positivity. All $`x_i+a`$ and $`y_j+b`$ are positive and remain strictly increasing. Then

```math
K_{c,d}(x_i,y_j)=F_\delta((x_i+a)+(y_j+b)).
```

The theorem already proved applies to this grid. The shifts need not be chosen uniformly for all grids because the signature depends only on $`\delta`$ and the order, not on the shifts. This proves the stated full parameter and domain claim.

## 8. The order-three signature correction is not a separate result

The source separately proposes a fixed order-three signature $`(+,-,-)`$. Formula (1) gives

```math
\varepsilon_1=+1,\qquad
\varepsilon_2=-1,\qquad
\varepsilon_3=-\mathop{\mathrm{sgn}}(\delta-1).
```

Consequently the strict order-three signature is $`(+,-,+)`$ when $`0<\delta<1`$, and $`(+,-,-)`$ when $`\delta>1`$. At $`\delta=1`$, every order-three minor is zero. The full sign-regularity conjecture is true with its parameter-dependent signature; the fixed-sign subsidiary statement is false on the first parameter interval.

The argument covers every order and every positive parameter difference. The parameter intervals and integer rank distinction describe the full theorem, not a sequence of separate conjecture claims.

## 9. Review and priority status

The full written proof was independently reviewed by the root and analysis agents. Both reviews passed without a mathematical correction. The separate [analysis audit](../../research/kvz-gamma-quotient/AUDIT-ANALYSIS.md) records the source scope, Wronskian calculation, composition normalization, integrability, strictness, and integer rank. The [root audit](../../research/kvz-gamma-quotient/AUDIT-ROOT.md) records the second review and additional source checks.

The power kernel, gamma convolution identity, and continuous Cauchy–Binet method are classical ingredients. The result scope is the exact named gamma-quotient statement with its complete signature. The [novelty audit](NOVELTY.md) records the inspected primary results, related public solution bodies, search coverage, and access limits. No earlier complete resolution was found in that inspected material; this is a bounded search conclusion.

The standard-library [exact diagnostic verifier](verify.py) checks rationally normalized half-integer gamma minors, integer-shift rank, and integer moment normalizations. It is supplementary; the proof above establishes the full theorem without finite computation.

Coordination and commit receipts: [issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97).

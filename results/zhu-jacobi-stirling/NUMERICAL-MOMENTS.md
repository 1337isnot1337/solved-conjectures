# Numerical moments of the generalized Jacobi–Stirling rows

Issue #163 already published the identical symbolic negative minor. The newer Bessel-zero characterization of numerical Hamburger and Stieltjes moment parameters is retained without changing the Lean coverage of the earlier disproof. See the [earlier proof](PROOF.md) for the underlying conjecture resolution.

## Statement and symbolic counterexample

Let $T_{0,0}=1$, with out-of-range entries zero, and let

$$
T_{n,k}=T_{n-1,k-1}+(ak^2+bk)T_{n-1,k},\qquad
P_n(x)=\sum_{k=0}^nT_{n,k}x^k.
$$

Zhu conjectured that the Hankel matrix $(P_{i+j}(x))_{i,j\ge0}$ is totally nonnegative coefficientwise in $a,b,x$: every finite minor has nonnegative coefficients. This is the conjecture in [Zhu (2024), §5.2 just after (5.10)](https://arxiv.org/html/2202.03793v2#S5.SS2), also listed as [Deb, P1.9](https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html). Zhu's 2024 paper dates the conjecture to 2018. Its Proposition 5.7 proves the corresponding claim with **factorially weighted** row polynomials $\sum_k k!T_{n,k}x^k$, not with $P_n$. Its other total-positivity assertion in (i) concerns the triangular/binomial row-generating matrices, not this Hankel matrix.

The unweighted conjecture is false:

$$
\det(P_{i+j}(x))_{0\le i,j\le2}
=2x^3\bigl(6a^3+11a^2b+6ab^2+b^3-2a^2x\bigr).
\tag{1}
$$

In particular, the coefficient of $a^2x^4$ is $-4$. Even pointwise total nonnegativity fails at $a=b=1,x=13$, where (1) is $-4\cdot13^3$.

To check (1), write $\lambda_k=ak^2+bk$, $m_i=P_i(x)$. The recurrence gives

$$
\begin{aligned}
m_0&=1,\quad m_1=x,\quad m_2=\lambda_1x+x^2,\\
m_3&=\lambda_1^2x+(\lambda_1+\lambda_2)x^2+x^3,\\
m_4&=\lambda_1^3x+(\lambda_1^2+\lambda_1\lambda_2+\lambda_2^2)x^2
       +(\lambda_1+\lambda_2+\lambda_3)x^3+x^4.
\end{aligned}
$$

Use the first row and column to reduce the determinant to $(m_2-x^2)(m_4-m_2^2)-(m_3-xm_2)^2$. Expanding gives

$$
\lambda_1\lambda_2(\lambda_2-\lambda_1)x^3
 +\bigl(\lambda_1(\lambda_2+\lambda_3-\lambda_1)-\lambda_2^2\bigr)x^4,
$$

which yields (1).

## Exact moment classification at numerical parameters

For every fixed $a,b,x\ge0$, the following are equivalent:

1. $(P_n(x))$ is a Hamburger moment sequence (represented by a positive measure on $\mathbb R$).
2. It is a Stieltjes moment sequence (represented by a positive measure on $[0,\infty)$).
3. Either $a=0$, or $a>0$ and $2\sqrt{x/a}\le j_{b/a,1}$, where $j_{\nu,1}$ is the first positive zero of $J_\nu$, the ordinary Bessel function of the first kind.

These conditions also characterize total nonnegativity of the specialized numerical Hankel matrix. If it is totally nonnegative, every finite leading principal section is positive semidefinite by the principal-minor criterion. The Hamburger moment theorem then gives condition 1. Conversely a Stieltjes moment sequence has totally nonnegative Hankel matrix: Andréief's determinant identity writes every minor as the integral of the product of two generalized Vandermonde determinants, each nonnegative when the nonnegative support variables are in increasing order. These are statements after specialization, not a coefficientwise positivity claim.

### The signed discrete representation

If $x=0$, the measure is $\delta_0$. If $a=0,b>0$, the recurrence gives $T_{n,k}=b^{n-k}{n\brace k}$, hence $P_n(x)$ is the $n$-th moment of $b$ times a Poisson random variable of mean $x/b$, by the falling-factorial moment formula. If $a=b=0$, the measure is $\delta_x$.

For $a>0$, divide the parameters by $a$, putting $c=b/a$ and $w=x/a>0$. The recurrence gives $T^{(a,b)}_{n,k}=a^{n-k}T^{(1,c)}_{n,k}$, so after proving the assertion for $(1,c,w)$, multiply all support points by $a$. The points $s_j=j(j+c)$ are strictly increasing. In the Newton basis $N_k(y)=\prod_{i=0}^{k-1}(y-s_i)$, multiplication by $y$ satisfies $yN_k(y)=N_{k+1}(y)+s_kN_k(y)$. Thus $T^{(1,c)}_{n,k}$ is the coefficient of $N_k$ in $y^n$, namely the divided difference

$$
T^{(1,c)}_{n,k}
=\sum_{j=0}^k \frac{s_j^n}{\prod_{0\le i\le k,\ i\ne j}(s_j-s_i)}.
\tag{2}
$$

The right side is zero for $k>n$; at $n=0$ use $s_0^0=1$. Define $W_j$ by summing over $k\ge j$ the coefficient of $s_j^n$ in $w^k$ times (2). For $2j+c>0$ the denominator in (2) is

$$
(-1)^{k-j}j!(k-j)!\frac{(j+c)_{k+1}}{2j+c},
$$

since $s_j-s_i=(j-i)(j+i+c)$. With $k=j+m$ the series for $W_j$ is

$$
W_j=\frac{(2j+c)\Gamma(j+c)}{j!}w^j
       \sum_{m\ge0}\frac{(-w)^m}{m!\Gamma(2j+c+1+m)}.
$$

The [Bessel series, DLMF 10.2.2](https://dlmf.nist.gov/10.2.E2), therefore gives

$$
W_j=\frac{(2j+c)\Gamma(j+c)}{j!}w^{-c/2}
       J_{2j+c}(2\sqrt w).
\tag{3}
$$

At $j=c=0$ the denominator in (2) is $(-1)^k(k!)^2$; (3) holds there with prefactor $1$ in place of $(2j+c)\Gamma(j+c)/j!$.

For $j\ge1$, the sum of the absolute values of the terms defining $W_j$ is bounded by

$$
e^w\,\frac{(2j+c)w^j}{j!(j+c)_{j+1}}.
$$

Indeed the factor $(2j+c+1)_m$ in the denominator is at least $1$. Even using only $(j+c)_{j+1}\ge 2j+c$, this bound is summable after multiplication by $s_j^n$ or by $\exp(R\sqrt{s_j})$ for any fixed $n,R\ge0$: $s_j$ is quadratic and the factorial dominates the extra exponential in $j$. For $j=0$ use either its explicit factorial series when $c=0$ or the same bound when $c>0$. This justifies all rearrangements of (2) and proves that $W=\sum_jW_j\delta_{s_j}$ is a finite signed measure with the claimed moments and every exponential-root moment with respect to its total variation $|W|$.

### A positive Hamburger representation would have to equal $W$

Suppose a positive measure $\nu$ on $\mathbb R$ has all moments $P_n(w)$ for the normalized parameters. For each $R\ge0$, Tonelli applied to even moments gives

$$
\int_{\mathbb R}\sum_{k\ge0}\frac{R^{4k}|u|^{2k}}{(4k)!}\,d\nu(u)
=\sum_{k\ge0}\frac{R^{4k}P_{2k}(w)}{(4k)!}
\le\int_{[0,\infty)}e^{R\sqrt{s}}\,d|W|(s)<\infty.
$$

The subseries at $v=R\sqrt{|u|}$ equals $(\cosh v+\cos v)/2\ge e^v/4-1/2$. Thus $\nu$ also has every exponential-root moment. Domination by $e^{|z|\sqrt{|u|}}$ justifies integrating term by term in

$$
\mathcal C(z,u)=\sum_{n\ge0}\frac{z^{2n}u^n}{(2n)!}.
$$

The integrals against $\nu$ and $W$ agree for every $z\in\mathbb C$. At $z=it$ the kernel is $\cos(t\sqrt u)$ for $u\ge0$ and $\cosh(t\sqrt{-u})$ for $u<0$. Its integral against $W$ is bounded uniformly in real $t$. Any $\nu$-mass on $(-\infty,0)$ would give positive mass in some $(-\infty,-\epsilon]$ and make its integral unbounded, since the contribution from nonnegative $u$ is bounded below. Hence $\nu$ is supported on $[0,\infty)$. The two finite measures then have matching cosine transforms after taking the square-root pushforward. Symmetrizing those pushforwards on $\mathbb R$ and using uniqueness of the Fourier transform for finite signed measures yields $\nu=W$. Thus a positive Hamburger representation exists exactly when all $W_j$ are nonnegative.

### Signs and the first Bessel zero

The prefactor in (3) is positive. For $\nu\ge0$, $J_\nu$ is positive on $(0,j_{\nu,1})$; its positive zeros are simple, and $J_\nu$ is negative on $(j_{\nu,1},j_{\nu,2})$. The first positive zero strictly increases with order ([DLMF §10.21, especially (i) and (iv)](https://dlmf.nist.gov/10.21)). Also $j_{\nu,1}\to\infty$ as $\nu\to\infty$: for $z^2/4<\nu+1$, the power series after dividing out its positive leading term is alternating with strictly decreasing absolute terms, hence positive.

The neighboring negative intervals overlap: $j_{\nu+2,1}<j_{\nu,2}$. To see this, let $z=j_{\nu,2}$. Then $J'_\nu(z)>0$ by the sign between the zeros and simplicity, so $J_{\nu+1}(z)=-J'_\nu(z)<0$. The [standard adjacent-order recurrence](https://dlmf.nist.gov/10.6) gives $J_{\nu+2}(z)=2(\nu+1)J_{\nu+1}(z)/z<0$, proving the overlap.

If $2\sqrt w\le j_{c,1}$, each weight is nonnegative. If $z=2\sqrt w>j_{c,1}$, choose the largest integer $j\ge0$ with $j_{c+2j,1}<z$. This exists and is finite, and

$$
j_{c+2j,1}<z\le j_{c+2j+2,1}<j_{c+2j,2}.
$$

Thus $W_j<0$, including when $z$ happens to be a first zero of a higher order. This proves the threshold with equality included.

## Literature and verification scope

- [Zhu (2024), journal record](https://www.sciencedirect.com/science/article/pii/S000187082400210X), *Advances in Mathematics*: the exact unweighted conjecture and the different weighted theorem in §5.2. Deb's problem list gives journal p. 26. Zhu's related [2018 article](https://arxiv.org/abs/1609.01544) proves strong log-convexity preservation, not this conjecture.
- Earlier total positivity of the Jacobi–Stirling triangle (e.g. [Mongelli, 2012](https://www.sciencedirect.com/science/article/pii/S0196885811000911)) and divided-difference formulas for its individual coefficients are distinct from unweighted row Hankel total positivity.
- Searches for the exact unweighted conjecture, negative minors and Bessel moment formulations found no earlier resolution; this is not a priority guarantee. The disproof is the symbolic calculation (1) and does not depend on the moment classification. The classification uses standard Bessel, Fourier and Hamburger moment results.

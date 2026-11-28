# Borcea's variance conjecture: the uniform sharp large-degree limit

**Theorem.** For a degree-$`n`$ complex polynomial $`P`$, let
```math
 d(P)=\max_{P(a)=0}\min_{P'(\zeta)=0}|a-\zeta|,
 \qquad
 \sigma_p(P)=\min_{c\in\mathbb C}
       \left(\frac1n\sum_{P(z)=0}|z-c|^p\right)^{1/p},
```
with root multiplicities included in the sum, and the usual containing-disk radius for $`p=\infty`$. Write
```math
 C_{p,n}=\sup_{\deg P=n,\ \sigma_p(P)>0} d(P)/\sigma_p(P).
```
Then
```math
 1\le C_{p,n}\le C_{1,n}=1+o(1)\qquad(n\longrightarrow\infty),
 \tag{1}
```
uniformly for $`1\le p\le\infty`$.

This gives the sharp exact-growing-degree asymptotic motivated by [Khavinson, Pereira, Putinar, Saff and Shimorin, *Borcea's variance conjectures on the critical points of polynomials*, Conjecture 3, §2, printed p. 5](https://arxiv.org/pdf/1010.5167#page=5). It does not prove Conjecture 3 with its literal at-most-degree quantifier, or establish $`C_{1,n}=1`$ for every finite degree. The error is uniform over all polynomials of a given degree, not just over those with compactly contained roots or convergence hypotheses.

## 1. Absolute moment of the critical points

We normalize $`P`$ to be monic, choose a geometric median at $`0`$, and rescale so that $`\sum_{P(z_i)=0}|z_i|=n`$. For a prescribed root $`a`$, rotate so that $`a\ge0`$. A multiple root is its own critical point, so the interesting case is simple.

Let $`D=\mathop{\mathrm{diag}}(z_1,\ldots,z_n)`$ and $`e=n^{-1/2}(1,\ldots,1)`$. The compression of $`D`$ to $`e^\perp`$ has characteristic polynomial $`P'/n`$: the appropriate cofactor of $`wI-D`$, expressed after changing basis with last vector $`e`$, is
```math
 P(w)\langle e,(wI-D)^{-1}e\rangle=P'(w)/n.
```
Use a unitary Schur basis $`u_1,\ldots,u_m`$ for the compression, $`m=n-1`$. The critical points are $`\zeta_j=\langle u_j,D u_j\rangle=\sum_i |u_j(i)|^2 z_i`$. As $`\sum_{j=1}^m |u_j(i)|^2=1-1/n`$ for each $`i`$, convexity gives
```math
 \frac1m\sum_j|\zeta_j|\le \frac1n\sum_i|z_i|=1.
 \tag{2}
```
The same calculation works for any convex function on the plane. This is the standard derivative as a normal-matrix compression, also discussed in the primary source, §7.

## 2. Sublinear median distance

Fix any radius $`r>1`$, and suppose all critical points satisfy $`|a-\zeta_j|>r`$. By (2), $`a>0`$. Set $`q_j=(a-\zeta_j)^{-1}`$, $`\mu=m^{-1}\sum_j q_j`$, $`\Pi=\prod_j |q_j|`$, and
```math
 F(t)=\prod_j(1-atq_j),\qquad
 B(t)=\frac1m\sum_j|1-atq_j|,\qquad h=1-1/r>0.
```
We have $`\Pi\le r^{-m}`$, $`|\mu|\le r^{-1}`$, and
```math
 B(t)\le 1-ht
 \quad(0\le t\le1),
 \tag{3}
```
by convexity in $`t`$, $`B(0)=1`$, and $`B(1)=m^{-1}\sum_j|\zeta_j q_j|\le1/r`$ from (2). Also $`|P(0)|\le1`$ by the arithmetic-geometric mean inequality for the root norms.

We use the polynomial integration identity from [Bouthat and Fallat, *A proof of Borcea's quadratic variance conjecture*, §3.2](https://arxiv.org/html/2610.12499v1#S3.SS2), with its estimates replaced by absolute-moment bounds. For clarity, $`F(t)=P'(a(1-t))/P'(a)`$ and $`P(a)=0`$ imply
```math
 P(0)=-aP'(a)\int_0^1 F(t)\,dt.
```
Product differentiation also gives
```math
 F'(t)=-ma\mu F(t)-a^2 t\sum_j q_j^2
           \prod_{\ell\ne j}(1-atq_\ell).
```
Integration, with $`|P'(a)|=n/\Pi`$, therefore yields
```math
 1\le |F(1)|+\frac mn|\mu|\Pi|P(0)|+
     a^2\int_0^1 t\sum_j |q_j|^2
           \prod_{\ell\ne j}|1-atq_\ell|\,dt.
 \tag{4}
```
For $`m\ge2`$ the omitted-factor product is at most
```math
 \left(\frac{mB(t)}{m-1}\right)^{m-1}
 \le e\,e^{-(m-1)ht}
```
by the arithmetic-geometric mean inequality and (3). The crucial size-dependent bound is
```math
 a^2\frac1m\sum_j |q_j|^2
 \le a\frac1m\sum_j (|q_j|+|\zeta_j|\,|q_j|^2)
 \le a(r^{-1}+r^{-2}),
 \tag{5}
```
using $`a q_j=1+\zeta_jq_j`$ and (2). In particular,
```math
 1\le r^{-m}+r^{-n}
   +\frac{e\,m\,a(r^{-1}+r^{-2})}{(m-1)^2 h^2}.
 \tag{6}
```
Here the first term bounds $`|F(1)|`$ by $`B(1)^m`$; the remainder uses $`\int_0^\infty te^{-(m-1)ht}\,dt=((m-1)h)^{-2}`$.

For fixed $`r>1`$, inequality (6) is impossible along a sequence $`n\to\infty`$ with $`a/n\to0`$. In fact, if such a sequence of counterexamples exists, (6) implies $`a/n`$ is bounded below by a positive constant depending only on $`r`$.

## 3. Linear median distance

Suppose along a sequence of counterexamples $`a/n`$ is bounded away from zero. Translate the prescribed root to $`0`$ and rotate so that the median $`c_n`$ is positive real, without changing the distance bounds. We have $`\sum_i |z_{i,n}-c_n|=n`$ and $`c_n\le n`$ by the cost of the distinguished root. After taking a subsequence,
```math
 c_n/n\longrightarrow\alpha>0.
```
Call a root bulk if $`|z_{i,n}-c_n|\le c_n/2`$. There are only boundedly many nonbulk roots, since each one uses more than $`c_n/2`$ of the cost $`n`$. On a subsequence their count is fixed, and each converges in the Riemann sphere. Factor $`P_n=Q_n B_n`$, where $`Q_n`$ consists of the nonbulk roots with finite limit. Its degree $`k`$ is fixed and positive (it includes the prescribed root at $`0`$). Therefore $`Q_n`$ converges coefficientwise to a monic degree-$`k`$ polynomial $`Q`$ with $`Q(0)=0`$. Each of these $`k`$ roots costs asymptotically $`\alpha n`$ from the median, so
```math
 k\alpha\le1.
 \tag{7}
```

All $`B_n`$-roots leave each fixed disk, and the finitely many escaping nonbulk roots contribute $`o(1)`$ to $`B_n'/B_n`$ locally uniformly. For $`|z|\le M`$ and $`c_n>4M`$, the bulk-root terms satisfy
```math
 \sum_{\text{bulk }i}\left|
     \frac1{z-z_{i,n}}-\frac1{z-c_n}\right|
 \le \frac{8}{c_n^2}\sum_{\text{bulk }i}|z_{i,n}-c_n|
 \le \frac{8n}{c_n^2}\longrightarrow0.
```
There are $`n-O(1)`$ bulk roots. Thus $`B_n'/B_n\to-1/\alpha`$ locally uniformly and
```math
 \frac{P_n'}{B_n}=Q_n'+Q_n B_n'/B_n
     \longrightarrow Q'-Q/\alpha
```
locally uniformly.

The limit polynomial has a zero of modulus at most $`k\alpha\le1`$. Here is the constant-field argument, also a special case of [Ćurgus and Mascioni, *Perturbations of roots under linear transformations of polynomials*, Theorem 9.1 and Proposition 10.1](https://faculty.curgus.wwu.edu/Papers/RootsOperFinal.pdf). Put $`T=Q-\alpha Q'`$. If all its roots $`\xi_i`$ have modulus greater than $`k\alpha`$, use
```math
 Q(0)=\sum_{j=0}^k\alpha^j T^{(j)}(0)=0
```
and divide by $`T(0)`$. This gives the vanishing of the symmetric multiaffine polynomial $`\sum_{j=0}^k j!(-\alpha)^j e_j`$ at $`(1/\xi_i)_i`$. Grace–Walsh–Szegő gives a diagonal zero $`(u,\ldots,u)`$ with $`|u|<1/(k\alpha)`$; $`u\ne0`$ because the constant term is $`1`$. On the diagonal the expression is
```math
 k!(-\alpha u)^k\sum_{\ell=0}^k
             \frac{(-1/(\alpha u))^\ell}{\ell!}.
```
By Eneström–Kakeya all zeros of $`\sum_{\ell=0}^k w^\ell/\ell!`$ satisfy $`|w|\le k`$, contrary to $`|1/(\alpha u)|>k`$.

A sufficiently small circle around this limit zero lies in $`|z|<r`$ and avoids all limit zeros on the circle. Rouché's theorem gives a zero of $`P_n'/B_n`$, hence of $`P_n'`$, inside that circle for all sufficiently large $`n`$. This contradicts the assumed counterexamples.

## 4. Finishing the uniform limit

For each fixed $`r>1`$, Sections 2 and 3 exclude every sequence of counterexamples of degrees tending to infinity. Equivalently $`C_{1,n}\le r`$ for all sufficiently large $`n`$, where the threshold depends only on $`r`$. Monotonicity of power means, followed by minimization over centers, gives $`\sigma_p\ge\sigma_1`$ for $`p\ge1`$. Finally $`P(z)=z^n-1`$ has $`d(P)=1`$ and $`\sigma_p(P)=1`$: the radial loss averaged across the roots is convex in the center and invariant under rotation by $`2\pi/n`$, so Jensen's inequality places a minimizer at $`0`$. This proves (1).

## Scope and priority

* The 2011 source's numbered Conjecture 3 prints $`\deg F\le n`$, while (1) takes the supremum over $`\deg F=n`$. The literal printed statement implies the exact finite-degree Conjecture 1 by fixing any $`F`$ of degree at least two and sending the cutoff $`n`$ to infinity. Our theorem proves the uniform sharp-constant growing-degree version for every $`p\ge1`$, not the stronger literal statement. The exact finite-degree mean-deviation conjecture remains open.
* The recently proved quadratic case and Sendov's conjecture do not imply (1) at $`p=1`$, as $`\sigma_2/\sigma_1`$ can diverge with the degree. Conversely, the asymptotic theorem neither reproves nor supersedes exact results at other exponents.
* The ingredients credited above are known. The new steps are the first-moment replacement (3)–(5) in the integration argument and the complementary one-dimensional constant-field localization for critical points near a macroscopic outlier. Targeted searches for a sharp asymptotic $`p=1`$ result, including the 2011 source's citation trail and 2026 treatments of Sendov's theorem and Borcea's conjecture, did not identify a prior proof; this is not a guarantee of priority.

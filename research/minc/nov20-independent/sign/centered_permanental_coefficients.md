# A uniform bound for centered permanental coefficients

Date: 2026-11-20 (America/Chicago).

Status: a proved auxiliary estimate, subject to repository review. This note
does not resolve a numbered entry in Minc's list. It supplies an all-degree
estimate requested in the work on Conjecture 44. No priority claim is made.
The constants are deliberately coarse.

## 1. Statement

For a complex square matrix $`B`$ of order $`n`$, define

```math
\sigma_k(B)=
\sum_{\substack{I,J\subseteq[n]\\|I|=|J|=k}}\mathop{\mathrm{per}}B[I,J],
\qquad \sigma_0(B)=1.
```

Let $`\|B\|_F^2=\sum_{i,j}|b_{ij}|^2`$. Call $`B`$ centered when
$`B{\bf1}=B^T{\bf1}=0`$.

**Theorem.** If $`B`$ is centered and $`t\ge0`$ satisfies
$`t\|B\|_{\mathrm{op}}\le1/200`$, then

```math
\boxed{\quad
\sum_{k=0}^n|\sigma_k(B)|t^k
\le \exp\bigl(13000t^2\|B\|_F^2\bigr).
\quad}                                                     \tag{1}
```

In particular, for every $`k`$,

```math
\boxed{\quad
|\sigma_k(B)|\le 2\,200^k\|B\|_F^k.
\quad}                                                     \tag{2}
```

The constants do not depend on the order, the rank, or the number of nonzero
entries. The case $`B=0`$ is immediate.

The main issue is the absence of a term involving the nuclear norm or the
trace of a positive semidefinite covariance matrix. Such a term would grow
with dimension and would not give (2).

## 2. The positive semidefinite reduction

First take $`C=C^*\succeq0`$ with $`C{\bf1}=0`$, and put $`F=\|C\|_F`$.
Let $`Y`$ be a proper complex Gaussian vector with

```math
\mathbb EY_i\overline{Y_j}=C_{ij},
\qquad \mathbb EY_iY_j=0.
```

Thus $`Y=C^{1/2}(X+iX')/\sqrt2`$, where $`X,X'`$ are independent real
standard Gaussian vectors. In particular $`\sum_iY_i=0`$ almost surely:
its squared absolute expectation is $`{\bf1}^*C{\bf1}=0`$.

Complex Gaussian moments give

```math
\mathbb E\,e_k(Y)\overline{e_\ell(Y)}
=
\begin{cases}
\sigma_k(C),&k=\ell,\\
0,&k\ne\ell.
\end{cases}                                                \tag{3}
```

Here $`e_k`$ is the elementary symmetric polynomial. To check the
normalization directly, for fixed $`k`$-subsets $`I,J`$, the mixed moment
$`\mathbb E\prod_{i\in I}Y_i\prod_{j\in J}\overline{Y_j}`$ is
$`\mathop{\mathrm{per}}C[I,J]`$. There is no extra factor $`k!`$.
Consequently

```math
R_C(t):=\sum_{k=0}^n\sigma_k(C)t^k
=\mathbb E\left|\prod_i(1+\sqrt t\,Y_i)\right|^2,
\qquad \sigma_k(C)\ge0.                                   \tag{4}
```

We prove

```math
R_C(1)\le e^{13000F^2}
\quad\text{if }\|C\|_{\mathrm{op}}\le1/200.                  \tag{5}
```

Replacing $`C`$ by $`tC`$ then proves the positive semidefinite version of
(1).

The zero sum is used before taking absolute values. Define
$`h(z)=(1+z)e^{-z}`$. Then

```math
\prod_i(1+Y_i)=\prod_i h(Y_i).                              \tag{6}
```

The estimate $`|h(z)|^2\le e^{|z|^2}`$ alone would give
$`\det(I-C)^{-1}`$, whose logarithm has an unwanted linear trace term.
The next lemma retains the cancellation of the quadratic and cubic
angular terms.

## 3. A scalar majorant

For $`z=x+iy`$, $`r=|z|`$, set

```math
g(z)=-\mathop{\mathrm{Re}}z^2
+\frac23\,\frac{\mathop{\mathrm{Re}}z^3}{1+r^2}
+14\,\frac{r^4}{1+r^2}.                                    \tag{7}
```

Derivatives of $`g`$ below are real derivatives in $`(x,y)`$.

**Lemma 1.** The following hold:

```math
\log|h(z)|^2\le g(z),\qquad
\|\nabla^2g(z)\|_{\mathrm{op}}<100.                         \tag{8}
```

If $`Z`$ is a proper complex Gaussian scalar with
$`\mathbb E|Z|^2=d`$, including the degenerate case $`d=0`$, then

```math
\mathbb Eg(Z)\le28d^2,\qquad \mathbb E\nabla g(Z)=0.         \tag{9}
```

**Proof of the majorization.** For $`r\le1/2`$, the logarithmic power series
gives

```math
\log|h(z)|^2=-\mathop{\mathrm{Re}}z^2
+\frac23\mathop{\mathrm{Re}}z^3+E(z),
```

where

```math
|E(z)|\le2\sum_{m\ge4}\frac{r^m}{m}
\le\frac{r^4}{2(1-r)}\le r^4.
```

Replacing the cubic term by the damped cubic term in (7) loses at most

```math
\frac23\,\frac{r^5}{1+r^2}\le\frac13r^4.
```

The final term of (7) is at least $`56r^4/5`$ in this range, which more
than covers both errors.

For $`r\ge1/2`$, the inequality $`\log u\le u-1`$, applied to
$`u=|1+z|^2`$, gives

```math
\log|h(z)|^2\le r^2.
```

Also

```math
\frac{r}{1+r^2}\le\frac12,\qquad
\frac{r^2}{1+r^2}\ge\frac15.
```

Therefore

```math
g(z)\ge-r^2-\frac13r^2+\frac{14}{5}r^2
=\frac{22}{15}r^2\ge r^2.
```

At $`z=-1`$, interpret the logarithm as $`-\infty`$; the conclusion still
holds.

**Proof of the Hessian bound.** Put
$`P(x,y)=\mathop{\mathrm{Re}}(x+iy)^3`$ and $`q=(1+r^2)^{-1}`$. We have

```math
|P|\le r^3,\quad \|\nabla P\|=3r^2,\quad
\|\nabla^2P\|_{\mathrm{op}}=6r,
```

```math
\|\nabla q\|=\frac{2r}{(1+r^2)^2},\qquad
\|\nabla^2q\|_{\mathrm{op}}
\le\frac2{(1+r^2)^2}+\frac{8r^2}{(1+r^2)^3}.
```

The product rule and $`r/(1+r^2)\le1/2`$ give

```math
\begin{split}
\|\nabla^2(Pq)\|_{\mathrm{op}}
&\le \frac{6r}{1+r^2}
+\frac{12r^3}{(1+r^2)^2}
+\frac{2r^3}{(1+r^2)^2}
+\frac{8r^5}{(1+r^2)^3}\\
&\le3+6+1+4=14.
\end{split}
```

Since $`r^4/(1+r^2)=r^2-1+q`$, and
$`r^2/(1+r^2)^3\le1/4`$, its Hessian norm is at most
$`2+2+2=6`$. The total bound for (7) is therefore

```math
2+\frac23\cdot14+14\cdot6=\frac{286}{3}<100.
```

**Proof of the Gaussian assertions.** Circular symmetry makes the two
harmonic terms in (7) have zero expectation. Since
$`\mathbb E|Z|^4=2d^2`$,

```math
\mathbb Eg(Z)
=14\,\mathbb E\frac{|Z|^4}{1+|Z|^2}\le28d^2.
```

The gradient of the radial term has angular mode $`1`$. The gradient of
the quadratic term has angular mode $`1`$. The gradient of the damped
cubic term has angular modes $`2`$ and $`4`$. Each averages to zero under
circular symmetry. This proves $`\mathbb E\nabla g(Z)=0`$.
$`\square`$

## 4. A Gaussian exponential estimate

We use two standard Gaussian inequalities. For a standard real Gaussian
vector $`W`$, Gaussian Poincare says

```math
\mathop{\mathrm{Var}}a(W)\le\mathbb E\|\nabla a(W)\|^2.         \tag{10}
```

Gaussian concentration says that an $`L`$-Lipschitz real function $`a`$
satisfies, for every $`s\in\mathbb R`$,

```math
\mathbb Ee^{s(a(W)-\mathbb Ea(W))}
\le e^{s^2L^2/2}.                                         \tag{11}
```

For example, (11) follows from the Gaussian logarithmic Sobolev
inequality by the Herbst argument. A source is Ledoux's lecture notes
listed below. The remaining exponential comparison is proved here.

**Lemma 2.** Let $`f`$ be a twice continuously differentiable real function
of a standard Gaussian vector. Suppose

```math
\mathbb E\nabla f(W)=0,\quad
\sup_x\|\nabla^2f(x)\|_{\mathrm{op}}\le b,\quad
\sup_x\|\nabla^2f(x)\|_F\le a.
```

Put $`c=\pi^2/8`$. If $`2cb^2<1`$, then

```math
\log\mathbb Ee^{f(W)-\mathbb Ef(W)}
\le-\frac12\log(1-2cb^2)+\frac{ca^2}{1-2cb^2}.             \tag{12}
```

**Proof.** Poincare applied to every coordinate of $`\nabla f`$ gives

```math
\mathbb E\|\nabla f(W)\|^2
\le\mathbb E\|\nabla^2f(W)\|_F^2\le a^2.                   \tag{13}
```

We first establish the rotation estimate

```math
\mathbb Ee^{f(W)-\mathbb Ef(W)}
\le \mathbb Ee^{c\|\nabla f(W)\|^2}.                      \tag{14}
```

Take an independent standard Gaussian $`W'`$, and rotate the pair:

```math
W_\theta=W\cos\theta+W'\sin\theta,\qquad
V_\theta=-W\sin\theta+W'\cos\theta.
```

For each $`\theta`$, $`W_\theta,V_\theta`$ are independent standard
Gaussians, and

```math
f(W')-f(W)=\int_0^{\pi/2}
\langle\nabla f(W_\theta),V_\theta\rangle\,d\theta.
```

Jensen first in $`W'`$ and then in the uniform variable $`\theta`$
shows that the left side of (14) is at most

```math
\frac2\pi\int_0^{\pi/2}
\mathbb E\exp\left(
-\frac\pi2\langle\nabla f(W_\theta),V_\theta\rangle
\right)d\theta.
```

Integrating $`V_\theta`$ gives (14). These inequalities also hold as
inequalities of extended nonnegative integrals; the next bound proves
finiteness.

The function $`G(W)=\|\nabla f(W)\|`$ is $`b`$-Lipschitz.
Let $`\mu=\mathbb EG(W)`$, so $`\mu^2\le a^2`$ by (13).
For an independent standard real Gaussian $`Z`$, (11) gives

```math
\begin{split}
\mathbb Ee^{cG(W)^2}
&=\mathbb E_Z\mathbb E_W e^{\sqrt{2c}\,ZG(W)}\\
&\le\mathbb E_Z e^{\sqrt{2c}\,\mu Z+cb^2Z^2}\\
&=(1-2cb^2)^{-1/2}
\exp\left(\frac{c\mu^2}{1-2cb^2}\right).
\end{split}
```

This proves (12). $`\square`$

## 5. Applying the estimate

Write $`(\mathop{\mathrm{Re}}Y,\mathop{\mathrm{Im}}Y)=S W`$, where $`W`$ is a
standard Gaussian vector in $`\mathbb R^{2n}`$ and

```math
SS^T=\Sigma=\frac12
\begin{pmatrix}
\mathop{\mathrm{Re}}C&-\mathop{\mathrm{Im}}C\\
\mathop{\mathrm{Im}}C&\mathop{\mathrm{Re}}C
\end{pmatrix}.
```

The eigenvalues of $`\Sigma`$ are one half the eigenvalues of $`C`$, each
repeated twice. Hence
$`\|\Sigma\|_{\mathrm{op}}=\|C\|_{\mathrm{op}}/2`$ and
$`\|\Sigma\|_F=\|C\|_F/\sqrt2`$.

Set

```math
f(W)=\sum_{i=1}^n g(Y_i).
```

By Lemma 1,

```math
\mathbb Ef(W)\le28\sum_iC_{ii}^2\le28F^2,\qquad
\mathbb E\nabla f(W)=0.                                  \tag{15}
```

The Hessian of $`\sum_i g(Y_i)`$ before composing with $`S`$ is a block
diagonal real matrix $`D`$ of operator norm at most $`100`$.
Thus $`\nabla^2f=S^TDS`$, and

```math
\|\nabla^2f\|_{\mathrm{op}}
\le100\|\Sigma\|_{\mathrm{op}}
=50\|C\|_{\mathrm{op}}\le50F.                             \tag{16}
```

Schatten Holder gives

```math
\|S^TDS\|_F
\le\|D\|_{\mathrm{op}}\|S\|_{S_4}^2
=\|D\|_{\mathrm{op}}\|\Sigma\|_F
\le\frac{100}{\sqrt2}F.                                  \tag{17}
```

Take $`b=50\|C\|_{\mathrm{op}}`$, $`a^2=5000F^2`$ in Lemma 2.
If $`\|C\|_{\mathrm{op}}\le1/200`$, then,
using $`c<5/4`$,

```math
u:=2cb^2\le6250\|C\|_{\mathrm{op}}^2\le5/32<1/4.
```

Since $`-\log(1-u)\le u/(1-u)`$, (12) gives

```math
\log\mathbb Ee^{f-\mathbb Ef}
\le\frac{c(a^2+b^2)}{1-u}
\le12500F^2.
```

Combining this with (15), (6), and Lemma 1 proves

```math
R_C(1)
\le\mathbb Ee^{f(W)}
\le e^{12528F^2}
\le e^{13000F^2},
```

as claimed.

## 6. Arbitrary centered complex matrices

Let $`B=U\Lambda V^*`$ be a singular value decomposition, and set

```math
L=U\Lambda^{1/2},\quad M=V\Lambda^{1/2},\quad
C_L=LL^*=(BB^*)^{1/2},\quad
C_R=MM^*=(B^*B)^{1/2}.
```

Both $`C_L`$ and $`C_R`$ are Hermitian positive semidefinite and centered,
because $`B{\bf1}=B^*{\bf1}=0`$. The latter condition is equivalent to
the zero column sums in the statement. Also

```math
\|C_L\|_F=\|C_R\|_F=\|B\|_F.
```

Their operator norms likewise both equal $`\|B\|_{\mathrm{op}}`$.

For a proper standard complex Gaussian vector $`Z`$, the same moment
calculation as (3) gives

```math
\sigma_k(B)
=\mathbb E\,e_k(LZ)\overline{e_k(MZ)}.
```

Cauchy-Schwarz therefore implies

```math
|\sigma_k(B)|\le
\sqrt{\sigma_k(C_L)\sigma_k(C_R)}.                        \tag{18}
```

A second Cauchy-Schwarz inequality, this time in $`k`$, yields

```math
\sum_k|\sigma_k(B)|t^k
\le\sqrt{R_{C_L}(t)R_{C_R}(t)}
\le e^{13000t^2\|B\|_F^2}.
```

This proves (1). Since $`\|B\|_{\mathrm{op}}\le\|B\|_F`$, apply it at
$`t=(200\|B\|_F)^{-1}`$, and use
$`e^{13/40}<2`$, to obtain (2).

## 7. Relation to the permanent near the uniform matrix

Let $`J_n`$ denote the doubly stochastic matrix all of whose entries are
$`1/n`$, and let $`d_n=n!/n^n`$. Direct expansion gives, for every $`B`$,

```math
\frac{\mathop{\mathrm{per}}(J_n+B)}{d_n}
=\sum_{k=0}^n c_{n,k}\sigma_k(B),\qquad
c_{n,k}=\frac{n^k}{(n)_k}.
```

The bound $`c_{n,k}\le k^k/k!\le e^k`$ follows by increasing each factor
$`(1-j/n)^{-1}`$ to $`(1-j/k)^{-1}`$ and using the integral lower bound
for $`\log(k!)`$. Together with (2), it gives
an absolute, dimension-independent convergent majorant whenever
$`200e\|B\|_F<1`$. In particular, the terms of degree at least three
have a bound of order $`\|B\|_F^3`$, uniformly in $`n`$.

This is the application needed by the separate radial comparison note.
The coefficient theorem alone does not settle Conjecture 44. Even an
eventual-in-$`n`$ consequence leaves a finite range that requires proof.

## 8. Verification and source status

The proof uses established Gaussian Poincare and concentration inequalities.
All permanent identities, the scalar majorant, the Hessian estimates, the
rotation argument, and the constants are displayed above.

The inequalities worker independently checked the scalar majorant, the
Hessian bound $`286/3<100`$, the vanishing mean gradient, the Schatten
bound, and the Gaussian rotation and square-MGF steps. The same worker
identified and checked the Hermitian-covariance extension used above.

The accompanying exact checker compares the permanental coefficients with
Gaussian polynomial inner products on small integer Gram examples, checks
the SVD-free mixed-Gram identity on centered integer factors, and verifies
the rational constant comparisons. These checks are diagnostics for the
formulas; the all-order theorem is proved by the argument above.

References and prior-art leads:

1. M. Ledoux, *Concentration of measure and logarithmic Sobolev
   inequalities*, Seminaire de Probabilites XXXIII (1999), 120-216.
   [Author-hosted lecture notes](https://www.math.univ-toulouse.fr/~ledoux/Berlin.pdf);
   [published text](https://numdam.org/item/SPS_1999__33__120_0.pdf).
   This supplies the standard Gaussian concentration and Poincare tools.
2. B. Roos, *New permanent approximation inequalities via identities*,
   Lithuanian Mathematical Journal 60 (2020), 248-275.
   [arXiv:1612.03702](https://arxiv.org/abs/1612.03702).
   Its introduction also describes earlier higher-order expansions and
   their bounds. The quoted bounds there use a different parameter;
   no assertion is made here that they imply or fail to imply (1).
3. P. McCullagh, *An asymptotic approximation for the permanent of a
   doubly stochastic matrix*.
   [Author-hosted manuscript](https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf).
   This is a relevant prior-art lead for centered expansions; a complete
   priority comparison remains separate from the proof.
4. [Minc's list, Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html),
   accessed 2026-11-20. The listed statement remains the full zero-diagonal
   minimum problem. This note is not recorded as its resolution.

# Kovalev's conjecture

## Statement and proposed disproof

Conjecture 6.1 of Leonid V. Kovalev, *Hardy-type norms of matrices*, [arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373), printed page 9, proposes

```math
c_n\|A\|_{H^4}\leq\|A\|_{H^1_*}\leq\|A\|_{H^4}
\qquad(n>2),                                             \tag{1}
```

for every real matrix of order $`n`$. The definitions are

```math
\|A\|_{H^p}=\left(\mathbb E|AU|^p\right)^{1/p},
\qquad
\|A\|_{H^1_*}
=\sup_{\|B\|_{H^1}\leq1}\frac1n\mathop{\mathrm{tr}}(A^TB),
```

where $`U`$ is uniformly distributed on the Euclidean unit sphere. The conjectured constant, determined by a rank-two projection in the source, is

```math
c_n=\frac{2^{5/4}}{\sqrt\pi}
\frac{\Gamma((n+1)/2)}{\Gamma(n/2)}
\frac{(n+2)^{1/4}}{n^{3/4}}.                              \tag{2}
```

We give positive diagonal counterexamples to the first inequality in (1) in every order at least 500001. This refutes the full conjecture. The second inequality in (1) is not decided here. The dimension threshold is a convenient uniform estimate, not a claim about the first possible counterexample.

All comparisons in the proof are analytic or rational. The supplementary standard-library script `verify.py` repeats the finite rational arithmetic; it does not numerically integrate, search for matrices, or test a finite list of dimensions.

## 1. A Gaussian description of a dual unit vector

Let $`Z=(Z_0,\ldots,Z_{n-1})`$ be a standard real Gaussian vector, and set

```math
m_n=\mathbb E|Z|
=\sqrt2\frac{\Gamma((n+1)/2)}{\Gamma(n/2)},
\qquad N(B)=\mathbb E|BZ|.
```

Gaussian radius and direction are independent, so

```math
N(B)=m_n\|B\|_{H^1}.                                     \tag{3}
```

For any positive diagonal matrix $`B=\mathop{\mathrm{diag}}(b_0,\ldots,b_{n-1})`$, define

```math
g_i=\mathbb E\frac{b_iZ_i^2}{|BZ|},
\qquad D=\mathop{\mathrm{diag}}(g_0,\ldots,g_{n-1}).
```

For every real matrix $`C`$, pointwise Cauchy–Schwarz gives

```math
\mathbb E|CZ|
\geq\mathbb E\frac{(BZ)^T(CZ)}{|BZ|}
=\sum_i g_iC_{ii}
=\mathop{\mathrm{tr}}(D^TC),
\qquad
\mathop{\mathrm{tr}}(D^TB)=N(B).
```

In the middle equality, sign symmetry makes every off-diagonal expectation zero. All expectations are finite, because the absolute value of the inner product is bounded by $`|CZ|`$. Equality holds when $`C=B`$. This proves the needed supporting-functional identity for arbitrary matrices, without restricting the dual supremum to diagonal matrices.

Using (3), with equality attained at $`B/\|B\|_{H^1}`$, yields

```math
\|D\|_{H^1_*}=\frac{m_n}{n}.
```

Consequently

```math
A=\frac{n}{m_n}D
\quad\text{satisfies}\quad
\|A\|_{H^1_*}=1.                                         \tag{4}
```

For a diagonal vector $`g`$, the fourth spherical moment identity is

```math
\|D\|_{H^4}^4
=\frac{V(g)}{n(n+2)},
\qquad
V(g)=\left(\sum_i g_i^2\right)^2+2\sum_i g_i^4.            \tag{5}
```

For completeness, independent Gaussian moments give
$`\mathbb E|DZ|^4=(\sum_i g_i^2)^2+2\sum_i g_i^4`$;
dividing by $`\mathbb E|Z|^4=n(n+2)`$ proves (5).
Formula (2) implies

```math
c_n^4=\frac{8(n+2)m_n^4}{\pi^2n^3}.
```

Combining this with (4) and (5) gives the exact identity

```math
\left(c_n\|A\|_{H^4}\right)^4=\frac{8V(g)}{\pi^2}.        \tag{6}
```

Thus it suffices to construct $`B`$ for which $`V(g)>\pi^2/8`$.

## 2. One large coordinate and many small coordinates

Fix

```math
c=\frac1{40}.
```

For every positive integer $`k`$, take $`n=k+1`$ and

```math
B_k=\mathop{\mathrm{diag}}
\left(1,\sqrt{c/k},\ldots,\sqrt{c/k}\right).
```

Let

```math
X_k=\frac1k\sum_{i=1}^kZ_i^2,
\qquad
R_k=\sqrt{Z_0^2+cX_k},
\qquad
u_k=\mathbb E\frac{Z_0^2}{R_k},
\qquad v_k=\mathbb E\frac{X_k}{R_k}.
```

By permutation symmetry of the last $`k`$ coordinates, the gradient vector is

```math
g=\left(u_k,\sqrt{c/k}\,v_k,\ldots,\sqrt{c/k}\,v_k\right).
```

Therefore

```math
V(g)=(u_k^2+cv_k^2)^2+2u_k^4+\frac{2c^2}{k}v_k^4.         \tag{7}
```

Introduce two fixed one-dimensional expectations, with $`G`$ standard normal:

```math
a=\mathbb E\frac{G^2}{\sqrt{G^2+c}},
\qquad
b=\mathbb E\frac1{\sqrt{G^2+c}}.                          \tag{8}
```

Since $`\mathbb EX_k=1`$, convexity of
$`x\mapsto G^2/\sqrt{G^2+cx}`$ and conditional Jensen give

```math
u_k\geq a.                                               \tag{9}
```

For every nonnegative $`u`$ and positive $`x`$,

```math
\frac{x}{\sqrt{u+cx}}
\geq\frac{\min(x,1)}{\sqrt{u+c}}.                         \tag{10}
```

If $`x\leq1`$, this follows by decreasing the denominator; if $`x\geq1`$, squaring reduces it to
$`(x-1)((x+1)u+cx)\geq0`$.
Independence of $`X_k`$ and $`Z_0`$ gives

```math
v_k\geq b\,\mathbb E\min(X_k,1).
```

Moreover, centering and Cauchy–Schwarz yield

```math
\mathbb E(1-X_k)_+
=\frac12\mathbb E|X_k-1|
\leq\frac12\sqrt{\mathbb E(X_k-1)^2}
=\frac1{\sqrt{2k}}.
```

Hence, for every $`k\geq500000`$,

```math
v_k\geq\frac{999}{1000}b.                                \tag{11}
```

No limit in the matrix size has been used. Estimates (9) and (11) hold for each integer in this entire range.

## 3. Rational lower bounds for the two expectations

We prove

```math
a>\frac{7767}{10000},
\qquad b>\frac{2083}{1000}.                               \tag{12}
```

Put

```math
z=\frac c4=\frac1{160},
\qquad w=\frac{z^2}{4}=\frac1{102400},
\qquad L=\log320-\gamma,
```

where $`\gamma`$ is Euler's constant. The elementary constant estimates proved in §5 are

```math
\frac{519}{100}\lt L<\frac{649}{125},
\qquad
\sqrt{2\pi}<\frac{250663}{100000},
\qquad
\pi<\frac{355}{113}.                                    \tag{13}
```

In the integrals in (8), substitute $`G=\sqrt c\sinh t`$ on the positive half-axis. The standard integral

```math
K_\nu(z)=\int_0^\infty e^{-z\cosh t}\cosh(\nu t)\,dt
\qquad(z>0)
```

from [DLMF 10.32.9](https://dlmf.nist.gov/10.32.E9), after also replacing $`2t`$ by the integration variable, gives

```math
b=\frac{e^zK_0(z)}{\sqrt{2\pi}},
\qquad
a=\frac{ce^z}{2\sqrt{2\pi}}\bigl(K_1(z)-K_0(z)\bigr).     \tag{14}
```

The positive-axis expansions [DLMF 10.25.2](https://dlmf.nist.gov/10.25.E2) and [10.31.2](https://dlmf.nist.gov/10.31.E2) are

```math
I_0(z)=\sum_{j=0}^\infty\frac{w^j}{(j!)^2},
\qquad
K_0(z)=L I_0(z)+S(z),
\qquad
S(z)=\sum_{j=1}^\infty H_j\frac{w^j}{(j!)^2},             \tag{15}
```

where $`H_j=\sum_{i=1}^j1/i`$. All terms relevant here are positive. Since $`L>0`$, (15) gives $`K_0(z)>L`$. Using $`e^z>1+z`$ and (13) in (14) yields

```math
b>
\frac{(161/160)(519/100)}{250663/100000}
>\frac{2083}{1000}.                                      \tag{16}
```

To bound the difference in (14), use $`H_j\leq j`$ and $`1/(j!)^2\leq1`$. Termwise differentiation of the convergent series gives

```math
1\leq I_0(z)\leq\frac1{1-w},
\qquad
I_0'(z)\leq\frac{2w}{z(1-w)^2},
```

```math
0\lt S(z)\leq\frac{w}{(1-w)^2},
\qquad
S'(z)\leq\frac{2w(1+w)}{z(1-w)^3}.                        \tag{17}
```

Before evaluating at $`z=1/160`$, regard the coefficient in (15) as the function $`L(z)=\log(2/z)-\gamma`$. Thus $`L'(z)=-1/z`$. Using $`K_0'=-K_1`$ ([DLMF 10.29.3](https://dlmf.nist.gov/10.29.E3)), differentiating (15) gives

```math
K_1(z)-K_0(z)
=\frac{I_0(z)}z-L\bigl(I_0(z)+I_0'(z)\bigr)-S(z)-S'(z).
```

Consequently this difference is greater than the positive rational number

```math
T=\frac1z
-\frac{649}{125}\left(\frac1{1-w}+\frac{2w}{z(1-w)^2}\right)
-\frac{w}{(1-w)^2}-\frac{2w(1+w)}{z(1-w)^3}.              \tag{18}
```

Substitution of the rational values of $`z,w`$ gives

```math
\frac{(1/40)(161/160)T}{2(250663/100000)}
>\frac{7767}{10000}.                                    \tag{19}
```

Equations (14), (18), and (19) prove the other part of (12). Both rational comparisons (16) and (19) are explicitly reproduced in `verify.py`.

## 4. Completion of the counterfamily

Set

```math
a_0=\frac{7767}{10000},\qquad
b_0=\frac{2083}{1000},\qquad d=\frac{999}{1000}.
```

For every $`k\geq500000`$, equations (7), (9), (11), and (12) imply

```math
V(g)>(a_0^2+c d^2b_0^2)^2+2a_0^4
=\frac{1974576784456084845603270321}
{1600000000000000000000000000}.                           \tag{20}
```

The difference between the last rational number and $`(355/113)^2/8`$ is exactly

```math
\frac{8370960719747393508158728849}
{20430400000000000000000000000000}>0.                     \tag{21}
```

It follows from (13) that $`V(g)>\pi^2/8`$. The positive diagonal matrix

```math
A_k=\frac{k+1}{m_{k+1}}
\mathop{\mathrm{diag}}
\left(u_k,\sqrt{\frac1{40k}}v_k,\ldots,
\sqrt{\frac1{40k}}v_k\right)
```

therefore satisfies

```math
\|A_k\|_{H^1_*}=1\lt c_{k+1}\|A_k\|_{H^4}
\qquad\text{for every integer }k\geq500000,
```

by (4) and (6). These are full-rank real matrices. This proves the claimed disproof of (1).

## 5. Elementary certificates for the constants

Here are explicit finite bounds proving (13), so no decimal approximation of a special function is a premise.

For $`0<q<1`$, define

```math
P_M(q)=2\sum_{j=0}^{M-1}\frac{q^{2j+1}}{2j+1},
\qquad
E_M(q)=\frac{2q^{2M+1}}{(2M+1)(1-q^2)}.
```

The positive logarithmic series gives

```math
P_M(q)<\log\frac{1+q}{1-q}\lt P_M(q)+E_M(q).                 \tag{22}
```

Take ten terms at $`q=1/3,1/9,1/31`$. The identities

```math
\log320=8\log2+\log(5/4),
\qquad
\log30=5\log2-\log(16/15)
```

then produce rational enclosures. Direct substitution in (22) shows

```math
\frac{721}{125}<\log320<\frac{5769}{1000}.                \tag{23}
```

To enclose Euler's constant without a tabulated value, write

```math
H_N-\log N-\gamma
=\sum_{j=N}^\infty
\int_0^1\frac{1-t}{(j+t)(j+1)}\,dt.
```

Each summand is between $`1/[2(j+1)^2]`$ and $`1/[2j(j+1)]`$. A telescoping upper sum and an integral lower estimate give

```math
\frac1{2(N+1)}\lt H_N-\log N-\gamma<\frac1{2N}.              \tag{24}
```

At $`N=30`$, use the rational enclosure of $`\log30`$ from (22) and the exact finite sum $`H_{30}`$. The resulting rational inequalities are

```math
\frac{577}{1000}<\gamma<\frac{289}{500}.                 \tag{25}
```

Subtracting (25) from (23) proves the two stated bounds for $`L`$.

Finally, Machin's identity

```math
\pi=16\arctan(1/5)-4\arctan(1/239)
```

follows from the tangent addition formula, with the resulting angle lying in the first quadrant. Enclose each arctangent by ten alternating series terms and its first omitted term. The resulting rational upper bound is less than $`355/113`$. Squaring positive numbers then gives

```math
2\pi<\frac{710}{113}
<\left(\frac{250663}{100000}\right)^2,
```

which proves the remaining part of (13). The exact checker reproduces (23), (25), this comparison, (16), (19), and the final positive fraction (21).

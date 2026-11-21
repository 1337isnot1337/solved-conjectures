# Erdős 517: the logarithmic-derivative route and its precise gap

21 November 2026. This is a separate continuation of the
[target audit](target-and-zero-persistence.md).
It does not resolve Erdős 517. The earlier note is unchanged; the
coordinator has independently checked its application against the exact
circle indices in Murai's scanned equation (30).

The aim here was to turn finitely many preimages into a contradiction
using coefficient recurrences and finite power sums. The recurrence and
an exact all-index criterion are given below. An explicit infinite-order
example then rules out transferring the Taylor gaps to the logarithmic
derivative. No finite coefficient computation is used as proof.

## 1. Newton coefficients and an exact finite-pole criterion

Let $`F(z)=\sum_{n\geq0}c_nz^n`$ be an entire function with
$`c_0=1`$. Define $`b_n`$ recursively for every $`n\geq1`$ by

```math
b_n=nc_n-\sum_{j=1}^{n-1}b_jc_{n-j}.
\tag{1}
```

On a sufficiently small disk, $`F`$ is nonzero and multiplication of
convergent power series gives

```math
\frac{zF'(z)}{F(z)}=\sum_{n\geq1}b_nz^n.
\tag{2}
```

The following criterion includes an empty set of poles. It is not a
resolution of the conjecture; it identifies exactly what the coefficient
argument would have to exclude.

**Proposition.** Fix pairwise distinct nonzero complex numbers
$`\zeta_1,\ldots,\zeta_d`$ and positive integers
$`\mu_1,\ldots,\mu_d`$, where $`d\geq0`$. Put

```math
\varepsilon_n=b_n+\sum_{j=1}^d\mu_j\zeta_j^{-n}.
\tag{3}
```

Then

```math
\limsup_{n\to\infty}|\varepsilon_n|^{1/n}=0
\tag{4}
```

if and only if the complete zero divisor of $`F`$ consists of the points
$`\zeta_j`$ with multiplicities $`\mu_j`$.

**Proof.** If these are all the zeros, write

```math
F(z)=P(z)e^{g(z)},\qquad
P(z)=\prod_{j=1}^d(1-z/\zeta_j)^{\mu_j},\qquad g(0)=0,
\tag{5}
```

with $`g`$ entire. Since

```math
\frac{zP'(z)}{P(z)}
=-\sum_{n\geq1}\left(\sum_{j=1}^d\mu_j\zeta_j^{-n}\right)z^n
\tag{6}
```

near zero, (2) shows that $`\varepsilon_n=n[z^n]g`$. The derivative
$`zg'(z)`$ is entire, proving (4).

Conversely, (4) makes

```math
g(z)=\sum_{n\geq1}\frac{\varepsilon_n}{n}z^n
\tag{7}
```

entire. Equations (2), (3), and (6) show that $`F`$ and $`Pe^g`$ have
the same logarithmic derivative near zero and both equal one at zero.
They agree there and therefore everywhere by the identity theorem.
The exponential has no zeros, so the zero divisor is exactly the stated
one. This proves the proposition.

An initial zero of order $`q`$ causes no problem: replace the function by
$`z^{-q}F(z)`$ and normalize its nonzero constant coefficient. Translating
the Taylor support by a fixed integer preserves its zero-density
property.

Thus the full unresolved coefficient obligation is the following:
for every nonpolynomial entire series with $`c_0=1`$ and Taylor support
of density zero, and for every one fixed finite collection of pole data
as above,

```math
\limsup_{n\to\infty}
\left|b_n+\sum_{j=1}^d\mu_j\zeta_j^{-n}\right|^{1/n}>0.
\tag{8}
```

The pole data must be fixed for all indices. The case $`d=0`$ must also
be proved; a power-sum argument requiring at least one pole does not
address a zero-free counterexample. Adding or changing a constant term
preserves Taylor-support density, so this obligation applies to every
potential exceptional value in the original problem.

## 2. What a fixed-pole power-sum estimate actually supplies

Here is an elementary substitute for invoking a uniform Turán estimate.
The constants may depend on the proposed finite pole data, which is
enough for this application.

Let distinct nonzero $`\lambda_1,\ldots,\lambda_d`$ and nonzero weights
$`u_1,\ldots,u_d`$ be fixed, with $`d\geq1`$. Set

```math
s_n=\sum_{j=1}^d u_j\lambda_j^n,\qquad
\rho=\max_j|\lambda_j|>0.
\tag{9}
```

There is a constant $`A>0`$ such that, for every integer $`N\geq0`$,

```math
\max_{0\leq i\lt d}|s_{N+i}|\geq A\rho^N.
\tag{10}
```

Indeed, the vector on the left before taking its maximum is
$`V(u_j\lambda_j^N)_{j=1}^d`$, where
$`V_{ij}=\lambda_j^i`$, $`0\leq i\lt d`$. This Vandermonde matrix is
invertible. Choose any $`j_*`$ with $`|\lambda_{j_*}|=\rho`$ and use

```math
\|(s_{N+i})_{i=0}^{d-1}\|_\infty
\geq
\frac{|u_{j_*}|\rho^N}{\|V^{-1}\|_\infty}.
\tag{11}
```

If a sequence $`e_n`$ satisfies
$`\limsup |e_n|^{1/n}=0`$, its maximum on any such fixed-length block
is $`o(\rho^N)`$. Consequently (4), with $`d\geq1`$, would imply

```math
\max_{0\leq i\lt d}|b_{N+i}|\geq\frac A2\rho^N
\tag{12}
```

for all sufficiently large $`N`$. In particular, the $`b_n`$ could not
vanish on arbitrarily late blocks of $`d`$ consecutive indices.

Equation (1) does not transfer zero blocks of the $`c_n`$ to zero blocks
of the $`b_n`$. The next construction shows that this is a global failure,
even in the non-Fejér, infinite-lower-order regime.

## 3. An explicit Fabry-gap function with no gaps in its logarithmic derivative

Define

```math
m_0=1,\qquad m_j=(j+1)2^j-1\quad(j\geq1),\qquad
F(z)=\prod_{j=0}^{\infty}
\left(1+\left(\frac z{j+1}\right)^{m_j}\right).
\tag{13}
```

This construction is used only to disprove the proposed gap-transfer
step. It has infinitely many zeros and is not a counterexample to
Erdős 517. No priority claim is made for the product method.

### Entire convergence and exact Taylor support

For any fixed radius $`R`$, all sufficiently large $`j`$ satisfy
$`R/(j+1)\leq1/2`$. The corresponding product perturbations are bounded
by $`2^{-m_j}`$, whose sum converges. The product therefore converges
locally uniformly to an entire function with $`F(0)=1`$.

Write $`M_J=\sum_{j=0}^Jm_j`$. Direct summation gives

```math
M_J=J2^{J+1}-J+1\quad(J\geq0),\qquad
m_j-M_{j-1}=2^{j+1}+j-3>0\quad(j\geq1).
\tag{14}
```

The exponents are superincreasing. Every finite subset of them has a
different sum. All product coefficients are positive, so the exact
Taylor support is

```math
E=\left\{\sum_{j\in A}m_j:
A\subseteq\mathbb N\text{ finite}\right\}.
\tag{15}
```

There is no cancellation and no unlisted nonzero coefficient. Each fixed
coefficient stabilizes in the finite products once all factors of lower
or equal degree have been included.

If $`m_J\leq x\lt m_{J+1}`$, any contributing subset uses only indices
through $`J`$. Hence, for $`J\geq1`$,

```math
\frac{|E\cap[0,x]|}{x}
\leq\frac{2^{J+1}}{m_J}
\leq\frac2J\longrightarrow0.
\tag{16}
```

Thus the increasing enumeration of the actual nonzero Taylor support
has Fabry gaps.

It does not have Fejér gaps. The subset sums whose largest selected
index is $`J`$ form a disjoint block of exactly $`2^J`$ positive integers,
all at most $`M_J\leq J2^{J+1}`$. Therefore

```math
\sum_{e\in E\setminus\{0\}}\frac1e
\geq\sum_{J\geq1}\frac{2^J}{M_J}
\geq\sum_{J\geq1}\frac1{2J}=\infty.
\tag{17}
```

### Infinite lower order

All coefficients are nonnegative, so for real $`R>0`$ the maximum
modulus equals $`F(R)`$. For $`R\geq8`$, put
$`J=\lfloor R/2\rfloor-1`$. Then $`J+1\leq R/2`$ and $`J\to\infty`$,
and the $`J`$th factor alone gives

```math
\log M(R,F)\geq m_J\log2.
\tag{18}
```

Since $`m_J\geq2^J`$, it follows that

```math
\frac{\log\log M(R,F)}{\log R}
\geq\frac{J\log2+\log\log2}{\log R}
\longrightarrow\infty.
\tag{19}
```

This is infinite lower order, not merely infinite upper order.

### Every Newton coefficient is nonzero

On $`|z|<1`$, logarithmic differentiation and the geometric series give

```math
\frac{zF'(z)}{F(z)}
=\sum_{j\geq0}
\frac{m_j(z/(j+1))^{m_j}}{1+(z/(j+1))^{m_j}}.
\tag{20}
```

The series converges locally uniformly there. For each individual
coefficient, only finitely many $`j`$ contribute. Thus

```math
b_n=\sum_{m_j\mid n}
m_j(-1)^{n/m_j-1}(j+1)^{-n}.
\tag{21}
```

Every $`m_j`$ is odd, so $`n/m_j`$ and $`n`$ have the same parity when
$`m_j\mid n`$. The summands have the same sign. The $`j=0`$ term is
present at every index, giving

```math
b_n=(-1)^{n-1}\sum_{m_j\mid n}m_j(j+1)^{-n},
\qquad |b_n|\geq1\quad(n\geq1).
\tag{22}
```

This disproves any inference from Fabry sparsity of $`F`$ to even one
missing coefficient of its logarithmic derivative.

### Why growing finite-pole approximations do not suffice

Let $`P_J`$ be the product of the first $`J+1`$ factors in (13).
The difference

```math
\frac{zF'}F-\frac{zP'_J}{P_J}
\tag{23}
```

has all Taylor coefficients below $`m_{J+1}`$ equal to zero. Its exact
radius of convergence is $`J+2`$: the next factor has zeros on that
circle, and none of the other factors vanishes there. Those zeros are
simple, so its logarithmic derivative has actual poles there.

Consequently increasingly long initial coefficient intervals agree
exactly with finite rational logarithmic derivatives, and the remainder
radii tend to infinity. Nevertheless every fixed $`J`$ leaves infinitely
many poles. This is compatible with (8); it does not establish its
negation. A proof that permits the proposed finite pole set to grow with
the coefficient index has changed the required quantifiers.

## 4. Primary-source check and the remaining analytic step

The targeted search for Fabry gaps and logarithmic derivatives located
J. R. Long, *Growth of solutions of second order complex linear
differential equations with entire coefficients*, Filomat 32:1 (2018),
275–284,
[primary PDF](https://www.pmf.ni.ac.rs/filomat-content/2018/32-1/32-1-22-5387.pdf).
Its Lemmas 2.1 and 2.2 explicitly assume finite order. Its differential
equation theorems concern the growth of solutions; they do not assert
the absence of an exceptional value for every Fabry-gap entire function.
They cannot supply the unrestricted step needed here.

The exact recurrence (1) and criterion (8) remain available, but no
estimate is proved that forces (8) for every sparse entire coefficient
sequence. The Vandermonde estimate only becomes useful after a valid
condition on the Newton coefficients has been derived. Section 3 rules
out deriving that condition by transferring coefficient gaps directly,
and also rules out replacing one fixed finite pole set by growing
finite approximations.

No conjecture completion, new bounded-dimensional case, or bounty award
is claimed. The missing obligation is the fixed-pole, all-index
inequality (8), including the empty-pole case.

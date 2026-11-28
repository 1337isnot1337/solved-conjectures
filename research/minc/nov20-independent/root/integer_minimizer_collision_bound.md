# Integrality of the minimum permanent

Research checkpoint, 20 November 2026 (America/Chicago). This note proves
a structural bound for every integer minimizer in Minc Conjecture 24.
It does not prove that a minimizer is binary and does not resolve the
conjecture. The argument combines credited permanent inequalities with
an elementary multiplicity penalty. Historical priority for this
particular deduction has not been established.

## Statement

Let $`2\le k\le n`$ be integers, and let $`\Delta_n^k`$ consist of the
nonnegative integer matrices with every row and column sum equal to
$`k`$. Define

```math
\begin{aligned}
\beta_k&=\frac{(k-1)^{k-1}}{k^{k-2}},
\\ C(A)&=\sum_{i,j}\binom{a_{ij}}2,
\\ D(A)&=\sum_{i,j}(a_{ij}-1)_+,
\\ \delta_k&=\left(1-\frac2k\right)\log\left(1-\frac2k\right)
 -2\left(1-\frac1k\right)\log\left(1-\frac1k\right).
\end{aligned}
```

Use $`0\log0=0`$. The statistic $`C`$ counts unordered pairs of parallel
edge copies, while $`D`$ counts edge copies beyond the first at each
positive entry. In particular, $`D\le C`$, and $`C=0`$ exactly for binary
matrices.

**Theorem.** The following assertions hold.

1. Every $`A\in\Delta_n^k`$ satisfies

```math
\log\mathop{\mathrm{per}}A
\ge n\log\beta_k+\delta_k C(A),
\qquad \delta_k\ge\frac1{k(k-1)}>0.                 \tag{1}
```

2. Every global minimizer $`A_*`$ over $`\Delta_n^k`$ satisfies the finite
bound

```math
C(A_*)\le
\frac1{\delta_k}\log\left(
 \frac{k^{2n}}{\binom{kn}{n}\,\beta_k^n}\right)
=\frac{-\log\Pr\{\mathop{\mathrm{Bin}}(kn,1/k)=n\}}{\delta_k}. \tag{2}
```

In particular, simultaneously for all $`2\le k\le n`$,

```math
C(A_*)\le\frac1{\delta_k}
\left\{\frac12\log\frac{2\pi n(k-1)}k
 +\frac1{12n}+\frac1{12(k-1)n}\right\}.             \tag{3}
```

Thus $`C(A_*)=O(k^2\log n)`$ with an absolute implied constant. For fixed
$`k`$ this is $`C(A_*)\le(2\delta_k)^{-1}\log n+O_k(1)`$.

3. If $`n\ge2k-1`$, there is a binary $`B\in\Delta_n^k`$ obtainable from
$`A_*`$ by at most $`D(A_*)`$ legal four-entry switches. Consequently

```math
\|A_*-B\|_1\le4D(A_*)\le4C(A_*).                 \tag{4}
```

Here $`\|X\|_1=\sum_{i,j}|x_{ij}|`$ is the entrywise norm. No comparison
between $`\mathop{\mathrm{per}}B`$ and $`\mathop{\mathrm{per}}A_*`$ is asserted.
In particular, when $`k=o(\sqrt{n/\log n})`$, every integer minimizer is
within $`o(n)`$ entrywise distance of some binary matrix with the same
margins. This is a structural approximation, not the equality of minima
asked for in C24.

## The multiplicity penalty

Put $`f(x)=(1-x)\log(1-x)`$ on $`[0,1]`$, with $`f(1)=0`$.
Gurvits's Bethe lower bound, credited below, gives

```math
\log\mathop{\mathrm{per}}(A/k)
\ge\sum_{i,j}f(a_{ij}/k).                         \tag{5}
```

For $`0\le x<1`$, $`f''(x)=1/(1-x)`$ is increasing. Hence the consecutive
second differences of $`f(j/k)`$ are at least their first value
$`\delta_k=f(2/k)-2f(1/k)+f(0)`$. The endpoint $`j=k`$ follows by continuity.
Summing these differences yields, for every integer $`0\le a\le k`$,

```math
f(a/k)\ge a f(1/k)+\delta_k\binom a2.             \tag{6}
```

One can also verify (6) without endpoint differentiation. The convergent
series

```math
f(x)=-x+\sum_{\ell\ge2}\frac{x^\ell}{\ell(\ell-1)}
```

is valid up to $`x=1`$. For integers $`a\ge2`$,
$`a^\ell-a\ge\binom a2(2^\ell-2)`$: the left side counts maps from an
$`\ell`$-element set to an $`a`$-element set that use at least two values;
maps using exactly two values give the right side. Applying this
coefficientwise proves (6).

Since $`\sum a_{ij}=nk`$, summing (6) in (5) and multiplying the permanent
by $`k^n`$ gives

```math
n\log k+nk f(1/k)=n\log\beta_k,
```

which proves the first inequality in (1).

For the useful rational lower bound on $`\delta_k`$, write $`h=1/k`$.
The second difference has the integral representation

```math
\delta_k=h^2\int_0^1\int_0^1
 \frac{du\,dv}{1-h(u+v)}.
```

For $`k=2`$ first take $`h<1/2`$ and then let $`h`$ increase to $`1/2`$;
the corner singularity is integrable. Jensen's inequality gives

```math
\delta_k\ge\frac{h^2}{1-h}=\frac1{k(k-1)}.
```

For example, $`\delta_2=\log2`$ and
$`\delta_3=\log3-\tfrac43\log2`$. The inequality is a penalty per pair of
parallel copies; it does not rely on a switch reducing the permanent.

## An exact upper bound for the minimum

The next expectation is classical; the direct count specifies its model
and normalization. Give each of the $`n`$ row vertices and $`n`$ column
vertices $`k`$ distinct stubs. Choose a uniformly random bijection from
the $`kn`$ row stubs to the $`kn`$ column stubs, and let $`M`$ be the
resulting multiplicity matrix. Then $`M\in\Delta_n^k`$.

A perfect matching with specified edge copies chooses a bijection
between the original vertices ($`n!`$ choices), a row stub and a column
stub on each edge ($`k^{2n}`$ choices), and requires the resulting $`n`$
prescribed stub pairs. Their probability is $`((k-1)n)!/(kn)!`$.
Linearity of expectation therefore gives the exact identity

```math
\mathbb E\mathop{\mathrm{per}}M
=n!k^{2n}\frac{((k-1)n)!}{(kn)!}
=\frac{k^{2n}}{\binom{kn}{n}}=:R_{n,k}.           \tag{7}
```

This is an expectation in the stub model, not a uniform distribution on
integer matrices. Uniformity on matrices is unnecessary: a global
minimum is no larger than any average supported on its domain. Thus
$`\mathop{\mathrm{per}}A_*\le R_{n,k}`$. Combining this with (1) proves
(2). The binomial-probability expression follows by substitution.

The standard factorial bounds

```math
\sqrt{2\pi m}(m/e)^m\lt m!
<\sqrt{2\pi m}(m/e)^m e^{1/(12m)}
```

give

```math
\frac{R_{n,k}}{\beta_k^n}
<\sqrt{\frac{2\pi n(k-1)}k}
 \exp\left(\frac1{12n}+\frac1{12(k-1)n}\right).
```

All powers cancel exactly. This proves (3), uniformly even when $`k`$
varies with $`n`$. No probability-of-simplicity estimate is needed for
the theorem.

There is a credited constant-term sharpening for fixed $`k\ge3`$.
Bollobás and McKay's simple-graph mean is
$`(1+o(1))e^{-1/2}R_{n,k}`$. A binary competitor therefore gives

```math
C(A_*)\le\frac1{\delta_k}
\left\{\frac12\log n+
\frac12\log\frac{2\pi(k-1)}k-\frac12+o(1)\right\}. \tag{8}
```

This optional sharpening is not used to prove (2)--(4).

## A binary matrix within a bounded number of switches

This part concerns feasible margins only. Let $`A\in\Delta_n^k`$ be
nonbinary and choose $`a_{ij}\ge2`$. Let $`U`$ be the row support of
column $`j`$, and $`V`$ the column support of row $`i`$. Then
$`|U|,|V|\le k-1`$, $`i\in U`$, and $`j\in V`$. The total entry sum
in the complementary rectangle is

```math
\sum_{r\notin U,\ s\notin V}a_{rs}
=k(n-|U|-|V|)+\sum_{r\in U,\ s\in V}a_{rs}
\ge k(n-2k+2)>0.                                \tag{9}
```

Choose a positive entry $`a_{rs}`$ in that rectangle. The entries
$`a_{is}`$ and $`a_{rj}`$ are zero, and the rows and columns are distinct.
The switch

```math
A'=A-E_{ij}-E_{rs}+E_{is}+E_{rj}
```

is nonnegative integer and preserves the margins. Neither added entry
creates a repetition. Removing from $`a_{ij}\ge2`$ reduces $`D`$ by one;
removing from $`a_{rs}`$ reduces it by another one if $`a_{rs}\ge2`$.
Thus $`D(A')\le D(A)-1`$. Repeating reaches a binary matrix in at most
$`D(A)`$ switches. Each switch has entrywise distance four, proving (4).

This operation is deliberately not assigned a sign for its permanent
change. The repository already has examples where every such
collision-reducing four-switch raises the permanent. Equation (9)
establishes availability of a feasible switch, not a descent theorem.

## Exact checks and source audit

The companion script independently enumerates small integer margin
tables, checks the multiplicity penalty after clearing all denominators,
and verifies the stub-model expectation using the exact number
$`(k!)^{2n}/\prod a_{ij}!`$ of pairings producing each table. It also
checks the stated switch count and distance on seeded integer-regular
examples. These are algebra and implementation checks, not finite-order
conjecture resolutions.

The inspected sources are:

- [Gurvits, arXiv:1106.2844v11](https://arxiv.org/pdf/1106.2844v11),
  Theorem 2.2 and Section 3, equation (14): the doubly stochastic Bethe
  lower bound (5). Its discussion of integer regular matrices and
  partial matchings was also inspected. The core lower bound is prior
  work; no credit for it is claimed here.
- [Bollobás--McKay, 1986](https://users.cecs.anu.edu.au/~bdm/papers/BollobasMcKayMatchings.pdf),
  pp. 80--81: the exact pairing-model average, attributed there to
  Schrijver and Valiant. Theorem 6 on pp. 87--88 gives the simple-graph
  mean used only in (8).
- [Wanless, 2006](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf):
  equality of the exponential rates of the integer and binary minima.
  That theorem alone does not assert equality of finite-order minima.
- [The current C24 statement](https://yair-lavi.com/mincs-list/conjecture-24/index.html):
  integer domain, current open status, and previously recorded results.

Both web indexes were searched for combinations of minimum permanent,
integer regular matrices, multigraphs, parallel edges, multiplicities,
collision counts, logarithmic defects, and the Bethe lower bound. No
earlier statement of (2)--(4) was located in that bounded search. The
deduction is short enough that absence from those searches is weak
evidence of priority. This note is therefore recorded as a useful
derived restriction with priority unverified.

## Remaining mathematical gap

The logarithmic upper bound permits one or several repeated entries.
The feasible binary approximation need not have smaller permanent.
A full C24 proof still needs a permanent comparison that eliminates all
repetitions at some global minimizer; a full disproof needs an integer
matrix below the binary minimum. Neither follows from this note.

# Chen–Khare–Sahi's conjecture

## Formalization scope

The current endpoints use the standard monic triangular Macdonald eigenfunctions. Stable Hall orthogonality followed by specialization is being formalized separately. The manuscript's literal truncated finite-variable Hall pairing conflicts with that convention; the [degree-three diagnostic](https://github.com/1337isnot1337/solved-conjectures/issues/201#issuecomment-7065320695) must be reconciled before claiming a full literal-source formalization.

## Statement and result

This note disproves **Conjecture 5** in Hong Chen, Apoorva Khare and
Siddhartha Sahi, *Majorization via positivity of Jack and Macdonald polynomial
differences*, arXiv:2509.19649v2, §5. The implication from majorization to
Muirhead-semiring membership fails. The weaker evaluation-positivity
inequality is a different assertion and is not disproved here.

Work in three variables. For a partition $`\nu`$, put

```math
M_\nu=\frac{m_\nu}{m_\nu(1,1,1)},
\qquad D_{\lambda,\mu}=M_\lambda-M_\mu
\quad(\lambda\succeq\mu).
```

The Muirhead semiring $`\mathcal M_S`$ consists of finite sums with
nonnegative real coefficients of finite products of the $`M_\nu`$ and
$`D_{\lambda,\mu}`$. As in the source's §2.1, partitions have nonnegative
integer parts. The partitions in a difference have equal size.
Conjecture 5, assertion $`(2')`$, claims that

```math
\frac{P_\lambda(x;q,t)}{P_\lambda(1,1,1;q,t)}-
\frac{P_\mu(x;q,t)}{P_\mu(1,1,1;q,t)}\in\mathcal M_S
\tag{1}
```

for every $`0\lt q,t<1`$ whenever $`\lambda\succeq\mu`$.
Here $`P`$ denotes the monic Macdonald polynomial.

**Theorem.** At

```math
q=\frac1{10},\qquad t=\frac9{10},\qquad
\lambda=(4,2,0),\qquad\mu=(4,1,1),
\tag{2}
```

the normalized difference in (1) does not belong to $`\mathcal M_S`$.
The same conclusion holds, at the same parameters, for every pair

```math
(r+4,r+2,r)\succeq(r+4,r+1,r+1),\qquad r\in\mathbb Z_{\ge0}.
\tag{3}
```

The proof gives a rational linear functional that is nonnegative on the
entire relevant homogeneous part of the semiring and is strictly negative
on (1). All computations below are rational identities; `verify.py`
checks them using only Python's standard library.

## 1. A separating functional

On the degree-six symmetric polynomials define $`L`$ by

| $`\nu`$ | 600 | 510 | 420 | 411 | 330 | 321 | 222 |
|---|---:|---:|---:|---:|---:|---:|---:|
| $`L(M_\nu)`$ | 62 | 28 | 9 | 9 | 2 | 2 | 0 |

Digits abbreviate partitions; for example, 420 means $`(4,2,0)`$.
Since these seven $`M_\nu`$ form a basis, this defines $`L`$ uniquely.
Its values on the unnormalized monomial basis are

```math
(L(m_{600}),L(m_{510}),L(m_{420}),L(m_{411}),
L(m_{330}),L(m_{321}),L(m_{222}))
=(186,168,54,27,6,12,0).
\tag{4}
```

We will prove

```math
f\in\mathcal M_S,\quad f\text{ homogeneous of degree }6
\quad\Longrightarrow\quad L(f)\ge0.
\tag{5}
```

### Exhaustive reduction of the semiring

Every generator of $`\mathcal M_S`$ is homogeneous and nonnegative on the
nonnegative orthant. For differences this is Muirhead's inequality.
Consequently, if a homogeneous polynomial of degree six belongs to the
semiring, it has a representation using only products of total degree six.
Indeed, each homogeneous component of any other degree in a proposed
representation is a nonnegative sum of nonnegative polynomials and is
identically zero. Every nonzero summand in such a component would be
positive somewhere on the positive orthant, which is impossible.

There are two further reductions.

1. A difference $`M_\lambda-M_\mu`$ is a sum of differences along a
   saturated chain from $`\lambda`$ to $`\mu`$ in dominance order.
   Thus it suffices to use cover differences.
2. A product of ordinary $`M`$-factors has nonnegative coefficients in
   the monomial basis and is symmetric. It is therefore a nonnegative
   linear combination of single $`M_\rho`$. Thus a product containing
   differences needs at most one ordinary $`M`$-factor.

Every nonzero difference has degree at least two. A degree-six product
therefore has at most three difference factors. The exhaustive remaining
list consists of:

- 27 products with one cover difference;
- 10 products with two cover differences;
- the cube of the unique degree-two difference;
- the seven ordinary degree-six monomials $`M_\nu`$.

For completeness, the cover differences in degrees two through six are

| Degree | Covers $`\lambda\gtrdot\mu`$ |
|---|---|
| 2 | 200–110 |
| 3 | 300–210, 210–111 |
| 4 | 400–310, 310–220, 220–211 |
| 5 | 500–410, 410–320, 320–311, 311–221 |
| 6 | 600–510, 510–420, 420–411, 420–330, 411–321, 330–321, 321–222 |

The following table checks all 38 products. Write $`D_{a,b}=M_a-M_b`$
and $`M_{000}=1`$.

| Product | $`L`$ value |
|---|---:|
| $`D_{200,110}M_{400}`$ | 5 |
| $`D_{200,110}M_{310}`$ | 4 |
| $`D_{200,110}M_{220}`$ | 4 |
| $`D_{200,110}M_{211}`$ | 3 |
| $`D_{300,210}M_{300}`$ | 9 |
| $`D_{300,210}M_{210}`$ | 9 |
| $`D_{300,210}M_{111}`$ | 7 |
| $`D_{210,111}M_{300}`$ | 4 |
| $`D_{210,111}M_{210}`$ | 2 |
| $`D_{210,111}M_{111}`$ | 2 |
| $`D_{400,310}M_{200}`$ | 16 |
| $`D_{400,310}M_{110}`$ | 15 |
| $`D_{310,220}M_{200}`$ | $`14/3`$ |
| $`D_{310,220}M_{110}`$ | $`14/3`$ |
| $`D_{220,211}M_{200}`$ | $`5/3`$ |
| $`D_{220,211}M_{110}`$ | $`2/3`$ |
| $`D_{500,410}M_{100}`$ | 24 |
| $`D_{410,320}M_{100}`$ | 11 |
| $`D_{320,311}M_{100}`$ | 0 |
| $`D_{311,221}M_{100}`$ | 3 |
| $`D_{600,510}`$ | 34 |
| $`D_{510,420}`$ | 19 |
| $`D_{420,411}`$ | 0 |
| $`D_{420,330}`$ | 7 |
| $`D_{411,321}`$ | 7 |
| $`D_{330,321}`$ | 0 |
| $`D_{321,222}`$ | 2 |
| $`D_{200,110}^2M_{200}`$ | $`2/3`$ |
| $`D_{200,110}^2M_{110}`$ | $`1/3`$ |
| $`D_{200,110}D_{300,210}M_{100}`$ | $`2/3`$ |
| $`D_{200,110}D_{210,111}M_{100}`$ | $`2/3`$ |
| $`D_{200,110}D_{400,310}`$ | 1 |
| $`D_{200,110}D_{310,220}`$ | 0 |
| $`D_{200,110}D_{220,211}`$ | 1 |
| $`D_{300,210}^2`$ | 0 |
| $`D_{300,210}D_{210,111}`$ | 2 |
| $`D_{210,111}^2`$ | 0 |
| $`D_{200,110}^3`$ | $`1/3`$ |

These entries can be obtained by expanding
$`M_\nu=|\mathop{\mathrm{Orb}}(\nu)|^{-1}
\sum_{e\in\mathop{\mathrm{Orb}}(\nu)}x^e`$ and applying the first table.
The verifier generates the cover list independently from dominance
inequalities, enumerates precisely the cases above, and recomputes every
entry. All are nonnegative. The ordinary monomial generators also have
nonnegative $`L`$-values, proving (5).

## 2. Exact Macdonald polynomials

At the rational parameters (2), the two required monic polynomials are

```math
\begin{aligned}
P_{420}={}&m_{420}
+\frac{11}{91}(m_{411}+m_{330})
+\frac{1143098}{9092629}m_{321}
+\frac{27053496033}{90189787051}m_{222},\\
P_{411}={}&m_{411}
+\frac{111}{991}m_{321}
+\frac{1221}{90181}m_{222}.
\end{aligned}
\tag{6}
```

Here is an independent way to verify their identification that does not
use the branching implementation that found the example. The first
Macdonald difference operator is

```math
\mathscr D f(x)=\sum_{i=1}^3
\prod_{j\ne i}\frac{tx_i-x_j}{x_i-x_j}\,
f(x_1,\ldots,qx_i,\ldots,x_3).
\tag{7}
```

It is triangular on the monomial basis, with diagonal eigenvalues

```math
\eta_\nu=q^{\nu_1}t^2+q^{\nu_2}t+q^{\nu_3}.
```

The monic triangular eigenpolynomial with eigenvalue $`\eta_\nu`$ is
$`P_\nu`$. At (2), the seven degree-six eigenvalues are distinct.
Direct substitution of (6) into (7) gives

```math
\mathscr D P_{420}=\frac{1009081}{10^6}P_{420},
\qquad
\mathscr D P_{411}=\frac{190081}{10^6}P_{411}.
\tag{8}
```

These checks are polynomial identities after multiplication by
$`\Delta=(x_1-x_2)(x_1-x_3)(x_2-x_3)`$. For example, writing the variables
as $`x,y,z`$, the three coefficients after this multiplication are

```math
\begin{aligned}
W_1&=(y-z)(tx-y)(tx-z),\\
W_2&=-(x-z)(ty-x)(ty-z),\\
W_3&=(x-y)(tz-x)(tz-y).
\end{aligned}
```

The verifier expands $`\sum_i W_iP(x_1,\ldots,qx_i,\ldots,x_3)`$ and
compares every rational monomial coefficient with that of
$`\eta_\nu\Delta P`$. It also checks distinctness of all seven
eigenvalues, monicity, and triangular support. This proves (6) using
the defining eigenfunction characterization.

The evaluations and functional values are

```math
\begin{aligned}
P_{420}(1,1,1)&=\frac{701634925737}{90189787051},
&L\!\left(\frac{P_{420}}{P_{420}(1,1,1)}\right)
&=\frac{198743600783}{25986478731},\\
P_{411}(1,1,1)&=\frac{332370}{90181},
&L\!\left(\frac{P_{411}}{P_{411}(1,1,1)}\right)
&=\frac{284011}{36930}.
\end{aligned}
```

Subtracting gives

```math
L\!\left(\frac{P_{420}}{P_{420}(1,1,1)}
-\frac{P_{411}}{P_{411}(1,1,1)}\right)
=-\frac{4538292661539}{106631184392870}<0.
\tag{9}
```

Because $`420\succeq411`$, equations (5) and (9) contradict (1).
This proves the first assertion of the theorem.

## 3. Rectangular translates give an infinite counterfamily

Write $`e_3=x_1x_2x_3`$. We first prove the following property of the
whole Muirhead semiring:

```math
e_3^rF\in\mathcal M_S\quad\Longrightarrow\quad
F\in\mathcal M_S\qquad(r\in\mathbb Z_{\ge0}).
\tag{10}
```

For a monomial generator $`M_\nu`$, its order of vanishing in $`x_3`$
is $`\nu_3`$, and

```math
M_\nu=e_3^{\nu_3}M_{\nu-\nu_3(1,1,1)}.
```

For a nonzero difference $`D_{\lambda,\mu}`$, dominance implies
$`\lambda_3\le\mu_3`$, so

```math
D_{\lambda,\mu}=e_3^{\lambda_3}
D_{\lambda-\lambda_3(1,1,1),\,
   \mu-\lambda_3(1,1,1)}.
\tag{11}
```

The residual factor in (11) is again a Muirhead difference. Its restriction
to $`x_3=0`$ is nonnegative and is not identically zero: the first partition
has last part zero; the second either has positive last part, in which case
its monomial restriction vanishes, or also has last part zero, in which
case the two distinct monomial symmetric polynomials in the remaining
variables cannot cancel. Thus the order in $`x_3`$ of this difference is
exactly $`\lambda_3`$.

It follows that every nonzero product of generators can be written
$`e_3^aG`$, where $`G\in\mathcal M_S`$ and $`G(x_1,x_2,0)`$ is a nonzero
nonnegative polynomial. In a finite nonnegative sum of such products,
terms of minimum order $`a`$ cannot cancel: their leading coefficients
are nonnegative functions on the positive quadrant and are not all zero.
Consequently, if the sum is divisible by $`x_3^r`$, every product in the
sum has $`a\ge r`$. Dividing each product by $`e_3^r`$ leaves
$`e_3^{a-r}G\in\mathcal M_S`$, proving (10).

The standard rectangular-translation identity is

```math
P_{\nu+r(1,1,1)}(x;q,t)=e_3^rP_\nu(x;q,t).
```

Normalization at $`(1,1,1)`$ preserves this identity. Thus the difference
for the pair (3) is $`e_3^r`$ times the difference in (9). If any such
translate belonged to the semiring, (10) would imply that the original
difference did too. This contradiction proves the whole family (3).

## 4. Scope and validation

This is a counterexample to the complete equivalence asserted in
Conjecture 5, through its majorization-to-semiring implication. It makes
no claim that the ordinary evaluation difference is negative. In fact,
Sra's October 2026 paper proves evaluation positivity for the very pair
$`(4,2,0)\succeq(4,1,1)`$, in Certificate 4.1.

The authors' Example 4.1 concerns a Schur difference outside the smaller
Muirhead **cone** and explicitly represents it inside the semiring.
Their Example 4.7 concerns a different Jack semiring and reverses the
allowed parameter order. Neither is the counterexample proved here.
The Jack-semiring Conjecture 4 remains untouched by this argument.

Validation performed:

- exact discovery by Macdonald branching and a rational dual functional;
- independent identification by the first Macdonald difference operator;
- exhaustive reduction of the full degree-six semiring to 38 products;
- an independently written standard-library check of the same 38 products;
- exact rational evaluations in (6)–(9);
- separate source and prior-status audits.

Run `python verify.py`. No numerical approximation or Lean verification is
used in the certificate. The auxiliary discovery scripts use numerical
linear programming only to propose functionals; that search is not part
of the proof.

## Sources

1. Hong Chen, Apoorva Khare and Siddhartha Sahi, *Majorization via positivity
   of Jack and Macdonald polynomial differences*, arXiv:2509.19649v2,
   Conjecture 5, equation (5.7), and the Muirhead-semiring definition in §1.
   <https://arxiv.org/html/2509.19649v2>
2. I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, second
   edition, Oxford University Press, 1995, Chapter VI, §4, for the
   difference-operator characterization and rectangular translations.
   The operator and eigenfunction characterization also appear explicitly
   in A. M. Garsia and M. Haiman, *A remarkable q,t-Catalan sequence and
   q-Lagrange inversion*, §2, equations (2.1)–(2.5), printed page 14:
   <https://math.berkeley.edu/~mhaiman/ftp/remarkable-qtcat/qtcat.pdf>
3. Suvrit Sra, *On majorization inequalities for normalized Jack and
   Macdonald polynomials*, 8 October 2026, Certificate 4.1 and §1.3.
   <https://suvrit.github.io/papers/jackratio/jackratio-v1.pdf>
   Also available at <https://hexagonmath.org/pdf/2610.00725v1>.

See `SOURCE_AUDIT.md` for the separate priority search and
`ANALYSIS_REVIEW.md` for independent review.

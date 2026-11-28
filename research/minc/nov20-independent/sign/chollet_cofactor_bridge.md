# An unresolved cofactor comparison for Chollet's conjecture

Date: 2026-11-20 (America/Chicago).

Status: an exact sufficient reduction, source check, and diagnostic record.
The central lower bound below is unproved. No full Minc entry is resolved.

## 1. The comparison under investigation

For a positive semidefinite Hermitian matrix $`A`$ of order $`n`$, write

```math
P=\mathop{\mathrm{per}}A,\qquad
Q=\mathop{\mathrm{per}}(A\circ\overline A),\qquad
\Gamma_{ij}=a_{ij}\mathop{\mathrm{per}}A(i\mid j),\qquad
S=\|\Gamma\|_F^2.
```

The proposed lower comparison is

```math
\boxed{S\stackrel{?}{\ge} nQ.}
\tag{1}
```

Together with the established upper bound $`S\le nP^2`$, this would prove
the self-conjugate form of Chollet's conjecture in every order. Ordinary
Cauchy-Schwarz on permutation monomials then gives its arbitrary-pair
form. No inequality in this paragraph assumes the false assertion that
$`P`$ is the largest eigenvalue of $`\Gamma`$.

Both $`\Gamma`$ and $`A\circ\overline A`$ are positive semidefinite, and
$`\Gamma\mathbf1=P\mathbf1`$. Those abstract facts alone have not been
shown to imply (1). The dependence of the cofactor matrix on the same
input $`A`$ must be retained.

## 2. Primary-source verification of the upper bound

Pate's published indicator theorem concerns

```math
\mathcal C_k(H)_{U,V}
=\mathop{\mathrm{per}}H[U,V]
 \mathop{\mathrm{per}}H[U^c,V^c].
```

It states, for positive semidefinite Hermitian $`H`$ and a vector $`x`$
whose entries are zero or one,

```math
x^*\mathcal C_k(H)x\le\|x\|_2^2\mathop{\mathrm{per}}H.
\tag{2}
```

The primary publisher abstract of T. H. Pate, *On permanental compounds*,
Linear Algebra and its Applications 429 (2008), 1093-1101,
[DOI](https://doi.org/10.1016/j.laa.2007.05.019), states this exact theorem
and defines the complementary-permanent matrix. The full 2008 PDF was
not retrieved. Section 5 of Aouichaoui and Zhang's
[2026 preprint](https://www.preprints.org/manuscript/202609.2464) was
read in full; it reproduces (2) and distinguishes it from the disproved
spectral conjecture. The older result is used as a published theorem,
not as a theorem proved by this checkpoint.

Apply (2) to

```math
H=A\oplus\overline A,\qquad k=2,
\qquad U_i=\{i,n+i\}\quad(1\le i\le n),
```

and let $`x`$ indicate the $`n`$ subsets $`U_i`$. Block diagonality gives

```math
\mathcal C_2(H)_{U_i,U_j}
=|a_{ij}|^2\left|\mathop{\mathrm{per}}A(i\mid j)\right|^2
=|\Gamma_{ij}|^2.
```

Since $`\|x\|^2=n`$ and $`\mathop{\mathrm{per}}H=P^2`$, equation (2)
gives $`S\le nP^2`$. This is the previously recorded
[Pate deduction](../../inequalities/pate_packet_correction.md).

## 3. Why principal-minor induction does not prove the lower bound

Laplace expansion of the nonnegative matrix $`A\circ\overline A`$ gives

```math
nQ
=\sum_{i,j}|a_{ij}|^2
\mathop{\mathrm{per}}\bigl(|A(i\mid j)|^2\bigr).
```

Thus (1) asks whether

```math
\sum_{i,j}|a_{ij}|^2
\left(
\left|\mathop{\mathrm{per}}A(i\mid j)\right|^2
-\mathop{\mathrm{per}}\bigl(|A(i\mid j)|^2\bigr)
\right)\ge0.
\tag{3}
```

For $`i=j`$, smaller-order Chollet would make the bracket nonnegative.
For $`i\ne j`$, the deleted matrix need not be Hermitian. The same
induction hypothesis cannot be applied to it.

Even the corresponding weighted sum for one fixed row can be negative.
Consider the exact matrix

```math
A=\begin{pmatrix}
25&15&15
\\ 15&20&-2
\\ 15&-2&20
\end{pmatrix}.
```

It is the Gram matrix of the three columns of

```math
\begin{pmatrix}5&3&3\\0&\sqrt{11}&-\sqrt{11}\end{pmatrix},
```

so it is positive semidefinite. Its row-one contribution to (3) is
$`-6100000`$, while the complete sum is $`165620000>0`$. Its permanent
is $`18200`$ and $`Q=140915000`$. The example disproves the row-wise
strengthening, not the averaged comparison (1) or Chollet's conjecture.

## 4. The exact order-three identity

For a correlation matrix of order three, put

```math
x=|a_{12}|^2,\quad y=|a_{13}|^2,\quad z=|a_{23}|^2,
\qquad w=a_{12}a_{23}a_{31}.
```

Direct expansion gives

```math
\begin{aligned}
S-3Q
&=2(x+y+z)(1+2\mathop{\mathrm{Re}}w)
\\ &=2(x+y+z)\bigl(\det A+x+y+z\bigr)\ge0.
\end{aligned}
\tag{4}
```

The last equality uses
$`\det A=1-x-y-z+2\mathop{\mathrm{Re}}w`$. Diagonal congruence extends
the identity with its homogeneous scale to positive diagonal matrices.
A zero diagonal in a positive semidefinite matrix forces a zero row and
all the terms in (1) vanish. At order two, $`S=2Q`$ identically. These
formulas calibrate the proposed general argument; they are not being
counted as new small-order Chollet results.

## 5. Permutation correlations

For $`\sigma\in S_n`$, let

```math
p_\sigma=\prod_i a_{i,\sigma(i)},\qquad
f(\pi)=\sum_{\sigma\in S_n}p_\sigma\overline{p_{\sigma\pi}}.
```

Then

```math
Q=f(e),\qquad
P^2=\sum_\pi f(\pi),\qquad
S=\sum_\pi\mathop{\mathrm{fix}}(\pi)f(\pi).
\tag{5}
```

For the last equality, expand every squared cofactor product in $`S`$.
The pair $`(\sigma,\tau)`$ occurs once for every position where the two
permutations agree. With $`\tau=\sigma\pi`$, that number is
$`\mathop{\mathrm{fix}}(\pi)`$. Therefore the unresolved assertion is

```math
\sum_{\pi\ne e}\mathop{\mathrm{fix}}(\pi)f(\pi)\ge0.
\tag{6}
```

Individual summands need not be nonnegative, even for positive
semidefinite input. For the three-by-three regular-simplex correlation
matrix $`Y_3`$ with diagonal one and off-diagonal entries $`-1/2`$,

```math
f((123))=-\frac3{64}.
```

For $`Y_3\oplus I_{n-3}`$ and $`n\ge4`$, the same permutation fixes
$`n-3`$ positions. Its contribution to (6) is strictly negative.
An argument based on termwise positivity is thus invalid.

The fixed-point character is the sum of the trivial and standard
characters. If $`F_\lambda(A)`$ are the Fourier blocks of the Schur
power matrix, then equivalently

```math
S=P^2+\|F_{(n-1,1)}(A)\|_F^2,\qquad
Q=\frac1{n!}\sum_{\lambda\vdash n}d_\lambda
\|F_\lambda(A)\|_F^2.
```

Thus (1) would compare total Fourier energy with these first two
blocks. Arbitrary positive definite functions on the symmetric group
do not satisfy this assertion. They cannot replace the diagonal-product
function of a positive semidefinite Gram matrix.

## 6. Published examples and current source boundaries

The checker evaluates the exact gap for the following two published
permanent-on-top examples and their entire diagonal interpolations
$`A(t)=\mathop{\mathrm{diag}}A+t(A-\mathop{\mathrm{diag}}A)`$,
$`0\le t\le1`$:

- H. A. Tran's order-five example with diagonal-product permanent
  $`504`$,
  [primary paper](https://files.ele-math.com/articles/mia-25-01.pdf).
- S. W. Drury's order-eight Gaussian-integer Gram example, with
  permanent $`2977257622144118400`$,
  [primary paper](https://files.ele-math.com/articles/mia-21-37.pdf).

For both, $`S(A(t))-nQ(A(t))`$ has a factor $`t^2`$ and the remaining
polynomial has positive Bernstein coefficients on $`[0,1]`$. The Drury
example already has positive remaining power coefficients. These
specific examples therefore do not refute (1). The calculation only
rejects that proposed source of witnesses; it is not evidence that an
all-order inequality has been proved.

Fresh searches used both engines, the exact Chollet name, cofactor and
Frobenius terms, recent-date filters, and the live
[Minc C30 page](https://yair-lavi.com/mincs-list/conjecture-30/index.html).
No general proof of (1) or full Chollet was located.

Two current primary-source boundaries are relevant:

- S. Schubr,
  [rank-four continuation, edition 6, 20 November 2026](https://research.luminaryoddities.org/chollets-inequality-positive-semidefinite-matrices-rank-at-most-four/v/6),
  claims all-order rank-at-most-four Chollet by combining a finite
  continuation with Ma's theorem. The eight-page paper was opened;
  its Sections 1-4 and its stated dependency structure were examined.
  Its underlying singular-five certificate was not independently
  replayed. This is outside work and is not an unrestricted theorem.
- S. Schubr,
  [Sharp limitations of two permanental cofactor comparisons](https://research.luminaryoddities.org/sharp-limitations-two-permanental-cofactor-comparisons/v/2),
  studies different individual cofactor comparisons. The primary
  abstract states that they have no finite universal constant from
  order three onward. That statement does not itself refute the
  averaged comparison (1).

The existing scalar border-evaluation obstruction, arbitrary-polynomial
Gaussian replacement obstruction, and false spectral dominance do not
prove or disprove (1). The next required step is a proof of (3) retaining
all cross-minor terms, or an exact positive semidefinite witness with
a negative complete sum.

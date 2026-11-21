# Odd-prime obstruction to Hadamard doubling

Date: 20 November 2026 (America/Chicago).

Status: an all-order obstruction to one proposed construction for
[Kräuter's minimum sign-matrix permanent](https://yair-lavi.com/mincs-list/conjecture-36/index.html).
The note also gives the exact cycle and path sums produced by the
construction. It does not resolve Conjecture 36 or
[Wang's admissible-order problem](https://yair-lavi.com/mincs-list/problem-7/index.html).
No full Minc entry is counted.

The proof and cycle/path identities were independently reviewed by
root and the inequalities worker; see the
[written review](../inequalities/hadamard_doubling_review.md).

## 1. The construction being tested

Write

```math
H=\begin{pmatrix}1&1\\1&-1\end{pmatrix},\qquad
D(A)=H\otimes A=\begin{pmatrix}A&A\\A&-A\end{pmatrix}.
```

For an attaining sign matrix $`A`$ of order $`n`$, an odd-order
doubling would need to produce an order-$`2n+1`$ sign matrix with
absolute permanent

```math
q(2n+1)=2^nq(n),\qquad
q(n)=2^{n-\lfloor\log_2(n+1)\rfloor}.
```

Unlike a lift with one unchanged variable block, this construction
uses four signed copies of every core entry. The earlier obstruction
to a literal single-core block does not settle it.

The following theorem rules out a universal assertion that every
attaining core can be doubled in this way and then completed with an
arbitrary sign border. Its consequence also excludes repairing the
highly symmetric cores below with a sublinear number of entry changes
and border rows.

## 2. An untouched odd orbit forces divisibility

**Theorem.** Let $`A`$ be an integer matrix of order $`n`$. Let
$`p`$ be an odd prime, and suppose a permutation $`\pi`$ is one
$`p`$-cycle on a set $`S\subseteq[n]`$ and fixes all other indices.
Assume

```math
a_{\pi(i),\pi(j)}=a_{ij}\qquad(i,j\in[n]).                 \tag{1}
```

Let $`B`$ be any square submatrix of $`D(A)`$ whose retained rows and
columns include both copies of every index in $`S`$. Then

```math
p\mid\operatorname{per}B.                               \tag{2}
```

Rows and columns outside these two copies can be deleted independently,
provided the resulting submatrix is square. In particular, the assertion
does not require a principal minor.

**Proof.** Label each row and column of $`D(A)`$ by
$`(\alpha,i)`$, where $`\alpha\in\{0,1\}`$. Its entry is
$`h_{\alpha\beta}a_{ij}`$. Apply $`\pi`$ to the original index
on both sides. This preserves $`B`$ and every matching weight by (1).

The cyclic group of order $`p`$ acts on the perfect matchings of
$`B`$. A nonfixed orbit contains exactly $`p`$ matchings with equal
integer weights, so its contribution is divisible by $`p`$.

A fixed matching is an equivariant bijection between the row and
column sets. Every moved row belongs to an orbit of size $`p`$ and
must map to an orbit of the same size: an equivariant bijection preserves
orbit size. There are exactly two moved row orbits and two moved column
orbits, one for each value of $`\alpha`$ or $`\beta`$. The fixed
matching therefore pairs these two row orbits with the two column
orbits, and matches all remaining fixed vertices among themselves.

Write $`S=\{s_0,\ldots,s_{p-1}\}`$, with
$`\pi(s_t)=s_{t+1}`$ and subscripts taken modulo $`p`$.
For a chosen row-orbit/column-orbit pair, each equivariant bijection
has the form $`s_t\mapsto s_{t+k}`$. Put

```math
R=\sum_{k=0}^{p-1}\prod_{t=0}^{p-1}a_{s_t,s_{t+k}}.
```

The total weight of the equivariant maps from orbit $`\alpha`$ to
orbit $`\beta`$ is

```math
h_{\alpha\beta}^{p}R=h_{\alpha\beta}R,
```

because $`p`$ is odd and $`h_{\alpha\beta}\in\{1,-1\}`$.
The sum over the two possible pairings of the moved row and column
orbits is consequently

```math
\operatorname{per}(RH)=R^2\operatorname{per}H=0.
```

This factor multiplies the permanent of the submatrix on the remaining
fixed vertices. Thus the total weight of all fixed matchings is zero,
and every remaining orbit contributes a multiple of $`p`$. This proves
(2). The empty remaining submatrix has permanent one, as usual.

## 3. Arbitrary borders and entry changes

Set $`A_n=J_n-2I_n`$, where $`J_n`$ is the all-ones matrix.
It satisfies (1) for every simultaneous permutation of its indices.
Start with $`D(A_n)`$, change at most $`s`$ of its entries to arbitrary
integers, and then add $`d`$ rows and $`d`$ columns with arbitrary
integer entries. Call the resulting square matrix $`F`$.

**Corollary.** Every odd prime $`p\le n-2s-2d`$ divides
$`\operatorname{per}F`$.

**Proof.** Mark each original index incident to a changed entry,
whether as a row index or a column index. At most $`2s`$ indices are
marked. Fix all matching edges incident to one of the new border
vertices. If $`k`$ old rows are matched to new columns, then exactly
$`k`$ new rows are matched to old columns, with $`0\le k\le d`$.
The unmatched old vertices form a square core minor with $`k`$ old
rows and $`k`$ old columns removed. These removals touch at most
$`2k\le2d`$ original indices.

At least $`n-2s-2d`$ original indices are both unmarked and untouched
by the removals. Select $`p`$ of them and cycle them simultaneously.
Both copies of these indices remain. Every changed entry is fixed
under the cycle, and the unchanged entries are invariant. The preceding
proof applies to the surviving core minor: its moved-orbit contribution
is still the permanent of a scalar multiple of $`H`$, hence zero.
Each fixed choice of border-incident matching edges therefore contributes
a multiple of $`p`$. Summing over those choices proves the corollary.

There is no claim about a rectangular permanent hidden in this step.
Fixing all border-incident matching edges leaves equal numbers of old
rows and old columns, so the core permanent used in the proof is square.

Taking $`p=3`$ gives the useful consequence

```math
n\ge2s+2d+3
\quad\Longrightarrow\quad
3\mid\operatorname{per}F.                               \tag{3}
```

If $`F`$ is a sign matrix, it cannot have a nonzero pure power of two
as its permanent under this condition. Avoiding this obstruction
requires $`s+d>(n-3)/2`$. This is a necessary condition for this
specific construction, not a sufficient one.

All conclusions survive arbitrary row and column sign changes and
permutations of the doubled core. Such operations only change the sign
of a given minor's permanent or relabel the minors. One can undo the
operations before the argument, allowing the arbitrary border entries
and the changed positions to transform with them. In particular, sign
gauges on the smaller core do not evade (3).

## 4. An attaining core that cannot be lifted

The published order-five attaining matrix $`A_5=J_5-2I_5`$ has

```math
\begin{aligned}
\operatorname{per}A_5
&=\sum_{k=0}^5\binom5k(-2)^k(5-k)!\\
&=120-240+240-160+80-32=8=q(5).
\end{aligned}                                            \tag{4}
```

It is Wanless's $`T_5\{0\}`$ example. For $`n=5,s=0,d=1`$,
(3) shows that **every** order-eleven matrix obtained by adding one
row and column to $`D(A_5)`$ has permanent divisible by three,
regardless of the integer border entries. The required value is

```math
q(11)=2^{11-\lfloor\log_2 12\rfloor}=256=2^5q(5),         \tag{5}
```

which is not divisible by three. The obstruction therefore applies
to every sign border and every sign gauge of this attaining core.
It does not claim that no order-eleven attaining sign matrix exists;
that order was settled in Wanless's published finite constructions.

The same argument with $`s=1,d=0`$ rules out repairing the doubled
order-ten matrix with one entry change: all resulting permanents are
divisible by three, whereas $`q(10)=128`$.

For an additional exact check, let $`M(A)`$ denote the top-left
$`n\times n`$ block of the permanental cofactor matrix of $`D(A)`$.
Direct integer coefficient extraction gives

```math
\operatorname{per}D(A_5)=0,\qquad
M(A_5)=-192(J_5+I_5).                                    \tag{6}
```

The checker verifies these values. The universal exclusions above
follow from the group-action proof, independently of (6).

## 5. Exact cycle and path sums for general cores

The construction can still be considered for a more restrictive class
of cores without the odd orbit. Here is its exact algebraic target.
These formulas hold for arbitrary matrices $`A`$ over a commutative
ring; the graph explanation can first be read as a polynomial identity
over the integers.

For a permutation $`\sigma`$, put
$`w_A(\sigma)=\prod_i a_{i,\sigma(i)}`$.
Define

```math
U(A)=\sum_{\substack{\sigma,\tau\in S_n\\
                   \text{every cycle of }\sigma^{-1}\tau
                   \text{ has even length}}}
       w_A(\sigma)w_A(\tau).                            \tag{7}
```

The composition in (7) is understood as a map on the row labels:
$`i\mapsto\sigma^{-1}(\tau(i))`$. In particular, $`U(A)=0`$
when $`n`$ is odd.

For row $`i`$ and column $`j`$, define $`T_{ij}(A)`$ similarly,
except that $`\tau`$ runs through bijections
$`[n]\setminus\{i\}\longrightarrow[n]\setminus\{j\}`$.
The graph of the partial map $`\sigma^{-1}\tau`$ consists of one
directed path and some cycles. Require each cycle to have even length,
and impose no additional condition on the path. The summand is

```math
\left(\prod_{r=1}^n a_{r,\sigma(r)}\right)
\left(\prod_{r\ne i}a_{r,\tau(r)}\right).                \tag{8}
```

Then

```math
\operatorname{per}D(A)=
\begin{cases}
0,&n\text{ odd},\\
(-1)^{n/2}2^nU(A),&n\text{ even},
\end{cases}                                             \tag{9}
```

and

```math
M(A)=(-1)^{\lceil n/2\rceil}2^{n-1}T(A).                 \tag{10}
```

**Proof of the factors.** Collapse the two copies of every original
row and column in a matching of $`D(A)`$. Each resulting vertex has
degree two, so the projected multigraph is a disjoint union of
alternating cycles. A doubled edge contributes zero, since its copy
assignments sum to $`\operatorname{per}H=0`$.

On a simple cycle with $`k`$ original rows and $`k`$ original
columns, sum over the two copy assignments at every vertex. Label a
choice by bits $`r_t,c_t`$. Up to a harmless consistent choice of
the cycle direction, its sign is

```math
(-1)^{\,k+\sum_t r_t+\sum_t c_t+
                  \sum_t r_t(c_t+c_{t-1})}.
```

Summing the $`r_t`$ imposes $`c_t+c_{t-1}=1`$ modulo two.
There are no solutions for odd $`k`$; for even $`k`$ there are two,
and the signed sum is $`(-1)^{k/2}2^{k+1}`$.

Thus every surviving cycle has bipartite length divisible by four.
If there are $`c`$ cycles, the total copy-assignment factor is
$`(-1)^{n/2}2^{n+c}`$. An ordered pair of perfect matchings with
that union has exactly $`2^c`$ choices of alternating edge colors.
This proves (9).

For the cofactor in (10), the projected graph has one open path from
row $`i`$ to column $`j`$, and otherwise the same cycles. Let the
path have $`\ell`$ row vertices and $`\ell`$ column vertices.
The remaining copies at its endpoints are both labeled one, because
the deleted row and column lie in the top-left block. Put

```math
J=\begin{pmatrix}0&1\\1&0\end{pmatrix},\qquad
R=\begin{pmatrix}0&1\\-1&0\end{pmatrix}.
```

The sum over internal copy assignments on the path is the
$`(1,1)`$ entry, with bit indices, of

```math
(HJ)^{2\ell-2}H=2^{\ell-1}R^{\ell-1}H.
```

It equals
$`(-1)^{\lceil\ell/2\rceil}2^{\ell-1}`$.
Every surviving cycle has an even number of original row vertices,
so $`n-\ell`$ is even. Combining its factor with the cycle factors
therefore gives
$`(-1)^{\lceil n/2\rceil}2^{n-1+c}`$.
There are exactly $`2^c`$ alternating colorings into a full matching
and a matching missing row $`i`$ and column $`j`$: the colors on
the open path are forced at the endpoints. This proves (10).

## 6. What a usable recursion would still have to prove

Swapping the two halves of the rows or columns in $`D(A)`$ shows
that its full permanental cofactor matrix is

```math
\begin{pmatrix}M(A)&(-1)^nM(A)\\
                (-1)^nM(A)&-M(A)\end{pmatrix}.             \tag{11}
```

For sign vectors $`r,c\in\{1,-1\}^n`$ and $`e\in\{1,-1\}`$,
consider the restricted border

```math
F(A;r,c,e)=
\begin{pmatrix}
A&A&r\\
A&-A&r\\
c^T&c^T&e
\end{pmatrix}.
```

Expanding the border and using (9)--(11) yields

```math
\operatorname{per}F(A;r,c,e)=
\begin{cases}
(-1)^{(n+3)/2}2^n r^TT(A)c,&n\text{ odd},\\
(-1)^{n/2}2^n\bigl(eU(A)+r^TT(A)c\bigr),&n\text{ even}.
\end{cases}                                             \tag{12}
```

For an attaining core, the exact odd-output obligation is consequently

```math
\begin{cases}
|r^TT(A)c|=q(n),&n\text{ odd},\\
|eU(A)+r^TT(A)c|=q(n),&n\text{ even}.
\end{cases}                                             \tag{13}
```

It is false that an arbitrary attaining core admits even an unrestricted
one-row/column completion after doubling: (4)--(5) disprove that
assertion. Any remaining recursion must specify a restricted class
of attaining cores, prove that the class can satisfy (13), preserve
the required structure at the next step, and provide an even-output
operation. None of those existence statements follows from the cycle
filter, the divisibility bound, or a gcd of its coefficients. No such
closed class was proved in this pass.

## 7. Sources and verification boundary

The live statements were checked on 20 November 2026 (America/Chicago):
the two linked Minc entries still label their full statements open.
The prior audit read the repository's P-recursive-family exclusion,
paired-core divisibility theorem, skeleton-stretch obstruction, and
positive-border replacement hierarchy, including its unextendable
seed. This note does not repeat those arguments.

The primary sources examined for this pass include:

- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and
  Multilinear Algebra 53 (2005), 427--433,
  [author PDF](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf),
  DOI [10.1080/03081080500093990](https://doi.org/10.1080/03081080500093990).
  The order-five core in (4) is the published $`T_5\{0\}`$ example;
  the finite constructions do not give an all-order lift.
- D. Ingram and A. Razborov, *On the Range of the Permanent of
  (±1)-Matrices*,
  [arXiv:2507.09433](https://arxiv.org/html/2507.09433v1).
  Its introduction explicitly lists the minimum-positive-value problem
  as open. Its range-cardinality theorem does not imply the exact
  attainment required here.
- J. A. Armario, *On permanents of Sylvester Hadamard matrices*,
  [author manuscript](https://personal.us.es/armario/articulos/permanent2b.pdf),
  and *Boolean Functions and Permanents of Sylvester Hadamard Matrices*,
  Mathematics 9 (2021), 177,
  DOI [10.3390/math9020177](https://doi.org/10.3390/math9020177).
  These are related primary sources on symmetry and Sylvester
  permanent computations. They are not used as a proof of the
  construction obligation (13).

The orbit argument and the cycle/path formulas are proved above.
No novelty claim is made for these auxiliary identities. The source
search does not establish that every possible prior occurrence has
been excluded.

The companion `hadamard_doubling_check.py` compares (9)--(12) against
independent subset dynamic programming on fixed integer examples,
checks the published seed and its cofactors, and checks illustrative
borders and entry changes. These arithmetic checks do not replace
the all-order proofs and do not claim a new attained order.

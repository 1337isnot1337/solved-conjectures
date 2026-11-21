# Symmetric support at a minimizer on Brualdi's face

Research checkpoint, 20 November 2026 (America/Chicago). This is a structural
deduction, not a resolution of Brualdi's family or of Minc Problems 14 or 15.
It proves that geometric transpose symmetrization has a well-defined symmetric
Sinkhorn scaling at every global minimizer on the C_n face. The comparison of
the scaled permanent remains unproved.

Write C_n=J_n−I_n+E_nn, n≥4, with J_n the unnormalized all-ones matrix.
Let A be a global permanent minimizer on its doubly stochastic face and
P=per A. Let D_n denote the derangement number and put

```math
p_n=\frac{D_n}{(n-1)^n}.
```

The existing [structural reduction](../../combinatorial/brualdi_structure.md)
proves P<p_n, positivity of the last row and column, and acyclicity of the
directed graph Z on {1,…,n−1} whose arcs i→j are the extra zeros a_ij=0,
i≠j. These facts are inputs below. They have not been inferred from an
arbitrary stationary point.

## 1. Exact minimum with one constrained row

For 1≤d≤n, prescribe exactly n−d zeros in the first row and no other zeros.
The exact minimum permanent on this doubly stochastic face is

```math
L_{n,d}=\frac{(n-1)!}{(n-1)^{n-1}}\,g(d),
\qquad g(1)=1,\quad g(d)=\left(\frac{d-1}{d}\right)^{d-1}\ (d\ge2).
\tag{1}
```

This bound, including its sharpness example, is already in Gurvits (2008),
Corollary 2.7(a) and the following item 4, equation (19). Here is its application.
For a doubly stochastic A use the stable homogeneous polynomial

```math
q(x)=\prod_{j=1}^n\left(\sum_{i=1}^n a_{ij}x_i\right).
```

Its capacity is one by weighted AM–GM, and the degree of the variable
corresponding to the constrained row is d. Eliminate that variable first
using Gurvits's capacity derivative inequality, which costs a factor g(d).
The remaining n−1 eliminations cost at most
g(n−1)g(n−2)⋯g(2)=(n−1)!/(n−1)^(n−1). Their final coefficient is per A,
giving (1) as a lower bound.

For attainment, take the first row equal to 1/d in its d allowed positions
and zero elsewhere. In each remaining row, an allowed first-row column has
entry (d−1)/(d(n−1)); every other column has entry 1/(n−1). This matrix is
doubly stochastic, and expansion in its first row gives (1). The formula
also applies when d=1, with a forced entry one and the uniform block of order
n−1. No assertion that averaging arbitrary doubly stochastic matrices
decreases the permanent is used.

Consequently every doubly stochastic matrix with a row, or a column, of
support degree at most d has permanent at least L_{n,d}. The function g is
decreasing: writing x=d−1, the function x log(1+1/x) is increasing because
log(1+1/x)>1/(x+1).

## 2. The comparison with the derangement matrix

For every n≥4,

```math
L_{n,\lfloor n/2\rfloor}\ge p_n,
\tag{2}
```

with equality only when n=4. It follows immediately from P<p_n that every
row and column of A has support degree strictly greater than n/2.

For completeness, the all-order comparison is proved here with the parity
of the derangement remainder retained. Let r≥2. The convergent expansion

```math
F(r)=1+(r-1)\log(1-1/r)+\log(1-1/(2r))
=\sum_{k=2}^{\infty}
\frac{2^k-k-1}{k(k+1)2^k r^k}
>\frac{1}{24r^2}
\tag{3}
```

has positive terms, since 2^k>k+1 for k≥2. Hence

```math
(2r-1)g(r)=\frac{2r}{e}\exp(F(r))
>\frac{2r}{e}+\frac{1}{12er}.
\tag{4}
```

If n=2r+1 is odd, the alternating series for e^−1 gives
D_n/n!<e^−1. Moreover,

```math
(n-1)g(r)=2r g(r)
>\frac{4r^2}{e(2r-1)}
>\frac{2r+1}{e}
>\frac{D_n}{(n-1)!}.
```

This is exactly (2) after multiplication by (n−1)!/(n−1)^n.

If n=2r is even and r≥3, the alternating-series remainder instead gives

```math
\frac{D_n}{(n-1)!}
<\frac{2r}{e}+\frac{1}{(2r+1)(2r-1)!}.
```

For r≥3,

```math
(2r+1)(2r-1)!>12er.
```

One elementary check uses e<3: the left side exceeds 36r at r=3, and its
ratio to r strictly increases thereafter. Combining this with (4) proves
strict inequality in (2). At n=4, direct substitution gives
L_4,2=1/9=D_4/3^4. Degrees below floor(n/2) have a no smaller lower bound,
by the monotonicity of g. This finishes the comparison.

Thus we have proved the universal necessary condition

```math
\boxed{\quad
\deg_{\mathrm{row}}(i)>n/2,\qquad
\deg_{\mathrm{column}}(j)>n/2
\quad(1\le i,j\le n).
\quad}
\tag{5}
```

This degree restriction follows from global minimality and the strict
comparison P<p_n. It is not asserted for arbitrary matrices having a zero DAG.

## 3. The graph lemma

Let A be any n×n nonnegative matrix with the following properties:

1. The first n−1 diagonal entries are zero, and the last row and column are
   strictly positive, including a_nn.
2. The off-diagonal zero arcs on the first n−1 indices form a DAG.
3. Every row and column of A has more than n/2 positive entries.

Then the symmetric support

```math
F_{ij}=\mathbf 1_{\{a_{ij}a_{ji}>0\}}
\tag{6}
```

is fully indecomposable.

### Proof

If F is not fully indecomposable, the zero-rectangle characterization gives
a nonempty proper row set S with |N_F(S)|≤|S|. The last row is positive,
so n∉S; the last column is positive, so n∈N_F(S).

Put I=S\N_F(S). This set is nonempty: otherwise S⊆N_F(S), and the additional
vertex n would make |N_F(S)|>|S|. Symmetry of F implies that I has no edges
to S. Thus I is independent and

```math
N_F(I)\subseteq N_F(S)\setminus S,
\qquad |N_F(I)|\le |I|.
```

Write k=|I|, h=|N_F(I)|≤k, and
T=[n]\(I∪N_F(I)), so |T|=n−k−h. The last vertex n is a neighbor of I,
so all vertices of I and T lie among the top n−1 indices.

Between any two distinct vertices of I, and between any vertex of I and
any vertex of T, there is no symmetric-support edge. At least one directed
entry of A is therefore zero. Both cannot be zero, since that would be a
directed 2-cycle of Z. The unique zero arc goes forward in a topological
ordering of Z.

Let i_first and i_last be the first and last vertices of I in this ordering.
There are k−1 zero arcs out of i_first to the other I vertices and k−1 zero
arcs into i_last from the other I vertices. Every vertex of T either comes
after i_first or before i_last (or both); it contributes the corresponding
zero arc. Consequently

```math
\deg_Z^+(i_{\rm first})+\deg_Z^-(i_{\rm last})
\ge 2(k-1)+|T|=n+k-h-2\ge n-2.
```

The prescribed diagonal zero contributes one additional zero to each of the
relevant row and column. Their positive degrees therefore have sum at most

```math
2(n-1)-(n-2)=n,
```

contradicting the two strict-majority assumptions. This proves full
indecomposability, including the exclusion of Hall equalities. ∎

## 4. Consequence for geometric transpose symmetrization

At a C_n minimizer all three hypotheses of the graph lemma hold, by (5)
and the existing structural reduction. Therefore

```math
G_{ij}=\sqrt{a_{ij}a_{ji}}
```

has fully indecomposable support. The Sinkhorn scaling theorem gives a unique
doubly stochastic matrix in its positive diagonal scaling class. Symmetry
and uniqueness make this matrix symmetric; it can be written

```math
B=\operatorname{diag}(d)G\operatorname{diag}(d),\qquad d_i>0.
\tag{7}
```

The free row/column and free diagonal also remove the possible bipartite
ambiguity in the symmetric scaling factors.

Define the usual product-of-linear-forms capacity

```math
\operatorname{cap}(G)=
\inf_{x_j>0}\frac{\prod_i\sum_jG_{ij}x_j}{\prod_jx_j}.
```

A doubly stochastic matrix has capacity one by weighted AM–GM. Diagonal
scaling gives

```math
\operatorname{cap}(G)=\left(\prod_i d_i^2\right)^{-1},
\qquad \operatorname{per}B=
\frac{\operatorname{per}G}{\operatorname{cap}(G)}.
\tag{8}
```

Cauchy–Schwarz over permutations gives per G≤per A=P. If the support of A
is asymmetric, this inequality is strict: every positive edge of a doubly
stochastic A belongs to a positive perfect matching, and a matching using
an unreciprocated edge has positive weight while its inverse has weight zero.

However, capacity can be below one. Global minimality supplies only

```math
\operatorname{per}B\ge P,
\qquad\operatorname{cap}(G)\le\frac{\operatorname{per}G}{P}.
\tag{9}
```

No reverse inequality sufficient to force equality has been proved. Thus the
geometric operation is now justified as a feasible symmetric comparison,
but it does not eliminate extra zeros or establish cohesiveness.

### The reverse capacity comparison fails without minimality

For an exact small illustration, take

```math
A=\frac1{17}\begin{pmatrix}0&16&1\\9&0&8\\8&1&8\end{pmatrix},
\qquad
B=\frac15\begin{pmatrix}0&4&1\\4&0&1\\1&1&3\end{pmatrix}.
```

Both are doubly stochastic on the C_3 face. The matrix B is the symmetric
scaling of G=√(A◦Aᵀ): equation (7) holds with
d_1²=d_2²=17/15 and d_3²=51/40. Nevertheless,

```math
\operatorname{per}B-\operatorname{per}A
=\frac{56}{125}-\frac{2185}{4913}
=\frac{2003}{614125}>0.
```

This example is not a minimizing matrix and is not an obstruction to the
unproved conditional comparison at a global C_n minimizer. It excludes an
unconditional assertion that diagonal-face feasibility alone makes the
geometric symmetrization and scaling decrease the permanent.

## 5. Why the majority-degree condition is needed

The earlier structural restrictions alone do not imply symmetric-support
matchability. At n=8, prescribe the usual first seven diagonal zeros, and
also prescribe a_ij=0 for 1≤i<j≤5. All other positions are allowed. Call this
support D. Its extra-zero graph is a DAG. Any zero rectangle involving only
its first five rows has row count plus column count at most six; a rectangle
using another row is no larger. Thus the earlier n−2 zero-rectangle bound
holds. The support is fully indecomposable, and its matching barycenter A
is positive exactly on D, with positive free row and column.

Yet sqrt(A◦Aᵀ) has its entire upper-left 5×5 block zero. Five rows have only
three possible columns, so its permanent and capacity vanish and no doubly
stochastic scaling exists. The explicit rational barycenter and exact checks
are in `brualdi_symmetric_support_checks.py`. This is not a minimizer of the
C_8 face; its first-row degree is three and is excluded by (5).

## Scope and references

The complete definitions and current open status are on
[Minc Problem 14](https://yair-lavi.com/mincs-list/problem-14/index.html) and
[Problem 15](https://yair-lavi.com/mincs-list/problem-15/index.html).
The one-row bound and its sharpness example are classical. See L. Gurvits,
*Van der Waerden/Schrijver–Valiant like conjectures and stable (aka hyperbolic)
homogeneous polynomials: one theorem for all*, Electronic Journal of
Combinatorics 15 (2008), R66, Corollary 2.7(a) and item 4, equation (19):
[published record](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v15i1r66),
[primary full text](https://arxiv.org/pdf/0711.3496).
The Sinkhorn scaling theorem is another classical input. Historical priority
for the combined majority-degree and symmetric-support conclusion has not
been established.

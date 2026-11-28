# Independent review of the strict-AF route for Brualdi's family

Date: 20 November 2026 (America/Chicago). This is a review of an incomplete route, not a proof of cohesiveness.

We put the free diagonal entry last, so the support is `C_n=J_n-I_n+E_nn`, and assume `n>=4`. Let `d_s=s!/s^s`, let `D_s` be the derangement number, and let `U_n=(J_n-I_n)/(n-1)`.

## Zero rectangles

The proposed lower bound is correct. If a doubly stochastic matrix has a zero rectangle of size `r x (n-r-1)`, set `p=r+1`, `q=n-r`, so `p+q=n+1` and `p,q>=2`. Enlarge its support to the complement of that rectangle. The repeated-support averaging lemma applied to a permanent minimizer in this enlarged face reaches the unique block-constant doubly stochastic point

```math
\begin{pmatrix}
J_{p-1,p}/p&0
\\ J_{q,p}/(pq)&J_{q,q-1}/q
\end{pmatrix}.
```

Its permanent is `d_p d_q`. This follows by selecting the unique bottom-row edge that uses the extra left column after the top rows and right columns have been matched. Thus the minimum on the enlarged face is exactly `d_p d_q`.

The ratio `d_(s+1)/d_s=(s/(s+1))^s` strictly decreases, so for fixed `p+q=n+1`, the product is minimized at `p=2` or `q=2`. Consequently the lower bound is `d_(n-1)/2`.

For every `n>=4`, the alternating derangement sum gives `D_n/n!<=3/8`. Since `3/8 <= (n-1)/(2n)`,

```math
\mathop{\mathrm{per}}U_n\le d_{n-1}/2,
```

with equality only at `n=4`. The explicit diagonal-opening direction at `U_n` has derivative `per(U_n(n|n))-per(U_n)<0`. Hence the minimum over `C_n` is strictly below `per(U_n)`. No minimizer on `C_n` can contain a zero rectangle with row count plus column count at least `n-1`.

## Strict Alexandrov--Fenchel input

The exact primary theorem is Panov, *On the signature and kernel of the bilinear form associated with a permanent*, Russian Math. Surveys 39:6 (1984), 219–220, DOI https://doi.org/10.1070/RM1984v039n06ABEH003190 . A working full-text URL is

https://www.mathnet.ru/links/a301ed41849e632a177821beeb0c2fb0/rm2512_eng.pdf .

Theorem 1 states that the permanent bilinear form associated with a nonnegative `(n-2) x n` matrix has signature `(0,1,n-1)` exactly when every zero rectangle has row count plus column count at most `n-2`. Page 220 gives the equality criterion for AF in terms of its kernel. Panov notes that Theorem 1 also appears in Ravindra Bapat, *A matrix of permanents*, LAA 56 (1984), 57–62, DOI https://doi.org/10.1016/0024-3795(84)90113-7 . The extracted Panov text misreads the surname as “Barat”; the publisher record confirms Bapat.

The preceding rectangle exclusion therefore gives nondegenerate strict AF for every pair of rows, and likewise columns, at a minimizer.

## Checked consequences of the parent's argument

Write `P=per(A)` and `G_ij=per(A(i|j))`. The first-order conditions give `G_ij=P` on positive entries and `G_ij>=P` at allowed zeros. The following deductions check:

1. The free diagonal entry is positive. Otherwise all diagonal entries vanish, relabeling makes every diagonal position temporarily free, and all cofactors are at least `P`. Replacing either of two rows by the other has permanent at least `P`; AF forces equality and then proportional rows, which contradicts the diagonal zeros and row sums.
2. Every forbidden diagonal cofactor is strictly below `P`. If one were at least `P`, strict AF applied with the free row and then the free column would equate the corresponding row and column to the free ones, contradicting the positive free diagonal entry.
3. Every entry of the free row and free column is positive. A zero there lets a row replacement avoid the sole forbidden coordinate; AF forces equality of rows and then contradicts the forbidden-diagonal cofactor inequality. Transpose gives the column claim.
4. Extra off-diagonal zeros among the other indices form a directed acyclic graph. A directed cycle of such zeros could be moved to the forbidden diagonal by a column permutation. A former diagonal zero, whose cofactor is below `P`, would then be an allowed zero at a global minimizer, violating the first-order condition.

These statements do not yet eliminate a nonempty acyclic graph of extra zeros. Symmetry of a minimizer cannot be assumed.

## A generic inverse-sign shortcut is false

One possible continuation would use signs of the inverse of the permanent bilinear kernel. Strict AF does not provide the desired inverse signs, even within actual permanent kernels. Take

```math
C=\begin{pmatrix}1&1&1&1&0\\1&1&1&1&0\\1&1&0&0&1\end{pmatrix}.
```

For `i!=j`, put `Q_ij=per(C with columns i,j deleted)` and put `Q_ii=0`. Then

```math
Q=\begin{pmatrix}
0&2&2&2&2\\2&0&2&2&2\\2&2&0&2&4\\2&2&2&0&4\\2&2&4&4&0
\end{pmatrix},
\quad\det Q=192,
\quad (Q^{-1})_{12}=-1/12.
```

This `C` satisfies Panov's strict zero-rectangle condition. The inverse entry stays negative after sufficiently small positive perturbations. This defeats a generic inverse-kernel sign argument. It does not exclude a stronger statement using all the special minimizing and diagonal-support conditions.

The determinant and inverse entry were checked by exact integer permanent enumeration and rational matrix inversion. The verification is included in `brualdi_af_certificates.py`.

## Completion through the free index

For an extra zero `a_ij=0`, the reverse entry `a_ji` is positive because the extra zeros are acyclic. Put `h_ij=G_ij-P>=0`. The feasible four-cycle direction

```math
D_4=E_{ij}+E_{nn}-E_{in}-E_{nj}
```

has the exact expansion

```math
\mathop{\mathrm{per}}(A+tD_4)=P+h_{ij}t+2Qt^2,
\qquad Q=\mathop{\mathrm{per}}A(\{i,n\}\mid\{j,n\})>0.
```

It therefore cannot give a descent.

The feasible directed three-cycle completion

```math
D_3=E_{ij}+E_{jn}+E_{ni}-E_{in}-E_{ji}-E_{nj}
```

also has linear coefficient `h_ij`. Its cubic coefficient is zero because the permanent of its three-by-three nonzero block is zero. Thus it gives a quadratic in `t`, but no adequate bound on its quadratic coefficient relative to the feasible step length has been obtained. The difference `D_3-D_4` is a two-sided feasible four-cycle direction on positive entries and is stationary at the minimizer. This observation by itself does not force a decrease along `D_3`.

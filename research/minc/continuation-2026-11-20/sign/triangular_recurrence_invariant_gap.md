# The missing invariant in the triangular construction

Research checkpoint: 20 November 2026, America/Chicago. This is an addendum to `bordered_partition_lifts.md`. It gives an exact obstruction to unrestricted one-step induction and the two-step identity required by a possible stronger induction. No all-order construction or resolved Minc entry is claimed.

## Notation and the fixed extension operation

For a binary lower unitriangular matrix B of order N, write

```math
A(B)=\begin{pmatrix}1&\mathbf1^T\\\mathbf1&J_N-2B\end{pmatrix},
\qquad P=\operatorname{per}A(B),\qquad\det A(B)=(-2)^N.
```

Here J_N is the all-ones matrix. For S⊆[N], let P_S be the permanent after replacing each core column in S by the all-ones border column. Put C_j=P_{j} and C_{jk}=P_{j,k}. The border index is zero and is not included in S.

An extension appends one row to B and a zero column above its new diagonal one. In the sign matrix, the new column has all old entries +1, and the new row is (1,w_1,...,w_N,−1), with each w_j=±1. The previous note proves

```math
P'=\sum_jw_jC_j,\qquad\det A'=-2\det A.
\tag{1}
```

All statements about nonextendability below concern this specified positive border and extension operation. They do not exclude another border normalization, another construction, or a multi-step extension.

## A solution which cannot be extended at the next admissible order

Take

```math
B=\begin{pmatrix}
1&0&0&0&0&0&0&0\\
1&1&0&0&0&0&0&0\\
1&1&1&0&0&0&0&0\\
1&1&0&1&0&0&0&0\\
1&0&1&0&1&0&0&0\\
1&0&1&1&0&1&0&0\\
0&1&1&1&0&0&1&0\\
1&1&0&1&0&0&1&1
\end{pmatrix}.
\tag{2}
```

Its bordered sign matrix has order nine and

```math
P=\det A(B)=256,
```

but its replacement-column permanents are

```math
(C_1,...,C_8)=64(8,22,68,14,0,5,-11,8).
\tag{3}
```

The checker computes these values directly by integer subset dynamic programming and checks the determinant independently. Matrix (2) is the single extension already displayed in the preceding checkpoint; this is not another new-order claim.

No signed sum of (3) equals ±512. Here is an exact arithmetic proof. Divide a putative signed sum by 64 and write it as

```math
S=8a+22b+68c+14d+5f-11g+8h,
```

with a,b,c,d,f,g,h∈{−1,1}; the sign of the zero coefficient is irrelevant. If S=±8, reduction modulo four forces g=−f. Thus

```math
S=8(a+h)+16f+22b+68c+14d.
```

Modulo sixteen the target is eight, so

```math
4c+6b-2d\equiv8\pmod{16}.
```

If b=−d, the left side is one of ±4,±12, which is impossible. If b=d, it equals 4(c+b), and the target requires c=b. Therefore b=c=d. The last three terms now sum to ±104, while the other terms have absolute value at most 32. Hence |S|≥72, contradicting |S|=8.

By (1), no appended triangular row preserves absolute permanent–determinant equality at order ten. Order ten itself is admissible: a solution was published by Wanless, with absolute permanent and determinant both 512. Thus the failure is not confined to transitions into an excluded Mersenne order.

This disproves the auxiliary induction assertion “every good triangular matrix extends whenever the next order is admissible.” It does not disprove the existence of a more restricted invariant class that does extend.

## Two-step formula

Append two rows. Let w,u∈{−1,1}^N be their entries in the old core columns, and let ε∈{−1,1} be the second new row's entry in the first new column. The enlarged sign matrix is

```math
A''=\begin{pmatrix}
A&\mathbf1&\mathbf1\\
1\quad w^T&-1&1\\
1\quad u^T&\varepsilon&-1
\end{pmatrix}.
```

It satisfies det A''=4det A. Its permanent is exactly

```math
\boxed{
P''=2\varepsilon P
+\sum_j(u_j+\varepsilon w_j)C_j
+\sum_{j<k}(u_jw_k+u_kw_j)C_{jk}.
}
\tag{4}
```

For a proof, after the first extension the old single-column replacement values are

```math
C'_j=C_j+\sum_{k\ne j}w_kC_{jk},
```

and the replacement value of the new column is P'+2P. Apply (1) to the second row:

```math
P''=\sum_j u_jC'_j+\varepsilon(P'+2P).
```

Collecting the single and double replacement terms gives (4).

If the input satisfies |P|=|det A|, the exact two-step requirement is

```math
\left|2\varepsilon P
+\sum_j(u_j+\varepsilon w_j)C_j
+\sum_{j<k}(u_jw_k+u_kw_j)C_{jk}\right|=4|P|.
\tag{5}
```

The intermediate order need not satisfy permanent–determinant equality. Thus (5) can in principle cross an excluded order, or recover from a failed one-step extension such as (2). No universal choice satisfying (5) has been established.

A useful exact reformulation partitions the old indices into

```math
S=\{j:u_j=\varepsilon w_j\},\qquad T=[N]\setminus S.
```

Then

```math
\frac{P''}{2\varepsilon}
=P+\sum_{j\in S}w_jC_j
+\sum_{j<k,\ j,k\in S}w_jw_kC_{jk}
-\sum_{j<k,\ j,k\in T}w_jw_kC_{jk}.
\tag{6}
```

Mixed pairs between S and T cancel exactly. In particular, u=−εw gives

```math
P''=2\varepsilon\left(P-\sum_{j<k}w_jw_kC_{jk}\right).
```

For this restricted rule, equality is preserved exactly when the signed quadratic form is −P or 3P. This is a concrete invariant requirement, not evidence that the requirement is always achievable.

## A corner identity that does not control the constant term

For H_B(z)=Σ_S P_S∏_(j∈S)z_j, one always has

```math
H_B(-1,...,-1)=(-2)^N=\det A(B).
\tag{7}
```

Indeed H_B is the permanent with core column j replaced by its old value plus z_j times the border column. At z_j=−1 the first row becomes (1,0,...,0), and the remaining core is −2B. A lower unitriangular binary matrix has permanent one, so expansion gives (7).

The desired invariant would force |H_B(0)|=|H_B(−1)| and preserve enough replacement coefficients for future steps. Identity (7) holds for every triangular B, including the unextendable seed, and supplies no such implication by itself.

## Prior-art boundary and remaining statement

Ingram and Razborov explicitly ask whether the unrestricted permanent range is already realized by sign matrices with all negative entries on or above the diagonal: *On the Range of the Permanent of (±1)-Matrices*, https://arxiv.org/html/2507.09433v1 , Section 6, Problem 4. Their range-cardinality theorem is not an exact-attainment theorem. The present positive-border, fixed-diagonal family is narrower still. No claim of triangular-range universality is available as an input.

The order-ten existence source is I. M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra **53** (2005), 427–433, printed page 431: https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf , DOI https://doi.org/10.1080/03081080500093990 . Its T_10{1,...,5,8,9} is checked directly in the accompanying script.

The missing assertion is an explicitly defined recursively maintained class of replacement-coefficient polynomials for which an allowed one-, two-, or three-step transition reaches every admissible order. The class must impose more than determinant normalization and current permanent equality, as (2)–(3) demonstrate. No such class or universal transition theorem was found here. The files are preserved at this precise gap; no growing numerical sweep was used to claim progress toward a full resolution.

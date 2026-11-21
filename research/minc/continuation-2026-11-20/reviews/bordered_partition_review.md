# Independent review of the bordered triangular construction

Review dated 21 November 2026 UTC. I read
`../sign/bordered_partition_lifts.md`, inspected its checker, and ran it
successfully. I also wrote and ran `bordered_partition_review.py`, using this
worker's earlier exact permanent and determinant routines rather than the
sign worker's code. The identities, obstruction table, and witness checks
pass. No new admissible order or resolution of Minc Problem 7 is established.

## Determinant and generating function

For the bordered matrix A(B) of order N+1, subtract its positive first row
from each later row. The result has lower-right block -2B and lower-left
column zero. A binary lower unitriangular B has determinant one, so
det A(B)=(-2)^N, without any restriction on its strict lower triangle.

For B=diag(L_(m_1),...,L_(m_s)), the rook expansion has the coefficient
(-2)^k(N+1-k)!, including the positive border. The note retains the extra
factorial correctly. Its exponential generating function

```math
F_s(\mathbf x)=
\frac{4e^{-2\sum_i x_i}}
 {(2-s+\sum_i e^{-2x_i})^2}
```

also checks by a separate relation to the previous unbordered family.
Let U_(s+1)(x_1,...,x_s,z) be that family's EGF with one additional formal
block. Differentiate at z=0 to obtain a singleton block with diagonal
entry minus one. Changing that diagonal entry to plus one adds twice the
permanent of the unbordered matrix. Hence

```math
F_s(\mathbf x)
=\left.\partial_z U_{s+1}(\mathbf x,z)\right|_{z=0}
 +2U_s(\mathbf x)
=\frac{4e^{-2\sum_i x_i}}
 {(2-s+\sum_i e^{-2x_i})^2}.
```

The tanh version follows by multiplying the denominator by
product_i(1+u_i), with u_i=tanh x_i. The coefficient of e_k(u) in that
product is 2-2k. This gives exactly the denominator stated in the draft.

For the normalized recurrence, put y_i=-2x_i and use the EGF
4 exp(sum y_i)/(2-s+sum exp y_i)^2. The denominator has constant value four.
Its derivative of positive order r in one coordinate is 2+2^r; a derivative
of positive orders r,t in two coordinates is two; derivatives involving
more than two coordinates vanish. Coefficient comparison gives the draft's
recurrence with all stated binomial factors. Removing zero-sized formal
blocks is valid because their denominator contribution cancels their
contribution to s.

The identities F_1(x)=sech^2 x and F_2(x,y)=sech^2(x-y) are correct. In
particular, the vanishing at even matrix order for at most two nonempty
blocks is a parity statement for the total derivative order N=n-1.

## Complete order-eight obstruction

The independent checker enumerates all 15 integer partitions of N=7,
constructs each actual matrix, computes its permanent and determinant
directly, and compares its permanent with the rook expansion. It reproduces
the complete table in the draft. Every determinant is -128, and none of
the permanent values is plus or minus 128.

This rejects the partition family as a construction covering every
admissible order. It does not exclude a finite-exception construction,
all sufficiently large orders, or arbitrary lower unitriangular B. The
draft states all three limits correctly.

The known Wanless matrix is also checked directly: the Toeplitz matrix
negative exactly when j-i lies in {1,4,5,6} has permanent and determinant
128. This is the example printed on page 431 of
[Wanless's primary paper](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf).
The explicit seven-by-seven B in the draft gives a bordered matrix
equivalent to it by the displayed row and column permutations and column
signs. Its permanent is 128 and determinant -128. The stated seven
replacement-column permanents are reproduced independently.

## Full replacement-column recurrence

Fix S among the old interior columns and expand the enlarged matrix's
permanent along its new last row. The border-column cofactor and new
diagonal cofactor are both P_S with opposite signs, so they cancel.
Each j in S has last entry one and cofactor P_S. Each j outside S has
last entry w_j and cofactor P_(S union {j}). Therefore

```math
P'_S=|S|P_S+\sum_{j\notin S}w_jP_{S\cup\{j\}}.
```

Replacing the new column changes only its last entry, from minus one to
plus one. Its cofactor is P_S, adding 2P_S. This proves the second update
formula and explains the coefficient |S|+2.

For H_B(z)=sum_S P_S z_S, the coefficient of z_S in
sum_j(w_j+z_j)partial_j H_B is the first update. Multiplication by
1+z_* copies it to the coefficients containing the new variable, and
2z_*H_B supplies the required extra term. Thus the multiaffine operator
in the draft is exact. The independent checker verifies both formulas
for every subset in two separate extensions.

The missing step is an invariant of the full replacement-column array
that ensures a suitable signed sum and survives subsequent extensions
or controlled jumps. The scalar update alone does not imply such an
invariant or a choice of signs. The checkpoint makes no such claim.

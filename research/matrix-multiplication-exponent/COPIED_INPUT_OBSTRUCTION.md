# Exact cost of copying an input index into an auxiliary party

This note records an independently proved obstruction to one specific auxiliary-party construction. It does not determine the complex matrix multiplication exponent. The obstruction uses ordinary matrix flattenings and is independent of the scalar extension countermodel.

## Conventions

Let `K` be any field. Tensor factors are assigned to distinct parties. A restriction applies one linear map at each party. A regrouping merges specified parties into one party; it can permit more linear maps and is not reversible by an arbitrary local restriction. Direct sums use independent summand subspaces at every party. Extra zero coordinates do not change tensor rank or matrix-flattening rank.

For a tensor `S`, write `R_K(S)` for tensor rank over `K`, and write `underline R_K(S)` for border rank after scalar extension to an algebraic closure. Define asymptotic rank by the limit of `R_K(S^{tensor k})^{1/k}`. For the tensors below, the ranks of all powers are determined exactly, so no limit-existence theorem is needed.

## Copied-slice theorem

Choose a basis `e_1,...,e_a` of `A`, and write a three-party tensor as

```math
T=\sum_{i=1}^{a}e_i\otimes T_i,
\qquad T_i\in B\otimes C.
```

Let `A'` be a second space with basis `e'_1,...,e'_a`. Its copied-index lift is the four-party tensor

```math
\mathcal C(T)=\sum_{i=1}^{a}e_i\otimes e'_i\otimes T_i
\in A\otimes A'\otimes B\otimes C.
```

This lift depends on the chosen basis. Let `r_i` be the ordinary matrix rank of the two-tensor `T_i`, and let `s=sum_i r_i`.

**Theorem.** Over every field,

```math
R_K(\mathcal C(T))
=\underline R_K(\mathcal C(T))
=\widetilde R_K(\mathcal C(T))
=\sum_i r_i.
```

More precisely, for every positive integer `k`,

```math
R_K(\mathcal C(T)^{\otimes k})
=\underline R_K(\mathcal C(T)^{\otimes k})
=s^k.
```

**Proof.** Regroup the four parties into the bipartition `(A tensor B) | (A' tensor C)`. In the bases ordered by the copied index `i`, this flattening is a block-diagonal matrix whose diagonal blocks are the matrices `T_i`; all off-diagonal blocks vanish. Its rank is therefore `s`.

A rank-one four-party tensor has matrix rank at most one under this flattening. Consequently tensor rank is at least `s`. The determinantal variety of matrices of rank at most `s-1` is Zariski closed, so border rank is at least `s` as well. This argument works over an algebraic closure, and extending the field does not change the ranks of the matrices `T_i`.

For the reverse bound, write each `T_i` as a sum of `r_i` simple two-tensors over `K`. Multiplying each summand by `e_i tensor e'_i` gives a decomposition of `C(T)` into exactly `s` simple four-party tensors. Thus both rank and border rank equal `s`.

The flattening of the `k`th tensor power is the `k`th Kronecker power of the preceding flattening, and has rank `s^k`. The product of the explicit decompositions has `s^k` terms. This proves the statement for every power and hence the asymptotic-rank assertion. The zero case has all three ranks zero. End of proof.

## Polynomial multiplication after copying

For positive integers `a,b`, ordinary polynomial multiplication has coefficient tensor

```math
P_{a,b}=\sum_{i=0}^{a-1}\sum_{j=0}^{b-1}
e_i\otimes f_j\otimes g_{i+j}.
```

Its standard copied-input lift is

```math
C_{a,b}=\sum_{i=0}^{a-1}\sum_{j=0}^{b-1}
e_i\otimes e'_i\otimes f_j\otimes g_{i+j}.
```

For fixed `i`, the vectors `g_i,...,g_{i+b-1}` are distinct basis vectors, so the slice has matrix rank `b`. The theorem gives

```math
R_K(C_{a,b})=\underline R_K(C_{a,b})
=\widetilde R_K(C_{a,b})=ab.
```

Equivalently, in the flattening `(A tensor B) | (A' tensor C)` the row `(i,j)` has its unique nonzero entry in column `(i,i+j)`. These `ab` columns are distinct; restricting to them gives an identity matrix of order `ab`.

By contrast, ordinary polynomial multiplication satisfies the imported border-rank bound `underline R_K(P_{a,b}) <= a+b-1`; see Amanov, van den Berg, and Zuiddam, arXiv:2610.30054v1, Proposition 3.2. Over an algebraic closure it follows immediately by evaluation and interpolation at `a+b-1` distinct points. Its output flattening has rank `a+b-1`, giving equality.

For `a,b >= 2`,

```math
ab-(a+b-1)=(a-1)(b-1)>0.
```

Thus copying an input label to another party cannot retain the original linear interpolation cost. In particular, `C_{2,2}` has border rank `4`, whereas `P_{2,2}` has border rank `3`. Any asserted degeneration of `C_{a,b}` from the four-party diagonal tensor of rank `a+b-1` is false for all `a,b >= 2`.

This conclusion does not depend on the chosen input basis for polynomial multiplication. A nonzero input polynomial defines an injective multiplication map on polynomials of degree below `b`, because `K[x]` is an integral domain. Every slice in any basis of the `a`-dimensional input space therefore has matrix rank `b`; every corresponding copied-index lift has rank exactly `ab`.

## Matrix multiplication after copying

Write the square matrix multiplication tensor in trace form, `T_n(A,B,C)=trace(ABC)`. Choose any basis in the first tensor factor. The `n^2` slices can be represented by nonzero coefficient matrices `A_1,...,A_{n^2}`; changing the basis replaces these matrices by another basis, through the nondegenerate trace pairing.

For a fixed coefficient matrix `A_i`, the associated bilinear form is

```math
(B,C)\longmapsto\operatorname{trace}(A_iBC).
```

Its matrix rank is `n rank(A_i)`. Indeed, the trace pairing on the full matrix space is nondegenerate over every field. The bilinear form has the rank of the linear map `B -> A_i B`, which acts independently on the `n` columns of `B`, and therefore has rank `n rank(A_i)`.

The copied-slice theorem now gives the exact formula

```math
R_K(\mathcal C(T_n))
=\underline R_K(\mathcal C(T_n))
=\widetilde R_K(\mathcal C(T_n))
=n\sum_{i=1}^{n^2}\operatorname{rank}(A_i)
\ge n^3.
```

Every basis matrix `A_i` is nonzero and has rank at least one. The matrix-unit basis has all ranks one, so it attains equality. Hence even optimizing the copied input basis leaves exact, border, and asymptotic rank at least `n^3`, with minimum precisely `n^3`.

## Why copying is not a restriction-preserving operation

The copied-index lift is not a functor for arbitrary local restrictions. Consider the rank-one tensor

```math
T=(e_0+e_1)\otimes b\otimes c.
```

It is a restriction of a rank-one three-party diagonal tensor. Copying in the displayed basis gives

```math
\mathcal C(T)=
(e_0\otimes e'_0+e_1\otimes e'_1)\otimes b\otimes c,
```

which has rank and border rank two by flattening across `A | A'BC`. The copied lift of a rank-one diagonal tensor has rank one. Therefore the original restriction does not lift to a four-party restriction or degeneration.

Merging `A` and `A'` makes the basis-copying map a legitimate linear map on one party. Keeping `A` and `A'` separate makes it an operation that creates additional interparty rank. Confusing these two conventions invalidates the proposed lifting step.

## Scope of the obstruction

The theorem rules out the specific plan of copying a polynomial input into an auxiliary party while reusing the three-party polynomial tensor's border-rank bound. It does not rule out other four-party tensors, general normalized price extensions, or a new degeneration. It does not prove a lower bound above two for matrix multiplication: the copied tensor is a different tensor, and the construction is not restriction-preserving.

The proof is mathematical. Exact local checks additionally constructed the displayed identity minors for `(a,b)=(2,2),(2,3),(3,3),(3,5),(5,5)`, obtaining ranks `4,6,9,15,25`. These finite checks are illustrative certificates, not the justification for the quantified theorem.

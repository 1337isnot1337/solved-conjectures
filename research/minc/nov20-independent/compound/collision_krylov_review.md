# Independent review of the collision-Krylov characteristic-polynomial method

Reviewed 20 November 2026 (America/Chicago), by the compound worker.
Target: [collision_krylov_charpoly.md](../root/collision_krylov_charpoly.md).

## Verdict

The algebraic argument is valid on the stated characteristic-zero input
domain, including singular matrices. The stated arithmetic bound follows
from the cited approximant-basis and polynomial-determinant algorithms.
The result is partial progress on P17: its fixed-k improvement does not
supply a uniform improvement in the central growing-k regime.

I independently opened the two primary algorithmic sources. Section 2
and Definition 2.1 of the Giorgi--Jeannerod--Villard paper give the required
minimal-basis degree property and cost. Theorem 1.1 of the
Labahn--Neiger--Zhou paper gives a deterministic determinant algorithm for
arbitrary nonsingular polynomial matrices, so no generic determinant
assumption is being imported from the older paper.

One minor accounting correction was sent to the author: multiplying the
selected degree-T polynomial columns by the inverse constant block costs
O(T q^omega), not merely O(q^omega). This is already absorbed by the
claimed bound. Selection and inversion of the constant block alone cost
O(q^omega). Alternatively, normalization can be omitted because an
invertible constant denominator suffices.

## Singular-image argument

Put L=S_1(A), W=L^n V, and r=dim W. The image chain has stabilized by n,
so L maps W bijectively to itself. This uses no diagonalizability.

The collision ideal in degree k is

```math
C_k=\mathop{\mathrm{span}}\{x_i^2\}\mathop{\mathrm{Sym}}^{k-2}V.
```

For t>=0, its image at time n+t is exactly

```math
S_k(A)^{n+t}C_k
 =
(S_2(L|_W))^t\!\left(S_2(A)^n Q_0\right)
 \mathop{\mathrm{Sym}}^{k-2}W.
```

The equality, not just an inclusion, follows because the image of
Sym^(k-2)V under L^(n+t) is all of Sym^(k-2)W. The two factors in a
product may have independent preimages.

Cayley--Hamilton in Sym^2 W, of dimension d=binom(r+1,2), makes the
collision image at time n+d lie in the sum of the preceding d images.
Adding the earlier images makes the full span invariant. Therefore the
common bound T=n+binom(n+1,2) is valid. When r=0, L^n=0 and S_k(A)^n=0,
which gives the conclusion directly.

This is a bound on a block Krylov length. It does not claim that the
scalar minimal polynomial of S_k(A) has degree O(n^2).

## Transpose and factorial conventions

In the ordinary monomial basis, with G_alpha,alpha=alpha!, the identity

```math
S_k(A)^{\mathsf T}
 =G_k S_k(A^{\mathsf T})G_k^{-1}
```

has the correct orientation. Both diagonal factors preserve the collision
coordinate subspace, so the preceding lemma also supplies the left
recurrence.

I checked the convention directly in degree two. The x_1^2 input
coefficient at x_1x_2 is 2 a_11 a_21; the reverse coefficient for A^T is
a_11 a_21. The diagonal conjugation contributes the required factor two.

The repeated-index coefficient formula also has the correct factorial:

```math
(S_k(A))_{\alpha,\beta}
 =
\mathop{\mathrm{per}} A[\alpha\mid\beta]/\alpha!.
```

The denominator is the row/output multiplicity factorial. Dividing by
the input multiplicity factorial instead would be incorrect in the
ordinary coefficient basis.

## Finite-moment reconstruction

The block Krylov inclusions imply matrix recurrences with constant
q by q coefficients. Reversing these recurrences gives left and right
denominators of degree at most T and constant term I, with numerator
degree less than T. This does not require the coefficients to commute.

For the unshifted right approximant basis of [F,-I], reducedness gives
the predictable-degree property. Therefore every degree-at-most-T
approximant is a polynomial combination of basis columns with degree
at most T.

Apply this to the true q columns (D_R,N_R)^T. Their upper constant
block is I. Taking constant terms shows that the upper constant blocks
of the eligible basis columns span the entire q-dimensional space.
Choosing q independent such blocks is therefore always possible,
including for scalar and highly noncyclic matrices.

The selected polynomial matrices have degree at most T. After optional
constant normalization, D(0)=N(0)=I and

```math
F D-N=O(z^{2T+1}).
```

Multiplying by the true left denominator gives

```math
N_LD-D_LN.
```

This is a polynomial of degree at most 2T, but its first 2T+1
coefficients vanish. It is zero. Since D_L has invertible constant
term, the reconstructed fraction is exact. This is the step that
preserves all multiplicities, rather than assuming the minimal
polynomial equals the characteristic polynomial.

The determinant ratio in Jacobi's identity remains valid if the
reconstructed numerator and denominator have common factors. Minimality
or coprimeness of the selected fraction is not needed.

## Computing the symmetric characteristic factor

The trace construction avoids an eigenvalue splitting field:

1. The logarithmic derivative of det(I-zA) gives tr(A^r) through r=kM
   using polynomial-series arithmetic.
2. Complete-homogeneous Newton identities give
   tr(S_k(A)^t) from tr(A^t),...,tr(A^(kt)).
3. The formal exponential recovers det(I-zS_k(A)).

Triangularization over an algebraic closure is used only to justify the
trace identity. All actual arithmetic stays in the original field.
Jordan blocks therefore cause no exception. The divisions by integer
indices explain the characteristic-zero hypothesis.

## Complexity

With T=O(n^2), the four costs are

```math
\widetilde O(n^{\omega+2}),\qquad
O(k^2M),\qquad
O(n^2 k2^kq^2),\qquad
\widetilde O(n^2q^\omega).
```

They respectively form the powers of A, obtain the symmetric trace
factor, form the collision moments, and reconstruct/take polynomial
determinants. Multiplying and exactly dividing the scalar determinant
polynomials is absorbed by these bounds.

For fixed k>=2,

```math
M=\Theta_k(n^k),\qquad
q=\frac{n^{k-1}}{(k-2)!}+O_k(n^{k-2}).
```

Consequently every term is bounded by
soft-O(n^((k-1)omega+2)) when omega>2. In particular,
2k<=(k-1)omega+2, so the direct computation of collision moments does
not spoil the exponent.

The conclusion compares arithmetic exponents. It does not establish a
rational bit-complexity bound, and it does not establish historical
priority. No fully resolved Minc entry is counted by this review.


# Chollet's conjecture

Research date: 2026-11-20. No proof or counterexample to the full conjecture is claimed. These are structural reductions and excluded construction routes. They are not counted as solved Minc entries.

## Reduction to one matrix

For Hermitian positive semidefinite A and B, Cauchy–Schwarz on the permutation terms gives

```math
|\operatorname{per}(A\circ B)|^2
\le \operatorname{per}(|A|^2)\operatorname{per}(|B|^2).
```

Here |A|^2 means the entrywise absolute square. Thus Chollet's conjecture is equivalent to

```math
\operatorname{per}(|A|^2)\le\operatorname{per}(A)^2
```

for all Hermitian positive semidefinite A. Necessity follows by taking B=conjugate(A); sufficiency follows from the displayed Cauchy–Schwarz bound. A zero diagonal entry of A gives a zero row and a zero permanent on both sides, so searches may restrict to positive diagonal. Congruence by an invertible diagonal matrix scales numerator and denominator of the ratio by the same factor; unit diagonal is a valid normalization.

Known rank-at-most-four results discussed in research.md exclude such cases from novelty claims. A counterexample must avoid those classes.

## Why elementary amplification of a permanent-on-top counterexample fails

For a block diagonal matrix A=direct-sum A_i, both the permanent and the entrywise-square permanent factorize. Therefore its self-conjugate Chollet ratio is the product of the block ratios. Taking direct sums of known safe low-rank blocks cannot produce a violation. The existing diagonal-addition closure also prevents obtaining a counterexample merely by adding a nonnegative diagonal to a safe low-rank matrix.

Permanent-on-top concerns the largest eigenvalue of the Schur power matrix. Chollet's self-conjugate inequality instead concerns its squared Frobenius norm:

```math
\operatorname{per}(|A|^2)
=\frac{1}{n!}\|\Pi(A)\|_F^2.
```

An eigenvalue larger than per(A) does not force the sum of squared eigenvalues to exceed n! per(A)^2. This is the exact missing implication in a naive use of permanent-on-top counterexamples. The five-dimensional rank-two counterexamples are therefore not Chollet counterexamples.

Primary source checked: H. A. Tran, *A simple counterexample for the permanent-on-top conjecture*, Mathematical Inequalities and Applications 25 (2022), 1–16, https://files.ele-math.com/articles/mia-25-01.pdf . Its scope is permanent-on-top and Pate's related spectral conjecture, not Chollet.

## Fourier projection Gram matrices

Let zeta be a primitive n-th root of unity and S a subset of the frequencies. Set

```math
C_{ij}=\sum_{s\in S}\zeta^{s(i-j)}.
```

This is a Gram matrix, positive semidefinite of rank |S|. Frequency translation is diagonal unitary congruence; multiplication of frequencies by a unit modulo n is a simultaneous row/column permutation. Both preserve the Chollet ratio. The exploratory C++ program checks one representative of each affine frequency orbit.

For orders 7 through 13 and ranks at least five, all 246 such affine classes were evaluated with long-double arithmetic. No candidate violation occurred; the largest ratio was about 0.521377, at order 13 and rank 12. These floating-point values are discovery data only. No theorem for this whole family is inferred from them. Full output is in chollet_fourier.txt.

The weighted variant uses Fourier weights in {0,1,2}, with at least one zero and one two, and rank at least five. The code checks 3,573 affine classes at orders 7 through 11. No candidate violation occurred. The largest ratio at each order is still supplied by the scaled rank-(n-1) projection with all nonzero weights equal. This extension tests nonuniform spectra rather than merely a new order; it remains exploratory and does not prove a theorem for arbitrary weights. The output is chollet_fourier_weights.txt. Since these families stay far below one, further enumeration of the same small weight alphabet is not justified by a candidate near the boundary.

### An exact formula for two removed Fourier modes

For n>=2 take w=(1,zeta,...,zeta^(n-1)) and

```math
C=nI-J-ww^*.
```

The nonzero eigenvalue is n with multiplicity n-2, so positivity and rank are exact. Its entrywise absolute square is

```math
|C|^2=(n^2-4n)I+2J+ww^*+\bar w\bar w^*.
```

The permanent of C is an integer computable by the finite formula below. Write

```math
c_{n,k}=\frac{n}{n-k}\binom{n-k}{k},\qquad m=n-2k.
```

Then

```math
\operatorname{per}C
=\sum_{k=0}^{\lfloor n/2\rfloor}(-1)^k c_{n,k}
 \sum_{h=0}^{m}(-1)^h n^{m-h}
 \frac{m!}{(m-h)!}(k!)^2\binom{h+2k+1}{2k+1}.
```

To derive it, use the diagonal-plus-rank-two permanent coefficient formula. The row product is

```math
\prod_{j=0}^{n-1}\bigl(a+b\zeta^j+c\zeta^{-j}\bigr),
\quad a=n-u-v,\quad bc=uv.
```

The balanced part of this product is the Lucas polynomial L_n(a,bc), defined by L_0=2, L_1=a, and L_n=aL_(n-1)-bcL_(n-2). The omitted terms are pure b^n and c^n and have unequal row/column multi-indices, so they do not contribute to the permanent. Expand

```math
L_n(a,bc)=\sum_k(-1)^k c_{n,k}a^{n-2k}(bc)^k.
```

For a term u^r v^s the coefficient-to-permanent map multiplies by r!s!. The remaining convolution is

```math
\sum_{r=0}^{h}\binom hr(r+k)!(h-r+k)!
=h!(k!)^2\binom{h+2k+1}{2k+1},
```

which gives the formula. The script fourier_rank_two_formula.py uses integers throughout. Independent direct permanent evaluations agree through order 12, serving only as checks on the derived identity. This identity alone does not establish Chollet's inequality for an unbounded new class or for all matrices.

## Exact conference Gram checks

For a symmetric Paley conference matrix H of order q+1, H^2=qI. Therefore A=sqrt(q)I+H is positive semidefinite of rank (q+1)/2, and

```math
|A|^2=(q-1)I+J,\qquad
\operatorname{per}(|A|^2)=\sum_{k=0}^{q+1}\binom{q+1}{k}k!(q-1)^{q+1-k}.
```

chollet_conference.py checks H^2=qI exactly and computes per(A) in the quadratic integer ring. At q=9,13,17, the ranks are 5,7,9. The exact gaps per(A)^2-per(|A|^2) are positive. Ratios are about 0.0120143, 0.00174859, and 0.000230656 respectively. These matrices are far from violating Chollet, so further order-by-order testing of the same real conference family is not a promising direction. No finite result is counted as a conjecture resolution.
# Gaussian averaging route: exact obstruction

Let X^(1),...,X^(m),Y^(1),...,Y^(m) be independent proper complex Gaussian vectors, each with covariance A. Set

Z_i^(m) = m^(-1/2) sum_(l=1)^m X_i^(l) conjugate(Y_i^(l)).

If a_sigma=product_i A_(i,sigma(i)), Wick expansion gives the exact finite formula

F_m(A) := E product_i |Z_i^(m)|^2
 = sum_(sigma,tau in S_n) m^(cycles(sigma^(-1)tau)-n) a_sigma conjugate(a_tau).

The label constraints in the two Wick contractions identify labels around the cycles of sigma^(-1)tau, giving the stated power of m. Consequently,

F_1(A) = per(A)^2,
lim_(m->infinity) F_m(A) = per(A Hadamard-product conjugate(A)).

Thus monotonicity of F_m on positive integers would imply self-Chollet, but no such monotonicity was proved. Nonnegativity of the coefficients in powers of 1/m is false. For the positive semidefinite matrix A=(3I-J)/2 of order three, whose eigenvalues are 0,3/2,3/2, exact permutation summation gives

F_m(A) = 39/32 + 9/(8m) - 3/(32m^2).

In particular, the last coefficient is negative even in a settled small case. One cannot prove the unrestricted conjecture by discarding all cross-permutation terms as nonnegative or by asserting that the Gaussian-averaging expansion has nonnegative coefficients.

The 2026 preprint by Ouimet and Greaves, *A proof of the strong Gaussian product inequality conjecture*, https://arxiv.org/html/2609.20234v1 , was inspected for a possible bridge. Its theorem compares a Gaussian product moment with a product of one-dimensional moments. It does not supply the covariance-changing comparison above, and no implication from that result to Chollet was established here. This is a source exclusion, not a claim about that preprint's full external validation.


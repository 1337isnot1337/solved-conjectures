# Review of the remaining proof-route obstructions

Review date: 20 November 2026 (America/Chicago).

This review covers the Lih--Wang coefficient obstruction, the integer
complement-average obstruction, the Brualdi low-permanent scaling witness,
and the Chollet variational identities. They do not resolve any of the
original named conjectures.

## Lih--Wang coefficients and the Jerrum construction

The construction and counts were checked directly on page 275 of
[Wanless's author-hosted primary PDF](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The damaged text layer was not used to determine exponents.
For the r-regular graph of order n=r squared times f plus one, there are
r chains of f blocks. Exactly one chain is active in a perfect matching;
after deleting the two endpoint vertices none is active. With
b=(r-1)! and a=(r-1)b, this gives

```math
\operatorname{per}H=r b^f a^{(r-1)f},\qquad
\operatorname{per}H(s\mid t)=a^{rf}.
```

Normalizing H by r gives cofactor/permanent ratio (r-1)^f. Direct calculation
of the flat penultimate coefficient gives

```math
q_{n-1}/q_n=\sigma_{n-1}(A)/(n^2\operatorname{per}A).
```

At r=3,f=16, the single distinguished cofactor therefore gives a lower
bound 65536/21025, which exceeds 286/145. Since this last constant exceeds
one, the subtraction of the baseline one in the proposed coefficient
inequality only strengthens its strict failure. The argument is exact and
also proves unboundedness of that coefficient ratio along the family.

The note correctly retains the distinction from Lih--Wang: the conjecture
uses the weighted sum of all coefficients. The penultimate weight is at
most n/2^n on the required interval. No counterexample to that weighted
inequality is supplied.

## Integer complement averaging

The uniform-complement marginal bound is the one already proved and
reviewed in the separate C6 checkpoint. Its three-edge switching argument
has at least n-2k-2 forward choices and at most (n-1)(n-2) inverse choices.
For n at least 4k+4 the resulting probability is strictly larger than
1/(2n).

With m=kf-1 and B=mH, the row and column sums of B+P are n-k, strictly
less than the order. For every P supported by H, entrywise comparison gives
per(B+P) at most (m+1)^n per H. The constant and single distinguished-edge
terms in the nonnegative expansion of per(B+Q) give the stated lower bound
for its expectation. No alternating terms have been discarded.

The estimate n/m at most k+2 is valid from k=3,f=1 onward. At k=3,f=25,
the exact comparison 33554432 greater than 24383592 supplies a strict
margin. The displayed quadratic 27f squared minus 60f minus 22 proves
the needed ratio increases for every f at least three. The obstruction
thus holds throughout the stated infinite family.

This disproves only the universal averaging assertion for integer
residuals. An average above the original value does not rule out a useful
individual replacement, and the examples are not proved to be global
minimizers. The note makes both limits explicit.

## Geometric symmetrization below the derangement value

The rational weight matrices W,V have support C_24 and satisfy
V_ij squared equals W_ij W_ji. Positive diagonal scaling commutes with
geometric transpose symmetrization up to a symmetric diagonal factor.
Consequently the two uniquely defined doubly stochastic scalings have
exactly the relationship asserted in the note.

The weight-permanent formulas follow by multilinearity in the two modified
entries. A single deleted row and different deleted column leave n-3
forbidden fixed points among n-1 positions, giving
D_(n-1)+2D_(n-2)+D_(n-3). Deleting both exceptional rows and columns gives
C_(n-2), as required for the quadratic term.

For the rational capacity certificate, the explicit correction has row
sums h and column sums zero because the sum of h is zero. Its zero
diagonal preserves every prescribed zero. The checked relative error
bound puts a genuinely doubly stochastic matrix between (1-eta)T and
(1+eta)T. Monotonicity, homogeneity and diagonal covariance of capacity
then give the claimed permanent interval, with the indicated directions
of both inequalities.

I read and executed the standard-library checker. It returned:

```text
Exact capacity brackets verified:
0.9999835 p_24 < per A < 0.9999836 p_24 < p_24
p_24 < 1.0001147 p_24 < per B < 1.0001148 p_24
An explicit symmetric feasible matrix has permanent below per A.
```

The reference matrix has the claimed row and column sums. Its border
expansion uses the identity that the sum of penultimate subpermanents of
J_m-I_m is m(D_m+D_(m-1)): complete a partial matching and count whether
the completed permutation has zero or one fixed point. This independently
checks the formula used to show that A is not a global minimizer.

The witness rules out the low-permanent-only shortcut, even with full
allowed support. It does not address the complete minimizing cofactor
conditions and does not disprove Brualdi's conjecture.

## Chollet variational identities

The real Hilbert--Schmidt orthonormal basis of all Hermitian matrices
includes both real and imaginary off-diagonal directions. Its contraction
identity exchanges the two column indices in a differentiated permutation
monomial. Ordered differentiation gives twice the sum over unordered
transpositions. Summing monomials then gives Delta P=n(n-1)P.

The quotient differentiation has the correct drift term. Writing u=f/P,
the trace of the Hessian of its squared norm gives

```math
\Delta R+2\langle\nabla\log P,\nabla R\rangle
=2(V-E)/P^2.
```

The transposition energy factors into a two-by-two determinant for each
row pair. The two possible orders of each column pair give precisely the
factor two in the weighted squared-minor formula. At the identity,
V=0 and E=n(n-1), confirming that no unconditional positive sign can be
assigned to their difference.

The first-order stress matrices have the correct transpose conventions:
the gradient of log P is M and that of log Q is 2N. Rank-one PSD
perturbations, followed by diagonal normalization, give W=M-N PSD at a
global ratio maximum. Homogeneity gives trace(AW)=0, and PSD then gives
AW=0. In a minimal counterexample order, the proper-minor Chollet
inequality and Lieb's one-vector inequality make every diagonal entry of
W strictly positive. Singularity follows, but the required rank at most
square root of n does not.

The proposed strict comparison V>E at a violating stationary point is
unproved. The corrected prior-rank statement covers the remaining cases
with r squared at most n; it does not assert that general rank-four
matrices of orders seven through nine have been settled. The exact
identities and singularity condition do not close that gap.

This review verifies the scoped deductions, not historical novelty. No
full Minc-list resolution is added to the completion count.

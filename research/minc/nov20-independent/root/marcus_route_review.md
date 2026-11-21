# Review of Marcus comparison routes

Date: 20 November 2026 (America/Chicago).

Status: internal independent review of two method obstructions. Neither
note resolves Marcus's block-permanent conjecture. No historical
priority claim or external review is asserted.

## Orthogonal auxiliary padding

The [padding note](../compound/marcus_orthogonal_padding.md) was checked
from the underlying Gram construction. The enlarged matrix is a
permutation of the direct sum, while its coarse block-permanent matrix
is the Schur product. These are two distinct identities and both have
the stated factors.

The universal preservation test needs every positive semidefinite
coarse matrix. The note supplies that quantifier even at fixed original
block size: one variable vector and common orthonormal padding realize
an arbitrary coarse Gram matrix. The identity and single-edge tests
then force rank one, provided the diagonal is positive.

The factorial-norm power bound was derived independently. In the
normal-order identity, the zeroth derivative and all derivatives of
full degree give distinct nonnegative contributions because the common
form has positive degree. For $`a_j=\|Q^j\|_F^2`$ and $`j\ge1`$,
Cauchy--Schwarz against $`Q^{j-1}`$ gives

```math
\frac{a_{j+1}}{a_j}\ge a_1+\frac{a_j}{a_{j-1}}.
```

Starting with $`a_1/a_0=a_1`$ proves $`a_m\ge m!a_1^m`$.
No polarization of this scalar inequality into coefficientwise
positivity is used.

The stronger proposed universal domination fails for the same reason:
the identity test and Fischer force equality of the auxiliary permanent
with the product of its coarse diagonals; the edge tests force rank
one; the power bound contradicts that equality for at least two blocks.
Zero auxiliary permanent is explicitly excluded because division would
be invalid. The result concerns a fixed auxiliary Gram system in an
orthogonal space, not an auxiliary system adapted to additional data
from the original matrix.

The Tubbenhauer source statements were already recorded in the earlier
repository audit. Their repetition here is a scope check. The present
review does not verify the complete external diagrammatic proof or
count its partial cases as new work.

## Quadratic-packet central-limit correction

The [central-limit note](../inequalities/quadratic_clt_correction.md)
was checked directly by expanding the six quadratic products in the
orthogonal Gaussian monomial basis. Their Gram entries give exactly
the displayed fourth moment and cumulant. The normalization of the
first correction is $`1/(2!2!)`$.

Only finitely many terms of the formal cumulant series contribute to
a fixed homogeneous polynomial test. Circular symmetry eliminates
unbalanced terms; every balanced cumulant of order $`(r,r)`$ has
factor $`N^{1-r}`$. Thus the displayed Hessian contraction is the whole
coefficient of $`1/N`$, without an analytic convergence assumption.

The commutator $`[\Delta,\rho]=4E+6I`$ gives the eigenvalues
$`4s(m-s+1/2)`$ on $`\rho^s\mathcal H_{m-2s}`$. Their strict
increase over the allowed values of $`s`$ verifies the sharp operator
norm of $`\Delta`$. The Hessian identity gives $`m(m-1)\|h\|^2`$.
Combining these formulas yields a strictly positive first correction
in every degree at least three. For a product of two linear forms,
the Hessian rank is at most two, so the trace versus nuclear-norm
bound gives a nonnegative correction. The nonproduct polynomial
$`\rho`$ has the exact negative correction $`-6`$, consistent with
the algebraic relation at one copy.

The comparison after summing independent copies involves homogeneous
quadratics that need not factor into two linear forms. Even within
that broader comparison, the note controls only the leading
correction. It does not give a sign for the entire finite-copy
expression. Both scope restrictions are retained.

No finite-order computation is needed for these proofs. The review
checks identities and quantified deductions; it contributes zero
complete numbered-list resolutions.

## Exact finite-copy follow-up

The [finite-copy proof](../inequalities/quadratic_packet_finite_copy.md)
was checked independently after the preceding review. It strengthens
the conclusion for the specified family and supersedes the earlier
missing finite-copy sign when $`N\ge2`$.

The real Gaussian quadratic integral, including the change from four
real variables to two proper complex variables, gives exactly

```math
K_N(t,s)=\left(1-\frac{2t\cdot s}{N}
 +\frac{\rho(t)\rho(s)}{N^2}\right)^{-N/2}.
```

The bidegree-$`(m,m)`$ part of this kernel is the displayed sum of
kernels for $`M_\rho^j\Delta^j`$. The factors $`j!`$,
$`(m-2j)!`$, and $`N^m`$ were checked by direct expansion.
For $`\nu=N/2`$, the finite binomial coefficient identity in the
note evaluates the eigenvalue on $`\rho^s\mathcal H_{m-2s}`$ as

```math
\lambda_{m,s}(N)=\nu^{-m}(\nu)_{m-s}(\nu-1/2)_s.
```

The finite coefficient proof introduces no hypergeometric denominator
at exceptional integer parameters. The eigenvalues decrease with
$`s`$. The exact smallest-eigenvalue recurrences start from
$`\lambda_{3,1}=1+(\nu-1)/(2\nu^2)`$ and establish the
comparison in every degree at least three for every $`N\ge2`$.
The only nonzero homogeneous equality case in those degrees is
$`N=2,m=3,h\in\rho\mathcal H_1`$. Irreducibility of the
rank-three quadratic $`\rho`$ excludes that case for a nonzero
product of linear forms. The degree-two rank bound and the exact
equality condition are consistent with the fourth-cumulant formula.

At one copy all sectors with $`s\ge1`$ vanish. Thus the argument
does not prove the remaining top-harmonic product estimate. Summed
quadratic packets also need not factor into two linear forms. These
two limitations prevent an unrestricted Marcus conclusion.

Root opened the DLMF generating and connection formulas and Upmeier's
Section 2, including the spin-factor parameters and the Faraut--Koranyi
kernel expansion. The spectral coefficient is classical; the proof
keeps its own standard Gaussian normalization explicit. The independent
compound review gives a second derivation through the classical
harmonic reproducing kernels. No numerical extrapolation, historical
priority claim, or full-entry resolution is used.

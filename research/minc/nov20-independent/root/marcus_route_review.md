# Review of two Marcus routes

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

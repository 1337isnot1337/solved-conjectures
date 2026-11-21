# Independent review of the POT-valid ancillary block lemma

Date: 20 November 2026, America/Chicago. Reviewer: `minc_regular`.

Reviewed `research/minc/continuation-2026-11-20/inequalities/pot_valid_ancilla_obstruction.md`.
The statement and proof are correct as written. It is an all-order
obstruction to a counterexample transfer, not a resolution of MINC
Conjecture 42 or Problem 2. This review makes no priority claim.

## Normalization and subgroup checks

For $`H\le S_{n+m}`$, the only nonzero permutation monomials of
$`A\oplus C`$ come from $`L=H\cap(S_n\times S_m)`$. The delta function
on the second coordinate selects exactly

```math
K=\{g\in S_n:(g,e)\in H\}.
```

This is a subgroup. Restricting the representation of character $`\chi`$
to its embedded copy gives a character $`\theta`$ of unchanged degree
$`q`$, even if it becomes reducible. Consequently the desired inequality
has no subgroup-index or additional degree factor:

```math
f_{H,\chi}(A\oplus C)
 \le \operatorname{per}(C)f_{K,\theta}(A).
```

## Positivity checks

The function $`a_g(M)=\prod_i m_{i,g(i)}`$ is positive definite for a PSD
matrix $`M`$: it is a matrix coefficient of the tensor permutation
representation, or of its conjugate according to inverse convention.
Both conventions preserve positive definiteness. Equivalently, its finite
group kernel is the Schur power matrix, up to reindexing and transpose.

The matrix-specific hypothesis
$`\Pi(C)\preceq\operatorname{per}(C)I`$ therefore says precisely that
$`Q(h)=\operatorname{per}(C)\delta_{h,e}-a_h(C)`$ is positive definite.
The pullbacks of $`a_g(A)`$ and $`Q(h)`$ to $`L`$, and the restricted
character $`\chi((g,h))`$, are positive-definite functions. Their
pointwise product is positive definite by the Schur product theorem.
Complex-valued characters cause no difficulty here; no unmentioned complex
conjugation is required.

For a positive-definite function $`b`$ on a finite group,
$`\sum_g b(g)\ge0`$: the all-ones quadratic form of the group kernel is
$`|L|\sum_gb(g)`$. Applying this fact gives exactly

```math
0\le\operatorname{per}(C)\sum_{g\in K}\theta(g)a_g(A)
 -\sum_{(g,h)\in L}\chi((g,h))a_g(A)a_h(C).
```

Division by the common degree $`q`$ proves the displayed inequality.

## Degenerate and reducible cases

If $`\operatorname{per}C=0`$, the left side of the target inequality is
both nonnegative and at most zero. If $`\operatorname{per}C>0`$, any
dominance violation after adding $`C`$ forces a violation for the restricted
character on $`K`$. For
$`\theta=\sum_\eta m_\eta\eta`$, the normalized generalized function is
the convex combination with weights $`m_\eta\eta(e)/q`$, so an
irreducible constituent must violate the bound too. A restricted linear
character remains linear, as required for the degree-one problem.

The proof critically uses the POT condition for the ancillary matrix. It
does not establish that condition for arbitrary PSD blocks, or cover
nonorthogonal couplings between the old and ancillary Gram vectors. In
particular, the diagonal-subgroup example on $`A\oplus\overline A`$
still includes the separate open Chollet problem when the ancillary block
does not satisfy the required condition.

No numerical or finite-group test is needed for this abstract proof check.

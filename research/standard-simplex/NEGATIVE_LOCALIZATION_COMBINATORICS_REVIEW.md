# Independent combinatorics review: unrestricted-mass localization

Reviewed 21 November 2026. The complete [NEGATIVE_LOCALIZATION.md](NEGATIVE_LOCALIZATION.md) source reviewed has SHA256:
2a74fccafc71912d012a39a9d0e050e7e4635a9796cee351abaa782d12cb6de0.

**Finding:** the balancing construction, competitor localization, and core moment estimate pass. No substantive correction is requested. This is an auxiliary proof review; it does not establish a negative-correlation optimum or priority.

## Proportional balancing

For fractional labels, the first Hermite projection gives the dimension-free bound $`\|M\|_F\le1`$, since $`\sum_i\|f_i\|_2^2\le1`$. Each donor has $`p_i>1/q`$, so the proportional removal is defined even when some other cell has mass zero. The removed density is nonnegative, and its redistribution to deficit labels makes every mass exactly $`1/q`$ while preserving nonnegativity and the pointwise sum one. The case of no excess mass is treated separately.

The moment change on each receiver is a positive scalar multiple of the same removed moment vector. Summing the receiver norms costs at most the sum of the donor moment changes. Thus

```math
\|M-N\|_F
\le \sum_i\|m_i-n_i\|
\le q\|e\|_1
\le q^{3/2}\|e\|.
```

This is stronger than a generic estimate obtained from the moved mass by Gaussian Cauchy--Schwarz. No ambient-dimension factor occurs. The new rows are linear combinations of the old rows, so no extra moment direction is introduced.

## Balanced fractional labels

The covariance and polar-alignment inequalities used here extend to fractional labels through the stated feasible-assignment inequality. For any balancing price, the pointwise largest adjusted score bounds the fractional weighted score; taking the assignment dual value gives $`\sqrt{F_N}\le\mathcal V(Q)`$. The remainder of the credited first-moment argument depends only on the moment matrix.

The zero-moment case is covered: the global alignment constant is $`C_{\mathrm g}=2/\kappa_{\mathrm g}-1`$ with $`0<\kappa_{\mathrm g}\le1`$, so choosing any regular moment matrix gives the claimed bound when $`F_N=0`$. No price bound near a singular covariance is used in the global balancing step.

Because both moment norms are at most one, $`|F-F_N|\le2\|M-N\|_F`$. The stated global mass-error upper bound follows.

## Competitor estimates and the same polar simplex

For an unrestricted partition, the zero-degree Hermite norm is $`1/q+\|e\|^2`$. Taking absolute values of all terms of degree at least two gives a remainder bounded by $`t^2`$. Comparing with the regular benchmark therefore yields

```math
\|e\|^2-t(F-c^2)\le2t^2.
```

Combining this with $`F-c^2\le2L\|e\|`$ gives the positive quadratic root
$`\|e\|\le(L+\sqrt{L^2+2})t`$. The lower bound $`F\ge c^2-2t`$ also follows directly. These imply the balanced deficit estimate with the stated $`K_F`$.

The polar moment matrix of the actual $`M`$ maximizes the inner product with $`M`$ over regular moment matrices, all of which have norm $`c`$. Hence it is at least as close to $`M`$ as the regular matrix obtained by aligning $`N`$. Extending the partial isometry is legitimate because $`d\ge q-1`$. This checks that the later core is aligned with the actual full moment matrix, rather than an unrelated nearby simplex.

The squared estimate uses $`t^2\le t`$, valid throughout the final correlation range. It is uniform in ambient dimension.

## Core mass and rotation bookkeeping

The moment row space is contained in the polar score space, so conditioning preserves the masses and all moment coordinates used here. It is not asserted to preserve noise stability.

After removing tail transfers, the exact identities are $`M_{\mathrm c}=M-M_{\mathrm t}`$ and $`e_{\mathrm c}=e-e_{\mathrm t}`$. The core mass error cannot be replaced by $`-e_{\mathrm t}`$ for an unbalanced competitor. The global bounds and the chosen tail radius place both core hypotheses within $`\delta_0/2`$.

The full aligned square matrix is symmetric. Consequently the core skew part is minus the tail skew part, and

```math
\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2
\le2\|e\|^2+2\eta_q(R)W_{\mathrm t}.
```

The exact first-moment identity holds for fractional labels with arbitrary masses. The local lemma thus gives the displayed core bound. Restoring the tail by quadratic Young inequality with $`\tau=\kappa/8`$ yields precisely $`K_m`$ and $`K_*`$ in the source. Finally,

```math
(1+\kappa/8)(2-\kappa)
=2-\frac{3\kappa}{4}-\frac{\kappa^2}{8}
\le2-\frac{\kappa}{2}.
```

The retained $`K_m\|e\|^2`$ term is essential. The later negative-noise comparison must absorb it after multiplication by $`t`$, using the positive degree-zero contribution; this review does not drop that term.

## Limits

The note uses the same credited balanced first-moment theorem and covariance stability input as the existing positive-correlation research. It assumes only a hypothetical competitor no worse than the regular benchmark and does not assume existence of a minimizing partition. This review does not verify a new literature-priority claim or the final absorption argument, which must be checked in the assembled theorem.


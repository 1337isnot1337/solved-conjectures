# Combinatorics review: small negative correlations

Reviewed 21 November 2026. The complete assembly reviewed was [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md), SHA256:
e5ef19a67178633d6a1604e8ec763b9e6229949afa1c0952bbeb70444a04dcbb.

**Finding:** the assembled small-negative-correlation theorem and equality characterization pass. No mathematical correction is requested. The conclusion is a partial theorem for a sufficiently small negative interval for each fixed number of cells, with unrestricted competitor masses and a dimension-independent threshold. It is not a full Standard Simplex resolution.

The combinatorics lane authored the negative-potential and weighted-tail component, which the analysis and algebra lanes independently checked. This review separately checks the assembly and independently checks the other new components. The associated full reviews are [WEIGHTED_NOISE_COMBINATORICS_REVIEW.md](WEIGHTED_NOISE_COMBINATORICS_REVIEW.md) and [NEGATIVE_LOCALIZATION_COMBINATORICS_REVIEW.md](NEGATIVE_LOCALIZATION_COMBINATORICS_REVIEW.md).

## Source and input scope

The statement compares every measurable partition with the regular benchmark, including partitions with empty cells. The proof invokes the credited balanced first-moment theorem and its covariance stability consequence only for balanced fractional labels or through the local unequal-mass assignment bound. It does not assume a global unrestricted first-moment extremum. The earlier source remains explicitly identified as an unrefereed public manuscript.

This review is mathematical. The separate negative-correlation source and priority comparison remains a separate gate; the completed positive-correlation audit does not automatically cover the new assertion.

## Uniform localization and coordinates

The proportional balancing operation is valid even when a receiver cell is empty because every donor denominator is at least $`1/q`$. It preserves the pointwise partition sum and balances the masses exactly. The moment change is bounded by $`q^{3/2}\|e\|`$, with no ambient-dimension factor.

The competitor hypothesis yields
$`\|e\|^2-t(F-c^2)\le2t^2`$.
Combining this with the balanced comparison gives the stated $`K_e t`$ bound and $`F\ge c^2-2t`$. The balanced deficit is at most $`K_Ft`$.

The proof subsequently chooses the polar simplex of the actual moment matrix. This matrix is the nearest regular moment matrix in Frobenius norm, so the intermediate comparison obtained from the balanced labels gives the same localization bound for that specific simplex. The partial polar isometry can be extended when needed because $`d\ge q-1`$.

Its score space contains every original moment row. Conditioning preserves the required masses and moments, and the fixed sign of each pair transfer on a regular cell preserves absolute transfer costs. The original noise quadratic forms are not replaced by their conditioned values.

## Constants and core hypotheses

The constants are chosen in the required order: first the first-moment and local-core constants, then the tail radius, then the correlation threshold. The negative winner-gap constant is positive and independent of location and ambient dimension. Compact-core convergence is applied only after the radius is fixed.

The restrictions in (10) imply simultaneously:

- $`F\ge c^2/2`$.
- The full mass error is at most $`\delta_0/4`$.
- The actual polar moment distance is at most $`\delta_0/4`$.
- The weighted tail mass and moment norms are at most $`\delta_0/4`$.

Thus the core fractional partition satisfies both local hypotheses. The exact core mass relation is $`e_{\mathrm c}=e-e_{\mathrm t}`$. The full polar square moment matrix is symmetric, so its core skew part is minus the tail skew part. These give the factor two in (18), including the original mass error.

The core identity $`\|M_{\mathrm c}-M_{\mathcal C}\|_F^2=2D_{\mathrm c}-\varepsilon_{\mathrm c}`$ holds for arbitrary masses. Restoring the tail via Young's inequality gives the stated $`K_m`$ and $`K_*`$, and

```math
(1+\kappa/8)(2-\kappa)\le2-\kappa/2.
```

The mass-error term in (19) is retained rather than discarded.

## Noise signs and the final absorption

For a transfer from $`C_i`$ to label $`j`$, the negative-correlation linear increase uses $`T_{-t}(1_{C_j}-1_{C_i})`$. The winner-gap proof therefore has the correct sign in (20)--(21), even when $`j`$ is not the most likely label after the negative shift.

Expanding the original indicator functions gives exactly

```math
\Delta_-
=2J_t+\|e\|^2-t\|M-M_{\mathcal C}\|_F^2
+\sum_i\langle h_i,R_{-t,d}h_i\rangle.
```

The signs of the zero- and first-degree terms are opposite, as required. The remainder bound is applied in the original ambient space, retains the identity on unused coordinates, and controls the indefinite remainder by the spectral absolute value before using a positive seminorm.

Substituting the audited bounds gives the coefficients in the source:

```math
1-K_mt,\qquad
\frac{\kappa}{4}-\frac{Ht}{\ell},\qquad
\frac{3b}{2}-Ht.
```

The threshold bounds these below by $`1/2`$, $`\kappa/8`$, and $`b`$, respectively. The relation $`W_{\mathrm c}\le D_{\mathrm c}/\ell`$ uses only that the exponential factor is at most one and the capped normal distance is at most the full normal distance. It holds in the original space and after conditioning.

Every hypothetical competitor no worse than the benchmark therefore has nonnegative deficit. Every other partition already has larger value by the case split. No minimizing partition is assumed to exist.

## Equality

Equality falls within the competitor case and forces $`e=0`$, $`D_{\mathrm c}=0`$, and $`W_{\mathrm t}=0`$. The core-cost relation then makes the full weighted transfer cost zero. Its exponential factor is strictly positive at every finite point. Its other factor vanishes only on finitely many score-tie hyperplanes, each Gaussian null. Thus the original transfers vanish almost everywhere, not merely their signed conditional means.

The chosen labels coincide almost everywhere with the actual polar simplex. Orthogonal images and relabelings have the same Gaussian noise value, giving exactly the claimed equality class.

## Limits

No finite screen is used as evidence for the universal statement. No Lean verification was performed. The proof yields no useful explicit correlation threshold and does not address correlations outside its small negative interval. It changes no named-conjecture resolution count. External acceptance and the separate prior-status check are not conclusions of this review.


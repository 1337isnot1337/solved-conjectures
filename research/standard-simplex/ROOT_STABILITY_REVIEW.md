# Independent review of first-moment stability

Reviewed on 21 November 2026. Scope: `FIRST_MOMENT_STABILITY.md`, the complete pinned first-moment manuscript cited there, and the published statement of the Gaussian multi-bubble theorem. This is a mathematical review, without Lean work or a numerical verification claim.

## Verdict

The proposed estimate

```math
\inf_{\mathcal C}\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)
\le K_q\sqrt{F_q-F(\mathcal A)}
```

follows from the credited covariance identities. Here the infimum is over central regular-simplex partitions, including rotations and labels, and the finite constant depends only on the number of cells. The proof handles arbitrary measurable balanced partitions, all ambient dimensions at least the simplex dimension, and singular endpoint covariance matrices. No gap was found in this deduction. Its priority is a separate question.

The estimate does not prove positive-correlation optimality. An argument controlling the constrained noise functional, including its volume multipliers, remains necessary. No result-table entry or resolution count should change on this basis.

## Checks of the imported identities

The pinned [mxym/math manuscript](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md) proves the exact equal-mass extremum and the path deficit identity. Its use of [Milman–Neeman](https://annals.math.princeton.edu/2022/195-1/p02) is within the published range: apply the perimeter theorem to `q` cells in dimension `q-1`, with every mass strictly positive. The relevant perimeter is the sum of interface areas using the ambient Gaussian density. It is not the sum with each interface counted twice.

For a full-rank centered score matrix, every pair of winning cells has a positive facet. The invertible score-difference coordinates allow the selected two scores to tie strictly above all others. Gaussian flux gives the score value as the weighted sum of squared edge lengths. The price Hessian is the Laplacian with weights equal to facet area divided by edge length. Its restriction to the zero-sum price gauge is positive definite. These facts justify the smooth balancing prices and covariance derivative used by the new proof.

The radial differential identity has the required sign and factors: if `h(t)` is squared score value minus the regular value, then `t h'(t)=h(t)-D(t)`. Symmetry and the trace constraint give `h'(0)=0`. Therefore the nonnegative deficit integral follows by integrating the derivative of `h(t)/t`. Continuity supplies the singular endpoint; differentiability at that endpoint is unnecessary.

## Checks of the quantitative deduction

1. The first half of every covariance segment lies in one compact set strictly inside the positive cone. Continuity and positivity of every facet weight give a common positive lower bound. This bound is independent of the original ambient dimension.
2. The edge perturbations have zero sum. Their squared sum is exactly `q` times the squared diagonal norm plus twice the full squared Frobenius norm, because the perturbation has zero row sums and zero trace. The complete-graph variance identity then yields the stated factor `q omega_q^2 / 8` after integration over the half-segment.
3. Normalizing the partition's moment matrix gives a feasible balanced assignment with value equal to the square root of its first-moment energy. Thus its energy deficit bounds the covariance deficit in the correct direction.
4. Near the maximum, the covariance has full rank on the zero-sum subspace. Its polar factor embeds a regular score list in the same row space. The square-root estimate and smooth balancing-price estimate have constants depending only on `q`.
5. Every pairwise score difference has variance bounded below. A union bound on the Gaussian strips controls the top-versus-second-score margin. Assignment loss then bounds the probability of a wrong label by a constant times the square root of that loss. The zero-loss case is valid because ties have probability zero.
6. For two nearby affine comparisons, threshold displacement contributes at most the threshold size divided by the normal length and by the square root of `2 pi`. The centered angular contribution is exactly angle divided by `pi`. This avoids a weaker bound from treating the linear perturbation by Markov's inequality.
7. The sum of the labelled symmetric differences is twice the probability of different labels. For large energy deficit it is at most two. This handles zero moment energy and completes the global estimate.

The same assignment argument extends to fractional partitions by integrating their losing-label weight. Ordinary partitions suffice for the stated noise-stability application.

## Noise localization and exponent

The immediate positive-correlation localization corollary is also valid. The Hermite expansion has nonnegative level energies, total nonconstant energy `1-1/q`, and remainder above degree one at most `rho^2(1-1/q)`. A balanced partition whose noise value is within `eta` below the regular simplex consequently has first-moment deficit at most `rho(1-1/q)+eta/rho`. Substitution into the stability bound gives a dimension-independent neighborhood as `rho` tends to zero. This is localization, not a comparison of the two noise values at a fixed positive correlation.

The mirrored-strip construction proposed independently in this review gives the correct sharpness obstruction. Exchanging two reflected strips along one simplex facet preserves each mass exactly, changes only the two adjacent moments by opposite vectors of order `t^2`, and produces a positive energy deficit of order `t^2`. On each normal line, the modified cell has two occupied intervals of length `t` separated by an empty interval of length `t`. Every convex comparison cell misses an occupied interval or contains the gap. Its disagreement is therefore at least a constant times `t`, uniformly over regular-simplex comparisons. Thus a universal power larger than one half in the symmetric-difference estimate is impossible.

This review neither establishes first discovery of the stability theorem nor resolves Standard Simplex. Those limitations must remain attached to the checkpoint.

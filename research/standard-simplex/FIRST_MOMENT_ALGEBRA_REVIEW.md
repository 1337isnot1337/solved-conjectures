# Independent review of the first-moment stability deduction

Reviewed 21 November 2026 against the complete `FIRST_MOMENT_STABILITY.md`, including its sharpness construction. The deduction passes this review. This review does not assert a resolution of the Standard Simplex conjecture or priority for the quantitative consequence.

## Existing input and the covariance calculation

The argument explicitly imports the balanced covariance comparison, smooth balancing prices, Gaussian flux identities, and Gaussian multi-bubble perimeter bound. Conditional on those stated inputs, the displayed deficit identity is exact. Indeed, with `V=mathcal V(Q_t)` and `W=sum_e w_e`, homogeneity and the covariance derivative give

```math
tV'(t)=\frac12\left(V(t)-\frac{2W(t)}{q-1}\right).
```

The weighted identity `VW-S^2=sum_{e<f}w_e w_f(ell_e-ell_f)^2` then gives `t h'=h-D` with precisely the constants in the note. Integrating `(h/t)'` from zero is valid because symmetry gives `h(0)=h'(0)=0`. The singular endpoint is handled by continuity.

Full affine independence is the reason every pair has a facet. The score-difference map has rank `q-1`, so a prescribed pair can tie strictly above all remaining scores. This justifies positivity of every facet weight; positive cell masses alone would not have justified it for an arbitrary dependent score system. Continuity on the compact set bounded below by half the regular covariance supplies a positive uniform minimum.

I independently checked the identity

```math
\sum_{i\lt j}(\Delta_{ii}+\Delta_{jj}-2\Delta_{ij})^2
=q\sum_i\Delta_{ii}^2+2\|\Delta\|_F^2
```

under the stated trace and row-sum conditions. The squared-length denominator is at most eight. Integrating the resulting bound over `0<=t<=1/2` gives exactly `beta_q=q omega_q^2/8`.

## Recovering a nearby partition

The original balanced labels have score value `sqrt(F)`. Consequently their assignment loss is at most `epsilon/(c_q+sqrt(F))`, with the stated sign. Uniform lower bounds on score-difference variance give the linear Gaussian margin estimate. The split into margin at most `t` and assignment loss exceeding `t` therefore gives symmetric-difference distance of order `sqrt(epsilon)` from the optimal priced cells.

For small deficit, the covariance has full rank on the centered subspace. The polar alignment `U=Q^{-1/2}V` has `UU*=P`, and the Frobenius square-root comparison is valid on that subspace. Smooth prices and the exact centered halfspace angle formula then give the same order of distance from a regular simplex partition. These constants depend on `q`, not on the unused ambient coordinates. The large-deficit extension uses the correct universal bound of two on the total labelled symmetric difference.

The Hermite-tail argument yields localization of near-optimal noise-stability partitions, not their exact optimality. The note correctly preserves this distinction and the unresolved volume-multiplier issue.

## Sharpness

Exchanging the two reflected slabs preserves every cell mass. Tangential moments cancel and the normal moment change is of order `t^2`, so the first-moment deficit is of order `t^2` with positive leading coefficient. On almost every normal line through the fixed interface patch, the altered indicator has the pattern one, zero, one on three consecutive length-`t` intervals. Any interval either meets both occupied intervals, hence contains the entire intervening gap, or misses an occupied interval. Its Lebesgue error is therefore at least `t`. A uniform positive Gaussian density bound on the patch turns this into Gaussian error of order `t` against every convex cell. This includes every rotated and relabelled simplex cell and proves the stated exponent obstruction.

No mathematical correction was identified in this review. No numerical screen or formal verification was used.

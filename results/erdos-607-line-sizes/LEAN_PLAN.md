# Erdős 607 formalization: completed obligations

The stated sharp asymptotic is complete, including its exact constant, for
the count of records of actual finite sets of distinct real-plane points.
The accepted endpoint uses the literal geometric count, with no unresolved
analytic premise.

## Geometry and exact counting

The checked geometry uses `Point = ℝ × ℝ`, actual affine lines, and actual
finite configurations. It proves the incidence cost bound, identifies the
positive core, constructs generic carriers and selected intersections, fills
and pads the configuration, and handles ordinary-line and collinear cases.
`lineSizeCount_eq_tupleCount` holds for every natural point count.

Canonical core/tail reconstruction, exact cost weights, cumulative counting,
and the coefficientwise formal generating function are also registered. The
pinned Sylvester–Gallai port retains its license and provenance under
`lean/Conjectures/LineSizeImported`.

## Analytic generating function

The analytic series proof supplies absolute convergence, the exact value of
the count's generating function, and actual Fourier coefficient extraction.
Its final endpoint is `LineSize.CoefficientIntegral.lineSizeCount_eq_integral`.
The 39-module closure at `daa7d2c5` passed strict sources, the 867-theorem
standard-axiom audit, and independent pinned-kernel replay.
[Exact receipt](../../docs/verification/line-size-generating-evaluation-daa7d2c5.json).

## Sharp asymptotic

The proof supplies the exact saddle constant and curvature, corrected Euler
product, actual moment limits, finite characteristic-product estimate, and
integrable Fourier envelope. A floor-defined lattice step turns the core sum
into an actual integral. Measurability, pointwise convergence, domination,
all tails, and the coupled Gaussian constant are discharged. The exact scale
`sqrt(A/n)` and negligible correction yield the stated prefactor.

The final theorems are
`LineSize.CoefficientAsymptotic.lineSizeCount_sharp_ratio` and
`LineSize.CoefficientAsymptotic.lineSizeCount_sharp_asymptotic`.
Their 78-module closure at `36b13722` passed strict sources, the
1,582-theorem standard-axiom audit, and independent pinned-kernel replay.
[Exact receipt](../../docs/verification/line-size-sharp-asymptotic-36b13722.json).

## Registration

The two final receipts are archived unchanged, and all 93 recorded source,
gate, and pinned-input paths were compared before registration. Their required
endpoints are in `ProofAudit`; every newly imported proof module is in the
sequential prebuild list. The full merged-package gate remains separate.
[Precise statement and verification record](../../docs/lean-status.md#complete-erdős-607-line-size-asymptotic).

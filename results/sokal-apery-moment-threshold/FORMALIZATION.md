# Lean scope for Sokal’s Apéry moment threshold

**Status: partial.** The formalization concerns the previously unresolved excluded
interval of Sokal’s conjecture.

- An unshifted Hankel form gives unconditional exclusion for
  $0<x\le 1/40$. A shifted Hankel form gives unconditional exclusion at
  $x=1/4$, and continuity gives an open neighborhood of that parameter.
- A Stieltjes representing measure for the actual Apéry sequence has compact
  support. Its resolvent is analytic at every nonreal or negative real argument,
  and its Taylor germ at zero agrees with the Apéry series.
- The first Legendre circle average gives exactly the Apéry coefficients. Lean
  also checks the range and critical values of the real torus argument, the
  diagonal second derivatives at the saddle, and the support endpoint below
  $x=1/4$.
- The inverse Joukowski coordinate and the half-transform continuation are
  checked. For the actual torus distribution below $x=1/4$, a local
  identification of the half-transform with the pulled-back moment transform
  implies the claimed exclusion. The proof uses one-sided limits and the
  analyticity obstruction at the lower support endpoint.

The local identification still requires the averaged Legendre addition and
generating-function steps. The saddle logarithm and its boundary cusp above
$1/4$ also remain open in Lean. This checkpoint verifies the exceptional
parameter by a finite certificate in place of the quartic-minimum estimate.
The positive-side and Hamburger supplements are outside its scope.

[Lean entry point](../../lean/Conjectures/SokalAperyMomentThreshold.lean)
· [Written proof](PROOF.md)

## Replay

From the repository root with the pinned Lean toolchain on the path, run:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.SokalAperyMomentThreshold \
  --require SokalApery.apery_le_pow \
  --require SokalApery.apery_support_subset \
  --require SokalApery.momentTransform_analyticAt \
  --require SokalApery.momentTransform_hasSum \
  --require SokalApery.not_stieltjes_on_checked_parameters \
  --require SokalApery.eventually_not_stieltjes_at_quarter \
  --require SokalApery.integral_legendre_product \
  --require SokalApery.torus_critical_values \
  --require SokalApery.torus_saddle_second_derivatives \
  --require SokalApery.halfTransform_extends_of_germ \
  --require SokalApery.halfTransform_no_extension_at_lower_endpoint \
  --require SokalApery.not_stieltjes_of_torus_germ_below_quarter \
  --out results/sokal-apery-moment-threshold/verification
```

The [receipt](verification/receipt.json) records strict compilation, the
all-owned axiom audit, and stock-kernel replay of the six-module closure.

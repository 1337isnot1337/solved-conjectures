# Lean formalization of polar preorder duality

Lean proves all of Athanasiadis–Chapoton’s Conjecture 6.2 for finite preorders.
The [final module](../../lean/Conjectures/AthanasiadisChapotonPolar.lean)
constructs the lattice-point equivalence for every nonnegative integer
dilation, proves that both lattice-point sets are finite, and derives equality
of the literal Ehrhart series and their dimension-normalized numerators.

The polytopes are convex hulls of negative basis vectors and ideal indicators.
Lean proves that the added origin is redundant for nonempty ground sets and
checks the gauge inequality against membership in the actual dilated hull.
The class construction uses the antisymmetrization of the preorder, so tied
elements and the empty ground set are included.

The [chain module](../../lean/Conjectures/AthanasiadisChapotonChain.lean)
proves the inverse height recurrence and reversal invariance of chain
weights. The [transfer module](../../lean/Conjectures/AthanasiadisChapotonTransfer.lean)
proves both inverse identities for the weights and deficits. The
[gauge module](../../lean/Conjectures/AthanasiadisChapotonGauge.lean)
checks the convex-hull description using a finite decomposition into ideal
layers. The same formulas give a positively homogeneous homeomorphism of the
ambient real coordinate spaces, preserve the integer lattice, and carry every
nonnegative real dilate onto the reversed dilate.

The piecewise-unimodular refinement, the convex mutation factorization, and
the finite numerator model in Luo’s supplementary problems are outside the
Lean scope. [Written proof](PROOF.md)

## Replay

From the repository root with the pinned Lean toolchain on the path, run:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.AthanasiadisChapotonPolar \
  --require AthanasiadisChapotonPolar.height_of_gaps \
  --require AthanasiadisChapotonPolar.chainMax_dual \
  --require AthanasiadisChapotonPolar.decode_encode \
  --require AthanasiadisChapotonPolar.encode_decode \
  --require AthanasiadisChapotonPolar.gauge_reversal \
  --require AthanasiadisChapotonPolar.mem_polar_dilate_iff \
  --require AthanasiadisChapotonPolar.preorderPolar_eq_original \
  --require AthanasiadisChapotonPolar.preorder_latticePoints_finite \
  --require AthanasiadisChapotonPolar.reversal_intCast \
  --require AthanasiadisChapotonPolar.preorderReversal_smul \
  --require AthanasiadisChapotonPolar.preorderReversal_image_dilate \
  --require AthanasiadisChapotonPolar.latticePointCount_dual \
  --require AthanasiadisChapotonPolar.ehrhartSeries_dual \
  --require AthanasiadisChapotonPolar.hStarSeries_dual \
  --out results/athanasiadis-chapoton-polar-duality/verification
```

The [receipt](verification/receipt.json) records strict compilation, the
all-owned axiom audit, and stock-kernel replay of the four-module closure.

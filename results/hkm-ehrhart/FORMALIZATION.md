# Lean scope for the Higashitani–Kummer–Michałek conjecture

**Status: partial.** This formalizes the root certificate, interpolation, local
counts, and necessary geometric conditions for the [written counterexample](PROOF.md).
The condition that the literal Ehrhart polynomial has the certified counts is
not yet discharged.

- [Root and interpolation module](../../lean/Conjectures/HKMEhrhart.lean):
  Lean checks the negative Laguerre value at $4/3$, the resulting nonreal root,
  the exact complex rotation, and all twelve evaluations of the interpolant.
  Any degree-at-most-eleven polynomial with these evaluations has a root off
  the canonical line. This does not identify the literal Ehrhart polynomial.
- [Local counting module](../../lean/Conjectures/HKMEhrhartLocalCount.lean):
  Lean identifies and counts the integer pairs of coordinates with any
  given positive and negative masses.
- [Geometry module](../../lean/Conjectures/HKMEhrhartGeometry.lean):
  Lean defines the literal symmetric edge polytope as the convex hull of
  the oriented edge vectors across parts. Every integral point in its
  $m$th dilate has coordinate sum zero, total positive mass at most $m$,
  and absolute mass at most $m$ in each part. The literal count is finite.
  The reverse construction from edge sums to dilate membership is also
  checked once such a sum has been given.

The missing steps are a general edge decomposition for vectors satisfying these
conditions, the six-part convolution for the literal count, and the literal
Ehrhart polynomial’s degree/identification. No full Lean refutation or extra
conjecture result is claimed. The first two modules reuse Cinna Davis’s
[original root checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/612c316a018bac51e8557d443cd6b75341c27efe)
and [local count checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/7880c005bd42743a388d2505c483c38beee66c5e).
The [original proposers’ statement](https://arxiv.org/html/1612.07538v1) and
[issue #316](https://github.com/1337isnot1337/solved-conjectures/issues/316)
give the conjecture and written-proof attribution.

## Verification

The [scoped receipt](verification/receipt.json) lists the exact input hashes
and endpoints for strict Lean compilation, the audit of all owned declarations,
and stock-kernel replay. Reproduce with `scripts/verify_lean_target.py` and
root `Conjectures.HKMEhrhartPartial`, using the endpoints in the receipt.
The aggregate repository gate is separate.

# Lean scope for the Higashitani–Kummer–Michałek conjecture

**Status: partial.** This formalizes the root certificate, interpolation, local
counts, and the exact lattice-membership bridge and the twelve literal counts used for the [written counterexample](PROOF.md). The all-dilation Ehrhart polynomial identification remains separate.

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
- [Reverse geometry module](../../lean/Conjectures/HKMEhrhartSufficiency.lean):
  Lean proves the converse for every nonnegative integer dilation and every
  multipartite graph with at least two nonempty parts. When an opposite-sign
  pair crosses parts, one can choose such a pair that touches every saturated
  part and subtract that oriented edge. If the support lies in one part, its
  signed coordinates can instead be routed through any outside vertex.
  Thus the mass inequalities and zero coordinate sum characterize literal
  lattice membership.

- [Convolution](../../lean/Conjectures/HKMEhrhartConvolution.lean),
  [literal count bridge](../../lean/Conjectures/HKMEhrhartCountBridge.lean)
  and [count certificate](../../lean/Conjectures/HKMEhrhartCountCertificate.lean):
  the dynamic recurrence exactly counts bounded signed pairs with prescribed
  totals. For six two-vertex parts, the diagonal sum counts the literal
  lattice points in every integer dilation. The twelve counts at dilations
  zero through eleven are checked in the stock kernel, one table step at
  a time.
- [Root transfer](../../lean/Conjectures/HKMEhrhartLiteralCounts.lean):
  a polynomial of degree at most eleven whose natural evaluations are
  the literal lattice counts has a root off the canonical line.

The missing step is the all-dilation Ehrhart polynomial existence and degree
bound for the literal graph. No full Lean refutation or extra conjecture
result is claimed. The first two modules reuse Cinna Davis’s
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

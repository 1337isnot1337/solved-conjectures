# Lean scope for the Higashitani–Kummer–Michałek conjecture

**Status: complete for Conjecture 4.10.** Lean constructs the unique
Ehrhart polynomial of the literal symmetric edge polytope of the complete
multipartite graph with six two-vertex parts. It verifies all natural-dilation
counts, bounds the degree by eleven, and proves that the polynomial has a root
off the canonical line. That same root prevents interlacing along the canonical
line with any polynomial, including the one obtained by decreasing a largest
part from two to one.

- [Root and interpolation module](../../lean/Conjectures/HKMEhrhart.lean):
  Lean checks the negative Laguerre value at $4/3$, the resulting nonreal root,
  the exact complex rotation, and all twelve evaluations of the interpolant.
  Any degree-at-most-eleven polynomial with these evaluations has a root off
  the canonical line.
- [Local counting module](../../lean/Conjectures/HKMEhrhartLocalCount.lean):
  Lean identifies and counts the integer pairs of coordinates with any
  given positive and negative masses.
- [Geometry module](../../lean/Conjectures/HKMEhrhartGeometry.lean):
  Lean defines the literal symmetric edge polytope as the convex hull of
  the oriented edge vectors across parts. Every integral point in its
  dilate of order $`m`$ has coordinate sum zero, total positive mass at most $m$,
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

- [Unclipped polynomial](../../lean/Conjectures/HKMEhrhartUnclippedPolynomial.lean):
  for each positive mass level, split a lattice vector into its disjoint
  positive and negative supports and two positive compositions. Stars and bars
  gives binomial factors. Discrete polynomial summation gives the count of
  all levels through the dilation, including the zero vector.
- [Pair cap](../../lean/Conjectures/HKMEhrhartPairViolation.lean) and
  [polynomial correction](../../lean/Conjectures/HKMEhrhartViolationBudget.lean):
  violating a pair cap forces opposite signs in that pair. The remaining ten
  coordinates and the slack in the total positive mass determine both deleted
  coordinates. Pairing one remaining coordinate with that slack gives two
  nonnegative coordinates. Counting these and the nine signed coordinates by
  a polynomial prefix recurrence gives a correction of degree at most eleven.
- [All-dilation identity](../../lean/Conjectures/HKMEhrhartEhrhartViaAssembly.lean) and
  [counterexample](../../lean/Conjectures/HKMEhrhartDegreeBridge.lean):
  at most one cap can fail, and each of the six caps gives the same correction.
  The difference polynomial counts the literal points at every natural
  dilation and is unique. Lean then applies the verified interpolation and
  off-line root certificate, with no extra degree or counting hypothesis.

The independent Wronskian proof in [PROOF.md](PROOF.md), the stronger witness
whose two polynomials both lie on the canonical line, and the exact number
of off-line roots are outside this Lean scope. The proof reuses Cinna Davis’s
[original root checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/612c316a018bac51e8557d443cd6b75341c27efe)
and [local count checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/7880c005bd42743a388d2505c483c38beee66c5e).
The written [counting bridge](https://github.com/1337isnot1337/solved-conjectures/blob/dab1ac8d1ecea8dc34c38932fcd2a4b3f56ce0ef/research/hkm-ehrhart/LEAN-COUNT-BRIDGE.md)
gives the signed-mass correction used here; the Lean proof counts it by a
prefix recurrence. The [original proposers’ statement](https://arxiv.org/html/1612.07538v1) and
[issue #316](https://github.com/1337isnot1337/solved-conjectures/issues/316)
give the conjecture and written-proof attribution.

## Verification

The [scoped receipt](verification/receipt.json) lists the exact input hashes
and endpoints for strict Lean compilation, the audit of all owned declarations,
and stock-kernel replay. Reproduce with `scripts/verify_lean_target.py` and
root `Conjectures.HKMEhrhartDegreeBridge`, the endpoints in the receipt, and
`--per-module-replay` to run the unchanged stock checker on one module at a time.
The aggregate repository gate is separate.

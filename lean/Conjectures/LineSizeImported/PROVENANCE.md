# Sylvester–Gallai source provenance

`SylvesterGallai.lean` is adapted from the product-coordinate proof in
[`sneed-and-feed/lean-theorems-1`](https://github.com/sneed-and-feed/lean-theorems-1).

- Pinned commit: `774fb492a47b8c7962bed282564d6bd612ba8ac4`.
- Original path: [`Formalization/SylvesterGallai.lean`](https://github.com/sneed-and-feed/lean-theorems-1/blob/774fb492a47b8c7962bed282564d6bd612ba8ac4/Formalization/SylvesterGallai.lean).
- Original Git blob: `bf844ddcaab8264405d98f36258a0123cd8b2aea`.
- License: CC0 1.0 Universal. The complete upstream license is preserved in
  [`LICENSE`](LICENSE).

The source proves Kelly's minimum-distance argument for finite subsets of
`ℝ × ℝ`. It defines collinearity by the vanishing coordinate determinant and
proves the existence of two distinct selected points whose line contains no
other point of the finite set.

## Local changes

- Replace the deprecated `Mathlib.Data.Real.Basic` import with
  `Mathlib.Basic.Real.Basic`.
- Put the declarations in `LineSize.SylvesterGallai`.
- Remove the unused hypothesis `3 ≤ S.card` from the main theorem. Its proof
  uses only the noncollinearity hypothesis.
- Remove the isolated upstream `#print axioms` command. The local audit checks
  every theorem declaration and its transitive axioms.
- Add [`LineSizeOrdinary.lean`](../LineSizeOrdinary.lean) as a separate bridge
  from coordinate collinearity to Mathlib's actual affine spans and
  `LineSize.HasLineSize`.

The pinned source and its license are inputs to the port. Upstream verification
claims are not local verification receipts. Acceptance requires source checks,
the project axiom whitelist, and independent kernel replay. The current
collection status is recorded in
[`docs/lean-status.md`](../../../docs/lean-status.md).

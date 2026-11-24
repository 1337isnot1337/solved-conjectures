# Kovalev exact rational certificate

Scope: the finite rational comparisons in sections 3–5 of the written proof, not the Gaussian, Bessel, or Hardy-norm arguments.

- Source: `lean/Conjectures/KovalevRationalCertificate.lean`
- SHA-256: `00794299efcd7355f8c1ed71bb2f2cb98184a231bb81c475fe0cf9000dfc957a`
- Lean: 4.35.0, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release
- Command from `lean/`: `lean -DwarningAsError=true Conjectures/KovalevRationalCertificate.lean`
- Result: exit 0, no warnings or errors.
- All 13 endpoint theorem declarations were audited using `#print axioms`: 12 depend only on `propext`, `Classical.choice`, and `Quot.sound`; `dimension_threshold` has no axioms.
- Rational decisions use kernel reduction (`decide +kernel`); no `native_decide`, `sorry`, `admit` or new axioms.

The source was checked in an isolated Lean installation with the Init import closure. Full project build and independent stock-kernel replay of a built module were not run. No full verification status change is justified.

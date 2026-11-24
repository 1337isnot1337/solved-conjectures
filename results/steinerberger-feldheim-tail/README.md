# Steinerberger’s quantitative Feldheim-tail conjecture

**Disproved in both formulations; the original disproof is fully formalized in Lean.** A nonnegative distribution with survival function `exp(−x−x²/200)` fails both proposed lower bounds at every positive threshold. Its density is strictly log-concave, and its support is unbounded.

The proof compares both proposed normalizations with a single explicit, uniform upper bound. The counterexample also survives smoothing across the endpoint at zero. It does not contradict Feldheim–Feldheim’s qualitative theorem. A separate [quantile-spacing proof](LINEAR-EXISTENCE.md) shows that smaller universal constants work at some threshold; it does not identify their sharp values.

- [Complete analytic proof](PROOF.md)
- [Sharp integral rate test for convex log tails](CONVEX-HAZARD-RATE.md)
- [Source scope and independent review](AUDIT.md)
- [Discovery issue #396](https://github.com/1337isnot1337/solved-conjectures/issues/396)

## Lean formalization

The [Lean theorem](../../lean/Conjectures/SteinerbergerFeldheim.lean) constructs the actual probability law and its iid product and proves strict failure of both original bounds for every real threshold greater than zero. Its denominator is positive, its mean is the finite actual expectation, and its median is genuine and unique. The separate smoothing, log-concavity, and rate supplements remain written results outside these formal endpoints.

- [Formal statement and proof correspondence](FORMALIZATION.md)
- [Independent source and statement review](LEAN_REVIEW.md)
- [Strict build, axiom audit, and kernel-replay receipt](verification/receipt.json)
- [Reproducible verification](../../docs/verification.md#steinerbergers-quantitative-feldheim-tail-conjecture)

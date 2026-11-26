# Lean scope for square-root Taylor sections

Principia Math in Progress proved Kovalev’s Conjecture 1.2 for the square root in September and posed fractional powers and sharp segment bounds as further questions. This supplement proves zero-freeness for exponents between zero and one-half and derives the stated segment bounds. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex). The dated checks below describe the repository work.

Complete for the original square-root conjecture. The general fractional-exponent and sharp-segment supplements remain unformalized. This is one result from the existing entry, with every positive length and every section degree included.

## Exact theorem

For every positive integer D, every natural n, and every complex z with norm at most 1, the n-th Taylor section at zero of the branch of sqrt(1 + z + ... + z^(D-1)) normalized to equal 1 at zero is nonzero. The original Conjecture 1.2 takes D = d + 1 with d > 2.

The final theorem `Conjectures.KovalevZeroFree.kovalev_conjecture` writes the coefficients literally as `iteratedDeriv k (fun w => Complex.sqrt (sum i in range (d + 1), w^i)) 0 / k!`. There are no hypotheses about coefficient identification, beta couplings, integrability, remainder bounds, or an upper limit on the degree. The stronger all-positive-length endpoint is `taylorSection_ne_zero`; the finite coefficient formula is covered by `sectionPolynomial_ne_zero`.

## Sources and attribution

The proposer is Leonid V. Kovalev. The original statement is Conjecture 1.2 in *Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1, Section 1:
https://arxiv.org/html/2507.04544v1#S1

The exact recorded argument is `docs/kovalev-fractional-taylor-sections/PROOF.md`, Sections 1–3, at commit `6432592c03b24aed190ed7b3204ed942a40a8da4`, recorded by Cinna Davis:
https://github.com/1337isnot1337/solved-conjectures/blob/6432592c03b24aed190ed7b3204ed942a40a8da4/docs/kovalev-fractional-taylor-sections/PROOF.md

That source file has SHA256 `3deeb1ba260ce9ce18d482f8d6911a2b4beabdfc1db0b8659a9bffd4d3901924`. Kovalev’s original Proposition 3.2 proves the earlier length-three case and supplies the multiplication-by-square-root idea. The entry’s searches did not locate an earlier all-length resolution; they do not establish priority. This formalization preserves that qualification.

## Proof structure

The coefficient recurrence proves the exact positive corrections and the strict finite coefficient budget. Genuine binomial power series, the Cauchy product, and finite reindexing identify the finite coefficient formula. Local uniqueness of the principal square root near zero identifies its actual iterated-derivative Taylor coefficients. No global principal-branch product identity is assumed.

The remainder is an actual Bochner integral against Mathlib’s beta probability measure. Its normalization, support, and mean are proved from the actual density. Its norm is at most 1 on the closed unit disk and strictly less than 1 off z = 1. A direct algebraic diameter-disk proof supplies the square-root specialization of the source’s fractional-power geometric lemma. The pointwise comparison coefficient is enlarged from 2/(1 + sqrt(v)) to 2 - v; this retains the bound and gives the exact beta mean 1 + (n - M)/(n + 1).

The actual beta coupling is proved by an explicit Möbius substitution, the positive Jacobian, an Euler beta integral, the joint density marginal, and Tonelli’s theorem. It is the precise pushforward of Beta(a,b) × Beta(a+b,c) under vt/(1 - t + vt) to Beta(a,c), for all positive real parameters. The proof assumes no gamma independence or abstract distribution-transfer identity.

The finite-section derivative is integrated along the real segment t -> tz. Positive real part of 1 - tz on the entire segment gives the continuous actual derivative kernel for every closed-disk z != 1. The fundamental theorem of calculus and the beta normalizer give the exact remainder identity at every section degree. The coefficient budget then bounds the correction strictly below the lower norm bound for the leading polynomial. At z = 1, direct positivity of the finite polynomial proves nonvanishing.

## Source modules

- [KovalevZeroFreeCoefficients.lean](../../lean/Conjectures/KovalevZeroFreeCoefficients.lean)
- [KovalevZeroFreeBeta.lean](../../lean/Conjectures/KovalevZeroFreeBeta.lean)
- [KovalevZeroFreeMobius.lean](../../lean/Conjectures/KovalevZeroFreeMobius.lean)
- [KovalevZeroFreeEuler.lean](../../lean/Conjectures/KovalevZeroFreeEuler.lean)
- [KovalevZeroFreeCoupling.lean](../../lean/Conjectures/KovalevZeroFreeCoupling.lean)
- [KovalevZeroFreeTransport.lean](../../lean/Conjectures/KovalevZeroFreeTransport.lean)
- [KovalevZeroFreeGeometry.lean](../../lean/Conjectures/KovalevZeroFreeGeometry.lean)
- [KovalevZeroFreeKernel.lean](../../lean/Conjectures/KovalevZeroFreeKernel.lean)
- [KovalevZeroFreeRemainder.lean](../../lean/Conjectures/KovalevZeroFreeRemainder.lean)
- [KovalevZeroFreeComparison.lean](../../lean/Conjectures/KovalevZeroFreeComparison.lean)
- [KovalevZeroFreeFiniteAlgebra.lean](../../lean/Conjectures/KovalevZeroFreeFiniteAlgebra.lean)
- [KovalevZeroFreeCorrection.lean](../../lean/Conjectures/KovalevZeroFreeCorrection.lean)
- [KovalevZeroFreeAssembly.lean](../../lean/Conjectures/KovalevZeroFreeAssembly.lean)
- [KovalevZeroFreeNormalization.lean](../../lean/Conjectures/KovalevZeroFreeNormalization.lean)
- [KovalevZeroFreeDerivative.lean](../../lean/Conjectures/KovalevZeroFreeDerivative.lean)
- [KovalevZeroFreeSectionIntegral.lean](../../lean/Conjectures/KovalevZeroFreeSectionIntegral.lean)
- [KovalevZeroFreeTaylorSeries.lean](../../lean/Conjectures/KovalevZeroFreeTaylorSeries.lean)
- [KovalevZeroFreeTaylorAnalytic.lean](../../lean/Conjectures/KovalevZeroFreeTaylorAnalytic.lean)
- [KovalevZeroFreeTaylorFinite.lean](../../lean/Conjectures/KovalevZeroFreeTaylorFinite.lean)
- [KovalevZeroFreeTaylor.lean](../../lean/Conjectures/KovalevZeroFreeTaylor.lean)
- [KovalevZeroFree.lean](../../lean/Conjectures/KovalevZeroFree.lean)

## Verification

The exact 21-module project closure passed fresh warning-as-error compilation, an all-owned declaration audit including private declarations, and an exact stock-kernel replay at 2026-11-24 18:05:10 UTC. The audit includes 291 declarations, 265 theorems, 6 private declarations, and all 31 required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. There are no admitted proofs, project axioms, or native-decision trust shortcuts.

The stock replay checked exactly the 21 project modules and took 39.35 seconds. Pinned compiler: Lean 4.35.0, commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`. Mathlib revision: `56a005855ea17e0b0958f73ec801ae140b0a1679`.

The immutable proof-lane [receipt](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/lane/receipt.json) has SHA256 `f9ab69c0e6c65125eaf9b23b89b6cc7202c203fc939f9723564d2b749eaeb1a0`. The source, object, control, compiler/checker, and log hashes were independently rechecked after the run. Audit source and complete declaration inventory were regenerated; exact import closure and replay set were checked again. The separate [validation record](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/lane/verification-validation.json) has SHA256 `ca96c01737e658de40e433cdc440a274f23c5c284b50532cd7151340b5c6de28`.

The earlier five-module checkpoint was correctly marked incomplete and counted as zero. The completed original conjecture counts once. Source and statement reviews are recorded in `STATEMENT_REVIEW.md`, `TAYLOR_REVIEW.md`, `INTEGRAL_REVIEW.md`, and the independent `TRANSPORT_REVIEW.md/json`. The repository-wide aggregate, hosted CI, and deployment states are separate from this scoped proof receipt and are not claimed passed by it.

## Publication verification

The portable registered-closure verifier also passed a fresh 21-module strict rebuild, the complete declaration audit, and exact stock-kernel replay, finishing at 2026-11-24T18:24:26.103906+00:00. Its [receipt](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/receipt.json) has SHA256 `bf58423ff44177ce8ae39b8e2c5db30d8b5d7832dff355f1360897a10a9e48fd`. The integrator independently regenerated the audit and inventory and checked every source, object, control, executable, and log hash; [validation record](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/publication-validation.json). All sources are byte-identical to the reviewed proof lane. Reproduce with `cd lean && lake env python3 ../scripts/verify_kovalev_zero_free.py`.

The unmodified aggregate repository command was also attempted on this publication tree with shared dependencies protected read-only. It failed while Lake attempted to write dependency-cache targets; the [aggregate receipt and log](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/aggregate/receipt.json) record exit 1. The full aggregate is therefore not claimed passed. Repository-wide cache/CI and deployment follow-up remains [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

## Excluded scope

The written extension to arbitrary 0 < alpha <= 1/2 and the sharp arbitrary-segment consequence remain unformalized. The adjacent trigonometric Conjecture 1.3 is a different statement and is neither used nor claimed. No fixed length, fixed degree, or numerical instance is counted separately.

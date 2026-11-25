# Feldheim–Feldheim’s weighted tail conjecture

Complete for the original Conjecture 1, for every positive weight below one and arbitrary independent nonnegative laws without compact support. Distinct laws, atoms and singular laws are included. The higher-dimensional norm and finite-threshold supplements remain unformalized.

## Exact theorem

Let X and Y be independent measurable real random variables on an arbitrary probability space. Assume that each is nonnegative almost surely and neither is almost surely contained in a compact set. For every fixed real t with 0 < t < 1,

```math
\limsup_{m\to\infty}
\frac{\Pr(tX+(1-t)Y>m)}{\Pr(X>m)\Pr(Y>m)}=\infty.
```

The terminal declaration is `Conjectures.FeldheimWeightedTail.feldheim_feldheim_conjecture` in [FeldheimWeightedTail.lean](../../lean/Conjectures/FeldheimWeightedTail.lean). It uses the literal compact-support condition, actual event probabilities and the full real-threshold filter. Infinity is represented by the ENNReal limsup of the real-valued ratio. The denominator is positive at every finite threshold, proved from noncompact support and nonnegativity.

The separate law theorem `tailRatio_limsup_eq_top` is stronger: it permits any two probability laws unbounded above. `independent_tail_limsup` transfers that statement to arbitrary independent random variables. The original nonnegative statement is retained explicitly, and all these wrappers complete one existing conjecture. The theorem asserts an infinite limsup; it does not assert that the ratio converges to infinity.

## Sources and attribution

Naomi Dvora Feldheim and Ohad Noy Feldheim proposed Conjecture 1 in *Mean and Minimum of Independent Random Variables*, §1.1, page 2, arXiv:1609.03004v3, Israel Journal of Mathematics 244 (2021), 857–882. The statement was checked directly in the [author-hosted manuscript](https://u.cs.biu.ac.il/~feldhen/Papers/MinMean.pdf#page=2).

The argument formalized here is the existing [recorded proof](https://github.com/1337isnot1337/solved-conjectures/blob/2f800fa5191a1d747f126fa20f7e9c2b3730b085/results/feldheim-weighted-tail/PROOF.md), Sections 1–4, commit `2f800fa5191a1d747f126fa20f7e9c2b3730b085`, recorded by Cinna Davis. Its source SHA256 is `f597851e42f4df26b5706dd9969d889ee6dc7ebbb5bb4cf028074ce027278fa3`.

The original authors are credited for their earlier equal-weight and iid theorems and the inverse-increment idea. The accessible author PDF labels the latter Lemma 2.6; the recorded arXiv-v3 citation says Lemma 2.7. Since retrieval of that version was blocked, the numbering remains version-qualified. The atom-safe integral comparison follows equation (9) in the repository proof, not an equality formula printed in the older author manuscript. The existing entry's bounded search did not establish worldwide priority, and this formalization makes no stronger priority claim.

## Proof structure

The definitions use actual laws: `survival μ x = μ.real (Ioi x)`, `logTail μ x = -Real.log (survival μ x)`, and `weightedTail` is the actual weighted-sum event under the product measure. An eventual ratio bound gives the log-tail rectangle inequality by inclusion of independent rectangular tail events.

Symmetrizing yields the fixed-weight approximate Wright inequality. The proof integrates its endpoint instances, controls interior and boundary points of a nonnegative deviation, and isolates an actual positive component of the chord deviation. This proves the complete uniform chord bound with constant `max 3 (1+(1-t)/t^2)`.

Two proved adaptations simplify the source's analytic bridges. Actual forward moving averages of a right-continuous monotone function are continuous, preserve the same Wright error, and converge pointwise. This replaces bounded-jump interpolation without restricting the laws. A supremum of supporting slopes constructs a global affine minorant through each interior value minus the chord error. The actual supremum of all affine minorants is convex and differs from the original function by at most that error. This replaces the source's linear-programming reduction without assuming an envelope theorem.

For the resulting convex function, actual inverse unit levels exist by continuity and the intermediate value theorem. Their positive increments decrease and have a divergent sum. A slowly decaying block produces a symmetric interval whose supporting affine function has defect at most one and arbitrarily large affine rise. These windows follow from convexity and divergence alone.

The rectangle inequality then bounds the oscillations of the two separate centered log tails on each window. The weighted slice has a bounded combined log-tail defect and an increment growing with the window index. Actual product-measure Fubini gives the conditional probability integral.

For the same law, finite half-open partition cells retain their right endpoints. Their masses are differences of actual strict upper tails. The elementary logarithm inequality telescopes the right-endpoint sums, and bounded dominated convergence gives

```math
-\log S(b)+\log S(a)
\le \int_{(a,b]} \frac{1}{S(x)}\,d\mu(x),
\qquad S(x)=\mu((x,\infty)).
```

Right continuity supplies the limit even at atoms. This lower bound forces the ratio to exceed every prescribed height beyond every prescribed threshold, contradicting an eventual bound. The final theorem discharges all temporary analytic and integral hypotheses. Independence identifies the actual joint law with the product of the marginal laws.

## Source modules

- [FeldheimWeightedTailBasic.lean](../../lean/Conjectures/FeldheimWeightedTailBasic.lean)
- [FeldheimWeightedTailWrightIntegral.lean](../../lean/Conjectures/FeldheimWeightedTailWrightIntegral.lean)
- [FeldheimWeightedTailWrightUnit.lean](../../lean/Conjectures/FeldheimWeightedTailWrightUnit.lean)
- [FeldheimWeightedTailWrightChord.lean](../../lean/Conjectures/FeldheimWeightedTailWrightChord.lean)
- [FeldheimWeightedTailConvex.lean](../../lean/Conjectures/FeldheimWeightedTailConvex.lean)
- [FeldheimWeightedTailAverage.lean](../../lean/Conjectures/FeldheimWeightedTailAverage.lean)
- [FeldheimWeightedTailWindowsSequence.lean](../../lean/Conjectures/FeldheimWeightedTailWindowsSequence.lean)
- [FeldheimWeightedTailWindowsConvex.lean](../../lean/Conjectures/FeldheimWeightedTailWindowsConvex.lean)
- [FeldheimWeightedTailWindowsInverse.lean](../../lean/Conjectures/FeldheimWeightedTailWindowsInverse.lean)
- [FeldheimWeightedTailWindows.lean](../../lean/Conjectures/FeldheimWeightedTailWindows.lean)
- [FeldheimWeightedTailOscillation.lean](../../lean/Conjectures/FeldheimWeightedTailOscillation.lean)
- [FeldheimWeightedTailAnalysis.lean](../../lean/Conjectures/FeldheimWeightedTailAnalysis.lean)
- [FeldheimWeightedTailLaw.lean](../../lean/Conjectures/FeldheimWeightedTailLaw.lean)
- [FeldheimWeightedTailProbability.lean](../../lean/Conjectures/FeldheimWeightedTailProbability.lean)
- [FeldheimWeightedTailReduction.lean](../../lean/Conjectures/FeldheimWeightedTailReduction.lean)
- [FeldheimWeightedTailLimits.lean](../../lean/Conjectures/FeldheimWeightedTailLimits.lean)
- [FeldheimWeightedTailStieltjesGrid.lean](../../lean/Conjectures/FeldheimWeightedTailStieltjesGrid.lean)
- [FeldheimWeightedTailStieltjesLimit.lean](../../lean/Conjectures/FeldheimWeightedTailStieltjesLimit.lean)
- [FeldheimWeightedTailStieltjes.lean](../../lean/Conjectures/FeldheimWeightedTailStieltjes.lean)
- [FeldheimWeightedTail.lean](../../lean/Conjectures/FeldheimWeightedTail.lean)

## Verification and independent review

The fresh integrated gate passed at 2026-11-24 19:12:27 UTC: twenty warning-as-error source builds, a complete all-owned/private declaration audit, and exact twenty-module stock-kernel replay. The audit covers 179 declarations, 161 theorems, zero private declarations and all thirty required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` occur transitively. There are no admitted proofs, unproved project-specific axioms, or native-decision trust shortcuts. The stock replay took 39.822 seconds.

Pinned compiler: Lean 4.35.0, commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`; Mathlib revision `56a005855ea17e0b0958f73ec801ae140b0a1679`. The immutable [proof-lane receipt](verification/lane/receipt.json), SHA256 `301a9aaa21e9a0693c806d1ffc06157e2d1dd651a99ba43f53cf4fe98c96bf78`, binds all sources, compiled objects, controls, executable hashes and logs. The [independent final validation](verification/FINAL_INDEPENDENT_VALIDATION.json) rehashed those artifacts, regenerated the audit and declaration inventory, and checked the exact local import closure and replay set. The [statement and source reviews](LEAN_REVIEW.md) cover all twenty modules.

The registered publication has a portable verifier and dedicated workflow. With the pinned dependencies installed, reproduce from `lean/`:

```sh
lake env python3 ../scripts/verify_feldheim_weighted_tail.py
```

The normal command performs a full source rebuild, all-owned/private transitive axiom audit and exact stock-kernel replay. A second fresh run of this registered publication passed at 2026-11-24 19:16:17 UTC, including twenty strict builds, the same complete audit and a 40.672-second stock replay. Its [publication receipt](verification/receipt.json), SHA256 `742f1f0538f9b1939b496b29ee2670f24e1eddc7136752f3ba46704b506ab432`, is separate from the immutable proof-lane evidence. The [publication evidence validation](verification/PUBLICATION_VALIDATION.json) rehashed the sources, objects, controls and logs and regenerated the audit and inventory. The portable verifier, dedicated workflow and additive registrations also passed [independent review](verification/PORTABLE_REVIEW.json). The optional `--preflight` mode checks metadata and explicitly does not claim a fresh proof rebuild, audit or replay. The [dated aggregate/cache blocker](verification/aggregate/README.md) is explicitly reused; no new aggregate attempt or repository-wide success is claimed. Aggregate repository verification and current-mode public deployment are separate obligations, tracked in [issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

## Scope boundary

The higher-dimensional norm consequence, its one-dimensional degeneracy, and the separate finite-threshold theorems are not formalized by this package. They are already distinguished from original Conjecture 1 in the existing [source audit](AUDIT.md). No fixed weight, numerical instance, helper lemma or stronger wrapper is counted as an additional conjecture.

# Hegyvári’s conjecture

**Status: verified partial — not complete.**

The [alignment module](../../lean/Conjectures/HegyvariFloorDoublingAlignment.lean) follows the combinatorial quantifier steps in §§2–3 of the existing proof in [the result entry](../../results/hegyvari-floor-doubling). It proves:
- `lateZeroRuns_of_not_boundedGaps`
- `alignedZeroRuns_of_boundedGaps`
- `alignedZeroRuns_sequence`
- `forwardZeroRuns_of_not_transport`
- `forwardTransport_of_no_forwardZeroRuns`
- `disjoint_of_two_transport_criteria`
- `disjoint_of_oddMultiplier_criteria`

In Case I, the two directions of transport, disjointness from bounded gaps, and unbounded marks in at least one ray imply disjointness. In Case II, the verified odd multiplier response and reverse transport give bounded gaps in the first ray. If the second ray does not have bounded gaps, it has arbitrarily late long zero runs aligned with a first-ray mark at the required fixed offset; applying the assumed tower criterion gives the contradiction. The final two theorems quantify over an abstract proposition D; the tower criteria are explicit hypotheses, not axioms or proved assertions about the actual real floor rays.

Verification: stock Lean 4.35.0 release, fresh strict source compilation of transport and alignment, endpoint transitive axiom audit (only propext, Classical.choice and Quot.sound), stock leanchecker on alignment, exit 0. See [receipt](ALIGNMENT_VERIFICATION.txt), source SHA-256 recorded therein. The expanded candidate gate has not been run end-to-end, and the repository-wide all-owned/private audit and build are outstanding.

The [real floor-ray draft](../../lean/Conjectures/HegyvariFloorDoublingReal.lean) is preserved as **UNVERIFIED**. Its Mathlib-dependent compilation could not be reached because the selected compiled dependency closure exceeded the available shared temporary storage. Do not include it in the checked candidate gate or accepted registry. Its proposed endpoints concern floor bounds, recurrence, carry, positivity, non-dyadic marks, cross-ray separation, and conditional distinct completeness. Tactic/API fixes may be needed. No completeness claim.

Original proposer, existing proof authors and priority uncertainty: see [FORMALIZATION.md](FORMALIZATION.md) and original source entry. No new discovery claimed. Retry started 2026-11-24T22:04:35Z; alignment verification finished 22:32:46Z. No complete-result count change.

# Hegyvári’s conjecture — distinct-value bridge (unchecked candidate)

**Status: INCOMPLETE / UNVERIFIED. Do not count as a verified result or merge as a checked formalization.**

Session start: 2026-11-24T20:30:00Z. Existing entry: `results/hegyvari-floor-doubling`; argument: [PROOF.md](../../results/hegyvari-floor-doubling/PROOF.md), §4. This supplements the eight previously checked transport/carry lemmas at `afefcdb270e32718d179704bf8531a07885a722c` (draft PR #584, issue #581). It is not a new mathematical discovery. Attribution, original conjecture statement and priority qualifications remain those in the existing entry. The argument uses the tower results cited there, including Kohlmeyer and Kruer's *Completeness of two floor-doubling sequences*; the existing entry identifies the rational extension and credits the original proposer.

The new candidate is [HegyvariFloorDoublingDistinct.lean](../../lean/Conjectures/HegyvariFloorDoublingDistinct.lean), SHA-256 `261f9c6f99613f9c28383278a8254afcc4d05f54666e6ccd576afad7664f5022`. Candidate endpoints:

- `indexedTailComplete_to_distinctStrongComplete`: if indexed sums are cofinite on every common tail, both rays eventually exceed every bound, and both are injective and mutually disjoint on some common tail, the actual positive union is cofinite in distinct-element subset sums after every finite deletion.
- `binaryStep_eventuallyAbove`, `binaryStep_strictOnTail`, `binaryStep_injectiveOnTail`: the proposed growth and injectivity bridge from the previously defined binary-step condition and a positive starting term.
- `distinctStrongComplete_of_binarySteps`: combines those reductions, still assuming cross-ray tail separation and indexed tail completeness.

Proof approach: represent forbidden finite values by a list, choose a common cutoff beyond which values exceed its sum, map the indexed witness lists to values, use injectivity and disjointness to obtain nodup, and preserve the sum. The natural-valued model is not yet identified with the positive real floor-doubling rays.

Verification attempt: pinned Lean 4.35.0 (eb6cafb), Mathlib commit `56a005855ea17e0b0958f73ec801ae140b0a1679` and pinned dependencies fetched. Even a minimal Init import/decide test stalled; Lake environment/cache attempts timed out. A retry to compile the previously verified transport dependency also timed out (exit 124), before the new candidate could be checked. No new strict compilation, axiom audit, stock kernel replay or repository-wide gate passed. The existing transport receipt applies only to the old module, not this file.

Remaining: compile this candidate and fix any errors; audit all transitive axioms and replay the stock kernel; establish actual floor-ray identities and positivity, binary/carry bounds and non-dyadic marks, eventual cross-ray separation under the non-power-of-two ratio condition, and the tower/common-mark argument yielding indexed tail completeness. Prove and audit the full original real-variable statement and run the repository verification gate before registering any completed result.

Count increment: **0**. Leave the catalogue unchanged.

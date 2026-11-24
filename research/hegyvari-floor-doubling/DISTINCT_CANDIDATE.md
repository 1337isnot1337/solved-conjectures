# Hegyvári’s conjecture — distinct-value bridge

**Status: INCOMPLETE / VERIFIED PARTIAL.** The distinct-value bridge is now strictly compiled, all five public theorem endpoints passed the transitive standard-axiom whitelist, and both project modules passed stock kernel replay. The full conjecture remains unformalized.

Session start: 2026-11-24T20:30:00Z. Existing entry: `results/hegyvari-floor-doubling`; argument: [PROOF.md](../../results/hegyvari-floor-doubling/PROOF.md), §4. This supplements the eight previously checked transport/carry lemmas at `afefcdb270e32718d179704bf8531a07885a722c` (draft PR #584, issue #581). It is not a new mathematical discovery. Attribution, original conjecture statement and priority qualifications remain those in the existing entry. The argument uses the tower results cited there, including Kohlmeyer and Kruer's *Completeness of two floor-doubling sequences*; the existing entry identifies the rational extension and credits the original proposer.

The verified partial module is [HegyvariFloorDoublingDistinct.lean](../../lean/Conjectures/HegyvariFloorDoublingDistinct.lean), SHA-256 `261f9c6f99613f9c28383278a8254afcc4d05f54666e6ccd576afad7664f5022`. Checked endpoints:

- `indexedTailComplete_to_distinctStrongComplete`: if indexed sums are cofinite on every common tail, both rays eventually exceed every bound, and both are injective and mutually disjoint on some common tail, the actual positive union is cofinite in distinct-element subset sums after every finite deletion.
- `binaryStep_eventuallyAbove`, `binaryStep_strictOnTail`, `binaryStep_injectiveOnTail`: the growth and injectivity bridge from the previously defined binary-step condition and a positive starting term.
- `distinctStrongComplete_of_binarySteps`: combines those reductions, still assuming cross-ray tail separation and indexed tail completeness.

Proof approach: represent forbidden finite values by a list, choose a common cutoff beyond which values exceed its sum, map the indexed witness lists to values, use injectivity and disjointness to obtain nodup, and preserve the sum. The natural-valued model is not yet identified with the positive real floor-doubling rays.

Verification: the 20:30 UTC attempt failed during Lean compilation on shared storage. The retry started 2026-11-24T22:04:35Z. The public stock Lean 4.35.0 release archive was staged in the isolated job's temporary memory, with core libraries and stock executables extracted there. Fresh strict compilation, thirteen endpoint transitive axiom checks and stock replay of both unchanged source modules succeeded at 22:10:04 UTC. See [exact receipt](DISTINCT_VERIFICATION.txt). The repository-wide build and complete all-owned/private declaration inventory have not been run; this is a scoped endpoint audit, not an aggregate pass.

Remaining: establish actual floor-ray identities and positivity, binary/carry bounds and non-dyadic marks, eventual cross-ray separation under the non-power-of-two ratio condition, and the tower/common-mark argument yielding indexed tail completeness. Prove and audit the full original real-variable statement and run the repository verification gate before registering any completed result.

Count increment: **0**. Leave the catalogue unchanged.

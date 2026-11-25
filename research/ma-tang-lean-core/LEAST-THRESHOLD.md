# Ma–Tang’s random subset-sum threshold conjecture: the finite threshold

`MaTangCoreLeast.threshold n` is the **least** valid sample size with at least one-half coverage for every complete duplicate-free enumeration of a commutative finite group of size n. Coverage uses the literal finite list of subset sums; the group operations, identity, associativity and two-sided translation inversion are explicit. The entire group supplies a witness that such a least size exists.

`MaTangCoreThreshold.halfCoverage_mono` formalizes the uniform-sample coupling. Prepending a new unused point to each ordered distinct sample multiplies the total number by exactly n−k; all extensions of a covering sample still cover. The constant number of orderings transfers the inequality back to unordered subsets.

The finite endpoints now refer to the **same** threshold. `threshold_upper` proves the universal dyadic upper bound. `threshold_mixed_lower` proves the all-large-d strict lower bound at n=3·2^d, using the mixed group with binary xor and ternary addition. It connects the original matrix-word encoding to the very same subset-value and group model used in the least threshold.

The source and attribution are in the [published written proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/ma-tang-random-subset-sums/PROOF.md). The only remaining endpoint is the normalized real-log limsup. No full-result badge or count change.

Lean 4.35.0: 31 exact strict source builds, all-owned axiom audit (1448 declarations, 1043 theorems, 96 private, 28 required endpoints), and 31 stock replays passed. [Exact receipt](verification/mixed-threshold-receipt.json). Reproduce with `python3 research/ma-tang-lean-core/verify_mixed_threshold.py` using the pinned tools.

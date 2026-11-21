# Xie–Xu's conjecture

Research checkpoint, 21 November 2026. No resolution.

Target: Conjecture 4.4 of arXiv:2408.09152v2, the full additive 2-matroid ultra-log-concavity assertion, tracked in issue #206. The distinct graph Conjecture 4.1 is already proved in ipitchford/dependence-ultra-log-concavity; the old rank-dependent Conjecture 4.8 is already refuted by Alex Chengyu Li (Crab Research, September 2026). Both are excluded. The current ipitchford README and complete frontier and rank-four notes explicitly retain the general Conjecture 4.4 as open. Its eight-point hypergraph obstruction fails 2-augmentation, so it is not a conjecture counterexample.

Fresh bounded MILP discovery run: `python probe.py --q 1 2 4 8 16 32 --seconds 8 --out witness.json`. This uses eight elements, rank five, and all singletons. All candidates passed direct integer downset and all-pairs 2-augmentation checks. No negative ultra-log-concavity margin was found, and no witness file was created.

| i5 | Solver status | i0,...,i5 | Middle margin: 16i4²−25i3i5 |
|---:|---|---|---:|
|1|optimal|1,8,19,19,8,1|549|
|2|optimal|1,8,20,22,11,2|836|
|4|time limit|1,8,22,28,17,4|1824|
|8|time limit|1,8,24,36,27,8|4464|
|16|time limit|1,8,25,40,35,16|3600|
|32|time limit|1,8,28,53,57,32|9584|

The solver's floating objective is only for discovery. These exact integer margins are not proofs about other families or proof of a universal positive case. The time-limit rows do not certify optima.

Structural observations made during screening:

- Additive 2-augmentation is equivalent to saying that, in every ground-set restriction, maximal feasible sets differ in size by at most one. One direction applies augmentation to a smaller maximal set; the other applies the restriction to S∪T.
- A family containing every set of size at most r−1 and an arbitrary selection of r-sets is automatically a 2-matroid, but its rank counts are already log-concave after normalization by ambient binomial coefficients, so this class cannot refute the conjecture.
- Replacing each element by parallel copies, permitting at most one selected copy of each original element and requiring the support to be feasible, preserves 2-augmentation. Thus integer product weights can potentially lift a weighted obstruction to an unweighted one. The normalization changes to the total number of copies and must be checked; a weighted violation at the original ground-set normalization alone is insufficient.
- Direct sum with a matroid preserves the 2-augmentation axiom; direct sum of two arbitrary 2-matroids need not. Hence multiplying two unrelated augmentation-defect gadgets is not a valid construction.

No new proof mechanism is established. This target is paused.

Sources read:

- Original current statement: <https://arxiv.org/html/2408.09152v2>.
- Earlier graph result and exact scope: <https://github.com/ipitchford/dependence-ultra-log-concavity>.
- Full frontier note: <https://github.com/ipitchford/dependence-ultra-log-concavity/blob/main/supplement/frontier_note.md>.
- Rank-four reduction: <https://github.com/ipitchford/dependence-ultra-log-concavity/blob/main/supplement/rank_four_reduction.md>.
- Rank-four proof: <https://github.com/ipitchford/dependence-ultra-log-concavity/blob/main/supplement/rank_four_analytic_proof.md>.
- Li's distinct augmentation-gap disproof: <https://crabresearch.com/research/augmentation-gap-log-concavity?lang=en>.

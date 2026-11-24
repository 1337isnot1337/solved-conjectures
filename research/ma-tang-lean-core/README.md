# Ma–Tang’s random subset-sum threshold conjecture

**Candidate; incomplete and not yet Lean-verified.** No catalogue status change.

Existing result: [main catalogue entry](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/ma-tang-random-subset-sums), [recorded proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/ma-tang-random-subset-sums/PROOF.md), [discovery issue #490](https://github.com/1337isnot1337/solved-conjectures/issues/490), and [publication PR #492](https://github.com/1337isnot1337/solved-conjectures/pull/492). The primary source is Jie Ma and Quanyu Tang, *An Erdős problem on random subset sums in finite abelian groups*, arXiv:2602.05768v2, [Problem 4.1](https://arxiv.org/html/2602.05768v2#S4). Credit the original problem to Ma and Tang and the written resolution to the authors credited in the repository's existing proof package. The earlier Erdős question had already been resolved; no new discovery or exclusive priority is claimed.

## Scope

The draft [Lean module](../../lean/Conjectures/MaTangRandomSubsetSumsCore.lean) follows equations (4) and (5) of the recorded proof. It replaces the pairing/tripling sign construction by a subset of size (2n mod 3), where n is the number of occupied indices in a nonzero type. It groups the finite signed sum by binary kernel-column types and shows that the second-coordinate subset sum is constant on the chosen first-coordinate fiber.

The endpoint `MaTangRandomSubsetSums.not_surjective_of_kernel_columns` is an attempted formalization of the deterministic noncoverage implication, under an explicit fiber representation and no-singleton hypothesis. It is not an asymptotic or probabilistic theorem.

Remaining:
- establish the kernel-column representation for the actual random first-coordinate linear map;
- prove the uniform-kernel distribution, occupancy probability bound, and conditioning on distinct samples;
- prove the asymptotic estimates, monotonicity, and the universal upper bound used in the source;
- compile, audit every owned declaration, and replay the kernel against pinned Lean 4.35.0/Mathlib revision 56a005855ea17e0b0958f73ec801ae140b0a1679; only then consider registering the verified scope.

Session start: 2026-11-24 18:59 UTC. Pyroam execution is blocked by a nonretryable connector fetch error; local Lean/Lake is unavailable. Hosted verification has not yet passed. No completion is counted.

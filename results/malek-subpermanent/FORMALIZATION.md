# Malek's conjecture

**Status: incomplete, compilation and axiom audit pending.** No matrix-level theorem is claimed.

## Scope

The existing [proof](proof.md), published at commit [105b3de](https://github.com/1337isnot1337/solved-conjectures/commit/105b3de5196bd6e8bb452bf7309579aa8b358554), concerns every order n ≥ 2, every nonnegative doubly stochastic matrix A and every subpermanent degree 0 ≤ k ≤ n. Its conclusion is that sigma_k(A) is at least sigma_k((nJ_n − A)/(n−1)). The equality classification in the proof is also outside this candidate's scope.

The [candidate module](../../lean/Conjectures/MalekSlice.lean) extends the [23 November scalar checkpoint](https://github.com/1337isnot1337/solved-conjectures/issues/145#issuecomment-7119462050):

- Positive cubic certificate (18), comparison with n = 5 and strict radical contradiction (17).
- Conditional normalized slice bound (13)–(18), retaining root movement, maximum probability and analytic cost as explicit hypotheses.
- All-real-order rational separation for n ≥ 8 in (23), plus the three exact initial rational comparisons. The latter do not derive the constants from subpermanents.
- Conditional scalar strictness comparison (24).

## Remaining work

Define the matrix-level quantities and derive the stable polynomial identities, reciprocal-mean capacity bound, root-motion and probability estimates, exponential cost bound, scalar coefficient-capacity step, centered-subpermanent estimate, and upper coefficient and exact small-order evaluations. Establish the proper-degree theorem, the small orders/degrees, the prior full-permanent endpoint and equality cases. Connect all statements with the exact conjecture and audit all transitive axioms before registering it as complete.

## Attribution

M. Malek is the original proposer; the exact all-degree statement is recorded in Cheon–Wanless, *Linear Algebra and its Applications* (2005), equation (9), DOI 10.1016/j.laa.2005.02.030. Malek's original paper (DOI 10.1080/03081088908817929) was inaccessible in the repository source audit. The [existing proof](proof.md) and [source audit](source-audit.md) preserve its original credits, Gurvits's coefficient-capacity theorem and Lavi's prior Marcus–Minc and subpermanent estimates. This continuation makes no independent discovery or priority claim.

## Verification record

Session start: 2026-11-24 20:28 UTC. The pinned Lean 4.35.0 compiler was installed and reported its version, but a minimal Init proof timed out in the execution sandbox; Mathlib cache installation also timed out. These failures are environmental, not evidence that the candidate compiles or fails. The scoped workflow uses the repository's existing verify_lean_target.py for strict compilation, transitive axiom inspection and stock-kernel replay. Even a successful scoped run is not the full repository gate or a proof of Malek's conjecture.

# Solver-paid mathematics research, 21 November 2026

Coordination: [campaign issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223).

This continuation is restricted to offers that pay the solver. Lean verification is permitted. Complete mathematical solutions, completed formalizations, submissions, accepted awards, and payments are separate statuses. At this checkpoint all five counts are zero. A partial lemma, a finite positive screen, an old public proof, or a donation in the solver's name is not a completed paid problem.

## Active work

| Lane | Exact target or task | Status |
| --- | --- | --- |
| Erdős 295 | The minimum number of distinct denominators at least N representing 1 has excess over (e−1)N tending to infinity. | [Source audit and failed-route analysis](erdos295/README.md); exponential-tail argument already appears in September prior work. Pointwise lower bound missing. |
| Erdős 461 | A uniform positive linear lower bound for the number of distinct t-smooth parts in an interval of length t. | [Auxiliary residue reduction](erdos461/README.md) and prime-power profile periodicity checked in Lean; full linear bound missing. |
| Gaussian-integer offers | Find genuinely new primitive Fermat–Catalan examples satisfying the posted reward conditions. | [Source and candidate audit](jsp-gaussian/README.md), [quartic factor-allocation search](gaussian-quartic/README.md); every emitted identity matches prior examples. |

Existing reservations in the repository are preserved. Earlier broad Conjectures.io, JSP, and ZZZAgentBoard scans are reused rather than counted again. The main mathematical questions remain unresolved.

## Checked notes

- [DeMath, ZZZAgentBoard, and Lemma Park eligibility update](demath-zzz/eligibility-update.md).
- [Erdős 552: exact minimum-degree reformulation](demath-zzz/erdos552-structural-route.md). The full elementary argument was independently read by the coordinator, including Ramsey thresholds, unboundedness in both directions, the common-neighbour count, and the degree-spread algebra. It is not asserted novel and is not Lean-verified. The missing near-extremal graph theorem is explicit.
- [Erdős 295](erdos295/README.md). Records the September prior manuscript, its exact source blob, the arithmetic obstruction for one or two tail denominators, and the attributed `O(log N)` upper-bound consequence of the recent short Egyptian-fraction theorem. No claimed new theorem.
- [Erdős 461 entropy obstruction](erdos461/entropy-obstruction.md). Gives an exact finite averaging inequality showing that a proposed uniform `log(t)-O(1)` Shannon-entropy bound is false. This diagnostic is not the conjecture's required range-size bound.
- [Erdős 461 Lean checkpoint](erdos461/lean-check.json). The coordinator independently reran compilation. All four printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`. The proof covers prime-power profiles, an admissible factorial modulus, and periodicity. It does not formalize the platform's full smooth-component target or prove the uniform lower bound. The shared full-project verification workflow was not run for this isolated research module.

The ZZZ board pays per problem number, not per Lean declaration. Lemma Park points have no cash value. DeMath's reward amount requires a separate award decision. See the linked notes for primary sources and the limits of these findings.

## Publication and proof discipline

Research checkpoints are published on main using the currently observed parent commit and a guarded update. No result is added to the solved-results table without a complete proof of the intended statement and a fresh prior-work audit. No prize submission, paid verification attempt, wallet transaction, or email has been made.

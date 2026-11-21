# Solver-paid mathematics research, 21 November 2026

Coordination: [campaign issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223).

This continuation is restricted to offers that pay the solver. Lean verification is permitted. Complete qualifying mathematical solutions, full bounty formalizations, submissions, accepted awards, and payments are separate statuses. At this checkpoint all five counts are zero. A partial lemma, a finite positive screen, an old public proof, or a donation in the solver's name is not a completed paid problem.

## Research checkpoints

| Lane | Exact target or task | Status |
| --- | --- | --- |
| Erdős 295 | The minimum number of distinct denominators at least N representing 1 has excess over (e−1)N tending to infinity. | [Source audit and failed-route analysis](erdos295/README.md); exponential-tail argument already appears in September prior work. Pointwise lower bound missing. |
| Erdős 461 | A uniform positive linear lower bound for the number of distinct t-smooth parts in an interval of length t. | [Auxiliary residue reduction](erdos461/README.md) and prime-power profile periodicity checked in Lean; full linear bound missing. |
| Erdős 686, ratio 25 | Two disjoint intervals of the same length whose products have ratio 25. | [Exact continued-fraction search](erdos686/README.md) covers all admissible scalings for the tested reduced fractions at 57 lengths, with no witness. Length three was already excluded in March; the all-length problem remains open. |
| Erdős 677 | Two disjoint intervals of the same length with equal least common multiples. | [Structural feasibility assessment](erdos677/README.md) shows why the proposed divisor-run search would mostly duplicate existing coverage or require impractical enumeration. No new exhaustive scan or solution. |
| Gaussian-integer offers | Find genuinely new primitive Fermat–Catalan examples satisfying the posted reward conditions. | [Source and candidate audit](jsp-gaussian/README.md), [quartic and even-power searches](gaussian-quartic/README.md), and [cubic reductions](gaussian-cubic/README.md); every emitted identity matches prior examples. |
| Gaussian elliptic-curve route | Generate primitive witnesses from rational points over `Q(i)`. | [Exact field and group search](gaussian-mordell/README.md): 687 curves, 237,385 group combinations, 48 candidates, ten old classes, zero unmatched identities. |
| Boyer Enigma 6a | A 6×6 additive–multiplicative magic square with 36 distinct positive integers, or a full impossibility proof. | [Exact restricted obstruction](boyer-six/README.md) rules out every common nonsingular fractional-linear repair of four published near-squares, including all row and column permutations. General construction missing; current honoring of the historical prize not confirmed. |
| Fresh Conjectures.io shortlist | Full targets E65(ii), E366 and E307. | [Source and scope audit](fresh-conjectures-screen/README.md). Each target is still open in the inspected platform record; the documented reductions do not close any of them. |

Existing reservations in the repository are preserved. Earlier broad Conjectures.io, JSP, and ZZZAgentBoard scans are reused rather than counted again. The main mathematical questions remain unresolved.

## Checked notes

- [DeMath, ZZZAgentBoard, and Lemma Park eligibility update](demath-zzz/eligibility-update.md).
- [Erdős 552: exact minimum-degree reformulation](demath-zzz/erdos552-structural-route.md). The full elementary argument was independently read by the coordinator, including Ramsey thresholds, unboundedness in both directions, the common-neighbour count, and the degree-spread algebra. It is not asserted novel and is not Lean-verified. The missing near-extremal graph theorem is explicit.
- [Erdős 295](erdos295/README.md). Records the September prior manuscript, its exact source blob, the arithmetic obstruction for one or two tail denominators, and the attributed `O(log N)` upper-bound consequence of the recent short Egyptian-fraction theorem. No claimed new theorem.
- [Erdős 461 entropy obstruction](erdos461/entropy-obstruction.md). Gives an exact finite averaging inequality showing that a proposed uniform `log(t)-O(1)` Shannon-entropy bound is false. This diagnostic is not the conjecture's required range-size bound.
- [Erdős 461 Lean checkpoint](erdos461/lean-check.json). The coordinator independently reran compilation. All four printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`. The proof covers prime-power profiles, an admissible factorial modulus, and periodicity. It does not formalize the platform's full smooth-component target or prove the uniform lower bound. The shared full-project verification workflow was not run for this isolated research module.
- [Erdős 686 independent review](erdos686/review.md). Reviews the exact continued-fraction coverage, common-factor search, parity constraints, and known-witness controls. The 57 tested lengths include the previously excluded case `k=3`; none of the finite negative searches is an all-length proof.
- [Gaussian normalized Mordell-curve search](jsp-gaussian/normalized-mordell-search.md). Searches rational group combinations on 1,494 curves and recovers three known identities. The bounded seeds are not asserted to generate the full Mordell–Weil groups.
- [Gaussian conjugate-cubic analysis](gaussian-cubic/README.md). Two structural branches reduce to a known rank-zero elliptic curve. The remaining branch has rank-one quotients, and its finite Eisenstein-integer search recovers only the known example. Neither a new example nor a full classification was obtained.
- [Triangle-tiling bounty exclusion](tiling-456075/README.md). The sponsor recognized an exact 50-triangle solution in 2013; a later 32-triangle construction is public. The old construction offer is not an unresolved target.
- [Additional source checks](additional-source-checks.md). Records the unresolved diagram-access limit for Big Pizza, published Gaussian Catalan identities, and relevant prior nonexistence results. No unavailable diagram was reconstructed from guesses.
- [Fresh paid-target audit](fresh-target-audit/README.md). Distinguishes prior full-scope proof claims for Freudenthal stability and KCIK Problem 5 from sponsor acceptance, and excludes fake or expired offers from the usable target list.
- [Erdős 65(ii) quantifier check](fresh-conjectures-screen/erdos65-uniform-gap.md). The recent sufficiently-large-part theorem leaves infinitely many graph orders for each omitted part size. An unspecified threshold is not a finite exhaustive-search remainder.
- [Boyer 6a exact certificate](boyer-six/mobius_orbit_results.json). The coordinator matched all four matrices to the source report and independently reran the rational polynomial identities and transversal checks. This certifies only the explicitly restricted repair obstruction.

The ZZZ board pays per problem number, not per Lean declaration. Lemma Park points have no cash value. DeMath's reward amount requires a separate award decision. See the linked notes for primary sources and the limits of these findings.

## Publication and proof discipline

Research checkpoints are published on main using the currently observed parent commit and a guarded update. No result is added to the solved-results table without a complete proof of the intended statement and a fresh prior-work audit. No prize submission, paid verification attempt, wallet transaction, or email has been made.

# Fresh Conjectures.io targets, 21 November 2026

Status: **no complete bounty solution**. This checkpoint records three live targets and why the obvious next computations would not close them. The E461, E686 and E677 checkpoints are unchanged. No account, credit purchase, submission, wallet operation or prize claim was made.

## Payment and novelty requirements

[Conjectures.io's current guide](https://conjectures.io/how-it-works) states that the first accepted proof or refutation receives the target's reward in Subnet 66 Alpha, paid to the solver's wallet. Dollar amounts are conversion estimates, not fixed cash offers. A submission costs one credit, currently 0.25 TAO; preliminary checking is free. The original AI chat logs are required.

[Submission terms v13, effective 11 November 2026](https://conjectures.io/submission-terms), require the exact pinned Lean statement, permitted axioms only, and review. A complete established public solution predating acceptance disqualifies the same mathematical result even if its Lean formalization is new. Verification, approval and payment are separate states. Partial work earns no completed-target credit here.

## Shortlist

| Target | Exact mathematical obligation | Live observation | Assessment |
|---|---|---|---|
| [Erdős 65(ii)](https://conjectures.io/problems/erdos65-erdos-65-parts-ii) | For every integer `a >= 1`, `n >= 2a`, and simple graph `G` with `n` vertices and at least `a(n-a)` edges, prove that the sum of reciprocals of its distinct cycle lengths is at least `sum_{j=2}^a 1/(2j)`, or refute the universal statement. The site's exact-edge formulation is equivalent. | Open, no proof/refutation attempts; a displayed estimate during this read was $2,481. | Best structural candidate of this screen, but the existing sufficiently-large-`a` theorem does not leave a finite set of graphs. The unresolved gap is documented separately. |
| [Erdős 366](https://conjectures.io/problems/erdos366-erdos-366) | Find a positive integer `n` such that every prime dividing `n` occurs to exponent at least two and every prime dividing `n+1` occurs to exponent at least three, or prove no such integer exists. | Open, no attempts or platform contributions; displayed estimates varied during reading, including $2,708. | One exact witness would settle the full target. A low-height scan would duplicate substantial prior work; no new scan was started. |
| [Erdős 307](https://conjectures.io/problems/erdos307-erdos-307) | Find finite prime sets `P,Q` with `(sum_{p in P} 1/p)(sum_{q in Q} 1/q)=1`, or prove none exist. | Open, no platform attempts or contributions; a displayed estimate was $2,712. | One exact witness suffices, but the recent arithmetic-derivative literature already excludes small supports and develops the elementary structural reductions. No search was launched. |

The estimates are observations, not reserved rewards. The terms and task identifiers matter more than the transient conversion amounts. `targets.json` records the exact type and task commitments read from the live target pages.

## Prior-work checks

### Erdős 65(ii)

The primary manuscript is Milojević, Montgomery, Pokrovskiy and Sudakov, [Minimising the harmonic sum of cycle lengths](https://aleksa-milojevic.github.io/publications/ReciprocalsCycleLengths.pdf), also indexed as arXiv:2609.26401. Theorem 1.2 proves a stronger edge-threshold version for sufficiently large smaller part size. Its all-parameter Conjecture 1.1 remains distinct. The author [publication page](https://aleksa-milojevic.github.io/publications/index.html) confirms that scope.

The [Erdős problem record](https://www.erdosproblems.com/65), [discussion](https://www.erdosproblems.com/forum/thread/65?order=newest), and [claim index](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0065/claims) were checked as discovery/status sources. A [July finite audit](https://www.erdosproblemaday.com/report/65) reports all cases through graph order ten; that computation was not replayed here and is not a complete proof.

The attached note separates the published theorem, a direct pruning argument, and the missing uniform theorem. It makes no novelty claim for those reductions and no claim to have independently checked all 36 pages of the paper.

### Erdős 366

The [current problem record](https://www.erdosproblems.com/366), [revision history](https://www.erdosproblems.com/history/366), [discussion](https://www.erdosproblems.com/forum/thread/366?embed=1), and [formal source](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/366.lean) retain the target as open. The record cites Erdős (1976), page 31, and Erdős–Graham (1980), page 68.

The pairs `(8,9)` and `(12167,12168)` have the reverse order of fullness and do not solve this target. The record attributes a search through `10^22` to OEIS A060355. Direct OEIS retrieval returned 403 in this session; the search limit is therefore recorded as the curator's report, not a newly verified computation.

A simple family of polynomial identities cannot supply the hoped-for construction when fullness is imposed on all polynomial factors. The obstruction and its exact limited scope are written in `erdos366-polynomial-obstruction.md`. It does not rule out an isolated integer witness, a Pell-type sequence, or another non-polynomial construction.

### Erdős 307

The [problem record](https://www.erdosproblems.com/307), [Bonfioli's research repository](https://github.com/ElVec1o/erdos307), [its current README](https://github.com/ElVec1o/erdos307/blob/main/README.md), [an independent audit](https://github.com/umaia1234/agentic-conjectures/blob/main/problems/erdos-307/README.md), and the older arithmetic-derivative literature were checked. The primary current README is version 1.76.2, dated 18 October 2026, blob `6d50ee021349175ead6c09a127fe8afea5e7ef8c`.

The reduced-fraction identities, disjointness, arithmetic-derivative two-cycle equivalence, local congruences, and largest-prime reductions are prior work. Bonfioli reports a fully kernel-checked lower bound of 60 primes and a computational exclusion of level 60 yielding 61. The latter's formal tier expressly retains a named Stage A computation and native-evaluation axioms; it must not be described as a complete standard-axiom Lean proof. Neither build nor enumeration was replayed here. The repository still expressly leaves the full problem open.

Older primary literature includes Ufnarovski–Åhlander, *How to differentiate a number* (J. Integer Sequences 6, 2003, Article 03.3.4), and Kovič, [The Arithmetic Derivative and Antiderivative](https://cs.uwaterloo.ca/journals/JIS/VOL15/Kovic/kovic4.pdf) (2012). No claim of a complete solution was found in the checked sources. This is evidence from a literature search, not proof that no unknown or unindexed work exists.

## Exclusions discovered in this pass

- E944 was not pursued: its [official result](https://conjectures.io/results/e7afff2c-bb07-4fa8-92b6-67a530aaad70) records the full arbitrary-`r` theorem as approved and paid in September 2026, despite stale open labels elsewhere.
- The [live pool-change record](https://conjectures.io/problems/changes) also marks E624, E1068, E94 regular polygons, E579, the conductor-at-most-four-multiplicity Wilf target, and several Math15/Math30 targets solved. Their old catalog headers are not eligibility evidence.
- [E472](https://www.erdosproblems.com/472) concerns an infinite greedy prime trajectory, so a long finite run cannot resolve it.
- [E885](https://conjectures.io/problems/erdos885-erdos-885) and [E1056](https://conjectures.io/problems/erdos1056-erdos-1056) require arbitrarily large parameters. An additional fixed parameter would not close either bounty. They were not converted into numerical case searches.

## Coordination

The repository's current open issues and campaign #223 comments were read. Existing E287, E295, E243, E835, E708, E617, E389, E151, Collatz, Shallit, Sun, Hou–Zeng and other active assignments were avoided. The later Boyer and conditional-mutual-information reservations were also read. Parent agent owns publication of these local files. No new named solved result has been created.

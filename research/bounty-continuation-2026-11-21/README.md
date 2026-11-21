# Direct-payment mathematics: continuation

Started 21 November 2026. This continues [campaign 223](https://github.com/1337isnot1337/solved-conjectures/issues/223) after its stopped checkpoint, rather than opening another duplicate catalogue campaign. Lean is permitted by the owner's current instruction. The separate work in [campaign 222](https://github.com/1337isnot1337/solved-conjectures/issues/222) is preserved.

## Completion status

There is no complete bounty solution, unclaimed award-ready formalization, accepted award, or payment from this continuation. In particular, the owner's target of ten completed paid problems has not been reached. Restricted lemmas, equivalent reformulations, failed proof routes, and positive finite checks do not count toward that target.

## Work and ownership

| Worker | Exact scope | Current output |
| --- | --- | --- |
| `conjectures_bounties` | Erdős 49, exact maximal increasing-totient subsequence equality | [Prime-interval deficit reformulation](erdos49/README.md), independently reviewed; exact diagnostics through two million; full problem unresolved |
| `demath_zzz_bounties` | Erdős 552(ii), unbounded additive Ramsey deficit | [Countermodel to one proposed inference](erdos552/README.md); this is not a counterexample to the Ramsey conjecture |
| `other_paid_math` | Unclaimed JSP formalizations and other direct-payment offers; independent proof review | [Selected JSP and RoundSquare exclusions](eligibility/jsp-and-roundsquare.md); independent Shallit proof review; no award-ready candidate established |
| Root | [Shallit 14](https://github.com/1337isnot1337/solved-conjectures/issues/229), divisibility in automatic relations | [Finite-prime-support promise theorem](shallit/finite-prime-support-promise.md), independently reviewed; [composite-base obstruction](shallit/composite-base-obstruction.md); full decision problem unresolved |

## Subsequent mathematical attempts

- [Erdős 389](erdos389/README.md), coordinated in [issue #232](https://github.com/1337isnot1337/solved-conjectures/issues/232): two independent derivations reduce the remaining prime obstructions to exact cofactor carry inequalities. A congruence handles all small primes. An explicit family shows that subpolynomial smoothness and that congruence still do not imply the required carries. Both diagnostic scripts were replayed by the coordinator. The required all-starts existence construction remains missing.
- [Sun's disjoint cosets](sun-cosets/README.md), coordinated with the pre-existing [issue #231](https://github.com/1337isnot1337/solved-conjectures/issues/231): exact subgroup and coset generation for `A5` and `A6` supported a counterexample search. No counterexample was found. Solver optimality or infeasibility reports are recorded as search evidence, not independent mathematical certificates. The finite search has stopped at its documented construction.
- [Erdős 617](erdos617/README.md) continues in the existing [issue #45](https://github.com/1337isnot1337/solved-conjectures/issues/45). The reviewed localized independence bound forces two disjoint full cliques in a sparse color. If the maximum packing has size two, there are at most five full cliques in total. An edge-critical reduction then limits the packing-two case to six full-clique intersection patterns. This does not exclude all configurations. A source audit identified the independence-number-three argument and pentagon obstruction as prior work; those are recorded as reconstructions, not new results.
- [The Althöfer game obstruction](althofer-periodicity/README.md), coordinated in [issue #224](https://github.com/1337isnot1337/solved-conjectures/issues/224), proves that a complete winning/losing classification cannot eventually depend only on a residue class modulo any fixed positive integer. The standalone Lean proof was compiled and its axiom list checked, then replayed by the coordinator. It assumes a valid total outcome function and does not establish that the actual game is determined. The all-starts prize remains open.

The [six additional JSP source reviews](eligibility/jsp-six-candidate-review.md) identify earlier full-target endpoints, including corrections to misleading filenames and weaker finite claims. The complete imported proofs were not rebuilt. [Ten further records](eligibility/jsp-ten-follow-up.md) also have prior submissions; four matching source endpoints were inspected directly. A [further twenty-record screen](eligibility/jsp-further-screen/README.md) also found prior submissions for every selected entry, with seven pinned source endpoints inspected. These screens are not an exhaustive audit of all 292 catalog entries marked solved without Lean. No new award-ready formalization was obtained.

The prior 326-header Conjectures.io screen, JSP screening, and existing Shallit, Sun, Althöfer, Marcus and clique-transversal investigations have been read. They are not new discoveries of this continuation. New targets or extensions are announced in the existing issue threads before publication.

A [selected prize-ledger recheck](eligibility/ledger-recheck.md) excluded already resolved Shallit complexity questions and Kimberling offers that now pay by donation. The public index is not sufficient evidence of a live direct-pay opportunity.

## Eligibility correction

[ZZZAgentBoard pays per problem number, not per declaration row](eligibility/zzz-payout-unit.md). Its 19 open declaration rows represent 15 independently closable problems. The displayed pool covers four payments of 5 USDC before further funding. This corrects the earlier campaign's phrase “per listed declaration”; it does not create a new mathematical opportunity.

The [current Conjectures.io terms](https://conjectures.io/submission-terms) exclude an established public solution of the exact mathematical target, including conventional proofs, even if its first Lean formalization is new. Their separate verification, review, and payment states must not be conflated. Submission costs, required original AI logs, and the timing of public disclosure require checking before any completed artifact is submitted. No submission, fee, account creation, wallet action, or email has been made.

## Verification scope

Each mathematical note states its hypotheses and remaining gap. The integer scripts are diagnostics and independently check small instances of the formulas; they do not establish the unresolved infinite assertions. The sole standalone Lean artifact here proves the restricted Althöfer classification obstruction, with only `propext` and `Quot.sound` in both theorem dependency lists. No complete bounty target is Lean-verified by this continuation. Repository result counts, shared-project verification status, and badges are unchanged.

All new published files in this continuation are under this directory. Main updates use the current remote head and a matching-head guard so concurrent work is preserved.

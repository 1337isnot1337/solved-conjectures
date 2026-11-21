# Paid mathematical problems, with Lean permitted

Research checkpoint started 21 November 2026. [Coordination issue](https://github.com/1337isnot1337/solved-conjectures/issues/223). No completed bounty solution or payment is claimed at this checkpoint.

The owner's latest instruction permits any mathematical problem whose solution pays the solver directly. A formalization of a known theorem can qualify for a formalization award, but is not a new mathematical resolution. An open conjecture requires a complete proof or counterexample and a current prior-work audit. Partial theorems, numerical screens, and formalization defects are recorded with their actual scope.

## Work allocation

| Lane | Scope | Files |
| --- | --- | --- |
| Conjectures.io | Active exact targets, original statement, novel proof or disproof | `conjectures/` |
| Justin Sun Prize | Award and priority audit; unclaimed full proofs or formalizations | `jsp/` |
| Other prizes | ZZZAgentBoard declarations and direct cash sponsor offers | `other/` |
| Althöfer game | Optimal-play 3n±1 game, distinct from the stochastic chain | `althofer-game/` |
| Sun prime–Pell representation | Full counterexample via a congruence covering, with small-prime exceptions checked | `pell-cover/` |

The separate campaign [#222](https://github.com/1337isnot1337/solved-conjectures/issues/222) has been notified. Existing reservations #216, #220 and #221 are preserved. This directory does not change the root results count.

## Initial payment audit

| Provider | What is offered | Conditions still relevant |
| --- | --- | --- |
| [Conjectures.io](https://conjectures.io/submission-terms) | Solver payments in Subnet 66 Alpha; displayed dollar figures fluctuate | Pinned full statement, clean Lean proof, mathematical novelty, paid submission, required research logs; no submission made |
| [ZZZAgentBoard](https://zzzagents.com/) | 5 USDC per listed declaration; site displayed 20.01975 USDC in the pool | First accepted proof or negation of the pinned declaration, Lean 4.33.1, allowed axioms only; formalization status and mathematical novelty are separate |
| [DeMath](https://demath.org/solves) | Treasury payment to solver | Lean verification and named-mathematician statement attestation; award amount voted by token holders, not a fixed promise |
| [Althöfer Prize 3](https://althofer.de/collatz-prizes.html) | 500 euros to the first prover of the game conjecture | Full all-starts optimal-play result; deadline 31 December 2037; sponsor reports an earlier proof attempt had gaps |

These are source-stated offers, not promises that any result in this repository will receive money. Prize acceptance, allocation and payment must be reported separately from mathematical and Lean verification. No fee, wallet, account registration or external prize submission has been initiated.

## Completion record

No complete new mathematical solution, unclaimed award-ready formalization, accepted prize, or paid prize has been established in this campaign at this checkpoint. Later entries must link a proof, exact statement, source audit, checks and remaining acceptance conditions.

## Checked work

- [Conjectures.io and Marcus](conjectures/README.md): exact reward contract and target scope; 74 floating Gram-matrix searches found no counterexample. Search values are diagnostics, not mathematical certificates of the inequality.
- [Justin Sun Prize and deMath](jsp/SCREENING.md): earlier submissions and problem-number mismatches prevent treating catalogue gaps as unclaimed awards.
- [Other providers](other/README.md): the apparently open Swarm Lean tasks are closed or claimed in the live public API; donation-only, testnet, discontinued and already solved prizes are excluded.
- [Althöfer game](althofer-game/ray-analysis.md): increasing-ray decomposition, finite-strategy certificate completeness and explicit obstacles to two naive induction arguments. No all-starts termination proof.
- [Sun target reservation](https://github.com/1337isnot1337/solved-conjectures/issues/226): investigate the exact coefficient-two Pell representation. Counterexamples to other coefficients and Bloom's already proved shifted-prime-fraction theorem do not qualify.

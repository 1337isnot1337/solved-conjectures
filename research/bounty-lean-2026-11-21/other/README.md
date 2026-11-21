# Other paid-mathematics bounty screening

Research checkpoint: 2026-11-21. Coordination: issue #223. No solution, new theorem, submission, or payment is claimed in this directory.

The latest user scope permits a paid formalization of a known mathematical theorem. Such a formalization would be reported as a formalization, never as a new resolution of the underlying theorem.

## Swarm: advertised openings do not match the live API

The [catalog](https://swarm.tips/bounties) advertises 15 open Lean tasks and 1.49 SOL in escrow. Public unauthenticated requests to the [mainnet task endpoint](https://api.shillbot.org/tasks?network=mainnet&limit=100) on 2026-11-21 returned **two open tasks, both nonmathematical platform-11 blockchain actions, and `next_cursor: null`**. No open Lean task appeared. [Exact public API response bodies and request timestamps](swarm-live-api-2026-11-21.json) are saved from a confirming read at 17:03:33 UTC.

The three apparently tractable known-theorem formalizations were checked individually:

| Advertised target | Advertised amount | Live API state | Decision |
| --- | ---: | --- | --- |
| [De Morgan parity lower bound](https://swarm.tips/bounties/lean/chain-pnp-circuit-1-de-morgan-parity-lower-bound/) | 0.02 SOL | `finalized`, score 0, payment 0 | Closed. The API explicitly says a retry needs a newly funded task agreed with the client. |
| [Lagarias inequality for odd and squarefree integers](https://swarm.tips/bounties/lean/chain-rh-lagarias-3-odd-and-squarefree/) | 0.035 SOL | `claimed`, agent and claimed-at fields null | No established available slot. |
| [Heegner–Monsky congruent primes](https://swarm.tips/bounties/lean/chain-bsd-3-heegner-monsky-primes/) | 0.05 SOL | `claimed`, claimed 2026-11-17 by another wallet | No established available slot. |

The public records identify Solana mainnet by chain ID `solana:5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp`, but a historical escrow amount in a closed task is not an available reward. No independent chain-balance assertion is made here.

Exact public task URLs:

- [Parity](https://api.shillbot.org/tasks/a65bad35-3dbb-4cb5-b3e2-63be99352ea1:63acffc7-9726-4f3a-8210-0fe6b0cc0c56?network=mainnet).
- [Odd/squarefree Lagarias](https://api.shillbot.org/tasks/b1a95b58-047b-4991-ae9e-ada2e2dc232a:a182ade4-f70b-4902-a527-732d058584fc?network=mainnet).
- [Congruent primes](https://api.shillbot.org/tasks/c1b88b99-51b9-4769-af61-178b39b16663:923efaf5-b977-4315-82de-29ca1f5b8750?network=mainnet).

The [current MCP tool documentation](https://swarm.tips/docs/mcp/tools/shillbot/) also says mainnet transaction sponsorship has been retired and onboarding is a recoupable advance. This conflicts with old problem-page copy promising sponsored fees. The [REST guide](https://swarm.tips/docs/start/python/) requires wallet-signature authentication for claims and submissions. No wallet, authentication, onboarding, loan, claim, submission, signature, or transfer was attempted. Reading public GET endpoints required none of these.

The parity statement itself is a legitimate known general theorem: a circuit with binary Boolean gates other than XOR/XNOR needs at least $`2n-1`$ gates to compute parity on $`n\ge2`$ inputs. The API contains an earlier failed proof submission. Repairing that submission would not reopen its bounty, so the campaign should not spend its paid-target budget on it without a newly established reward.

## ZZZAgentBoard: exact declarations checked

The [board](https://zzzagents.com/) offers direct USDC payment for the first accepted proof of one of its remaining pinned declarations or the negation of that declaration. Its advertised pool was 20.01975 USDC and its next and subsequent reward was 5 USDC at the check. Pool and claim status are time-sensitive. The pinned source is formal-conjectures commit `b82b08faa9006484021c12005ab41287fb2ffb69`, Lean 4.33.1 and Mathlib v4.33.1.

- [Erdős 241 pinned source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/241.lean): the paid special declaration concerns the unresolved asymptotic for $`B_3`$ sets. The generalized declaration includes all $`r\ge2`$. The known $`r=2`$ case does not settle either paid target.
- [Erdős 647 pinned source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/647.lean): the apparently easier fixed-window infinitude declaration already contains the Sophie Germain prime infinitude problem as its $`k=3`$ case. See [the elementary reduction](zzz647-obstruction.md).
- [Erdős 50 pinned source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/50.lean): the paid target correctly restricts the real variable to the unit interval. An overbroad auxiliary definition is not a disproof of the paid target.

These checks found no easy formalization of an already known proof among these three targets. No submission was made.

## Other leads rejected after primary-source checks

| Lead | Reason it is not an available paid target |
| --- | --- |
| [Hager reverse Markov inequality prize](https://people.clas.ufl.edu/hager/papers-and-software/) | Sponsor says solved by Xiang-Sheng Wang on 2017-10-13. |
| [Nanongkai €5 questions](https://sites.google.com/site/dannanongkai/open) | Sponsor explicitly labels the €5 program discontinued. The €500 OMv and €300 hinted-Mv challenges are separate hard problems. |
| [Let's Prove Goldbach prizes](https://www.dimostriamogoldbach.it/en/prizes/) | Problems 2 and 3 have multiple submissions under review and no longer accept solutions. |
| [ProveTogether](https://provetogether.ai/) | Bounty funding and payout are planned, not live. |
| [Mathbounty](https://mathbounty.com/problems/1) | Pages request Sepolia testnet wallets. Dollar labels alone do not establish real payout. |
| [Talagrand discrete convexity prize](https://michel.talagrand.net/prizes/combinatorics.pdf) | A [September 2026 proof and Lean formalization](https://github.com/openai/math/blob/main/lean/docs/175.md) already settle the target. |
| Sun's prime-shifted unit-fraction reward | [Thomas Bloom's published paper](https://www.cambridge.org/core/journals/proceedings-of-the-royal-society-of-edinburgh-section-a-mathematics/article/unit-fractions-with-shifted-prime-denominators/3C8CC72C639E2A307BA59F1DEEB851D7) already proves the target. The root researcher independently checked the primary paper and its later citations. |
| Zeilberger challenge rewards | The sponsor's [2026 seminar announcement](https://sites.math.rutgers.edu/~zeilberg/expmath/archive26.html) and [current challenge page](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/DIMACS2026.html) explicitly describe donations to OEIS in the solver's honor. They do not pay the solver. |
| [Shallit older prize list](https://cs.uwaterloo.ca/~shallit/talks.html) | Many individual questions are explicitly solved. The still-open morphic Hankel problem is already reserved by another repository campaign, issue #216. |

The [Combinatorics Foundation](https://www.combinatoricsfoundation.org/erd%C5%91s-problems) considers documented historical Erdős prizes for journal-accepted solutions. Its policy is discretionary. Erdős Problems is a problem database, not itself the payer.

General prize aggregators were used only to find leads. Their status labels were not accepted as evidence of a currently available reward.

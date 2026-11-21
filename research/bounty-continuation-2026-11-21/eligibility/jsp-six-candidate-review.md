# Six additional Justin Sun Prize formalization candidates

Checked 21 November 2026. No eligible new contribution was identified, no Lean proof was written or claimed, and no award was claimed. The six entries below were selected outside the other agents' reserved identifiers. This is a bounded priority and statement-scope review, not an assertion that the catalogue has no remaining opportunities.

## Review method and limits

The starting catalogue filter was `Solved` with `Lean proof = No`. A direct repository PR search for each exact JSP identifier returned earlier submissions. Rather than treating those titles as proof, the review read the linked public theorem declarations, their local definitions, and selected imported endpoints. Original Erdős problem statements were checked separately because JSP and Erdős identifiers differ.

The complete dependency closures were not rebuilt. The conclusion is that matching, earlier full-target source endpoints already exist, not that every earlier submission has been independently verified or received an award. This is enough to avoid starting a duplicate proof campaign without positive evidence of a new contribution.

The current [contribution rules](https://github.com/TheJustinSunPrize/awards/blob/main/CONTRIBUTING.md), read at content blob `33035cb6ee2cb4df5d0e98268dcb94496fbec14e`, require complete original-problem solutions and evidence of the submitter's own contribution. Existing source, review, attribution, and priority evidence matter; an earlier PR opening time alone does not settle priority. A catalogue flag is not an award entitlement.

## Results

| JSP | Original problem | Earlier source inspected | Exact scope found |
| --- | --- | --- | --- |
| 000126 | [Erdős 118](https://www.erdosproblems.com/118) | [Erdos118.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos118.lean), linked by [PR 1668](https://github.com/TheJustinSunPrize/awards/pull/1668) and [5486](https://github.com/TheJustinSunPrize/awards/pull/5486) | `not_erdos_118` negates the universal partition-ordinal implication. The displayed counterexample has the positive-three relation and the negative-five relation at the required ordinal. |
| 000242 | [Erdős 284](https://www.erdosproblems.com/284) | [Erdos284.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos284.lean), linked by [PR 1364](https://github.com/TheJustinSunPrize/awards/pull/1364) and [5464](https://github.com/TheJustinSunPrize/awards/pull/5464) | `erdos_284` gives `f(k)/k -> 1/(e-1)`. The public definition uses exactly `k` strictly increasing positive denominators, and a bridge proves eventual attainment of the maximum. |
| 000243 | [Erdős 286](https://www.erdosproblems.com/286) | [Erdos286.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos286.lean), linked by [PR 1365](https://github.com/TheJustinSunPrize/awards/pull/1365) | `erdos_286` constructs exactly `k` distinct positive denominators for every sufficiently large `k`, inside an interval of width `(e-1+o(1))k`, with reciprocal sum one. |
| 000356 | [Erdős 437](https://www.erdosproblems.com/437) | [Erdos437.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos437.lean), linked by [PR 1427](https://github.com/TheJustinSunPrize/awards/pull/1427); also earlier [PR 174](https://github.com/TheJustinSunPrize/awards/pull/174) | `erdos_437` quantifies over every positive epsilon and all sufficiently large cutoffs, producing an increasing sequence in `[1,x]` with more than `x^(1-epsilon)` square initial products. |
| 000358 | [Erdős 439](https://www.erdosproblems.com/439) | [Goal.lean](https://github.com/CollinYuanjieRen/awards/blob/ed2c0a66433a4d07fa697b4b7748853fd94102d4/submissions/jsp-000358-cyr/Erdos439Power/Goal.lean), linked by [PR 285](https://github.com/TheJustinSunPrize/awards/pull/285) | `full_resolution_explicit` covers every exponent `k+2` and every finite colouring with distinct positive equally coloured summands. A separate endpoint gives the literal integer-domain conclusion. |
| 000383 | [Erdős 471](https://www.erdosproblems.com/471) | [Erdos471.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos471.lean), linked by [PR 1297](https://github.com/TheJustinSunPrize/awards/pull/1297) and [5419](https://github.com/TheJustinSunPrize/awards/pull/5419) | `erdos_471` gives a finite prime seed with unbounded generation sizes under the exact closure by sums of three distinct existing primes. The unconditional endpoint supplies its Vinogradov input from an imported theorem. |

## Scope traps found during the review

### JSP 000243: a finite minimum is a different problem

[PR 2188](https://github.com/TheJustinSunPrize/awards/pull/2188) and [PR 2280](https://github.com/TheJustinSunPrize/awards/pull/2280) describe a global minimum interval span of four using the denominators `2,3,6`. This does not answer the actual asymptotic question with exactly `k` terms. The matching endpoint in the table is the asymptotic theorem, not those finite claims. The original problem explicitly prescribes `k` denominators and the width coefficient `e-1`.

### JSP 000358: a matching filename can still state the wrong theorem

At the inspected plby commit, [Erdos439.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos439.lean) names a limit-density theorem for square-sum-free sets. Its own documentation identifies that result with Erdős 438. The imported [PowerSums.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos439/PowerSums.lean) defines the correct colouring predicates but ends with an analytic conditional reduction for powers of degree at least two; only the degree-one case is discharged there.

That observation alone would not justify treating the bounty as available. The older PR 285 links a separate completion source, whose explicit final theorem covers all powers of degree at least two. Its submission describes the new contribution as completing the Fourier-decay input to the earlier conditional reduction. The explicit theorem was inspected; its full analytic dependency tree was not independently rebuilt.

### JSP 000383: a reduction is not the endpoint

The prime-closure file first proves a conditional implication from distinct ternary Goldbach. It later supplies that hypothesis through [VinogradovsTheorem.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/Wikipedia/VinogradovsTheorem.lean) and states the unconditional closure theorem. Reading only the early conditional lemma would incorrectly leave the impression that this particular source stops at a reduction.

## Decision

No candidate in this six-entry screen has positive evidence of a presently unclaimed, tractable full formalization. The source endpoints and earlier submissions are concrete blockers to claiming a fresh contribution from this pass. There was no investment in duplicate Lean work, no copied proof presented as original, and no claim that six bounty problems had been completed.

`jsp-six-candidate-review.json` records the exact source commits, endpoint names, PR URLs, and search limits. The PR searches were capped at eight results and are not exhaustive priority adjudications. Mathematical work should return to a genuinely unresolved reserved target unless a different candidate supplies evidence of a full-scope gap.

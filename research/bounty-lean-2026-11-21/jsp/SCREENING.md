# Justin Sun Prize and deMath screen

Checked 21 November 2026. This screen produced no new mathematical resolution,
no new completed formalization, and no award claim.

## Scope and decision

The current request permits an unclaimed formalization opportunity for a previously
proved mathematical problem, provided that a qualifying new contribution could
pay its author. Such work would be a formalization result, not a newly solved
open mathematical problem. We excluded donation-only prizes and did not infer
eligibility from the word “unclaimed” alone.

The [JSP catalog](https://github.com/TheJustinSunPrize/awards/blob/main/problems/README.md)
explicitly distinguishes its screening fields from verified eligibility, public
claims, and payment. An unmerged earlier proof submission may already establish
priority even while the catalog still says that no Lean proof is recorded.

## Saturated formalization candidates

The following identifiers were searched across the prize repository's public
pull requests. Each had earlier formalization submissions. They were therefore
not selected for a duplicate proof campaign. This table is not a verification
of the cited proofs or an assertion that every submission has the right scope.

| JSP identifier | Mathematical topic | Earlier submissions inspected or located |
| --- | --- | --- |
| 000301 | Consecutive powerful nonsquares | [579](https://github.com/TheJustinSunPrize/awards/pull/579), [5134](https://github.com/TheJustinSunPrize/awards/pull/5134), [5598](https://github.com/TheJustinSunPrize/awards/pull/5598); more than twenty search hits |
| 000393 | Terms of a polynomial and its square | [368](https://github.com/TheJustinSunPrize/awards/pull/368), [1298](https://github.com/TheJustinSunPrize/awards/pull/1298) |
| 000945 | Prime values of quadratic differences | [625](https://github.com/TheJustinSunPrize/awards/pull/625), [2113](https://github.com/TheJustinSunPrize/awards/pull/2113), [4888](https://github.com/TheJustinSunPrize/awards/pull/4888) |
| 000250 | Egyptian-fraction denominator bounds | [354](https://github.com/TheJustinSunPrize/awards/pull/354), [802](https://github.com/TheJustinSunPrize/awards/pull/802) |
| 000475 | Primitive covering systems | [1269](https://github.com/TheJustinSunPrize/awards/pull/1269) |
| 000511 | Planar bipartite list coloring | [98](https://github.com/TheJustinSunPrize/awards/pull/98), [4712](https://github.com/TheJustinSunPrize/awards/pull/4712) |
| 000513 | List multicoloring | [97](https://github.com/TheJustinSunPrize/awards/pull/97), [99](https://github.com/TheJustinSunPrize/awards/pull/99) |
| 000603 | Weighted point configurations | [664](https://github.com/TheJustinSunPrize/awards/pull/664) |
| 000690 | Critical uniform hypergraphs | [747](https://github.com/TheJustinSunPrize/awards/pull/747), [5600](https://github.com/TheJustinSunPrize/awards/pull/5600) |
| 000884 | Totient comparison | [117](https://github.com/TheJustinSunPrize/awards/pull/117), [1956](https://github.com/TheJustinSunPrize/awards/pull/1956), [2979](https://github.com/TheJustinSunPrize/awards/pull/2979) |
| 000101 | Minimum-degree cycle thresholds | [590](https://github.com/TheJustinSunPrize/awards/pull/590), [4393](https://github.com/TheJustinSunPrize/awards/pull/4393) |
| 001010 | Coverage multiplicity | [919](https://github.com/TheJustinSunPrize/awards/pull/919), [5611](https://github.com/TheJustinSunPrize/awards/pull/5611) |

## Exact-scope traps

JSP numbers are not Erdős problem numbers. JSP-000884 concerns
[Erdős 1064](https://www.erdosproblems.com/1064). Its original conclusion includes
a density-one inequality and infinitely many reversals. A few numerical
examples, or merely the reversal infinitude, do not complete it. PR 2979 instead
identifies JSP-000884 with Erdős 884. An actual complete-source endpoint for the
correct problem already exists in
[plby's Erdos1064.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos1064.lean).
We inspected that source, including its density-one and infinitude endpoints;
we did not rebuild its dependency closure in this screen.

JSP-000236's short paraphrase loses the difficult condition of
[Erdős 276](https://www.erdosproblems.com/276). The open question asks for a
composite Fibonacci-type sequence without an integer sharing a factor with
every term. Graham's known covering construction, and its existing
[formalization submission](https://github.com/TheJustinSunPrize/awards/pull/290),
do not settle that open condition. Coprime initial terms alone are insufficient.

JSP-000258 is [Erdős 307](https://www.erdosproblems.com/307). Reduced fractions
give the known equivalence with a nontrivial squarefree two-cycle of the
arithmetic derivative. That reduction is not new and does not resolve the
existence question; see [Bonfioli's repository](https://github.com/ElVec1o/erdos307).

## deMath

[deMath's solve page](https://demath.org/solves) reports no completed solves and
describes a treasury payout after Lean verification and a mathematician's
statement-fidelity attestation. Token holders select the amount; the page does
not give a fixed guaranteed cash reward. The separately described compute-based
token emissions are not payments for solving a problem.

Its [pinned statement repository](https://github.com/demath-ai/formal-statements-lean)
contains nine targets, using Lean 4.27.0 and formal-conjectures revision
`bcaee6031a085e19432540650e1039b7fd1cea36`. The website also lists Ramsey growth,
which is absent from that table. All are substantial general problems; none
was selected as a quick formalization opportunity. Platform frontier prose must
be checked against current primary literature.

## Next mathematical work

Continue the separately reserved
[Althöfer optimal-play game](https://github.com/1337isnot1337/solved-conjectures/issues/224).
The sponsor names a direct €500 payment for a complete proof, and the problem
has a finite-certificate approach worth testing without disguising finite
computations as a universal theorem.
# Additional payment screen: finite magmas

On 21 November 2026 we checked the finite-magma implication
`E677 => E255` as a possible alternative target. The
[independent research repository](https://github.com/Grisha-Pochuev/finite-magma-e677-to-e255)
explicitly says that the full implication remains unresolved. The
[ETP paper](https://teorth.github.io/equational_theories/paper.pdf) identifies it,
up to duality, as the remaining finite implication. Neither source supplied a
direct-to-solver payment offer in the inspected material.

The [Prove2Me FAQ](https://prove2.me/faq) describes attribution and trust-score
credit for proving statements, not a cash payout. The
[SAIR Equational Theories Stage 1 competition](https://competition.sair.foundation/competitions/mathematics-distillation-challenge-equational-theories-stage1/overview)
had a 20 April 2026 deadline and asked for prompt/cheatsheet performance rather
than a solution of this open implication. It does not establish a current
bounty for E677 => E255. Searches for the equation identifiers together with
`bounty`, `reward`, and `prize` did not supply a primary offer. This records an
unverified-payment exclusion, not a claim that no private or unindexed offer
can exist. No mathematical work on this target was begun.


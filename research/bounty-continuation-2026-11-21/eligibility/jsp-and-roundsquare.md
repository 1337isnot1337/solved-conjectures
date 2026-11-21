# Paid-target status audit

Checked 2026-11-21. This file records exclusions and priority conflicts, not completed bounties. No prize submission, sponsor contact, financial acceptance, or payment occurred.

## Justin Sun Prize: additional lower-numbered catalog entries

The official catalog's “no Lean” field is not proof that no prior Lean submission exists. Public pull-request search in [TheJustinSunPrize/awards](https://github.com/TheJustinSunPrize/awards/pulls) found earlier submissions for every member of this additional 17-entry shortlist. The prior campaign had already screened a different small subset of entries numbered 1–350.

| Catalog ID | One earlier submission found |
| --- | --- |
| JSP-000060 | [PR 1666](https://github.com/TheJustinSunPrize/awards/pull/1666) |
| JSP-000078 | [PR 769](https://github.com/TheJustinSunPrize/awards/pull/769) |
| JSP-000087 | [PR 521](https://github.com/TheJustinSunPrize/awards/pull/521) |
| JSP-000089 | [PR 996](https://github.com/TheJustinSunPrize/awards/pull/996) |
| JSP-000090 | [PR 1415](https://github.com/TheJustinSunPrize/awards/pull/1415) |
| JSP-000093 | [PR 537](https://github.com/TheJustinSunPrize/awards/pull/537) |
| JSP-000096 | [PR 1235](https://github.com/TheJustinSunPrize/awards/pull/1235) |
| JSP-000104 | [PR 1417](https://github.com/TheJustinSunPrize/awards/pull/1417) |
| JSP-000108 | [PR 665](https://github.com/TheJustinSunPrize/awards/pull/665) |
| JSP-000121 | [PR 1418](https://github.com/TheJustinSunPrize/awards/pull/1418) |
| JSP-000183 | [PR 1474](https://github.com/TheJustinSunPrize/awards/pull/1474) |
| JSP-000248 | [PR 781](https://github.com/TheJustinSunPrize/awards/pull/781) |
| JSP-000264 | [PR 1593](https://github.com/TheJustinSunPrize/awards/pull/1593) |
| JSP-000288 | [PR 850](https://github.com/TheJustinSunPrize/awards/pull/850) |
| JSP-000320 | [PR 296](https://github.com/TheJustinSunPrize/awards/pull/296) |
| JSP-000331 | [PR 170](https://github.com/TheJustinSunPrize/awards/pull/170) |
| JSP-000346 | [PR 1426](https://github.com/TheJustinSunPrize/awards/pull/1426) |

These records establish a priority conflict requiring actual proof inspection; a PR title or an author-reported build is not independently verified mathematical completion.

Two entries were inspected beyond titles:

- **JSP-000087 / Erdős 69.** The pinned [Erdos69.lean](https://raw.githubusercontent.com/plby/lean-proofs/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos69.lean) exports unconditional irrationality of the series involving the number of distinct prime factors. Its proof imports `ErdosProblems.Erdos69.CorrectionErrorBounds`; its terminal theorem does not merely assume the desired irrationality or provide only a Lambert-series identity. The dependency closure was not rebuilt here. The [primary Erdős problem page](https://www.erdosproblems.com/69) already records the mathematical problem as solved.
- **JSP-000288 / Erdős 346.** [PR 850](https://github.com/TheJustinSunPrize/awards/pull/850) provides a pinned dedicated repository and identifies complete counterexample endpoints `Erdos346.erdos_346_counterexample` and `Erdos346.not_erdos_346`. The described construction addresses minimal stable completeness, every finite deletion, every infinite deletion, and two distinct limiting ratios; it is not only an example of a complete sequence. [PR 5609](https://github.com/TheJustinSunPrize/awards/pull/5609) is another earlier submission for the full benchmark. The claims were inspected as source/submission evidence, not independently rebuilt kernel evidence.

The [official prize rules](https://www.hejustinsun.com/prize/rules) make adjudication and payment separate from a passing build or merged pull request. No award or priority entitlement is inferred here.

## The 25 LTC RoundSquare offer

The research lead was a social post offering 25 LTC for a flaw in a Lean statement or claimed deductive chain. The relevant primary repository is [Dr-Logvinovich/round-square](https://github.com/Dr-Logvinovich/round-square).

The apparently promising model-scope objection has already been made in [official issue 3](https://github.com/Dr-Logvinovich/round-square/issues/3). That issue, opened on 2026-11-09 against pinned commit `a5a8cdd9710249a4774b48df51ea54abe7062245`, describes a Lean diagnostic audit separating the formal spectral predicate from the actual operator and giving the massive-free-field countermodel to a claimed physical inference. It explicitly does not report a Lean kernel inconsistency or a contradiction in the stated formal theorem.

On 2026-11-10 the author rejected that kind of objection as outside the offered reward, saying the applicable challenge concerned a logical/kernel flaw or a refutation of the proved formal theorems. The current README also states that the bridge from its surrogate assumptions to physical Yang–Mills theory is unproved, and that the development does not establish an unconditional refutation of the Clay problem.

Consequently the already-published scope objection is not a new mathematical solution or a demonstrated payable claim. Repeating it would not meet the user's requirements. No independent reserve or payout guarantee was established.

## Duplicate work explicitly excluded

An exploratory local Hankel determinant run was begun before the existing Shallit 9 record was fully located. It tested a smaller range than the existing repository work and is not progress toward the bounty. It is not included in any completion count.

Likewise, the first proposed Hou–Zeng direction, using Catalan divisibility along Chen's Fibonacci progressions, was already present in `research/hou-zeng/README.md` and issue 221. The existing work includes an asymptotic representation-growth theorem and two million progression checks. That direction was not republished as new work.

## Mathematical work produced in this review

The separate [independent review](../shallit/independent-review.md) checks and strengthens the root agent's conditional Shallit 14 pumping theorem. It proves the sharper denominator bound, gives an effective construction of the entire automatic integer part under the promise, and independently verifies the composite-base obstruction. Those are partial structural results, not a bounty resolution.

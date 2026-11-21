# Ten further JSP records: prior contributions and exact scope

Checked 21 November 2026. These are ten screened records, not ten completed problems. No proof or award is claimed. The catalogue's `Solved` and `Lean proof = No` fields were used to select candidates, then actual earlier submissions were searched. The search returned earlier records for every identifier below.

| JSP identifier | Earlier records located |
| --- | --- |
| 000211 | [5467](https://github.com/TheJustinSunPrize/awards/pull/5467), [1274](https://github.com/TheJustinSunPrize/awards/pull/1274) |
| 000216 | [4594](https://github.com/TheJustinSunPrize/awards/pull/4594), [existing-source review 465](https://github.com/TheJustinSunPrize/awards/issues/465) |
| 000281 | [5456](https://github.com/TheJustinSunPrize/awards/pull/5456), [681](https://github.com/TheJustinSunPrize/awards/pull/681) |
| 000285 | [5455](https://github.com/TheJustinSunPrize/awards/pull/5455), [158](https://github.com/TheJustinSunPrize/awards/pull/158) |
| 000286 | [5454](https://github.com/TheJustinSunPrize/awards/pull/5454), [1275](https://github.com/TheJustinSunPrize/awards/pull/1275) |
| 000298 | [5453](https://github.com/TheJustinSunPrize/awards/pull/5453), [1678](https://github.com/TheJustinSunPrize/awards/pull/1678) |
| 000307 | [4591](https://github.com/TheJustinSunPrize/awards/pull/4591), [627](https://github.com/TheJustinSunPrize/awards/pull/627) |
| 000313 | [5451](https://github.com/TheJustinSunPrize/awards/pull/5451), [2228](https://github.com/TheJustinSunPrize/awards/pull/2228) |
| 000314 | [5450](https://github.com/TheJustinSunPrize/awards/pull/5450), [1657](https://github.com/TheJustinSunPrize/awards/pull/1657) |
| 000334 | [5527](https://github.com/TheJustinSunPrize/awards/pull/5527), [1677](https://github.com/TheJustinSunPrize/awards/pull/1677) |

The PR searches were capped at eight results per identifier. They are not exhaustive priority adjudications. A submission title, an author assertion, or a recorded axiom comment is not itself proof that the mathematical statement was fully formalized.

## Four source endpoints inspected

The following public source files were read at `plby/lean-proofs` commit `8822f7ddef30fadbd92e1c6ab4ed897af356af5e`. Their terminal theorems are unconditional at the displayed source interface; their complete imported dependency closures were not rebuilt or independently kernel-replayed in this screen.

| JSP | Original problem | Source endpoint and scope |
| --- | --- | --- |
| 000211 | Erdős 240 | [`Erdos240.erdos_240`](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos240.lean) asserts an infinite prime set whose positive smooth integers admit a strictly increasing complete enumeration with consecutive gaps tending to infinity. The local definitions exclude zero and require equality of the enumeration range with the entire smooth set. |
| 000286 | Erdős 344 | [`Erdos344.erdos_344`](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos344.lean) supplies a positive constant for the square-root-density hypothesis and an infinite arithmetic progression in the subset sums for every qualifying set. Its finite Szemerédi–Vu input is supplied by an earlier theorem, rather than left as a hypothesis of the endpoint. |
| 000298 | Erdős 360 | [`Erdos360.erdos_360`](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos360.lean) states the eventual two-sided bound for the full subset-sum colouring function. This is stronger in scope than a construction giving only the older cubic-root upper bound. The definitions and analytic inputs live in imported modules and remain outside this limited replay scope. |
| 000314 | Erdős 380 | [`Erdos380.erdos_380`](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos380.lean) states the two-sided asymptotic for the full covered-point counting function, with a separate ratio-limit endpoint. It does not stop at the elementary prime-free-interval observation. |

## Quantifier traps

For JSP 000307, a single triple with decreasing largest prime factors does not prove the original infinitude assertion. Earlier submissions explicitly disclose this weaker scope, and PR 627 restores the infinitude quantifier in the catalogue wording. No finite witness is counted here as a new solution.

For JSP 000313, the original Erdős 378 question asks for positive density at every lower threshold of squarefree interior entries. The catalogue's exact-count wording is stronger. PR 2228 identifies this difference and links an earlier claimed completion of the exact-count positivity and exponential density bounds. That source was located through the PR but was not independently rebuilt in this follow-up. The similarly numbered Erdős 379 is a different problem and is not evidence for this entry.

For JSP 000216, an example of a zero-density set whose sumset is all natural numbers does not prove the universal Freiman bound for every infinite zero-density set. Existing-source review 465 explicitly states the universal theorem and its previously recorded verification. We did not reproduce those verification claims here.

These records give concrete reasons to avoid a duplicate contribution claim. They do not prove that all first-formalization opportunities in the prize catalogue are exhausted, or that any particular earlier claimant will be paid.

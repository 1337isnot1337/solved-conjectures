# Broader JSP screen: identifiers 651–1072

Date: 2026-11-21. This is a screening note, not a proof, accepted submission, or award claim.

The live [JSP index](https://github.com/TheJustinSunPrize/awards/blob/main/problems/README.md) contained 126 entries in the assigned identifier range marked mathematically solved with no recorded complete Lean proof. The index explicitly distinguishes those catalog flags from actual submission priority and award eligibility.

The accompanying index records the titles screened and the PR searches actually performed. A rate-limited query is marked as unassessed; it is not a zero-result search. No claim of an exhaustive priority search is made.

## Findings that changed target selection

| JSP identifier | Original source | Scope check and decision |
| --- | --- | --- |
| 000746 | [Erdős 895](https://www.erdosproblems.com/895) | The exact theorem concerns every sufficiently large finite triangle-free graph on the positive integer interval. A certificate for 18 vertices plus restriction proves the full statement. Prior PRs [5602](https://github.com/TheJustinSunPrize/awards/pull/5602), [5270](https://github.com/TheJustinSunPrize/awards/pull/5270), and earlier registrations point to complete proofs. The pinned plby source was read: it has 153 edge variables, 888 clauses, LRAT reconstruction, a graph correspondence theorem, and the final sufficiently-large-order theorem. Excluded as a clear new formalization opportunity. No local rebuild was performed. |
| 000884 | [Erdős 1064](https://www.erdosproblems.com/1064) | The actual task requires the strict totient inequality for a density-one set, as well as reverse inequality infinitely often. Numerical examples and the reverse family alone do not suffice. PR [1956](https://github.com/TheJustinSunPrize/awards/pull/1956) reaches the older lower-density bound 0.54; other reviewed submissions are weaker or use the wrong Erdős identifier. However, a separate pinned plby source explicitly proves the full density-one theorem and its stronger error-term version. The apparent gap in the PR list therefore does not establish an unclaimed formalization. |
| 000945 | [Erdős 1140](https://www.erdosproblems.com/1140) | The catalog paraphrase loses the original infinitude quantifier. Witnesses 5, 13, or 199 do not settle the original question. PRs [625](https://github.com/TheJustinSunPrize/awards/pull/625) and [4888](https://github.com/TheJustinSunPrize/awards/pull/4888) identify the discrepancy. PR [1704](https://github.com/TheJustinSunPrize/awards/pull/1704) points to a prior formalization of the finiteness resolution. Do not select a finite witness as the full task. |
| 001018 | [Erdős 1213](https://www.erdosproblems.com/1213) | Prior submissions include [827](https://github.com/TheJustinSunPrize/awards/pull/827), explicitly covering every positive starting value and gap bound, and the full threshold conclusion for consecutive block sums. This is more than a numerical instance. No clear new-priority opportunity identified. |
| 001019 | [Erdős 1214](https://www.erdosproblems.com/1214) | The pinned plby source was read. Its terminal theorem quantifies over all positive bases and all positive powers and concludes equality of the bases from equal prime supports. It uses Kummer theory and a Chebotarev dependency. It is not just a finite support check. No first-formalization claim is available from the catalog gap alone. |
| 000715 | [Erdős 863](https://www.erdosproblems.com/863) | The source compares asymptotic constants for bounded sum and difference multiplicities, conditional on their existence. [Issue 19](https://github.com/TheJustinSunPrize/awards/issues/19) already records a full corresponding formal proof with the exact conditional scope. No new formalization candidate established. |

Pinned prior sources inspected:

- [Erdos895.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos895.lean)
- [Erdos1064.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos1064.lean)
- [Erdos1214.lean](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos1214.lean)

The source inspection establishes that explicit prior proofs address the relevant full statements. It does not independently certify every imported dependency, build success, authorship, or award eligibility.

The initial short candidates 653, 673, 690, 731, 746, 827, 878, 884, 907, 945, 1018, 1019, and 1021 all had prior PR records. Existence of a PR alone is not treated as proof of completeness; the table records the candidates whose exact scope was reviewed.

GitHub search then returned HTTP 403 rate-limit responses. Search was stopped. The investigation rotated to the exact frozen Conjectures task statements rather than continuing a catalog audit without a viable target.

## Outcome

No new complete mathematical result or clearly unclaimed complete formalization was produced. No proof, claim, registration, identity information, or payment instruction was submitted to JSP.


# Combinatorics archive audit

Checked on 20 November 2026. This audit supplements the individual literature records after public GitHub archives exposed earlier solutions that ordinary web searches had missed. It is a bounded search, not a guarantee of priority.

## Outcome

| Target | Exact scope audited | Archive conclusion |
| --- | --- | --- |
| Gatzweiler–Krattenthaler | Conjecture 4 of arXiv:2502.06032v3, restated as Conjecture 1.3 of arXiv:2603.22226; arbitrary nonnegative exponents, common shift $m\ge n$, polynomiality at that chosen shift | **Earlier exact disproof confirmed in CoPEER. Excluded from new-resolution claims.** |
| Gilmore | Published Conjecture 6.16, arXiv:2106.00656v2 Conjecture 6.11; identification of the first matrix column with perfect matchings weighted by crossing and nesting **pairs** | No earlier matching resolution located in this archive audit. |
| Bernardi–Morales | Published Conjectures 27 and 28, arXiv:1501.01135v1 Conjectures 21 and 22; delta-process tree count and stronger marked-event determinant identity | No earlier matching resolution located in this archive audit. |
| Sagan–Swanson | Conjecture 7.8 of arXiv:2205.14078; asymptotic normality for all four unshifted q-Stirling coefficient distributions when $k/n\to\alpha\in(0,1)$ | Earlier archive proofs concern Conjecture 7.6, bottom-heaviness. No earlier proof of Conjecture 7.8 located. |

The three negative findings retain the original limitations of their individual literature audits. They do not certify absence of another public or unpublished proof.

## Sources and coverage

The following public snapshots were inspected:

1. [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions/tree/47371706c400c79d06e3fb62190fcf6f7a725c85): the complete recursive tree, the 493-entry site-backup manifest covering 249 projects, the mathematical index, and full text of plausible overlapping solution files. Name and source-ID searches supplemented the title screen.
2. [KnowledgeSense/math](https://github.com/KnowledgeSense/math/tree/b95a52a54597e8b01c1a28486f2a9b29a3a54c58): the complete recursive tree and titles of its 56 preprint directories, plus scoped source/name searches. No matching title or target-specific result was found for these four targets.
3. [qqliu/CoPEER](https://github.com/qqliu/CoPEER/tree/105523fdaf018b62eaf2883347724dfe79935611): its mathematical README, all twelve discovery entries' source/index metadata, the full fake-Gaussian card, evidence metadata, exact-checker source, and scoped source/name searches for the other three targets. The full recursive-tree request failed twice with a transport-closed error; it is not recorded as a successful full-tree audit.
4. Global GitHub code searches for all four arXiv source identifiers, exact source titles or DOI strings, and distinctive terms. Relevant new results were opened in full. Numeric and common-name queries produced irrelevant data files; those were not treated as mathematical evidence.

Search errors were recorded separately from empty results. The initial global query for 2502.06032 timed out twice. The successful narrowed query `"2502.06032" "positivity"` found the exact earlier disproof. Rate-limited queries were retried or replaced by a documented narrower search. Ordinary web searches, author pages, MathDB, and any single archive are insufficient on their own.

## Exact earlier Gatzweiler–Krattenthaler disproof

The [CoPEER card](https://github.com/qqliu/CoPEER/blob/105523fdaf018b62eaf2883347724dfe79935611/mathematics/discoveries/entries/number-theory/fake-gaussian-positivity-counterexample.md) uses

```math
n=21,\qquad m=22,\qquad a_6=a_{21}=1,\qquad a_{14}=a_{18}=a_{20}=2,
```

with all other exponents zero. It explicitly binds the statement to Conjecture 4 of the original paper, preserving the arbitrary-exponent and chosen-shift hypotheses.

The numerator exponents are $28,36,36,40,40,42,42,43$; the denominator exponents are $6,14,14,18,18,20,20,21$. Independent integer arithmetic reproduced every cyclotomic valuation and confirmed that all are nonnegative. The reciprocal denominator has coefficient zero at $43,15,7,3,1$, while its constant coefficient is one. Consequently the quotient coefficient at $q^{43}$ is $-1$. The [corrected literature record](../../results/gatzweiler-krattenthaler/literature.md) supplies the elementary support argument and full valuation list.

The card's internal deposition date is **11 September 2026**. The retrieved path history contains a single root commit, [105523fdaf018b62eaf2883347724dfe79935611](https://github.com/qqliu/CoPEER/commit/105523fdaf018b62eaf2883347724dfe79935611), dated **24 October 2026 at 23:43:15 UTC**, with message “Public repository for copeer”. The latter is the observed Git history date. The card's draft label and absence of a global-priority claim do not negate its explicit valid disproof.

The repository's five-factor family is a different construction, but the whole named conjecture was already resolved. README, proof attribution, literature status, and issue 78 were corrected. Infinite dilation of the new example does not restore eligibility as a new resolution.

## Overlapping titles that do not resolve these targets

### Sagan–Swanson

The full [Principia MathDB 354788 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-354788/mathdb-354788-solution.tex), internally dated 12 September 2026, proves bottom-heaviness of all four q-Stirling coefficient families. Its theorem and subsequent tasks concern Conjecture **7.6**, centered coefficient inequalities, injections, equality, reflection-group extensions, and separate log-concavity questions. It contains no asymptotic normality theorem.

The full [Trure bottom-heaviness record](https://github.com/the-omega-institute/trureturing/blob/cca29745e218e47172a8ef7e5d2f54eb52657726/Problems/ss2205-bottomheavy.md) also identifies Conjecture 7.6. Its “Surviving neighbours” section explicitly says asymptotic normality is not settled by that module. Reading this prose does not validate or run its Lean formalization; none was used in this audit.

Bottom-heaviness alone does not imply a central limit theorem. These records therefore do not supply an earlier resolution of Conjecture 7.8.

### Gilmore

The full [Principia MathDB 317480 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-317480/mathdb-317480-solution.tex), internally dated 21 September 2026, disproves third-order q-log-convexity of matching crossing polynomials. Its source is Chen's arXiv:0806.3392v2 Conjecture 1.8, and its statistic is the maximum number of mutually crossing arcs. Gilmore's conjecture instead identifies a specific recursively defined matrix entry with the generating polynomial for the **number of crossing pairs and nesting pairs**. The Chen counterexample has neither the same statistic nor the same asserted identity.

A global source-ID search also found [an arXiv reading-note mirror](https://github.com/alb3rrt/tfm_unir_afernandez_V1/blob/main/ArXiv_Papers/2106.0656__Notes.md). The entire file contains the original abstract and bibliographic metadata followed by an empty reading-notes placeholder. It gives no proof of the conjecture.

### Other positivity records

The full [Principia MathDB 358386 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-358386/mathdb-358386-solution.tex), internally dated 27 September 2026, concerns Billey–Swanson Conjecture 48 in arXiv:2305.07620v3: positive cyclotomic-generating polynomials without a prime-index factor. This is a different assertion from common-shift product positivity.

The full [Principia MathDB 358005 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-358005/mathdb-358005-solution.tex), internally dated 29 September 2026, proves an Amdeberhan–Callan Gaussian-product inequality from arXiv:2304.03395v1. It does not assert the Gatzweiler–Krattenthaler chosen-shift positivity implication.

## Searches for the remaining three targets

Successful archive-scoped searches included Gilmore and 2106.00656, Bernardi/Morales and 1501.01135, Sagan/Swanson and 2205.14078, “delta-process”, and q-Stirling/normality terms. The three exact source identifiers returned no CoPEER matches. The CoPEER Bernardi search matched the unrelated given name Bernardino in a FunSearch citation; the crossing/nesting search matched an unrelated feedback-vertex-set attempt. Their returned statements do not overlap the target mathematics.

Global exact-title/DOI searches for “Some probabilistic trees with algebraic roots” and “10.37236/10465” exposed no prior solution outside this repository. Global Sagan/Swanson/normality searches returned the distinct Trure bottom-heaviness record discussed above. No accepted record was downgraded merely because an archive had a related title.

## Final global source-ID sweep

A final REST code-search pass excluded this repository and exposed both `total_count` and `incomplete_results`. The three source-ID-only queries returned:

| Query, excluding `1337isnot1337/solved-conjectures` | Total results | Incomplete results |
| --- | ---: | --- |
| `"2106.00656"` | 9 | false |
| `"1501.01135"` | 19 | false |
| `"2205.14078"` | 12 | false |

Every returned path was screened. The Gilmore hits consist of the empty mathematical reading note, numeric data, and an incorrect talking-head-dataset citation duplicated by a catalog. The Bernardi–Morales hits are numeric data, including the coordinate 1501.0113525390625 in a manuscript image annotation; none is a mathematical proof. The q-Stirling hits are bibliographic feeds, numeric data, the Principia bottom-heaviness proof, and Trure records for that same bottom-heaviness theorem. The additional [Trure source anchor](https://github.com/the-omega-institute/trureturing/blob/48d6c83d40f4e938aaf53862ba583d37cc4b0d0b/Library/RecurrenceComposition/sagan2022qstirling.md) was read in full and explicitly binds its claim to Conjecture 7.6.

Adding a distinctive source word gives totals 1, 0, and 7 respectively, again with `incomplete_results=false`. Scoped searches for each of the three source IDs in the newly discovered `eliottcassidy2000/math` archive returned zero, also with `incomplete_results=false`. These flags describe GitHub's returned search results; they do not prove its index is exhaustive.

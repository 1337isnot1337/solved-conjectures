# Final global issue-history priority refresh

Date: 21 November 2026. This is a supplement to the package-specific source audits, not a replacement for their primary-source and full-text checks.

## Why this check mattered

The ordinary proof of Fang–Zhang–Zhao's Sturm conjecture was found in a public GitHub issue even though the mathematical paper and later literature still presented the question as open. The issue's later formalization status was irrelevant: its complete ordinary proof was already public on 18 October. The result was withdrawn at [6670242](https://github.com/1337isnot1337/solved-conjectures/commit/66702422a6e04fa7a2fe1ca30ad529531442ab69) and preserved as credited research.

`TT` below denotes the public `the-omega-institute/trureturing` repository. Each issue reference includes its available discussion history.

Accordingly, the final review searched global issue histories separately from code indexes. The table records successful issue queries. GitHub may match comments as well as issue bodies. Returned counts describe that search response, not a complete worldwide census.

## Current-group targets

| Query or family | Returned scope and disposition |
| --- | --- |
| "Kitaev" "Zhang" "records" | Eleven returned issues. The relevant earlier entries were [TT issue 12664](https://github.com/the-omega-institute/trureturing/issues/12664) (known Conjecture 2), [TT issue 20489](https://github.com/the-omega-institute/trureturing/issues/20489) (Conjecture 1 preregistration with zero comments and no proof), and unrelated [TT issue 20336](https://github.com/the-omega-institute/trureturing/issues/20336). The current ordinary theory blob is byte-identical to the pinned October 30 C2 note. The refreshed exact audit is in the CKZ package's SOURCES.md at commit `2c03e97231a16619c81b5bdee68869a2c0a9ff6e`. |
| "2202.03793" | One external issue, [TT issue 24251](https://github.com/the-omega-institute/trureturing/issues/24251). It concerns Deb–Sokal's different higher-order subset triangle. Its mention of Zhu's source is a general-framework bibliography entry; the matching passage was read. |
| "Jacobi" "Stirling" "Zhu" "conjecture" | Five returned issues. Besides the present work, the bodies concerned an arXiv digest and Reed–Solomon research with unrelated uses of the words. |
| "Jacobi-Stirling" "Hankel" | Three returned issues. The external hit [TT issue 22587](https://github.com/the-omega-institute/trureturing/issues/22587) concerns Kurkov's Stirling-minor Vandermonde sum, not Zhu's generalized row-polynomial determinant. |
| "generalized Jacobi" "counterexample" | Five returned issues. The external mathematical target [TT issue 22349](https://github.com/the-omega-institute/trureturing/issues/22349) is Karp's rising-factorial Toeplitz Hurwitz-stability assertion. Other returns concern research methods and cryptography. |
| "Ferreira" "Simon" "conjecture" | Twenty-four returned issues. The concrete external conjecture proofs are [TT issue 22716](https://github.com/the-omega-institute/trureturing/issues/22716) (Gaussian Mills quotients, arXiv:2108.09244) and [TT issue 22376](https://github.com/the-omega-institute/trureturing/issues/22376) (reverse complex Mittag–Leffler modulus characterization, arXiv:2410.11852). Both are different assertions. |
| "2512.04940" | Four returned issues. The only external hit is [TT issue 22376](https://github.com/the-omega-institute/trureturing/issues/22376), whose bibliography explicitly reads Ferreira–Simon for real-parameter comparisons while its target concerns a complex modulus inequality. |
| "Mittag-Leffler" "stochastic order" | Five returned issues. The external mathematical hit is [TT issue 22716](https://github.com/the-omega-institute/trureturing/issues/22716), the distinct Mills-quotient problem; the other external return is a daily digest. |
| "Mittag-Leffler" "diagonal" "monotonicity" | Five returned issues. The external titles and body passages concern unrelated geometric/trace routes, Weyl companion states, and a review-interface issue. No exact diagonal E(alpha,alpha)(−1) claim was identified. |
| "1310.1888" | No returned issues. This is an indexing observation, not proof of absence. |
| "Simon" "stable" "infimum" "conjecture" | Seven returned issues. Outside the present repository, the returns were a review-interface issue, a game recommendation, and [TT issue 20336](https://github.com/the-omega-institute/trureturing/issues/20336). The latter's body and thirty returned comments were screened: its Simon references concern Barry Simon's quantum phase paper, while its infimum references concern quantum optimization. They do not address Thomas Simon's stable-infimum conjecture. |
| "Novelli" "Thibon" "conjecture" | The only plausible external hit, [TT issue 24901](https://github.com/the-omega-institute/trureturing/issues/24901), concerns a Jeffery/Chebyshev product and cites a 2014 counting paper. Its body and comment were read. The package SOURCES.md records this check at commit `761188263afabbcdb9003ea7b441784054a14f52`. |
| "Novelli" "monomial" | Five returned issues. The three external returns are Sage implementation requests for WQSym bases. They concern an earlier noncommutative algebra construction, not the 2025 multivariate Macdonald monomial-product conjecture. |

Broader queries sometimes reached the response cap or produced numeric issue-number noise. Those responses were not treated as exhaustive negatives. The narrower successful queries above are the usable evidence.

## López Pouso–Segura

Global issue searches used the author pair, the exact source identifier `2305.19128`, the DOI suffix `03283-w`, Gauss–Legendre with conjecture, and Segura with Bessel and conjecture. The author/identifier/DOI returns contained no external exact target. A broader Gauss–Legendre query returned 26 bodies, which were screened. The two external Segura/Bessel hits, [TT issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199) and [TT issue 23075](https://github.com/the-omega-institute/trureturing/issues/23075), concern modified-Bessel ratio unimodality and Ferrers inequalities. Their matching passages were read.

A separate independent audit directly enumerated five public proof collections and inspected the closest full Bessel manuscripts. Its exact scope, including finite tree/manifest counts and unread sources, is in [the committed audit](../2026-11-21-lopez-pouso-segura-independent-priority/AUDIT.md). Both the Bessel and quadrature packages link it.

## Parallel-group targets

- Fang–Zhang–Zhao: [independent audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md). This distinguishes the prior Sturm proof from the separately reviewed infinite-log-convexity disproof. The June Chern–Shi full text was recovered from the author's site and read; two other later full-text access gaps remain explicit.
- McCrea: [independent audit](../2026-11-21-mccrea-independent-review/PRIORITY.md). Seven narrow global issue queries and direct corpus manifests found no earlier density-crossover theorem. The earlier fixed-number theorem is credited; the primary November 5 source states the new uniqueness question separately.
- Vishnyakova: [independent mathematical/source review](../2026-11-21-vishnyakova-independent-review/AUDIT.md) and [package source audit](../../results/vishnyakova-root-radius/SOURCE_AUDIT.md). The earlier equal-parameter and bounded-degree results do not establish arbitrary independent-parameter root exclusion.
- Gröchenig: [independent audit](../2026-11-21-grochenig-independent-review/PRIORITY.md). The exact published source scope, all returned comments of repository issues 80 and 121, global issue histories, the 2,500-comment broad-search lead, the closest Gaussian/Gabor corpus manuscript and related primary papers were checked. No earlier full resolution of the upper-density comparison was found within the documented scope.

- Han–Sabag–Kostina–Hassibi: [independent audit](../2026-11-21-han-sabag-independent-review/PRIORITY.md). Both v1 and v2 state the same standalone matrix feasible set and sparse-optimality assertion. Global issue leads, the closest feedback-capacity and detectability papers, and public proof inventories yielded no matching earlier resolution. The conference PDF and secondary summary access limits remain explicit.

## Limits and disposition

Global GitHub code search repeatedly returned HTTP 429 with renewed retry delays. Those calls supply no negative evidence, and repeated retries were stopped. Successful earlier repository-specific searches, directly read corpus files and the global issue searches are separate evidence.

The package audits also name inaccessible related full texts. In particular the Morel differencing paper remains a concrete limit for the López Pouso–Segura priority check. No exhaustive bibliographic claim is made.

No earlier matching complete result was found for the retained packages within the documented audit. Three already-resolved result packages were removed from the active catalogue, and other independently derived prior consequences were never promoted. New-result accounting remains subject to correction if further prior work is located.

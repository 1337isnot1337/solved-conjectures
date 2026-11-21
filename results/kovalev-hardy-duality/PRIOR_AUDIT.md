# Kovalev's conjecture: independent source and priority audit

Audit date: 21 November 2026. This audit is independent of the counterexample construction. It found no earlier resolution of the exact conjecture in the sources and archives described below. That is a bounded search result, not a guarantee of exclusive priority.

## Exact primary statement

Leonid V. Kovalev, *Hardy-type norms of matrices*, arXiv:2607.17373v1, 19 July 2026, Conjecture 6.1, printed page 9:

<https://arxiv.org/abs/2607.17373>.

I read the actual local primary PDF and its text extraction, including definitions (1.1)–(1.2), the pairing and dual norm in Section 6, Conjecture 6.1, the rank-two constant (6.5), and the separate upper-bound discussion (6.6). Its PDF SHA-256 is `5c6423b5bfa42808a1729f4d6aa40123b821e56b6b6cb18a6e5f22e0ac8f592c`.

The scope is every real square matrix of every order $`n>2`$. The sphere measure is normalized to total mass one, the vector norm is Euclidean, and the matrix pairing is $`\mathop{\mathrm{tr}}(A^TB)/n`$. The conjecture is the conjunction

```math
c_n\|A\|_{H^4}\leq\|A\|_{H^1_*}\leq\|A\|_{H^4},
\qquad
c_n=\frac{2^{5/4}}{\sqrt\pi}
\frac{\Gamma((n+1)/2)}{\Gamma(n/2)}
\frac{(n+2)^{1/4}}{n^{3/4}}.
```

Thus a counterfamily to the lower inequality refutes the whole stated conjecture once. It does not settle the upper inequality, and it must not be counted as a separate result for each dimension. The proposed package accurately states that distinction.

The browser text fetcher could not open the arXiv abstract, but a direct public HTTP retrieval succeeded. I read the current primary submission history from that retrieved page: it lists only version 1, dated 19 July 2026. No journal reference appears. The record was saved locally as a reading checkpoint; the copyrighted paper is not included in the repository package.

## Primary antecedents checked

### Kovalev–Yang, 2020

Leonid V. Kovalev and Xuerui Yang, *Near-isometric duality of Hardy norms with applications to harmonic mappings*, Journal of Mathematical Analysis and Applications 487 (2020), 124040, arXiv:2001.09465v1.

Primary university-hosted PDF:

<https://math.illinois.edu/system/files/2020-09/X.%20Yang-2.pdf>.

Publisher: <https://doi.org/10.1016/j.jmaa.2020.124040>.

I read Section 5, printed pages 11–13. It uses the same spherical norm and normalized trace pairing. Theorem 5.1 characterizes derivative matrices of harmonic ball maps by the dual unit ball; it does not supply the later H-four comparison. The subsequent three-dimensional rank-one and rank-two calculations are examples, and the authors explicitly say the suggested general near-duality lacks a proof. This paper does not already settle or negate Conjecture 6.1.

### Brevig–Ortega-Cerdà–Seip, 2021

Ole Fredrik Brevig, Joaquim Ortega-Cerdà, and Kristian Seip, *A converse to the Schwarz lemma for planar harmonic maps*, Journal of Mathematical Analysis and Applications 497 (2021), 124908, arXiv:2011.10967.

Primary University of Barcelona repository PDF:

<https://diposit.ub.edu/server/api/core/bitstreams/351fccd2-f2ca-4b44-bbf8-98c3551b26c4/content>.

Publisher: <https://doi.org/10.1016/j.jmaa.2020.124908>.

I read Theorem 3 and its exact two-variable scope. It gives the sharp constant for the planar comparison, which the 2026 source itself cites. Its domain is the two-dimensional polynomial space corresponding to real two-by-two matrices. It does not establish the 2026 assertion for orders greater than two.

### Babiker–Hussein, 2024

Saif Eldeen Babiker and Shawgy Hussein, *A Focus on Near-Isometric Duality of Hardy Norms with Applications Corresponding to Harmonic Mappings*, Journal of Research in Applied Mathematics 10(12) (2024), 121–133, DOI <https://doi.org/10.35629/0743-1012121133>.

Primary PDF: <https://www.questjournals.org/jram/papers/v10-i12/1012121133.pdf>.

The browser extracted only the cover and page headers because the body is stored as images. I downloaded the actual PDF, rendered its pages, and visually read all of Section 5 on printed pages 130–133. Theorem 5.1, explicitly attributed to reference [14], repeats the derivative/dual-unit-ball characterization from Kovalev–Yang. The review then computes rank-one and rank-two projections in three dimensions. Printed page 132 explicitly leaves the suggested higher-dimensional near-duality without a proof. Its Corollary 5.2 concerns a triangle inequality for two-by-two matrices. This review contains no higher-dimensional H-four comparison theorem or counterexample that resolves Conjecture 6.1. The downloaded PDF SHA-256 is `c3479753cfeb625d0b3ba35be0cd547f0ceb5513656b2ec68d80ef9e2567a5a9`.

## Current literature searches

Both web search engines were used. The stronger engine also used recent-publication filters. Queries included the exact arXiv identifier and title, Conjecture 6.1 with the author name, Hardy norms with near-isometric duality, the rank-two projection constant, and combinations with proof, disproof, solution, and counterexample. Separate searches checked a possible second arXiv version and public resolution domains, including GitHub, Hexagon, Zenodo, ProbXiv, Trure, and Principia.

No matching later proof or counterexample was returned. The substantive matches were the original paper, the two primary antecedents above, and index or summary pages. The latter were used as discovery leads only, not as proof of unresolved status.

Xuerui Yang's current publication list was read at <https://sites.google.com/view/xuerui-yang>; it lists the 2020 collaboration and later unrelated work, without a new matrix-duality result. The public page <https://leonidkovalev.cv/> was also examined, but its visible publication list stops at 2025. It cannot certify the absence of a 2026 follow-up and is not relied on for that purpose.

## Direct public archive checks

- The current `1337isnot1337/solved-conjectures` HISTORY file had no matching result. Global GitHub issue searches using the exact identifier and the combination of Kovalev and Hardy found the current issue #209 and unrelated automated arXiv feeds. No older matching resolution issue was found.
- The current `mxym/math` README and the already retrieved CONTENTS, RESEARCH_HISTORY, and SOLVED_PROBLEMS indexes had no matching entry. Complete, nontruncated saved trees for notes (2,490 entries), preprints (721), and manuscripts (41) were checked both for author/identifier matches and for Hardy, near-duality, expected-value norms, ellipsoids, mean width, and Schwarz-related descriptions. No candidate resolving this comparison appeared. These subtree object SHAs are `034d4ec1e3a8ad46cb9bc44ad3e6d406581c33ba`, `3c0c4b4f17d4940da611f41400ecab9016b1826e`, and `11fa9d83e4410fdf557d8b6c339baf25b19853de`.
- The saved complete Principia archive tree has 2,095 entries and object SHA `47371706c400c79d06e3fb62190fcf6f7a725c85`. No matching path appeared under the same broader term screen.
- Nine saved nontruncated Trure subtrees were inspected: Evidence (14 entries), Problems (2,190), S0 (1,459), S1 (2,794), S3-Analytic (1,508), S3-Combinatorics (5,872), S3-HilbertOperators (38), S3-Zeros (341), and X_Frontier (2). Their Hardy-related paths concern Clark operators, analytic Hardy functions, or unrelated quantum terminology, with no matrix near-duality candidate. This is a path screen, not an assertion that every archive file was read.
- In `10m-u/open-problems-catalog`, the saved complete tree at `ca8d4d44ba3db527f19f28928c240168f545ecfe` contains 2,033 entries. The current `sources/K.md`, both functional-analysis problem parts, the linear-algebra/matrix problem file, and the saved analysis file were searched directly. Kovalev entries concern bounded power-series segments and absolute Lipschitz retracts, not this conjecture. No matrix Hardy-duality resolution appeared.

## Subsequent full-content archive audit

The campaign subsequently replaced the path-only screens above with searches of complete public archive contents. Kovalev's exact source identifier, author, and matrix Hardy-norm assertion were included in all three reports:

- [Principia full-text audit](../../research/2026-11-21-principia-fulltext-audit/PRINCIPIA_FULL_TEXT_AUDIT.md): all 1,728 file blobs were verified against the pinned Git tree, with all 274 PDFs extracted and embedded source text searched. The Kovalev matches concern the different bounded-power-series conjectures from arXiv:2507.04544. No matrix Hardy-norm resolution was found.
- [Trure, mxym, and AFTD audit](../../research/campaign-20261121/TRURE_MXYM_AFTD_AUDIT.md): complete text-content searches, PDF and compressed-source passes where present, public issue checks, and the full published AFTD knowledgebase. No matching matrix-norm assertion was found.
- [ArtificialZeng audit](../../research/2026-11-21-artificialzeng-priority/AUDIT.md): 14,105 complete UTF-8 files, all 472 PDF conversions, and bounded compressed-certificate headers at commit `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2`. No matching source, author, or matrix-norm statement was found. Two textless figure PDFs, capped certificate bodies, and other binary files are explicit coverage limits.

These are content searches followed by inspection of plausible claims, not manual reviews of every unrelated proof. The reports retain immutable snapshots, acquisition hashes, exact target lists, and reproducible search scripts. Two other campaign results were withdrawn after exact earlier resolutions were found in Principia; those findings are not ignored or counted as new results. No corresponding collision was found for this conjecture.

## Limits and conclusion

Searches cannot certify that no unpublished or unindexed proof exists. A SynthCore index result mentioning the source could not be opened because of a timeout; it was labeled as an unverified regularization idea, and no specific resolution claim was exposed. The sparse public CV page and secondary bibliographic indexes were not treated as comprehensive publication lists. No full citation-graph audit is claimed.

Within those limits, the exact source statement is verified, the closest primary predecessors do not resolve it, and the direct solution-archive screens found no prior collision. The prior-status gate passes on the evidence available. Mathematical validity is assessed separately in the other reviewers' reports.

# Sources and reading record

Checked on 21 November 2026.

## Original conjecture

Leonid V. Kovalev, *Hardy-type norms of matrices*, [arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373), 19 July 2026. Conjecture 6.1 is on printed page 9. Equations (1.1)–(1.2) define the normalized spherical norms; Section 6 defines the trace pairing and its dual norm. Equations (6.3) and (6.5) are the exact conjecture and constant used in this proof.

The full [primary PDF](https://arxiv.org/pdf/2607.17373) was downloaded through public HTTP access and read locally. Its SHA-256 is

```text
5c6423b5bfa42808a1729f4d6aa40123b821e56b6b6cb18a6e5f22e0ac8f592c
```

The current arXiv abstract page was also retrieved directly. Its submission history lists only version 1, dated 19 July 2026, with no journal reference. The general browser text fetcher returned an access error for that abstract, so the successful direct primary retrieval, rather than the failed request, supports this version check. The primary PDF and HTML are reading artifacts and are not included in the repository package.

The statement quantifies over every real square matrix of every order greater than two. Its lower constant is fixed by a rank-two projection. A counterexample to either bound refutes the stated conjunction; the proof here refutes the lower bound in an explicit infinite family. It makes no claim about the separate upper bound.

## Closest primary antecedents

Leonid V. Kovalev and Xuerui Yang, *Near-isometric duality of Hardy norms with applications to harmonic mappings*, Journal of Mathematical Analysis and Applications 487 (2020), 124040, [DOI 10.1016/j.jmaa.2020.124040](https://doi.org/10.1016/j.jmaa.2020.124040), [arXiv:2001.09465](https://arxiv.org/abs/2001.09465).

The [university-hosted primary PDF](https://math.illinois.edu/system/files/2020-09/X.%20Yang-2.pdf) was read, including Theorem 1.2 and Section 5, printed pages 11–13. Its general-dimensional dual-unit-ball construction is an antecedent of the supporting-functional calculation in our proof. That basic construction is not claimed as new. The source computes three-dimensional projection examples and leaves the suggested general norm comparison unproved. It does not give the present counterfamily.

Ole Fredrik Brevig, Joaquim Ortega-Cerdà, and Kristian Seip, *A converse to the Schwarz lemma for planar harmonic maps*, Journal of Mathematical Analysis and Applications 497 (2021), 124908, [DOI 10.1016/j.jmaa.2020.124908](https://doi.org/10.1016/j.jmaa.2020.124908), [arXiv:2011.10967v2](https://arxiv.org/abs/2011.10967).

The [primary PDF](https://arxiv.org/pdf/2011.10967) was read, including Theorem 3 and its two-variable scope. It proves the sharp planar constant cited by the 2026 source. It does not prove or refute the proposed comparison in all higher orders.

Saif Eldeen Babiker and Shawgy Hussein, *A Focus on Near-Isometric Duality of Hardy Norms with Applications Corresponding to Harmonic Mappings*, Journal of Research in Applied Mathematics 10(12) (2024), 121–133, [DOI 10.35629/0743-1012121133](https://doi.org/10.35629/0743-1012121133).

The independent prior reviewer read the actual rendered [primary PDF](https://www.questjournals.org/jram/papers/v10-i12/1012121133.pdf), Section 5 on printed pages 130–133. The root reviewer separately inspected printed page 132. The review repeats the Kovalev–Yang dual-unit-ball characterization and the three-dimensional projection examples; it expressly leaves the general near-duality unproved. Its next corollary concerns two-by-two matrices. It supplies no earlier higher-dimensional comparison or counterexample. The PDF SHA-256 is `c3479753cfeb625d0b3ba35be0cd547f0ceb5513656b2ec68d80ef9e2567a5a9`.

## Classical formulas used in the proof

These official NIST formulas were opened and checked directly:

- [DLMF 10.32.9](https://dlmf.nist.gov/10.32.E9): the positive-axis hyperbolic integral for the modified Bessel function of the second kind.
- [DLMF 10.25.2](https://dlmf.nist.gov/10.25.E2): the convergent modified-Bessel power series, specialized to order zero.
- [DLMF 10.31.2](https://dlmf.nist.gov/10.31.E2): the order-zero second-kind expansion with harmonic numbers and Euler's constant.
- [DLMF 10.29.3](https://dlmf.nist.gov/10.29.E3): the derivative of the order-zero second-kind function is the negative order-one function.

All arguments here are positive real numbers, so the quoted formulas require no analytic continuation or branch choice. The Gaussian substitutions and their factors are derived in the proof. The bounds for Euler's constant, logarithms, the exponential, and pi are supplied directly by elementary series and integral comparisons. No tabulated numerical value of an expectation or special function is a premise.

## Current status audit

The independent [priority audit](PRIOR_AUDIT.md) records its exact scope, the older primary results, two-engine literature searches, global and repository issue searches, and direct archive checks. It passed without a located prior resolution. In addition, the analysis worker made the following checks:

- Global GitHub code search for the exact paper title returned two automated RSS files. The exact arXiv identifier returned those feeds and unrelated numerical or feed-data files, with no proof record among the seven results. Search indexing can lag and is not exhaustive evidence about newly posted work.
- The current repository's HISTORY file contained no matching Hardy-norm or Kovalev entry; issue searches found only this campaign's coordination and target reservation, plus an unrelated automated feed outside the repository.
- Fresh direct reads of `mxym/math` README.en, CONTENTS, SOLVED_PROBLEMS, RESEARCH, and RESEARCH_HISTORY found no matching title, identifier, or author/norm combination. Its nontruncated notes, preprints, and manuscripts trees were separately checked. The saved complete `xzwwwwww/math` tree has 28 entries and no matching target.
- The fetched Principia and nine Trure subtree inventories were screened for author, identifier, Hardy-duality, and matrix-norm paths. Those inventories are path screens, not a claim that every archived document was read.

A broader GitHub code query was noisy, and a later repository-specific code query received a shared rate-limit response. That failed query supplies no evidence. Subsequent full-content Principia, Trure, mxym, AFTD, and ArtificialZeng checks supersede the initial archive path screens; their coverage, findings, and limits are linked in [PRIOR_AUDIT.md](PRIOR_AUDIT.md). No complete citation-graph enumeration or guarantee against unpublished or unindexed prior work is claimed.

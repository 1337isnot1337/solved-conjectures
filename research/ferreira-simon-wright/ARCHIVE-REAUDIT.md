# Expanded public-archive audit: Ferreira–Simon Wright conjecture

Audit date: **20 November 2026 UTC**.

## Finding and scope

No exact prior resolution of the Wright-density conjecture was identified in this additional bounded search. The result's status is unchanged. This is not a guarantee of worldwide priority.

This review followed the discovery that ordinary web searches had missed exact earlier proofs of other targets in public GitHub archives. Those discoveries required corrections to their records. Their presence does not, by itself, establish a prior resolution of the Wright conjecture.

The target here is Ferreira–Simon, [arXiv:2212.07974v2](https://arxiv.org/pdf/2212.07974), Section 6.4: the proposed equivalence between the parameter threshold, log concavity of $\phi(-\alpha,\beta,-x)$, and convexity of the reciprocal Mittag–Leffler function. The source DOI is [10.1007/s00365-023-09666-w](https://doi.org/10.1007/s00365-023-09666-w).

## Search coverage

The following public repositories were searched by source identifier, title terms, author name, and selected formula fragments:

- [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions), pinned revision `47371706c400c79d06e3fb62190fcf6f7a725c85`.
- [KnowledgeSense/math](https://github.com/KnowledgeSense/math), pinned revision `b95a52a54597e8b01c1a28486f2a9b29a3a54c58`.
- [pudim-project/pudim-ai-demo-zetalaw](https://github.com/pudim-project/pudim-ai-demo-zetalaw).
- [the-omega-institute/trureturing-mdbook](https://github.com/the-omega-institute/trureturing-mdbook).

Queries included `2212.07974`, `s00365-023-09666-w`, `Ferreira`, `Wright`, `Wright function`, `Wright density`, `log-concavity Wright`, `1-3t`, and `alpha_*`. Exact arXiv and DOI queries were also run globally, without a repository restriction. Their mathematical matches were this repository's own records; numerical substring collisions were irrelevant.

The broad global author-name query was noisy and capped, so it is not treated as exhaustive. GitHub's index coverage and result limits also prevent any of these negative searches from proving absence.

To reduce reliance on the search index, the complete [Principia site-backup manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/MANIFEST.json), with 493 file records, was inspected by title and source path. Relevant title matches were followed to their source statements. The [KnowledgeSense manuscript catalogue](https://github.com/KnowledgeSense/math/blob/b95a52a54597e8b01c1a28486f2a9b29a3a54c58/README.md) and the full [Pudim applications record](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) were also inspected for the exact target. The Pudim file had blob `4f5f4a47f4ad858198fc790f78bfebf073636e9e` when read.

## Relevant matches and their actual statements

| Archive record | Inspected statement | Relationship to this target |
| --- | --- | --- |
| Principia MathDB 351688 | Ferreira–Simon's Conjecture 3 from arXiv:2108.09244, on complete monotonicity of quotients of Mills-ratio derivatives | Different source paper and different functions; its complete TeX argument was read |
| Principia MathDB 324472 | Kalmykov–Karp coefficientwise log concavity for series with rising-factorial ratios | “Wright” describes a parameter inequality, not the Wright function |
| Principia MathDB 324473 | Kalmykov–Karp coefficientwise log concavity for gamma-ratio generating series | Different coefficients and variable; the main statement was read |
| Principia MathDB 331384 | Karp coefficientwise log concavity of a normalized incomplete beta function | Different special function and parameter inequality; the main statement was read |
| Pudim APP-0058 | A Bazhlekova–Bazhlekov two-seed fractional diffusion-wave gap condition | Different source arXiv:1707.09828 and Bernstein-symbol question |
| Pudim APP-0077 | Ferreira–Simon Tricomi quotient complete-monotonicity window | Different source arXiv:2108.09244; no Wright-density threshold assertion |
| Other “Wright” code matches | Circle-method terminology, ordinary citations, or browser key names | No relevant conjecture statement |

Direct source links for the Principia comparisons:

- [MathDB 351688](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-351688/mathdb-351688-solution.tex).
- [MathDB 324472](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-324472/mathdb-324472-solution.tex).
- [MathDB 324473](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-324473/mathdb-324473-solution.tex).
- [MathDB 331384](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-331384/mathdb-331384-solution.tex).

No Lean verification was performed or used as evidence for any conclusion.

## Additional web checks and remaining limits

Both available search engines were used for exact source/title terms and counterexample/disproof combinations. The source paper, current author publication records, and the already distinguished Mills/Tricomi results were returned. No new exact resolution was identified.

The earlier scope checks and access limits remain in [NOVELTY.md](NOVELTY.md). In particular, the separately typeset full journal body was not available through the public preview, and the Srivastava–Tomovski follow-up was not audited in full. Nothing in this additional archive check removes those limitations.

This document records a strengthened search, not a change to the mathematical proof and not an assertion that every public repository or manuscript has been inspected.

## Co-PEER extension of the audit

The additional archive [qqliu/CoPEER](https://github.com/qqliu/CoPEER), at pinned revision `105523fdaf018b62eaf2883347724dfe79935611`, was searched for `2212.07974`, `Wright`, and `Ferreira`. The source identifier and author name returned no hits; the Wright hits were browser-key or TeX-arrow substrings. Its README and record organization were also inspected. A global exact-title query for `log-concavity of the Wright` returned only this repository's records. These additional checks found no exact prior resolution and do not change the bounded nature of the search.

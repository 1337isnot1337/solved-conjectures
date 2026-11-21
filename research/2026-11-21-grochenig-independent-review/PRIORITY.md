# Gröchenig's problem: independent source and priority review

Review date: November 21, 2026. Reviewed package: [results/grochenig-zero-density](../../results/grochenig-zero-density/), initially published in commit [d707c6a032f7210ac8d5e957bfc77c5b00fcaa3f](https://github.com/1337isnot1337/solved-conjectures/commit/d707c6a032f7210ac8d5e957bfc77c5b00fcaa3f). Research issue: [191](https://github.com/1337isnot1337/solved-conjectures/issues/191).

**Conclusion:** the construction matches the published upper-density question. This independent review found no earlier resolution of that question within the sources and searches described below. This is a bounded priority assessment, not a certificate of universal novelty. The lower-density question remains outside the claimed result. Mathematical review is recorded separately.

## Original scope

The published [primary article](https://link.springer.com/article/10.1007/s44146-026-00264-3), *Infinite totally positive matrices: some open problems*, was read at Definition 2.5, the definition of $`V^\infty(g)`$, and the complete Section 4.3 including Problem 4.12.

Problem 4.12 explicitly asks whether both comparisons

```math
D^\pm(Z(f))\le D^\pm(c)
```

hold for every bounded real coefficient sequence in the indicated Pólya frequency shift space. The Gaussian is expressly admitted. The definition of $`M(c)`$ skips zero coefficients and counts the left endpoint of a change between consecutive nonzero coefficients. The upper density takes the maximum over translated integer intervals before the limit superior.

No positive lower bound on nonzero coefficient magnitudes is imposed in this problem. Uniform alternation occurs in a separate invertibility theorem and in one motivating example; it is not a global coefficient hypothesis. Consequently, the package's absolutely summable coefficients are admissible. Failure of the upper comparison answers that proposed universal comparison negatively; it does not prove failure of the separate lower comparison.

## Independent repository-history checks

All 104 current comments of [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80) and all three comments of [issue 121](https://github.com/1337isnot1337/solved-conjectures/issues/121) were fetched in full, searched for the author, problem, Gaussian, Beurling, and sign-change terms, and the matching passages read.

The Gröchenig citation in [80/comment7050737643](https://github.com/1337isnot1337/solved-conjectures/issues/80#issuecomment-7050737643) concerns the Schoenberg/zeta survey in a Gaiotto-positivity screen. [121/comment7049717108](https://github.com/1337isnot1337/solved-conjectures/issues/121#issuecomment-7049717108) concerns the literature review for Nuttall's cumulant sign-regularity conjecture. Neither contains the present comparison or a counterexample to it.

The complete body and both publication comments of issue 191 were also read. Their upper-only scope matches the package.

## Fresh global issue searches

The following successful GitHub issue searches were run independently. Counts refer to this review, not a permanent index.

| Query | Results and disposition |
|---|---|
| Exact DOI $`10.1007/s44146-026-00264-3`$ | One result: this repository's issue 191. |
| Gröchenig plus sign changes | One result: issue 191. |
| Gröchenig or Grochenig plus density | Seven results for each spelling. Relevant repository entries are 191, 156, and 80. External hits concern Fourier-transform approximation, STFT energy, or matrix-algebra citations in a Yang–Mills project. |
| 4.12 plus totally positive | Three results: issue 191, an unrelated dependency false positive, and a large Tau Ceti review thread. |
| Either author spelling restricted to the-omega-institute/trureturing | Zero results. |
| Beurling plus Gaussian plus zeros | Fifteen results; inspected bodies concern this issue or unrelated number theory, coding, or research coordination. |
| Upper density plus shift-invariant | Six results, with no matching resolution identified. |

The Tau Ceti bulk thread was a concrete lead, so it was not dismissed from its title. All **2,500 current comments**, retrieved through 25 complete pages, were searched. There were no occurrences of either author spelling, the DOI stem, shift-invariant, or variation-diminishing. Its seventeen occurrences of “totally positive” concern generators in algebraic number fields. Its single Beurling occurrence concerns the Beurling transform in elliptic regularity. This closes the apparent match.

Broad Gaussian/zero-density searches were noisy: one returned 476 hits and only the first 100 were screened. They are not presented as exhaustive negative searches. A sign-change-density query returned 72 mostly unrelated hits; no exact target was identified.

## Public corpus checks

The previously retrieved complete Principia archive manifest and the KnowledgeSense preprint directory list were independently screened for the author, total positivity, Pólya frequency, Beurling, sampling, Gaussian, and Gabor terms.

The closest Principia title was *Logarithmic biorthogonal norms for the Gaussian Gabor system*, MathDB375037. Its [complete pinned manuscript](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-375037/mathdb-375037-solution.tex), dated September 12, 2026, was read. It proves Zikkos's logarithmic growth estimate for biorthogonal Gabor vectors and a weighted lower-frame consequence. It contains no zero/sign-change density comparison.

Other manifest title hits concerned Gaussian polynomial inequalities, Gaussian hypergeometric inequalities, or Pólya–Szegö inequalities. The KnowledgeSense Gaussian hit concerned Wishart principal minors. No relevant target was identified in those descriptors. This is a manifest-level check except where a full manuscript is expressly identified above.

No global code-search success is claimed; that service remained subject to a shared rate-limit restriction.

## Primary literature cross-check

The package's existing [SOURCES.md](../../results/grochenig-zero-density/SOURCES.md) contains the broader initial literature audit. This independent pass additionally inspected:

- The original article's complete scope and motivation, described above.
- Romero's [2021 sign-retrieval article](https://link.springer.com/article/10.1007/s00041-020-09804-z), especially equations (5)–(7) and Theorem 2. Its upper *average circular density* is centered and averaged, and is not the upper Beurling density under review.
- Baranov–Belov–Gröchenig's [arXiv:2112.01248](https://arxiv.org/pdf/2112.01248), main Theorems 1.1–1.3 and its Gaussian-to-Fock transformation. The upper-density restriction there is a condition on interpolation sets, not a statement about every individual zero set or coefficient sign changes.
- The [August 2026 Gabor-frame paper](https://arxiv.org/pdf/2608.04992), its main theorem and proof outline, and full-text searches for the problem number and sign changes. Its resolution concerns frame sets and invertibility.
- Krishtal–Wu's [November 15, 2026 manuscript](https://borowiecki.dev/pdf/2611.20122), its abstract, introductory theorem descriptions, and full-text searches for the problem number and sign changes. Its interpolation result chooses nodes near separated centers; it does not compare zero and coefficient sign-change densities.
- The [author's current publication list](https://homepage.univie.ac.at/karlheinz.groechenig/preprints/preprints_down.html), including the original question and subsequent frame-set article.

Both web engines were used for the exact title and problem number, variations of upper zero density and sign-change density, and Gaussian shift-space counterexamples, superoscillation, and unbounded zero counts. A superficially relevant public comment mentioning an earlier Gaussian proof was followed to its surrounding derivation; it concerned a zeta-filter argument and was unrelated.

No exact earlier resolution was located in these successful searches or inspected sources. None of this excludes unpublished work or an unindexed consequence of a different theorem. The source match passes; the documented priority search has no identified blocking precedent.

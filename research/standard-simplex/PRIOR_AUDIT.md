# Standard Simplex conjecture: initial source and priority screen

Date: 21 November 2026. Status: no full resolution claimed by this project. This is an initial target screen, not a completed worldwide novelty audit for a proposed proof.

## 1. Exact-source checks

The original [arXiv:0903.3362v3](https://arxiv.org/pdf/0903.3362v3), Definition 1.3 and Conjecture 1.4, was read directly. Its positive-correlation statement fixes all masses to $`1/q`$; its negative-correlation statement does not fix masses. The source attributes the conjecture to Mossel around 2004. The published DOI is [10.1007/s11856-011-0181-7](https://doi.org/10.1007/s11856-011-0181-7).

The following downloaded primary files were read. The PDFs are not committed to this repository; the hashes identify the source bytes used.

| Primary URL | Local reading identifier | SHA-256 |
|---|---|---|
| [0903.3362v3](https://arxiv.org/pdf/0903.3362v3) | Original statement, 456,179 bytes | `0139d6227302dea3696bfd9af1d09ec6f17bf2d377cbc3e2807e5ccd96eb315e` |
| [Heilman's hyperstability manuscript](https://www.stevenheilman.org/~heilman/papers/hyper.pdf) | Variational formulas and conditional results, 526,799 bytes | `5172a14e41bdad1d370b1e1073427a64b09920cfebaacc68bc2d7ba87f9a21c1` |
| [Heilman's earlier three-cell manuscript](https://www.stevenheilman.org/~heilman/papers/corthreev3.pdf) | Earlier small-correlation ranges, 656,606 bytes | `984d6bf038f1281a4b427c7d7bdce7aa98e9044fed196b9628ece21780215ac3` |
| [2608.00333v1](https://arxiv.org/pdf/2608.00333v1) | 2026 three-cell ranges and Section 1.4, 572,830 bytes | `225a538b41d36176f70f166df6f412e6459826f08048393ba317cc6d8c1ee25b` |

The primary publisher HTML for [Heilman–Tarter 2021](https://doi.org/10.1017/fms.2021.56) was also read for dimension reduction. The current author [research page](https://www.stevenheilman.org/research.html) and [homepage](https://www.stevenheilman.org/) were checked. The author's 2026 hardness result concerns three-cell ranges, not all cells and all correlations. An attempted direct arXiv HTML retrieval for 2608.00333v1 failed; local retrieval of the full versioned PDF succeeded and was used instead.

The current published [Stable Gaussian minimal bubbles](https://doi.org/10.1007/s00526-026-03408-z) remains relevant background, but its perimeter and first-moment assertions must not be equated with the full finite-correlation objective. The [2026 propeller paper](https://arxiv.org/abs/2610.32158) is likewise a first-moment result. The unequal-mass counterexamples in [1403.0885v3](https://arxiv.org/pdf/1403.0885v3) were distinguished from the exact original target.

## 2. Search coverage and issue coordination

Both available web search engines were used for the exact conjecture name, original identifier, Plurality is Stablest, Gaussian partitions and noise stability, hyperstability, and recent 2025–2026 proof/counterexample language. Primary source statements were used for mathematical scope; search snippets and catalogue status were treated only as leads.

Global GitHub issue searches for the exact name, `0903.3362`, and `Plurality is Stablest` were checked before opening the target issue. The existing match [the-omega-institute/trureturing issue 9471](https://github.com/the-omega-institute/trureturing/issues/9471) concerns Fan's Riesz-capacity question, not the Standard Simplex optimization, and had no comments. The other existing exact-name/identifier match was this project's own coordination issue. No overlapping active target assignment was found in the checked issue search. The target is reserved as [issue 212](https://github.com/1337isnot1337/solved-conjectures/issues/212).

These finite searches cannot establish continued openness with certainty. Differently worded results, unindexed manuscripts, new commits after the pins below, and content not searched remain possible gaps.

## 3. Fresh native-text archive scan

The scanner reads every regular archive body that decodes as UTF-8, normalizes Unicode with NFKC and then casefolds, and searches both paths and contents. It does not execute archived code. The exact expression and matching paths are retained in [PRIOR_SCAN.json](PRIOR_SCAN.json).

| Repository and pinned commit | UTF-8 bodies read | Matching bodies | Scope finding |
|---|---:|---:|---|
| [the-omega-institute/trureturing](https://github.com/the-omega-institute/trureturing/tree/de22a48707da1c7a48d032909e821bd481947b45) | 75,410 | 0 | No direct term or identifier match |
| [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions/tree/47371706c400c79d06e3fb62190fcf6f7a725c85) | 1,453 | 0 | No direct term or identifier match |
| [MColbrook/AIM](https://github.com/MColbrook/AIM/tree/b2ec0fac559f532fc0ed04fce81deea0ce07c68b) | 4,624 | 14 | Two open-target entries and their status/search records |
| [mxym/math](https://github.com/mxym/math/tree/4a51ff772a566451627b9ff41f6248518561d9d4) | 23,631 | 15 | First-moment, unequal-mass and planar-fan work; no full noise-stability assertion found |
| [ArtificialZeng/AI-Has-Taste](https://github.com/ArtificialZeng/AI-Has-Taste/tree/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2) | 14,105 | 0 | No direct term or identifier match |
| [openai/math](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae) | 173,622 | 4 | Standard Hermite identities, a propeller bibliography, and invariance-principle citations |

### Matching claim comparisons

**AIM.** `problems/294-gaussian-simplex.md` asks the balanced positive-correlation question for four or more cells. `problems/637-the-standard-simplex-inequality-for-negative-gaussian-correlations.md` asks the original free-mass negative-correlation question for all cells. Both were read; neither provides a resolution. The remaining matches are drafts, manifests, source maps, search transcripts and status-audit records. They point to the primary sources already compared above.

**mxym.** The planar-fan paper optimizes first Gaussian moments among consecutive planar sectors with angle lower bounds. Its introduction explicitly restricts the class; it does not optimize arbitrary partitions. The centroid mass-envelope paper gives an approximation for the first-moment objective, and the dimension-rate paper gives logarithmic-dimensional approximation and rate–distortion bounds for that objective. Its ending explicitly distinguishes finite-correlation noise stability. The nonuniform-simplex and fixed-mass-propeller notes refute prescribed unequal-mass first-moment assertions; their scope notes expressly exclude the equal-mass Standard Simplex claim.

A citation in the matched nonuniform note led to a source without the main search terms: `research/gaussian-balanced-simplex-all-k/paper.md`. Its entire written argument and README were read at the same pinned commit. It claims the sharp equal-mass first-moment inequality for all cell counts, derived using Milman–Neeman's perimeter theorem. Its own statement explicitly excludes positive-correlation noise stability. This additional semantic follow-up is recorded because filename and keyword coverage alone would have missed the relevant neighbouring theorem.

**OpenAI.** `Constant-factor-hardness-of-Min-UnCut/.../sections/preliminaries.tex` recalls orthonormal Hermite expansions, the Gaussian Poincaré inequality and the noise-operator eigenvalues; it has no multi-cell optimization theorem. `The-Gaussian-Propeller-Bound-in-Every-Dimension/.../references.tex` cites the hyperstability paper as background. `The-Unique-Games-Theorem/.../appendices/finite-consequences.tex` uses Isaksson–Mossel for influences and an invariance principle; the associated bibliography is the fourth hit. The actual matching passages were read, including their Gaussian hypotheses. They do not classify arbitrary equal-volume Gaussian partitions or prove the negative-correlation minimum.

### Explicit coverage limits

This fresh Standard Simplex scan covers **native UTF-8 bodies only**. Earlier campaigns converted large PDF and compressed-source collections from these archives, but those entire supplements have not yet been rescanned for this new target. The native scan reports 3, 275, 163, 487, 612 and 902 skipped entries, respectively; the JSON retains their reason counts. Most are PDFs or binary/compressed evidence. No statement that those entries are irrelevant follows merely from their being skipped.

No candidate proof is being promoted, so the present checkpoint does not assert a completed priority gate. A proposed full theorem would require finishing the supplement screen, following any new semantic leads, and refreshing current literature and issue history.

## 4. Mathematical checkpoint

[TENSORIZATION_BARRIER.md](TENSORIZATION_BARRIER.md) proves the auxiliary Hermite-degree identity under stated regularity and admissibility assumptions. The algebra lane independently checked the tensorization, positivity and endpoint arguments. The note records a limitation of the attempted method; it makes no first-discovery claim and does not alter the collection's resolution count.

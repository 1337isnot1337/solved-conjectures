# Source and prior-art audit

Audit date: 21 November 2026. Research issue: [191](https://github.com/1337isnot1337/solved-conjectures/issues/191).

## Exact target

Karlheinz Gröchenig, *Infinite totally positive matrices: some open problems*, Acta Scientiarum Mathematicarum, published 17 August 2026, [DOI 10.1007/s44146-026-00264-3](https://link.springer.com/article/10.1007/s44146-026-00264-3).

The full published HTML was inspected, particularly Definition 2.5, the definition of $`V^\infty(g)`$, and Section 4.3, equation (8) and Problem 4.12. The source's heading is “Problem 4.12,” so the entry is named **Gröchenig’s problem**, without presenting it as an established conjecture name.

| Source element | Exact scope used here |
|---|---|
| Generator | Any integrable totally positive function; the Gaussian is expressly included after Definition 2.5. |
| Coefficients | A bounded real sequence indexed by the integers. No uniform positive lower bound on nonzero magnitudes is imposed. |
| Sign changes | Opposite consecutive nonzero coefficients, with intervening zeros skipped. The left index belongs to $`M(c)`$. |
| Density | Translation-invariant upper and lower Beurling density; coefficient windows have integer starting points and integer lengths. |
| Zeros | The real zero set $`Z(f)`$. The counterexample has distinct sign-changing real zeros and is a nonzero entire function. |
| Published question | Both signs in $`D^\pm(Z(f))\le D^\pm(c)`$, universally over the indicated functions. |
| Resolution supplied | The upper inequality fails. Thus the combined universal assertion is false. No resolution of the separate lower inequality is asserted. |

## Directly inspected related primary sources

1. **Gröchenig, Romero, and Stöckler**, *Sampling theorems for shift-invariant spaces, Gabor frames, and totally positive functions*, Inventiones mathematicae **211** (2018), 1119–1148. [Published full text](https://link.springer.com/article/10.1007/s00222-017-0760-2). Theorem 1.6 bounds the **lower** zero density of a nonzero bounded-coefficient sum by 1. The sampling and interpolation results concern uniqueness and stable recovery, not the proposed upper comparison with coefficient sign changes. These statements do not refute or prove the exact assertion considered here.

2. **Gröchenig, Romero, and Stöckler**, *Sharp Results on Sampling with Derivatives in Shift-Invariant Spaces and Multi-Window Gabor Frames*, Constructive Approximation **51** (2020), 1–25. [Published full text](https://link.springer.com/article/10.1007/s00365-019-09456-3). Section 4 was inspected. Lemma 4.1 gives entire extension and Gaussian growth; Theorem 4.3 gives $`D^-(N_f,m_f)\le1`$. This is an upper bound on a lower density, not a bound on the upper Beurling density. The present convergence argument is given independently in full.

3. **José Luis Romero**, *Sign Retrieval in Shift-Invariant Spaces with Totally Positive Generator*, Journal of Fourier Analysis and Applications **27** (2021), article 27. [Published full text](https://link.springer.com/article/10.1007/s00041-020-09804-z). Theorem 2 concerns the upper **average circular density**, defined in equation (5) using disks centered at the origin and an averaged zero count. It is a different quantity from the translation-uniform upper Beurling density in Problem 4.12. The source does not compare zero density with coefficient sign-change density.

4. **Anton Baranov, Yurii Belov, and Karlheinz Gröchenig**, *Complete interpolating sequences for the Gaussian shift-invariant space*, Applied and Computational Harmonic Analysis **61** (2022), 191–201. [Author preprint, arXiv:2112.01248](https://arxiv.org/pdf/2112.01248). Theorems 1.1–1.3 and the generating-function argument were inspected. The upper-density condition is a condition on interpolation sets, not on the zero set of an individual function. No coefficient-sign-change density assertion was located.

5. **Jaume de Dios Pont, Karlheinz Gröchenig, Lukas Liehr, Irina Shafkulovska, and Mitchell A. Taylor**, *Gabor Frames of Totally Positive Functions: A Complete Characterization*, [arXiv:2608.04992](https://arxiv.org/pdf/2608.04992), August 2026. Theorem 1.1 proves the frame-set conjecture; the paper also proves the sharp Kadets-type perturbation theorem. These are the later results relevant to the neighboring questions in the original article. Searches of its full text for Problem 4.12, zero sets, and sign changes revealed no resolution of the density comparison. Its operator-invertibility conclusions do not supply that comparison.

6. **Ilya A. Krishtal and Jian Wu**, *Totally Positive Interpolation and Critical Sampling of Positive Operator Orbits*, [arXiv:2611.20122v1](https://arxiv.org/abs/2611.20122), submitted 15 November 2026. [Full primary manuscript](https://borowiecki.dev/pdf/2611.20122). Theorem 3.1 constructs selected interpolation nodes near separated generating centers. Its consequences concern operator-orbit sampling counts and interpolation. The full-text searches and inspected statements contain no resolution of Problem 4.12 or comparison with coefficient sign-change density. This very recent paper was checked because it cites the relevant total-positivity literature.

7. **José Luis Romero**, *Density theorems for sampling*, Internationale Mathematische Nachrichten **243** (April 2020), 21–42. [Primary society PDF](https://www.oemg.ac.at/db/IMN/243). Printed pages 28–29 discuss the finite variation-diminishing theorem and explicitly suggest replacing total sign-change counts with an appropriate density. This is motivation and an open direction, not a proof of the proposed upper Beurling comparison.

The [author's publication list](https://homepage.univie.ac.at/karlheinz.groechenig/preprints/preprints_down.html) was also checked. It links the 2026 problem paper and the later frame-set paper, as well as the older primary sources above.

## Search scope

Both available web search engines were used, with fresh searches through the audit date. Search strings included:

- `"Gröchenig" "Problem 4.12"`, `"Gröchenig" "4.12" "density"`, and the exact DOI.
- `"Infinite totally positive matrices" counterexample` and the title with proof or resolution.
- `"sign changes" "upper density" Gaussian` and `"totally positive" "density" "sign changes" counterexample`.
- `"Gaussian" "shift-invariant" "zero" "upper density"`.
- Gaussian shift spaces with superoscillations, unbounded zero density, and arbitrarily long dense zero blocks.

Searches returned the original question, the sampling and sign-retrieval sources above, and unrelated Gaussian-process or spectral-gap results. No earlier proof or counterexample settling this exact comparison was located. Standard finite variation-diminishing results count all sign changes without a spatial normalization; they do not determine how an increasingly long coefficient block can concentrate its zeros in a shorter interval.

## GitHub and repository-history audit

The local repository history and research files were searched for the author name, DOI, Problem 4.12, variation-diminishing density, and sign-change density. No prior entry resolving this statement was found.

Global issue searches included the exact DOI, both spellings of Gröchenig/Grochenig with density or zeros, `"4.12" "totally positive"`, and Beurling/Gaussian/zeros. Broad generic queries were noisy and are not treated as exhaustive. The author-name searches identified older repository issues [80](https://github.com/1337isnot1337/solved-conjectures/issues/80) and [121](https://github.com/1337isnot1337/solved-conjectures/issues/121), which were checked directly:

- All **104 comments** of issue 80 were read or searched in the full returned bodies. The relevant author-name hit is [comment 7050737643](https://github.com/1337isnot1337/solved-conjectures/issues/80#issuecomment-7050737643), which cites Gröchenig's Schoenberg/zeta survey in an unrelated Gaiotto-positivity screen.
- All **3 comments** of issue 121 were checked. [Comment 7049717108](https://github.com/1337isnot1337/solved-conjectures/issues/121#issuecomment-7049717108) lists Gröchenig papers in the prior-art audit of Nuttall's repeated-tail sign-regularity problem; it does not resolve the present density question.
- A global author-name search restricted to `the-omega-institute/trureturing` returned no relevant issue.

The available complete, nontruncated public archive trees were screened by author name, Pólya frequency, total positivity, Gabor, Beurling, sampling, and Gaussian/zero-density terms. This included the PrincipiaMathOrg solution archive and the trureturing Problems, Analytic, Zeros, S0, S1, HilbertOperators, Combinatorics, Evidence, and frontier trees made available during this campaign. No direct match was found. Three superficially relevant trureturing blobs were read:

- `GaussianSpectrum.md`, blob `8b4dde6202db8ec6738b72d2437e1ae4bb2dc934`: Gaussian-weighted sums of spectral ordinates.
- `GaussianWindowLower.md`, blob `1e101606969091be8008e8a6b963e19f5143883a`: lower bounds for Gaussian spectral-window mass.
- `ZeroDensityCrossover.md`, blob `805bfcd74df297ae46c287dc8c96c3844eb9f392`: the algebraic comparison of Ingham, Huxley, and Guth–Maynard exponents.

All three are unrelated to zeros of Gaussian shift sums.

## Audit conclusion and limits

The exact published assertion and the construction's hypotheses match. The inspected primary literature and public archive searches did not locate a prior resolution of the upper comparison. This is a documented bounded prior-art search, not a certificate that no unpublished or unindexed argument exists. The mathematical proof is separate from the priority assessment.

The construction has received an independent written audit in [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md). The exact script `verify.py` reports 784 checks of the finite block identities, sign conventions, coefficient normalization, geometric tail budget, and interval-count convention. The proof of the infinite counterexample remains the analytic argument in [PROOF.md](PROOF.md).

## Additional cross-review

The current four-worker group independently reconstructed the infinite construction and checked the original definitions in its [mathematical review](../../research/2026-11-21-grochenig-independent-review/AUDIT.md). A separate [priority review](../../research/2026-11-21-grochenig-independent-review/PRIORITY.md) read the full concrete issue-history leads, the closest Gaussian/Gabor manuscript and related primary sources. Both reviews passed within their documented scope and access limits. The upper comparison is refuted; the separate lower-density comparison remains open.

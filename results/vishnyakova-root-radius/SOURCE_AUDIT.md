# Source and priority audit

21 November 2026. The mathematical proof is in PROOF.md. The independent analysis review is in ANALYSIS_REVIEW.md; root separately reviewed the argument and source mapping. This audit records the exact source scope, earlier partial results, nearby theorems inspected, and search limits. No exhaustive priority claim is made.

## Exact source statements

Anna Vishnyakova, *Polynomials interpolated totally positive sequences*, arXiv:2607.06207v1, 7 July 2026:

- [Full primary paper](https://borowiecki.dev/pdf/2607.06207).
- [Author upload](https://www.researchgate.net/publication/408572255_Polynomials_interpolated_totally_positive_sequences).
- Open Problem 6.2, printed page 24, asks whether the supremum of the largest modulus of a complex root is exactly `n` in degree `n` for real polynomials whose values at nonnegative integers form a totally positive sequence.
- Section 1 supplies the transformed-polynomial equivalence: the linear map sending `binom(z,k)` to `w^k` sends the class, after a nonzero scalar normalization, to polynomials all of whose roots lie in `[-1,0]`.

The author's later paper, *Polynomially Deformed Normalized Pochhammer Sequences Having Generating Functions With Only Real Non-positive Zeros*, arXiv:2608.03723v1, 4 August 2026:

- [Author-uploaded full text](https://www.researchgate.net/publication/411305396_Polynomially_Deformed_Normalized_Pochhammer_Sequences_Having_Generating_Functions_With_Only_Real_Non-positive_Zeros).
- Definition 1.4, equation (8), defines `L_beta(z^underline(k)/(beta)_k)=w^k` for `beta>0`.
- Open Problem 7.1 defines `U_n` as the real degree-`n` polynomials for which `L_beta(P)` has every root in `[-1,0]`.
- Open Problem 7.2, printed page 27, asks whether the outer radius is `beta+n-1` in every degree.
- Equation (12) states the reflection of the inverse transform used in Section 5 of the proof.

The new proof covers every positive real weight and every positive integer degree, with arbitrary multiplicities and endpoint parameters. It adds no real-rootedness hypothesis on the original polynomial. The original and weighted statements are one conjecture family and one resolution. The original sampled-total-positivity interpretation is used at `beta=1`; no unsupported interpretation of the noninteger weighted generating function as a totally positive sequence is needed.

Both full sources were read, including the defining transforms and numbered open problems. The first was available through a public arXiv mirror. The second was read through the author's ResearchGate upload because the attempted arXiv rendering was unavailable.

## Earlier public partial results

The [10m-u catalog entry Q1442](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/problems/mathematics/analysis.md#q1442), at immutable snapshot `ca8d4d44ba3db527f19f28928c240168f545ecfe`, still lists the root-radius problem as open with partial results.

The [7 October 2026 interpolation report](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-continuation-2026-10-07/interpolation/REPORT.md) proves the centered disk bound for independent parameters through degree five and for equal parameters in every degree when `beta=1`. Its equal-parameter proof already contains the generating function, recurrence, and tridiagonal representation. It explicitly leaves the independent-parameter theorem in all degrees open. Its arbitrary-shift-mixture counterexample lies outside the totally positive class. This prior argument is credited directly in PROOF.md.

The present extension uses a different necessary bridge: a complex-parameter zero exclusion, reciprocal-segment geometry, and the Grace–Walsh–Szegő theorem on the upper half-plane. Merely knowing the disk bound for equal real parameters would not justify the extension. The proof includes the full bridge, followed by a Hurwitz argument for real boundary parameters.

The [public weighted quadratic-radius note](https://github.com/the-omega-institute/trureturing/blob/f289261bc3ed0ffa16f39f87868e93638d77f0c8/Blueprint/D5/S3/Zeros/PochhammerDeformation/QuadraticRadii.md), at immutable snapshot `f289261bc3ed0ffa16f39f87868e93638d77f0c8`, gives the weighted outer radius only for degree two. Theorem 1.12 expressly has that degree restriction. Its ordinary mathematical scope was inspected; no Lean verification was undertaken.

The catalog's neighboring real-root-gap question Q1443 has already been disproved and is excluded from future novelty claims. That result does not answer Q1442 or the weighted outer-radius problem.

## Later and classical primary sources checked

| Source inspected | Relevant scope | Relation to this proof |
| --- | --- | --- |
| Cheng and Xin, [*Weighted Euler transforms, real-rootedness, and gamma-positivity*](https://arxiv.cnoctave.top/pdf/2611.17839), arXiv:2611.17839v1, 13 November 2026 | Weighted-transform multiplication closure and gamma positivity; stated main results concern other open problems | Same transform, but the paper's main assertions and root classifications do not supply the conjectured outer-radius bound |
| Brändén and Ottergren, [*A characterization of multiplier sequences for generalized Laguerre bases*](https://arxiv.org/pdf/1210.7151), arXiv:1210.7151v2; *Constructive Approximation* 39 (2014), 585–596 | Theorem 1.1 classifies Laguerre multiplier sequences, with a polynomial-interpolator formulation in the following remarks | Related coefficient transform; no centered-disk theorem was located in the full paper |
| Brändén, Krasikov, and Shapiro, [*Elements of Pólya–Schur theory in finite difference setting*](https://arxiv.org/pdf/1204.2963), arXiv:1204.2963v2 | Theorems 2–4 concern real-rootedness and mesh preservation of finite-difference operators; Lemma 11 sends a polynomial with nonnegative roots into a real-rooted falling-factorial expansion | Different root-sign hypothesis and a different conclusion; these stated results do not give the complex-root bound for the inverse transform here |
| Borcea and Brändén, [*The Lee–Yang and Pólya–Schur Programs. II*](https://arxiv.org/pdf/0809.3087), arXiv:0809.3087 | Theorem 1.1, printed page 4, is Grace–Walsh–Szegő coincidence for symmetric multiaffine polynomials in a circular domain | An explicitly invoked classical theorem; the open upper half-plane is convex, so the extra full-degree alternative is unnecessary |
| Wagner, [*Multivariate stable polynomials: theory and applications*](https://www.math.uwaterloo.ca/~dgwagner/ceb_wagner.pdf) | Theorem 4.1 gives a polarization formulation of the same coincidence principle | Independent primary exposition confirming the precise hypothesis used |

The Cheng–Xin source was checked directly because one search result mismatched its abstract with arXiv:2611.19665. The latter identifier is a different paper, so the mismatched metadata was discarded. The directly inspected Cheng–Xin PDF was version 1; this audit does not claim to have read an unavailable later full text.

The older Forgács–Piotrowski Laguerre-multiplier paper and a finite-convolution article were located through search metadata, but attempted full-text access was unsuccessful or incomplete. They are not counted as fully inspected exclusions. The broad classical search therefore remains bounded.

## Searches and repository checks

Both built-in search engines were used. Queries included exact author, title, source identifier, open-problem number, root radius, centered disk, proof, disproof, and resolution variants, together with broader transform terminology:

- `"Vishnyakova" "Open Problem 6.2" proof`
- `"Vishnyakova" "root-radius" proof counterexample`
- `"2607.06207" proof bound disk circle`
- `"2608.03723" "radius" proof`
- `"polynomials interpolated totally positive" proof bound zeros`
- `"Laguerre multiplier" polynomial "zeros" bound`
- `"inverse" "binomial" "nonreal" zeros`
- `"Pochhammer" "zeros" "disk" polynomial transformation`
- `"Meixner" "polarization" zeros`
- `"Meixner polynomials" "nonreal zeros" bound`
- `"finite difference" "Grace" zeros polynomials`
- `"binomial basis" "zero location"`
- `"Ehrhart polynomial" "real-rooted" "disk" roots`
- `"real-rooted" "h*" "roots" "bound" polynomial`
- `"Poisson binomial" "polynomial" zeros "binomial" complex`

Global GitHub source searches for the arXiv identifiers located the earlier public work above. The complete ordinary report and the catalog's exact Q1442 entry were read through the GitHub connector. This repository's HISTORY.md and all-state issue search for Vishnyakova were checked; no earlier root-radius resolution or exclusion was found. Issues concerning Karp–Vishnyakova–Zhang or Csordas–Vishnyakova concern different assertions and do not determine this one. The current research record is [issue 182](https://github.com/1337isnot1337/solved-conjectures/issues/182).

No earlier full proof or counterexample was located in these searches. This is a documented search outcome, not a logical proof that no earlier solution exists.

## Verification and review

`python verify.py` passes 73 exact algebraic checks using SymPy. It checks the generating recurrence, reflection and finite Vandermonde identities, sharpness witness, tridiagonal characteristic polynomials, matrix quadratic-form bound, and reciprocal-segment crossing identity. These checks support the written all-degree argument; their finite ranges are not the proof.

The analysis reviewer independently checked the weighted source class, complex matrix argument, segment geometry, polarization hypotheses, connected-domain Hurwitz step, reflection, and sharpness. The root reviewer checked the same mathematical risks separately. A sign typo in the draft Vandermonde display was corrected before final review; the corrected identity is included in the verifier. The completed written proof and the limits of this priority search remain open to external scrutiny.

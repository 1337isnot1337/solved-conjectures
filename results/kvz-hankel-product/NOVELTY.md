# Source and prior-resolution audit

Audit date: 20 November 2026. Target: the full Karp–Vishnyakova–Zhang assertion that the pointwise product of two $`SR_\infty`$ Hankel kernels on the positive quadrant is again $`SR_\infty`$.

The documented search found no earlier resolution of this exact assertion. It cannot exclude unpublished work, inaccessible sources, or unindexed public work. The proof is elementary; no novelty is claimed for the Cauchy determinant formula, strict positivity of exponential determinants, or the distinction between pointwise multiplication and kernel composition.

## 1. The statement remains in the published source

The source versions were inspected directly, rather than inferred from search-result snippets.

| Source | Exact location and status |
| --- | --- |
| [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), 3 August 2024 | Section 3, item 11, numbered Conjecture 1. It quantifies over two Hankel kernels, each sign regular in every order on the positive quadrant, and claims their pointwise product has the same class membership. It imposes no common-signature condition. |
| [Karp's Sofia slides](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf), 15 October 2024 | Slide 20 explicitly labels the same universal assertion a conjecture, following the gamma-quotient example. |
| [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), 1 March 2025 | Section 3, item 11, retains the general closure assertion as a belief. It mentions a possible approximation argument and postpones further details. No withdrawal or counterexample is stated. |
| [Published article](https://doi.org/10.1007/s00025-025-02431-4), *Results in Mathematics* 80 (2025), article 112 | Section 3, item 11, pages 13–14, retains the same prose belief. The [author-hosted published PDF](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf) was opened through the publication-list link and checked directly. |

The change from a numbered conjecture to prose is material and is disclosed in the result. It is not evidence of a resolution by itself, especially because the published text still endorses the general assertion. The inspected sources give no reason for the presentation change.

The published numbered Conjecture 1 concerns modified Bessel ratios. It is not the target of this note. A public disproof of that conjecture's stronger log-concavity clause therefore does not resolve the Hankel-product claim.

## 2. Existing closure theorems have different hypotheses or operations

### Fallat–Johnson–Sokal

Shaun Fallat, Charles R. Johnson, and Alan D. Sokal, *Total positivity of sums, Hadamard products and Hadamard powers: Results and counterexamples*, *Linear Algebra and its Applications* 520 (2017), 242–259, with 2021 corrigendum. The [full preprint with corrigendum](https://arxiv.org/pdf/1612.02210) was read at Theorem 4.5 and the correction.

Theorem 4.5 proves Hadamard-product closure for two Hankel matrices which are both totally nonnegative, or both totally positive, through the stated order. Its proof uses positive semidefiniteness of contiguous submatrices and the Schur product theorem. It does not assert closure for arbitrary signatures. The corrigendum repairs a proof of Theorem 3.2 and preserves the relevant total-positivity conclusions; it does not establish or refute the general sign-regular kernel assertion.

The present Gaussian factor has negative order-two minors. Thus the two factors do not satisfy this theorem's total-positivity hypothesis. Our counterexample does not contradict Theorem 4.5.

### Peña

Juan Manuel Peña, [*Positive Hankel Matrices, Eigenvalues and Total Positivity*](https://www.mdpi.com/2227-7390/13/14/2278), *Mathematics* 13 (2025), 2278, DOI 10.3390/math13142278.

The relevant full-text portions and Proposition 5 were inspected through indexed primary text and independently by the analysis reviewer. The paper discusses total positivity of Hankel matrices under Hadamard multiplication. Its proposition on sign-regular matrices concerns the ordinary matrix product $`AB`$, with the product of the two signatures. Ordinary matrix multiplication is not pointwise multiplication. Consequently that proposition does not resolve the target.

### Other adjacent literature

Searches of gamma-ratio sign regularity and positive q-gamma Hankel kernels found work on distinct assertions. Salazar's [arXiv:2606.31647](https://doi.org/10.48550/arXiv.2606.31647), *Order-Moment Transport and Hankel Determinants in Special-Function Inequalities*, records a proof for the positive Jackson q-gamma kernel. Its accessible abstract expressly distinguishes the reciprocal kernel. Attempts to retrieve its arXiv PDF during this audit failed; no claim of a fresh full-text inspection of that paper is made here.

The associated public [Pudim applications file](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) was fetched in full through the GitHub contents API. The only application section mentioning the Karp–Vishnyakova–Zhang source is APP-0080, the positive q-gamma kernel. No general sign-regular Hankel-product resolution appears in that file. This check concerns that inspected file, not every file in the external repository.

## 3. Author and public-source checks

- [Karp's publication list](https://dmkrp.wordpress.com/publications/) was read directly. Its listed work through August 2026 contains no indicated resolution of this product claim.
- [Khare's paper list](https://math.iisc.ac.in/~khare/papers.html) was available in indexed search results, including 2026 publications. Direct fetching was blocked. The visible entries concern total positivity, moment-sequence transforms, or matrix-positivity preservers; no exact product-closure resolution was found. This is a retrieval limitation, not a complete audit of all his papers.
- [The TrureTuring Bessel-ratio result](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/) was inspected. It refutes the separate Bessel log-concavity clause and expressly excludes the unimodality clause. It does not concern general Hankel-product closure.
- Targeted searches of GitHub, TrureTuring, MathDB, Principia Math, author pages, and paper indexes returned no exact prior resolution. Results for other Hankel determinant conjectures and ordinary matrix products were excluded by statement comparison.

## 4. Search coverage

Both available web search engines were used. Queries included the following families, with author-name and hyphenation variants:

```text
"sign regular Hankel" product counterexample
"sign-regular" "Hankel" counterexample
"sign regular Hankel kernels" conjecture
"Karp" "Vishnyakova" "Hankel" counterexample
"Karp" "Vishnyakova" "product" "refuted"
"Hankel" "product conjecture"
"Hadamard product" "sign regular" Hankel conjecture
"Karp" "Vishnyakova" "Conjecture 1" Hankel
"gamma quotient" "sign regular"
"gamma ratio" "total positivity"
Apoorva Khare publications Hankel sign regular product 2025 2026
site:trureturing.org "Hankel" "product"
site:principia-math.com "sign regular"
site:mathdb.com "Hankel" "sign"
site:github.com "Karp" "Hankel" "product"
```

The independent [analysis audit](../../research/kvz-hankel-product/AUDIT-ANALYSIS.md) repeated the source-version and prior-resolution checks, including searches for a withdrawal, correction, refutation, and disproof. It passed the written strict-factor proof and the rational alternative.

## 5. Conclusion and boundaries

The exact conjecture is explicitly attributable to Karp, Vishnyakova, and Zhang in its original numbered form and remains endorsed in the published source. No earlier resolution was found in the inspected material. The proof gives a full counterexample to that universal statement with both factors strict in every order.

The gamma-quotient example that motivated the product conjecture is a separate mathematical problem. A failure of the proposed general closure theorem does not imply failure of that particular example. The reciprocal q-gamma conjecture is also separate. Neither is counted as resolved by this result.

# Source and prior-resolution audit

Audit date: 20 November 2026. Target: the full Karp–Vishnyakova–Zhang assertion that the pointwise product of two $`SR_\infty`$ Hankel kernels on the positive quadrant is again $`SR_\infty`$.

Correction: the earlier search missed a theorem of Thomas Simon that already implies the full negation of the assertion. The result is excluded from newly resolved conjectures. The elementary counterexample remains correct.

## 0. Prior theorem that resolves the assertion

Simon's [*Produit Beta-Gamma et régularité du signe*](https://arxiv.org/pdf/1207.6464), submitted in 2012 and published in 2014, proves that certain products of two totally positive multiplicative kernels are not sign regular. Take the parameters $`b=d=1/2`$ in its main theorem, printed page 4, and the factor discussion on page 16. The factors are $`e^{-x/y}`$ and $`\Psi(1/2,1,x/y)`$; their product is not $`SR_3`$.

The substitution $`x=e^u,y=e^{-v}`$ makes both factors Hankel kernels and changes their signatures by $`(-1)^{\binom r2}`$. Opposite determinant signs for their product are preserved. A common translation of both finite witnessing grid pairs, together with the corresponding translation of the defining functions, puts all grid coordinates in the positive quadrant while preserving all determinant entries. Thus the earlier theorem applies to the exact domain and non-strict hypotheses of the later conjecture.

The [complete correction audit](../../research/kvz-hankel-product/PRIOR-SIMON-CORRECTION.md) supplies the details, checks the factors independently, and records the printed missing-minus typo in Simon's concluding remark. This correction supersedes the earlier no-prior-resolution conclusion. The remaining sections preserve the original search record and the distinctions that were correctly made; they are not evidence that the assertion was open.

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

The conjecture is explicitly attributable to Karp, Vishnyakova, and Zhang in its original numbered form and remains endorsed in the published source. Nevertheless, its negation already follows from Simon's earlier theorem. The repository proof gives a simpler independently obtained counterexample, with both factors strict in every order, and is retained as exposition rather than counted as a new resolution.

The gamma-quotient example that motivated the product conjecture is a separate mathematical problem. A failure of the proposed general closure theorem does not imply failure of that particular example. The reciprocal q-gamma conjecture is also separate. Neither is counted as resolved by this result.

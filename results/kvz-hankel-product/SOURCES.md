# Source and prior-resolution audit

Target: Karp–Vishnyakova–Zhang's Hankel-product conjecture. Audit date: 21 November 2026. This is a bounded literature search, not a guarantee that no unindexed or unpublished resolution exists.

## Exact original statement and versions

1. Dmitrii Karp, Anna Vishnyakova, and Yi Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), 3 August 2024, Section 3, item 11, Conjecture 1. It asserts closure of all-order sign-regular Hankel kernels on the positive quadrant under pointwise multiplication. Definition 2.1 uses weak inequalities and places no common-signature condition on separate kernels. The note immediately after the conjecture reports a possible method, not a proof. The author-hosted [2024 manuscript](https://yzhang1616.github.io/Unimodality_KVZ.pdf), printed page 8, agrees.

2. [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), 1 March 2025, Section 3, item 11. The general product assertion remains, now as an unnumbered belief with the proposed details deferred. The revision's formal Conjecture 1 concerns a Bessel ratio; it must not be confused with Conjecture 1 of v1. Our title identifies the product conjecture rather than relying on the reused number.

3. The authors' [15 October 2024 seminar slides](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf), slide 20 (PDF page 19), independently state the product conjecture in the same generality.

4. Publication metadata: Results in Mathematics **80** (2025), article 112, published 20 May 2025, [DOI 10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4). The [May 2025 author-hosted published PDF](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf) was not retrievable through the research tool. The [ResearchGate publisher preview](https://www.researchgate.net/publication/391909778_Unimodality_Preservation_by_Ratios_of_Functional_Series_and_Integral_Transforms) exposes only the first page, not item 11. No claim of comparing the final published item 11 word for word is made. The original named conjecture and its continued appearance in the March revision are directly verified.

## Closest mathematical results checked

- Shaun M. Fallat, Charles R. Johnson, and Alan D. Sokal, *Total positivity of sums, Hadamard products and Hadamard powers: Results and counterexamples*, Linear Algebra and its Applications **520** (2017), 242–259; [author manuscript](https://discovery.ucl.ac.uk/id/eprint/1532231/1/Sokal_1612.02210v1.pdf), [institutional record](https://discovery.ucl.ac.uk/id/eprint/1532231/). Theorem 4.5 preserves total nonnegativity or total positivity of a given order for Hadamard products of Hankel matrices. Its hypotheses require positive minor signatures. It does not establish closure for arbitrary sign-regular factors; its counterexamples for matrices without the Hankel assumption do not settle the present conjecture either. This is the theorem cited by KVZ in the March revision.

- J. M. Peña, *Positive Hankel Matrices, Eigenvalues and Total Positivity*, Mathematics **13** (2025), 2278, [full text](https://www.mdpi.com/2227-7390/13/14/2278). Proposition 5 preserves sign regularity under ordinary matrix multiplication. That operation sums over an intermediate index and is different from pointwise multiplication. It does not resolve this conjecture.

- The repository's existing proof of the separate KVZ gamma-quotient conjecture was read in full. It uses two gamma-density determinant compositions around a power kernel to prove sign regularity of a particular gamma quotient. It does not assert or prove general closure under pointwise multiplication. The targets are distinct despite arising in the same source item.

- The [pudim research catalog](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md), including the KVZ-related APP-0080 entry, was searched. That entry concerns strict total positivity of the positive q-gamma kernel, not arbitrary sign-regular products. Its associated [arXiv:2606.31647](https://doi.org/10.48550/arXiv.2606.31647) describes order-moment transport for special functions, not a product-closure resolution. No catalog entry resolving the present product conjecture was found.

## Search coverage and outcome

Both built-in search engines were used, with targeted primary-source checks. Queries included these strings and variants using the paper title, author names, and the 2025–2026 date range:

```text
"Karp" "Vishnyakova" "Hankel" "product" conjecture
"sign regular" "Hankel kernels" "product"
"sign-regular" "Hankel" "Hadamard"
"Conjecture" "Hankel" "Karp" "counterexample"
"sign regular" "Hankel" "product" counterexample
"sign-regular" "Hankel" conjecture counterexample
"Karp" "Khare" "product" conjecture
"Karp" "Vishnyakova" "closure"
"sign regular Hankel" counterexample
"sign-regular Hankel" product
"Hankel-product" "conjecture"
"Karp" "Vishnyakova" "Hadamard"
"Karp" "Vishnyakova" "Hankel" "counterexample"
"Hankel" "sign regular" "false"
"sign-regular kernels" "Hadamard" conjecture
site:trureturing.org "Hankel" "product"
"Hankel kernels" "product" "sign regular" counterexample
"Karp" "Vishnyakova" "Khare" conjecture Hankel
```

The [Karp publication page](https://dmkrp.wordpress.com/publications/) and [Zhang publication page](https://yzhang1616.github.io/) were checked for later papers or corrections. Searches targeted the final publisher PDF and ResearchGate preview for the words Hankel, product, and believe. Results led back to the original manuscript, its March revision, total-positivity closure, ordinary-matrix-product closure, and general linear-preserver research. No earlier proof, counterexample, or explicit withdrawal of the general product assertion was located.

The paper's statement that another mathematician had a possible proof method is not evidence of a completed proof. The present counterexample shows that any valid result from such a method must include different hypotheses or a narrower conclusion.

## Resolution and limitations

The exact universal statement in v1 is false. The proof gives two full families of counterexamples, including a family with strictly sign-regular factors. The source's weak definition, positive-quadrant domain, and lack of a common-signature restriction have all been checked directly. The complete written counterexample is independent of the inaccessible published-page comparison.

No prior resolution was found in the checked sources. The missing final-PDF comparison and the usual limitations of web indexing remain explicit. The mathematical counterexample is complete; novelty is supported by the documented search rather than asserted as an absolute certainty.

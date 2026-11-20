# Literature and scope record

Checked on 20 November 2026. The conclusion is limited to the sources searched: no earlier proof or disproof of the arbitrary-exponent shifted-product conjecture was located. Search-engine absence cannot establish priority by itself.

## Primary statements

1. **Mona Gatzweiler and Christian Krattenthaler**, *A positivity conjecture for a quotient of q-binomial coefficients*, Ramanujan Journal **69** (2026), Article 13. [Published article](https://doi.org/10.1007/s11139-025-01285-2), [open full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC12711936/), [arXiv:2502.06032v3](https://arxiv.org/abs/2502.06032v3). The published Conjecture 4 says $`m\ge n`$, with an arbitrary sequence of **nonnegative** integer exponents. It requires polynomiality for the chosen shift only. Symmetry belongs to the separate Conjecture 3. The arXiv record checked lists its latest revision as 20 November 2025.

2. **Mona Gatzweiler, Fabián Levicán-Santibáñez and Atsuro Yoshida**, *Cyclotomic generating functions, empty weighted complete intersections and positivity*, [arXiv:2603.22226](https://arxiv.org/abs/2603.22226), [full text](https://arxiv.org/html/2603.22226v1). Conjecture 1.3 restates the exact target and identifies it as the earlier Conjecture 4. Corollary 1.8/3.11 proves a sufficient large-shift condition, in particular $`m\ge n^2`$. The counterexample here has $`(m,n)=(33,30)`$, outside that condition. The paper's Example 4.2 is an unrestricted quotient representing $`\Phi_{105}`$; it is not a common-shift example satisfying the present conjecture. Example 4.5 is a nonnegative quotient of two Gaussian binomials, not a counterexample. The arXiv record checked contains one version, submitted 23 March 2026.

3. **Dennis Stanton**, *Fake Gaussian sequences*, [author-hosted note](https://www-users.cse.umn.edu/~stant001/PAPERS/macmahon.pdf). The earlier counterexample quoted in Gatzweiler–Krattenthaler has $`m=1`$, $`n=17`$ and a nonsymmetric sequence. It fails the condition $`m\ge n`$ and does not resolve Conjecture 4. Stanton's original symmetric conjecture imposes polynomiality for all shifts. That stronger hypothesis is not satisfied merely by the construction in this repository.

## Later records checked

- [Christian Krattenthaler's publication list](https://www.mat.univie.ac.at/~kratt/papers.html), including the 2026 entries after the original paper. No later resolution was listed.
- [Fabián Levicán-Santibáñez's author webpage](https://homepage.univie.ac.at/fabian.levican/), listing the cyclotomic-generating-function paper.
- [MathDB's exact Stanton-fraction entry](https://mathdb.com/p/373779/gatzweiler-krattenthaler-conjecture-on-positivity-of-stanton), which explicitly gives the arbitrary-exponent, $`m\ge n`$ statement and showed no posted solutions when inspected. This secondary entry was used to discover and cross-check scope; the mathematical statement is supported by the two primary papers above.
- [MathDB's separate Gaussian-binomial quotient entry](https://mathdb.com/p/373778/gatzweiler-krattenthaler-positivity-conjecture-for-quotients) and [Stanton entry](https://mathdb.com/p/373777/stanton-s-conjecture-on-symmetric-fake-gaussian-sequences). These are distinct statements and are not claimed solved here.

- **Thomas Prellberg**, *A positivity conjecture of Prellberg and Stanton*, [arXiv:2610.26878](https://arxiv.org/abs/2610.26878), October 2026. Section 5 of the [accessible manuscript transcription](https://www.paperpeel.com/paper/2610.26878) explicitly compares its dilation product with Gatzweiler–Krattenthaler Conjectures 1 and 3 and does not identify either as a specialization. It gives no resolution of the arbitrary-exponent Conjecture 4. This later paper was checked because its positivity result and references could otherwise be mistaken for a resolution of the present target. Direct arXiv full-text retrieval failed during this check, so this comparison relies on the manuscript transcription and indexed section text.

## Search strings

Both available web search engines were used. Queries included:

- `"Gatzweiler" "Krattenthaler" "positivity" proof conjecture`
- `"Gatzweiler" "Krattenthaler" "Conjecture 4" counterexample`
- `"Gatzweiler" "Levicán" "positivity" counterexample`
- `"Stanton" "fake Gaussian" conjecture solved`
- `"Gatzweiler" "Krattenthaler" counterexample`
- `"Gatzweiler" "Conjecture 4" disproof`
- `"fake Gaussian" "counterexample" "2026"`
- `"Gatzweiler" "Krattenthaler" "disproved"`
- `"Gatzweiler" "Krattenthaler" "refuted"`
- `"Gatzweiler" "shifted" positivity`
- `"Gatzweiler–Krattenthaler" "Stanton fractions"`
- `"Gatzweiler" "50" "63"`
- `"Gatzweiler" "33"`
- `"17,18,21,27,30"`
- `"17, 18, 21, 27, 30" polynomial`
- `"50,51,54,60,63"`
- `"50, 51, 54, 60, 63" polynomial`
- `"Gatzweiler" "counterexamples" positivity`

The exact support and numerator searches did not locate a mathematical source for the construction. A 2026 counterexample concerning Billey–Swanson's two-sided majorisation conjecture also appeared in the broad searches; it concerns a different statement and was not taken as resolving this target.

## Acceptance record

The candidate was discovered by imposing cyclotomic polynomiality constraints and a gap at the first numerator exponent, rather than by optimizing a coefficient over random polynomials. The resulting five-factor identity was then verified by exact polynomial division in SymPy and independently by a standard-library integer verifier. A second agent independently checked the original conjecture's assumptions, the cyclotomic support, the degree, and the four negative coefficients. The complete proof in [proof.md](proof.md) does not rely on either implementation.

This is a new unrefereed result in the repository, subject to correction if an earlier resolution or a mathematical error is identified. No assertion of journal acceptance or external expert review is made.

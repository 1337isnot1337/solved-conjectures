# Priority correction — 20 November 2026

The original negative-search conclusion below is superseded. The algebra reviewer subsequently identified Thomas Simon, *Produit beta-gamma et régularité du signe*, [arXiv:1207.6464](https://arxiv.org/pdf/1207.6464), printed page 16, Remark (b). I have now directly inspected that passage. It gives multiplicative convolution kernels that are individually totally positive in every order, while their pointwise product is not sign regular in every order.

The change of variables $x=e^u$, $y=e^{-v}$ turns these into kernels depending on $u+v$. Reversing the ordered second variable multiplies each minor by $(-1)^{\binom r2}$, which preserves sign regularity and its failure. A fixed translation of both variables moves the finite witnessing grids into the positive quadrant. Thus the older result already implies a counterexample to the general Hankel sign-regular product assertion.

The elementary counterexamples below remain correct, but this target must not be counted as a newly resolved open conjecture. The earlier search missed this implication because the older result was stated for multiplicative convolution kernels. The scope and priority exclusion are tracked in issue 94.

---

# Independent analysis audit

Date: 20 November 2026. Reviewer: the analysis agent, separate from the algebra agent who wrote the proof. This is an internal review, not external peer review.

## Mathematical conclusion

The complete written proof in PROOF.md passes this review. Both input kernels are strictly sign regular in every order. The product fails sign regularity already in order two because its minors have opposite signs on two increasing grids. This disproves the universal closure assertion.

The Cauchy determinant has the displayed positive sign. The exponential determinant argument correctly uses a zero-count induction, connectedness, and a positive coalescence coefficient. Factoring the Gaussian Hankel kernel into positive row and column factors leaves $\exp(-2xy)$; reversing one ordered variable gives the signature $(-1)^{\binom r2}$.

For equal grids $(t,2t)$, direct expansion gives

```math
\det[H(x_i,y_j)]_{i,j=1}^{2}
=\frac{e^{-20t^2}}{9t^2}\left(\frac98-e^{2t^2}\right).
```

At $t=1/10$, the bound $e^{1/50}\lt 50/49\lt9/8$ is strict. At $t=1$, the bound $e^2>3>9/8$ is strict. Hence no single order-two sign works. The changing curvature $1/s^2-2$ gives the same structural obstruction, independently of the two explicit witnesses.

The rational alternative also checks: $x+y$ has negative order-two minors and rank two; $(1+x+y)^{-2}$ is strictly totally positive by its positive Laplace integral and continuous Cauchy–Binet. The two displayed product determinants are exactly $-23/11250$ and $23/57600$.

## Source versions

The reviewer directly read [arXiv:2408.01755v1](https://arxiv.org/pdf/2408.01755v1), Section 3, item 11, printed page 8. Its numbered Conjecture 1 asserts general pointwise-product closure for two $SR_\infty$ Hankel kernels on the positive quadrant. It imposes no requirement that the signatures coincide.

The reviewer also directly read [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), Section 3, item 11, printed page 9, and the matching [March 2025 author-hosted manuscript](https://dmkrp.wordpress.com/wp-content/uploads/2025/03/karp-vishnyakova-zhang.unimodality-preservation-by-ratios-of-functional-series-and-integral-transforms-1.pdf). The assertion remains as a stated belief, without the numbered label. This change in presentation is not a supplied counterexample or withdrawal of the assertion. [Karp's October 2024 slides](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf) also explicitly state the general conjecture.

Direct retrieval of the May 2025 journal PDF failed in this reviewer's session. The parent agent separately checked the published version. No inference of a journal correction is drawn from the preprint numbering change.

## Earlier closure results

The full [Fallat–Johnson–Sokal paper and its appended corrigendum](https://arxiv.org/pdf/1612.02210) were inspected. Theorem 4.5 concerns total nonnegativity and total positivity of Hadamard products of Hankel matrices. It does not state general sign-regular closure. The 2021 corrigendum repairs the proof of Theorem 3.2 and retains Theorem 4.5. These facts therefore do not resolve the present mixed-signature assertion.

The searchable primary text of [Peña's 2025 paper](https://www.mdpi.com/2227-7390/13/14/2278) distinguishes total-positive Hankel Hadamard products from ordinary products $AB$ of sign-regular matrices. Ordinary matrix multiplication has the Cauchy–Binet sign rule; it is different from the pointwise product in the conjecture. No general sign-regular Hankel Hadamard closure result was found there.

## Prior-resolution search

Both search engines were used for the authors' names, the exact paper title, sign-regular Hankel products, Hadamard products, counterexamples, disproofs, refutations, and corrigenda. Current-date filters covered the period since the original conjecture. The reviewer also checked [Karp's publication list](https://dmkrp.wordpress.com/publications/), which included entries through August 2026. No earlier resolution of this exact assertion was located.

Searches of Apoorva Khare's indexed author pages found papers on positivity preservers and moment-sequence transforms. Direct retrieval of the author publications page was blocked, so this is not represented as a full review of that page or of every paper listed there.

The nearby reciprocal q-gamma assertion and Bessel-ratio log-concavity refutation are distinct statements. This audit does not settle the gamma-quotient kernel assertion.

The source-status conclusion is bounded by the accessible literature. The proof's mathematical conclusion is independent of that search. Discussion is recorded in [issue 94](https://github.com/1337isnot1337/solved-conjectures/issues/94).

# Source and prior-resolution audit

Audit date: 20 November 2026. Target: **Karp–Vishnyakova–Zhang's reciprocal q-gamma conjecture**.

## Exact primary statement

D. Karp, A. Vishnyakova, and Y. Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, Results in Mathematics 80 (2025), article 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4), conjecture in Section 3, item 8 that

```math
K(x,y)=1/\Gamma_q(x+y)
```

is strictly sign regular of every order for $0\lt q\lt1$ on the positive quadrant. The exact statement was checked in [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755), page 7, and in [Yi Zhang's author-hosted manuscript](https://yzhang1616.github.io/Unimodality_KVZ.pdf), also Section 3, item 8. Both retain the conjecture and prove only the order-three discrete reciprocal-factorial statement needed for the paper's application.

The [publisher record](https://link.springer.com/article/10.1007/s00025-025-02431-4) confirms the authors, journal, article number, and publication date of 20 May 2025. The [published PDF on Karp's site](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf) was also identified during the source review; direct retrieval was not consistently available. The statement used for the proof is the directly inspected full arXiv version, not a paraphrase from a problem database.

The result here proves the entire conjectured domain and all determinant orders, with the explicit signature $(-1)^{\binom r2}$. No integer-argument or fixed-order restriction is added.

## Neighboring results and possible false matches

### Positive q-gamma Hankel kernel

Section 3, item 7 of the source concerns $\Gamma_q(x+y)$ itself, rather than its reciprocal. That positive-kernel assertion is already the subject of a public proof claim:

D. S. P. Salazar, *Order-Moment Transport and Hankel Determinants in Special-Function Inequalities*, [arXiv:2606.31647v2](https://doi.org/10.48550/arXiv.2606.31647), dated 1 July 2026. The primary arXiv abstract retrieved through search states the positive-kernel result and explicitly excludes the reciprocal sign-regularity problem. The author's public [application record, APP-0080](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md), likewise identifies only the positive q-gamma Hankel kernel and its atomic Mellin representation.

Access limit: attempts to retrieve Salazar's full arXiv PDF and HTML were blocked by the research tool. A mirror did not supply the full article either. We therefore do not describe this as a full-paper audit. The scope distinction is supported by the primary abstract's explicit statement and the public application record. The mathematical proof here does not depend on accepting an unavailable argument: it includes the elementary positive-kernel calculation as an ingredient.

The positive-kernel result is not counted as a new resolution.

### Ordinary reciprocal gamma

Section 3, item 6 of the source says the authors believe that $1/\Gamma(x+y)$ is strictly sign regular of every order and could not locate the fact in the literature. Karp's [15 October 2024 seminar slides](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf), slide 19, state this ordinary-gamma property without a conjectural qualifier, but give no proof or reference there. The ordinary assertion also follows by composing the two kernels in the classical beta integral. Because the earlier public wording is ambiguous about its status, no separate new-result claim is made for it.

The q-gamma assertion in item 8 is explicitly conjectural in both inspected full manuscript versions.

### Reciprocal-gamma series Turanians

The public [Kalmykov–Karp reciprocal q-gamma function refutation](https://www.trureturing.org/research/kalmykov-karp-2018-qgamma-turanian-function/) and its [coefficient counterpart](https://www.trureturing.org/research/kalmykov-karp-2018-qgamma-turanian-coefficients/) concern Conjecture 1 of a different paper, *Inequalities for series in q-shifted factorials and q-gamma functions*, JMAA 460 (2018), 332–351, DOI 10.1016/j.jmaa.2017.11.041. Their objects are weighted series Turanians, with a parameter range extending to negative base shifts. They do not assert or refute the all-minor positive-domain kernel statement proved here. The function-refutation page was read in full during the independent source review.

Similarly, the [public Bessel-ratio log-concavity refutation](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/) concerns the source's later Conjecture 1. That existing result is excluded and is unrelated to Section 3, item 8.

### Functional characterizations and classical total positivity

A. El-Guindy and Z. Mansour, *Functional definitions for q-analogues of eulerian functions and applications*, [arXiv:1309.4585](https://arxiv.org/abs/1309.4585), Aequationes Mathematicae 85 (2013), 69–110, DOI [10.1007/s00010-012-0141-2](https://doi.org/10.1007/s00010-012-0141-2), studies q-gamma quotients, logarithmic derivatives, and functional characterizations. An independent full-PDF review found no determinant or sign-regularity result resolving this target. Other search hits for sign-regular kernels concerned power kernels or positive gamma kernels, rather than the reciprocal q-gamma assertion.

The exponential determinant sign, Cauchy–Binet formula, and q-binomial series are classical. The standard definitions and series identity were checked against [DLMF 5.18.4](https://dlmf.nist.gov/5.18.E4) and [DLMF 17.5.2](https://dlmf.nist.gov/17.5.E2). They are not claimed as new. The proof includes the needed arguments and applies their composition to the complete reciprocal conjecture.

## Search coverage

Both available search engines were used, including current searches restricted to the last two years. The search examined the exact author combination, the paper title and identifier, the explicit reciprocal kernel, sign regularity, q-beta kernels, q-Pochhammer total positivity, and possible determinant formulations. Representative query families were:

```text
"reciprocal gamma" "sign regular"
"reciprocal" "q-gamma" "sign"
"q-gamma" "sign regularity"
"q-gamma" "total positivity" reciprocal
"q-beta" "sign regular"
"q-beta kernel" total positivity sign regularity
"Gamma_q(x+y)" reciprocal sign regular
"Karp" "Vishnyakova" "Zhang" "reciprocal" proof
"Karp" "Vishnyakova" "reciprocal" "conjecture"
"q-Pochhammer" "strict" "total positivity"
"reciprocal gamma" "kernel" determinant
"q-gamma" "Hankel" sign regularity
```

The [current Karp publication list](https://dmkrp.wordpress.com/publications/) was also checked; it included entries through August 2026. The search found the source conjecture, the distinct positive-kernel proof claim, classical ingredients, and unrelated reciprocal-series refutations, but no earlier proof or disproof of the exact reciprocal-kernel assertion.

This is a bounded prior-resolution search, not a guarantee about unindexed or unpublished work. No private correspondence or author endorsement was obtained. The full-text access limit for Salazar is recorded above.

## Mathematical review

The parent agent proposed the q-beta composition. The analysis agent derived the direct two-Cauchy–Binet form and wrote the proof. The parent and a separate algebra agent each reviewed the complete text. Both checked the exponential determinant orientation, the q-binomial identity, the index-zero endpoint, the finite truncation limits, retention of strictness, the final positive factors, and the explicit lower bound.

The exact verifier checks finite identities and rigorous product intervals. These diagnostics are separate from the proof's arbitrary-order argument. No outside peer review is claimed. Discussion and audit receipts are retained in [issue #93](https://github.com/1337isnot1337/solved-conjectures/issues/93).

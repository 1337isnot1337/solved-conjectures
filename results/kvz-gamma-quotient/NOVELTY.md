# Karp–Vishnyakova–Zhang's gamma-quotient conjecture: source and novelty audit

Audit date: 20 November 2026.

## Exact target and conclusion

Section 3, item 11 of Karp, Vishnyakova, and Zhang proposes that

```math
\frac{\Gamma(c+x+y)}{\Gamma(d+x+y)}
```

is sign regular of every order when $`c>d`$, in the positive-argument setting. It separately suggests the fixed third-order signature $`(+,-,-)`$. The complete proof in this directory establishes the all-order statement, gives its parameter-dependent signature, and explains the correction to that subsidiary sign claim.

No earlier complete resolution of this exact all-order gamma-quotient statement was found in the inspected sources and searches below. This is a bounded literature conclusion, not a guarantee that no earlier proof exists. The gamma convolution identity, power-kernel signs, Wronskian method, and continuous determinant composition are classical ingredients. They are not claimed as new methods.

The theorem is one full result for every positive parameter difference. The integer rank distinction and the sign changes between parameter intervals are parts of that theorem. They are not counted as separate conjectures.

## Primary source and version history

| Source | Inspected statement and relevance |
| --- | --- |
| [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), August 2024, Section 3, item 11 | States the gamma-quotient sign-regularity suggestion. It also proposes a separate general product-closure conjecture as a possible route. |
| [Karp's October 2024 seminar slides](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf) | Discusses the positive reciprocal-parameter ratio and the sign-regularity questions. This is contemporary author evidence, not a proof of the present direction. |
| [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), March 2025, Section 3, item 11, printed page 9 | Retains the all-order gamma-quotient statement and the fixed third-order signature. The separate product-closure conjecture is retained as prose. |
| [Published author PDF](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf), Section 3, item 11, printed pages 13–14 | The root agent directly inspected the journal text and confirmed the same assertions, without a restriction $`c-d>1`$ on the proposed third-order signature. |
| [Journal record](https://doi.org/10.1007/s00025-025-02431-4) | Results in Mathematics 80 (2025), article 112; published 20 May 2025. |

The proof makes the positive-argument domain explicit. It does not make any assertion across poles of the gamma function. The sign-regularity conjecture is independent of the general product-closure belief. The latter is false, as documented separately in [issue 94](https://github.com/1337isnot1337/solved-conjectures/issues/94); that does not resolve this quotient's specific determinant signs.

## Nearby primary theorems checked

The analysis agent read the first three papers below and recorded the precise theorem scopes in [its independent audit](../../research/kvz-gamma-quotient/AUDIT-ANALYSIS.md). The root agent separately inspected the later items in its source audit.

| Primary source | Actual scope and distinction |
| --- | --- |
| Grover–Panwar–Reddy, *Positivity properties of some special matrices*, [arXiv:2002.08703](https://arxiv.org/pdf/2002.08703), LAA 596 (2020), 203–215, DOI [10.1016/j.laa.2020.03.008](https://doi.org/10.1016/j.laa.2020.03.008) | Theorem 2.11 proves strict total positivity for the gamma-sum kernel. Corollary 2.12 gives the inverse-beta kernel by positive row and column scalings. Neither is the shifted quotient of two gamma-sum kernels. |
| Grover–Panwar, *Bidiagonal decompositions and total positivity of some special matrices*, [full PDF](https://files.ele-math.com/articles/oam-16-41.pdf), Operators and Matrices 16 (2022), 545–558 | Treats powers of $`1+xy`$, negative powers of the Cauchy kernel, and mean matrices. These are relevant classical ingredients, not an identified theorem for the target quotient. DOI [10.7153/oam-2022-16-41](https://doi.org/10.7153/oam-2022-16-41). |
| Delgado–Peña, *High relative accuracy with some special matrices related to gamma and beta functions*, [full publisher text](https://onlinelibrary.wiley.com/doi/full/10.1002/nla.2494), NLAA 30 (2023), e2494 | Section 3, Theorem 3, repeats gamma-sum total positivity; Theorem 4 gives decompositions on unit-spaced grids. Section 4 treats inverse-beta matrices. These do not imply the target by a positive row/column scaling. |
| Koumandos–Pedersen, *Some two-parameter families of generalized Bernstein functions*, [arXiv:2507.03551v1](https://arxiv.org/html/2507.03551v1) | Concerns normalized reciprocal gamma ratios and generalized Bernstein/Thorin properties. The inspected full text has no theorem establishing all-order Hankel sign regularity of the present quotient. Its definition of generalized Bernstein order must not be replaced by a claim about one fixed higher derivative. |
| Karp–Prilepkina, *Completely monotonic gamma ratio and infinitely divisible H-function of Fox*, [arXiv:1501.05388](https://arxiv.org/abs/1501.05388) | Studies logarithmic complete monotonicity and representing measures for gamma products. Such positive-Laplace results concern different parameter directions and do not provide the alternating, parameter-dependent signs here. This scope was checked from the primary abstract and its use in the source paper. |
| Khare, entrywise-calculus survey, [arXiv:2511.08406](https://arxiv.org/abs/2511.08406) | The root agent inspected the 2026 author record and this survey. No exact gamma-quotient resolution was located. Entrywise total-positivity preservation is not the same operation as the integral composition used here. |

The opposite parameter direction $`d>c>0`$ is a positive beta-moment kernel and was already known to be strictly totally positive in the source. It is excluded from the new-result scope. Ordinary positive gamma and inverse-beta total positivity are also excluded.

## Public solution bodies and recent related work

The search did not stop at page titles or abstract claims where relevant public result bodies were available.

1. The current [Pudim application ledger](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) was read through the repository contents interface. The relevant entries have different targets: APP-0080 is the positive Jackson gamma kernel; APP-0024 concerns a normalized gamma-quotient Bernstein property; APP-0017/0031 concern a four-gamma Bernstein assertion; APP-0029/0034 concern scalar log-gamma critical points. None is the additive Hankel quotient considered here.
2. Salazar, [arXiv:2606.31647](https://arxiv.org/abs/2606.31647), *Order-Moment Transport and Hankel Determinants in Special-Function Inequalities*, explicitly advertises a proof for the positive Jackson gamma kernel, together with Mills-ratio, Tricomi, and Coulomb applications. Its accessible current abstract was inspected. Full PDF and HTML retrieval failed for all reviewing agents, so this paper is not represented as fully inspected. The accessible description does not claim the present gamma-quotient result.
3. The [TrureTuring Bessel-ratio record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/) concerns a different conjecture from the same paper and already contains a disproof. That target is excluded. The root also checked the separate public Karp–Prilepkina Meijer-function zero-count disproof; it has a different function and assertion.
4. The current [rbajaj5 result index](https://github.com/rbajaj5/a183068-supercongruence/blob/main/RESULT_INDEX.md) was retrieved in full and searched for gamma, Hankel, sign regularity, and the source authors. The gamma-quotient hits concern factorial-ratio integrality and supercongruence towers. The exact inspected blob was `0c435bacce1a502ce902d61f9786aee27db6f507`; it has no matching target entry. This is an index-level exclusion, not a claim to have read that entire repository.
5. The public question [Does this gamma-ratio moment inequality hold?](https://math.stackexchange.com/questions/5141806/does-this-gamma-ratio-moment-inequality-hold) concerns signed moments of products $`(a-j)/(a+j+1)`$ against a specific measure. Its displayed question is different and supplies no proof of the present kernel assertion.

The source authors' records were also checked. [Karp's publication page](https://dmkrp.wordpress.com/publications/) lists work through August 2026 and retains the 2025 paper without an identified subsequent gamma-quotient resolution. The root inspected [Khare's publication record](https://math.iisc.ac.in/~khare/papers.html) and related 2026 material. Author-page absence is supporting search context, not proof of novelty.

## Search coverage and limitations

Both available search engines were used. The algebra lane alone searched more than twenty combinations, including:

- `"gamma quotient" "sign regular"` and the corresponding hyphenated and ratio forms;
- `"gamma quotient" "total positivity"`;
- `"gamma ratio" "Hankel" "sign"`;
- `"Gamma(c+x+y)" "c>d"`;
- the three source authors with gamma, proof, solution, conjecture, and correction;
- `"gamma transform" "sign regular"` and gamma-ratio Chebyshev determinant terms;
- exact-name searches restricted to GitHub and TrureTuring;
- source-paper and public-solution searches for Karp–Vishnyakova–Zhang.

The root and analysis agents ran independent searches and checked the primary scopes listed above. Retrieved hits were compared with the actual two-variable quotient and the all-order property, rather than treated as matches because they contain gamma functions or determinants.

No exact earlier complete resolution was identified. The inaccessible full Salazar manuscript remains an explicit limit. None of the inspected primary theorem statements or accessible public solution bodies supplies the result. Future specialist review could identify an older theorem or a more direct published deduction.

## Review receipts

The full proof candidate was committed as `04ab22fc69f72cefa88c229a105ef12536ff7dbc`. The analysis audit is commit `562fb3c861f07c4ec9ee43e60d792edafba2f289`; its issue receipt is `7048531921`. The root independently reviewed the complete written argument and found no mathematical gap. Final publication preserves the mathematics of that reviewed draft and adds documentation and exact diagnostics.

See [issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97) for the source questions, independent reviews, and final commit receipts.

# Source and prior-resolution audit

## Priority correction: excluded from new-result count

A [complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-349140/mathdb-349140-solution.tex) by Principia Math In Progress, dated **11 September 2026**, was located and read on 20 November 2026. The pinned repository revision establishes its presence by **27 October 2026**. It proves the same open interval below the proposed threshold. Simon's named conjecture was therefore already resolved before this repository's work.

The proofs below are retained with attribution. The explicit `13/30` construction supplies additional structure, but it does not constitute a newly resolved conjecture. See [the full exclusion audit](PRIOR-EXCLUSION.md).

## Status and scope

Audit date: 2026-11-20 UTC.

The target is Simon's full complete-monotonicity equivalence for the three-parameter Le Roy function. It is not the separate convexity question about the threshold, and it is not the unrestricted assertion that every gamma-ratio distribution is logarithmically infinitely divisible. Counterexamples to that unrestricted assertion were known earlier.

The proof gives an explicit interval of counterexamples to Simon's exact statement. Its short proof uses Dufresne's 2010 general construction with full attribution. An independent density-perturbation proof is also preserved. The initial bounded search missed an exact earlier resolution. Its former negative finding is superseded by the priority correction above. The remainder of this document records the earlier source checks; those checks do not establish novelty.

## 1. Primary statement

Thomas Simon, *Remark on a Mittag-Leffler function of Le Roy type*:

- [arXiv:2012.11018v2](https://arxiv.org/pdf/2012.11018), dated 25 March 2021; full six-page preprint inspected.
- Published in *Integral Transforms and Special Functions* 33(2) (2022), 108–114, [DOI 10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138). The publisher's public abstract and metadata were inspected; its full article was not available through that public preview. The online publication date is 17 April 2021.

The unnumbered conjecture is in Section 3, printed page 5. It asserts the complete-monotonicity equivalence for every positive parameter triple. Printed page 6 states the equivalent formulation through logarithmic infinite divisibility of the associated positive random variable. Section 2 proves sufficiency of the scalar inequality and several necessary parameter conditions. Those established implications are not claimed as new here.

The same paper's last paragraph on page 5 asks a separate threshold-convexity question. A 2026 reported solution of that question does not settle the complete-monotonicity equivalence.

## 2. Dufresne's earlier construction is a proof tool

Daniel Dufresne, *G distributions and the beta-gamma algebra*, *Electronic Journal of Probability* 15 (2010), no. 71, 2163–2199:

- [Full published PDF](https://emis.de/ft/42731).
- Theorem 6.3 and its converse, printed pages 2187–2188, were checked independently by multiple research lanes.
- Theorem 6.1(c), printed page 2184, and the examples near page 2195 were also inspected.

Theorem 6.3 constructs positive gamma-ratio laws from suitable Laplace transforms by independent exponential tilts and an infinite product. Our main proof specializes that construction to numerator parameters $(1/3,2/3,1)$ and denominator parameters $(13/30,13/30,2)$, then cancels the final denominator by an independent gamma variable. The exact positive quadratic in this specialization is the counterexample certificate developed here.

Dufresne's previously reported non-log-infinitely-divisible example uses different gamma parameters. No occurrence of the Le Roy specialization was found in the inspected theorem, examples, or subsequent references. The general construction is expressly credited; neither it nor ordinary beta-gamma closure is claimed as new.

See [DUFRESNE-AUDIT.md](DUFRESNE-AUDIT.md) for the combinatorics lane's independent source and specialization review.

## 3. Earlier Le Roy analysis

K. Górska, A. Horzela, and R. Garrappa, *Some results on the complete monotonicity of the Mittag-Leffler functions of Le Roy type*, *Fractional Calculus and Applied Analysis* 22(5) (2019), 1284–1306, DOI 10.1515/fca-2019-0068:

- [Full arXiv manuscript, 1912.07100v2](https://arxiv.org/pdf/1912.07100).
- [Author's copy of the published paper](https://www.dm.uniba.it/it/members/garrappa/2019_gorskahorzelagarrappa_fcaa_authorcopy.pdf).

The Meijer-G inverse-Laplace representation is already present there. The paper proves selected complete-monotonicity regions and investigates other subcritical cases numerically. In the corresponding general-case discussion, the authors state that they do not have an analytic expression for the exact threshold. Their analytical cases include the balanced boundary and a case with second parameter equal to one. The inspected statements do not prove our below-log-ID-threshold interval.

Our contribution does not claim the existence of a Meijer-G representation or its routine Mellin transform as new. It proves positivity for a parameter interval where Simon's later necessary-condition conjecture fails.

## 4. Gamma-type distributions and an apparent missing qualification

T. Kadankova, T. Simon, and M. Wang, *On some new moments of Gamma type*, *Statistics and Probability Letters* 165 (2020), article 108854:

- [Full arXiv:1908.03428v2](https://arxiv.org/pdf/1908.03428), dated 7 June 2023.

The main theorems and Remark (c) construct and discuss laws with a numerator factor of positive slope and another of negative slope, such as $\Gamma(a+s)\Gamma(b-s)$, over two positive-slope denominator factors. Their non-log-infinitely-divisible family is different from the Le Roy Mellin quotient. Simon explicitly makes that distinction in the target paper's last paragraph.

There is a source nuance that cannot be silently ignored. Equation (3) in Section 1.2 prints a sum condition as necessary without visibly restricting it to equal numerator and denominator counts. Applied literally to $(1/3,2/3,1)$ over $(\beta,\beta)$, it would require $\beta\geq1/2$. This contradicts even Simon's established infinitely divisible sufficient region with some $\beta\lt1/2$.

The earlier source Dufresne, Theorem 6.1(c), explicitly imposes the sum condition only when the counts are equal. Thus the broader wording in the Kadankova–Simon–Wang paragraph appears to omit that qualification. Our proofs do not use it. Their integral and probability constructions establish existence directly, so no disputed necessary condition is an assumption.

Min Wang, *Moments of Gamma type and three-parametric Mittag-Leffler function*, [arXiv:2410.19330v1, full HTML](https://arxiv.org/html/2410.19330v1): Theorem 1.2 concerns $\Gamma(a+s)\Gamma(b-s)/\Gamma(c+ds)$. Section 2.2 records earlier non-log-infinitely-divisible examples, including Dufresne's different balanced three-factor example. These are acknowledged prior facts, but no exact Le Roy specialization or resolution was found there.

## 5. Further primary literature inspected

| Source | Inspected scope and relation to this target |
|---|---|
| C. Berg, A. Çetinkaya, D. Karp, *Completely monotonic ratios of basic and ordinary gamma functions*, [arXiv:2004.14075](https://arxiv.org/pdf/2004.14075) | Full PDF available; Section 3, especially Theorem 3.2, gives logarithmic complete-monotonicity conditions for gamma ratios. It does not identify complete monotonicity of the Le Roy function with those conditions. |
| L. Beghin, L. Cristofaro, J. L. da Silva, *Fox-H densities and completely monotone generalized Wright functions*, [arXiv:2310.01948v2](https://arxiv.org/pdf/2310.01948), *Journal of Theoretical Probability* 38, article 18 (2025), DOI 10.1007/s10959-024-01391-9 | Full PDF inspected at definitions, positivity assumptions, Theorem 4, Lemma 5, and the stated product-density classes. Theorem 4 assumes positivity of decomposition factors; the density-to-Laplace statement retains a positivity hypothesis. No threshold-crossing result for the exact Le Roy family was found. |
| F. Giraldi, *A class of positive Fox H-functions*, [arXiv:2502.10483](https://arxiv.org/pdf/2502.10483) | Full PDF inspected at Section 4, including the elementary factors, parameter conditions, Mellin transforms, and Theorem 4.3. It constructs positive functions by Mellin convolutions of elementary positive factors. No exact repeated-denominator Le Roy specialization below its proposed log-ID threshold was found. |
| R. A. C. Ferreira, T. Simon, *Mittag-Leffler functions and convex ordering*, [arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1) | Full primary HTML inspected. Theorems A–D concern parameter monotonicity and convex order for one- and two-parameter Mittag-Leffler functions. They do not resolve the Le Roy three-parameter equivalence. |
| V. Kiryakova and J. Paneva-Konovska, *Going Next after “A Guide to Special Functions in Fractional Calculus”: A Discussion Survey*, [Mathematics 12(2), 319 (2024)](https://www.mdpi.com/2227-7390/12/2/319) | Public primary survey identifies complete-monotonicity parameter questions for Le Roy-type functions and cites Górska–Horzela and Simon. It does not announce a resolution of the target. |

## 6. Current author and problem records

[Thomas Simon's current publication list](https://pro.univ-lille.fr/thomas-simon/publications), marked updated 29 August 2026, was checked. It retains the target paper and lists later Mittag-Leffler and beta-weighted-operator work. No listed title or note announces a resolution of this conjecture. An author list alone is not proof of unresolved status.

The current [threshold-convexity MathDB record](https://mathdb.com/p/414157/convexity-of-the-le-roy-parameter-threshold) reports a 2026 proof of that separate question and expressly distinguishes the main complete-monotonicity equivalence as unclaimed. That record is a discovery/status lead. The precise target is taken from Simon's primary paper, not from the problem database.

The already-reported Karp–Prilepkina Meijer zero-count disproof was also screened. It concerns a zero-count comparison for balanced Meijer-G functions, with an oscillatory Jacobi-polynomial family. It is not a positive Le Roy density and does not supply our counterexample parameters.

## 7. Access limits

These limits remain visible; abstracts were not treated as full-theorem reviews.

- Chamayou and Letac, *Additive properties of the Dufresne laws and their multivariate extension* (1999): the full text was not accessible in the current audit. The public abstract and its use in the later primary sources were checked. Dufresne's 2010 explicit construction was available in full.
- O. Mert Coşkun, A. Çetinkaya, Ş. Altınkaya, *Inequalities of the Turán-Type for the Le Roy Type's Mittag-Leffler Function*, DOI [10.1002/mma.70313](https://onlinelibrary.wiley.com/doi/full/10.1002/mma.70313): publisher abstract and references inspected. The public page redirects to an abstract; the [institutional record](https://openaccess.iku.edu.tr/entities/publication/d256b903-7340-4d49-9f1e-c3a68b413d18) labels its file restricted access and was not consistently retrievable. Its abstract describes ratio monotonicity, Turán inequalities, and log-convexity, without claiming the target equivalence.
- K. Mehrez and A. Alenazi, *Convexity and Monotonicity of Analytic Functions Related to Le Roy-Type Hypergeometric Functions*, DOI [10.1007/s11253-026-02596-3](https://link.springer.com/article/10.1007/s11253-026-02596-3): public publisher abstract and references inspected; full article behind a subscription preview. The [original-journal record](https://umj.imath.kiev.ua/index.php/umj/article/view/9392) concerns geometric function theory and a separate proposed conjecture. No target resolution appears in the accessible abstract.
- Beghin, Leonenko, Simon, Vaz, *Beta-weighted non-local differential operators and related stochastic processes*, arXiv:2606.03661: identified on Simon's current author list. Its indexed primary abstract and an [accessible partial manuscript](https://paperity.org/p/373938750/beta-weighted-non-local-differential-operators-and-related-stochastic-processes) describe beta-weighted differential operators, Mellin–Barnes functions, and stochastic processes. No target resolution is announced there. Direct PDF and full HTML retrieval failed, and the accessible manuscript stops in the introduction. Its full theorem scope has not been excluded.

## 8. Search record and conclusion

Both available search engines were used. Queries combined the exact source title and arXiv identifier with “conjecture”, “proof”, “counterexample”, “complete monotonicity”, “Le Roy”, “logarithmically infinitely divisible”, “Dufresne”, and the exact fraction $13/30$. Additional searches covered Meijer-G positivity, gamma-type laws, Fox-H densities, and recent Le Roy papers. Searches of the repository found no earlier target issue before issue 104 was opened. Current-year searches and the author's publication list were included.

No earlier exact specialization or full resolution was found in the inspected materials. The known general construction, known non-log-ID gamma laws, and already-resolved threshold-convexity question are explicitly separated from the new counterexample claim. The remaining access limits prevent an unconditional statement that no earlier proof exists anywhere.

Internal mathematical reviews are recorded separately. They are research-team reviews, not external peer review.

## 9. Completed internal reviews

The [root review](AUDIT-ROOT.md), including the final explicit manuscript review at commit [073a685acc2805a5b9bf57e626813caeccb7c442](https://github.com/1337isnot1337/solved-conjectures/commit/073a685acc2805a5b9bf57e626813caeccb7c442), and the [algebra review](AUDIT-ALGEBRA.md), updated at [d85a2d8d0d79e07ed537816d35f6ecaef7caef5c](https://github.com/1337isnot1337/solved-conjectures/commit/d85a2d8d0d79e07ed537816d35f6ecaef7caef5c), found no gap in either written argument. The [independent Dufresne audit](DUFRESNE-AUDIT.md) was committed at [9058cef01a17e23bc998d8d42d9d8449929124c0](https://github.com/1337isnot1337/solved-conjectures/commit/9058cef01a17e23bc998d8d42d9d8449929124c0). The exact verifier was run independently by the authoring lane and root. These reviews do not remove the access limits or establish priority beyond the documented search.

# Source and prior-resolution audit

## Correction: the conjecture was already resolved

Correction date: 20 November 2026. The original novelty conclusion is withdrawn.

[Principia Math In Progress, *Positive coefficients of rising-factorial Turán polynomials: A proof of the Karp–Sitnik conjecture, MathDB 323156*](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-323156/mathdb-323156-solution.tex), is dated 11 September 2026. Its full LaTeX source is present in revision `47371706c400c79d06e3fb62190fcf6f7a725c85`, dated 27 October 2026. Although its title uses the secondary database's joint attribution, its opening theorem explicitly identifies and proves Karp's Conjecture 1.

The prior theorem uses the identical source polynomial, arbitrary n at least three, arbitrary positive real shifts, and every nonnegative sequence satisfying strict log-concavity at the interior indices. It permits zero endpoints. It proves exact degree n minus two and strict positivity of every coefficient from the constant term through that degree. This is the whole target, not the known unit-shift or pointwise assertion.

Root read the complete ordinary mathematical proof. It differentiates symmetric central truncations of the rising-factorial Vandermonde sum, cancels reflected index ranges, and obtains a derivative difference equal to the parameter difference times a polynomial with nonnegative coefficients. Integrating along a shift-transfer line gives strict positivity in every degree. Increasing symmetric weights then give the target by summation by parts. The finite boundary ranges, division at equal parameters, strictness, and zero-endpoint argument were checked. No gap affecting the full statement was found.

Our independent marked-cycle proof and explicit lower bound remain documented, but the named conjecture was already settled by this prior proof. Neither a different proof nor an additional coefficient bound restores eligibility under the campaign's unresolved-target rule. No new-resolution claim is retained.

Discovery: GitHub code search for Karp in `PrincipiaMathOrg/math-solutions`, followed by the full `site-backup/MANIFEST.json` and the pinned source above. The earlier web, author-page, and MathDB checks missed this public archive. That is a coverage failure in the initial search, not evidence that the prior was unavailable.

## Historical audit below

The original audit is retained to show the scope and limits of the earlier search. Every statement below about finding no earlier solution or claiming a new resolution is superseded by this correction.


Audit date: 20 November 2026. Target: **Karp's coefficient-positivity conjecture**, Conjecture 1 in the source below. The result concerns the complete statement, with arbitrary $n\geq3$, arbitrary positive real shifts $\alpha,\beta$, and all nonnegative strictly log-concave input sequences.

## Primary statement and versions

1. D. Karp, *Positivity of Toeplitz determinants formed by rising factorial series and properties of related polynomials*, [arXiv:1203.1482v1](https://arxiv.org/abs/1203.1482v1), Section 1, equation (3), Conjecture 1, page 2. [Full preprint](https://arxiv.org/pdf/1203.1482).
2. The original published paper appears in Zapiski Nauchnykh Seminarov POMI 404 (2012), 184–198. [MathNet record](https://www.mathnet.ru/php/archive.phtml?jrnid=znsl&option_lang=eng&paperid=5267&wshow=paper); [full published PDF](https://www.mathnet.ru/php/getFT.phtml?jrnid=znsl&option_lang=eng&paperid=5267&what=fullt). The conjecture and polynomial formula occur on printed page 185. A page image was checked because the PDF text extraction corrupts some characters.
3. The English translation is Journal of Mathematical Sciences 193(1) (2013), 106–114, DOI [10.1007/s10958-013-1438-y](https://doi.org/10.1007/s10958-013-1438-y).

The preprint and published statement agree on the target polynomial, positive shifts, strict log-concavity, and the requested positive coefficients of degrees $0$ through $n-2$. The source defines log-concavity for nonnegative sequences without internal zeros. Under the strict inequalities in the conjecture, all interior terms are positive. Our theorem also permits zero endpoints and proves that case explicitly.

The source has a single author and says that he proposed the conjectures. Karp–Sitnik is the attribution of the preceding pointwise-positivity theorem. We therefore use Karp's name for this conjecture, despite the combined attribution on one secondary database page.

## Adjacent statements were excluded

### Pointwise positivity and the unit-shift theorem

The source explains an earlier Karp–Sitnik theorem that makes the polynomial nonnegative at each nonnegative real argument. That does not determine the signs of its coefficients. Karp's paper also proves a coefficient-positivity theorem for the specially shifted unit-step polynomial. Neither theorem supplies Conjecture 1 with arbitrary positive $\alpha,\beta$.

### Hurwitz stability

Conjecture 2 concerns Hurwitz stability of the same general-shift polynomial. Public counterexamples already appear at [Trure Turing's Karp research page](https://www.trureturing.org/research/karp1203/). The page distinguishes the coefficient-positivity question from its stability counterexample. This existing disproof is excluded from the repository's new-result claim.

The proof in this directory asserts coefficient positivity only. It does not assert Hurwitz stability or real-rootedness.

### Pólya-frequency real zeros

Henry Zweiman, *A proof of Karp's conjecture on the zeros of Toeplitz determinants of rising factorial series*, [arXiv:2610.18895](https://arxiv.org/abs/2610.18895), dated 10 October 2026, announces a proof of Karp's original Conjecture 3 for positive Pólya-frequency sequences. The [full PDF mirror](https://borowiecki.dev/pdf/2610.18895) was inspected, not just its title or abstract.

Its main theorem concerns the unit-shift polynomial and the stronger Pólya-frequency hypothesis. Page 10 explicitly separates the original Conjectures 1–2 for log-concave sequences and general positive shifts, and says they are not addressed. Thus this recent proof claim does not resolve the statement proved here. We make no new claim for Conjecture 3.

### Related gamma-ratio and functional-series papers

The following primary papers were checked to distinguish positivity in the series variable from positivity in the rising-factorial parameter:

- S. I. Kalmykov and D. B. Karp, Journal of Mathematical Analysis and Applications 406 (2013), 400–418, [full PDF](https://dmkrp.wordpress.com/wp-content/uploads/2013/06/yjmaa17560.pdf). Section 3, equations (11)–(12), Theorem 1, and Conjecture 1 concern series of the form $\sum_n f_n(a+\mu)_n/(c+\mu)_n\,x^n/n!$. Their coefficient question concerns the generating variable $x$, with parameters fixed. It is a different assertion from positivity in the rising-factorial parameter of the polynomial here.
- D. Karp and Y. Zhang, *Log-concavity and log-convexity of series containing multiple Pochhammer symbols*, Fractional Calculus and Applied Analysis 27 (2024), 458–486, DOI [10.1007/s13540-023-00238-0](https://doi.org/10.1007/s13540-023-00238-0), [full PDF](https://dmkrp.wordpress.com/wp-content/uploads/2024/01/karpzhangfcaa2024.pdf). Section 1, equations (1.2)–(1.3), make the same series-variable distinction and cite the earlier Karp–Sitnik theorem.
- D. Karp, A. Vishnyakova, and Y. Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, Results in Mathematics 80 (2025), article 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4), [full PDF](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf). The abstract, introduction, and factorial-series sections concern preservation of unimodality by ratios. The inspected statements do not prove the Toeplitz coefficient conjecture.

These related papers were examined during a separate internal source review. None of the inspected statements gives the exact result claimed here.

## Search coverage

The source paper, journal metadata, author publication list, recent neighboring proof claims, and secondary problem listing were checked. The [author's publication list](https://dmkrp.wordpress.com/publications/) included entries through August 2026 at the time of the audit. No listed title indicated a resolution of this exact conjecture. The [secondary problem page](https://mathdb.com/p/323156/karp-sitnik-coefficient-positivity-conjecture-for-rising-fac) displayed no posted solution, but this was only a discovery aid: an unchanged database label is not evidence that a conjecture remains open.

Searches used both available search engines. Query families included the exact paper title, arXiv identifier, DOI, author with Conjecture 1, author with coefficient positivity, general shifts, rising-factorial Toeplitz determinants, and the recently posted real-zero proof. Searches for the proposed proof mechanism included truncated Vandermonde sums, coefficientwise Schur concavity, Stirling-number minors, and marked cycles. Representative queries were:

```text
"1203.1482" conjecture proof
"Positivity of Toeplitz determinants formed by rising factorial series" proof
"Karp" "Conjecture 1" "coefficients"
"Karp" "coefficient positivity" "2026"
"Karp" "Toeplitz" "Conjecture 1" proof coefficients
"Karp" "Conjecture 1" "general-shift"
"Karp" "rising factorial" "absolutely monotonic" conjecture
"truncated Vandermonde" "positivity"
"rising factorial" "Schur-concave"
"Karp" "Stirling" "conjecture" positivity
"Karp" "marked cycle"
"2610.18895"
```

No earlier proof or disproof of the exact general-shift coefficient-positivity assertion was found in these checks. This is a bounded literature-search conclusion, not a guarantee that no unindexed or unpublished work exists. No private correspondence or outside expert confirmation was obtained.

## What is claimed as new

The proof resolves the full coefficient-positivity assertion and gives an explicit strictly positive coefficient lower bound. Its central step is an exact marked-cycle cancellation for symmetric central tails of the rising-factorial Vandermonde sum. The cancellation expresses the normalized coefficient differences as a positive weighted sum of two-by-two unsigned-Stirling minors. A coefficientwise derivative quotient and a shift-transfer integral then apply the identity to all positive real shifts.

Unsigned Stirling-number total positivity, log-concavity of its rows, the rising-factorial Vandermonde identity, and ordinary summation by parts are classical ingredients. They are not claimed as new. The proof includes the order-two Stirling positivity argument it needs, so it does not depend on an unproved conjectural positivity theorem.

The finite checks in `verify.py` are diagnostics. The proof does not restrict the degree, assume integer shifts, impose the Pólya-frequency hypothesis, or infer an infinite statement from sampled cases. It makes no claim about simultaneous coefficient expansion in $x,\alpha,\beta$ beyond the stated result for each fixed positive pair of shifts.

## Internal review

The parent agent derived the marked-cycle cancellation. The analysis agent checked it independently, developed the derivative and tail reductions, and wrote the proof. A separate combinatorics agent audited the cancellation, label-count prefactor, surviving ranges, and the orientation of the Stirling minor. The full written proof and source comparison received a separate internal review. The repository retains the exact diagnostic verifier and the discussion in [issue #89](https://github.com/1337isnot1337/solved-conjectures/issues/89).

These are internal mathematical checks. They are not journal peer review, and no author endorsement is implied.

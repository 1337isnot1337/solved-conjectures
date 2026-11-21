# Zhu’s generalized Jacobi–Stirling conjecture

Prior-resolution review conducted 21 November 2026. The search found no earlier proof or disproof of the exact unweighted Hankel-total-positivity statement. This records the sources and search scope; a negative search result cannot establish absolute priority.

## Exact statement and normalization

1. Bao-Xuan Zhu, *Coefficientwise Hankel-total positivity of the row-generating polynomials for the output matrices of certain production matrices*, Advances in Mathematics 444 (2024), 109695. DOI: https://doi.org/10.1016/j.aim.2024.109695 . Author manuscript: https://arxiv.org/pdf/2202.03793 (version 2, 22 April 2024). Section 5.2, printed page 24, equation (5.10), defines the recurrence with coefficient one on the entry in the previous column and quadratic weight on the same column. The next paragraph explicitly conjectures coefficientwise Hankel total positivity of its unweighted row polynomials. It retrospectively attributes the conjecture to the author in 2018. The journal pagination and the manuscript pagination differ: Deb points to journal page 26.
2. Bishal Deb, *Positivity problems in enumerative and algebraic combinatorics*, Theme 1, problem P1.9: https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html . The page currently labels the exact conjecture open and gives the recurrence, initial conditions, unweighted row sum, three indeterminates, and Zhu attribution. It also distinguishes the older log-convexity results. This is evidence about the recorded status, not a substitute for checking the original source.
3. In the 2024 paper, Proposition 5.7 proves the factorial-weighted sequence, with entries multiplied by k!. This changes the coefficient in the previous-column recurrence term from one to k. It does not imply the unweighted statement. Both the proposed disproof and the independent checker use the unweighted recurrence throughout.

## Closely related literature examined

| Source | Actual relevant result or scope | Relation to the target |
|---|---|---|
| Zhu, *Some positivities in certain triangular arrays*, Proceedings of the AMS 142 (2014), 2943–2952, DOI https://doi.org/10.1090/S0002-9939-2014-12008-9 ; author-uploaded text https://www.researchgate.net/publication/289527040_Some_positivities_in_certain_triangular_arrays | Theorem 2.1 is total positivity of the lower triangular array; Theorem 2.4 is row real-rootedness; Theorem 2.7 and Corollary 3.3(ii) give strong q-log-convexity. | None is the claimed positivity of all orders of Hankel minors of the row sequence. The full author-uploaded text was inspected. The direct AMS PDF returned an access error. |
| Zhu, *q-log-convexity from linear transformations and polynomials with only real zeros*, European Journal of Combinatorics 73 (2018), 231–246, https://arxiv.org/pdf/1609.01544 , DOI https://doi.org/10.1016/j.ejc.2018.06.003 | Section 4.2 treats Jacobi–Stirling transformations and strong q-log-convexity. | No Hankel statement was located in the full manuscript. The 2018 date for the conjecture is therefore cited through the 2024 paper's retrospective statement. |
| Andrews, Egge, Gawronski and Littlejohn, *The Jacobi–Stirling numbers*, Journal of Combinatorial Theory A 120 (2013), 288–303, https://www.ericegge.net/papers/JS.pdf , DOI https://doi.org/10.1016/j.jcta.2012.08.006 | Combinatorial interpretations, recurrence identities, real-rootedness and related properties of Jacobi–Stirling numbers. | The full manuscript has no occurrence of “Hankel” or “moment”. Its row table agrees with the recurrence used in the proof after the parameter substitution. |
| Mongelli, *Total positivity properties of Jacobi–Stirling numbers*, https://www.sciencedirect.com/science/article/pii/S0196885811000911 | Total positivity of Jacobi–Stirling triangles and Pólya frequency properties of rows and columns. | Lower triangular and Toeplitz positivity are different from Hankel positivity of the sequence of row polynomials. The bibliographic record and the account in Zhu 2014 were checked; no claim of a full-text audit of this item is made. |
| Zhu, *Stieltjes moment properties and continued fractions from combinatorial triangles*, Advances in Applied Mathematics 130 (2021), 102232, https://arxiv.org/pdf/2007.14924 | Criteria for triangles with a different recurrence whose coefficients are affine in n and k, along with an additional second previous-column term. | The full manuscript has no Jacobi–Stirling or central-factorial discussion. It supplies no resolution located for the quadratic unweighted triangle. |
| Zhu, *Coefficientwise total positivity and Stieltjes moment properties from Riordan arrays*, Journal of the London Mathematical Society (2026), https://doi.org/10.1112/jlms.70450 | Riordan-array criteria and Fuss–Narayana–Riordan applications. | The current publisher record does not report a Jacobi–Stirling resolution. Only the publisher record and available text were screened; this is not claimed as an exhaustive theorem-by-theorem audit. |
| Zhu, *Coefficientwise Hankel-total positivity from a universal cumulant lifting*, https://arxiv.org/pdf/2611.01172 (2026) | Universal cumulant criteria, functional-digraph polynomials, tree families, and other lifted sequences. | The full 80-page manuscript was screened; no Jacobi–Stirling discussion or exact resolution was located. |

The distinctions in this table matter. A lower triangular coefficient array can be totally positive and its row polynomials can be real-rooted and strongly log-convex, while the Hankel matrix of those row polynomials has a negative third-order determinant. The explicit polynomial in PROOF.md demonstrates precisely this situation.

## Search coverage

Both available public-web search engines were used, including the stronger engine for primary-source and current-status checks. Queries included the following exact phrases and combinations, with hyphen, en-dash, and unhyphenated name variants:

```text
"Jacobi-Stirling" "Hankel" counterexample conjecture
"Jacobi-Stirling" "Hankel" "counterexamples"
"Jacobi–Stirling" "counterexample"
"Jacobi-Stirling" "negative coefficient"
"Jacobi-Stirling" "counterexample" "moment"
"Jacobi-Stirling" "Hankel" "3x3"
"Jacobi-Stirling" "Hankel" "-4"
"Jacobi Stirling" "Hankel" "negative"
"generalized Jacobi" "total positivity" conjecture
"generalized Jacobi-Stirling" "false"
"generalised Jacobi" "Hankel" disproved
"Zhu" "Jacobi-Stirling" "disproved"
"Zhu" "Jacobi-Stirling" "conjecture" 2026
"Jacobi-Stirling" "conjecture" "Hankel" 2025 2026
"Legendre-Stirling" "Stieltjes" negative
"central factorial" "Stieltjes moment" "polynomials"
"central factorial" "Stieltjes" counterexample
"central factorial" "Hankel" "polynomials"
"Some positivities in certain triangular array" pdf
"Stieltjes moment properties and continued fractions from combinatorial triangles" arxiv
```

Searches also included the full 2024 paper title, the DOI, site-restricted searches of public mathematical solution archives, and GitHub issue searches for Jacobi–Stirling with Hankel. The returned nearby material concerned different row-real-rootedness problems, triangle total positivity, strong log-convexity, or the already-proved factorial-weighted sequence.

GitHub code search was used on the public solution repositories `PrincipiaMathOrg/math-solutions`, `KnowledgeSense/math`, `pudim-project/pudim-ai-demo-zetalaw`, `the-omega-institute/trureturing`, and `qqliu/CoPEER`. The broad query `Jacobi Stirling Hankel` returned unrelated files where separate terms occurred; exact quoted queries `"Jacobi-Stirling"`, `"Jacobi–Stirling"`, `"Jacobi Stirling"`, and the pair `"central factorial" "Hankel"` returned no matching files in those repositories. These search results are subject to the connector's indexing and matching limits.

The repository's existing research and relevant issues were checked to avoid counting an existing result. Issue 163 records this candidate and its independent review. Related targets ruled out earlier in this research campaign, such as the already-resolved Kadankova–Simon–Wang infinite-divisibility question and Ulgenes's inverse-gamma conjecture, are not counted as new resolutions.

## Review conclusion

The exact original statement, independent current catalog, and normalization all match the symbolic disproof. The checked literature and public solution archives did not reveal an earlier resolution. That supports recording the disproof as a new result subject to external priority corrections. The mathematical assertion itself is the all-parameter polynomial identity in PROOF.md and does not depend on the completeness of a literature search.

## Reproduction

Run `python verify.py` in this directory. It uses only Python's standard library. The expected output includes the five nonzero terms with exponent triples `(a,b,x)`:

```text
[((0, 3, 3), 2), ((1, 2, 3), 12), ((2, 0, 4), -4),
 ((2, 1, 3), 22), ((3, 0, 3), 12)]
```

The checker builds each coefficient from the recurrence, forms the rows, and computes the determinant from its six permutations. This differs from the row-operation derivation in the written proof.

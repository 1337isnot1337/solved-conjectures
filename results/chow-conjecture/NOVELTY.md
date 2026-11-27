# Literature and priority audit

## Catalogue classification, 27 November 2026 UTC

Chow defines interlacing using non-strict inequalities in §2 and asks about consecutive ordinary type-D Eulerian polynomials in §5. For ranks at least three, Savage and Visontai’s Lemma 3.14 and proof of Theorem 3.15 identify the preceding total with the first member of the ordered next row. Corollary 2.6 interlaces that member with the sum, using exactly the weights in their proof of Theorem 2.7. The elementary rank-two pair completes Chow’s weak statement. Yang and Zhang state the required row theorem and first-entry identity together in Theorem 2.5 and equation (11). These published results determine the weak assertion regardless of whether it was restated under Chow’s name. [Chow, §§2 and 5](https://doi.org/10.1016/j.jmaa.2022.126019) · [Savage–Visontai](https://arxiv.org/html/1208.3831v3) · [Yang–Zhang, p. 10](https://zhangbiaomath.github.io/papers/2022-jaco-Eulerian.pdf#page=10)

The repository credits Cinna Davis and GPT-6.2 Astra with the explicit deduction and the separate strictness proof for ranks three and above. The internal review checked the orientation, absence of a common row zero, signs and exceptional initial pair. A fresh check of Ma’s full text confirms that Theorem 1 compares types A, B and D within one rank. Searches for the exact consecutive statement, strict interlacing, A066094 and formal-library records found no earlier explicit strict theorem in the sources inspected. The strict result and its unweighted Lean proof are retained as an unranked supplement. [Independent internal review](https://github.com/1337isnot1337/solved-conjectures/issues/77#issuecomment-7047457111) · [Classification review](https://github.com/1337isnot1337/solved-conjectures/issues/77#issuecomment-7207226708) · [Ma’s Theorem 1](https://arxiv.org/html/2608.02357v1) · [Lean receipt](../../docs/verification/lean-chow-20261121/receipt.json)

Yang and Zhang’s 2017 Theorem 3.7 gives ordered interlacing *inside* each positive-parameter refined row. The weighted research note adapts the strictness proof to consecutive totals, with the sole exception at rank two and parameter one. Its weight counts negative entries after the first position. It remains a separate written extension. [Yang–Zhang’s weighted theorem](https://doi.org/10.1137/16M1084651) · [Research note](https://github.com/1337isnot1337/solved-conjectures/blob/46a5bf1913dc3f2b44fbb1f78583f3eb0e157b30/research/chow-type-d-weighted/weighted-extension.md)

## Original search record

Checked: 20 November 2026. Target: consecutive interlacing of ordinary type-D Eulerian polynomials for every rank. This record distinguishes the target from the real-rootedness of one polynomial, interlacing inside a refinement row, half Eulerian polynomials, derangement polynomials, and within-rank relations between types A, B and D.

## Sources inspected

| Source | Relevant result or status | Effect on this note |
| --- | --- | --- |
| Savage–Visontai, *The s-Eulerian polynomials have only real roots*, arXiv:1208.3831v3; Trans. AMS 367 (2015), 1441–1466 | Lemma 3.14 gives the refinement recurrence; the proof of Theorem 3.15 gives compatibility of both the unshifted and x-shifted pairs for all rows of rank at least four. Lemma 2.5 translates those two conditions to ordered pairwise interlacing. Corollary 2.6 handles nonnegative sums. Theorem 2.7 uses the first-entry/sum argument for s-Eulerian polynomials. | These are the main published ingredients. No new compatibility theorem is claimed. The proof of the present weak assertion is a direct deduction. |
| Yang–Zhang, *Descent generating polynomials and the Hermite–Biehler theorem*, doi:10.1007/s10801-021-01101-2 | Theorem 2.5 states pairwise interlacing of the refined type-D row. Equation (11) states that the first entry of row n+1 equals twice D_n. Their Theorem 1.3 concerns D_n and the affine type-B polynomial at the same rank. | The ingredient identities were explicitly in print before Chow's question. Their stated type-D/affine-type-B conclusion is different from consecutive type-D interlacing. |
| Chow, *New proofs of interlacing of zeros of Eulerian polynomials*, JMAA 510 (2022), 126019, doi:10.1016/j.jmaa.2022.126019 | Section 2 uses weak interlacing. Section 5 says computation supports consecutive type-D interlacing and calls an alternative proof approach a subject for further research. | Confirms the exact named target and that the author did not present it as resolved there. The full author-uploaded text was inspected. |
| Ma, *The half interlacing property among the types A, B and D Eulerian polynomials*, arXiv:2608.02357 | Proves simple negative zeros for D_n, n >= 3, and within-rank half interlacing between A, B and D. | Simplicity of individual D_n is already known and is not claimed as new. This within-rank theorem does not itself state the consecutive conclusion. Abstract and specialist theorem statement were checked; full PDF retrieval was unavailable in this session. |
| Alexandersson, *Real-rooted polynomials: open problems* and *Real-rooted polynomials from permutation statistics*, dated 19 November 2026 | Lists Chow's consecutive type-D interlacing assertion as open; explicitly distinguishes it from Ma's within-rank theorem. | Current specialist status evidence. A catalogue can be stale, so it is not used as the sole priority check. |

## Searches performed

Both search engines were used. Searches included the exact name and variants of:

- Chow's conjecture interlacing;
- type D Eulerian polynomials consecutive interlacing proof;
- type-D consecutive interlace;
- type D Eulerian Sturm sequence;
- D_n(x), D_{n+1}(x), interlaces;
- strict interlacing Eulerian polynomials of type D;
- the refined identity T_{n+1,0} together with interlacing;
- current-year proof and counterexample variants.

Primary papers and their definitions were read, rather than relying on result snippets. These searches found the papers above, the known half-interlacing results, and no prior paper explicitly resolving Chow's consecutive assertion. This is a bounded literature audit, not a proof of worldwide novelty.

## Attribution and precise contribution

The written deduction establishes the full quantified statement. Its weak form is a short consequence of an already published stronger refinement theorem, through a summation argument also used in that paper. The strict form adds a row-common-zero exclusion and an elementary root-sign argument. The note does not claim the refined recurrence, compatibility theorem, or individual real-rootedness and simplicity as new.

Because the implication is short, the defensible wording is: a complete explicit proof of the assertion recorded as open by Chow and the current specialist catalogue, obtained from Savage–Visontai's established results. It would be misleading to present this as a new general interlacing method or to assert that no one had previously noticed the implication.

## Links

- [Savage–Visontai full text](https://arxiv.org/html/1208.3831v3).
- [Yang–Zhang author PDF](https://zhangbiaomath.github.io/papers/2022-jaco-Eulerian.pdf).
- [Chow DOI](https://doi.org/10.1016/j.jmaa.2022.126019).
- [Chow author-uploaded full text](https://www.researchgate.net/publication/358198956_New_proofs_of_interlacing_of_zeros_of_Eulerian_polynomials).
- [Ma preprint](https://arxiv.org/abs/2608.02357).
- [Current specialist open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm).
- [Current specialist type-A/B/D discussion](https://www.symmetricfunctions.com/realRootedWords.htm).

## Additional public-record check after a catalog false positive

A separate binomial Eulerian audit found explicit October 2026 prior proofs even though the same specialist catalog still listed that target as open; see [the prior formal proof](https://github.com/PerAlexandersson/RealRooted/pull/1685). We therefore repeated the Chow audit against public issue and pull-request records.

GitHub issue and pull-request searches for A066094 returned no prior result. Searches for Chow, type-D Eulerian, and type-D interlacing in PerAlexandersson/RealRooted found Chow-ring results, coordinator polynomials, and broader research programs, but no explicit proof of consecutive ordinary type-D Eulerian interlacing. In particular, [issue #2511](https://github.com/PerAlexandersson/RealRooted/issues/2511) proves real-rootedness for a different recurrence class and explicitly says consecutive interlacing is false for that class; [issue #2003](https://github.com/PerAlexandersson/RealRooted/issues/2003) is an open cross-degree ordering program, not a proof of this target.

The linked research repository and downstream OEIS repository were not accessible through the public search interface, so their contents were not inspected. Fresh web searches for A066094 with interlacing and for Chow's consecutive assertion returned the primary sources already listed above, without a new explicit prior resolution. This extends the bounded audit; it does not remove the priority caveat or turn a catalog label into proof of novelty. No Lean code was run, changed, or verified.

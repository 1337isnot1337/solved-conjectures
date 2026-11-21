# Source and prior-resolution audit

Audit date: 2026-11-21 UTC. This document distinguishes the source statement, earlier ingredients used in the proof, nearby results, and the search for an earlier resolution. It does not establish publication priority beyond the material inspected.

## Exact target and scope

The primary source is Maria Dospolova, Mikhail Germanskov, and Dmitry Zaporozhets, [*On Steiner entire function*, arXiv:2507.11626v1](https://arxiv.org/html/2507.11626v1), submitted 15 July 2025. The [arXiv record](https://arxiv.org/abs/2507.11626) displayed only version 1 during this audit and no journal reference.

[Conjecture 3.6](https://arxiv.org/html/2507.11626v1#S3.SS4) concerns positive sequences beginning with 1. Its inequalities are non-strict. Its sufficiency direction asserts existence of an infinite-dimensional GB-set with exactly the prescribed entire intrinsic-volume sequence. The introduction explicitly reserves GB-set for a nonempty convex compact set in a separable real Hilbert space, with finite first intrinsic volume. The proposed sequence is therefore within the conjecture's stated hypotheses; no strict-inequality assumption is inserted or removed.

The family $`a_k=c^k/k!`$, $`c>0`$, meets every inequality with equality. Our obstruction applies to every member and to all GB compact convex sets, including those with discontinuous isonormal processes. It is a complete disproof of the stated sufficiency assertion. It does not settle a modified conjecture restricted to strict inequalities or to a closure of intrinsic-volume sequences.

## Published ingredients and normalization

Richard A. Vitale, [*Intrinsic volumes and Gaussian processes*](https://doi.org/10.1017/S0001867800010831), Advances in Applied Probability 33 (2001), 354–364, provides the published ingredients. The available [lecture packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf) contains 31 pages of slides followed by the complete 11-page published paper. We used the original article, printed pages 356–357, which are PDF pages 34–35 when counted from 1. Some earlier slides omit normalization factors and are not the basis for our formulas.

The published article defines local oscillation as half the limiting local range. Sudakov's identity is $`V_1=\sqrt{2\pi}\,\mathbb E\sup X`$. The normalized quasi-width is $`m_j=jV_j/(\sqrt{2\pi}V_{j-1})`$. Vitale's Theorem 3 identifies its limit with maximal local oscillation. The independent reviews initially checked these constants in the extracted primary text. A payload audit established that the initial web page-image requests had returned placeholders; the earlier visual-inspection claim was withdrawn. Subsequently, the original PDF was obtained locally and its rendered printed page 356 was independently viewed. **Theorem 1 visibly uses the nonstrict bound** $`V_j(K)\leq V_1(K)^j/j!`$. The lower bar is unambiguous, so this theorem does not itself exclude the proposed factorial family. See [SOURCE_GLYPH_GATE.md](SOURCE_GLYPH_GATE.md) for the full correction history.

Our additional argument is the strict inequality between maximal deterministic local oscillation and half the expected global range. It uses the global range's domination of all local ranges, a countable sequence of deterministic points approaching the maximal local oscillation, and a nondegenerate Gaussian increment with unbounded support. Vitale's quoted theorem is not presented as a new result.

## Long's earlier results: a material comparison

Yusen Long's [*Hyperbolic embedding of infinite-dimensional convex bodies*, arXiv:2305.13428v3](https://arxiv.org/html/2305.13428v3), dated 26 September 2024, predates the conjecture. This is the closest additional primary source found. Its subject is the second intrinsic volume, mixed-volume equality, and completion of a hyperbolic embedding. It contains enough ingredients for another short deduction excluding the same sequence.

Specifically, Theorem 1.2 states

```math
V_2(K)=\pi\bigl(\mathbb E h_K(X)^2-\mathbb E\|Dh_K(X)\|^2\bigr).
```

After translating the Steiner point to zero, Lemma 4.8 removes the first Wiener chaos of $`h_K(X)`$. Proposition 4.9 then gives

```math
\mathbb E\|Dh_K(X)\|^2\geq2\mathop{\mathrm{Var}}(h_K(X)).
```

Combining these displayed results gives

```math
V_2(K)\leq\pi\bigl((\mathbb E h_K(X))^2-\mathop{\mathrm{Var}}(h_K(X))\bigr).
```

For a nontrivial centered set, there is a nonzero $`t\in K`$, and $`h_K(X)\geq X_t`$. Thus the support random variable has unbounded upper support and positive variance. Sudakov's identity consequently yields the strict necessary condition

```math
2V_2(K)\lt V_1(K)^2.
```

This deduction would also exclude $`c^k/k!`$. Long's Corollary 4.13 and Remark 4.6 independently explain why a positive constant random support function is a completion object rather than the support function of a GB convex body. We disclose this comparison because it substantially limits the amount of new mathematics needed to resolve the 2025 statement.

The inspected source does not state the strict intrinsic-volume inequality above, the sequence-realizability conjecture, or its refutation. Its displayed (4.12) is the non-strict inequality $`V_2\leq V_1^2/2`$ with a diameter-dependent upper estimate. Theorem 1.3 characterizes equality in the mixed second-volume Alexandrov–Fenchel inequality, a different statement. Thus this is a deduction from earlier ingredients, not a claim to have reproved an already stated DGZ resolution. If an earlier explicit strict inequality or equivalent realizability obstruction is located, this package must be reclassified accordingly.

The final adversarial check specifically looked for a stated formula $`d(O,[K])=\mathop{\mathrm{arcosh}}(V_1(K)/\sqrt{2V_2(K)})`$ together with exclusion of $`O`$ from the embedded GB bodies. Such a pair would already express an equivalent strict obstruction. The introduction and Remark 4.6 do explicitly exclude $`O`$. The inspected v3 text does not display the distance-to-$`O`$ formula: equation (3.7) gives the distance between two actual GB bodies, and Sections 3.D and 4.D discuss the completion point. The distance-to-$`O`$ formula can instead be deduced by passing to the normalized-ball limit in equation (1.2). This is another short deduction from Long's machinery, which we disclose rather than describing it as an explicit earlier statement.

The [journal record](https://link.springer.com/article/10.1007/s10711-024-00957-5) gives acceptance on 23 September 2024 and publication on 15 January 2025 in *Geometriae Dedicata* 219, article 17. Its full text is subscription-only in the available page; only the primary arXiv v3 of 26 September 2024 was inspected in full. The author's research-page request timed out. Those access limits leave the published version uninspected.

## Current and nearby papers checked

The same three authors' [*Regularity of Gaussian processes, metric entropy and the Wills functional*, arXiv:2611.21460v1](https://arxiv.org/html/2611.21460v1), dated 16 November 2026, is a particularly relevant current source. We inspected its abstract, main results, relation to prior work, Gaussian-process conventions, intrinsic-volume inequalities, and relevant proof sections, and searched its complete HTML for conjecture, strictness, and sufficiency language. It concerns entropy, regularity, and growth exponents. Proposition 2.6 still states the non-strict intrinsic-volume inequalities. Its discussion of a refuted conjecture refers to Gao–Vitale, not Conjecture 3.6 of the 2025 paper. No resolution of the sequence-realizability statement was located there.

Jaouad Mourtada's [*Quantitative characterization of Gaussian small ball probabilities*, arXiv:2611.17071v1](https://arxiv.org/html/2611.17071v1), dated 12 November 2026, was also checked. We read the main geometric scope and Section 3.3 on recovering an ultra-log-concave sequence from its generating function, as well as the nearby extreme-case discussion. The results provide estimates for Gaussian small-ball probabilities and intrinsic volumes. The general ultra-log-concave lemma in Section 3.3 does not assert that every such sequence is geometrically realizable. No DGZ reference or strict realizability obstruction was found in the inspected material.

The [Math-Net author record](https://www.mathnet.ru/eng/person34864) and its [June 2026](https://www.mathnet.ru/eng/present50872) and [March 2026](https://www.mathnet.ru/eng/present49295) talks entitled *On Steiner entire function* were inspected. The talk pages contain bibliographic metadata but no proof or status update. The Steklov staff page failed to load, and the arXiv author-list endpoint was unavailable. These gaps are not treated as negative evidence.

## Repository and public-solution checks

The target was not present in the local repository's Markdown when searched for the authors, title, and arXiv identifier. The current remote HISTORY was also fetched and searched. Searches of accessible GitHub issues for the exact arXiv identifier and author names found no earlier target thread; after the reservation, the matching target thread is our [issue #199](https://github.com/1337isnot1337/solved-conjectures/issues/199). Broader Steiner-title searches were manually distinguished from unrelated Steiner-tree and Hadwiger material.

The public [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog/tree/ca8d4d44ba3db527f19f28928c240168f545ecfe) was inspected at commit `ca8d4d44ba3db527f19f28928c240168f545ecfe`, whose complete, nontruncated tree contains 2,033 entries. Our lane checked the source indexes D, G, and Z and both geometry problem-file parts; the coordinating lane then fetched and searched all 26 source-letter indexes. No DGZ author, title, or identifier match appeared in those inspected files, and our geometry-file search found no matching ultra-log-concave-sequence entry. An issue search in that repository for Dospolova returned no matches. This bounded catalog check is separate from the broad web searches of public solution sites.

[MathDB entry 369313](https://mathdb.com/p/369313/conjecture-on-ultra-log-concave-intrinsic-volume-sequences) lists the same assertion and zero solutions. Its progress summary says it has never been refreshed. It was used as a discovery aid, not as evidence that the conjecture remains unresolved.

Two additional public proof archives were checked after they led to exclusions of other candidate problems. The complete 28-entry tree and README of [xzwwwwww/math](https://github.com/xzwwwwww/math/tree/93f15f5e04e25384d5eb3661bbfe53bac850f25f), pinned at `93f15f5e04e25384d5eb3661bbfe53bac850f25f`, contain no DGZ name, title, or identifier match. The [mxym/math](https://github.com/mxym/math) README was also searched for those terms without a match. These are bounded file checks, not claims to have inspected every proof in those repositories.

## Search coverage and conclusion

Both available search engines were used. Queries included the complete author combination; the exact title and arXiv identifier; Conjecture 3.6; counterexample, disproof, refutation, and solution terms; intrinsic-volume sequence realizability; strict Gaussian-bounded intrinsic-volume inequalities; factorial and Poisson equality cases; and Blaschke-diagram/Hilbert-space formulations. Domain-restricted queries covered public GitHub, Zenodo, and independent mathematical solution archives, including Trure Turing and Principia. Searches were repeated with recent-date filters and without them to capture both new resolutions and older equivalent statements.

No earlier explicit proof, disproof, or equivalent strict realizability obstruction was found in that search. The proposed proof is therefore ready for final integration review, with Long's earlier ingredients prominently disclosed. This conclusion is limited by search indexing and the inaccessible pages noted above. It is not a certification of global novelty or a claim that the required Gaussian-process theorems are new.

# Review and prior work

## Scope and attribution

This is a complete resolution of Conjecture 2.4 of Anders Claesson, Mark Dukes and Einar Steingrímsson, for every $n\ge8$ and for West's deterministic stack-sorting map. Conjecture 2.5 asks for positive polynomial formulas for all fixed distances from the maximum sorting depth and stays open in this contribution.

The contribution was prepared by [@aadrianvv](https://github.com/aadrianvv) with GPT-6.2 Sol. The original enumeration problem belongs to Claesson, Dukes and Steingrímsson. The filtered-prefix reduction, restated in the proof in terms of output before the final flush, is credited to Jerry Zhang, Theorem 2.1.

## Earlier work in the repository

The 25 November Bóna research handoff recorded the inversion-survival and pre-flush excess recurrences, checked exact depth data at small orders, and identified Conjecture 2.4 as an open enumeration target. Its capped-gap signatures missed comparisons between unmarked entries. Its proposed decreasing-tree templates and descent-polynomial fits left the all-order count open. The present proof uses exposure after the rightmost high label to identify exactly which generic gaps require their relative order. It counts the specialization at descent weight one. The descent polynomial and its real-rootedness at the same threshold remain separate questions.

## Internal mathematical review, 2026-11-26

The checker author and coordinating reviewer independently audited the marked-order argument. The reviewer checked inversion survival and the filtered-prefix reduction, survival of a high label, persistence of the exposed suffix, the bound of six constrained generic entries and ten free gaps, and the bijection used for the factorial and weak-composition factors. The reviewer also matched the C# enumeration and its pruning rules to those arguments, including the round-zero shortcut and empty newly exposed gaps.

An independent replay of the enumerator visited all 39,916,800 marked orders and reproduced the ten signed coefficients exactly. The Python verifier checked the boundary orders 11 through 17 and compared the rational polynomial coefficients for the infinite range. A separate direct stack implementation checked every permutation of lengths 8, 9 and 10. The checker author also directly enumerated length 11, with 30,291,408 sortable permutations, agreeing with the symbolic count. No Lean formalization or external refereeing has been completed.

## Prior-resolution search, 2026-11-26

| Source or search | Checked finding |
| --- | --- |
| Claesson, Dukes and Steingrímsson, [arXiv:0812.0143v2, Conjecture 2.4](https://arxiv.org/abs/0812.0143v2) and [Annals of Combinatorics 14 (2010), 45–51](https://doi.org/10.1007/s00026-010-0044-7) | The original formulates both equivalent claims and reports numerical evidence through $n=13$. The proved neighbouring case there is the count for at most $n-4$ passes. |
| Defant, [Fertility Monotonicity and Average Complexity, arXiv:2003.05935](https://arxiv.org/abs/2003.05935) | The introduction credits the $n-4$ case to the original paper. The main results address average complexity and one-pass fertility. |
| Defant, [Highly Sorted Permutations and Bell Numbers, arXiv:2012.03869](https://arxiv.org/abs/2012.03869) | The introduction explicitly mentions the original authors' general near-top conjecture. Theorem 1.1 counts the distinct images of the map $s^{n-m}$, and treats that question as dual to the conjecture. It does not give the sizes of the preimages of the identity under those iterates. |
| Kitaev and Zhang, [arXiv:2503.22067v3](https://arxiv.org/abs/2503.22067v3), revised September 13, 2026 | Theorems 1–2 give descent generating polynomials for $n-3$ and $n-4$ passes. The symbol $A_{n-5}(x)$ appearing on the right of a formula is an Eulerian polynomial of smaller order. The source does not give an $n-5$-pass count. |
| Jerry Zhang, [arXiv:2604.10779v3](https://arxiv.org/html/2604.10779v3), revised June 23, 2026 | Theorem 2.1 identifies the sorting depth through filtered prefixes. The polynomial-time count and appendix concern permutations whose final entry is their least. Section 6 considers related restricted classes. The theorem supplies the structural starting point for the new count. |
| Wen and Yan, [On a conjecture concerning two-stack sortable permutations, arXiv:2610.29115](https://arxiv.org/abs/2610.29115), October 21, 2026 | The paper confirms a different conjecture of Claesson, Kitaev and Steingrímsson about four-statistic equidistribution for exactly the fixed threshold of two stack passes. |
| [FindStat St000028](https://www.findstat.org/StatisticsDatabase/St000028/) | This records the West stack-sorting depth, its algorithm, and small exact generating polynomials, with no closed $n-5$ diagonal formula. |
| Web and arXiv full-text queries | Queried the exact quintic coefficient strings, the equivalent shifted-binomial coefficients, both depth formulations, the DOI and identifier, the three authors with and without diacritics, and alternate terms such as sorting complexity and near-maximal stack depth. The matching coefficient hits were the original article or reproductions. Fixed $t$, popping stacks, revstack sorting, and the distribution of highly sorted outputs are different problems. |
| Catalogue, issues and formal libraries | No exact matching catalogue entry in the public main snapshot 2dfd2a21, the public research catalogue at 0d48ee54 or the inspected local $\texttt{origin/main}$ and $\texttt{origin/research}$ Markdown or Lean files. GitHub issue and PR searches for the identifier and stack-sortable terms in the upstream repository returned no matches. Indexed GitHub and Mathlib searches returned no relevant formal theorem. The catalogue has Dukes’s distinct revstack interlacing result and Defant–Engen–Miller’s Lassalle-sequence refinement, which counts single-pass preimages. |
| Other public GitHub collections | Searches of PrincipiaMathOrg/math-solutions and the-omega-institute/trureturing by authors and identifier returned no matching proof. Global issue and PR searches for the identifier returned no hit. |
| OEIS and citation indexes | Indexed OEIS searches by consecutive exact terms and the statistic returned no matching formula. A direct OEIS term query, OpenAlex DOI API, Crossref API and Semantic Scholar DOI API could not be read through the available web interface. Springer reports 11 citations without exposing a complete citing-paper list in the article view. |

This bounded search found no earlier proof or counterexample for the exact Conjecture 2.4. It does not establish priority or exclude unindexed or unpublished work.

The publication check on 2026-11-26 found no duplicate on upstream main at 9e0cb5a4 or in the current research catalogue, issues and pull requests. The fresh exact-formula web search again led to the original conjecture and its mirrors.

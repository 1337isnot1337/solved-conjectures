# Sun–Zhao: independent priority review

Date: 21 November 2026. Related issue: [198](https://github.com/1337isnot1337/solved-conjectures/issues/198).

## Decision

No earlier proof, disproof, or theorem settling the inspected statement was located in this bounded review. The target is Conjecture 5.2 of Brian Y. Sun and James J. Y. Zhao, *Log-behavior of two sequences related to the elliptic integrals*, [arXiv:1602.04359v4](https://arxiv.org/html/1602.04359v4).

The priority review remains **incomplete**. Keep the counterexample to that explicit arXiv statement outside the strict joint tally until the final conjecture section of the 2020 journal article and the author's linked Maple archive have been read. The unread journal version postdates the inspected arXiv revision, and the archive is a concrete source associated with the authors' computations. Neither is cleared by an unsuccessful retrieval. This recommendation concerns source-version and priority coverage; the mathematical audit is separate.

The existing [NOVELTY.md](../../results/sun-zhao-iterated-ratios/NOVELTY.md) was read in full before this review. Its limitations are retained. The independent [SOURCE_ACCESS.md](SOURCE_ACCESS.md), committed at [b864136886416ac14c168c1f7119621bd843ebe3](https://github.com/1337isnot1337/solved-conjectures/commit/b864136886416ac14c168c1f7119621bd843ebe3), documents the focused follow-up on both inaccessible sources.

## Exact statement and distinctions

The arXiv metadata dates v4 to 10 April 2017. Its concluding section defines

```math
\mathcal R(S)_n=S_{n+1}/S_n
```

on sequences starting at index zero. Conjecture 5.2 requires the iterated ratio sequence to be log-concave for every odd positive iteration order and log-convex for every even positive order, after removing exactly as many initial entries as the order. The sequence here is the Catalan–Larcombe–French sequence. I independently read this statement and its adjacent definitions in the primary HTML. The proposed witness uses order 12 and the retained entries with original indices 12, 13 and 14.

Three distinctions are necessary when searching for prior work:

- The successive-ratio operator is different from the quadratic operator used in papers on repeated log-convexity. A theorem about repeated quadratic differences does not settle Conjecture 5.2.
- First-ratio log-concavity and log-concavity of the sequence of nth roots are weaker, separate assertions. Their published proofs are not resolutions of arbitrary ratio iteration.
- An eventual assertion allowing an unspecified starting index for each order is weaker than the explicit truncation in Conjecture 5.2. Conversely, a counterexample to an untruncated infinite-log-monotonicity assertion need not survive this conjecture's truncation.

Conjecture 5.1 in the same source concerns a quadratic transform of the Fennessey–Larcombe–French sequence; Conjecture 5.3 concerns ratios of that second sequence. This review does not claim either is settled.

## Independent literature checks

The following primary sources were inspected to disambiguate the closest search results. The depth of inspection is recorded rather than describing every item as a complete full-text review.

| Source | Material inspected | Relevance and result |
| --- | --- | --- |
| Chen, Guo and Wang, [*Infinitely Log-monotonic Combinatorial Sequences*, arXiv:1304.5160v2](https://arxiv.org/pdf/1304.5160) | Primary PDF abstract, introduction, operator definition, Theorem 2.1, concluding conjectures; full extracted-text search for `Larcombe` | The operator is indeed the relevant ratio operator. The infinite results stated there concern Bernoulli numbers, ordinary Catalan numbers and central binomial coefficients. The final eventual conjectures name other combinatorial sequences. No `Larcombe` text match occurred. This source supplied no resolution of the target. |
| Hou and Zhang, [*Asymptotic r-log-convexity and P-recursive sequences*, arXiv:1609.07840](https://arxiv.org/pdf/1609.07840) | Primary PDF abstract, introduction, exact operator definition and the Catalan–Larcombe–French passage on printed page 10 | Its operator is the quadratic difference. Its Catalan–Larcombe–French result is eventual repeated quadratic log-convexity. Neither the operator nor the explicit starting-index claim matches Conjecture 5.2. |
| Sun and Wu, [*Two-log-convexity of the Catalan-Larcombe-French sequence*, J. Inequal. Appl. 2015, 404](https://link.springer.com/article/10.1186/s13660-015-0920-0) | Primary publisher full-text definition, Theorem 1.1 and Conjectures 3.2–3.3 | The main result is quadratic two-log-convexity. One final conjecture is repeated quadratic log-convexity; the other is first-ratio log-concavity. They must not be conflated with the later all-order ratio statement. |
| Sun, Hu and Wu, [*Proof of a conjecture of Z-W Sun on ratio monotonicity*, J. Inequal. Appl. 2016, 272](https://link.springer.com/article/10.1186/s13660-016-1221-y) | Primary publisher definition (1.1), Conjecture 1.1 and Theorems 1.2–1.5 | This is a different binomial-sum sequence, denoted by S. Its references include the target preprint, which explains its appearance in exact-source searches. It does not settle the Catalan–Larcombe–French ratio conjecture. |
| Zhu, [*Higher order log-monotonicity of combinatorial sequences*, arXiv:1309.6025v2](https://arxiv.org/abs/1309.6025) | Primary arXiv metadata and abstract; the attempted PDF read failed | The abstract describes second-ratio results for several other named sequences, eventual infinite log-monotonicity of derangement numbers, and Gamma-function examples. No target resolution was stated in the inspected material. This is an abstract-level scope check, not a full-text clearance of every theorem. |
| Ning and Zheng, [*On a conjecture of Chen-Guo-Wang*, arXiv:1508.01793v2](https://arxiv.org/abs/1508.01793) | Primary arXiv metadata and abstract | The conjecture proved concerns a zeta–Gamma function; the further sequence results concern Bernoulli and tangent numbers. Search snippets mixing citations to Zhao's nth-root paper were misleading. No target resolution is stated in the inspected primary abstract. |
| Feng-Zhen Zhao, [*The log-behavior of some sequences related to the Catalan-Larcombe-French sequence and the Fennessey-Larcombe-French sequence*, JCMCC 103 (2017), 237–248](https://combinatorialpress.com/article/jcmcc/Volume%20103/vol-103-paper-18.pdf) | Primary publisher-indexed abstract; PDF opened but yielded no readable text in this review | The abstract lists squares, factorial multiples, differences and ordinary monotonicity. The package's earlier audit records additional selected-page inspection. This independent review does not upgrade that to a complete full-text exclusion. |

Searches through both available web engines included exact paper title and identifier, author names with the conjecture number, the sequence name with `counterexample`, `disproof`, `iterated`, `ratio`, `log-monotonic`, and `infinite log`. The closest returned papers are separated above. Results labelled “Sun's log-concavity conjecture” often concern nth roots; results labelled “infinitely log-convex” often concern the quadratic operator. ResearchGate's combined citation and related-paper snippets were used only as leads, not as evidence of a theorem's scope.

## Public proof records and catalogs

The independent GitHub issue searches included:

- `"1602.04359"` globally;
- `Larcombe` globally, with a limit of 100 results;
- `"Catalan" "Larcombe" "ratio"` globally;
- `"Sun" "Zhao" "ratio" "conjecture"` globally, with a limit of 50;
- `"log-monotonic" "counterexample"` globally, with a limit of 50;
- `"Larcombe" "log"` within `the-omega-institute/trureturing`.

The broad `Larcombe` search returned 21 issues. The mathematically relevant external hits concerned Otmani's congruences, Schulte's Catalan row sum, Karp's fractional-degree Legendre inequality, and unrelated research records that cited congruence papers. The exact-source query returned no issues even though our new issue 198 contains the identifier; this inconsistency demonstrates that an empty result is not an exhaustive absence certificate. The two broad 50-result queries included much unrelated material and are not claimed to exhaust all matching public issues. No global code-search clearance is claimed: that endpoint was not usable within the shared search quota.

A potentially serious false positive was followed to its concrete records. [TT issue 9833](https://github.com/the-omega-institute/trureturing/issues/9833) and [PR 9907](https://github.com/the-omega-institute/trureturing/pull/9907) report a complete “Sun Conjecture 5.2” proof, merged on 25 September 2026 at [f742f235e01f3ad69e4af12f9467da7a1aac27c7](https://github.com/the-omega-institute/trureturing/commit/f742f235e01f3ad69e4af12f9467da7a1aac27c7). Their full issue and PR bodies identify **arXiv:2608.13192v1**, two negative-domain Turán inequalities for different polynomial sequences. They are not the 2016 Sun–Zhao paper or its ratio iteration. No Lean verification was performed or relied upon in clearing this mismatch.

[TT issue 23075](https://github.com/the-omega-institute/trureturing/issues/23075) was another hit. Its source and statement concern Karp's 2011 fractional-degree Legendre Turán inequality. Its Catalan–Larcombe–French mention occurs in a search log for unrelated congruence work. The target is therefore different, without any need to judge the correctness of that separate proof.

The public [Open Math Problems Claimed to Be Solved with AI catalog](https://aimath.robertj1.com/) was retrieved. Its displayed update is 28 September 2026. Searches of that retrieved text found no `Larcombe`, `1602.04359`, `Sun–Zhao`, or `log-monotonic` match. This is only a bounded catalog check, and the displayed update predates the current review. MathDB entries were treated as discovery aids; an unrefreshed entry with no submitted solution is not evidence of current openness.

## Unclosed source leads

The later article is [*Acta Mathematicae Applicatae Sinica, English Series* 36 (2020), 590–602, DOI 10.1007/s10255-020-0952-1](https://link.springer.com/article/10.1007/s10255-020-0952-1). Its accessible preview does not include the concluding conjectures. It therefore does not establish that Conjecture 5.2 survived publication unchanged, or that the journal text contains no relevant correction or observation. The focused access review examined the publisher, journal and concrete institutional routes without obtaining the full text.

[Zhao's author page](https://cam.tju.edu.cn/~zhao/) links [FLF_log.zip](https://cam.tju.edu.cn/~zhao/soft/FLF_log.zip). The page was read, but the ZIP was not. The focused worker's single permitted public-network retrieval failed at the connector level before returning archive bytes or an HTTP status; it was not retried. No archive member, computation, comment, date or stored counterexample was inspected. The failed retrieval provides no evidence about the contents.

No complete forward-citation database export was obtained. Some related works received only an abstract or selected-section check, as marked above. The absence of a located prior result must remain a statement about the inspected evidence, not a claim of worldwide priority.

## Recommendation

Preserve the exact counterexample, its mathematical review and this audit as documented work on the explicit arXiv assertion. Describe the result as a disproof of that inspected statement with priority and journal-version checks incomplete. Do not add it to the strict count on the strength of failed source access. Reconsider the priority decision when the two concrete source leads are readable; no additional numerical testing addresses those gaps.

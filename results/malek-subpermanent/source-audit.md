# Malek's subpermanent conjecture: source and priority audit

Audit date: 2026-11-20 (America/Chicago). Researcher: combinatorial lane.

## Exact target

Let $`A`$ be an $`n\times n`$ doubly stochastic matrix, let $`J_n`$ have every entry $`1/n`$, and let $`\sigma_k(A)`$ be the sum of the permanents of all $`k\times k`$ submatrices. The historical conjecture is

```math
\sigma_k(A)\geq \sigma_k\left(\frac{nJ_n-A}{n-1}\right)
\qquad(n\geq2,\ 1\leq k\leq n).
```

The $`k=0`$ convention would add only the identity $`1=1`$. The $`k=1`$ assertion is also an identity. The $`k=n`$ assertion is the Marcus–Minc conjecture, already proved in Lavi's 2026 preprint. The prospective new contribution must cover every remaining degree and every order, rather than claim the already resolved permanent case.

**Audit conclusion:** the exact all-degree negative-transform conjecture is historically documented. No full prior resolution was found in the searches and texts inspected below. This is a bounded literature-search conclusion, not a proof that no inaccessible or unindexed resolution exists. The complete text of Malek's three-page 1989 article was not obtained; its publisher abstract and the explicit statement in the 2005 primary survey were obtained.

## Source chain and eligibility

The [live Minc-list Conjecture 3 page](https://yair-lavi.com/mincs-list/conjecture-3/index.html) states the permanent inequality and marks it proved. Its reference 6 is Malek's 1989 paper. Its earlier-progress paragraph records Malek's normal-matrix spectral-sector case. The page does **not** explicitly state the all-subpermanent conjecture.

The [Minc-list index](https://yair-lavi.com/mincs-list/) directly links Cheon and Wanless's survey. In that [author-hosted primary PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), Section 5, printed page 324, the paragraph following Conjecture 3 attributes to Malek the displayed all-$`k`$ conjecture, equation (9). It gives the exact transform above and cites reference [56], the 1989 article. The survey records the normal spectral-sector and near-$`J_n`$ cases, then distinguishes Malek's later conditional implication from Holens–Đoković.

Thus this is a named historical subsidiary in the site's linked Minc literature. It is not an invented strengthening. It is also not a separate numbered Minc entry, and is not literally stated as a separate target on the live numbered page. Any catalogue entry must state this scope. A proof cannot be counted as a new resolution of numbered Conjecture 3.

Primary bibliographic record:

- M. Malek, *A note on a permanental conjecture of M. Marcus and H. Minc*, Linear and Multilinear Algebra **25** (1989), 71–73, [DOI 10.1080/03081088908817929](https://doi.org/10.1080/03081088908817929).
- [Publisher abstract](https://www.tandfonline.com/doi/abs/10.1080/03081088908817929): confirms a stronger version for normal doubly stochastic matrices with eigenvalues in the sector $`[-\pi/(2n),\pi/(2n)]`$. The displayed formula is an image in the indexed abstract.
- The publisher's online date, 30 May 2007, is a digitization date. The article is from volume 25 (1989), and was received 22 April 1988. Several secondary indexes misleadingly display the online date as the publication date.

## Nearby assertions that must not be conflated

| Assertion | Scope | Status relevant to this audit |
|---|---|---|
| Marcus–Minc | $`k=n`$, negative transform $`(nJ_n-A)/(n-1)`$ | Proved by Lavi in 2026; not a new result here |
| Malek 1989 | Every $`k`$, that single negative endpoint | Exact present target; no full prior resolution located |
| Malek 1990 interval statement | Every $`k`$ and every $`t\in[0,n/(n-1)]`$, comparing $`\sigma_k(A)`$ with $`\sigma_k(tJ_n+(1-t)A)`$ | Stronger than the single endpoint; its equivalence with Holens–Đoković is reported in the abstract and later literature |
| Holens–Đoković | $`nk\sigma_k(A)\geq(n-k+1)^2\sigma_{k-1}(A)`$ | False in general; its failure alone does not refute Malek's single endpoint |
| Kopotun 1996 transform | Every $`k`$, positive transform $`(nJ_n+A)/(n+1)`$ | Proved by Lavi in 2026; distinct sign and denominator |
| Radial convexity/monotonicity | Inequalities along an entire positive radial interval | Different quantifiers and generally stronger requirements |

The 1990 paper is *On the convex combinations of matrices and the sum of subpermanents*, Linear and Multilinear Algebra **26** (1990), 293–297, [DOI 10.1080/03081089008817986](https://doi.org/10.1080/03081089008817986). The publisher's table of contents and some indexes list Malek and H. Minc; Cheon–Wanless cites Malek alone. The full original text was unavailable, so no bibliographic inference about Minc's role is made here. The reported equivalence is corroborated by [Wanless's original 1999 paper](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf), printed page 274, which explicitly separates the stronger monotonicity assertion from Marcus–Minc.

## Later primary publications checked

### Malek 1991 and 1992

[Malek 1991](https://www.tandfonline.com/doi/abs/10.1080/03081089108818078), *On the monotonicity of the sum of subpermanents of doubly stochastic matrices*, Linear and Multilinear Algebra **29**, 291–297, concerns radial monotonicity on restricted intervals. The indexed abstract omits one displayed interval, so this audit does not reconstruct it. It does explicitly specify the permanent interval $`[0,3/4]`$ in order four. This abstract does not announce an all-degree negative-endpoint theorem.

[Malek 1992](https://www.sciencedirect.com/science/article/pii/0024379592900418), *Notes on permanental and subpermanental inequalities*, Linear Algebra and its Applications **174**, 53–63, [DOI 10.1016/0024-3795(92)90041-8](https://doi.org/10.1016/0024-3795(92)90041-8), proves a maximum-over-matrices statement for $`\sigma_k(tA+(1-t)J_n)`$ and positive-interval convexity results. A maximum over all stochastic matrices is not the desired pointwise comparison between a matrix and its transform. The abstract does not announce that comparison in full.

### Low-degree literature

[Kopotun 1994](https://www.tandfonline.com/doi/abs/10.1080/03081089408818290), *On some permanental conjectures*, Linear and Multilinear Algebra **36**, 205–216, explicitly proves Holens–Đoković at degree $`k=4`$ for every $`n\geq5`$. The publisher abstract also records related low-degree zero-diagonal minimization results. The degree-three Holens–Đoković result is due to Đoković; it is documented in Section 3.4 of [Troanca's 2008 thesis](https://mspace.lib.umanitoba.ca/server/api/core/bitstreams/5f1b99a6-487f-4308-91e8-0ff0c3b4e7b1/content).

[Kopotun 1996](https://www.sciencedirect.com/science/article/pii/0024379594002282), *A note on the convexity of the sum of subpermanents*, Linear Algebra and its Applications **245**, 157–169, [DOI 10.1016/0024-3795(94)00228-2](https://doi.org/10.1016/0024-3795(94)00228-2), studies global and radial convexity. The complete [author-hosted paper](http://home.cc.umanitoba.ca/~kopotunk/Publications/k-laa.pdf) was subsequently obtained and read in the [independent audit addendum](priority-audit-addendum.md). Theorems 1–3 cover degree-two and degree-three convexity, degree-four radial estimates, and normal spectral-sector matrices. Section 4, Remark 1, printed page 167, explicitly poses the **positive** transform conjecture. The body does not state a full negative-endpoint theorem. The distinction is now confirmed from the primary text.

No explicit primary all-order negative-transform theorem for $`k=4`$ was located. A degreewise use of the 1990 equivalence was therefore not assumed. The separate elementary proof below covers all degrees needed in orders at most four, once the known permanent endpoint is supplied.

### Lavi 2026: exact versions and scope

1. [The Marcus–Minc Transform Inequality](https://arxiv.org/abs/2609.29262), submitted 24 September 2026, has only v1 in the inspected arXiv submission history. Its [HTML body](https://arxiv.org/html/2609.29262v1), [author page](https://yair-lavi.com/publications/marcus-minc-transform-inequality/index.html), and [Hexagon PDF 2611.00352v1](https://hexagonmath.org/pdf/2611.00352v1) were inspected. Theorem 1.1 is the permanent inequality. Lemma 3.1 is an all-degree estimate for centered matrices, but the paper does not state Malek's full all-degree endpoint conclusion. The centered estimate is prior work and must be credited if used.

2. [The Kopotun Subpermanent Transform Inequality](https://yair-lavi.com/publications/kopotun-subpermanent-transform-inequality/index.html), original date 11 October 2026, is also available as [Hexagon 2611.00201v1](https://hexagonmath.org/pdf/2611.00201v1). Both that PDF and the [author-hosted PDF](https://yair-lavi.com/publications/kopotun-subpermanent-transform-inequality/paper.pdf) were inspected. The transform is explicitly $`(nJ_n+A)/(n+1)`$ throughout its theorem. Its text search has no occurrence of “Malek.” Proposition 4.1 supplies $`7/(12n)`$ in the pointwise capacity estimate; Theorem 1.2 uses $`7/(12n^2)`$ in the normalized subpermanent lower bound. Neither states the stronger coefficient proposed in the present campaign. The author page links [Zenodo DOI 10.5281/zenodo.23294960](https://doi.org/10.5281/zenodo.23294960); that landing page was not retrievable.

3. The author's current publication list and recent searches identify the Wang positive-permanent transform as the other direct follow-up. The complete four-page [Wang paper, Hexagon 2611.00298v1](https://hexagonmath.org/pdf/2611.00298v1), was inspected: Theorem 1.1 compares the permanent of $`A`$ with that of $`(nJ_n+A)/(n+1)`$. It does not assert the all-degree negative endpoint. Its arXiv deposit is 2609.31794. The public follow-up index [In the wake of AI papers](https://kimballmartin.github.io/ai-wake/) lists Wang and Kopotun, including duplicate arXiv/Hexagon deposits, as the Marcus–Minc follow-ups through 13 November. This index was used only to find primary papers; its coverage date does not exclude later work. Additional searches through 21 November found no Malek endpoint paper.

4. [Udayan–Somasundaram 2024](https://www.degruyterbrill.com/document/doi/10.1515/spma-2024-0006/html), *Lih Wang's and Dittert's conjectures on permanents*, discusses the related radial inequalities and cites Kopotun's papers. It does not present a full negative-transform subpermanent theorem. The 2024/2025 article [New inequalities for permanents and hafnians and some generalizations](https://doi.org/10.1080/03081087.2024.2436061) cites Malek 1992 and Kopotun 1996 for subpermanent inequalities; its accessible body/abstract did not identify a resolution of the target.

## Elementary completion in degrees at most three

This calculation is included to avoid relying on an uninspected degreewise consequence of the 1990 equivalence. It is a component of an eventual all-degree proof, not a separately counted result.

Put $`X=A-J_n`$ and $`h=1/(n-1)`$. Zero row and column sums give

```math
\sigma_2(X)=\frac12\sum_{i,j}x_{ij}^2,
\qquad
\sigma_3(X)=\frac23\sum_{i,j}x_{ij}^3.
```

For the second identity, expand the sum over ordered triples of row and column indices and remove collisions by inclusion–exclusion. Any singleton row or column class vanishes by the zero line sums; the only surviving partitions have all three indices identified, giving $`2!^2/3!=2/3`$.

Since $`x_{ij}\geq-1/n`$, termwise $`x_{ij}^3\geq-x_{ij}^2/n`$. Hence

```math
\sigma_3(X)\geq-\frac4{3n}\sigma_2(X).
```

The centered expansion gives

```math
\begin{aligned}
\sigma_2(J_n+X)-\sigma_2(J_n-hX)
&=(1-h^2)\sigma_2(X),
\\ \sigma_3(J_n+X)-\sigma_3(J_n-hX)
&=\frac{(n-2)^2}{n}(1-h^2)\sigma_2(X)
 +(1+h^3)\sigma_3(X)
\\ &\geq\left[\frac{(n-2)^3}{(n-1)^2}
-\frac4{3n}\left(1+\frac1{(n-1)^3}\right)\right]\sigma_2(X).
\end{aligned}
```

For $`n\geq4`$, the first term in brackets increases with $`n`$ and the subtracted term decreases. Its value at $`n=4`$ is $`44/81>0`$. Therefore the degree-three comparison is strict away from $`J_n`$ in every order $`n\geq4`$. In order three the degree-three statement is the known Marcus–Minc permanent case. Degree two is strict away from $`J_n`$ when $`n\geq3`$ and is an identity when $`n=2`$.

## Search record and limits

Both available web search engines were used. Query families included the exact 1989 and 1990 titles/DOIs; “Malek subpermanents conjecture”; “Marcus–Minc subpermanent”; “subpermanent negative transform”; complement inequalities; proper subpermanents with $`k<n`$; and recent 2026 follow-ups to the Marcus–Minc and Kopotun papers. Recent searches used both one-year and fourteen-day filters. Domain-restricted queries covered arXiv and GitHub. The live list, numbered page, author publications, full 2005 survey, 1999 counterexample paper, current 2026 papers and accessible earlier publisher abstracts were cross-checked.

Direct publisher PDF attempts for Malek 1989 returned 403 or an inaccessible-URL response. Malek 1990 full text and the linked Zenodo landing page were also unavailable. Search indexes sometimes omit displayed formulas and conflate first publication with later online dates; no missing formula was guessed. ResearchGate and other secondary indexes were discovery aids, not substitutes for a primary proof.

### Public repository follow-up audit

Direct GitHub code searches supplemented the web searches. Global query strings included `Malek subpermanent`, the exact 1989 DOI, `Marcus Minc subpermanent`, `subpermanent transform`, and `negative transform subpermanent`. Scoped searches covered `ajt60gaibb/OpenProblemsInNLA`, `tamnd/arxiv`, `AlexenderSokolov/cross-theory-formal-database`, `pedromnasc/dittert-conjecture-proof`, and the campaign repository. No full negative-transform subpermanent theorem was returned. These searches have the usual indexing limits; in particular, the campaign repository's indexed commit lagged its live branch, so an empty code-search result is not evidence of an empty repository.

The only mathematical global search hit for the exact Malek phrase was a [TeX mirror of Lavi's Marcus–Minc paper](https://github.com/AlexenderSokolov/cross-theory-formal-database/blob/3b9207c03d9dc146f393f68bcb683bbc4583979a/editable-corpus/sources/211649/source0.tex). Its theorem and the relevant all-degree lemma were read. The main theorem remains the permanent endpoint; the all-degree statement is the centered estimate. A source comment calls the mirrored text an arXiv v2 derived from a different internal version. The official arXiv submission history inspected in this audit lists only v1, so that comment was not treated as an official new version or priority record.

A separate public [sub-Dittert research project](https://github.com/pedromnasc/dittert-conjecture-proof/tree/main/subdittert) appeared under transform searches. Its README and source notes were inspected, including the explicit limits of its claims. It concerns the Cheon–Hwang row/column-sum functional and partial one-zero-face bounds; it does not claim the Malek endpoint. The README explicitly leaves the intermediate general sub-Dittert cases unresolved. Its transform helper names do not constitute an unindexed proof of the present target. The inspected README and source-notes blob hashes were respectively `3a07a9b57c31339c5c147e75e67e8f397597e52d` and `34f7e6e32d0d97b78eb4debe840c6252b5e4f1ff`.

The audit supports working on the exact all-degree endpoint as an apparently unresolved named historical conjecture. It does not support labelling it a newly solved numbered Minc entry, or claiming an exhaustive proof of priority.

### Independent citation and full-text follow-up

The [priority-audit addendum](priority-audit-addendum.md) records a renewed search for Malek's original paper, matching four-work citation lists from two independent indexes, full access to Kopotun's 1996 paper, and inspection of Lavi's newer stable-polynomial Dittert application. The [normalized citation responses](priority-citation-records.json) make the returned coverage inspectable. No earlier full negative-endpoint theorem was found in these sources. The complete 1989 Malek paper and the 1994 Kopotun scan remain unread in this follow-up, so those access limits are retained. This strengthens the bounded audit without changing the subsidiary scope or the resolved-entry count.

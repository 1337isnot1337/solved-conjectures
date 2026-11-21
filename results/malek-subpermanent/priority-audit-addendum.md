# Malek's conjecture: independent priority audit addendum

Audit date: 20 November 2026 (America/Chicago). Scope: source access and prior resolution, not a new mathematical review.

## Finding

The additional search found no earlier full proof of

```math
\sigma_k(A)\geq\sigma_k\!\left(\frac{nJ_n-A}{n-1}\right)
\qquad(A\in\Omega_n,\ n\geq2,\ 0\leq k\leq n).
```

The full 1989 Malek article remains unavailable. This audit therefore does **not** remove the original-source access qualification in [the original source audit](source-audit.md). It strengthens the later-paper check by obtaining the full 1996 Kopotun paper and independently querying two citation indexes. Neither a new numbered Minc result nor an exhaustive priority certificate follows.

## Original article and available-copy search

The [publisher record](https://www.tandfonline.com/doi/abs/10.1080/03081088908817929) identifies Massoud Malek, *A note on a permanental conjecture of M. Marcus and H. Minc*, *Linear and Multilinear Algebra* **25** (1989), 71–73. The title is misrendered as “Mine” in the publisher's metadata. Searches used both spellings. The abstract describes a stronger inequality under a normal-matrix spectral-sector hypothesis. It does not supply the full conjecture statement in readable text.

The publisher's ordinary PDF endpoint returned HTTP 403 through both research browsing and a separate public-network request. Its ePDF endpoint was also inaccessible. The author's former `mcs.csueastbay.edu/~malek/` website could be traced through public references, but its host did not resolve in the independent request. Searches of the university's present and former domains and its institutional repository produced no article copy.

The [Crossref DOI record](https://api.crossref.org/works/10.1080/03081088908817929) dates the article to July 1989 and supplies only the publisher PDF. [OpenAlex work W2014741189](https://api.openalex.org/works/W2014741189) reports closed access, no open-access URL, and no repository full text. The [Semantic Scholar DOI record](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1080/03081088908817929?fields=title,openAccessPdf,externalIds,citationCount) likewise reports no open PDF. These are availability records, not evidence that no unindexed copy exists.

The exact all-degree statement remains independently readable in Cheon–Wanless, [author PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), printed page 324, equation (9), where it is attributed to Malek's 1989 article. This page separately records spectral-sector and near-uniform cases. The [live C3 page](https://yair-lavi.com/mincs-list/conjecture-3/index.html) states the permanent case and marks it resolved. Thus the existing distinction between the subsidiary conjecture and numbered C3 remains necessary.

## Citation graph checked independently

The [OpenAlex citing-work query](https://api.openalex.org/works?filter=cites:W2014741189&per-page=100) and the [Semantic Scholar citation query](https://api.semanticscholar.org/graph/v1/paper/79b9f51a4eb0497477d7e00f22276864fef26272/citations?fields=title,year,externalIds,openAccessPdf&limit=100) each returned four works, with the same mathematical documents:

| Work | Year | Audit disposition |
|---|---:|---|
| Kopotun, *A note on the convexity of the sum of subpermanents* | 1996 | Full author-hosted PDF obtained in this audit; see below |
| Cheon–Wanless, *An update on Minc's survey of open problems involving permanents* | 2005 | Exact negative endpoint is stated as a conjecture |
| Troanca, *Permanents of doubly stochastic matrices* | 2008 | Already inspected in the original audit |
| Lavi, *The Marcus–Minc Transform Inequality* | 2026 | Already inspected; main theorem covers the permanent endpoint |

The normalized responses are saved in [the saved citation records](priority-citation-records.json). The queries exhausted their returned pages. This does not exhaust all published citations: citation databases may omit works, versions, and references.

## Newly obtained primary full text

Kopotun's [institution-linked academic page](https://home.cc.umanitoba.ca/~kopotunk/index.shtml) leads to his [publication list](https://home.cc.umanitoba.ca/~kopotunk/publications.shtml), which links the full [1996 paper](http://home.cc.umanitoba.ca/~kopotunk/Publications/k-laa.pdf). All thirteen pages of its extracted body were inspected, including the final remarks and references.

Theorems 1–3 concern degree-two and degree-three convexity, degree-four radial estimates, and normal matrices with a spectral-sector condition. Section 4, Remark 1, printed page 167, poses Conjecture 2 for the **positive** transform `(nJ_n+A)/(n+1)`. It does not prove the full negative endpoint. The original audit's distinction is confirmed from the body of the source, rather than only its abstract and Lavi's description.

The same author list supplies the [1994 paper](http://home.cc.umanitoba.ca/~kopotunk/Publications/k-lma.pdf), but its scan had no extracted text and the page images were not retrievable. This audit does not claim to have read that full paper. Its abstract-only access qualification remains.

An additional recent primary check covered Lavi, [*A Dittert-like inequality for homogeneous stable polynomials*](https://hexagonmath.org/pdf/2611.00197v1), dated 29 October 2026. Its main theorem and Section 9.2 were inspected. The subpermanent application is a deficit inequality involving row and column sums; for doubly stochastic matrices it reduces to the Tverberg lower bound. It does not state the Malek negative-transform comparison. The PDF text contains no occurrence of “Malek” or “Kopotun.”

## Search limits and disposition

The additional queries covered the exact 1989 title and DOI, the publisher's title misspelling, the author's institutional pages, negative-transform and complement terminology without Malek's name, and recent subpermanent/capacity/transform publications. Both search engines were used; recent searches included 30-day and 365-day windows. The author's 1991/1992 abstracts, the live C3 page, and Lavi's current publication list were rechecked.

No correction to the proposed theorem's priority wording is justified by these findings. The accurate status remains: a complete proposed proof of the historically documented subsidiary endpoint, with no full prior resolution found in the inspected sources, and the 1989 full text still inaccessible. No new conjecture is counted by this audit.

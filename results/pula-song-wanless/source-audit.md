# Pula–Song–Wanless conjecture: source and novelty audit

Audit date: 2026-11-20 to 2026-11-21 UTC.

## Conclusion and scope

The sources inspected do not contain a proof of the complete noncohesive threshold direction for the two-block family

```math
 V_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&J_m\end{pmatrix},
 \qquad n\ge m+\sqrt m.
```
The proposed proof in `proof.md` addresses every positive integer m and every n>1, proves the threshold including equality, and independently rederives the previously known cohesive and non-barycentric directions. The proposed new contribution is the previously missing general threshold and its full-face uniqueness conclusion. Non-barycentricity is explicitly credited as prior progress.

This is a named subsidiary conjecture discussed under Minc Problems 14 and 15. It is not a characterization of all cohesive or barycentric supports, and must not be counted as a complete solution of either Minc entry. Searches cannot prove the absence of an unpublished or unindexed result. The conclusion is bounded by the public sources described below.

## Primary statements and subsequent papers

### Pula, Song and Wanless, 2011

*Minimum permanents on two faces of the polytope of doubly stochastic matrices*, Linear Algebra Appl. 434, 232–238.

- [Publisher / DOI](https://doi.org/10.1016/j.laa.2010.08.015)
- [Complete author preprint](https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf)

The complete eight-page preprint was read, with images checked where extracted inequality signs were ambiguous. Conjecture 2.1 gives the division at n=m+sqrt(m), with equality on the noncohesive side. The introduction credits previously settled small block parameters. The paper states the cohesive side and the noncohesive direction for n≥2m. Its one-parameter permanent sum is used as a comparison, but rederived independently in the proposed proof.

Theorem 2.1 and its equalization proof were audited separately; see the proof-gap record below. The proposed proof does not assume that theorem or the asserted uniqueness in Theorem 3.1.

### Song, 2013

*Minimum permanents on doubly stochastic matrices with prescribed zeros*, Honam Math. J. 35(2), 211–223.

- [DOI](https://doi.org/10.5831/hmj.2013.35.2.211)
- [Primary PDF](https://koreascience.or.kr/article/JAKO201319133640171.pdf)
- [Primary article page](https://koreascience.or.kr/article/JAKO201319133640171.page)

The public primary PDF was downloaded and extracted in an isolated disposable public-web execution job. It has 13 pages, journal pages 211–223, and 284706 bytes. The complete text was inspected; pages 215, 220, and 222 were then retrieved again to verify the relevant statements. Some secondary metadata gives a different last page; the PDF itself controls here.

Theorem 4.5, page 220, treats V_{4,n} for n≥7. Theorem 4.6, page 222, treats V_{4,6}. These are the m=4 threshold cases, not an unrestricted m result. Remark 2.4, page 215, and Remark 4.4, page 220, identify a diagonal-positivity issue in the earlier reduction. A short exact excerpt from Remark 4.4 is: “the fact that ci > 0 was assumed”. The surrounding text identifies Theorem 2.1 of its reference [6], the 2011 paper, and explains why positivity needs proof. No later result of this paper is imported into the new proof.

### Cheon and Song, 2024

*A conjecture on minimum permanents*, Czechoslovak Math. J. 74, 273–282.

- [DOI](https://doi.org/10.21136/CMJ.2023.0186-23)
- [Complete primary PDF](https://dml.cz/bitstream/handle/10338.dmlcz/152279/CzechMathJ_74-2024-1_15.pdf)
- [Journal article page](https://articles.math.cas.cz/10.21136/CMJ.2023.0186-23)

The complete text was inspected. It gives further special cases, including V_{4,5} and V_{4k,7k} for k≥2; Theorem 3.4 is the latter family. Its abstract describes the conjecture as established for some cases. It does not give the unrestricted threshold. Its restatement of the 2011 reduction does not repair that reduction for purposes of the present proof; an independent argument is used instead.

### Song and Beasley, 2023 online / 2024 issue

*A face of the polytope of doubly stochastic matrices*, Linear Multilinear Algebra 72(10), 1612–1624.

- [DOI / publisher abstract](https://doi.org/10.1080/03081087.2023.2190073)
- [Publisher page](https://www.tandfonline.com/doi/full/10.1080/03081087.2023.2190073?needAccess=true&scroll=top)
- [Author-deposited MathSciNet review record](https://r-libre.teluq.ca/3617/)
- [Review PDF, MR4766049](https://r-libre.teluq.ca/3617/1/4766049_PDF.pdf)

The publisher abstract specifies a three-block support with an additional zero-block parameter l. The full article could not be obtained from its public publisher page. The complete indexed text of the MathSciNet review by Frédéric Morneau-Guérin was retrieved from his university repository. The review explicitly states l≥1, m≥2, n≥2, l<n. Thus it excludes the l=0 specialization that would recover the two-block PSW family. The review reports the outer parameter ranges and the special l=2k,m=7k,n=6k family, rather than the whole intervening threshold range.

This scope conclusion distinguishes direct primary abstract inspection from the review's fuller description; it does not claim full-text verification of the article. The review contains an apparent transcription issue in one matrix entry, so only its explicit parameter restrictions and theorem ranges are used here.

### Gurvits and Leake, 2026

*Unique Minimizers for Permanents, Mixed Discriminants, and Log-concave Polynomials*, arXiv:2609.21083, v2 revised 2026-10-15.

- [Primary HTML](https://arxiv.org/html/2609.21083v2)
- [Primary abstract](https://arxiv.org/abs/2609.21083)
- [ECCC report TR26-191](https://eccc.weizmann.ac.il/report/2026/191/)

The main statements and the prescribed-zero-face discussion in Section 1.4 were read. The results concern unique minimizers under near-doubly-stochastic marginal constraints and strongly log-concave polynomials. Section 1.4 cites PSW2011 and Song–Beasley2024, describes cohesive faces as a separate open direction, and expressly says attempts to apply the paper's techniques to those faces produced no new result. It does not resolve the PSW threshold. This source was checked because it is a recent permanent-minimization paper and explicitly discusses the relevant literature.

## Current Minc-list pages

- [Problem 14: characterizing cohesive matrices](https://yair-lavi.com/mincs-list/problem-14/index.html)
- [Problem 15: characterizing barycentric matrices](https://yair-lavi.com/mincs-list/problem-15/index.html)

Both pages were read directly again on 2026-11-21 UTC. Both full characterization problems are marked open. Problem 14 cites the PSW/Song/Cheon–Song families as partially decided and adds other progress, but makes no all-parameter PSW threshold claim. Problem 15 expressly states non-barycentricity of every V_{m,n} with m,n≥2 and identifies this as completing the cohesive-but-not-barycentric half together with the previously known cohesiveness theorem. That prior assertion is credited throughout the candidate proof. No threshold claim was found in the current displayed progress sections.

## The reduction gap and independent repair

The initial candidate draft cited the 2011 equalization theorem. Detailed source checking changed that dependency. In the available preprint, formula (4) is simplified using cofactor identities that hold at the candidate minimizer. The subsequent variation of two parameters treats that simplified formula as if those identities remained valid along the variation. Recomputing the permanent with fixed remaining entries does not justify that inference. The diagonal-boundary issue noted by Song2013 is an additional reason not to import the theorem without proof.

The revised proof replaces the equalization step. For the relevant minor polynomial it derives

```math
 q(y)=m!\prod_i(D_i+b_i^2\partial_y)y^m.
```
This polynomial has only nonpositive real roots, hence q'(y)^2≥q(y)q''(y). Combined with the cofactor identities and inequalities at a minimizer, it rules out two distinct cross-block parameters, including the zero-diagonal boundary. The argument uses only identities at the candidate minimizer and never varies their simplified versions. Full-face uniqueness is then proved separately by rectangular completion and equality in the ordinary van der Waerden theorem.

The parent agent and both other research agents independently checked the operator coefficient, the derivative factors, the cofactor inequality direction, positivity of the minor used in division, the m=1 endpoint, and the rectangular completion factor. No remaining mathematical gap was identified in those reviews. This is internal review, not external peer review.

## Search coverage and limits

The audit used both available web indexes and direct primary pages. Representative query families included:

- Exact names and title: `Pula Song Wanless conjecture`, `Minimum permanents on two faces`, `A conjecture on minimum permanents`.
- Statement-specific terms: `cohesive permanent threshold`, `n m sqrt(m) permanent`, `Laguerre Pula Song Wanless`.
- Citation chasing: the 2011, 2013, 2023/2024, and 2024 DOIs; Wanless's publication page; primary journal and author-preprint links.
- Current work: `Pula Song Wanless 2026`, recent cohesive/barycentric papers, arXiv, ECCC, GitHub, and the current Lavi pages.
- Technique overlap: stable polynomials, capacity, prescribed-zero permanent minima, and real-rooted coefficient distributions.

The user repository was compared before work and at the parent's integration checkpoints; no existing PSW threshold solution was identified there. A separate 2026 Dittert repository's source notes mention the older PSW reduction and its parameter assumptions, but contain dimension-specific Dittert work, not a general PSW threshold proof. That repository was treated as a pointer, not as authority for the mathematics.

The Song–Beasley article remains checked through its primary abstract plus a complete professional review, rather than its inaccessible full text. Publicly unindexed or unpublished work cannot be excluded. No author was contacted, and no email was sent. These are the remaining coverage limits, not mathematical dependencies of the candidate proof.

## Supplemental public-repository searches

An additional [repository source audit](../../research/minc/repository_prior_art_audit.md) records exact-author and DOI searches, narrower searches in five public proof archives, and the closest mathematical bodies inspected. No earlier matching full theorem was identified in those results. Capped searches and incomplete indexing prevent an exhaustive-priority conclusion. The existing access limits and provisional novelty assessment remain in force.

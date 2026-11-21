# Sources and scope checks

Date: 2026-11-21. This file supplements [PRIOR-AUDIT.md](PRIOR-AUDIT.md), which records the independent web and archive searches, exact catalogue blobs, and comparison statements.

## Exact target

Rui A. C. Ferreira and Thomas Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1), Remark 5(b), printed page 14, proposes increasing dependence on $\alpha$ of $E_{\alpha,\alpha}(-1)$ throughout $0<\alpha<1$. The notation is

```math
E_{\alpha,\beta}(z)=\sum_{n=0}^{\infty}\frac{z^n}{\Gamma(\beta+\alpha n)}.
```

The conjecture is an assertion for the entire interval. [AUDIT.md](AUDIT.md) verifies that the candidate proof establishes the full assertion with strict inequality.

Equation (8) of the source supplies the integral representation used in the proof. Its derivative at argument one gives the required diagonal value. The independent review checked that no factor of $\alpha$ is missing.

## Quantile attribution

Lancelot F. James, [*Lamperti-type laws*, Annals of Applied Probability 20 (2010), 1303–1340](https://arxiv.org/pdf/0708.0618), [DOI 10.1214/09-AAP660](https://doi.org/10.1214/09-AAP660), Proposition 2.3(ii), equation (2.13), gives the quantile used here. The displayed inverse distribution function is a classical ingredient, not a new formula claimed by this work. Its parameter derivative and its application to the paired function in the proof are given explicitly in the manuscript.

James's Section 2.5 also describes logarithms of Lamperti variables and their hyperbolic characteristic functions. The relevant section and the exact quantile proposition were read directly from the primary PDF. No exact diagonal monotonicity assertion was identified there.

## Stable-mixture and stable-ratio follow-ups

The focused Lamperti searches returned Nomvelo Karabo Sibisi's [*Distributions based on Stable Mixtures and Gamma-Stable Convolutions*, arXiv:2507.06665](https://arxiv.org/abs/2507.06665). Its archived source was inspected at [this pinned source file](https://github.com/AlexenderSokolov/cross-theory-formal-database/blob/3b9207c03d9dc146f393f68bcb683bbc4583979a/editable-corpus/sources/181281/source0.tex), blob `dc68cfb348f7768645d9718a92941cb02380f4c0`. It concerns mixture and convolution representations. No occurrence of the exact conjecture, Ferreira–Simon attribution, source identifier, or logarithmic peakedness assertion was found in that source.

A later concrete lead was Nomvelo Karabo Sibisi and Sibusiso Sibisi, [*Representation-free Densities of Ratios and Powers of Stable Variables*, arXiv:2609.22952](https://arxiv.org/abs/2609.22952), first posted 19 September 2026; an indexed record identifies version 3. Direct requests for the arXiv PDF and HTML, both unversioned and versioned, failed with `DisabledError`. The abstract was available through web search.

The archived version-3 statement and proof extraction was then obtained from [tamnd/arxiv](https://github.com/tamnd/arxiv/blob/e8cb5df247e0be403f5989ce429cca249ead7178/analysis/objects/2609/2609.22952.md), blob `5775a0318462d89ede8308439ea693473b74fa00`. All labeled definitions, remarks, theorem, corollary, and proposition statements in that extraction were inspected. They give moments, density representations, and Laplace/Stieltjes transforms of stable products, ratios, and occupation-time variables. They do not assert parameter monotonicity of $E_{\alpha,\alpha}(-1)$ or a logarithmic peakedness theorem. A text search of the entire extraction found no `Ferreira`, `Simon`, `2512`, `conject`, or `peaked` occurrence; its only monotonicity-language occurrence concerns complete monotonicity in the Laplace variable of a different expression.

This resolves the specific later-paper lead at the level of the available extracted statements. It is not a claim that the blocked original typeset body or every unlabeled paragraph has been inspected.

## Search limits

The independent searches and direct catalogue checks in [PRIOR-AUDIT.md](PRIOR-AUDIT.md) found no exact prior resolution. They include both web engines, focused searches for the exact diagonal target and stronger Lamperti order properties, and public solution archives. Broad GitHub queries were capped and noisy, and are not treated as exhaustive. One global GitHub search for `2609.22952` failed; the failure is not counted as a negative result. A more focused source search and direct retrieval of the version-3 extraction supplied the follow-up evidence above.

These observations support proceeding with the proof while keeping the priority statement bounded: no earlier resolution was found in the sources checked. They do not prove the absence of all unpublished, unindexed, or inaccessible work.

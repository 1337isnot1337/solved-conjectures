# López Pouso–Segura's upper-bound conjectures: priority audit

Audit date: 2026-11-21. Scope: the strict upper bounds in published Conjectures 3 and 7, not the separate Bessel-sequence Conjectures 2, 5 and 8.

## Finding

The searches and direct readings below found no earlier explicit refutation of the two bounds and no earlier stated positive fourth-order correction for the central primary/secondary-node ratio. This is a bounded prior-art finding, not a guarantee of novelty. The full text of one closely related later article remains inaccessible, and global GitHub code searches were rate-limited after the archive-specific searches succeeded.

The underlying high-order asymptotic expansions of Legendre nodes and weights are prior results. In particular, the central-ratio correction can be deduced from the published expansions discussed below. The result should credit those ingredients and claim only the contradiction to the conjectured inequalities and the precise counterexample family.

## Source and exact scope

Óscar López Pouso and Javier Segura, *Uniform relations between the Gauss–Legendre nodes and weights*, Journal of Inequalities and Applications 2025, article 40, published 20 March 2025, DOI [10.1186/s13660-025-03283-w](https://doi.org/10.1186/s13660-025-03283-w).

- [Published full text](https://link.springer.com/article/10.1186/s13660-025-03283-w), Sections 4.1 and 4.3, Conjectures 3 and 7, and Remark 2.
- [arXiv source record](https://arxiv.org/abs/2305.19128), first submitted 30 May 2023, latest displayed version v3 dated 22 January 2025.
- [v3 PDF](https://arxiv.org/pdf/2305.19128), printed pages 12 and 15 for the two conjectures.

The final journal text and v3 PDF were read directly. Both impose strict upper bounds with constant pi squared divided by twelve and the shifted degree parameter. Neither statement restricts the assertion to sufficiently large degree. Remark 2 excludes ratios with both numerator and denominator zero; the even-degree witnesses do not involve that exception. The journal's numerical-validation statement is evidence of the authors' conjecture, not a proof of the inequalities.

Earlier numbering differs because the first preprint had fewer uniform relations. Direct retrieval of v1 was attempted but failed. Searches therefore included source identifier, authors, title, primary/secondary nodes, partial moments, and formulas, rather than relying only on the final conjecture numbers. No specific v1 number is asserted in this audit.

## Previously known asymptotic ingredients

Amparo Gil, Javier Segura and Nico M. Temme, *Fast and accurate computation of classical Gaussian quadratures*, [arXiv:2509.16716v2](https://arxiv.org/abs/2509.16716), 11 December 2025; SIAM Journal on Scientific Computing 48(3) (2026), B289–B316, DOI [10.1137/25M1755448](https://doi.org/10.1137/25M1755448).

The [full preprint](https://arxiv.org/pdf/2509.16716) was inspected, including equation (2.9), printed page 5, the surrounding discussion and the citation to the conjecture paper. The expansions give

```math
x_k=c_k\left(1-\frac{1}{8\kappa^2}
 +\frac{33+28r_k^2}{384\kappa^4}+O(\kappa^{-6})\right),
```

```math
w_k=\frac{\pi}{\kappa}s_k\left(1-\frac{1}{8\kappa^2}
 +\frac{33+84r_k^2+56r_k^4}{384\kappa^4}
 +O(\kappa^{-6})\right),\qquad r_k=c_k/s_k.
```

At the central positive node for even degree, $`c_k=\sin(\pi/(2\kappa))`$ and $`s_k=\cos(\pi/(2\kappa))`$. The ratio of the parenthesized expressions is $`1+O(\kappa^{-6})`$. Consequently the new manuscript's positive fourth-order term also follows from these prior expansions and the elementary Taylor series of tangent. This deduction is the present audit's observation; the inspected paper does not state the contradiction to Conjecture 3 or Conjecture 7.

Gil, Segura and Temme explicitly credit matching expansions to P. Opsomer and D. Huybrechs, *High-order asymptotic expansions of Gaussian quadrature rules with classical and generalized weight functions*, Journal of Computational and Applied Mathematics 434 (2023), 115317, DOI [10.1016/j.cam.2023.115317](https://doi.org/10.1016/j.cam.2023.115317). The conjecture paper also cites that work. These expansions must not be represented as newly discovered here. This audit inspected their presentation and attribution in the later paper, not the complete Opsomer–Huybrechs paper.

## Related work and access limits

### Difference-scheme analysis

López Pouso and Segura, *Analysis of difference schemes for the Fokker–Planck angular diffusion operator*, [arXiv:2308.08950](https://arxiv.org/abs/2308.08950); Computers & Mathematics with Applications 181 (2025), 84–110, DOI [10.1016/j.camwa.2025.01.005](https://doi.org/10.1016/j.camwa.2025.01.005).

The [arXiv full text](https://arxiv.org/pdf/2308.08950) was read at Section 4, printed pages 6–7. It explicitly distinguishes established node/weight facts from proposed further properties, says a complete proof of those further properties is unavailable, and formulates second-order estimates for the mesh quantities. The inspected passage supplies no counterexample to the strict constants. Only the preprint text, not every change in the final journal version, was checked.

### Morel's scheme

López Pouso, Barry D. Ganapol and Segura, *On Morel's Fokker–Planck Angular Differencing Scheme*, DOI [10.1080/23324309.2025.2492685](https://doi.org/10.1080/23324309.2025.2492685), first published online 30 April 2025.

The publisher abstract and [University of Arizona record](https://experts.arizona.edu/en/publications/on-morels-fokker-planck-angular-differencing-scheme/) were read. They concern a convergence framework for difference schemes. The publisher full-text route returned HTTP 403, and the public-copy search did not provide a readable full text. This article is therefore **not fully excluded as possible prior art**. Its abstract contains no notice of a conjecture correction or refutation, which alone cannot settle its contents.

### Author bibliography

[Javier Segura's institutional publication list](https://personales.unican.es/segurajj/publi.html) was inspected through its displayed 2026 entries. The directly relevant later papers are listed above. No listed title announces a correction to the source inequalities. This is only a bibliographic check.

## Repository audit

The current `HISTORY.md`, the existing `results/lopez-pouso-segura-bessel/` search matches, and all comments returned for [issue 177](https://github.com/1337isnot1337/solved-conjectures/issues/177) were checked. The existing package explicitly addresses the complete sign, monotonicity and limit assertions of Conjectures 2, 5 and 8 and excludes finite-degree Gauss–Legendre conjectures. It does not duplicate the proposed disproof here. Unrelated campaign count corrections in that issue do not change this distinction.

Successful code searches for `Pouso` and source identifier `2305.19128` returned no matches in each of:

- [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions);
- [pudim-project/pudim-ai-demo-zetalaw](https://github.com/pudim-project/pudim-ai-demo-zetalaw);
- [the-omega-institute/trureturing](https://github.com/the-omega-institute/trureturing);
- [qqliu/CoPEER](https://github.com/qqliu/CoPEER);
- [KnowledgeSense/math](https://github.com/KnowledgeSense/math).

An additional quoted Gauss–Legendre/conjecture query returned no matches in the same five archives. A broader secondary-nodes query returned unrelated graph, code-analysis and special-function material; its returned filenames and excerpts were inspected and none identified these inequalities. Empty searches are limited by the service's default-branch indexing and query matching.

Global GitHub code searches for the source identifier and author surname were attempted but returned HTTP 429 with a retry delay. Those failures are not counted as negative results. Public-web searches restricted to `github.com` found no earlier refutation; they are weaker than full GitHub coverage.

## Web-query record

More than thirty focused query variants were run across both available search engines, with the stronger engine used for the source and priority checks. Query families included:

- exact title with `correction`, `solved`, `false`, or `counterexample`;
- `"López Pouso" "Segura" conjecture counterexample` and unaccented variants;
- `"Pouso" "Segura" "disproof"`;
- `"2305.19128" counterexample`, `correction`, `solved`, and GitHub-restricted variants;
- both final Conjectures 3 and 7, and older-number variants involving Conjectures 2 and 5;
- `"Gauss-Legendre" "secondary nodes" "counterexample"`;
- `"Legendre" "partial moments" "conjecture"`;
- `"Gauss-Legendre" "partial moments" "bound" "false"`;
- `"Gauss-Legendre" "pi^2/12" "counterexample"`;
- `"Gauss-Legendre" "2/sqrt(3)" conjecture`;
- `"Gauss-Legendre" "secondary" "120" conjecture`;
- `"Legendre" "pi^4" "120" "weights"`;
- the later Morel paper's exact title with `pdf`.

The relevant returns were the original paper and mirrors, its authors' bibliographic records, the related papers above and general quadrature material. No returned source stated a previous exact counterexample or the proposed asymptotic refutation. A currently indexed secondary summary that repeats the conjectured inequalities was not used as status evidence.

## Classification

The mathematical audit and historical audit are separate. The exact witness refutes each universal bound. The all-sufficiently-large-even-degree argument additionally refutes any interpretation of Conjecture 3 as an eventual strict bound. Neither argument refutes the leading asymptotic constant itself or the weaker second-order estimates used in convergence studies. Conjectures 3 and 7 should be packaged together, not split into artificially separate campaign counts. The claimed new contribution remains subject to the explicit full-text and indexing limitations above.


## Additional root search of public issue histories

Global GitHub issue searches were performed separately from code search, because proofs can appear only in issues. The quoted author query returned the present repository's issues 177, 184 and 156 and unrelated Portuguese uses of the ordinary word “pouso”; no other mathematical target matched. The exact DOI suffix query returned only this repository's issues 177 and 184. The source identifier query returned no issues. The broader quoted Gauss–Legendre/conjecture query returned 26 issues; full returned issue bodies were screened, including quantum-Gaussian research and quadrature-software discussions. None outside this repository mentioned the target authors, source identifier, primary/secondary-node bound or partial-moment conjecture.

Global code search is subject to a separate rate limit. Its failed requests are not negative evidence. Several follow-up attempts encountered renewed HTTP 429 responses. No successful global code-search result is claimed. The successful repository-specific searches and global issue searches are recorded separately.

A separate Bessel-specific global issue query returned only the present work and unrelated Karp–Vishnyakova–Zhang and Karp conjectures (TT issues 25199 and 23075). Their Segura references concern modified-Bessel ratios and Ferrers inequalities; the matching passages were read and do not discuss these Gauss–Legendre bounds.

# Boudabsa–Simon’s parameter-monotonicity question: priority exclusion

Audit date: November 21, 2026. Related issue: [186](https://github.com/1337isnot1337/solved-conjectures/issues/186).

**Decision: excluded.** The target is an immediate consequence of an earlier public theorem. The proof written in this research directory is mathematically valid and passed two independent checks, but it is not counted or promoted as a new resolution.

## Exact target

The journal source is L. Boudabsa and T. Simon, *Some Properties of the Kilbas–Saigo Function*, Mathematics **9** (2021), 217, [DOI:10.3390/math9030217](https://www.mdpi.com/2227-7390/9/3/217). Proposition 1 assumes $`0<\alpha\leq1`$ and proves the two special cases $`l=1`$ and $`l=1/\alpha`$. Remark 3 asks whether, for every $`l\leq1/\alpha`$,

```math
m\longmapsto E_{\alpha,m,m-l}(x)
```

decreases for $`x>0`$ and increases for $`x<0`$ on the entire interval $`m>0`$. Both passages were read directly.

The identical question already appears in L. Boudabsa, T. Simon and P. Vallois, *Fractional extreme distributions*, [arXiv:1908.00584v1](https://arxiv.org/pdf/1908.00584), Remark 4.10, printed page 30. This is an earlier formulation of the same target, not a second problem.

## Decisive earlier representation

Principia Math In Progress, *The two hyperbolic bounds for the Kilbas–Saigo function*, manuscript dated **September 17, 2026**, is publicly archived at:

[Full LaTeX manuscript, pinned to commit 34b8b155d7db464ad7306f70b16d3af9cee34501](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-348998/mathdb-348998-solution.tex).

The GitHub commit record dates this archive commit to **October 27, 2026, 02:59:18 UTC**. The fetched file's blob SHA is `e758dfe0dd9eff2adce5240336f9f85ee8da747f`. The whole mathematical text, including its proposed follow-up tasks, was read. The exclusion uses the actual theorem and proof, not a catalogue status label.

For every $`0<\alpha\leq1`$, $`b>0`$ and $`d>0`$, the manuscript constructs the subordinator with exponent

```math
\phi_{b,d}(s)-\phi_{b,d}(0),
\qquad
\phi_{b,d}(s)=\frac{\Gamma(b+ds+\alpha)}{\Gamma(b+ds)},
```

an independent exponential killing time with rate $`\phi_{b,d}(0)`$, and the exponential functional $`I=\int_0^\zeta e^{-S_t}\,dt`$. Its equation labelled `representation` proves the full complex moment-generating identity for $`E_{\alpha,m,r}`$ when $`b=1+\alpha(r-m)>0`$ and $`d=\alpha m`$.

The earlier text includes the explicit positive gamma-ratio kernel, its beta-integral derivation, the ordered-time moment calculation, the entire exponential-integrability argument, the deterministic $`\alpha=1`$ case, and simultaneous strict positivity of the subordinator for every positive time. These ingredients are prior work.

## Exact transfer to the present question

Fix $`\alpha`$ and $`l<1/\alpha`$, and set $`b=1-\alpha l>0`$. In the earlier theorem take $`r=m-l`$ and $`d=\alpha m`$. Let $`S^{(b)}`$ be the process in that theorem for $`d=1`$, and retain its independent killing time $`\zeta_b`$.

The Laplace exponent of $`dS^{(b)}`$ is exactly $`\phi_{b,d}(s)-\phi_{b,d}(0)`$, while its killing rate $`\phi_{b,d}(0)=\Gamma(b+\alpha)/\Gamma(b)`$ does not depend on $`d`$. Therefore the prior theorem gives, on one probability space,

```math
E_{\alpha,m,m-l}(z)
=\mathbb E\exp\left(z\int_0^{\zeta_b}
                  e^{-\alpha mS_t^{(b)}}\,dt\right).
```

The integral strictly decreases with $`m`$, because the earlier proof also establishes $`S_t^{(b)}>0`$ for every $`t>0`$ almost surely and $`\zeta_b>0`$. This proves both requested monotonicities for all $`l<1/\alpha`$. The remaining case $`l=1/\alpha`$ was already proved in Boudabsa–Simon Proposition 1. Thus every part of the question follows from prior results.

The earlier manuscript does not explicitly name Remark 3 or write this final parameter comparison. Its Task 3 concerns **normalized convex orders**, a different proposed follow-up. Nevertheless, the unnormalized order here is a direct deterministic rescaling of its complete representation. Under this campaign's conservative novelty rule, the absence of a separately labelled corollary does not make it a new open problem.

## Other inspected sources and search scope

The following checks preceded the decisive finding. None overrides it.

- The primary original journal article and earlier 2019 preprint were read at the exact statement and probabilistic representation.
- J. Bertoin and M. Yor, *Exponential functionals of Lévy processes*, Probability Surveys **2** (2005), 191–212, [complete primary text](https://arxiv.org/pdf/math/0511265), §3.1 and Theorem 2: the general killed-subordinator moment formula and exponential moments are classical. The gamma-ratio identification does not create a new general exponential-functional theorem.
- D. Karp and A. Kuznetsov, *Extending the Meijer G-function*, [arXiv:2403.05708](https://arxiv.org/pdf/2403.05708), §6.4: inspected the generalized Kilbas–Saigo definition and Propositions 5–6. These give Mellin–Barnes representations. No parameter-monotonicity claim was found in those passages.
- L. Beghin, N. Leonenko, T. Simon and J. Vaz, *Beta-weighted non-local differential operators and related stochastic processes*, [arXiv:2606.03661](https://arxiv.org/pdf/2606.03661): inspected its scope, source citation and text searches. It concerns different operators and was not evidence of an exact resolution.
- L. Beghin, N. Leonenko and J. Vaz, *Relaxation Equations with Stretched Non-local Operators: Renewals and Time-Changed Processes*, J. Theor. Probab. **39**, 22 (2026), [primary article](https://link.springer.com/article/10.1007/s10959-025-01479-w), §2.2 and its stochastic representation: complete monotonicity in the argument and the already known $`l=1`$ representation are distinct from the present parameter question.
- M. Minchev and M. Savov, *Recent developments in exponential functionals of Lévy processes*, [arXiv:2510.19114v2](https://arxiv.org/pdf/2510.19114): scope and targeted searches were inspected. This is background, not an exhaustive check of every paper in its bibliography.
- The complete [trureturing hyperbolic-bound dossier](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Problems/boudabsa-simon-2021-kilbas-saigo-hyperbolic-bounds.md) and its prose proof were read. They resolve the separate hyperbolic-bound Conjecture 4 through scaling equations. Their kernel and full statement were compared directly; they do not state Remark 3. That hyperbolic conjecture was excluded independently.
- GitHub direct reads covered this repository's HISTORY and CONTENTS, the Principia solution manifest, the pudim-project and CoPEER README catalogues, and all 56 KnowledgeSense preprint-directory names. Principia's manifest led to the decisive full manuscript above. A lack of title matches elsewhere was only a title screen.
- More than 30 focused queries across both search engines used the exact function and author names with `monotonicity`, `monotone`, `parameter`, `Remark 3`, `Remark 4.10`, `exponential functional`, `stochastic ordering`, `Bernstein`, `Esscher`, and date or repository restrictions.
- Root's independent GitHub issue searches for `"Kilbas" "monotonicity"` and `"Boudabsa" "monotonicity"` returned the current campaign and trureturing's separate hyperbolic-bound issue. Repository issue search found only our earlier stochastic-order discussion before issue 186 was opened.

Some global GitHub **code** searches were rate-limited. These failures are not negative results. A referenced Koide Figshare item on the different boundary hyperbolic-bound conjecture could not be retrieved; no assertion about its proof is made. Neither gap affects the present exclusion, which rests on an already read, pinned primary theorem covering the required interior representation.

## Repository action

The full proof remains in this research directory with an exclusion banner and prior credit. The independent mathematical audit remains useful, but it does not certify novelty. Issue 186 is closed without promotion. The target contributes **zero** new resolutions to the campaign.

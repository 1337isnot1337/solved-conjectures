# Prior-work audit: Simon's stable-infimum conjecture

Search date: 2026-11-21. Coordination: [issue 175](https://github.com/1337isnot1337/solved-conjectures/issues/175).

## Finding

No earlier proof or disproof of the full parameterwise convex-order assertion was found in the searches and accessible sources below. The exact original statement and the mathematical proof passed independent internal review. This is a bounded priority finding, not a claim that every paper, monograph, or unpublished argument has been checked. No external peer review or exclusive priority is asserted.

The stable factorization and its Mellin transform are prior work. The proposed resolution uses the increase of the two Lévy densities of the logarithm to obtain an independent mean-one multiplier for every pair of parameters. The general implication from such a multiplier to convex order is classical.

## Original statement and version check

**Thomas Simon, *Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), no. 16, 1–25, DOI [10.1214/EJP.v19-3058](https://doi.org/10.1214/EJP.v19-3058).** Both the [final journal PDF](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/3058/3058-16117-1-PB.pdf) and [arXiv:1310.1888v2](https://arxiv.org/pdf/1310.1888) were read directly. Remark 6, journal p13 and preprint pp13–14, proposes

```math
\Gamma(1+\beta)I_\beta\preceq_{\mathrm{cx}}
\Gamma(1+\alpha)I_\alpha
\quad(1/2\le\beta<\alpha<1),
```

where $`I_\alpha`$ is minus the running infimum up to time one of the spectrally negative strictly $`1/\alpha`$-stable process normalized by
$`\mathbb E e^{\lambda X_t}=e^{t\lambda^{1/\alpha}}`$.

The [current arXiv version history](https://arxiv.org/abs/1310.1888) lists v1 (7 October 2013) and v2 (27 January 2014). The final journal remark retains the same full conjecture. Theorem B is the different, oppositely directed comparison of running suprema. Remark 9 and Remark 13(d) contain the different normalized inverse-stable stochastic-order conjecture, now tracked in issue 170. None of those assertions is counted again here.

The final sentence of Remark 6 about a lack of a limit law as $`\alpha\uparrow1`$ is not used. The displayed Mellin transform instead gives $`\mathbb E I_\alpha^s\to0`$ for each $`0\lt s<1`$, hence $`I_\alpha\to0`$ in probability; its first moments are not uniformly integrable. This does not change the conjecture's parameter range or its convex-order assertion.

## Earlier ingredients, explicitly credited

1. **Simon, *Fonctions de Mittag-Leffler et processus de Lévy stables sans sauts négatifs*, Expositiones Mathematicae 28 (2010), 290–298**, DOI [10.1016/j.exmath.2009.12.002](https://doi.org/10.1016/j.exmath.2009.12.002). [Author PDF](https://math.univ-lille1.fr/~simon/Mittag.pdf). This is reference 22 of the original conjecture paper. It establishes the asymmetric-stable factorization used there. The author PDF and journal abstract were accessible; a subsequent repeated extraction request timed out. The proof relies on the exact factorization as also restated in the directly checked 2014 source.

2. **P. Patie and T. Simon, *Intertwining certain fractional derivatives*, Potential Analysis 36 (2012), 569–587**, [arXiv:1008.4713](https://arxiv.org/pdf/1008.4713). Lemma 3.3 and Proposition 3.6, preprint pp13–16, give the Mellin transforms of the multiplicative factor and the stable extremum. After replacing their index by its reciprocal, these are precisely the transforms in the new proof. Both formulas, their ranges, and the subsequent calculation were read directly. The paper proves fractional-operator intertwining and distributional identities; it contains no occurrence of “convex” and no parameterwise ordering theorem of the target type was located. The elementary Mellin derivation in PROOF.md is an exposition of this prior formula, not a claim to have discovered that formula.

3. **A. Kuznetsov and J. C. Pardo, *Fluctuations of stable processes and exponential functionals of hypergeometric Lévy processes*.** [CIMAT report, December 2010](https://www.cimat.mx/BiblioAdmin/RTAdmin/reportes/enlinea/I-10-09.pdf). The report supplies general Mellin formulas and distributions of stable extrema. Its introduction, scope, and searchable text were screened; no convex-order result was found. These transform methods are prior mathematics.

## Later and adjacent sources screened

- **J. Letemplier and T. Simon, *On the law of homogeneous stable functionals*, ESAIM: Probability and Statistics 23 (2019), 82–111**, DOI [10.1051/ps/2018028](https://doi.org/10.1051/ps/2018028). [Final PDF](https://www.numdam.org/item/10.1051/ps/2018028.pdf). The introduction and Corollaries 1.6–1.10 were checked, along with the Mellin/Lévy formulas in Section 2. This concerns integrals up to the first passage below zero, including passage times and stopped extrema. Corollary 1.8 establishes logarithmic infinite divisibility for that functional family. Those variables and parameter factorizations differ from the fixed-time infimum of Remark 6; no full target comparison was found. Logarithmic infinite divisibility alone, without increasing Lévy measures, would not establish the required order.

- **L. Boudabsa and T. Simon, *Some Properties of the Kilbas-Saigo Function*, Mathematics 9 (2021), 217**, DOI [10.3390/math9030217](https://doi.org/10.3390/math9030217). [Full journal text](https://www.mdpi.com/2227-7390/9/3/217). Lemma 2 orders a family of infinite beta products in a shape parameter. Section 5 uses Malmsten and a multiplicative martingale for a Le Roy variable with Mellin transform a power of a single gamma function. This confirms that the general method used here is established. The full searchable text has no occurrence of “infimum”; no application to Simon's Remark 6 was located.

- **Simon, *A note on the α-Sun distribution*, Electronic Communications in Probability 28 (2023)**, DOI [10.1214/23-ECP526](https://doi.org/10.1214/23-ECP526), [arXiv:2301.09180v2](https://arxiv.org/pdf/2301.09180). The preprint's Proposition 2 and Remark 4, pp14–15, give convex orders for noise-reinforced Bessel local times and for the mean-normalized Mittag–Leffler family. These are distinct from the running infima. The searchable preprint has no occurrence of “infimum”. No target resolution was found.

- **N. Altaymani and W. Jedidi, *New Monotonicity and Infinite Divisibility Properties for the Mittag-Leffler Function and for Stable Distributions*, Mathematics 11 (2023), 4141**, DOI [10.3390/math11194141](https://doi.org/10.3390/math11194141). [Full text](https://www.mdpi.com/2227-7390/11/19/4141). The stated results concern complete and hyperbolic complete monotonicity, generalized Cauchy kernels, infinite divisibility, and hitting-time laws. No occurrence of “convex order” and no full infimum parameter comparison were found.

- **A. Joulin and S. M. Manou-Abi, *A note on convex ordering for stable stochastic integrals*.** [Author PDF](https://perso.math.univ-toulouse.fr/joulin/files/2013/12/maj.pdf). Theorems 2.1–2.2 compare stochastic integrals with a common fixed stability index, under inequalities on integrands or jump rates. They do not compare fixed-time infima across stability indices. The exact common-index requirement was checked.

- **R. A. C. Ferreira and T. Simon, *Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1 (2025).** [PDF](https://arxiv.org/pdf/2512.04940). Its main convex-order family is the normalized inverse-stable variable, corresponding to the supremum. The full searchable PDF has no occurrence of “infim”. The separate Remark 7(b) stochastic-order conjecture and Remark 5(b) diagonal-function conjecture are tracked independently in this campaign.

- **M. Minchev and M. Savov, *Recent developments in exponential functionals of Lévy processes*, arXiv:2510.19114v2, 28 May 2026.** [PDF](https://arxiv.org/pdf/2510.19114). This recent survey was screened for the target, relevant factorization discussion, and convex ordering. It is a broad account of exponential functionals and Bernstein-gamma functions, not evidence that every cited underlying paper has been fully checked.

- [Thomas Simon's university publication list](https://pro.univ-lille.fr/thomas-simon/publications), updated 29 August 2026, was checked from the 2014 paper through the listed 2026 preprints. No entry announcing a solution of the stable-infimum ordering was found. A bibliography is not a proof of continuing open status.

## Search record and repository checks

Both public-web engines were used, with the stronger engine for exact statements, uncertain matches, and current follow-ups. More than forty focused searches included the following variants:

```
"Simon" "infimum" "convex order"
"Comparing Fréchet and positive stable laws" "Remark 6"
"stable" "infimum" "convex ordering"
"stable infima" Simon convex order
"stable" "infima" "peacock"
"stable" "infimum" "log-infinitely"
"Thomas Simon" "infimum" "convex"
"stable" "infimum" "Mellin" "Simon"
"peacock" "stable" "Simon"
"stable" "supremum" "log-infinitely divisible"
"stable infimum" Mellin
"stable" "supremum" "infinite divisibility"
"stable" "convex order" "Malmsten"
"stable" "infimum" "convex order" 2026
"Simon" "stable-infimum"
"Patie" "Simon" "Remark 6"
"stable" "extrema" "convex order"
"spectrally negative" "convex order" "infimum"
"spectrally positive" "supremum" "convex order"
"stable" "infimum" "logarithm" "infinite divisibility"
"stable" "infimum" "monotonicity" Simon
"stable" "supremum" "Malmsten"
"Comparing Fréchet" "resolved"
```

The repository's recent HISTORY.md and existing issue search were inspected. No earlier exact stable-infimum package was found. The November 20 exclusions for Simon's Le Roy function and the Karp-related targets were respected; none is counted here.

Five public solution archives were searched with the exact identifier `1310.1888`, author/infimum combinations, Fréchet/convex combinations, and stable/infimum/convex combinations:

- `PrincipiaMathOrg/math-solutions`
- `KnowledgeSense/math`
- `pudim-project/pudim-ai-demo-zetalaw`
- `the-omega-institute/trureturing`
- `qqliu/CoPEER`

Exact identifier searches returned no matching earlier resolution. Broad searches returned unrelated quantum, geometric, numerical, and Le Roy records; their displayed matches and target titles were distinguished from the present assertion. Searches are subject to indexing coverage and were not a manual reading of every file in each repository.

## Limits

The final conjecture article and the essential prior Mellin formulas were accessible and directly checked. Several later primary sources were checked at the stated theorem or section level; this note does not claim a complete line-by-line audit of all their contents. No independent outside referee has reviewed the new proof. A hidden, unindexed, or unpublished resolution cannot be ruled out by these searches. The mathematical result and its internal audit can be assessed independently of that priority limit.

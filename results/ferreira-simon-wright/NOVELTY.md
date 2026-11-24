# Source and prior-resolution audit

Checked on 20 November 2026. Target: **Ferreira–Simon's Wright log-concavity conjecture**, the complete unnumbered equivalence in §6.4 of *On the log-concavity of the Wright function*.

## Source and version

- **Primary conjecture text inspected:** [arXiv:2212.07974v2](https://arxiv.org/pdf/2212.07974), dated 28 August 2023, 25 pages. Theorem D is on printed page 5; §5.1 on pages 15–16 proves the unique-threshold sign characterization; §6.4 on pages 23–24 contains the conjecture and explicitly includes the remaining case $\beta=0$, $\alpha>4/5$.
- **Publication metadata inspected:** [Springer publisher page](https://link.springer.com/article/10.1007/s00365-023-09666-w), Constructive Approximation **60** (2024), 309–338. The publisher gives 24 August 2023 as the online/version-of-record date and October 2024 as the issue date. These dates are distinct.
- **Published full-text limit:** the publisher PDF URL redirected to its subscription preview. The exact mathematical statement was checked in the primary author preprint; the published preview confirms the same subject, parameters, and unresolved equivalence, but does not expose §6.4. No full published-text inspection is claimed.
- **Current arXiv record inspected:** [abstract/version history](https://arxiv.org/abs/2212.07974) still identifies v2, revised 28 August 2023. No later revision or withdrawal was displayed.

The statement is about ordinary log concavity in the positive real argument of $\phi(-\alpha,\beta,-x)$. It is not a claim about multiplicative strong unimodality, parameter-wise Wright log concavity, or the delay-equation problem also called Wright's conjecture.

## Current author records and later primary papers

| Source inspected | Exact scope relevant to this audit | Relation to this conjecture |
|---|---|---|
| [Thomas Simon's current publication list](https://pro.univ-lille.fr/thomas-simon/publications), items 60–66 | Lists the source and later work through 2026, including arXiv:2512.04940. | No listed title or annotation announces a resolution of the Wright-density conjecture. This is negative search evidence, not proof of priority. |
| [Rui Ferreira's current publication list](https://sites.google.com/site/ruiacferreira/publications), items 63–70 | Lists the source and publications through volume-year 2026. | No listed correction or resolution of this conjecture was found. |
| Ferreira–Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1), full primary text | Theorems A–D give parameter monotonicity and convex-order comparisons. Proposition 4 uses the extremal Wright law; Remark 8(b) refers back to the earlier paper for entropy conditions. | The inspected statements do not establish or refute the §6.4 Wright-density equivalence. |
| Simon, [2026 conference abstract](https://www.dipmat2.unisa.it/iniziative/smod2026/docs/Abstract-Simon.pdf), one-page primary abstract | Describes convex ordering and log curvature of the Mittag–Leffler function on the positive half-line. | Consistent with the preceding and following papers; no announcement of the target resolution. |
| Garrappa–Gerhold–Popolizio–Simon, [arXiv:2410.11852v4](https://arxiv.org/html/2410.11852v4), published JMAA **551** (2025), 129588 | Theorem 23 characterizes log curvature of $E_{\alpha,\beta}$ on the positive half-line. Conjecture 25 concerns global complex-plane modulus inequalities and complete monotonicity of a reciprocal for $1\lt \alpha\lt 2$. | Different function, parameter regime, and assertion. Those results do not settle log concavity of the Wright density in this target. |
| Min Wang, [*Moments of Gamma type and three-parametric Mittag-Leffler function*, arXiv:2410.19330v1](https://arxiv.org/html/2410.19330v1), full primary text | §2.1 recalls the Ferreira–Simon density and introduces its power bias. Main statements concern existence of gamma-type moments, positivity of three-parameter Mittag–Leffler functions, and infinite divisibility. | It cites prior Wright log-concavity work and does not give the conjectured density classification. |
| Li–Morgan–Siegrist, [*Concavity structure of fractional differential equations and zeros of Mittag–Leffler functions*](https://link.springer.com/article/10.1007/s41478-026-01192-9), 13 October 2026 | Fractional-derivative boundary problems for $1\lt \alpha\lt 2$ and real zeros of $E_{\alpha,\beta}(-z)$. The full-text scope was independently checked by the algebra reviewer. | Different conjecture and function. Its inflection-point conjecture is not the present target. |

## Recent manuscript with a full-text access limit

Cuenca–Patungan–Ragas, *Complete Monotonicity of the Srivastava–Tomovski Function and Its Laplace–Wright Realization*, [arXiv:2608.08198](https://arxiv.org/abs/2608.08198), appeared in search results in its v3 form. Direct arXiv PDF/HTML requests and an alternate PDF mirror failed during this audit. The displayed author abstract was available in the indexed arXiv result and an [abstract mirror](https://academ.us/article/2608.08198/).

That abstract characterizes complete monotonicity of a four-parameter function and its Laplace realization. It explicitly treats the normalized measure as Wang's prior power-biased Wright law, based on the Ferreira–Simon density. It credits prior positivity, parameter admissibility, moments, and endpoint laws. No Wright log-concavity resolution is asserted in the accessible abstract. This is an abstract-only scope screen; the unavailable body has not been ruled out by full-text inspection.

## Search record and misleading near matches

Both available search engines were used, including recent-year filters and exact source identifiers. Query families included:

- `"On the log-concavity of the Wright function" conjecture proof`;
- `"2212.07974" conjecture resolution`;
- `"Ferreira" "Simon" "Wright" "conjecture"`;
- `"Wright" "log-concavity" counterexample`, `false`, and `disproved`;
- Wright density log concavity near $\alpha=1$, including the $\beta=0$ case;
- follow-up titles, citation records, and the authors' current publication pages.

No earlier proof or disproof of this exact statement was located. The following near matches were separated from the target:

- **Ferreira–Simon Mills-ratio and Tricomi-quotient conjectures:** public records report separate disproofs connected with *Convolution of beta prime distribution*. Neither is the §6.4 Wright-density conjecture. The current [Pudim application index](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) identifies its Ferreira–Simon entry as the Tricomi Psi quotient problem.
- **Garrappa–Gerhold–Popolizio–Simon Conjecture 25:** later public disproofs concern complex-plane modulus or complete-monotonicity assertions for Mittag–Leffler functions. They are not claimed as new here and do not resolve this target by their stated conclusions.
- **Coefficient-wise Wright log concavity:** this is a different notion for parameter shifts in generating series and incomplete beta functions. Sharing the words “Wright log concavity” does not make it the same assertion.
- **Wright's delay-equation conjecture:** the classical global-attractor problem has a different equation and a known resolution.

The repository issue search for `Wright Ferreira Simon` returned no existing issue before issue 100 was opened.

## What this work proves

The new claim is the structural failure of the source's threshold-to-log-concavity implication. The proof exhibits entire intervals $\alpha=1-t,\beta=0$ and $\alpha=1-3t,\beta=t$ for all sufficiently small $t>0$. It also treats all fixed slopes $a>0,b\geq0$ with $a^2>2ab+b^2$.

Its ingredients are classical: gamma reflection, gamma log convexity, dominated convergence of power series, and the second derivative criterion for log concavity. The gamma identities are recorded in [DLMF §5.5](https://dlmf.nist.gov/5.5), especially (5.5.1), (5.5.3), and the Bohr–Mollerup characterization. No novelty is claimed for those tools.

The search supports “no earlier exact resolution found in the inspected sources,” not an exhaustive priority guarantee. Independent mathematical reviews and the exact algebra check are recorded in issue 100 and the accompanying audit files. These are internal reviews, not outside peer review.

## Additional public-archive audit

On 20 November 2026, exact arXiv/DOI identifiers, names, and formula fragments were searched in PrincipiaMathOrg/math-solutions, KnowledgeSense/math, Pudim, and Trure, with global exact-source queries as well. The full Principia file manifest, KnowledgeSense catalogue, and Pudim applications record were checked. Relevant matches were read at their actual statements: they concern Mills ratios, rising-factorial or gamma-ratio generating series, incomplete beta functions, or a different fractional-diffusion question. No exact prior resolution of this Wright-density conjecture was identified. The negative search remains bounded and is not a priority guarantee. See [the full archive audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/ferreira-simon-wright/ARCHIVE-REAUDIT.md).

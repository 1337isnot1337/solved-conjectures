# Prior-work audit: Ferreira–Simon's stochastic-order conjecture

Search date: 2026-11-21. Related issue: [#170](https://github.com/1337isnot1337/solved-conjectures/issues/170).

## Finding

No earlier full resolution of the exact stochastic-order assertion was found in the searches and accessible sources below. This is a bounded literature finding, not a guarantee of exclusive priority. The Poisson representation and the norm inequality used in the proof are classical; neither is presented as new.

## Exact source and earlier formulation

1. **Ferreira and Simon, *Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1, 4 December 2025.** [PDF](https://arxiv.org/pdf/2512.04940), [version record](https://arxiv.org/abs/2512.04940). Remark 7(b), printed p18, proposes that \(M_\alpha/\Gamma(1-\alpha)\) decreases in the usual stochastic order throughout \(0<\alpha<1\). The following display gives the resulting Mittag–Leffler bounds. The exact normalization and both parameter quantifiers have been read directly. The arXiv record lists only v1 as of this search. Theorem C concerns the different, mean-normalized family \(\Gamma(1+\alpha)M_\alpha\) in convex order.

2. **Simon, *Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), no. 16, 1–25, DOI [10.1214/EJP.v19-3058](https://doi.org/10.1214/EJP.v19-3058).** [Accessible preprint](https://arxiv.org/pdf/1310.1888), v2, 27 January 2014. Theorem 3, printed preprint p17, proves the same stochastic comparison only when \(0<\beta\leq1/2\) and \(\alpha\geq\max(1/2,\min(2\beta,(\beta+1)/2))\). Remark 9, printed p18, conjectures extension to the full pair range; it also contains a separate convex-order conjecture. Remark 13(d), printed p23, records the associated Mittag–Leffler inequality as conjectural in general. Theorem C proves the exponential endpoint bound, not the full pair comparison. These statements and their adjoining arguments were checked. The full searchable PDF contains no occurrence of “Poisson” or “LePage”. The present work resolves the stochastic assertion repeated in 2025; it does not count the 2014 and 2025 formulations as separate conjectures.

3. **Boudabsa and Simon, *Some Properties of the Kilbas-Saigo Function*, Mathematics 9 (2021), 217, DOI [10.3390/math9030217](https://doi.org/10.3390/math9030217).** [Full journal text](https://www.mdpi.com/2227-7390/9/3/217), [preprint](https://arxiv.org/pdf/2012.05666). Its Conjecture 5 (preprint Conjecture 5.6) is the different claim that unscaled \(E_\alpha(x)\) decreases with \(\alpha\). This is already refuted by Ferreira–Simon 2025, Remark 7(a), through the nonmonotonicity of \(1/\Gamma(1+\alpha)\). It is expressly excluded as a new result here.

## Later and adjacent sources screened

- [Thomas Simon's university publication list](https://pro.univ-lille.fr/thomas-simon/publications), displaying an update date of 29 August 2026, still lists arXiv:2512.04940 as a preprint. The listed later papers concern autoregressive persistence and beta-weighted nonlocal operators.
- **Beghin, Leonenko, Simon and Vaz, *Beta-weighted non-local differential operators and related stochastic processes*, arXiv:2606.03661v1, 2 June 2026.** [PDF](https://arxiv.org/pdf/2606.03661). Introduction, main scope and searchable full text screened. It treats beta-weighted derivatives and inverse stable subordinators; no occurrence of “stochastic order” or “2512.04940” was found. No resolution of the present conjecture was located.
- **Altaymani and Jedidi, *New Monotonicity and Infinite Divisibility Properties for the Mittag-Leffler Function and for Stable Distributions*, Mathematics 11 (2023), 4141.** [Full text](https://www.mdpi.com/2227-7390/11/19/4141). The displayed results concern complete and hyperbolic complete monotonicity, real and imaginary parts, and infinite divisibility. No parameterwise stochastic-order theorem for the present normalized family was found; the searchable full text has no occurrence of “ordering” or “Poisson”.
- [Simon's SMOD2026 lecture abstract](https://www.dipmat2.unisa.it/iniziative/smod2026/docs/Abstract-Simon.pdf) and [2026 Kyiv workshop abstract](https://probability.knu.ua/moderntrends4/) report the three principal monotonicity statements from the 2025 preprint, not a solution of Remark 7(b).
- Searches also returned discrete Mittag–Leffler count distributions and waiting-time distributions with survival \(E_\alpha(-t^\alpha)\). These are different laws from the inverse-stable variable \(M_\alpha\); their stochastic comparisons cannot be substituted for the target.

## Classical tools and access limits

The series \(\sum T_n^{-1/\alpha}\) is the classical positive stable Poisson/LePage series. The proof includes its Laplace-transform derivation, so it requires no unverified theorem from a restricted-access source.

The original paper **LePage, Woodroofe and Zinn, *Convergence to a Stable Distribution Via Order Statistics*, Annals of Probability 9(4) (1981), 624–632, DOI [10.1214/aop/1176994367](https://doi.org/10.1214/aop/1176994367)** was located through its [author-upload record](https://www.researchgate.net/publication/38361847_Convergence_to_a_Stable_Distribution_Via_Order_Statistics) and journal/bibliographic records. The DOI was inaccessible through the research tool, and the linked author PDF returned 404. Its complete text was therefore **not** audited. Its series representation is credited as prior mathematics.

The broader **Samorodnitsky–Taqqu, *Stochastic Monotonicity and Slepian-Type Inequalities for Infinitely Divisible and Stable Random Vectors*, Annals of Probability 21 (1993), 143–160**, DOI 10.1214/aop/1176989397, was located in the [author's bibliography](https://people.orie.cornell.edu/gennady/newpublications.html). Its DOI also could not be fetched. No claim of having ruled out every result in that paper or every older stable-law monograph is made. The target's express open status in the accessible 2014 and 2025 sources is evidence for, but not a proof of, priority.

## Search record

Both available public-web search engines were used. The search included more than 35 queries, with exact titles and identifiers, author-name variants, the normalized variable, stochastic ordering, Poisson representations, LePage representations, sequence norms, earlier conjecture numbering, and 2026 follow-ups. Representative exact queries were:

```
"2512.04940" "stochastic"
"Mittag-Leffler" "stochastic ordering" "Poisson"
"Ferreira" "Simon" "stochastic-order"
"Mittag-Leffler" "stochastic order" gamma alpha
"positive stable" "stochastic ordering" "Poisson"
"stable distributions" "norm" "stochastic ordering"
"Comparing Fréchet and positive stable laws"
"LePage" "norm" "monotonicity"
"stable" "stochastic order" "LePage" gamma
"Mittag-Leffler" "norms" Poisson monotonicity
"Simon" "stable" "Remark 9" "order"
"Mittag-Leffler" "stochastic ordering conjecture"
"1310.1888" "conjecture" "proof"
"Gamma(1-alpha)" "stochastic"
positive stable distributions stochastic monotonicity index normalization gamma
"Mittag-Leffler" "stochastically" "parameter"
"Mittag-Leffler" "stochastic" site:mathdb.com
"Mittag-Leffler functions and convex ordering"
"stable distributions" "stochastic monotonicity"
"Mittag-Leffler" "stochastic" "conjecture" "2026"
"M_alpha" "Gamma(1-alpha)"
```

Current GitHub issue search in `1337isnot1337/solved-conjectures` located the separate Wright and Le Roy work but no pre-existing issue on this stochastic-order target. Five public solution archives were searched: `PrincipiaMathOrg/math-solutions`, `KnowledgeSense/math`, `pudim-project/pudim-ai-demo-zetalaw`, `the-omega-institute/trureturing`, and `qqliu/CoPEER`. Exact searches for `2512.04940` and `1310.1888`, and combined searches for `Ferreira` with `stochastic`, `LePage` with `monotonic`, and `Mittag-Leffler` with `Poisson` and `order`, produced no relevant full-resolution record. Broad searches matching unrelated words in large manifests were inspected and excluded.

The search did not find a published proof or counterexample of the full target. The proof and root audit are reviewable independently of this priority assessment. No external peer review is claimed.

# Older COLT cash-offer screen: coverage and exclusions

Checked 2026-11-21. This screen led to the separate Canonne 2024 Question 1 reservation. It does not count an additional solution.

## Coverage

The primary PMLR proceedings indices for **2011–2024** were inspected. Seventy-four open-problem PDFs were downloaded, validated with `pdfinfo`, and text-extracted without download or extraction errors in the final pass. Fifteen papers contain an explicit cash clause. The remaining 59 did not produce such a clause in the full-text search; this does not exclude an offer elsewhere.

The final source manifest is `index-manifest.json`; the download and extraction script is `screen_pmlr.py`. Raw `cash-screen.json` stores source excerpts and is a research intermediate, not proposed publication material. Several old proceedings indices put an open-problem heading before the ordinary paper list too. The final script avoids that false inclusion by checking titles; the six 2011 open-problem papers are identified explicitly from the final proceedings section, pages 809–834.

**Coverage limit:** this is not a completed 2000–2024 audit. Pre-2011 proceedings were located but were not exhaustively screened after a qualifying new candidate emerged. Current-status checks were concentrated on candidate offers and must not be inferred for every paper in the manifest.

## Explicit cash offers found

| Paper | Primary offer | Status in this campaign |
| --- | --- | --- |
| [Rudin–Schapire–Daubechies 2012, AdaBoost cycling](https://proceedings.mlr.press/v23/rudin12.html) | $100 for a full proof or counterexample | Exclude: prior uniform-start counterexample below. |
| [Shamir 2012, averaging and strongly convex SGD](https://proceedings.mlr.press/v23/shamir12.html) | $50 for the expected last-iterate rate, with $20 for a tight high-probability result | Cash confirmed; exact later-resolution audit not completed here. |
| [Bhaskara et al. 2014, tensor decomposition](https://proceedings.mlr.press/v35/bhaskara14b.html) | $100 | Cash confirmed; the ICALP 2026 algorithmic Kruskal paper is a prior-scope lead, not automatically a full resolution of every prize alternative. Not reserved. |
| [Christiano 2014, online local learning](https://proceedings.mlr.press/v35/christiano14.html) | $500 for an affirmative answer to each of two questions | Strong later results exist; negative conditional hardness does not qualify under the affirmative-only clause. Exact remaining scope not fully audited here. |
| [Freund 2016, variance-based quantile regret](https://proceedings.mlr.press/v49/freund16.html) | $500 for an algorithm or impossibility proof | Exclude from a fresh route: the 2026 primary manuscript explicitly identifies a prior negative answer for the original action-variance formulation. |
| [Orabona–Pál 2016](https://proceedings.mlr.press/v49/orabona16.html) | $100 for a positive solution of Question 2 | Already excluded in the campaign; not re-investigated. |
| [Agarwal et al. 2017, first-order contextual-bandit regret](https://proceedings.mlr.press/v65/agarwal17a.html) | $250 for either positive or negative resolutions to Q1 or Q2 | Q1 has a prior positive solution. Do not assume that this also settles the separately stated optimization-oracle-efficient Q2. Not reserved. |
| [Hazan et al. 2018, improper Gaussian-mixture learning](https://proceedings.mlr.press/v75/hazan18a.html) | $100 for the stated compression problem, with another $100 for its general-covariance analogue | Cash confirmed; later-status audit not completed here. |
| [Woodworth–Srebro 2019, memory-limited convex optimization](https://proceedings.mlr.press/v99/woodworth19a.html) | Cash options of $500, $200, $200, and $100 for four questions | Prior award-winning work exists. The entire menu was not declared closed without checking each exact statement. Not reserved. |
| [Foster et al. 2020, contextual-bandit model selection](https://proceedings.mlr.press/v125/foster20a.html) | $300 for the first solution to either of two problems | Cash confirmed; later-status audit not completed here. |
| [Steinke–Zakynthinou 2020](https://proceedings.mlr.press/v125/steinke20b.html) | Several cash offers | Existing campaign target and result; excluded from this fresh screen. |
| [Hanneke 2021, universal online learning](https://proceedings.mlr.press/v134/open-problem-hanneke21b.html) | $5,000 and $1,000 offers | Already excluded by the campaign's Blanchard 2022 prior-resolution audit. |
| [Canonne 2024, instance-optimal identity testing](https://proceedings.mlr.press/v247/canonne24a.html) | AUD $200 for Question 1 | Selected for a separate exact-scope audit and proof attempt. Questions 2/3 have non-cash rewards. |
| [Chen–Hazan 2024](https://proceedings.mlr.press/v247/chen24e.html) | $500 | Reserved by another campaign agent; no overlapping attack. |
| [Hu et al. 2024, private stochastic online learning](https://proceedings.mlr.press/v247/hu24a.html) | $300 for matching rates, with stated $200/$100 variants | Cash confirmed; later-status audit not completed here. |

## Primary prior-resolution evidence inspected

1. **AdaBoost:** Erik Y. Wang's [arXiv 2604.07055](https://arxiv.org/abs/2604.07055), with [the November 12, 2026 manuscript](https://borowiecki.dev/pdf/2604.07055), states a finite sign-matrix counterexample starting from the exact uniform distribution, with positive weak-learning margin, under every maximizing tie rule. These match the original prize's important hypotheses. No new counterexample is claimed here.
2. **Freund's variance question:** Freund–Harvey–Portella–Qi–Wang, [arXiv 2602.08151](https://arxiv.org/abs/2602.08151), [current manuscript](https://borowiecki.dev/pdf/2602.08151), Introduction, explicitly distinguishes its curvature-weighted variance result from the original action-weighted variance question and cites Marinov–Zimmert 2021's negative answer. The 2026 result must not be described as resolving the unchanged original statement affirmatively.
3. **First-order contextual bandits:** Allen-Zhu–Bubeck–Li, [*Make the Minority Great Again: First-Order Regret Bound for Contextual Bandits*](https://proceedings.mlr.press/v80/allen-zhu18b.html), ICML 2018, expressly resolves the first-order bound question. The oracle-efficient requirement in the separate Q2 needs its own check.
4. **Online local learning:** Awasthi–Charikar–Lai–Risteski's [COLT 2015 program abstract](https://easychair.org/smart-program/COLT2015/2015-07-05.html) gives a sharper algorithmic bound and a matching planted-clique conditional lower bound for the label dependence. This is prior work, not a fresh cash-eligible affirmative solution by this campaign.
5. **Tensor decomposition:** [*An Algorithmic Proof of Kruskal's Tensor Decomposition Theorem*, ICALP 2026](https://drops.dagstuhl.de/storage/00lipics/lipics-vol374-icalp2026/html/LIPIcs.ICALP.2026.31/LIPIcs.ICALP.2026.31.html), Introduction, directly discusses the $100 COLT 2014 offer. Its exact algorithmic range must be inspected before labeling the original full offer closed. That audit was deferred in favor of Canonne's target.

## Coordination

The screen avoided the root's Langford 2010 conditional-probability-estimation lane, the other agent's Langford 2005 cross-validation lane, and the Chen–Hazan 2024 lane. It created no reservations for the unreviewed offers above. The selected target and current-status caveats are in the separate Canonne audit and [issue 223 reservation](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069753193).

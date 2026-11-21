# Canonne 2024 Question 1: exact-radius identity testing

Checked 2026-11-21. Reserved in [campaign issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069753193). No complete solution, award claim, sponsor contact, or submission.

## Exact paid target

Clément Canonne's [COLT 2024 paper](https://proceedings.mlr.press/v247/canonne24a.html), [primary PDF](https://proceedings.mlr.press/v247/canonne24a/canonne24a.pdf), Section 5 on PDF page 4, asks for a succinct functional of a known discrete probability distribution and the supplied total-variation radius that determines the minimum sample complexity of identity testing, either exactly or up to universal multiplicative constants.

For a known distribution $`q`$ on a discrete domain $`X`$ and a supplied radius $`\varepsilon>0`$, let $`N^*(q,\varepsilon)`$ be the least sample count for a randomized tester whose probability of rejecting $`q`$ is at most $`1/3`$ and whose probability of accepting any $`p`$ with $`d_{\mathrm{TV}}(p,q)>\varepsilon`$ is at most $`1/3`$. The requested characterization must use this same radius in its upper and lower bounds.

The source's succinctness requirement is deliberately informal: a closed form or an efficiently computable functional from an explicit description of $`q`$ would be suitable. It explicitly rejects the tautology of defining the answer as the minimum sample count of a successful tester. A minimax optimization over all tests or all priors, without an efficient or otherwise succinct reduction, therefore does not by itself answer the question.

The prize paragraph offers **AUD $200 for a resolution of Question 1**. It states no positive-only restriction: Question 1 itself asks either for a suitable characterization or an impossibility result. The published paragraph states no expiry. No withdrawal or prior payment was found in the inspected records; current availability has not been confirmed with the sponsor. No contact was attempted.

Question 2 has a plush-toy reward, and Question 3 has food rewards. They do not qualify for this campaign. A repair of Question 3 cannot be reported as a cash-target completion here.

## Source and duplication checks

The primary five-page PDF was downloaded, validated with `pdfinfo`, extracted in full, and read. Its SHA-256 is `c03ab52323e9ec53f43c5baa28d5128352b2903b3d8bd3e7983a6257f9b5c058`.

Live repository issue searches for `Canonne` and `"identity testing"` returned no matches before the reservation. Local notes and research files had no prior target-specific analysis. The reservation comment was read back and its complete body matched the submitted text.

Current searches included the exact title, the author and problem with 2025/2026 dates, exact-radius and succinct-functional terms, and subsequent papers suggested by the sponsor's homepage. The [sponsor's homepage](https://ccanonne.github.io/), [publication list](https://ccanonne.github.io/publications.html), relevant primary manuscripts, and the newer research records below were inspected. Search absence does not establish novelty or rule out an unindexed resolution.

## Prior work and exact scope

| Primary source | What it gives | Why it is not the paid full result |
| --- | --- | --- |
| Valiant–Valiant, [*An Automatic Inequality Prover and Instance Optimal Identity Testing*](https://www.cs.purdue.edu/homes/pvaliant/instanceoptimalidentitysiam.pdf), FOCS 2014 / SIAM 2017 | Bounds involving the two-thirds quasinorm after deleting the largest atom and a light tail. | The upper and lower bounds remove different constant multiples of the prescribed radius. The 2024 source explains why this can change sample complexity by an unbounded factor. |
| Blais–Canonne–Gur, [CCC 2017](https://drops.dagstuhl.de/storage/00lipics/lipics-vol079-ccc2017/LIPIcs.CCC.2017.28/LIPIcs.CCC.2017.28.pdf), as stated in Canonne 2024 Section 2, Theorems 30 and 33 | A different characterization through an interpolation functional between the one- and two-norms. | Its upper and lower bounds also evaluate different constant multiples of the radius. This is not an exact-radius constant-factor characterization. |
| Chhor–Carpentier, [2022, DOI 10.4171/MSL/32](https://doi.org/10.4171/MSL/32), as discussed in Canonne 2024 Section 3 | Local separation-radius bounds for multinomial and related experiments. | Constant-factor bounds on the separation radius need not invert to constant-factor sample bounds at the same radius. |
| Canonne–Jain–Kamath–Li, [*The Price of Tolerance in Distribution Testing*](https://proceedings.mlr.press/v178/canonne22a.html), 2022 | Instance-dependent tolerant-testing bounds; Theorem 3 and Appendix D, Theorems 38 and 39, were inspected. | The formulas retain logarithmic losses and truncations at unequal constant multiples of the outer radius. Setting the inner radius to zero does not close Question 1. |
| Blanc–Canonne–Waingarten, [*Instance-Optimal Uniformity Testing and Tracking*](https://arxiv.org/html/2508.02637v1), FOCS 2025, displayed manuscript dated August 24, 2026 | A uniformity-tracking algorithm competitive, up to logarithmic factors, against a tester knowing an alternative's profile. | This is a different notion of instance optimality. Introduction footnote 4 explicitly distinguishes it from parameterizing identity-testing complexity by an arbitrary known null. |
| Pahan Dewasurendra, [*Closing the Harmonic Gap: Exact Identity Testing for Zipfian Distributions*](https://andotheror.github.io/pdf/closing-the-harmonic-gap-exact-identity-testing-for-zipfian-distributi.pdf), [source record](https://andotheror.github.io/p/closing-the-harmonic-gap-exact-identity-testing-for-zipfian-distributi.html), DOI 10.5281/zenodo.22065366 | Theorem 1 announces matching exact-radius bounds for distributions in a fixed Zipfian envelope. The paper uses a coarsened-head test, a tail quadratic statistic, and a graded-thinning prior. | Section 2 expressly limits the result to the Zipfian family instead of the arbitrary-null question. The statement and scope were checked; its entire proof was not independently certified in this audit. |
| Edward Yu, [July 22, 2026 proposed proof](https://quant.am/statistics/2026/07/22/closing-open-question-3/) | A block-collapse argument proposed to repair the near-point-mass corner of a previous lower bound. | The post addresses Question 3 only and explicitly requests independent review. It neither states nor supplies Question 1's general characterization. |

The 2014/2017 source uses an $`\ell_1`$ convention in places. This campaign uses $`d_{\mathrm{TV}}(p,q)=\frac12\|p-q\|_1`$ throughout. A factor of two in a truncation radius is material and cannot be absorbed into an outside constant.

## Research scope

The planned attempt is to optimize a head/tail decomposition while preserving the supplied radius exactly. A coarse head-plus-tail-cell test controls the discrepancy assigned to the head. A tail statistic must then use both the positive and negative discrepancy budgets, not merely the amount of mass deleted from the tail. A useful upper-bound expression is insufficient: a matching normalized-prior lower bound for every reference distribution is the central missing obligation.

The coarsening, quadratic statistics, and thinning methods are established techniques, including in the Zipfian manuscript above. No novelty is inferred from their use here. Any restricted family calculation is a calibration of a proposed general formula and adds no completed bounty target.

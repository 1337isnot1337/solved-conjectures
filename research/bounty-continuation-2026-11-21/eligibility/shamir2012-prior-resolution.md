# Shamir's 2012 last-iterate SGD prizes: excluded by prior work

Audit date: 21 November 2026. This is an eligibility and theorem-scope audit, not a new solution. This lane adds **zero** completed bounties.

## 1. The two original offers

Ohad Shamir, *Open Problem: Is Averaging Needed for Strongly Convex Stochastic Gradient Descent?*, COLT 2012, pp. 47.1–47.3:

- [Primary publication page](https://proceedings.mlr.press/v23/shamir12.html).
- [Primary PDF](https://proceedings.mlr.press/v23/shamir12/shamir12.pdf), printed p. 47.2.

The algorithm is ordinary projected SGD with unbiased stochastic subgradients. The question permits general, possibly nonsmooth, strongly convex objectives, bounded stochastic subgradient norms, and a bounded convex feasible set. It does not impose smoothness.

| Original offer | Exact object requested | Qualification that must not be lost |
| --- | --- | --- |
| $50 | Expected suboptimality of the last iterate, tight up to universal constants | The paper asks for some fixed choice of step sizes. A lower bound for one schedule is not a lower bound for every possible schedule. |
| Additional $20 | A tight last-iterate bound with probability at least $`1-\delta`$, with logarithmic dependence on the failure probability | Expectation alone does not satisfy this branch. Tightness in $`T`$ for fixed confidence must not be confused with a matching joint dependence on $`T,\delta`$. |

These are historical direct monetary offers. No payment receipt or transfer is asserted here.

## 2. The sponsor's explicit closure statement

The [sponsor's own publication page](https://www.wisdom.weizmann.ac.il/~shamiro/Publications.html), under **Other Publications**, entry *Is Averaging Needed for Strongly Convex Stochastic Gradient Descent?*, explicitly describes the problem as partially solved by Shamir–Zhang (2013) and **fully solved** by Harvey et al. (2018). The linked 2018 preprint became the 2019 COLT paper discussed below.

This is direct evidence against reserving either original offer as an unresolved cash target. It is stronger than an aggregator's unchanged open-problem label. It does not establish when, whether, or how much money changed hands. No sponsor was contacted.

## 3. Canonical step sizes: the expected branch is resolved

Nicholas J. A. Harvey, Christopher Liaw, Yaniv Plan, and Sikander Randhawa, *Tight Analyses for Non-Smooth Stochastic Gradient Descent*, COLT 2019:

- [Publication page](https://proceedings.mlr.press/v99/harvey19a.html).
- [Full proceedings PDF](https://proceedings.mlr.press/v99/harvey19a/harvey19a.pdf).
- [2018 preprint](https://arxiv.org/abs/1812.05217).

The algorithm in Section 2 uses a conditionally unbiased stochastic oracle, allowing its conditional mean to be a subgradient at the current point. The normalization to strong convexity and Lipschitz constants equal to one is removed in Appendix F.

Theorem 3.1, printed p. 4, gives


```math
f(x_{T+1})-f(x^*)
=O\!\left(\frac{\log T\,\log(1/\delta)}{T}\right)
```


with probability at least $`1-\delta`$, for $`\eta_t=1/t`$. Integrating the exponential confidence tail yields the expected upper rate $`O(\log T/T)`$.

Theorem 3.3, printed p. 5, constructs for every $`T`$ a bounded-domain, strongly convex, Lipschitz objective and a deterministic subgradient oracle with last-iterate error $`\Omega(\log T/T)`$. The construction permits $`\eta_t=c/t`$, with the corresponding scaling of the objective. Because a deterministic oracle is a special case of the allowed stochastic oracle, this is also the required worst-case expected lower bound for that schedule. The dimension may depend on $`T`$; the original offer does not fix a dimension.

Thus the expected rate for a valid fixed schedule is already known to within universal constants. The theorem is not a statement that every schedule must suffer the same logarithmic factor.

## 4. The high-probability branch requires a careful qualification

The beginning of Section 3 of Harvey et al. states that the paper resolves both Shamir questions. Its high-probability theorem has logarithmic confidence dependence, and its Appendix G shows a necessary $`\Omega(\log(1/\delta)/T)`$ confidence term even for a one-dimensional quadratic with bounded independent noise.

However, Section 7, printed p. 12, explicitly leaves open the precise **joint** confidence dependence for the canonical $`1/t`$ schedule. The displayed upper bound multiplies $`\log T`$ and $`\log(1/\delta)`$, whereas the separate lower bounds only force an additive combination, up to constants. Therefore it would be inaccurate to describe this paper as proving a matching product lower bound.

That residual refinement does not make the original additional $20 offer a verified open target: the sponsor's own page calls the original problem fully solved. There is no separately located direct-pay offer for resolving the residual joint-dependence question.

## 5. Horizon-dependent steps remove the logarithmic time loss

Prateek Jain, Dheeraj Nagaraj, and Praneeth Netrapalli, *Making the Last Iterate of SGD Information Theoretically Optimal*:

- [COLT 2019 publication page](https://proceedings.mlr.press/v99/jain19a.html).
- [Full preprint](https://arxiv.org/abs/1904.12443) and [PDF](https://arxiv.org/pdf/1904.12443).
- [SIAM Journal on Optimization version](https://doi.org/10.1137/19M128908X).

Section 2 of the full preprint defines a deterministic, horizon-dependent modification of projected SGD. With


```math
T_i=T-\left\lceil T2^{-i}\right\rceil,
\qquad
\alpha_t=\frac{2^{-i}}{\lambda t}
\quad\text{when }T_i\lt t\le T_{i+1},
```


Theorem 2 gives expected last-iterate error at most $`130G^2/(\lambda T)`$ and a high-probability rate $`O(G^2\log(1/\delta)/(\lambda T))`$. Here $`G`$ bounds the stochastic gradient norm and $`\lambda`$ is the strong-convexity constant. The theorem does not average the output iterates.

The preprint's high-probability display contains an expectation sign despite introducing a probability event. Section 3.5 and the general high-probability transfer Theorem 4 show that the intended conclusion is a bound on the random final value. This audit does not silently treat the displayed typo as a new open problem.

There are two model qualifications. First, this schedule knows the terminal horizon; it is not an anytime theorem for one infinite schedule. Second, the paper's setup states independence of the stochastic oracle noises, whereas Harvey et al.'s algorithm directly states conditional unbiasedness. The sponsor closure, rather than an unsupported extension of the Jain–Nagaraj–Netrapalli assumptions, is the decisive eligibility evidence.

## 6. Decision and research boundary

Exclude Shamir2012 from new bounty work. Do not count a reproof, formalization, a better confidence refinement for a specific schedule, or a newly restated horizon-dependent guarantee as another completed original prize.

The source audit checked the original cash clauses, the sponsor's closure entry, Harvey et al.'s algorithm and Theorems 3.1/3.3, its Appendix G and remaining-question paragraph, and Jain–Nagaraj–Netrapalli's model, schedule, Theorem 2, and proof in Section 3.5. It did not independently reprove every theorem in those papers and does not certify a historical payout.

Research-only PDF/text copies are kept in the adjacent `sources/` directory and the earlier `older_colt/sources/` directory. They are not part of the intended published deliverable.

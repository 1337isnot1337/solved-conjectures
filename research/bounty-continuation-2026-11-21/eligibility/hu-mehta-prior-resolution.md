# Hu–Mehta private stochastic online learning: prior-resolution audit

Audit date: 2026-11-21 22:02:09 UTC

Status: excluded from new discovery work. The original constructive matching-rate target is covered by a prior public theorem. This audit does not assert that the sponsor has accepted a claim or paid an award.

## Original paid target

Hu and Mehta, *Open Problem: Optimal Rates for Stochastic Decision-Theoretic Online Learning Under Differentially Privacy*, COLT 2024, PMLR 247, pp. 5330–5334:

- [Publisher record](https://proceedings.mlr.press/v247/hu24a.html).
- [Original five-page paper](https://proceedings.mlr.press/v247/hu24a/hu24a.pdf), Definition 1 and Section 3.

There are $`K`$ actions, independent stochastic loss vectors supported on $`[0,1]^K`$, and a unique best mean-loss action with gap $`\Delta_{\min}>0`$. The learner receives full information after each decision. Privacy is pure event-level $`\varepsilon`$-DP for the entire action prefix, under replacement of one whole loss vector.

Section 3 offers US$300 for the first matching-order problem-dependent upper and lower bounds with a constructive upper bound. A nonconstructive upper bound receives US$200, with US$100 reserved for the first subsequent construction. A separate US$100 offer concerns a larger-order lower bound that does not close the gap. These are alternatives within this problem, not separate campaign completions.

## Exact prior match

Cesari and Colomboni, *Optimal Gap-Dependent Regret for Private Stochastic Decision-Theoretic Online Learning*, arXiv:2605.29148v1, submitted 27 May 2026:

- [Dated record](https://arxiv.org/abs/2605.29148).
- [Full primary text](https://arxiv.org/html/2605.29148v1).
- [PDF](https://arxiv.org/pdf/2605.29148).

Theorem 1 gives one horizon-free algorithm, for every $`K\ge2`$, $`\varepsilon>0`$, and horizon $`T`$, with

```math
\mathop{\mathrm{Reg}}_T
\le 1000\left(
\frac{\log K}{\Delta_{\min}}+
\frac{\log K}{\varepsilon}
\right).
```

Definition 1 protects arbitrary deterministic neighboring loss prefixes; the iid assumption is used for performance, not to weaken privacy. The model permits dependence among coordinates of a loss vector and therefore includes the original independent-action setting. The algorithm does not require the gap or horizon.

The audit checked the complete mathematical mechanism in Sections 4–5: one private selection per disjoint data block; factorization of the full transcript law; randomized prefixes converting block regret into a prefix-length sum; Hoeffding bounds for small gaps; and the nonnegative log-partition potential for large gaps. The last potential telescopes at cost at most $4\log K/\eta$`, where `$`\eta=\min\{\varepsilon/2,1/8\}`$. No missing scope condition or invalid step was found. This is a mathematical source audit, not a Lean verification.

## Earlier partial result and disposition

Wu and Wang, [*Improved Regret in Stochastic Decision-Theoretic Online Learning under Differential Privacy*](https://proceedings.mlr.press/v313/wu26a.html), ALT 2026, explicitly give a partial result with privacy contribution $`O(\log^2 K/\varepsilon)`$. That earlier result alone would leave the requested rate open. The later Cesari–Colomboni theorem supplies the matching single-logarithm rate constructively.

No new mathematical proof is claimed here. The result's public chronology predates this campaign. No prize submission, fee, account action, or contact with the authors was made. The source establishes a mathematical prior resolution; payment history remains unverified.


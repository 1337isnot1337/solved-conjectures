# Foster–Krishnamurthy–Luo 2020: prior-resolution exclusion

Checked 21 November 2026. No new result, submission, acceptance claim, or payment claim.

## Original offer and alternatives

The [COLT 2020 paper](https://proceedings.mlr.press/v125/foster20a/foster20a.pdf), pages 2–3, offers a single US$300 prize for the first solution to either Problem 1 or Problem 2.

Problem 1 concerns arbitrary nested finite policy classes in contextual bandits with adaptive contexts and losses. Its strongest version requests the usual square-root regret with the complexity of each smaller class. Its weaker version permits polynomial overhead in the action count, number of classes, and iterated logarithm of the largest class, but requires

```math
T^\alpha(\log|\Pi_m|)^{1-\alpha},
\qquad 1/2\le\alpha<1,
```

simultaneously over the classes, or an impossibility result for every such alpha. Problem 2 requests the corresponding guarantee for stochastic, realizable nested regression classes.

These are alternatives under one first-solution offer, not independent US$300 prizes.

## Exact prior theorem mapping

[Marinov–Zimmert, NeurIPS 2021](https://papers.nips.cc/paper/2021/file/9570efef719d705326f0ff817ef084e6-Paper.pdf), also [arXiv:2110.13282v1](https://arxiv.org/pdf/2110.13282), supplies the relevant negative results.

| Original alternative | Prior result |
| --- | --- |
| Problem 1a and 1b, adaptive adversaries | Theorem 3 and Corollary 1 exclude every permitted exponent. |
| Stochastic lower bound for proper learners | Theorem 4. This theorem alone would leave an improper-learning gap. |
| Stochastic lower bound without properness | Theorem 5 and Appendix B.3 remove that gap. |
| Realizable regression-class formulation | Section 4.2's conditional-mean models provide realizability, as explicitly noted in footnote 3. |

The hard stochastic construction has three actions, a constant-action baseline, and coordinate policies on a uniform binary context vector. Revealing actions are costly under the baseline environment. A hidden biased coordinate makes another policy optimal. Lemma 3 controls even context-dependent decisions to reveal. Theorem 5 tunes the number of candidate coordinates so that any prescribed sublinear exponent forces linear regret in another environment. Appendix B.3 was inspected to distinguish its conclusion from the proper-only table entry.

## Regression-class check

This is a scope check of the existing construction, not a new lower bound. For its fixed positive gap Delta, define the conditional means by

```math
f_0(x,1)=f_0(x,2)=1/2,\qquad
f_i(x,a)=
\begin{cases}
(1-\Delta)/2,&a=x_i,
\\ (1+\Delta)/2,&a\in\{1,2\}\setminus\{x_i\},
\end{cases}
```

and set every model's value at action 3 to 1/2-Delta/4. The induced optimal policies are exactly the baseline and the coordinate policies. Taking the small regression class to contain f_0 and the larger one to contain all these means preserves the construction's class-size scaling. If logarithms are interpreted literally at a singleton, add a distinct dummy mean with the same constant optimal policy to both classes. This changes neither the environments used for the lower bound nor the logarithmic order.

Thus the realizability and regression-cardinality hypotheses do not create an unaddressed alternative prize in this construction.

## Sponsor-side status and disposition

[Foster's current publication page](https://dylanfoster.net/publications/) lists the original open problem and links Marinov–Zimmert as its solution. The arXiv record dates that work to 25 October 2021.

The target is excluded from this campaign's new discovery work. The sources establish a prior mathematical resolution; they do not establish whether money was paid. No additional completion is counted.


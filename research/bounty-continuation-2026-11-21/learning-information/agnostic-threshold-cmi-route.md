# Agnostic real thresholds: paid target and current information gap

Date checked: 21 November 2026. Related investigation: [the general VC target](vc-information-complexity-target.md). Status: unresolved in the sources checked; no completed bounty or solution submission.

## 1. Exact separately rewarded target

Steinke and Zakynthinou's [COLT 2020 open-problem paper](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf), Section 3, offers US$20 for proving Conjecture 6 for threshold functions on the real line, or US$15 for an improper learner. It also states a 20% efficiency bonus and a further 20% determinism bonus. No bonus amount is inferred here, and no fresh sponsor confirmation or payment evidence has been found.

Their [full framework paper](https://arxiv.org/pdf/2001.09122), Section 4.4, specifies

```math
\mathcal T=\{f_t:t\in\mathbb R\cup\{\infty\}\},
\qquad f_t(x)=1[x\ge t],\qquad f_\infty=0.
```

The proper threshold target is a distribution-independent sequence of learners $`A_n:(\mathbb R\times\{0,1\})^n\to\mathcal T`$ and absolute constants such that, for every $`n\ge1`$,

```math
I(A_n(\widetilde Z_S);S\mid\widetilde Z)\le C
\quad\text{for every iid data distribution }D,
```

and

```math
\mathbb E_A\widehat L_z(A_n(z))
\le\min_{t\in\mathbb R\cup\{\infty\}}\widehat L_z(f_t)
+\frac{C'}{\sqrt n}
\quad\text{for every individual labeled sample }z.
```

The supremum is over arbitrary label distributions; labels need not be consistent with any threshold. Constants can be combined by taking their maximum, as in the original conjecture.

## 2. Prior-status and scope checks

The full framework paper's Theorem 4.21 takes the smallest positively labeled feature, or infinity if none exists. Its information bound is constant even for a fixed arbitrary supersample. Its accuracy conclusion, however, is consistency **when the input is realizable**. On arbitrary labels it need not be an approximate empirical minimizer, so it is not a solution of this agnostic target.

The same framework paper's Conjecture 4.18 asks for a stronger worst-supersample information bound. The separately bountied Conjecture 6 instead asks for a bound for every iid distribution, averaged over its supersample. The current investigation uses the latter exact quantifiers.

The [2020 proper-realizable impossibility theorem](https://arxiv.org/abs/2011.02970), the [2021 conditional PAC-Bayes paper](https://proceedings.mlr.press/v134/grunwald21a/grunwald21a.pdf), and the [November 2026 evaluated-CMI theorem](https://arxiv.org/abs/2610.10600) do not establish this agnostic threshold statement. The distinctions are explained in the general-target note.

Targeted searches combined “agnostic,” “threshold functions,” “conditional mutual information,” “Conjecture 6,” the authors' names, the prize amount, and later-date qualifiers. They located the original offer and the distinct realizable, chained-information, leave-one-out, and evaluated-information results, but no exact threshold resolution. This is a bounded prior-art check. It is not a sponsor confirmation or an assertion that an unindexed proof cannot exist.

## 3. Canonical threshold outputs remove one information distinction

For a sample, use only thresholds at its distinct feature values and infinity. These represent every empirical prediction trace: a cut immediately before a group of equal feature values is represented by that group's value, and the all-zero trace by infinity. The construction is measurable and handles repeated features.

Suppose a learner always outputs one of these canonical thresholds. Fix a complete supersample with distinct feature values

```math
u_1<\cdots<u_M.
```

Every possible output parameter belongs to $`\{u_1,\ldots,u_M,\infty\}`$. Its prediction vector on the complete supersample uniquely identifies that parameter. The fixed labels convert prediction vectors to loss vectors bijectively. Thus, conditional on the supersample, the output and its evaluated loss vector determine each other. Data processing in both directions gives

```math
I(A(\widetilde Z_S);S\mid\widetilde Z)
=I(\ell(A(\widetilde Z_S),\widetilde Z);S\mid\widetilde Z).
```

This equality applies to the canonical constructions below. It does not manufacture an agnostic evaluated-CMI bound, nor apply to an arbitrary learner encoding additional information in a noncanonical threshold value.

## 4. Noisy-label ERM meets the samplewise accuracy requirement

Fix $`0<p<1/2`$. Independently flip every input label with probability $`p`$, then output a canonical empirical-risk-minimizing threshold for the flipped labels. Break ties by a deterministic fixed rule among the valid cut positions.

For a fixed input dataset, order the examples by feature value, keeping equal-feature groups together. Write

```math
a_i=2y_i-1,\qquad
a_i'=a_i(1-2F_i),\qquad
F_i\sim\mathop{\mathrm{Bernoulli}}(p),\qquad
\mu=1-2p.
```

Up to an additive constant independent of the threshold, the original and perturbed total losses at a cut are the corresponding prefix sums of $`a_i`$ and $`a_i'`$. Only cuts between equal-feature groups are valid.

The centered partial sums

```math
M_j=\sum_{i=1}^j(a_i'-\mu a_i)
```

form a martingale with independent increments and

```math
\mathbb E M_n^2=4np(1-p).
```

Let $`j_*`$ minimize the original prefix sum over valid cuts, and let $`\widehat j`$ minimize the perturbed sum. The latter minimizing property gives

```math
\mu\left(\sum_{i\le\widehat j}a_i-\sum_{i\le j_*}a_i\right)
\le M_{j_*}-M_{\widehat j}
\le2\max_{0\le j\le n}|M_j|.
```

Doob's square-integrable maximal inequality gives

```math
\mathbb E\max_j|M_j|
\le2\sqrt{\mathbb E M_n^2}
=4\sqrt{np(1-p)}.
```

Consequently, on **every** input dataset,

```math
\mathbb E_A\left[
\widehat L_z(A(z))-\min_t\widehat L_z(f_t)
\right]
\le\frac{8\sqrt{p(1-p)}}{(1-2p)\sqrt n}.
```

For example, $`p=1/4`$ yields $`4\sqrt3/\sqrt n`$. This is a uniform proof, with no asymptotic distribution approximation and no realizability assumption. Sorting and a prefix-minimum scan give a finite algorithm.

The unresolved step is its original-CMI bound, equivalently its evaluated-CMI bound by Section 3. The argument above says nothing about that information. In particular, randomizing labels does not by itself hide the selected feature values. Neither a constant bound nor an unbounded-information counterexample for this learner has been proved here.

## 5. A precise information inequality for a possible tree construction

This lemma records a sufficient estimate and its scope. It is not an application to a data-dependent rank tree.

Fix a finite binary hypothesis tree **independently of the input dataset**, with one fixed hypothesis at each leaf. A public random tree is also allowed if its randomness is independent of the sample and selector; condition on that randomness throughout. At an internal node $`v`$, let $`M_{v0}(z),M_{v1}(z)`$ be the minimum total empirical losses in its two child classes. Given positive scales $`\sigma_v`$, choose child 1 with probability

```math
p_v(z)=\frac{\exp(a_v(z))}{1+\exp(a_v(z))},
\qquad
a_v(z)=\frac{M_{v0}(z)-M_{v1}(z)}{\sigma_v},
```

using fresh independent coins at each visited node. Output the fixed hypothesis of the terminal leaf.

For a fixed full supersample $`\widetilde z`$, choose arbitrary finite reference logits $`b_v(\widetilde z)`$ and form the corresponding reference path distribution $`Q_{\widetilde z}`$. The logistic log-partition function has second derivative at most $`1/4`$. Its Bregman-divergence identity therefore gives

```math
\mathop{\mathrm{KL}}
\bigl(\mathop{\mathrm{Bernoulli}}(p_v(z))
\,\Vert\,
\mathop{\mathrm{Bernoulli}}(\mathop{\mathrm{sigmoid}}(b_v))\bigr)
\le\frac18(a_v(z)-b_v)^2.
```

Applying the KL chain rule to the entire path and then the conditional information-radius inequality gives

```math
\mathop{\mathrm{CMI}}_D(A)
\le\frac18\mathbb E
\sum_{v\text{ visited}}
\bigl(a_v(\widetilde Z_S)-b_v(\widetilde Z)\bigr)^2.
```

This estimate includes competing subtrees through both minimum-loss terms and handles adaptive path selection through the path expectation. A bound by the expected maximum error over all nodes of each depth is sufficient; bounding one predetermined node is not.

The same learner has expected total empirical excess at most

```math
(\log2)\,\mathbb E\sum_{v\text{ visited}}\sigma_v,
```

because the soft choice between two child minima incurs at most $`\sigma_v\log2`$ expected excess, and the changes of child minima telescope to the terminal loss. If $`\sigma_v=\sigma_j`$ depends only on depth, this is at most $`(\log2)\sum_j\sigma_j`$.

A suggested scale is $`\sigma_j=\sqrt n\,2^{-Hj}`$ with $`0<H<1/2`$. If a valid common tree additionally had

```math
\mathbb E\max_{v\text{ at depth }j}
\left|
M_{v0}(\widetilde Z_S)-M_{v1}(\widetilde Z_S)
-\sigma_jb_v(\widetilde Z)
\right|^2
\le Cn(j+1)2^{-j},
```

then the information series would be bounded by a constant times

```math
\sum_{j\ge0}(j+1)2^{-j(1-2H)},
```

while the excess-loss series would be order $`\sqrt n`$.

Neither hypothesis has been established for an implementable distribution-independent threshold learner. In particular, empirical quantile trees depend on the selected data, so their path labels and terminal hypotheses cannot simply be identified with those of a fixed full-pool tree. A fixed geometric partition of the real line need not balance an arbitrary data distribution. These are missing mathematical obligations, not technical details that can be omitted.

## 6. Current scope

The independently checked facts are the canonical-output information equality, the samplewise noisy-ERM error bound, and the fixed-tree sufficient information inequality. They provide no uniform constant-information learner yet. The separately rewarded threshold target and the full VC conjecture both remain unresolved in this investigation.

The subsequent [randomized-band note](threshold-near-minimum-information-gap.md) gives an accurate candidate learner, a candidate-support bound, and an exact finite-word information reduction. The remaining constant-information inequality is unproved. The displayed auxiliary results passed the [coordinator review](COORDINATOR_REVIEW.md).

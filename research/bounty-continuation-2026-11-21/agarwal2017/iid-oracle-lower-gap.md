# Agarwal Question 2: rejected iid zero-loss oracle reductions

Checked 2026-11-21. The [target and prior-status audit](oracle-small-loss-audit.md) fixes the original policy-optimization oracle and the full US\$250 Question 2. A valid negative theorem even at $`L_*=0`$ would refute that full question. No such theorem is proved here.

This was a separate bounded lower-bound attempt after the convex-surrogate route stopped. It considered hidden perfect policies, prescribed-order oracle constructions, and sparse corruptions of an unknown safe policy. The exact failures below prevent using those constructions as an answer to the prize.

## 1. The oracle adversary must survive the complete interface

The learner can submit arbitrary finite weighted context/cost lists, including fabricated costs, to the optimization oracle. A lower bound for a learner that merely asks for a policy consistent with actual past observations is insufficient. The learner may also combine returned policies and choose actions outside the set of their pointwise recommendations.

The policy class and the iid context/loss law must be fixed before sampling. An adaptive response construction would need a single class and a valid optimization oracle realizing every answer, together with a fixed iid distribution. A counting difficulty, a bad tie rule for one proposed learner, or an adversarial context sequence does not establish this.

## 2. Binary classification reveals too much

Consider the proposed specialization with two actions and losses

```math
\ell_t(a)=\mathbf1\{a\ne Y_t\},
\qquad (X_t,Y_t)\ \text{iid},
\qquad Y_t=\pi_*(X_t)\ \text{almost surely}.
```

Either observed loss determines $`Y_t`$ exactly. Thus the bandit feedback gives the full binary label, and the following elementary oracle-efficient learner defeats a lower bound in this specialization.

At round $`t`$ predict using any policy $`h_{t-1}\in\Pi`$ consistent with the preceding labels. Such a policy is returned by one empirical-loss oracle query, since the target has zero empirical loss.

Here is an explicit high-probability bound. Let

```math
c=\log(2NT/\delta),\qquad
r(h)=\Pr(h(X)\ne Y).
```

For any fixed $`h`$ and sample size $`n`$,

```math
\Pr(h\text{ is consistent on the first }n\text{ examples})
=(1-r(h))^n\le e^{-nr(h)}.
```

A union bound over all policies and $`1\le n\lt T`$ shows, with probability at least $`1-\delta/2`$, that every consistent policy has risk at most $`c/n`$. Consequently the sum $`A_T`$ of the learner's conditional mistake probabilities is at most

```math
A_T\le 1+c(1+\log T)
```

on that event. If $`M_T`$ is the actual number of mistakes, the standard conditional exponential-moment calculation gives

```math
\mathbb E\exp(M_T-(e-1)A_T)\le1.
```

Indeed, for a mistake indicator with conditional mean $`p`$,
$`\mathbb E[e^{I}\mid\mathcal F]=1+(e-1)p\le e^{(e-1)p}`$.
Combining this with Markov's inequality and the preceding event yields

```math
\Pr\!\left(
M_T>
(e-1)\bigl[1+\log(2NT/\delta)(1+\log T)\bigr]
+\log(2/\delta)
\right)\le\delta.
```

The oracle-call count is at most $`T`$ and the explicit processing cost is polynomial in $`T`$. This elementary argument is not new; it records why iid binary classification cannot furnish the desired negative theorem. It does not cover general two-action loss vectors or censored multiclass feedback.

## 3. The located adversarial lower bound does not transfer

[Attias, Hanneke and Ramaswami, NeurIPS 2025](https://proceedings.neurips.cc/paper_files/paper/2025/file/6d8452744e2dd26f3dfcba34cff6e06e-Paper-Conference.pdf), Theorem 3.1 and Appendix D.1, use hidden nested cells. Their instance sequence is prescribed as $`x_1,x_2,\ldots,x_T`$; later cells remain hidden from earlier queries. This is not iid sampling from a fixed context law.

Replacing that sequence by iid binary labeled examples activates the learner in Section 2. A valid iid adaptation would therefore need a different feedback mechanism and a new indistinguishability argument. Merely retaining the hidden-cell geometry is insufficient. No independent defect in that paper's stated adversarial theorem is claimed or needed here.

## 4. Sparse corruptions admit improper repair

Suppose an oracle-returned seed policy $`h`$ differs from a policy $`\pi_*`$ on at most $`s`$ contexts:

```math
|\{x:h(x)\ne\pi_*(x)\}|\le s,
\qquad
\ell_t(\pi_*(X_t))=0\ \text{almost surely}.
```

There is a simple learner with cumulative loss at most $`(K-1)s`$ almost surely. Initially use $`h(x)`$ at each context. Whenever an action incurs positive loss at a context, mark that action as forbidden there, choose an unmarked action for the next occurrence, and never retry a marked action. Keep a dictionary only for contexts where a positive loss occurred.

At a context outside the disagreement set, the initial action has zero loss and is never changed. At each context inside the set, the target action is never forbidden, so at most $`K-1`$ positive-loss events occur. Each loss is at most one. The conclusion follows even if a non-target action sometimes produces a zero loss: that action is only abandoned after its first positive loss. The condition on the target holds simultaneously over a countable stream almost surely.

Thus a construction in which every returned seed is a bounded-support corruption cannot force regret larger than $`(K-1)s`$ merely by hiding the identity of the perfect policy. In particular, taking $`s`$ polynomial in $`\log N`$ defeats the intended lower bound. This argument does not cover diffuse error sets of arbitrarily large support.

For the more restrictive deterministic binary star family with disjoint error supports, a pointwise majority of any three distinct corrupted policies already equals the common safe policy. That observation is another reason that identifying the perfect policy is not a necessary learning task.

## 5. Remaining gap and stopping status

The surviving idea would require genuinely censored feedback, diffuse correlated error sets, and a fixed finite class for which **every** polynomial-resource learner, including improper learners, remains unable to exploit arbitrary weighted oracle queries. No such family or oracle indistinguishability proof was obtained.

No oracle lower bound, full Question 2 algorithm, or new bounty resolution follows from these rejected reductions. The route is frozen at this gap; the campaign count is unchanged. No claim of mathematical novelty is made for the elementary rejection arguments.

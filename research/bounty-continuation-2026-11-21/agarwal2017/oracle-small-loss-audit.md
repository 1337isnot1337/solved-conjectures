# Agarwal et al. 2017 Question 2: scope audit and stopped convex-surrogate attempt

Checked 2026-11-21. This is an unresolved-target audit and a bounded failed route, not a solution or a payment claim. No new campaign completion is counted.

## 1. Exact target and offer

The [original four-page COLT 2017 problem](https://proceedings.mlr.press/v65/agarwal17a/agarwal17a.pdf), Definition 1 and Question 2, fixes a finite policy class $`\Pi\subseteq[K]^{\mathcal X}`$ of size $`N`$. Context/loss pairs are iid, losses belong to $`[0,1]^K`$, and the learner sees only the chosen action's loss. The comparator minimizes population policy loss; put

```math
\pi_* \in \mathop{\mathrm{arg\,min}}_{\pi\in\Pi}
 \mathbb E[\ell(\pi(X))],\qquad
L_*=T\mathbb E[\ell(\pi_*(X))].
```

Question 2 asks for a high-probability bound

```math
\sum_{t=1}^T\bigl(\ell_t(A_t)-\ell_t(\pi_*(X_t))\bigr)
\le
\widetilde O\!\left((L_*^{2/3}+1)
 \mathop{\mathrm{poly}}(K,\log(N/\delta))\right),
```

using time polynomial in $`T,K,\log N`$ and an oracle that minimizes empirical policy loss on any supplied finite context/cost list. Its internal runtime is excluded. The source allows $`L_*`$ to be known in advance. It does not assume that conditional mean losses belong to a specified regression class.

The final paragraph offers **US$250 for a positive or negative resolution to Question 1 or Question 2**. This is the wording of the published offer; separate unspent allocations, current sponsor willingness, and payment have not been established. No deadline is stated. No sponsor contact, submission, fee, or account action was made.

The relaxed Question 2' and a guarantee only when $`L_*=0`$ are not substituted for this full target.

## 2. Primary prior-status comparison

| Source | Relevant result and exact difference from Q2 |
| --- | --- |
| [Allen-Zhu, Bubeck and Li, ICML 2018](https://proceedings.mlr.press/v80/allen-zhu18b.html), *Make the Minority Great Again* | Resolves the first-order regret question without Q2's policy-oracle efficiency requirement. This campaign excludes Q1 as prior-resolved. |
| [Foster and Krishnamurthy, NeurIPS 2021](https://papers.nips.cc/paper/2021/file/9d684c589d67031a627ad33d59db65e5-Paper.pdf), *Efficient First-Order Contextual Bandits* | Page 2 explicitly says that FastCB does not formally solve the original open problem. It uses an online log-loss regression oracle; Assumption 1 requires conditional-mean realizability. The abstract's broad resolution wording does not remove those distinctions. |
| [Wang, Hu, Muthukumar and Abernethy, NeurIPS 2022](https://papers.nips.cc/paper_files/paper/2022/file/948106cb5a114684a64c89a1e517e3fe-Paper-Conference.pdf), *Adaptive Oracle-Efficient Online Learning* | The small-loss result assumes an approximable and implementable perturbation matrix. The paper explicitly treats full-information feedback and identifies special classes satisfying its conditions. It does not supply these conditions for arbitrary Q2 policy classes. |
| [Qin and Zhang, arXiv:2602.09456v2](https://arxiv.org/pdf/2602.09456), 25 June 2026 | OE2D uses offline regression. Its Basic Assumptions retain conditional-mean realizability; Corollaries 5 and 6 have a square-root-of-horizon bound. The misspecified extension pays an additional term linear in the horizon and the approximation error. |
| [Sakaue and Yoshida, arXiv:2602.09457v2](https://arxiv.org/pdf/2602.09457), 8 May 2026 | Section 2 reveals the full loss input after the decision; Section 3 runs an offline approximation algorithm on all observed inputs. The average-sensitivity theorem is not a bandit-feedback reduction. |
| [Banihashem and Hajiaghayi, arXiv:2611.17109v1](https://arxiv.org/html/2611.17109v1), 12 November 2026 | The stated guarantee is expected $`O(\sqrt{KT\log(2N)}\log(2KT))`$ regret, with independent auxiliary samples from the context distribution. It does not replace $`T`$ by $`L_*`$ or supply Q2's high-probability interface. |

The original paper already gives an inefficient clipped-EXP4 construction, a separator-dependent efficient partial result, and a zero-optimal-loss counterexample to certain policy-elimination choices. Those are prior work and are not reproduced as progress here.

Searches included the exact prize/title, Q2 and policy-optimization terminology, small-loss/classification-oracle variants, and later papers surfaced by those queries through November 2026. The table records inspected primary statements, not a proof that every possible manuscript has been located. No inspected source resolves the unchanged Q2. The GitHub issue search found no separate existing Agarwal target reservation.

## 3. Tested route: a loss-weighted convex surrogate

For a distribution over policies, let $`q_a(x)`$ be its action marginal. Thus $`q`$ belongs to the convex hull of the deterministic policy predictions. For $`0<\lambda\le1/2`$, define

```math
s_\lambda(u)=\frac{-\log(1-\lambda u)}{\lambda},
\qquad
S_\lambda(q)=
\mathbb E\sum_{a=1}^K\ell_a\,s_\lambda(q_a(X)).
```

Write $`L(q)=\mathbb E\sum_a\ell_aq_a(X)`$. The elementary inequalities

```math
u\le s_\lambda(u)\le\frac{u}{1-\lambda},
\qquad 0\le u\le1,
```

give

```math
L(q)\le S_\lambda(q)\le\frac{L(q)}{1-\lambda}.
```

This suggested replacing inaccessible entropy over all policy weights by an empirical convex program in the action marginals.

### 3.1. What the policy oracle does implement

On a finite list of contexts $`x_1,\ldots,x_m`$ and nonnegative weights $`w_{i,a}`$, the objective

```math
\widehat S_\lambda(q)=
\sum_{i=1}^m\sum_{a=1}^K
w_{i,a}s_\lambda(q_a(x_i))
```

is smooth and convex over the convex hull of the policy prediction vectors. Its gradient has entries

```math
\frac{w_{i,a}}{1-\lambda q_a(x_i)}.
```

Linear minimization of this gradient is exactly a policy-oracle call. A common rescaling handles a bounded-cost input convention. Standard conditional-gradient optimization therefore computes an approximate empirical minimum with polynomially many calls when the weights and desired inverse precision are polynomially bounded. This is only a claim about the finite convex optimization subproblem.

It does not provide a statistical small-loss bound for adaptive bandit observations. In particular, polynomial optimization of the action-marginal objective is not an implementation of the exponential-weights distribution on all $`N`$ policies.

### 3.2. Exact fixed-parameter bias

There is already a bias at the population optimum. Take one context, two constant policies/actions, and deterministic mean losses

```math
\ell_1=\varepsilon,\qquad
\ell_2=\varepsilon(1+\lambda/2),
\qquad 0<\varepsilon\le1/2.
```

Let $`q`$ denote the probability of action 1. The surrogate is

```math
S_\lambda(q)=
\frac{-\varepsilon\log(1-\lambda q)
-\varepsilon(1+\lambda/2)
\log(1-\lambda+\lambda q)}{\lambda}.
```

Its derivative is

```math
\frac{\varepsilon}{1-\lambda q}
-\frac{\varepsilon(1+\lambda/2)}
 {1-\lambda+\lambda q}.
```

The second derivative is strictly positive. Solving the first-order equation gives the unique interior minimum

```math
q_\lambda=\frac{3}{4+\lambda}.
```

Consequently, a learner using this exact population minimizer throughout has expected regret

```math
T\bigl(L(q_\lambda)-\varepsilon\bigr)
=\frac{\lambda(1+\lambda)}{2(4+\lambda)}L_*,
\qquad L_*=T\varepsilon.
```

Every fixed positive $`\lambda`$ therefore fails the desired exponent as $`T\to\infty`$ with $`K,N,\delta`$ fixed. This is a uniform counterexample to the fixed-surrogate proposal, not to Q2: the two-action bandit itself has known first-order algorithms. A shrinking parameter can remove this bias. For this family it must reach the $`L_*^{-1/3}`$ scale, up to the permitted logarithmic factors, to make the displayed term compatible with Q2.

### 3.3. Exact variance obstruction to the naive entropy analysis

Suppose the action is sampled from $`q`$ and the observed surrogate gradient is importance weighted:

```math
\widehat g_a=
\frac{\ell_A\mathbf1\{A=a\}}
 {q_A(1-\lambda q_A)}.
```

For the negative-entropy geometry, the local squared dual quantity is $`\sum_aq_a\widehat g_a^2`$. With one context, losses $`(0,1)`$ and $`q=(1-u,u)`$,

```math
\mathbb E\sum_aq_a\widehat g_a^2
=\frac{1}{(1-\lambda u)^2}\ge1,
\qquad
\mathbb E[\ell_A]=u.
```

There is therefore no universal constant multiplying the learner's loss that bounds this second moment, even for $`\lambda\le1/2`$ and a zero-loss comparator. Letting $`u\downarrow0`$ disproves that proposed self-bounding inequality.

Changing to the log-barrier geometry supplies one extra factor of $`q_a`$:

```math
\mathbb E\sum_aq_a^2\widehat g_a^2
=\frac{u}{(1-\lambda u)^2}
\le\frac{u}{(1-\lambda)^2}.
```

This explains why the finite-action variance calculation alone is insufficient. For arbitrary context-dependent policy classes one still needs a regularizer, computational representation, and regret analysis whose total complexity depends polynomially on $`\log N`$, while preserving this loss-weighted stability. No such construction was obtained here.

## 4. Stopping status

The oracle optimization subproblem is valid. Its fixed-parameter population bias and the naive entropy second-moment bound fail exactly as shown above. Vanishing surrogate bias does not repair the missing adaptive-bandit stability argument. These calculations do not exclude other regularizers, other reductions, or a full policy-oracle solution.

This bounded route stops here. Q2 remains unresolved by this campaign. No novelty claim is made for the elementary surrogate calculations or for the oracle-interface distinction already stated by Foster and Krishnamurthy.

Reservation and scope were posted in [issue 223, comment 7069982019](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069982019), with exact readback verification.

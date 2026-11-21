# The 2010 online variance prize: target and prior-work audit

Date: 21 November 2026. Status: the paid full target is unresolved in this campaign. The proposed one-vector implementation fails by the companion construction; that is not an impossibility theorem for all algorithms and earns no completion count.

## 1. Exact paid target and computational convention

Hazan, Kale, and Warmuth, *On-line variance minimization in O(n²) per trial?*, COLT 2010, pp. 314–315, is the primary statement:

<https://www.learningtheory.org/colt2010/papers/OpenProblemKale.pdf>.

Warmuth's current author-hosted publication list, entry P8 on p. 18, explicitly attaches a US$100 reward to a solution:

<https://mwarmuth.bitbucket.io/allpubs.pdf>.

This establishes a published offer payable for solving the problem. It does not establish that a sponsor has accepted a new submission, that money has been paid, or that an informal complexity convention has been clarified.

On round $`t`$, the learner chooses a positive semidefinite trace-one matrix $`W_t`$ and receives a symmetric loss matrix $`0\preceq L_t\preceq I`$. Its loss is $`\mathop{\mathrm{tr}}(W_tL_t)`$. The comparator is

```math
L_*=\lambda_{\min}\!\left(\sum_{t=1}^T L_t\right).
```

Given an upper bound $`\widehat L\ge L_*`$, the question asks for $`O(n^2)`$ computation per round and regret of order $`\sqrt{\widehat L\log n}`$. The preceding Matrix Hedge bound includes an additive $`\log n`$ term. We retain that term rather than manufacture a zero-loss counterexample from its omission in the displayed question.

The arithmetic model is not specified to modern precision:

- The paper says an approximate minimum eigendyad of a dense matrix can be computed in $`O(n^2)`$ time, without a precision, gap, or iteration parameter.
- It does not say whether the per-round bound is worst-case or amortized, or whether logarithmic factors are suppressed.
- It permits $`O(n^3)`$ preprocessing for a fixed perturbation against an oblivious adversary.
- Its own Theorem 1 solves constant-rank loss sequences already. Maintaining a basis under rank-one updates would not solve the unrestricted full-rank question.

The original density-matrix game permits nature to choose the loss after the density matrix. The paper also discusses randomized dyads and an oblivious-adversary construction. Whenever a rank-one randomized action is used below, the loss is assumed independent of the current random draw conditional on the past. A guarantee against an adversary that sees the current sampled vector is not inferred.

## 2. Later primary results checked

| Source | What was read and established | Remaining distinction |
| --- | --- | --- |
| Allen-Zhu and Li (2017), [Follow the Compressed Leader](https://proceedings.mlr.press/v70/allen-zhu17d/allen-zhu17d.pdf) | Rank-three compressed matrix prediction and the stated linear-system implementation. | The explicit runtime has solve/accuracy factors; an eigenvector or linear-system oracle is not a unit-cost dense operation. |
| Carmon, Duchi, Sidford, and Tian (2019), [A Rank-1 Sketch for Matrix Multiplicative Weights](https://proceedings.mlr.press/v99/carmon19a/carmon19a.pdf) | Sections 2–3, Proposition 1, Lemma 7, Theorem 2, Corollary 3, Proposition 8, and the implementation discussion. | The sketch has the required potential geometry. Its stated Lanczos implementation needs a growing iteration count. The negative-shift small-loss corollary is written separately and is credited to this prior potential. |
| Garber (2023/2025), [arXiv:2310.15559](https://arxiv.org/abs/2310.15559) and [journal version](https://doi.org/10.1016/j.orl.2025.107356) | The full 2023 preprint, especially Algorithm 1 and Conjecture 1 in Section 3.3; the publisher's indexed 2025 full text for the same conjecture. | Common-eigenvector and stochastic results do not cover general oblivious noncommuting losses. The linear-regret assertion is a conjecture in those sources, not an already proved theorem. |
| Liang, [On the Optimality of Oja's Algorithm for Online PCA](https://arxiv.org/abs/2104.00512) | The abstract and model introduction. | The model is iid sub-Gaussian streaming subspace estimation, not the adversarial prediction game. |
| Gong, Li, Wang, and Zhang (2025), [Instance-Optimal Matrix Multiplicative Weight Update and Its Quantum Applications](https://arxiv.org/abs/2509.08911) | The primary abstract and stated computational comparison. | Instance-adapted regret is obtained at the computational complexity of matrix multiplicative weights; this is not an explicit unrestricted $`O(n^2)`$ update. |

The first two papers provide much of the desired analytic behavior. They also make it unsafe to advertise a new resolution merely because a rank-one action avoids a full eigendecomposition.

In the 2019 implementation, if $`Y`$ is the cumulative exponent, the number of Lanczos iterations is controlled by a quantity of the form

```math
k\asymp
\sqrt{M\log\!\frac{nM}{\varepsilon\delta}},
\qquad
M=\max\!\left\{\|Y\|_{\mathrm{op}},
\log\!\frac n{\varepsilon\delta},1\right\}.
```

Proposition 8 charges

```math
O\!\left(\mathop{\mathrm{mv}}(Y)k+k^2B_{\mathrm{bits}}\right)
```

operations, with logarithmic precision dependence in $`B_{\mathrm{bits}}`$. The alternative reduction uses a logarithmic number of linear systems; it does not declare those systems solvable in constant many dense matrix-vector products. Thus the explicit paper does not itself supply a literal, horizon-independent $`O(n^2)`$ operation bound. Conversely, the 2010 statement's informal treatment of eigenvector accuracy prevents us from certifying sponsor noncoverage just from this discrepancy.

## 3. Attempt and stopping obligation

The [small-loss corollary](small-loss-corollary.md) gives the exact expected regret calculation for the published rank-one law. Its remaining computational requirement is to produce, each round, an action sufficiently close to

```math
\frac{e^{-\eta A_t/2}u_tu_t^\top e^{-\eta A_t/2}}
     {u_t^\top e^{-\eta A_t}u_t},
\qquad
A_t=\sum_{i\lt t}L_i,
```

where the new isotropic vector $`u_t`$ is independent of the current loss. A sufficient approximation requirement is summable expected trace-norm error. No $`O(n^2)`$ per-round procedure meeting that requirement has been proved here.

Updating just one vector by $`v\leftarrow(I-\eta L_t)v`$ is a different, ordered-product algorithm. The [oblivious block construction](oja-oblivious-block-obstruction.md) proves that this substitution has linear regret, including for a horizon-dependent step size of order $`T^{-1/2}`$. The construction applies to one candidate update only.

The current paid-target stopping point is therefore exact: find a computationally cheap action law with the same stability and comparator control, or prove a lower bound for the full allowed algorithm class in a specified computational model. The present work does neither.

## 4. Source receipts and search scope

Downloaded primary files in this directory:

| File | SHA256 |
| --- | --- |
| 2010-kale.pdf | b6196bcc530800ef73697a4dc808c6a76bafe824d222c74bbe02fd64af709d69 |
| warmuth-publications.pdf | 0eaa071f1733c9816f9d392716568a7fd1119f39c10a708a8cf05ffd3c142e2a |
| allen-zhu-li-2017.pdf | 8096ca7fd4c58f1fe2490f25a29a31e2e020cfd3ed9579009aba94dc1a4309a8 |
| carmon-2019.pdf | 23f7b7067a8ddc0e8d729efdd48b8207bbc45dff8ef74e9c4e575711c660fd9e |
| garber-2023-oja.pdf | 0f4d51d7aa00d1d439e188e6c2bff3613e60d91fb60a084003aabd0e7637253b |

Searches on 21 November 2026 included the exact original title with “solved,” “Carmon,” and “compressed leader”; online variance and quadratic-time implementation; the 2025 Garber title; and the Oja oblivious-adversary conjecture with “linear regret,” “polar decomposition,” and its arXiv identifier. The publisher's indexed 2025 text still presents that narrower assertion as Conjecture 1. An author-hosted publication list was checked directly for the reward. These checks are evidence about the sources inspected, not a proof that no unindexed resolution exists.

The focused reservation and scope record is [issue 223, comment 7070097568](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070097568). No sponsor contact or submission has been made.

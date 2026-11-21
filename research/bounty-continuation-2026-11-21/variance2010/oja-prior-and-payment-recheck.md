# Oja's oblivious-adversary conjecture: prior-work and payment recheck

Date: 21 November 2026.

**Status.** No earlier proof of the exact fixed-step, oblivious, linear-regret assertion was located in this search. No direct solver reward for that assertion was verified. The independently reviewed construction in [the companion note](oja-oblivious-block-obstruction.md) is therefore recorded as mathematical research, with **zero additional paid-problem completions**. It does not solve the full 2010 online-variance prize.

This note reports the sources actually inspected. Negative search results do not prove that an unindexed proof or offer does not exist.

## 1. Exact assertion checked

The primary source is Dan Garber, *From Oja's Algorithm to the Multiplicative Weights Update Method with Applications*, [arXiv:2310.15559](https://arxiv.org/abs/2310.15559), submitted 24 October 2023. Algorithm 1 and Section 3.3, Conjecture 1, concern normalized updates

```math
w_{t+1}=(I+\mu A_t)w_t,\qquad z_t=w_t/\|w_t\|_2,
```

with one fixed step size. The conjectured bad input is chosen before the initial random vector and causes regret linear in the horizon with constant probability. The performance measure is cumulative quadratic payoff against the best fixed unit vector, not the accuracy of the final principal-component estimate.

The publisher's indexed full text of the 2025 journal article, [*Eigenvalue problems via the multiplicative weights update method*](https://doi.org/10.1016/j.orl.2025.107356), retains the assertion as Conjecture 1 and explicitly describes the oblivious case as open. The direct publisher page was access-restricted in some fetches; the full indexed passage and the complete downloaded 2023 preprint were read. The [author's publication list](https://sites.google.com/view/dangarber/home/publications) confirms the journal item.

Our frozen theorem covers every dimension at least two, every horizon at least two, and every nonnegative fixed step size, including one chosen as a function of the horizon. Its matrices are positive semidefinite contractions. The initial vector is uniform on the unit sphere; both the regret coefficient and success-probability lower bound are absolute constants. The small-step construction is a noncommuting block with an exactly orthogonal normalized block product. Separate arguments cover steps too small for one complete block and large steps. This is a statement about Oja's specified update, not about every efficient online learner.

## 2. Related primary results and their scope

| Primary source | Material inspected | Why it does not settle this exact assertion |
| --- | --- | --- |
| Garber, Hazan, and Ma, [*Online Learning of Eigenvectors* (2015)](https://proceedings.mlr.press/v37/garberb15.pdf) | Model, algorithmic comparison, and perturbed-leader/eigenvector-oracle construction. | An efficient adversarial eigenvector algorithm is not a lower bound for normalized Oja. |
| Garber, [*On the Regret Minimization of Nonconvex Online Gradient Ascent for Online PCA* (2019)](https://proceedings.mlr.press/v99/garber19a/garber19a.pdf) | Introduction, problem model, assumptions, and algorithm setup. | The guarantees use an adversarially perturbed spiked-covariance model, a sufficient eigengap, and a suitable initial condition. They do not cover unrestricted oblivious matrix sequences. |
| Allen-Zhu and Li, [*Follow the Compressed Leader* (2017)](https://proceedings.mlr.press/v70/allen-zhu17d/allen-zhu17d.pdf) | Rank-three compressed method and runtime statement. | This is a different algorithm with linear-system computations. |
| Carmon, Duchi, Sidford, and Tian, [*A Rank-1 Sketch for Matrix Multiplicative Weights* (2019)](https://proceedings.mlr.press/v99/carmon19a/carmon19a.pdf) | Potential, regret proof, and implementation section, including Lemmas 5–7 and Proposition 8. | Fresh randomized exponentiated-cumulative-matrix actions are not a single vector updated by the ordered product of individual losses. |
| Eric Price, [*Spectral guarantees for adversarial streaming PCA*](https://www.cs.utexas.edu/~ecprice/papers/streaming-adversarial-pca.pdf), author PDF dated 2 September 2023 | Theorems 1.1–1.3 and the model/related-work discussion. | The upper and lower bounds concern terminal eigenvector approximation and memory as a function of the covariance spectral ratio. No cumulative fixed-comparator regret statement is inferred from them. |
| [*Provably Sub-Linear Two-Timescale NeuroEvolution with Online Plasticity*, IJCAI 2026, paper 703](https://www.ijcai.org/proceedings/2026/0703.pdf) | Sections 3.3–4, the assumptions, and the regret theorem. | The method uses a projected plasticity/architecture framework. In particular, its surrogate-domination assumption and convex weight domains are additional hypotheses. Its theorem is not an unrestricted quadratic-regret guarantee for normalized Oja. |

The common-eigenvector theorem in Garber's own paper is also not a resolution: noncommuting inputs are permitted by the conjecture. Stochastic PCA, adaptive adversaries that observe the initial vector, and follow-the-leader counterexamples have different quantifiers.

The [MathDB problem entry](https://mathdb.com/p/360467/the-oblivious-adversary-conjecture-for-oja-s-algorithm) currently restates the conjecture, references the 2023 preprint, and displays no posted solution. Its progress summary says it has never been refreshed. That is a discovery lead, not an exhaustive mathematical status check.

## 3. Search coverage

Both available search engines were used, with primary-source follow-up rather than accepting search summaries as proofs. Searches combined:

- the exact arXiv identifier and both paper titles with “solution,” “conjecture,” and “counterexample”;
- “Oja,” “oblivious,” “linear regret,” “proof,” and “lower bound”;
- “Oja,” “noncommuting,” “periodic,” “polar decomposition,” “rotation,” and “holonomy”;
- “nonconvex online gradient ascent” with “counterexample”;
- the exact conjecture and author names with “bounty,” “reward,” “prize,” and dollar amounts.

The final recent-results pass again returned the journal conjecture, the MathDB entry, a course project page discussing several different online-PCA algorithms, and the IJCAI paper above. The latter was checked against its actual assumptions. No exact prior proof was located.

A public GitHub search for the arXiv identifier returned literature-feed records rather than a proof. A repository-name search for “Oja conjecture” was empty. Broad code searches were noisy and were not treated as exhaustive. The search did not rely on generated summaries that conflate stochastic, common-eigenvector, and unrestricted adversarial statements.

## 4. Direct-payment audit

| Venue or offer | Directly checked evidence | Eligibility conclusion |
| --- | --- | --- |
| Hazan–Kale–Warmuth 2010 online variance | [Original problem](https://www.learningtheory.org/colt2010/papers/OpenProblemKale.pdf); [Warmuth's author-hosted publication list](https://mwarmuth.bitbucket.io/allpubs.pdf), entry P8, explicitly offers US$100. | The funded task is the full efficient online-variance problem. Ruling out one particular vector update does not answer it. |
| Garber's paper, author publications, and MathDB entry | Exact conjecture and source pages above. | No direct solver-payment clause was found for Conjecture 1. |
| [DeMaTH problems](https://demath.org/problems) and [solves](https://demath.org/solves) | Current public catalog and funding/verification explanation. | No Oja/Garber task was listed in the retrieved catalog. |
| [ZZZ Agent Board](https://zzzagents.com/) | Current public paid-work list and its operator's task-scope statements. | No Oja/Garber task was listed. A general reference to mathematical work is not an offer for this theorem. |
| [Conjectures.io](https://conjectures.io/problems) and [task repository](https://github.com/conjectures-io/conjectures-tasks) | Live catalog landing page, exact-site searches, task-repository code search, and the campaign's older 326-entry statement snapshot. | No matching funded task was located. The live landing page showed 329 entries, but its full list was not recovered through local fetching; filters repeated the first page. The older snapshot and negative code search are therefore bounded evidence, not a complete current census. |
| Other cash-prize searches | Exact conjecture/identifier/author searches and the team's existing primary COLT cash-offer ledger. | No separate direct cash or token offer for this assertion was verified. A general formalization prize is not presumed to cover it. |

No sponsor was contacted. No submission, wallet connection, payment, fee, or award was made or inferred.

## 5. Frozen mathematical and source receipts

The mathematical source files were held unchanged during this audit:

| File | SHA256 |
| --- | --- |
| oja-oblivious-block-obstruction.md | 6d22c386c64564183c84491d2d0247684aa9727462a6a028f256a9d39c6e31b4 |
| variance-small-loss-corollary.md | 7046f0a29282ac2a0d8fc93c82c30e06d6a9406a7fcf3c756b36f6df747de326 |
| variance-target-and-prior-audit.md | e5b16d5f8f817240aaf842d190ff60b5f782755e37814496a9f68b98af7b69f1 |

Downloaded primary follow-up files:

| File | SHA256 |
| --- | --- |
| garber-2023-oja.pdf | 0f4d51d7aa00d1d439e188e6c2bff3613e60d91fb60a084003aabd0e7637253b |
| garber-2015-eigenvectors.pdf | 3e249baa54a43615a112c21d3c02646922ac186df30171a683d8b40491b41826 |
| garber-2019-nonconvex.pdf | 9efe6ecd66dfbe057b04d1a3a885268255a3cfa77073a90e0807cae975c643a5 |
| ijcai-2026-neol.pdf | 2fb1e6911c6ece2fc8b3f321a5ab5092c918aff141bcd63780574b27b684716d |

The independent reviews are held at:

- `agents/root749/variance-oja-independent-review.md`, SHA256 `483d0cdc1532030d7d4e368ee9f34ce01db0f0c05fad35120bbb20199eb39a57`.
- `agents/conjectures/oja-oblivious-block-independent-review.md`, SHA256 `1ff1fff2249908986b3a4c5029b6895a5d269c589a227cd0e36b26af2ee6e313`.

Those reviews certify the stated mathematical argument, not novelty, sponsor acceptance, or payment. The full 2010 variance target remains unresolved in this campaign.


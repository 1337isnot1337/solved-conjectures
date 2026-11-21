# Kruskal tensor-decomposition prize: later full prior result

Checked 2026-11-21. The 2014 exact-decomposition target is excluded from new work in this campaign because a later primary manuscript states a matching full polynomial-time result. This is a scope and prior-status audit, not a new proof, prize claim, or independent certification of that entire manuscript.

## 1. Original offer

Bhaskara, Charikar, Moitra, and Vijayaraghavan, [COLT 2014](https://proceedings.mlr.press/v35/bhaskara14b.html), [primary PDF](https://proceedings.mlr.press/v35/bhaskara14b.pdf), Open Problem 4 and the following discussion, ask for an algorithmic decomposition under Kruskal's condition. For a three-way tensor with $`r`$ rank-one terms and factor Kruskal ranks $`k_1,k_2,k_3`$, the promise is

```math
k_1+k_2+k_3\ge2r+2.
```

The surrounding text compares with the polynomial-time Jennrich algorithm and explicitly considers possible computational hardness. It also discusses robust analogues needed for statistical applications. The final paragraph offers $100 for resolution of the open problem. It does not list a second separately priced noise-stability question.

The sponsor PDF was downloaded and read. SHA-256: `6cba9c5cc444e0d493bbd484160ce23a22b9397f5a774079d994d4a70f1cc8d1`.

## 2. Why the ICALP 2026 theorem alone is insufficient

Bhargava, Schulman, and Sivan, [*An Algorithmic Proof of Kruskal's Tensor Decomposition Theorem*](https://drops.dagstuhl.de/storage/00lipics/lipics-vol374-icalp2026/html/LIPIcs.ICALP.2026.31/LIPIcs.ICALP.2026.31.html), Theorem 1 in Section 1.1, give exact randomized recovery in

```math
(n_1+n_2+n_3)^{O(\kappa)},
\qquad
\kappa=2r+2-\max\{k_1+k_2,k_1+k_3,k_2+k_3\}.
```

The paper expressly says that it settles the constructive-proof request but does **not** fully settle the efficiency question. The same parameter dependence appears in the [ECCC report](https://eccc.weizmann.ac.il/report/2026/073/).

For example, with even $`n`$, full-spark factor matrices of size $`n\times(3n-2)/2`$ have all three Kruskal ranks equal to $`n`$, satisfy the promise with equality, and give $`\kappa=n`$. Such rational matrices exist, for example by a Vandermonde construction with distinct rational parameters. The exponent in the theorem is therefore not a uniform constant over the original promised inputs.

This earlier theorem cannot be treated as a general polynomial-time resolution merely because its title says "algorithmic proof." It does use the exact Kruskal promise, rather than replacing it by a numerical-rank or generic-instance condition; its limitation is the running time.

## 3. The later theorem that matches the full exact branch

Shiri Sivan, [*Polynomial-time Tensor Decomposition under the Kruskal Condition and the Lovitz–Petrov Generalization*](https://arxiv.org/abs/2609.13693), [version 3 primary PDF](https://arxiv.org/pdf/2609.13693v3), was revised on 2026-11-03; the PDF is dated November 4. The paper's first numbered page explicitly identifies the 2014 $100 question and states that it answers it affirmatively.

The full 24-page PDF was downloaded directly from arXiv after the browser reader failed. The introduction, computational model, Theorem 1.1, Corollary 1.2, the recovery theorem's correctness/runtime discussion, and Proposition 7.2 were inspected. SHA-256: `66b44afe5ef55eb5b7f7eba5fb38c8eec7292ab03a43be94c03f716682530166`.

Theorem 1.1 gives randomized recovery for every decomposition satisfying the Lovitz–Petrov condition, in $`\mathop{\mathrm{poly}}(N)`$ operations, where $`N=\prod_j n_j`$ is the number of tensor entries. Its success probability is one under the stated absolutely continuous sampling of generic contractions. Proposition 7.2 proves that Kruskal's condition implies this condition. Corollary 1.2 then states recovery for **any** Kruskal decomposition, up to the unavoidable permutation and componentwise scaling ambiguities.

The theorem's model is explicit: exact algebraic computation over the reals, with univariate root finding charged polynomially in the polynomial degree. This is not a bit-complexity or a perturbation-stability assertion. It nevertheless covers the full exact algebraic decomposition branch of the original question, including unbounded Kruskal ranks and the balanced cases left exponential by the ICALP theorem.

The implication in Proposition 7.2 was checked directly. For a column subset $`S`$ of size $`s\ge2`$,

```math
\mathop{\mathrm{rank}}(A^{(j)}[S])\ge\min\{k_j,s\}.
```

If at least three $`k_j`$ exceed $`s`$, then the sum of these minima is at least $`m+3(s-1)\ge2s+m-1`$. Otherwise truncating at most two ranks from at most $`r`$ down to $`s`$ loses at most $`2(r-s)`$, so the original bound $`2r+m-1`$ again leaves at least $`2s+m-1`$. This is the required Lovitz–Petrov inequality. No extra genericity assumption on the input factors is inserted by this implication.

## 4. What the prior result does not establish

The author's linked [reference implementation](https://github.com/shirisiv/LP-tensor-decomposition), README sections on numerical caveats, expressly distinguishes floating-point implementation from the exact algebraic theorem. It uses numerical rank tolerances, retries ill-conditioned contractions, and makes no noisy-tensor perturbation guarantee.

Thus this audit does not claim that all stable, rational-bit-complexity, or statistical-recovery strengthenings have been solved. It also does not certify sponsor acceptance or that the $100 has been paid. The original source contains one monetary offer; this campaign will not invent a new independently payable robust variant from a contextual mention.

The whole decomposition proof was not independently audited here. The theorem-level quantifiers, the original-target inclusion, and the stated computational limits were checked. This is sufficient to avoid claiming the already-published exact algorithm as a new campaign result. The target adds zero completions, and no new reservation or mathematical attack on it was made.

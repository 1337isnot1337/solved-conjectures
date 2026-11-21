# Prior coverage of Langford's improvement criterion

21 November 2026. **The historical cross-validation bounty is not counted as newly resolved by this work.** The weighted and modal certificates remain proved research results. A prior theorem already supplies the zero-error improvement that was used to connect them to the sponsor's broad improvement criterion. No separate still-open paid criterion for the further weighted/modal results has been established.

This correction supersedes any earlier suggestion that order-sensitive input alone separates the zero-error result from the conformal prior. The coordinator identified the common-random-key reduction below; this worker independently checked it.

## 1. A common ordering preserves the original joint law

Let $`Z_1,\ldots,Z_K`$ be iid blocks of $`n`$ labelled examples. The original protocol applies an arbitrary order-sensitive learner $`A`$ to each concatenated leave-one-block-out sequence, retaining the order of the remaining blocks.

Attach independent continuous keys $`U_1,\ldots,U_K`$, independent of the blocks. Define an augmented learner that sorts its retained blocks by these keys, calls $`A`$ on their concatenation, and ignores keys at prediction time. Sorting makes its nonconformity score invariant under permutations of its augmented input examples. If keys tie, use a fixed permutation-invariant fallback; ties have probability zero.

Let $`\pi`$ be the permutation that sorts all $`K`$ keys. Every augmented leave-one-out fit uses the same global order with its omitted block removed. After relabelling folds, its full fitted-model collection and corresponding validation errors are exactly the original coherent-order protocol run on

```math
(Z_{\pi(1)},\ldots,Z_{\pi(K)}).
```

Since $`\pi`$ is independent of the iid blocks, this sequence has their original joint law. In particular, model-description agreement, the common model's true risk, and the validation-error count have the same joint distribution as before. No independent permutation is applied separately to each fit. Such independent permutations would generally change the joint fitted-model law and are not the argument used here.

Independent randomized calls also fit the proof. In the augmented $`K+1`$-block analysis, assign independent seeds to unordered pairs of deleted blocks. A fixed deletion view then has the correct independent fitting seeds. Permuting the block labels permutes this iid seed array without changing its joint law. Together with key sorting, this preserves the exchangeability required by the prior theorem's leave-two-fold proof. No random function indexed by an uncountable collection of possible datasets is required.

## 2. The prior theorem supplies the zero-error certificate

Use [Cohen et al., CV-CRC, Theorem 1](https://arxiv.org/pdf/2401.11974) on vector-valued block examples. Assign binary nonconformity zero exactly when a fitted classifier predicts every label in the block correctly, and one otherwise. Use miscoverage loss and target $`\alpha=1/(K+1)`$.

On the event $`E_0`$ of identical fitted descriptions and zero validation errors, the calibrated set is the singleton vector predicted by the common classifier. Hence the theorem and the joint-law reduction give

```math
\mathbb E\left[\mathbf1_{E_0}
\left(1-(1-R(h))^n\right)\right]\le\frac1{K+1}. \tag{1}
```

Markov and inversion imply the endpoint

```math
1-\left(1-\min\left\{1,\frac1{(K+1)\gamma}\right\}\right)^{1/n}
```

at unconditional failure probability $`\gamma`$ on $`E_0`$. The prior Gibbs certificate applies off this event. Splitting a fixed total failure budget between them gives an all-sample computable certificate, exactly as in the candidate's combination step.

For fixed $`n,\gamma`$, the endpoint has order $`1/(Kn\gamma)`$, improving the one-held-out-fold scale on the observable event. The same sound stored-description test used in the candidate can recognize that event. Neither approach requires deciding semantic equivalence of arbitrary programs; neither is thereby a theorem for an unaugmented black-box-only model interface.

This is prior coverage of the particular improvement regime, without an order-insensitivity or unknown-stability assumption on the original learner. The historical sponsor's slides offered payment for an improvement without extra assumptions, but no evidence establishes a distinct continuing offer for every later refinement. The present research cannot be counted as a newly resolved open bounty on that evidence.

## 3. The weighted identity is still a different mathematical statement

The prior coverage above does not invalidate the proof of the stronger random-error-count moment. Nor do fixed-level truncated-event inequalities alone imply that moment.

For example, write

```math
S_k=\mathbb E[\mathbf1_E\mathbf1_{\{r\le k\}}R],
\qquad S_k\le\frac{k+1}{m+1},\quad 0\le k\le m.
```

Summation by parts yields only

```math
\begin{aligned}
\mathbb E\frac{\mathbf1_E R}{r+1}
&=\frac{S_m}{m+1}
+\sum_{k=0}^{m-1}S_k\left(\frac1{k+1}-\frac1{k+2}\right)\\
&\le\frac{H_{m+1}}{m+1},
\end{aligned}
```

where $`H_{m+1}`$ is the harmonic number. The abstract law with $`E`$ certain, $`R=1`$, and $`r`$ uniform on $`\{0,\ldots,m\}`$ attains these prefix bounds and the harmonic expression. This is a logical countermodel to an implication from the prefix inequalities. It is not asserted to arise from a realizable cross-validation learner.

Thus the weighted identity and the adaptive modal theorem may constitute further mathematical contributions. That possibility does not restore a completed-bounty count. Their novelty, any subsequent sponsor-defined criterion, and any award remain separate questions.

## 4. Remaining interface and source limits

The mathematical results retain fixed iid blocks, coherent retained-input order, measurable predictions, and a sound equality interface for the fitted models. Their confidence allocation is explicit; they do not uniformly dominate a baseline using the entire failure budget on every sample. Their claims concern a classifier derived from the supplied fold models, not a different model retrained on all data.

The attempt to obtain Oneto et al.'s 2015 full text reached the author publication page and the Pisa and Genova institutional records. Both institutional records expose the abstract but state that no associated file is available. The Genova page was successfully retrieved by an ordinary public HTTP request after the web reader's fetch failed. The original full text remains uninspected, and no exact theorem exclusion is inferred from its title. This source limitation no longer controls the bounty decision: (1) already establishes the relevant prior coverage.

No sponsor was contacted, and no prize acceptance or payment is reported.

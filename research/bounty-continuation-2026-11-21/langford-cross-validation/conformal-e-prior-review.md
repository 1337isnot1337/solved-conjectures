# Conformal e-prediction and the weighted-unanimity cross-validation bound

21 November 2026. This is a primary-source scope check for the ongoing Langford cross-validation investigation. It does not establish novelty by itself, claim a completed prize, or report sponsor acceptance. The general e-value method is prior work and must be credited.

## Sources inspected

1. Vladimir Vovk, [*Conformal e-prediction*](https://alrw.cs.rhul.ac.uk/articles/26.pdf), working-paper version first posted 16 January 2020 and last revised 25 April 2026. The work was published in *Pattern Recognition* in 2025. The downloaded 32-page PDF has 453,518 bytes and SHA-256 `dbee1d6133bd0b58271d5fc90e53dbb15b1f66633ea0acca41c821d9c92ca975`. This review reads the definitions in Section 2, Proposition 2, Sections 5–6 including Propositions 10–11, and their proofs. It does not audit the separate iterated-logarithm appendix.
2. Vladimir Vovk, [*Aggregation in conformal e-classification*](https://proceedings.mlr.press/v329/vovk26a.html), COPA 2026, with [primary PDF](https://raw.githubusercontent.com/mlresearch/v329/main/assets/vovk26a/vovk26a.pdf). The downloaded PDF has 822,032 bytes and SHA-256 `ac79f9baac07e1d7a3cd63691a7eb792deddef34930a9bce7ae35d2b6117a66b`. This review reads the introductory scope, the normalization formulas, and Section 6's aggregation definitions and comparison.

The PDFs are inspection intermediates, not republished artifacts.

## What the prior results provide

Vovk's general conformal e-measure is permutation equivariant and assigns nonnegative scores whose average over the augmented sample is at most one. Proposition 2 deduces expected score at most one for exchangeable data. Section 5 constructs split e-predictors by normalizing scores on the held-out sample and a proposed test observation. Section 6's cross-conformal predictor averages the resulting split e-values across folds. Proposition 11 proves validity by linearity of expectation. Its cross-nonconformity measure is invariant to the order of the training inputs.

The 2026 aggregation paper retains this foldwise averaging construction in Section 6.2 and studies its predictive efficiency, including alternatives to the chosen number of folds. The cited section does not state a risk bound gated on equality of the supplied fold classifiers or the weighted shared-classifier identity considered here.

## Exact comparison on the zero-error event

Use binary loss as the split nonconformity score. If a fold has size $`b`$, zero validation errors, and the proposed test observation is misclassified, normalization gives its test e-value as $`b+1`$. Discard the nonnegative contribution on a correctly classified test observation. If the fold classifiers all give the same predictions, averaging these reduced split scores gives

```math
 (b+1)\,1\{h(X)\ne Y\}
```

on the unanimous zero-error event. Setting the score to zero off that event only decreases this nonnegative score. The resulting immediate moment bound is

```math
 \mathbb E[1_E R(h)]\le\frac1{b+1}.
```

This calculation is an application of the published split-averaging construction, not a new theorem. It retains the size of one held-out fold. For leave-one-out, $`b=1`$.

The proposed weighted-unanimity argument instead uses common classifiers across deletion views of an augmented sample. In the leave-one-out case it establishes the stronger, observed-error-dependent identity

```math
 \mathbb E\left[1_E\frac{R(h)}{r+1}\right]\le\frac1{m+1},
```

where $`r`$ is the error count on the original $`m`$ examples when the supplied fold classifiers coincide. The distinction is the normalization at the full-sample scale and the deletion-view consistency needed to justify it. It is not merely a different name for the arithmetic average of the standard split scores.

## What must still be proved for the proposed construction

For permutation-invariant learners, a successful shared-classifier construction can be expressed as a conformal e-measure after the required deterministic score-sum inequality is proved. The generic validity theorem then supplies the expectation step. This observation is useful attribution; it does not itself prove that score-sum inequality for the proposed efficiently evaluated score.

For an order-sensitive learner, deleting any position from an iid ordered sample leaves an ordered iid sample. Equality of these marginal laws is enough for the proposed deletion-view proof. It does not make its full score vector permutation equivariant, so the stated general conformal definition cannot simply be invoked unchanged. The proof also needs a coherent order of the remaining observations and a common coupling of a pair-deletion fit wherever it appears in two views.

Classifier equality must be a computable sufficient test when the final bound is called computable. Equality of finite stored classifier descriptions has this property. Unrestricted semantic equality of black-box functions does not. A sound syntactic test can fail to recognize two equivalent predictors; that only makes the resulting bound less informative. It does not create a hidden assumption that the learning algorithm is stable.

Finally, a moment bound with $`1_E`$ gives an unconditional confidence guarantee that may be informative on $`E`$. It does not give a conditional guarantee after dividing by the possibly unknown probability of $`E`$. The proposed result and any comparison with the sponsor's statement must retain that distinction.

## Conclusion of this check

The inspected conformal e-prediction results provide the general validity framework and an existing foldwise baseline. They do not directly provide the stated full-sample weighted-unanimity risk bound. This is one prior-work check, not a proof that the bound is new. The jackknife, stability, algorithmic-luckiness, and original prize-scope checks remain separate obligations.

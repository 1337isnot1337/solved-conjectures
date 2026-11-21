# Older modal-model work and the scope of the new certificate

21 November 2026. This source check concerns the [adaptive modal certificate](adaptive-modal-certificate.md). It does not establish a newly solved bounty. The later [CV-CRC comparison](cohen-cvcrc-scope.md) and the random-key reduction must also be considered when deciding whether the historical improvement offer was still open.

## 1. Bailey and Elkan's modal theories

The author-maintained [publication list](https://tlbailey.bitbucket.io/publications.html) identifies *Cross-Validation and Modal Theories* as Chapter 18, pages 345–359, in volume 3 of *Computational Learning and Natural Learning Systems*, MIT Press, 1995. The [author's full PostScript manuscript](https://tlbailey.bitbucket.io/papers/clnl92.final2.ps) was downloaded, converted locally, and inspected, especially Sections 2, 5.2–5.3 and 6.

Section 2 already defines the most frequent cross-validation model and uses syntactic identity as a computable sufficient test of equal predictions. Neither choosing a modal description nor using description equality is a new idea here.

The experiments concern FOIL on promoter datasets. Sections 5–6 report that a frequent model can have very low cross-validation error without correspondingly low test error. The discussion explains the elementary overlap fact: two identical zero-training-error leave-one-out fits cover the whole observed dataset. It does not give an all-learner upper confidence certificate with a weight based on the observed dissent count.

The adaptive certificate does not claim that the modal model always has smaller population risk than the other models. It proves an upper bound for the selected model and keeps a separately certified Gibbs alternative. This is consistent with the chapter's empirical caution.

## 2. The earlier accuracy-estimation paper

Bailey and Elkan's [*Estimating the Accuracy of Learned Concepts*](https://tlbailey.bitbucket.io/papers/ijcai93.final.ps), IJCAI 1993, pages 895–900, was also downloaded and converted. Its risk definitions, experimental design, results, and discussion were inspected. It compares cross-validation and the .632 bootstrap using FOIL and synthetic concept data. Its conclusions concern estimator variability, bias, and sensitivity to duplicate training observations. It does not provide the deletion-view moment or the adaptive modal confidence theorem claimed in the present note.

## 3. A precise distinction from fixed-level bounds

Fixed-level guarantees deserve prior credit but do not alone supply the weighted observed-error identity. For example, suppose only that, for every integer $`0\le k\le m`$,

```math
\mathbb E[\mathbf 1_E\mathbf 1_{\{r\le k\}}R]
\le \frac{k+1}{m+1}.
```

These inequalities alone do not imply

```math
\mathbb E\left[\mathbf 1_E\frac{R}{r+1}\right]
\le \frac1{m+1}.
```

As a statement about random variables, take $`E`$ certain, $`R=1`$, and $`r`$ uniform on $`\{0,\ldots,m\}`$. Every fixed-level inequality is an equality, whereas the weighted expectation is $`H_{m+1}/(m+1)`$. This abstract joint law is not asserted to arise from a learning algorithm. It only shows why an additional structural argument is required to remove the harmonic factor. The shared pair-deletion fits supply such an argument in the authored proof.

This distinction can support a claim about a further theorem. It cannot establish that the original cash offer, which advertised any assumption-free improvement, remained unresolved after a prior zero-error improvement.

## 4. Source receipts and status

| Downloaded source | SHA-256 |
| --- | --- |
| Bailey–Elkan 1993 PostScript | `6e651e0e8917c36c99e2a9bcceddf9beaeaacd9a457ceaf1881b01f70dd02702` |
| Bailey–Elkan 1995 PostScript | `b99db0567844d339dd566d710605f59e5beb63463a80714263188ec09cf80600` |

The source files are inspection intermediates, not redistributed publication artifacts. No inspected result in these two sources states the weighted or tournament-based certificate. This is a bounded source comparison, not a universal novelty proof. The campaign's completed proposed-solution count is unchanged.

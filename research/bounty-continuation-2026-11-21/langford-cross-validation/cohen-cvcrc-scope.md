# Cohen et al. CV-CRC: exact prior scope

21 November 2026. Primary source: [Cohen, Park, Simeone, Shamai, arXiv:2401.11974v2](https://arxiv.org/pdf/2401.11974), 1 May 2024. Downloaded PDF SHA-256: `8f3d64c9b70e80b67df229cf880962f17cde5003fea3ac3d3cf23a78651c0f1d`. Section III, Theorem 1, and Appendices C–D were read. The [subsequent common-order reduction](prior-coverage-correction.md) extends the zero-error corollary to the original coherent-order protocol; order sensitivity does not protect its novelty.

Theorem 1 assumes a permutation-invariant nonconformity score and a fixed target $`\alpha`$. It controls the dataset-averaged risk of the resulting union set predictor. Markov can turn this into a high-probability risk statement; the paper does not state an adaptive observed-error normalization or modal-frequency weight.

## Prior coverage of a subcase

Apply binary nonconformity to the $`K`$ blocks treated as individual vector-valued examples. Use miscoverage loss. At $`\alpha=1/(K+1)`$, zero observed block errors select the union of the fitted vector predictions. On the unanimous zero-error event $`E_0`$, this is a singleton. Therefore, for symmetric learners, the published theorem implies

```math
\mathbb E\left[\mathbf1_{E_0}\bigl(1-(1-R(h))^n\bigr)\right]
\le\frac1{K+1}.
```

That special case, including its common-order extension, must receive prior credit. It does not alone establish

```math
\mathbb E[\mathbf1_E F_{n,r}(R(h))]\le\frac1{K+1}
```

with random observed $`r`$, or the modal-frequency extension. The historical improvement bounty is not counted as newly resolved.

The rendered PDF's (44d)–(44f) move a minimum outside a within-fold sum. Keeping it inside repairs the chain and agrees with (42). This display issue is not used to dismiss the theorem. No sponsor or novelty conclusion follows from this scope check.

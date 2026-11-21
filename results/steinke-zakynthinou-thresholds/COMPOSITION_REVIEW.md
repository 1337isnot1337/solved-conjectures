# Composition review of the proper threshold proof

Reviewed 21 November 2026: [the consolidated proof](PROOF.md).

This is a narrow composition review of the two already reviewed source proofs. It does not repeat the complete proof audit or the finite indexing check. The composition passes without a mathematical correction.

## Source preservation

I compared the consolidated shifted-tree body with the pinned authored source and the consolidated properization body with its pinned source. After normalizing headings, the rendering-only spelling of the position operator, and the prefixed equation labels in Part II, each comparison had zero differing lines. The integration has not dropped the folded-order locality hypothesis, the common-support transport argument, the iid averaging step, the tag rounding, or the reference-law definition of the adaptive rank code.

## Final learner and quantifiers

The five-step algorithm always produces a finite real parameter. Closed finite outputs stay closed; an open output is represented on the training sample by its next observed feature, or by $`w+1`$ when no successor exists; the all-zero output is represented by one plus the selected sample maximum. Each conversion preserves every empirical prediction. The empirical infimum over finite real thresholds is consequently the same as the one used in Part I with its auxiliary all-zero endpoint.

The accuracy guarantee remains samplewise: it holds for every individual labeled input sample after expectation over all private randomness. The information guarantee remains averaged over an iid paired pool from every distribution. The broader fixed-pool validity of the properization lemma has not been promoted to a fixed-pool bound for the shifted-tree learner. The result includes atoms and arbitrary label noise; it does not require realizability or a global real-line embedding of the lexicographic tagged domain.

The learner does not receive the full paired pool. That pool is used only for the information proof and for reconstructing the rank-coded output in a conditional data-processing argument.

## One common constant

With $`\eta=1-2^{-1/4}>1/8`$, the stated preliminary constant satisfies

```math
C_I=\log2+\frac{1+e}{128\eta^2(1-2^{-1/2})}<9.
```

The properization lemma therefore gives information less than $`21`$ nats, while the empirical-excess coefficient obeys

```math
256/\eta+8<2056.
```

Changing nats to bits divides the information constant by $`\log2>1/2`$, so the bit bound is less than $`42`$. Thus the single absolute constant $`c=4096`$ safely bounds both information units and the accuracy coefficient for every positive integer sample size. No numerical approximation is needed for this comparison.

The main theorem states exactly the proper real-threshold version, and the text explicitly excludes the general VC conjecture. Proper and improper versions are one target. The publication wording also separates the proposed mathematical proof from Lean verification, external acceptance, sponsor acceptance, and payment.

The exact original drafts named by review hashes are preserved in [reviewed-sources.json](reviewed-sources.json). The consolidated [proof](PROOF.md) combines the checked construction and properization.

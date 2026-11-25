# Partial Lean verification: Németh–Seberry–Shu conjecture

[Written proof](PROOF.md) · [Original source, p. 181](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf)

The [Fourier construction](../../lean/Conjectures/NemethSeberryShuFourierSampling.lean) checks simultaneous approximation to the prescribed means at the zero and two distinguished nonzero frequencies, with exactly the requested dense row sum. The unnormalized error bound is $4\sqrt{p\log p}$. The [spectral identities](../../lean/Conjectures/NemethSeberryShuFourierSpectral.lean) check character orthogonality, literal binary circulant eigenvectors and Parseval.

The [congruence proof](../../lean/Conjectures/NemethSeberryShuCongruence.lean) uses the actual permanent of the binary matrix with entry 1 when the column minus the row belongs to the support. It counts the fixed points of translation-conjugation on supported permutations to obtain the permanent modulo the prime. The [counting continuation](../../lean/Conjectures/NemethSeberryShuCounting.lean) counts across dense row sums and proves eventual superlinearity **conditional** on uniform within-row separation. The new [log-separation bridge](../../lean/Conjectures/NemethSeberryShuLogSeparation.lean) proves strict amplitude monotonicity, a common positive gap over the full density interval, and that sufficiently small uniform normalized-log errors force strictly ordered permanent values. It yields the original refutation under one explicit hypothesis, `UniformLogProfileApproximation`. Establishing that hypothesis using the uniform permanent asymptotic remains open in Lean; it is not a project axiom. The quadratic refinement is also written only.

Conjecture credit: Evi Németh, Jennifer Seberry and Michael Shu. The permanent congruence uses Brualdi–Newman’s Theorem 3.2; the written original disproof retains the attribution to Cinna Davis and GPT-6.2 Astra and its existing credit and priority caveats. The Lean sources are reused from Cinna Davis’s [algebraic checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/394e33f76baf572895eb753f0ba1b8adca148da1) and [Fourier checkpoint](https://github.com/1337isnot1337/solved-conjectures/commit/4ad9db75d68644c29221f7223d019bc9f419c7d3).

## Verification

[Counting and log-separation receipt](verification/counting/receipt.json) · [Spectral receipt](verification/spectral/receipt.json)

Each receipt lists the command arguments, exact source hashes and audit results for the target closure. Run `scripts/verify_lean_target.py` with the receipt’s root and each listed required endpoint after installing the pinned Mathlib cache. The aggregate repository gate and the full asymptotic disproof are not checked by these receipts.

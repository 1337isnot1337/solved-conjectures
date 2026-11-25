# Lean scope for the Kauers–Koutschan recurrence

This is partial verification of [Conjecture 10 of Kauers and Koutschan](https://arxiv.org/abs/2202.07966) and the [written proof](PROOF.md).

- [Divided differences](../../lean/Conjectures/KauersKoutschanDividedSum.lean). Lean proves the equality of the paired and centered full sums in §4, both first-order state recurrences, and equation (5) for every natural index. It also proves the omitted-pair identity in equation (6) for every admissible shifted cutoff, including an empty omitted range.
- [Polynomial certificate](../../lean/Conjectures/KauersKoutschanCertificate.lean). The original coefficient certificate from [PR #281](https://github.com/1337isnot1337/solved-conjectures/pull/281) checks the published order-eight and order-thirteen operators for both parities and all six independent state components. It also checks the four initial residuals on the finite-sum model. The decisions are exact kernel reductions over rational coefficients.

Connecting the coefficient operations to evaluation of the actual shifted state remains open in Lean. The literal permutation count, signed block generating function and Schur moment argument in §§1–3 also remain outside the checked scope.

The pinned Lean 4.35.0 strict source builds, all-owned transitive axiom audits and separate stock-kernel replays passed for the [divided sums](verification/divided-sums/receipt.json) and [coefficient certificate](verification/coefficients/receipt.json).

# Sun–Zhao's conjecture

Proposed complete disproof of Brian Y. Sun and James J. Y. Zhao's Conjecture 5.2 in [arXiv:1602.04359v4](https://arxiv.org/pdf/1602.04359), *Log-behavior of two sequences related to the elliptic integrals*.

Let $`P_n`$ be the Catalan–Larcombe–French numbers and let $`\mathcal R(a)_n=a_{n+1}/a_n`$. The conjecture asserts that, for every $`k\ge1`$, deleting the first $`k`$ terms of $`\mathcal R^k(P)`$ leaves a log-concave sequence for odd $`k`$, and a log-convex sequence for even $`k`$.

At $`k=12`$, the three retained entries with indices 12, 13, and 14 violate the required log-convexity. The exact rational certificate is

```math
-\frac{185605}{10^{15}}
 <\Delta^{14}\log P_{12}
 <-\frac{185604}{10^{15}}<0.
```

This is a counterexample to the complete universal assertion. It is not a positive case of the conjecture and does not assert a theorem about all larger iteration orders. The source's separate Conjectures 5.1 and 5.3 remain outside this result.

## Files

- `PROOF.md`: exact source statement, indexing, integer values, and rational logarithmic certificate.
- `check.py`: standard-library exact arithmetic verifier. It uses neither floating-point arithmetic nor external packages.
- `witness.json`: output of the verifier, including the fifteen source-sequence values.
- `ALGEBRA_REVIEW.md`: independent primary-source and mathematical audit.
- `NOVELTY.md`: search scope, distinctions from known theorems, and access limits.

Run the complete verifier with:

```sh
python3 check.py
```

It checks the recurrence against two binomial sums, the exact integer product inequality, the rational logarithm remainder, and twelve successive applications of the ratio transform using rational numbers. Every comparison is exact. The products compared in the direct certificate each have 582,535 binary digits.

The latest arXiv statement is the verified target. The associated 2020 journal article was identified, but its complete text was unavailable during this audit; no claim is made that the journal's final conjecture wording is identical. The literature search found no earlier resolution in the sources examined. As with any bounded search, this does not prove the absence of unpublished or unindexed prior work.

Research discussion: [issue 198](https://github.com/1337isnot1337/solved-conjectures/issues/198).

21 November 2026.

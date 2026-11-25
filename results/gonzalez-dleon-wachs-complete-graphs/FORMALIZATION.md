# Lean scope for González D’León–Wachs’s complete-graph specialization question

**Partial.** Lean checks the formal-series and coefficient identities in
the [written solution](PROOF.md) to
[González D’León–Wachs, Question 7.1](https://arxiv.org/html/2608.08692v2#S7.SS1).
The number of equal variables is `p+2`, and the number of graph
vertices in the coefficient theorem is `k+1`.

1. The [multiset model](../../lean/Conjectures/WachsCompleteGraphHomogeneous.lean)
   counts the terms of the actual complete homogeneous symmetric polynomial
   on a finite alphabet. At equal variables it proves the binomial
   coefficient and verifies each forcing-series coefficient.
2. The [Vandermonde identity](../../lean/Conjectures/WachsCompleteGraphVandermonde.lean)
   and [forcing-series theorem](../../lean/Conjectures/WachsCompleteGraphForcing.lean)
   verify the equal-variable Kummer calculation coefficientwise in all
   degrees. The [normalization theorem](../../lean/Conjectures/WachsCompleteGraphLaguerreNormalization.lean)
   identifies the polynomial with the usual signed associated Laguerre
   coefficient formula after negating the variable and dividing by `p+1`.
3. The [formal coefficient answer](../../lean/Conjectures/WachsCompleteGraphCoefficientFormula.lean)
   proves the exponential times inverse-Laguerre-power formula from
   the Lagrange-normalized coefficient expression for every size.
   Given an explicit linear factorization of the Laguerre polynomial,
   Lean proves the equivalent [formal Gamma moment expansion](../../lean/Conjectures/WachsCompleteGraphMomentExpansion.lean)
   with all moments defined by formal power series.

The weighted bond-poset Möbius and Lagrange inversion bridge to the
original characteristic polynomial, positive Laguerre roots, the
probabilistic Gamma identification, and the log-concavity and real-zero
consequences are outside this check. The existing proof and its
attribution, including the prior two-variable result, remain unchanged.
The separate question of Schur-log-concavity is not asserted.

The [receipt](verification/formal-series/receipt.json) records strict
compilation, an audit of every owned declaration, and independent
pinned stock-kernel replay.

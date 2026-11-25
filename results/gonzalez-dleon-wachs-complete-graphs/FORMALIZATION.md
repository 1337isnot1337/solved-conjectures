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

## Literal weighted bond-poset polynomial

Lean models the complete graph by finite partitions whose individual
blocks carry weak weight compositions of their sizes minus one. It
proves transitivity of the actual weighted refinement, constructs the
discrete bottom, and proves the rank exponent is the sum of the
weights. The characteristic polynomial uses the integer Möbius
function computed by well-founded recursion, not the series answer
as its definition. Lean proves its cumulative cancellation law and
uniqueness.

The [literal theorem](../../lean/Conjectures/WachsCompleteGraphMoebiusLaw.lean)
gives the Laguerre answer from one explicit remaining bridge: the
Lagrange-normalized coefficient formula for that actual polynomial.
The formal Gamma expression also assumes the polynomial's linear
factorization. See the [literal-poset receipt](verification/literal-weighted-poset/receipt.json).
The EGF/Lagrange bridge, positive Laguerre roots, the probability
identification, and the log-concavity and real-zero consequences
remain outside the Lean scope. The existing proof and its
attribution, including the prior two-variable result, remain unchanged.
The separate question of Schur-log-concavity is not asserted.

## Cancellation over actual one-block completions

Lean counts the maximal weighted completions of each weighted partition
by the weak compositions of its remaining rank. Summing the literal
Möbius cancellation over the one-block tops and exchanging the two
finite sums gives the [grouped recurrence](../../lean/Conjectures/WachsCompleteGraphOrdinaryFibres.lean)
over ordinary partitions. The same grouping gives the actual
characteristic polynomial as a sum over ordinary partitions.
The weight allocations in each fibre are equivalent to the product
of the weak composition types of its individual blocks; the
[cardinality formula](../../lean/Conjectures/WachsCompleteGraphFibreWeights.lean)
counts these allocations, not their Möbius values. The
[one-block receipt](verification/one-block-cancellation/receipt.json)
records the scoped independent replay.

This checks the finite one-block cancellation step of the recurrence
underlying Theorem 5.7 in the cited paper.

## Product of literal lower intervals and Möbius sums

Lean constructs the order equivalence of the full weighted lower
interval with the independent lower intervals on its actual labeled
blocks. To prove the Möbius identity, Lean restricts to one component
with all others at bottom. The product of the component Möbius
values obeys the ambient cumulative cancellation law and hence is
the actual recursive value. Finally Lean sums this identity over the
independent block weight allocations, proving the
[ordinary-fibre factorization](../../lean/Conjectures/WachsCompleteGraphFibreProduct.lean)
from any valid seed allocation. Each block factor is independent of
the weights assigned to the other blocks. See the
[block factorization receipt](verification/block-moebius-factorization/receipt.json).

Identifying these labeled factors across ambient vertex sets with the
canonical block-size sequence, the exponential formula and Lagrange
inversion remain outside this checkpoint.

The [receipt](verification/formal-series/receipt.json) records strict
compilation, an audit of every owned declaration, and independent
pinned stock-kernel replay.

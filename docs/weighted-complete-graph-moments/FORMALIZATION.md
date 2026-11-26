# Lean scope for González D’León–Wachs’s complete-graph specialization question

The Omega Institute published the complete-graph answer to González D’León–Wachs Question 7.1 on 23 November 2026, before this repository’s 24 November publication. Its polynomial factor is the normalized associated Laguerre polynomial in equation (4) here. The Gamma-moment representation, strict coefficient log-concavity and exact real-zero count are the scope of this supplement. [Earlier proof](https://github.com/the-omega-institute/trureturing/pull/33676). The dated checks below describe the repository work.

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

The [literal-poset receipt](verification/literal-weighted-poset/receipt.json)
covers this construction and the conditional reductions first obtained
from it. The EGF and Lagrange steps of the same literal construction are
now verified below. The existing proof and its attribution, including
the prior two-variable result, remain unchanged. The separate question
of Schur-log-concavity is not asserted.

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

## Canonical finite recurrence by block sizes

Lean now relabels every live block by its cardinality, also when the
ambient sizes differ. The relabeling preserves the full weighted
refinement order and the literal Möbius value. The
[finite recurrence](../../lean/Conjectures/WachsCompleteGraphSizeRecurrence.lean)
therefore uses the actual sum of one-block Möbius values on the
canonical set of each size. Lean also obtains the exact
characteristic polynomial as a sum of products of these size factors.
See the [canonical size receipt](verification/canonical-size-recurrence/receipt.json).

## Exact equal-variable Laguerre formula

Lean proves the labeled weighted exponential formula by distinguishing a
vertex and counting its block choices. It identifies the coefficients of
the literal rank-generating polynomial with the exponential generating
function of the canonical one-block Möbius totals, and proves the forcing
series is their compositional inverse. The parameter is real and may be
zero.

The proof of formal Lagrange–Bürmann uses ordinary power series,
coefficient cancellation and formal differentiation. The
[literal Laguerre formula](../../lean/Conjectures/WachsCompleteGraphActualLaguerre.lean)
is now unconditional for every nonempty complete graph and every
number of equal variables at least two. See the [full-formula receipt](verification/literal-laguerre-formula/receipt.json).

## Positive Laguerre rates and strict coefficient log-concavity

Lean checks the Laguerre three-term recurrence, the monic normalization,
and strict interlacing of consecutive root lists. A degree count
identifies the lists as all the roots, and the normalization yields the
exact factorization with distinct positive rates. This removes the
last explicit input of the [formal moment theorem](../../lean/Conjectures/WachsCompleteGraphStrictLogConcavity.lean).

Lean proves positivity and log-concavity for each formal Gamma factor
and the exponential factor. A finite order-two minor expansion proves
closure under convolution. The descending factorial factor then gives
strict log-concavity of the actual signed rank coefficients for at least
two equal colors. See the
[positive-root receipt](verification/positive-laguerre-roots/receipt.json)
and the [combined moment receipt](verification/positive-moments-and-log-concavity/receipt.json).

## Actual Gamma expectation and real roots

Lean identifies the formal moments with actual Mathlib Gamma measures.
The law is the shifted sum obtained by taking product measures and
pushing them forward under addition. Its integer moments are finite.
The literal characteristic polynomial is the expectation of the
corresponding affine power, for at least two equal colors.

For at least three equal colors the law has no atoms and is strictly
above the number of vertices. Lean proves that the literal polynomial
is everywhere positive in even degree, and in odd degree has exactly
one real root, simple and strictly between zero and the reciprocal of
the number of vertices. The derivative proof uses the finite polynomial
expansion, not differentiation under an integral. See the
[Gamma and real-zero receipt](verification/gamma-expectation-and-real-zeros/receipt.json).

## Boundary colors and complete stated scope

Lean also derives the one-color product directly from the literal
weighted Möbius recurrence. Its signed rank coefficients are positive
in range and strictly log-concave, as are those for every larger
positive number of colors. The prior two-color power formula and the
printed three-color coefficient example are checked in the same rank
convention. The real-root multiset and the failure to split over the
reals are consequences of the verified degree and real-root count.

This completes the stated equal-variable answer to Question 7.1
and the strict ordinary coefficient log-concavity and real-zero
claims in the entry. It does not settle the separate Schur-log-concavity
question. The [final scope receipt](verification/complete-stated-result/receipt.json)
binds the previous independently checked scopes and the new boundary
and all-color modules.

The [receipt](verification/formal-series/receipt.json) records strict
compilation, an audit of every owned declaration, and independent
pinned stock-kernel replay.

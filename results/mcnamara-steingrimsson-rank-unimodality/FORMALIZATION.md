# Lean scope for McNamara–Steingrímsson’s interval rank-unimodality conjecture

**Partial.** This work formalizes the literal permutation-containment
reductions in the written disproof contributed by aadrianvv in
[PR #651](https://github.com/1337isnot1337/solved-conjectures/pull/651).
The conjecture and discovery attribution remain as recorded in the
[original audit](AUDIT.md).

- [Greedy layer subwords](../../lean/Conjectures/McNamaraSteingrimssonSubwords.lean)
  are exactly the distinct size-one/size-two words matched by increasing
  host positions, with weakly larger host layer sizes.
- [The weighted recurrence](../../lean/Conjectures/McNamaraSteingrimssonPolynomial.lean)
  counts those literal distinct words by total layer size. It proves both
  the size-two transition and the size pattern `1,1,1,2` used in the proof.
- [Normalization](../../lean/Conjectures/McNamaraSteingrimssonNormalize.lean)
  constructs the actual permutations of `Fin n`. Classical pattern
  containment of the layered permutations is equivalent to the greedy
  subword relation, and [distinct words give distinct patterns](../../lean/Conjectures/McNamaraSteingrimssonDistinct.lean).
- [Leading maximum](../../lean/Conjectures/McNamaraSteingrimssonPointed.lean):
  all layered hosts avoid 312, and the pointed construction with at least
  two layers contains 312. This proves the tail equivalence for pointed
  layered permutations.
- [Direct sums](../../lean/Conjectures/McNamaraSteingrimssonDirectSum.lean):
  a pattern whose first entry is its maximum must occur in one summand,
  and any occurrence in one summand lifts to the whole direct sum.

- [Arbitrary subpatterns](../../lean/Conjectures/McNamaraSteingrimssonLayerRestriction.lean)
  of a literal layered permutation are layered. Lean reconstructs the
  word from the occupied host blocks and selected slots.
- [The full pointed interval](../../lean/Conjectures/McNamaraSteingrimssonPointedCount.lean)
  has a bijection between each actual rank and its qualifying layer
  words. For the two small endpoints `[α,π]` in the written proof, the
  size of rank `r` is exactly `25.choose r`, for all `r`. The
  [pointed-interval receipt](verification/pointed/receipt.json) includes this result.

- [Split at the host boundary](../../lean/Conjectures/McNamaraSteingrimssonSplitSound.lean):
  each literal pattern of a direct sum factors at the actual crossing
  point of its increasing position embedding. The two factors are
  the canonical permutations on the two segments.
- [Two-summand count](../../lean/Conjectures/McNamaraSteingrimssonFamilyCounts.lean):
  for every positive relative rank, the actual interval
  `[α,α ⊕ π]` splits into the full-prefix family and the proper-prefix
  family. In the latter the position of the largest value determines
  the prefix size, so each distinct permutation is counted once.
  Lean proves the exact sum of the downset count and the convolution
  of the proper-prefix and pointed-interval counts. The
  [two-summand receipt](verification/two-summand/receipt.json) records the check.

- [Repeated-sum factorization](../../lean/Conjectures/McNamaraSteingrimssonRepeatedActualFactors.lean):
  any literal intermediate permutation for the repeated endpoints
  splits into the normalized patterns of the host blocks it actually
  uses. All but one of its long factors equal the full long endpoint.
  If the omitted long block is not the first, the initial factor
  equals the full short endpoint, and the exceptional factor has size
  exactly the relative rank, so it is nonempty and proper at every
  interior rank. The endpoint lengths 109051 and 109118 are also
  checked. The
  [repeated-factor receipt](verification/repeated-factors/receipt.json)
  records the check. This is an existence theorem for the
  factorization, not the required disjoint enumeration.

The complete repeated-sum interval decomposition and the exact final
three rank sizes are not established by this scope. The
[receipt](verification/receipt.json) records strict Lean compilation,
the all-owned axiom audit, and stock-kernel replay of the eight-module closure.

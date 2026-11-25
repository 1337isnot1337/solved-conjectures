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

The complete repeated-sum interval decomposition and the exact final
three rank sizes are not established by this scope. The
[receipt](verification/receipt.json) records strict Lean compilation,
the all-owned axiom audit, and stock-kernel replay of the eight-module closure.

# Hajdu–Sárközy’s shifted-product total primitivity conjecture

**Proved in the full exponent range.** For any two exponents greater than one, the shifted values of the product of the two powers cannot be written as a nontrivial product of two sets, even after finite changes. In particular this handles the previously unresolved coprime exponents.

**Lean verification is complete for the original all-exponent conjecture, the full summable-family theorem, and the two-variable nonzero-shift perturbation theorem.** The actual real-threshold counts, positive retained-count limsup, arbitrary nontrivial positive-integer factors, and every finite modification are included. The optional observation about more than two variables is not separately formalized.

The proof works more generally for a summable union of scaled shifted-power sets. The finite colors permit a thin-rectangle edge bound, and the remaining colors have arbitrarily small density at the smaller exponent’s scale.

- [Complete proof and stronger theorem](PROOF.md)
- [Independent audit and prior work](AUDIT.md)
- [Exact Lean scope and reproduction](FORMALIZATION.md)
- [Independent Lean statement and proof review](LEAN_REVIEW.md)
- [Original-conjecture Lean endpoint](../../lean/Conjectures/HajduSarkozyProducts.lean)
- [Full summable-family Lean theorem](../../lean/Conjectures/HajduSarkozyProductsFamily.lean)
- [Complete proof verification receipt](verification/receipt.json)
- [Publication registration and source binding](verification/publication-binding.json)
- [Discovery issue #418](https://github.com/1337isnot1337/solved-conjectures/issues/418)

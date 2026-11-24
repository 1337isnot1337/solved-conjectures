# Hajdu–Sárközy’s shifted-power perturbation conjecture

**Proved, including the square case.** For every exponent at least two, changing a vanishing proportion of shifted-power values cannot turn the set into a nontrivial product set. The argument allows any fixed nonzero shift and remains valid after any finite modification.

**Lean verification is complete for the original conjecture and the general nonzero-shift symmetric-difference theorem.** The eleven-module proof includes all exponents at least two, actual real-threshold counts, arbitrary nontrivial positive-integer factor sets, every finite modification, and the original zero-root convention. The written proof’s stronger added-error/retained-limsup supplement remains unformalized.

A determinant forbids four-cycles in thin multiplicative intervals. Summing the resulting edge bounds over all intervals avoids losing a logarithmic factor.

- [Complete proof](PROOF.md)
- [Independent audit and priority scope](AUDIT.md)
- [Exact Lean scope and reproduction](FORMALIZATION.md)
- [Independent Lean statement and proof review](LEAN_REVIEW.md)
- [Lean endpoint](../../lean/Conjectures/HajduSarkozy.lean)
- [Publication verification receipt](verification/receipt.json)
- [Original frozen lane receipt](verification/lane/receipt.json)
- [Discovery issue #416](https://github.com/1337isnot1337/solved-conjectures/issues/416)

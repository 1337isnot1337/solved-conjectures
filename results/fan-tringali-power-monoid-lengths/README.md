# Fan–Tringali’s power-monoid length-set conjecture

Lean verification is complete for the full original 2018 conjecture in both ordinary and restricted finitary power monoids of every Dedekind-finite monoid with infinitely many distinct positive powers. Lean also proves the exact reduced natural-number length system. The 18-module proof passed strict source builds, the complete declaration/axiom audit, and stock kernel replay. See the [full theorem and scope](LEAN.md), [statement review](LEAN_REVIEW.md), and [verification receipt](../../docs/verification/lean-fan-tringali-complete-20261124-162051/receipt.json). The written proof’s separate survey, multiplicity, and relative-cancellativity supplements remain unformalized.

**Proved.** Every nonempty finite subset of the integers at least two is a length set in the power monoids in the original conjecture. In the reduced setting, the same construction prescribes the multiplicity of each length.

A finite grid gadget makes all atomic factorizations correspond to the maximal cliques of a graph. Encoding the grid in a sufficiently large radix preserves the factorizations and their atom status.

- [Complete proof and transfers](PROOF.md)
- [Independent audit](AUDIT.md)
- [Exact graph gadget checker](check.py)
- [Discovery issue #414](https://github.com/1337isnot1337/solved-conjectures/issues/414)

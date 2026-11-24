# Fan–Tringali’s power-monoid length-set conjecture

## Checked scope

This is an incomplete formalization of the existing [proof](PROOF.md), sections 1–2, now including the complete graph construction and its factorization classification. The written construction was committed by Cinna Davis in `0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4`; its recorded priority uncertainty is preserved. The original conjecture is due to Y. Fan and S. Tringali, *Power monoids: A bridge between factorization theory and arithmetic combinatorics*, J. Algebra 512 (2018), section 5. The source and priority record in [PROOF.md](PROOF.md) remains authoritative; this checkpoint makes no new discovery or priority claim.

`Conjectures.FanTringaliBasic` defines reduced finite-set atoms, unordered factorization data, and literal sumsets. For every finite coordinate set it classifies all factors of a Boolean box, identifies precisely the one-axis atoms, and proves every atomic factorization of the box has length equal to its number of axes.

`Conjectures.FanTringaliGadget` proves the nine-point gadget has exactly one horizontal quotient, exactly one vertical quotient, and no square quotient. The quantifier ranges over every finite set in the nonnegative integer plane; a proved subset reduction justifies the finite `decide` calculation. This gadget is a component of the arbitrary-dimensional graph proof, not a separate counted result.

## Verification

Fresh strict compilation used Lean 4.35.0 and the repository's pinned Mathlib revision. The repository all-owned audit generator and validator checked all 74 owned declarations, including private declarations if present, and all six named endpoints. Stock `leanchecker` replay passed for both modules. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The [receipt](../../docs/verification/lean-fan-tringali-20261124-162051/receipt.json) contains exact source hashes. This is scoped verification; it does not assert that the complete repository build has passed.

## Graph realization checkpoint

`FanTringali.graph_lengths` proves the exact identity for every finite graph construction: the complete atomic length set consists precisely of one plus the cardinalities of its maximal cliques. Both directions are checked, including the exclusion of every other atomic factorization. The intermediate modules classify every slab quotient, assemble the independently marked slices, prove uniqueness of every graph quotient, and identify the atomic high factors with maximal cliques. A full Boolean upper slice is included at marker zero in every case; its quotient theorem proves that this padding adds no divisor restrictions.

The [second receipt](../../docs/verification/lean-fan-tringali-graph-20261124-162051/receipt.json) covers all nine modules, 290 owned declarations and eleven named endpoints. Fresh strict builds and stock kernel replay passed, and the all-owned/private audit permits only the three standard axioms. Active builds used two Lean workers after one-worker imports stalled; this changes scheduling, not the proof or kernel trust model. The original two-module receipt remains an earlier verified checkpoint.

## Remaining work

The disjoint-clique realization of every prescribed finite nonempty spectrum, the no-carry radix transfer to the nonnegative integers, and the transfers to arbitrary Dedekind-finite non-torsion monoids are outside this frozen checkpoint. The optional multiplicity and relative-cancellativity conclusions are not claimed by its endpoint. The full original conjecture remains incomplete and contributes zero completed results to the campaign started 2026-11-24 16:20:51 UTC.

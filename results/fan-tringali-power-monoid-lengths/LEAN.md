# Fan–Tringali’s power-monoid length-set conjecture

## Checked scope

This is an incomplete formalization of the existing [proof](PROOF.md), sections 1–2. The written construction was committed by Cinna Davis in `0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4`; its recorded priority uncertainty is preserved. The original conjecture is due to Y. Fan and S. Tringali, *Power monoids: A bridge between factorization theory and arithmetic combinatorics*, J. Algebra 512 (2018), section 5. The source and priority record in [PROOF.md](PROOF.md) remains authoritative; this checkpoint makes no new discovery or priority claim.

`Conjectures.FanTringaliBasic` defines reduced finite-set atoms, unordered factorization data, and literal sumsets. For every finite coordinate set it classifies all factors of a Boolean box, identifies precisely the one-axis atoms, and proves every atomic factorization of the box has length equal to its number of axes.

`Conjectures.FanTringaliGadget` proves the nine-point gadget has exactly one horizontal quotient, exactly one vertical quotient, and no square quotient. The quantifier ranges over every finite set in the nonnegative integer plane; a proved subset reduction justifies the finite `decide` calculation. This gadget is a component of the arbitrary-dimensional graph proof, not a separate counted result.

## Verification

Fresh strict compilation used Lean 4.35.0 and the repository's pinned Mathlib revision. The repository all-owned audit generator and validator checked all 74 owned declarations, including private declarations if present, and all six named endpoints. Stock `leanchecker` replay passed for both modules. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The [receipt](../../docs/verification/lean-fan-tringali-20261124-162051/receipt.json) contains exact source hashes. This is scoped verification; it does not assert that the complete repository build has passed.

## Remaining work

The graph construction and classification of every graph quotient, the maximal-clique/atomic-factorization correspondence, the no-carry radix transfer, realization of every finite nonempty prescribed length set, and the transfer to arbitrary Dedekind-finite non-torsion monoids are not yet formalized. The optional multiplicity and relative-cancellativity conclusions also remain outside this checkpoint. This entry contributes zero completed results to the campaign started 2026-11-24 16:20:51 UTC.

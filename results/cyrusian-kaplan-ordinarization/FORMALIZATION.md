# Lean verification of the ordinarization encoding

## Exact scope

Lean proves the exact finite-set encoding in §1 of [the written proof](PROOF.md).
A numerical semigroup is an actual additive submonoid of the natural numbers
with its exact finite set of positive gaps. The Frobenius bound follows from
reflection across any gap. The positive members up to genus and the gaps
above genus give a bijection with the two admissible finite sets, without
any large-genus hypothesis.

The actual ordinarization step removes the smallest positive member and
inserts the largest gap. Lean proves genus preservation, exactly one fewer
positive low member, and existence and exact length of a path to the ordinary
semigroup. The resulting cardinality theorem therefore uses the literal
ordinarization number, not a statistic taken as an assumption. The
[normalized count](../../lean/Conjectures/CyrusianKaplanCountCheckpoint.lean)
puts the actual integer tests in the fixed real genus-one region at every
positive genus, preserving the strict boundaries. A separate finite result
checks the exact binomial sum (3) for the baseline pairs in §2.

The encoding and tree formulation are credited to Sogol Cyrusian, Nathan
Kaplan and Maria Bras-Amorós as in the [primary paper](https://doi.org/10.1080/00927872.2026.2615092).
The exact all-genus question is Remark 3.7. This Lean checkpoint verifies the
encoding and scaling, not the stratification into relative interiors,
Ehrhart–Macdonald reciprocity, quasipolynomial degree, or eventual strict
monotonicity. It does not add a new result row.

## Verification

The exact 10-module closure passed strict Lean 4.35.0 compilation,
an audit of all 229 owned declarations (68 private), 12
required endpoints and the pinned stock per-module kernel replay. Only
the standard axioms `propext`, `Classical.choice` and `Quot.sound` are allowed.
[Scoped receipt](verification/encoding/receipt.json).

# Lean verification of ordinarization

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
The exact all-genus question is Remark 3.7. The first Lean checkpoint verifies the
encoding and scaling, not the stratification into relative interiors,
Ehrhart–Macdonald reciprocity, quasipolynomial degree, or eventual strict
monotonicity. It does not add a new result row.

## Verification

The exact 10-module closure passed strict Lean 4.35.0 compilation,
an audit of all 229 owned declarations (68 private), 12
required endpoints and the pinned stock per-module kernel replay. Only
the standard axioms `propext`, `Classical.choice` and `Quot.sound` are allowed.
[Scoped receipt](verification/encoding/receipt.json).

## Exact growth and baseline comparison

The [second checkpoint](../../lean/Conjectures/CyrusianKaplanGrowthCheckpoint.lean)
verifies the comparison in §2 away from the explicit exceptional equality
hyperplanes, and proves that a doubling equality in an admissible encoding
forces a low member equal to the genus. It formalizes both Pascal increments
for the baseline, including the even-genus exception at index one, and gives
explicit positive constants in the baseline's degree-`2r` count lower bound
and degree-`2r-1` increment lower bound. A directly verified full-dimensional
sub-box of admissible encodings also gives a lower bound of order `g^(2r)`
for the **actual** ordinarization count for every `g ≥ 32r`, `r ≥ 1`.
These statements alone do not prove the quasipolynomial assertion.

The entire 17-module closure passed strict Lean compilation,
the all-owned audit (321 declarations, 240 theorems,
133 private, 9 named endpoints) and
the per-module stock kernel replay. [Growth receipt](verification/growth/receipt.json).
The Ehrhart stratum counts and common leading correction coefficient remain
to be verified. The exact degree and eventual strict monotonicity of the
actual count are not claimed as Lean results.

## Open-simplex lattice counts

The [open-simplex checkpoint](../../lean/Conjectures/CyrusianKaplanSimplexCheckpoint.lean)
proves a direct quasipolynomial count in every positive integral dilation
of a positive-barycentric simplex in an injective integral homogeneous
ray chart. The coefficients are rational and the degree is at most the
simplex dimension. Lean checks the literal ambient lattice and the
height-slice bijection, finiteness of the numerator box, common-period
quotients, stars and bars, and the exact zeroes of the binomial residue
polynomial at early positive genera. This does not depend on an
assumed Ehrhart theorem.

All 12 modules passed strict Lean compilation,
the all-owned axiom audit (122 declarations,
94 theorems, 31 private,
8 named endpoints) and stock per-module replay.
[Open-simplex receipt](verification/simplex/receipt.json).
The exact rational triangulation of the actual ordinarization strata
and the common leading correction coefficient remain to be verified.
The entry remains partial.

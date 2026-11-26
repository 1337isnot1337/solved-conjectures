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

## Literal arrangement and integer lattice

The [arrangement checkpoint](../../lean/Conjectures/CyrusianKaplanArrangementCheckpoint.lean)
identifies the actual admissible ordered tuples with a finite disjoint union
of sign fibres. It verifies positive scaling from genus one with every
equality and strict test preserved. Each nonempty admissible fibre is the
relative interior of its compact weak-sign closure. The literal count is
of points in the full ambient integer coordinate lattice, not a sample
or substitute polytope, and it is the sum of the counts of the disjoint fibres.

Lean also checks the primitive integer normals for all nondegenerate
ordinary rows, the exceptional diagonal doubling row, the integral
intercepts of the actual real equations, and the translation of each
primitive affine lattice to the fixed kernel lattice of its normal.
This checks the lattice reduction, not the common leading coefficient.

All 24 modules passed strict Lean compilation, the all-owned audit
(572 declarations, 390 theorems,
145 private, 12 named endpoints) and the stock
per-module kernel replay. [Arrangement receipt](verification/arrangement/receipt.json).
The open Ehrhart stratum counts and the asymptotic correction estimate
remain outside the Lean verification. The entry stays partial.

## Rational polytope input to triangulation

The [rational-polytope checkpoint](../../lean/Conjectures/CyrusianKaplanRationalPolytopeCheckpoint.lean)
proves that every nonempty admissible weak sign cell at genus one is the
convex hull of a finite set of vertices with rational coordinates. It uses
the actual affine rows. In a finite polyhedron the active equalities
determine each extreme point, since a second solution to those equalities
would give a two-sided feasible line near that point. Lean then checks
that a rational-linear retraction of the coefficient field preserves
the rational active equations. Finiteness and the compact convex-hull
argument identify the exact rational polytope.

All 13 modules passed strict Lean compilation,
the all-owned axiom audit (291 declarations,
199 theorems, 57 private,
7 named endpoints), and stock per-module replay.
[Rational-polytope receipt](verification/rational-polytope/receipt.json).
No rational triangulation, ordinary-stratum count, common correction
coefficient, or full eventual monotonicity is asserted in this checkpoint.

## Disjoint rational triangulation of the actual arrangement

The [triangulation checkpoint](../../lean/Conjectures/CyrusianKaplanTriangulationCheckpoint.lean)
gives a finite disjoint partition of each nonempty compact sign fibre
into open simplices with rational, affinely independent vertices.
Vertices may be on the weak boundary. The proof picks a rational point
satisfying every strict row, takes the maximal feasible radius from
it, and recursively cones the boundary pieces. A boundary sign code
turns at least one nonzero row into a zero row, so the recursion
terminates. Exact uniqueness of the radius gives disjointness.

All 23 modules passed strict Lean compilation,
the all-owned axiom audit (369 declarations,
254 theorems, 72 private,
9 named endpoints), and stock per-module replay.
[Triangulation receipt](verification/triangulation/receipt.json).
This checkpoint is geometric; the exact summed lattice count and
eventual monotonicity are not asserted by these modules.

## Exact all-positive-genus quasipolynomial and degree

The [exact-degree checkpoint](../../lean/Conjectures/CyrusianKaplanExactDegreeCheckpoint.lean)
proves that for each fixed positive integer `r` the literal
numerical-semigroup count is a quasipolynomial of degree exactly
`2r` on every positive genus. Lean combines the disjoint rational
triangulation with exact coordinate lattice equivalences. It counts
the dilated open tiles at every positive genus, including the early
zeros, adds the fibre counts using one common period, and uses the
verified power lower bound to force degree `2r` in each residue.
No general Ehrhart theorem or project-specific axiom is assumed.

All 53 modules passed strict Lean compilation,
the all-owned axiom audit (783 declarations,
562 theorems, 209 private,
8 named endpoints), and stock-kernel replay.
[Exact-degree receipt](verification/exact-degree/receipt.json).
This settles the named quasipolynomial assertion in Lean. The
additional eventual-monotonicity conclusion of the written entry
has not been included in this checkpoint.

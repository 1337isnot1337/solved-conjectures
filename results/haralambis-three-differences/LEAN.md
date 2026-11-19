# Complete Lean proof of the three-difference theorem

The theorem `Haralambis.three_difference_theorem` in
[`HaralambisTheorem.lean`](../../lean/Conjectures/HaralambisTheorem.lean)
proves the full statement for every positive integer triple. No coprimality
or distinctness premise is needed. In particular, it covers all triples of
distinct positive differences in the note.

## Definitions and conclusion

For a list of positive integers `ds`, `Loneliness.Packing.Avoids ds A` means
that `A : Set ℤ` contains no pair whose positive difference belongs to `ds`.
`Loneliness.Packing.density ds` is the supremum of the upper densities of
all such sets. The density uses the integer windows `[-N,N+1)`; the proof
establishes counting bounds uniformly over all translated finite windows.

`Loneliness.value ds` is the supremum, over real times in `[0,1]`, of
`min (distance (d*t))` for `d ∈ ds`, where `distance x = |x-round x|`.
Periodicity identifies this with the supremum over all real times.

Writing `speeds d = [d 0,d 1,d 2]`, the theorem proves

\[
\operatorname{density}(\operatorname{speeds}d)
=\operatorname{value}(\operatorname{speeds}d).
\]

It also supplies distinct indices `i,j` and an avoiding set `A` that is
periodic with period `d i+d j` and has upper density equal to this optimum.
The witnesses are actual integer sets, rather than abstract feasibility
certificates.

## Finite signed-edge construction

[`HaralambisOrientation.lean`](../../lean/Conjectures/HaralambisOrientation.lean)
proves the balanced-sign theorem for finite even-degree multigraphs. Parallel
edges and loops are allowed. A matching between edge identifiers and
half-degree endpoint slots gives equal signed incidence at every vertex.

[`HaralambisFaces.lean`](../../lean/Conjectures/HaralambisFaces.lean)
defines the finite surface edges and faces, with their incidence maps and
exact fibers. [`HaralambisDefects.lean`](../../lean/Conjectures/HaralambisDefects.lean)
uses the occupancy function of an arbitrary avoiding set. The defect degrees
are even. Balanced signs then give edge values with the exact absolute defect
and all three square identities. No orientation or extension hypothesis is
assumed by `finite_signed_edges`.

[`HaralambisPeriods.lean`](../../lean/Conjectures/HaralambisPeriods.lean)
uses finite prefix sums and their weighted identities. Bézout gives an odd
integer vector whose pair determinants satisfy the required bounds. The
headline `odd_period_certificate` requires only the signed-edge conditions
already constructed by the preceding module. No infinite path integration
or extension across cubes is needed.

## Circle bound and density bound

[`HaralambisIntervals.lean`](../../lean/Conjectures/HaralambisIntervals.lean)
turns an odd vector and its pair determinant inequalities into intersecting
real intervals. The common point has the required clearance from the integers.
[`HaralambisCounting.lean`](../../lean/Conjectures/HaralambisCounting.lean)
connects the actual occupancy sums to interval counts and the three pair ratios.

[`HaralambisDensity.lean`](../../lean/Conjectures/HaralambisDensity.lean)
iterates the local count bound into a uniform bound for every finite interval.
It then passes to the upper density. Exact residue-class counts handle a
common divisor of the differences, while the previously proved scale
invariance handles the real circle value. The final theorem discharges the
primitive local premise using the signed-edge and odd-period construction.

[`LonelinessPacking.lean`](../../lean/Conjectures/LonelinessPacking.lean)
proves the reverse inequality for every nonempty finite list of differences.
At a rational time `p/P`, an integer residue window constructs an avoiding
set with exactly the circle clearance as its density. The proof keeps the
original denominator `P` even when `p` and `P` have a common divisor.
Continuity and rational approximation give `value_le_density`.

## Pair-sum attainment

[`HaralambisPairSum.lean`](../../lean/Conjectures/HaralambisPairSum.lean)
starts at a real maximizer. The clearance constraints determine finitely many
closed intervals. If their intersection had positive length, its midpoint
would improve every clearance, contradicting maximality. Active endpoints
therefore give a maximizing time of the form

\[
t=\frac{m}{d_i+d_j},\qquad i\ne j.
\]

The value `1/2` case is included. The rational packing construction then gives
an actual optimum of period `d_i+d_j`.

## Checked example and small-runner corollaries

[`HaralambisExamples.lean`](../../lean/Conjectures/HaralambisExamples.lean)
proves both the value and density `3/7` for `[2,5,9]`. It checks the literal
center set

\[
A=\{n\in\mathbb Z:n\bmod7\in\{0,1,4\}\}.
\]

The theorem `example_two_five_nine_centers` proves avoidance, period seven,
and the exact density of that set.

[`LonelinessPackingLower.lean`](../../lean/Conjectures/LonelinessPackingLower.lean)
proves the general lower bound `1/(ds.length+1)` for the packing density.
The finite greedy argument removes at most `ds.length+1` candidates per
selected center, then repeats a finite block with a sufficient gap.
[`LonelinessSmallRunner.lean`](../../lean/Conjectures/LonelinessSmallRunner.lean)
pads lists of length at most three by repeated entries, applies Haralambis,
and transfers this lower bound to the actual loneliness value.

## Validation

All modules were source-compiled with Lean 4.35.0 and the pinned Mathlib
revision. Each passed a separate `leanchecker` replay. The combined
Haralambis/packing audit checked 233 theorem declarations and permitted only
`propext`, `Classical.choice`, and `Quot.sound`. The small-runner headline
declarations passed the same transitive-axiom check.

The modules are imported by the accepted root package, required by
`ProofAudit.lean`, and listed in `scripts/verify_lean.sh`. The local source,
axiom, and kernel receipts are distinct from a hosted full-package build;
current checkpoint validation is recorded in
[the status report](../../docs/lean-status.md).

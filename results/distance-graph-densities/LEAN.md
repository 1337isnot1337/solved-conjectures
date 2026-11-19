# Complete Lean distance-graph classifications

The ten `ThreeDistanceGraph` modules prove the exact formulas for
`{1,k,k+5}` and `{1,k,k+7}` for every positive integer `k`. The definitions
`gapDensity` and `gapValue` use the actual avoiding-set density supremum and
the shared real-time nearest-integer circle maximum. No finite proxy stands
in for either quantity.

## Main endpoints

- `ThreeDistanceGraph.gap_five_classification`: both quantities equal `fiveValue k`.
- `ThreeDistanceGraph.gap_seven_classification`: both quantities equal `sevenValue k`.
- `gap_five_periodic_classification` and `gap_seven_periodic_classification`: actual periodic avoiding sets attain the classified optimum.
- `conjecture39_infinitely_many`: the set of parameters for which the prediction is strictly too large is infinite.

The complete small-case and residue definitions are in
[`ThreeDistanceGraphTheorem.lean`](../../lean/Conjectures/ThreeDistanceGraphTheorem.lean)
and [`ThreeDistanceGraphTables.lean`](../../lean/Conjectures/ThreeDistanceGraphTables.lean).
They match the [classification table](CLASSIFICATION.md), with `k=1` also
included as a repeated-difference case.

## Proof route

The checked Haralambis theorem identifies density with the circle maximum
and places a maximizer at a pair-sum denominator. For `{1,k,k+s}`, only
`k+1`, `k+s+1`, and `2k+s` need be considered. The resulting grids reduce to
two-wave bounds. Integer inequalities give the seven gap-five residue
classes and the nine gap-seven residue classes.

This proof handles every parameter in each residue class. It does not use
an unchecked strip shortening lemma or infer an infinite classification from
a finite search. Small parameters are checked by rational interval covers
and exact attaining times. The proof separately covers gap-seven `k=12`,
whose value is below the threshold used by the general grid inequality.

The periodic constructions are literal modular windows. Their avoidance,
periods, and densities are proved in
[`ThreeDistanceGraphPeriodic.lean`](../../lean/Conjectures/ThreeDistanceGraphPeriodic.lean).

## Conjecture 39

For `k>=41` and `k mod 9=5`, Lean proves

\[
\mu(\{1,k,k+7\})=\frac{4k+25}{9(k+8)}.
\]

Subtracting this from the predicted value gives exactly

\[
\frac{4k-2}{9(k+1)}-\mu(\{1,k,k+7\})
=\frac{k-41}{9(k+1)(k+8)}.
\]

The values agree at `k=41`. Every `k=50+9n`, for `n>=0`, is a strict
counterexample. At `k=50` the difference is `1/2958`. These conclusions are
proved in
[`ThreeDistanceGraphCounterexamples.lean`](../../lean/Conjectures/ThreeDistanceGraphCounterexamples.lean).

## Reproduction and scope

`generate_three_distance_graph_examples.py` regenerates the exact rational
small-case source. Its output is proof data; Lean verifies interval coverage,
attainment, and the mathematical semantics. The generic and infinite proofs
are not accepted on the basis of this Python run.

All ten source modules compiled with the pinned toolchain, all ten compiled
modules passed independent kernel replay, and the namespace audit checked
399 theorem declarations. Only `propext`, `Classical.choice`, and `Quot.sound`
were permitted. The root import, required declarations, and replay list
register the complete development.

The separate `ThreeDistanceGraph` prefix avoids file and declaration
collisions with another team's independent character classification.

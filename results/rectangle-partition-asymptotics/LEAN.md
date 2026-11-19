# Checked rectangle components

The growing-rectangle asymptotic is not yet a complete Lean theorem. The
following finite and analytic components have passed their checks.

## Finite tilings and partition injection

`RectangleCells.lean` defines a placed rectangle by its exact multiset of
integer cells. `GridTiles` requires that the sum of all placed-cell multisets
equal the cells of the outer rectangle. Thus every cell is covered exactly
once. `rectangleCount` counts canonical multisets of side-length pairs that
admit such a tiling. Rotation and arrangement do not produce different
counted multisets.

`RectangleShelfPacking.lean` proves that positive widths at most `C` fit in
at most `Q` shelves of width `B` whenever their total is at most `Q*(B-C)`.
`RectangleGuillotine.lean` constructs actual tilings from those shelves and
unit-square filling; its certificates map into the unrestricted grid-tiling
predicate.

`RectangleEncoding.lean` recovers each selected partition from the rectangles
with its designated smaller side. It proves injectivity even after an
arbitrary number of unit squares is added. `RectangleCounting.lean` applies
this to stacked full-width strips and side-by-side full-height columns.
It also bounds the actual count by the finite set of area-compatible
canonical multisets.

`boundedParts a B T` is the finite set of partitions with total at most `T`
and every part in `[a,B]`. Its membership theorem and positive cardinality
are checked. Deleting parts below `a` has multiplicity at most
`(T+1)^(a-1)`. `RectangleLogBounds.lean` combines the injection and deletion
bound into the logarithmic lower estimate needed by the asymptotic proof.

All seven finite modules passed independent kernel replay. Their namespace
audit checked 125 theorem declarations with only the permitted logical axioms.

## Sharp Euler-product estimates

Write

\[
L_B(t)=\sum_{a=1}^B-\log(1-e^{-at}),\qquad C=\sum_{m\ge1}m^{-2}.
\]

`RectangleEuler.lean` proves `L_B(t)<=C/t` for every `t>0`. For each fixed
positive cutoff `K`, `RectangleEulerLimit.lean` proves

\[
tL_B(t)\ge(1-e^{-Bt})\sum_{m=1}^Km^{-2}
-t\sum_{m=1}^Km^{-1}.
\]

It follows that `t*L_B(t)` tends to `C` whenever `t` tends to zero through
positive values and `B*t` tends to infinity. This is stated for arbitrary
filters and varying natural cutoffs. `RectangleBasel.lean` identifies
`C=pi^2/6` using the checked Mathlib series theorem.

`RectangleEulerUpper.lean` additionally proves exponential decay for large
arguments, the ordered-product bound

\[
\sum_{a=1}^h L_B(at)
\le\frac{C(\log(1/t)+2)+4}{t}\quad(0<t\le1),
\]

and the bounded-height estimate `C*H_h/t`. The diagonal sum is at most `C/t`.
These are the analytic estimates for the unordered rectangle-product upper
bound after its finite symmetry identity is supplied.

All four analytic source modules and independent kernel replays passed.
The analytic namespace audit checked 38 theorem declarations with only
`propext`, `Classical.choice`, and `Quot.sound`.

## Remaining work

The full result still requires the finite exponential-product/count bridges,
the cumulative partition asymptotic, and the uniform choice of strip or
column parameters. The real-position interpretation also requires a checked
bridge from the explicit grid model, or matching real-tiling upper and lower
bounds. These gaps are not treated as mathematical axioms or omitted premises.
The [analytic plan](ANALYTIC_LEAN_PLAN.md) records the proposed completion.

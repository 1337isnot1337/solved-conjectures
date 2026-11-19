# Complete growing-rectangle formalization

Lean proves the full logarithmic asymptotic, uniformly over every width at
least the height. The theorem uses the real-position tiling definition from
the note. It has no unproved partition estimate or geometric premise.

## Statement and counted objects

For natural numbers `h` and `w`, put

```math
N=hw,\qquad U=\min(h,N^{1/4}),\qquad S=\sqrt{N\log U}.
```

`RectangleAsymptotics.uniform_log_asymptotic` proves that, for every real
`ε > 0`, there is a natural `H ≥ 2` such that every `h ≥ H` and `w ≥ h`
satisfy

```math
\left|\frac{\log p(h,w)}{S}-\pi\sqrt{2/3}\right|<\varepsilon.
```

`rectangle_log_asymptotic` gives the same limit on the joint rectangle
filter. `rectangle_log_asymptotic_along` applies it to every sequence or
filtered family for which the shorter side tends to infinity and `h ≤ w`
eventually holds. These declarations are in
[`RectangleAsymptotic.lean`](../../lean/Conjectures/RectangleAsymptotic.lean).

The count `RectanglePartitions.realRectangleCount` uses finite tilings by
axis-parallel blocks with positive integer side lengths. Block positions
are arbitrary real numbers. Blocks lie inside the outer rectangle, their
interiors are disjoint, and their closed rectangles cover the board.
Canonical side-length pairs identify rotations. Each multiset of block
types counts once, regardless of its arrangement.

The real-to-grid bridge is proved. Horizontal and vertical slices force
the block positions to be integral. `realTiles_iff_gridTiles` identifies
the real and integer-cell tiling predicates, and `realRectangleCount_eq`
identifies their counts. `RealTiling.cover_closed` explicitly verifies
coverage of the board boundary when both dimensions are positive.

## Finite counting and upper bound

The grid model describes each placed block by its exact multiset of cells.
A tiling covers every board cell once. Shelf packing constructs actual
tilings from bounded partitions and fills unused cells with unit squares.
Deleting the unit squares and grouping the remaining blocks by smaller
side recovers each chosen partition. The resulting map to block multisets
is injective.

Finite multiplicity vectors give the exponential-product counting bounds.
The development proves the ordered/unordered product identity, controls
the diagonal terms, and optimizes the height and area estimates. Their
minimum gives the required uniform upper bound in both regimes of `U`.
These arguments do not import the paper's multiset asymptotic as a premise.

## Cumulative partitions and lower bound

Write `C = π²/6` and

```math
L_B(t)=\sum_{a=1}^{B}-\log(1-e^{-at}).
```

The Euler-product development proves `L_B(t) ≤ C/t` and
`t L_B(t) → C` when `t → 0+` and `Bt → ∞`. Mathlib's checked Basel-sum
theorem supplies the value of `C`.

`RectanglePartitionAsymptotics.tendsto_log_boundedParts_sqrt` proves the
sharp cumulative partition limit

```math
\frac{\log |\mathop{\mathrm{boundedParts}}(1,B,T)|}{\sqrt T}
\longrightarrow 2\sqrt C
```

when `T → ∞` and `B/√T → ∞`. Here `boundedParts` counts partitions with
total at most `T`. A finite weighted sum and two exponential tail bounds
prove this limit internally. `uniform_log_boundedParts_lower` converts
it into a bound uniform over sufficiently large `T` and `B/√T`.

The rectangle lower bound reserves full-width strips for smaller aspect
ratios and full-height columns for larger ones. Every floor, width budget,
height budget, and packing cutoff is checked. The active range has the
required harmonic mass, and deletion of small parts loses a negligible
amount after division by `S`. The lower bound is uniform over all `w ≥ h`,
including widths growing faster than every power of `h`.

The formal proof uses fixed small powers for the reservation parameters;
this avoids assuming the Hardy–Ramanujan formula. The final squeeze uses
the checked identity `2√C = π√(2/3)`.

## Verification

The frozen development contains 46 source modules. Every module passed
source elaboration and independent replay by the pinned stock
`leanchecker`. The final namespace audit checked 587 theorem declarations
and allowed only `propext`, `Classical.choice`, and `Quot.sound`.
The theorem count includes helper declarations.

Eleven inherited modules are byte-identical to accepted commit
`a7b1ca1a96abc67e1dbc6c547629409c25ad2964`, whose complete
[hosted Lean workflow](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44439617882)
passed. The remaining 35 modules passed their local source, axiom, and
kernel gates. The final audit used a 6 GB Lean allocation limit; a prior
3 GB import attempt stopped with `memory_exception` and was not counted
as a pass.

The source hashes and component receipts are recorded in
[`lean-verification-receipt.json`](lean-verification-receipt.json).
The accepted root imports, required endpoint audit, and replay list include
the full development. Repository-wide and hosted integration receipts are
reported separately in [the status report](../../docs/lean-status.md).

Rebuild and replay the accepted package from the repository root:

```bash
./scripts/verify_lean.sh
```

The [analytic plan](ANALYTIC_LEAN_PLAN.md) records the construction used
during development. Its proposed steps are now implemented.

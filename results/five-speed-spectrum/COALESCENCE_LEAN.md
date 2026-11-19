# Lean coordinate coalescence

These files prove the linear-algebra construction behind Lemma 11.2 of
Yi, Gill and Bu, [*Four runners that are barely lonely*](https://arxiv.org/abs/2610.40694).
They construct a line with few distinct absolute speeds inside a subspace.
For rational subspaces, the line has an integer direction. No lattice-volume
estimate or finite exhaustion is used in this construction.

## Main statement

Let \(E\subseteq\mathbb Q^n\) have dimension \(d\), where \(n\ge1\).
Assume that no coordinate vanishes identically on \(E\): for every coordinate
\(i\), some \(x\in E\) has \(x_i\ne0\). Then there is \(w\in\mathbb Z^n\) with

\[
w\in E,\qquad w_i\ne0\text{ for all }i,\qquad
\#\{|w_i|:1\le i\le n\}\le n-d+1.
\]

The integer vector is viewed in \(\mathbb Q^n\) in the membership assertion.
The theorem is `Loneliness.CoordinateSubspace.exists_integer_direction` in
[`LonelinessIntegerDirection.lean`](../../lean/Conjectures/LonelinessIntegerDirection.lean).

The construction also proves a stronger intermediate statement. There is a
one-dimensional subspace \(F\subseteq E\), with no identically zero coordinate,
such that its coordinate functions have at most \(n-d+1\) equivalence classes
under equality up to sign. Every vector in \(F\) therefore has at most that
many distinct absolute coordinate values.

## One step of the construction

[`LonelinessCoalescence.lean`](../../lean/Conjectures/LonelinessCoalescence.lean)
works with a finite family of nonzero linear forms \(\ell_i\) on a vector
space over an infinite ordered field. Their span must have dimension at least
two. It finds indices \(a\ne b\) and \(\varepsilon\in\{1,-1\}\) such that

\[
H=\ker(\ell_a-\varepsilon\ell_b)
\]

has codimension one, the forms \(\ell_a,\ell_b\) are not proportional, and
no original \(\ell_i\) vanishes identically on \(H\).

The proof uses two separating linear functionals. It first finds a functional
\(f\) that is nonzero on every member of the finite family of forms, viewed
as vectors in the dual space. Normalize those vectors by \(f\). A second
functional \(g\) separates every unequal pair of normalized vectors. There
are two adjacent distinct values in the resulting finite ordered set.

Orient the associated vectors so that their \(f\)-values are positive. Their
sum has \(g/f\)-ratio strictly between the adjacent values. Thus the sum is
proportional to none of the original vectors. Its kernel has codimension
one. If any original form vanished on that kernel, it would be proportional
to the sum, a contradiction.

The headline theorem is

```lean
Loneliness.Coalescence.coalescing_hyperplane
```

This argument works over both \(\mathbb Q\) and \(\mathbb R\). It uses finite
ordering and linear algebra; it does not need an angle or a cyclic-order
formalization.

[`LonelinessCoordinateSubspace.lean`](../../lean/Conjectures/LonelinessCoordinateSubspace.lean)
applies the theorem to the coordinate forms on \(E\subseteq K^n\). It proves
that these forms span the full dual of \(E\), then obtains

\[
F=E\cap\{x:x_a=\varepsilon x_b\},\qquad \dim F+1=\dim E.
\]

The property that no coordinate vanishes identically is called
`CoordinateFree`. The concrete theorem is `coordinate_coalescence`.

## Iteration and the number of speeds

[`LonelinessCoordinateClasses.lean`](../../lean/Conjectures/LonelinessCoordinateClasses.lean)
defines `SameCoordinate E i j` to mean that the two coordinate functions on
\(E\) agree everywhere, or are negatives everywhere. It proves that this is
an equivalence relation and defines `classCount E` as its number of classes.

Restriction to a smaller subspace gives a surjection on classes. The one-step
construction merges two previously different classes because its two forms
were not proportional. The class count therefore falls strictly at each step.

Strong induction on \(\dim E\) gives `exists_coordinate_free_line`, with the
more precise bound

\[
\operatorname{classCount}(F)+\dim E
\le \operatorname{classCount}(E)+1.
\]

There are at most \(n\) original classes. The theorem
`exists_coordinate_free_line_card` concludes
\(\operatorname{classCount}(F)\le n-d+1\).
`absolute_values_card_le_classCount` transfers this class bound to each
vector in \(F\).

A finite family of nonzero coordinate forms has a point where none vanishes.
Choose such a point in \(F\). Over \(\mathbb Q\), the theorem
`clear_rational_denominators` gives a positive integer common multiplier.
Multiplication keeps the vector in \(F\), preserves nonzero coordinates, and
gives the required integer direction. Distinct integer absolute values embed
into the rational absolute values, so the same counting bound applies.

## Real spans and actual loneliness values

[`LonelinessRationalSubspace.lean`](../../lean/Conjectures/LonelinessRationalSubspace.lean)
defines `realSpan E` by casting the rational vectors of \(E\) into
\(\mathbb R^n\) and taking their real linear span. `finrank_realSpan` proves

\[
\dim_{\mathbb R}(\operatorname{realSpan}E)=\dim_{\mathbb Q}E.
\]

It maps a rational basis into the real coordinate space, proves that this
family remains linearly independent after extending scalars, and proves that
it spans the real space. The property `CoordinateFree` is equivalent for
the rational subspace and its real span.

The real-span operation preserves sums of subspaces. For every family of
integer vectors, the real span of their rational span is their real span.
These identities keep the rational model available when the density argument
adjoins integer vectors to an existing subspace.

`exists_integer_direction_real` gives an integer vector in `realSpan E`, with
no zero coordinate and at most
\(n-\dim_{\mathbb R}(\operatorname{realSpan}E)+1\) distinct absolute speeds.

[`LonelinessCoalescenceValue.lean`](../../lean/Conjectures/LonelinessCoalescenceValue.lean)
defines `integerSpeeds w` by listing the distinct natural absolute values of
the integer coordinates. It proves that the value of the real line generated
by \(w\) equals the actual real-time loneliness value of that list:

\[
M(\mathbb Rw)=\operatorname{value}(\operatorname{integerSpeeds}w).
\]

Here `spaceValue` and `value` are the existing supremum definitions used by
the density argument and the exact five-speed examples. Sign changes and
duplicate speeds disappear because they leave distance to the nearest integer
unchanged.

`spaceValue_lower_of_runner_bound` proves the general transfer: if every
nonempty list of at most \(m\) distinct positive integer speeds has value at
least \(r\), and \(n-d+1\le m\), then \(M(\operatorname{realSpan}E)\ge r\).
`LonelyRunnerBound m` specializes the supplied lower bound to \(1/(m+1)\).
The resulting theorem `coalescence_value_lower` gives

\[
M(\operatorname{realSpan}E)\ge\frac1{n-d+2}
\]

under the explicit hypothesis `LonelyRunnerBound (n-d+1)`. The coalescence
modules do not assert that this lonely-runner hypothesis holds for every
\(m\).

## Verification

All six Lean files compile with the repository's pinned Lean and Mathlib
versions. Each compiled module also passed a separate `leanchecker` replay.
The fourteen headline declarations were checked with `#print axioms`; their
transitive axiom sets contain only `propext`, `Classical.choice`, and
`Quot.sound`. No placeholder proof, new mathematical axiom, or native-decision
axiom is used.

## Relation to the remaining reduction

An integer direction defines an integer-speed circle modulo \(\mathbb Z^n\).
The construction provides the circle with at most \(n-d+1\) distinct absolute
speeds required by the coalescence step. The corresponding loneliness lower
bound still uses the lonely-runner theorem for that number of speeds.

The projected-lattice covolume identity, the successive-minima product bound,
the four-speed gap, and the exhaustive plane classification are separate
inputs to the five-speed norm reduction. The coordinate construction proves
none of these inputs and does not establish full five-speed exhaustion.

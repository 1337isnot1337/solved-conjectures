# Equality structure at the positive-slack petal bound

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
For the moving range with \(m=t+1\) and \(1\le\delta\le3\),
the abstract order bound has a particularly rigid equality
case. It imposes an orientation constraint in addition to
exterior incidence constraints.

Assume the local span condition, \(\tau>t\),
\(r=5t+1+\delta\), and minimum intersection \(m=t+1\).
Suppose the total order is
\[
(2r-m)+3t(t+1)-\delta\binom{t+1}{2}.
\]
Fix any minimum pair \(A,B\) and choose one singleton
witness \(E_x\) for every \(x\in X=A\cap B\), with
exterior \(W_x=E_x\setminus(A\cup B)\). Then:

1. Every \(W_x\) has size \(3t\). Every pair \(W_x,W_y\)
   meets in exactly \(\delta\) points. No point is in
   three of these chosen petals. The petals cover the
   entire exterior of \(A,B\).
2. If the witnesses at the other \(t\) cuts stay fixed,
   every alternative witness at \(x\) contains all
   \((3-\delta)t\) exterior points of the original
   \(W_x\) that are in none of the other chosen petals.
3. For every singleton witness \(E\) of any minimum pair,
\[
(|E\cap A|-m)+(|E\cap B|-m)=\delta.
\]
   In particular at \(\delta=1\) the witness is minimum
   adjacent to exactly one of the two base edges.
   For any \(\delta>0\) in the range, three pairwise
   minimum-adjacent edges cannot have exactly one
   point in their triple intersection.

## Proof

The [single-cut bound](NEAR-THRESHOLD-PETALS.md) gives
\(|W_x|\ge3t\) and \(|W_x\cap W_y|\le\delta\).
For a point of multiplicity \(d\ge1\), the excess
over counting it once is \(d-1\), bounded by
\(\binom d2\) with equality exactly when \(d=1,2\).
Applying this pointwise gives
\[
\left|\bigcup_x W_x\right|
\ge\sum_x|W_x|-\sum_{x<y}|W_x\cap W_y|
\ge3t(t+1)-\delta\binom{t+1}{2}.
\]
At the asserted total order every inequality is
an equality, proving item 1. It applies to each
choice of witnesses. In particular when replacing
one petal, it must still cover all points not already
covered by the other \(t\) petals, proving item 2.
Those other petals use disjoint pieces of the fixed
\(W_x\) of total size \(\delta t\).

For item 3, the witness meets \(X\) in exactly its
chosen singleton, since \(X\) is a transversal.
Inclusion-exclusion gives its exterior size as
\(3t+\delta-(|E\cap A|-m)-(|E\cap B|-m)\).
By item 1 any choice of this witness has exterior
size \(3t\). This proves the equality of excesses.
If three pairwise minimum-adjacent edges had a
singleton triple intersection, the third edge would
be a standard witness for the appropriate cut of the
first pair but have zero total excess, which is
impossible when \(\delta>0\).

The exact abstract exterior order is attainable
without the full hypergraph constraints by pair points
and private fillers, as in [the slack order note](SHARPER-SLACK-PETAL-ORDER.md).
The orientation and all-pairs consistency conditions
here are additional necessary conditions for a true example.

## Defect identity away from exact equality

If the order exceeds the displayed threshold by \(h\), take
any fixed system of petals. Let \(u\) be the number of
exterior points omitted altogether and \(d_v\) the positive
multiplicity of a point in their union. Then
\[
h=u+\sum_x(|W_x|-3t)
+\sum_{x<y}(\delta-|W_x\cap W_y|)
+\sum_{v:d_v\ge1}\left[\binom{d_v}{2}-(d_v-1)\right].
\]
All terms are nonnegative, and the identity follows from
the same double count. In particular at most \(h\) singleton
cuts of a given minimum pair can admit a witness whose
total intersection excess is less than \(\delta\).
To see this uniformly over choices, select one such witness
at every cut where it exists, and then apply the identity:
each selected witness of this kind has an exterior larger
than \(3t\) and pays at least one unit of the defect.
For \(\delta=1\), simultaneously minimum singleton witnesses
can occur at at most \(h\) cuts of any minimum pair.

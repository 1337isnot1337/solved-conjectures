# A rectangle collision bound for high-score duals

This is a bound for arbitrary covers and arbitrary duals in the
[Erdős–Faudree–Ordman ratio problem](https://github.com/1337isnot1337/solved-conjectures/issues/990).
It links density of high scores across a partition to the
negative scores required inside its two sides.

Fix two disjoint sets of active types A and B of masses a and b,
both positive. Write p(i,j) = y_ij for entries of a feasible
dual, filling absent edges with zero as usual. For 1/2 < t <= 1,
sample a type from each side with its conditional mass. Let c
be the probability that their cross score is at least t.
If the template has a cover by q cliques, then its total
negative mass N satisfies

```math
N\ \ge\ (2t-1)ab\sqrt{\max\{0,c^2/q-(1-c)^2\}} .
```

## Proof

Sample four types I, I' in A and J, J' in B independently,
using conditional masses. For each cross edge with score at
least t, fix a single cover label shared by its endpoints.
The probability that IJ and I'J' both qualify and have the
same chosen label is at least c²/q: the contributions are
the squares of the probabilities of the q labels, whose
sum before squaring is c. This event implies that I and I'
are in a common cover clique, as are J and J'.

The pairs IJ' and I'J are also independent draws. Thus the
probability that neither qualifies is (1-c)². In the shared
label event with at least one qualifying cross link, both
I,I' and J,J' have scores at most 1-2t. For example if IJ'
qualifies, apply the three-vertex profile constraint to
I,I',J' and to I,J,J'. If two types coincide the profile
uses two distinct vertices of that same type, and therefore
bounds the diagonal score instead. All the required edge
categories exist in the single shared covering clique.

Let alpha and beta be the conditional probabilities that
the same-side score is at most 1-2t in A and B respectively.
The two events are independent of each other, and the
collision reasoning proves alpha times beta is at least
c²/q-(1-c)². The negative mass from these pairs is at least
(2t-1)(a² alpha + b² beta)/2. This counts both diagonal and
off-diagonal scores correctly, because the two same-side
samples are ordered. The arithmetic-geometric mean
inequality gives the stated bound.

If the two sides exhaust the active support, we also have

```math
P\ \le\ ab\bigl(c+t(1-c)\bigr)+(a^2+b^2)(1-c).
```

The cross contribution follows from the individual upper
bound of one on all scores. For the within-A contribution,
two vertices with positive score cannot both have qualifying
edges to the same type in B, by the three-vertex profile
constraint. For a random J, the chance of at least one of
IJ and I'J failing to qualify is at most 2(1-c). The same
argument holds in B; multiplying by the two ordered-pair
mass factors proves the upper bound. Both estimates can be
used without assuming F is stationary.

## Complete unit-score rectangles

If the active support is partitioned into A and B and all
cross scores equal one, put t=c=1. All same-side scores are
nonpositive, so F=P-N satisfies

```math
F\le ab(1-q^{-1/2})\le (1-q^{-1/2})/4 .
```

For q from ten through thirteen the final bound is strictly
less than q/56. Equivalently q(14-q)² < 196, which holds at
ten and decreases from ten to thirteen. Thus the ratio
cannot exceed 1/56 in that range for a dual of this special
form. More generally the collision inequality penalizes
near-complete high-score rectangles, whether or not the
original quotient has triangles. No argument here forces
an optimizer to have such a rectangle.

## A mean-score bound, without a uniform cross threshold

There is also a weighted version that counts all positive
cross scores at once. Keep disjoint sides A, B, of masses a,b.
For i in A write r_i for the conditional mean over B of
the positive part of its cross score, and define s_j for
j in B symmetrically. Put

```math
w_i=x_i\sqrt{\max(0,2r_i-1)},\qquad
w_j=x_j\sqrt{\max(0,2s_j-1)} .
```

Then for any cover by q cliques,

```math
N\ge
\frac{1}{\sqrt q}
\sum_{i\in A,\,j\in B,\,ij\text{ an original edge}} w_iw_j .
```

To prove this, consider two types i,i' in A that are adjacent
in the original template, allowing a repeated type. For every
j in B, the negative part of the same-side score is at least
the sum of the two positive cross scores minus one. If both
cross scores are positive this is the three-vertex profile
constraint, while if either is not positive the lower bound
is nonpositive and automatic. Averaging over j gives a lower
bound of r_i+r_i'-1. When both r values exceed one half, this
is at least the geometric mean of 2r_i-1 and 2r_i'-1.
If either does not, the contribution w_i w_i' is zero.
Therefore the negative mass in A is at least half the
ordered-pair adjacency mass computed with weights w. The
same holds in B.

Normalize the two w measures separately, unless one has zero
total mass (in which case there is nothing to prove). For
every cross edge in the original template choose any shared
cover label. The chance of two independent cross draws being
edges with the same label is at least the square of the
weighted cross adjacency probability divided by q. Such a
collision implies same-side adjacency on both sides, where
diagonals count as adjacent. These two latter adjacency
events are independent. Their product bound, followed by the
arithmetic-geometric mean on the two ordered-pair negative
masses, gives the displayed inequality.

### A complete rectangle of nonconstant high scores

Suppose now A and B exhaust the support and all cross scores
are strictly above one half, not necessarily equal to one.
Every cross pair is an original edge. All positive mass
is across the partition: if an original edge lies in either
side, any third vertex across gives two scores above one half,
forcing a negative sign on the same-side edge.

Let mu be the mean cross score under the original normalized
type proportions. By the elementary inequality sqrt(u) >= u
on [0,1], the two totals of w are at least a(2mu-1) and
b(2mu-1). Consequently

```math
F=P-N\le ab\left(\mu-\frac{(2\mu-1)^2}{\sqrt q}\right).
```

At ten covers this is at most 1/8 + sqrt(10)/64, strictly less
than 10/56. To see the bound, set t=2mu-1 in [0,1], maximize
1/2+t/2-t²/sqrt(10) by completing the square, and use ab <= 1/4.
This excludes every dual at ten covers whose high-score graph
is a spanning complete bipartite graph, without assuming
that its high scores are close to one. The possible high-score
graphs with missing cross edges or more complex structure
still need a global argument.

The same argument gives a quantitative exclusion for almost
complete high-score rectangles. Let delta be the conditional
probability of a cross score at most one half, confining the
partition to the whole support. Two same-side types with
positive score cannot have a common high-score neighbor across
the cut. Their positive score is at most one. Thus the total
positive mass inside the two sides is at most (a²+b²) delta,
by averaging the union of the two bad-cross events.

The missing original cross edges have total w_i w_j mass at
most ab delta, since w_i <= x_i and w_j <= x_j. The two
total w masses have product at least ab(2mu-1)_+², now with
mu the mean of the positive part of the cross scores. Hence

```math
F\le ab\left(\mu-\frac{(2\mu-1)_+^2}{\sqrt q}\right)
 + \delta\left(a^2+b^2+\frac{ab}{\sqrt q}\right).
```

At q=10 the coefficient of delta is at most one, while the
first term is at most 1/8 + sqrt(10)/64 even when mu <= 1/2.
Thus a dual beating 10/56 must have at least
3/56 - sqrt(10)/64 bad-cross probability across *every*
partition of its active support. The bound is positive, not
a proof that every feasible high-score graph comes close
enough to a complete rectangle to finish the problem.

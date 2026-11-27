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

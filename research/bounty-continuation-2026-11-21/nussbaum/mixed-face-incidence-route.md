# Mixed-face incidence route: exact deductions and the additive gap

21 November 2026. This is continuing research on the
[three-valued Nussbaum target](target-and-interpolation.md).
There is no full proof, counterexample, or paid completion. The arguments
below are separate from the earlier one-star checkpoint. The new packing
argument is recorded for independent review, without a priority claim.

## 1. Two different Boolean lifts fail

The distinctions between a lift of the actual formula dynamics, a
permutation of whole completion faces, and a freely chosen system of
distinct representatives must be retained.

First, on two coordinates set


```math
F(x_1,x_2)=(x_2\vee\neg x_2,\;x_1\vee\neg x_1).
```


The two ternary states $`(1,*)`$ and $`(*,1)`$ are exchanged. But the
Boolean restriction of $`F`$ is the constant $`(1,1)`$. No selection of
one Boolean completion per state can follow the actual Boolean map around
this two-cycle.

Second, on three coordinates set


```math
\begin{aligned}
F_1&=\neg x_1\wedge x_2\wedge\neg x_3,\\
F_2=F_3&=x_1\wedge\neg x_2\wedge\neg x_3.
\end{aligned}
```


Direct evaluation gives


```math
(0,*,*)\longmapsto(*,0,0)\longmapsto(0,*,*).
```


Their completion faces have four and two vertices. Therefore no
permutation of Boolean vertices can carry the first whole face to the
second. Both examples use noncontradictory DNF clauses. Neither refutes
the weaker possibility of an arbitrary system of distinct Boolean
representatives; that remains a Hall-type incidence question.

## 2. One one-star state forces a local line-graph structure

Let a cyclic compatibility orbit $`\mathcal F`$ be an antichain of
Boolean faces. Suppose it contains a one-dimensional face $`U`$.
Every other face meeting $`U`$ fixes its free coordinate: leaving it
free while meeting $`U`$ would make the other face contain $`U`$,
contrary to the antichain. The neighbors of $`U`$ therefore split into
two anticomplete cliques, according to the two endpoints of $`U`$.
Either clique may be empty.

Cyclic transitivity implies that the open neighborhood of every vertex
of the compatibility graph is a disjoint union of at most two cliques.
Consequently each graph vertex belongs to at most two maximal cliques,
and distinct maximal cliques intersect in at most one vertex. Reconstruct
a graph $`G`$ by turning maximal cliques into vertices, putting in an
edge for each compatibility-graph vertex, and adding a leaf endpoint if
that vertex belongs to only one maximal clique. An isolated compatibility
vertex is an isolated edge. The reconstructed graph is triangle-free:
a triangle would give adjacent vertices in the two purportedly
anticomplete parts of one open neighborhood.

Thus the compatibility graph is $`L(G)`$. Its cyclic action lifts to
$`G`$. The argument in the
[one-star note](one-star-and-mixed-face-gap.md) then shows that
each connected component of $`G`$ is a cycle or a complete bipartite
graph. This is an abstract graph reconstruction; it does not preserve
the dimensions or Boolean vertex incidences of the original faces.

In the complete bipartite case $`K_{a,b}`$ with two vertex orbits, a
faithful cyclic edge-transitive action has order $`ab`$. An edge
stabilizer fixes both endpoints, hence both entire vertex orbits, so is
trivial. The endpoint stabilizers have orders $`b`$ and $`a`$ and
trivial intersection. Subgroups of a cyclic group have intersection of
order the greatest common divisor of their orders. Therefore


```math
\gcd(a,b)=1.
\tag{1}
```


This cyclicity restriction was independently supplied and checked by the
parent researcher. It is not needed for the general grid lemma below.

## 3. A global bound for a complete-bipartite grid of cube faces

Suppose $`a,b\ge2`$, and faces $`F_{ij}`$ have intersection graph
$`L(K_{a,b})`$: they intersect exactly when the row or column index
agrees. By the elementary coordinatewise Helly property of cube faces,
choose a common Boolean vertex $`r_i`$ for row $`i`$, and $`c_j`$
for column $`j`$. Each face contains the whole cube hull


```math
[r_i,c_j]=\{x:x_t=(r_i)_t\text{ whenever }(r_i)_t=(c_j)_t\}.
```


Hulls for edges with different rows and different columns are disjoint.
All row and column points are distinct: an equality would put the same
point in two faces whose row and column indices both differ.

### Projected columns form an antichain

Fix two distinct rows $`i,k`$, and let $`D`$ be the coordinates where
$`r_i,r_k`$ differ. Flip coordinates so their restrictions to $`D`$
are zero and one respectively. Coordinates outside $`D`$ cannot
separate the two hulls $`[r_i,c_j]`$ and $`[r_k,c_l]`$, since both
hulls contain the same row bit there. On $`D`$, disjointness for
$`j\ne l`$ requires a coordinate with


```math
(c_j)_t=0,\qquad(c_l)_t=1.
```


Reversing $`j,l`$ proves that the $`b`$ projected columns form an
antichain in $`\{0,1\}^{|D|}`$. Counting maximal Boolean chains gives
the usual antichain bound, and hence


```math
b\le\binom{|D|}{\lfloor |D|/2\rfloor}.
\tag{2}
```


Define $`\delta(b)`$ to be the least positive integer $`d`$ for which
$`\binom d{\lfloor d/2\rfloor}\ge b`$. Equation (2) says the row
points form a binary code of minimum distance at least $`\delta(b)`$.

### Hamming packing

For $`b\ge3`$, put


```math
t=\left\lfloor\frac{\delta(b)-1}{2}\right\rfloor,
\qquad V(n,t)=\sum_{q=0}^t\binom nq.
```


Radius-$`t`$ Hamming balls around different row points are disjoint.
Thus $`aV(n,t)\le2^n`$. The following cases show $`V(n,t)\ge b`$,
apart from one harmless exceptional parameter pair.

* If $`\delta=2t+1`$ is odd, then
  $`V(n,t)\ge V(\delta,t)=2^{\delta-1}`$, which is at least the
  central binomial coefficient and hence at least $`b`$.
* If $`\delta=2t+2\ge6`$ is even, then
  
```math
V(\delta,t)=\frac{2^\delta-\binom\delta{\delta/2}}2
  \ge\binom\delta{\delta/2}\ge b.
```

  The middle inequality follows from
  $`3\binom\delta{\delta/2}\le2^\delta`$. At $`\delta=6`$,
  this is $`60\le64`$, and the central-binomial fraction decreases
  along even dimensions, since
  
```math
\frac{\binom{2s+2}{s+1}}{2^{2s+2}}
  =\frac{2s+1}{2s+2}\,
   \frac{\binom{2s}s}{2^{2s}}.
```

* If $`\delta=4`$, then $`4\le b\le6`$ and $`V(n,1)=n+1`$.
  This suffices except for $`b=6,n=4`$. In that exception, a binary
  length-four code of minimum distance four has at most two words,
  giving $`ab\le12\le16`$ directly.

There is no remaining even case for $`b\ge3`$. Therefore


```math
ab\le2^n.
\tag{3}
```


If $`b=2,a\ge3`$, exchange rows and columns. If $`a=b=2`$, the
four distinct row/column vertices already imply $`2^n\ge4`$. If a
side has size one, the faces form a clique; choosing a common vertex
and the opposite vertex in each face gives a distinct representative
inside each face. This also proves (3) in that case.

**Scope:** (3) is a bound in the entire ambient cube. The Hamming balls
used in its proof are not known to lie in the union of the original
faces. It must not be summed over several disjoint compatibility
components.

## 4. Two cases of the stronger local-union bound

Write $`W=\bigcup_{i,j}F_{ij}`$, where the union means Boolean
vertices. The useful stronger statement would be $`|W|\ge ab`$.

### One side has size two

Take rows $`r_1,r_2`$, with difference set $`D`$, oriented as above.
Let $`x_j`$ be the projected column on $`D`$. These vectors are an
antichain. Form a Boolean vertex $`w_j`$ with those bits on $`D`$
and the common row bits outside $`D`$. This vertex lies in both
$`F_{1j}`$ and $`F_{2j}`$.

Fix any coordinate $`q\in D`$. The vertex obtained by flipping bit
$`q`$ of $`w_j`$ lies in $`F_{1j}`$ if $`(x_j)_q=1`$, and in
$`F_{2j}`$ if $`(x_j)_q=0`$. The $`b`$ vertices $`w_j`$ are
distinct, their $`b`$ flips are distinct, and the two collections are
disjoint: an equality across them would make two projected columns
differ in just one bit, contradicting the antichain. Hence


```math
|W|\ge2b.
\tag{4}
```


The same proof applies with rows and columns exchanged. Clique
components have the local-union bound by the common-vertex/opposite-vertex
injection. Cycle components have one distinct Boolean witness per maximal
clique, and the number of those cliques equals the number of cycle edges.

### A grid contains a one-star face

Suppose $`F_{11}`$ is one-dimensional, with endpoints normalized to
$`0`$ and $`e_q`$. Row-one faces fix bit $`q`$ to zero, and
column-one faces fix it to one, by antichain incomparability with
$`F_{11}`$. Choose the common row/column vertices with
$`r_1=0,c_1=e_q`$. Write $`A_i`$, $`B_j`$ for the one-coordinate
sets of $`r_i,c_j`$ outside $`q`$, for $`i,j>1`$.

For every interior pair, $`F_{ij}`$ contains the two vertices whose
outside-$`q`$ one-set is $`A_i\cap B_j`$, with either bit at $`q`$.
The intersections $`A_i\cap B_j`$ are nonempty because $`F_{ij}`$
is disjoint from $`F_{11}`$. They are distinct. Different rows and
columns give disjoint faces; for a common column, disjointness from the
other row's column-one face gives a member of one intersection missing
from the other. The analogous row-one comparison handles a common row.

These give $`2(a-1)(b-1)`$ distinct vertices. The two anchor endpoints
are additional. Consequently


```math
|W|\ge2\bigl[(a-1)(b-1)+1\bigr]\ge ab,
\tag{5}
```


where the last difference is $`(a-2)(b-2)\ge0`$.

## 5. The unproved additive step

If the compatibility graph of an orbit containing a one-star face is
connected, the abstract line-graph reduction and the bounds above give
the full $`2^n`$ cardinality bound for that orbit, even if its other
faces have larger dimensions. This is still a special class of the
sponsor's all-orbit claim.

For multiple compatibility components, their Boolean vertex unions are
disjoint. Their graph types are isomorphic under the cyclic action, but
their face dimensions need not match. Formula (5) only applies to a
component that actually contains a one-star face. Formula (3) does not
provide an additive estimate for the other components.

The remaining concrete incidence question is therefore the local bound
$`|\bigcup F_{ij}|\ge ab`$ for a general grid of cube faces, especially
coprime $`a,b\ge3`$. No such bound is proved here. A suggested packing
inside truncated row hulls requires a further shadow inequality; the
ordinary Hamming-ball proof does not supply it. Orbits with no one-star
state are a separate unresolved class even if this local bound is proved.

## Subsequent completion of the local-counting step

The gap identified in this historical note is closed by the [local grid-union theorem](local-grid-and-one-star-orbit.md). Its stronger consequence covers any cyclic orbit containing at least one one-star state. Orbits with at least two stars at every state remain untreated. See the [independent review](GRID_REVIEW.md).

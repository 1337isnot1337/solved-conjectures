# Local grid unions and an orbit containing a one-star state

21 November 2026. This note proves a local incidence bound and uses it to
close the additive gap in the
[earlier mixed-face argument](mixed-face-incidence-route.md).
The consequence concerns orbits containing **at least one** state with
exactly one unknown coordinate. An orbit all of whose states have at
least two unknown coordinates remains outside the argument. This is not
a resolution of the [full paid target](target-and-interpolation.md),
and the completed-bounty count remains zero.

The shadow inequality used below is classical. The primary source is
Peter Keevash, *Shadows and intersections: Stability and new proofs*,
Advances in Mathematics 218 (2008), 1685–1703, DOI
[10.1016/j.aim.2008.03.023](https://doi.org/10.1016/j.aim.2008.03.023).
The [author-hosted paper](https://people.maths.ox.ac.uk/keevash/papers/kk-journal.pdf)
states the Lovász form of Kruskal–Katona on page 1686 and its iterated
shadow consequence on page 1687. Its
[2010 addendum](https://people.maths.ox.ac.uk/keevash/papers/kk-addendum.pdf)
does not alter that inequality. Both were read directly. The deductions
below carry no priority claim; a bounded search for the exact grid/period
combination found no matching statement, which is not an exhaustive
novelty determination.

## 1. A truncated downclosure lemma

For a family of finite sets $`\mathcal A`$, let


```math
\mathord\downarrow_{\le t}\mathcal A
 =\{B: |B|\le t,\ B\subseteq A\text{ for some }A\in\mathcal A\}.
```


**Lemma.** If $`t\ge2`$, $`\mathcal A`$ is an antichain, and


```math
1\le b=|\mathcal A|\le\binom{2t+2}{t+1},
```


then


```math
|\mathord\downarrow_{\le t}\mathcal A|\ge b.
\tag{1}
```


The ambient ground set may be arbitrarily large.

### Classical input

If a nonempty family of $`k`$-sets has $`m=\binom{x}{k}`$ members,
where $`x\ge k`$ is real, its $`j`$-shadow has at least
$`\binom{x}{j}`$ members for every $`0\le j<k`$. The one-level
statement is the Lovász form of Kruskal–Katona. Iteration gives the
displayed form because the real binomial coefficient is increasing in
its upper argument on the relevant range. The zero-shadow consists of
the empty set.

### Lower the levels above $`t+1`$

Suppose the current antichain has largest level $`k\ge t+2`$, with
$`m`$ members in that level. Then


```math
m\le b\le\binom{2t+2}{t+1}\le\binom{2k-1}{k}.
```


Writing $`m=\binom{x}{k}`$ gives $`k\le x\le2k-1`$, and hence


```math
\frac{\binom{x}{k-1}}{\binom{x}{k}}
 =\frac{k}{x-k+1}\ge1.
```


There are therefore at least $`m`$ distinct $`(k-1)`$-sets in the
shadow of the top level. Replace all its $`m`$ sets by any $`m`$ such
shadow sets.

This preserves the antichain. A retained lower set contained in a new
shadow set would also have been contained in an old top-level set. A
new $`(k-1)`$-set cannot be properly contained in a retained set, whose
size is at most $`k-1`$; equality would again make a retained set a
subset of an old top member. The new sets have equal sizes and are
distinct. The replacement also keeps cardinality $`b`$ and can only
shrink the downclosure. The sum of the set sizes decreases. Repeating
thus ends with an antichain $`\mathcal A'`$ of size $`b`$, all at
levels at most $`t+1`$, and


```math
\mathord\downarrow\mathcal A'
 \subseteq\mathord\downarrow\mathcal A.
```


### Count the last top level

Put $`k=t+1\ge3`$, and suppose $`\mathcal A'`$ has $`m>0`$
members of size $`k`$. Write $`m=\binom{x}{k}`$. Now $`k\le x\le2k`$.
Their complete proper downclosure has at least


```math
\sum_{j=0}^{k-1}\binom{x}{j}
```


members. For each $`j<k`$, the ratio


```math
\frac{\binom{x}{j}}{\binom{x}{k}}
 =\frac{k!}{j!\,(x-j)(x-j-1)\cdots(x-k+1)}
```


decreases with $`x\ge k`$. Consequently


```math
\frac{\sum_{j=0}^{k-1}\binom{x}{j}}{\binom{x}{k}}
\ge
\frac{2^{2k}-\binom{2k}{k}}{2\binom{2k}{k}}
\ge1.
\tag{2}
```


For the final inequality, $`3\binom{2k}{k}\le2^{2k}`$ holds at
$`k=3`$, since $`60\le64`$, and continues to hold because


```math
\frac{\binom{2k+2}{k+1}}{2^{2k+2}}
 =\frac{2k+1}{2k+2}\,
  \frac{\binom{2k}{k}}{2^{2k}}.
```


The other $`b-m`$ members of $`\mathcal A'`$ have size at most
$`t`$. None lies in the downclosure of a top-level member, by the
antichain property. They add $`b-m`$ distinct sets to the at least
$`m`$ just counted. If $`m=0`$, the $`b`$ members of
$`\mathcal A'`$ themselves suffice. This proves (1).

For later use, when $`t=1`$ and $`b\in\{3,4,5\}`$, the same
conclusion follows directly. If the union of an antichain of size $`b`$
has $`u`$ elements, the chain-counting antichain bound gives
$`b\le\binom{u}{\lfloor u/2\rfloor}`$. Thus $`u\ge3`$ for
$`b=3`$, and $`u\ge4`$ for $`b=4,5`$. The empty set and the
$`u`$ singletons already give at least $`b`$ members of the truncated
downclosure. The six 2-subsets of a 4-set show why this particular
radius-one statement fails at $`b=6`$.

## 2. Every grid of cube faces has enough vertices in its own union

**Theorem.** Let $`F_{ij}`$, $`1\le i\le a`$, $`1\le j\le b`$,
be distinct nonempty faces of the Boolean cube. Suppose that for distinct
pairs of indices,


```math
F_{ij}\cap F_{kl}\ne\varnothing
 \quad\Longleftrightarrow\quad i=k\text{ or }j=l.
\tag{3}
```


Then the union of their Boolean vertices satisfies


```math
\left|\bigcup_{i,j}F_{ij}\right|\ge ab.
\tag{4}
```


This is a local-union bound, so it may be summed for disjoint
compatibility components. It needs no cyclic action and no coprimality
assumption.

### Row and column witnesses

Assume first $`a,b\ge2`$. Pairwise intersecting cube faces have a
common Boolean vertex: in each coordinate their fixed requirements are
consistent. Choose a common row vertex $`r_i`$ and common column
vertex $`c_j`$. All these $`a+b`$ vertices are distinct. For example,
if $`r_i=c_j`$, choose $`k\ne i`$ and $`l\ne j`$; that vertex
would lie in both $`F_{il}`$ and $`F_{kj}`$, contradicting (3).
The other equalities are ruled out in the same way.

Every $`F_{ij}`$ contains the whole cube hull $`[r_i,c_j]`$, the
smallest face containing the two vertices.

For two rows $`r_i,r_k`$, write $`D`$ for their set of differing
coordinates. Orient these coordinates so the first row is zero and the
second is one. Coordinates outside $`D`$ cannot separate
$`[r_i,c_j]`$ from $`[r_k,c_l]`$: both hulls admit the common row
bit there. Their required disjointness when $`j\ne l`$ therefore
forces a coordinate in $`D`$ with $`(c_j)_q=0,(c_l)_q=1`$.
Exchanging $`j,l`$ forces the opposite ordered difference somewhere.
Thus the $`b`$ column restrictions to $`D`$ are an antichain.

Define


```math
\delta(b)=\min\left\{d\ge1:
 \binom d{\lfloor d/2\rfloor}\ge b\right\}.
```


The antichain bound implies


```math
d_H(r_i,r_k)\ge\delta(b).
\tag{5}
```


For one fixed row $`i`$, put


```math
T_{ij}=\{q:(r_i)_q\ne(c_j)_q\}.
```


These $`b`$ sets are also an antichain. If
$`T_{ij}\subseteq T_{il}`$, $`j\ne l`$, then
$`c_j\in[r_i,c_l]\subseteq F_{il}`$. But $`c_j\in F_{kj}`$
for any $`k\ne i`$, again contradicting (3).

The downclosure of this row antichain is exactly the union of its hulls,
expressed as the coordinates flipped from $`r_i`$. Truncating the
downclosure at size $`t`$ therefore gives vertices of the actual face
union inside the radius-$`t`$ Hamming ball about $`r_i`$.

### All column counts except six

For $`b\ge3`$, set


```math
t=\left\lfloor\frac{\delta(b)-1}{2}\right\rfloor.
```


By (5), these radius-$`t`$ balls around different rows are disjoint.
Also $`\delta(b)\le2t+2`$, so


```math
b\le\binom{2t+2}{t+1}.
```


If $`t\ge2`$, Lemma (1) supplies at least $`b`$ actual union
vertices in each ball. If $`t=1`$, then $`3\le b\le6`$; the
elementary extension after (2) handles $`b=3,4,5`$. Summing over the
disjoint balls proves (4) whenever $`b\ge3`$, $`b\ne6`$.

### The six-column case

Here $`\delta(6)=4`$, so the radius-one row balls are disjoint.
Let $`U_i=\bigcup_jT_{ij}`$. The empty flip and all one-coordinate
flips in $`U_i`$ give $`1+|U_i|`$ union vertices in the ball.
The antichain bound forces $`|U_i|\ge4`$.

Call row $`i`$ bad if $`|U_i|=4`$. Its six incomparable subsets of
$`U_i`$ must be precisely the six 2-subsets. To see the equality
case directly, count maximal chains of the 4-set: each antichain
member of size $`s`$ occupies fraction $`1/\binom4s`$ of the
chains, and these fractions sum to at most one. Six members force
all six fractions to equal $`1/6`$, hence all sizes equal two.

Consequently, for a bad row, every coordinate in $`U_i`$ varies among
the six column vertices, and every coordinate outside $`U_i`$ is
constant among them. Thus $`U_i`$ is exactly the coordinate-variation
set of $`\{c_1,\ldots,c_6\}`$, independently of the bad row. All bad
row centers lie in the same 4-dimensional cube obtained by fixing the
common outside column bits. By (5), any two have distance at least four.
A binary 4-cube has at most two such vertices: a second one must be
the unique antipode of the first. Therefore there are at most two
bad rows.

If there is no bad row, every ball already contributes at least six
vertices. Otherwise choose a bad center $`r_{i_0}`$. The six column
vertices have distance exactly two from it. For any other row, (5)
and the triangle inequality give


```math
d_H(c_j,r_i)\ge d_H(r_{i_0},r_i)-d_H(r_{i_0},c_j)\ge2.
```


Thus all six column vertices lie outside every radius-one row ball.
They are distinct additional vertices of the union. If the number of
bad rows is $`h\le2`$, the balls plus these columns give


```math
\left|\bigcup_{i,j}F_{ij}\right|\ge6a-h+6\ge6a.
```


This repairs the only exceptional column count.

### Small sides

If a side has size two and the other at least three, exchange rows and
columns if needed to use the preceding argument. If $`a=b=2`$, the
four distinct row/column witnesses already give (4). If $`a=1`$ or
$`b=1`$, all faces share a Boolean vertex $`v`$. Map each face to
the vertex obtained by flipping exactly its free coordinates from
$`v`$. Distinct faces containing $`v`$ have distinct free-coordinate
sets, so this is an injection into the union. This completes the proof
of (4) in every case.

## 3. Consequence for a cyclic orbit with at least one one-star state

**Corollary.** Let $`S\subseteq\{0,*,1\}^n`$ be an information
antichain whose compatibility graph admits one cyclic permutation
transitive on $`S`$. If some state of $`S`$ has exactly one star,
then


```math
|S|\le2^n.
\tag{6}
```


Here the information order has $`*\le0,*\le1`$, with 0 and 1
incomparable. A completion face consists of all Boolean assignments
that extend a state. Compatibility means that the completion faces
intersect. Periodic orbits of the sponsor's formula maps satisfy these
antichain and compatibility conditions, as proved in the target note.

### Recover an abstract graph

The completion face of the specified one-star state is an edge $`U`$.
Every other orbit face that meets $`U`$ fixes its free coordinate:
otherwise it would contain $`U`$, violating the antichain. Its
neighbors split into two anticomplete cliques according to the endpoint
of $`U`$ they contain. By the cyclic symmetry, every vertex of the
compatibility graph has an open neighborhood that is a disjoint union
of at most two cliques.

For a nonisolated graph vertex, the maximal cliques through it are
exactly the vertex together with these nonempty neighborhood parts.
Thus it belongs to at most two maximal cliques, and two distinct
maximal cliques meet in at most one vertex. Reconstruct a graph $`G`$
whose vertices are maximal cliques of size at least two, with one edge
for each compatibility vertex joining the two cliques containing it.
When there is only one such clique, add a private leaf endpoint. An
isolated compatibility vertex is treated as an isolated-edge component.

The graph $`G`$ is simple and triangle-free. A triangle would give
three pairwise adjacent compatibility vertices whose incidence forces
a vertex into a third maximal clique. Equivalently, its three edges
would join the two purportedly anticomplete parts of a neighborhood.
The original compatibility graph is $`L(G)`$.

The cyclic action permutes maximal cliques and private leaves, so it
lifts to $`G`$. On each connected component, the stabilizing powers
act transitively on edges. Quotienting the kernel gives a faithful
cyclic group of edge-transitive automorphisms of that component.

### Classify the connected components

For completeness, a connected graph with an abelian edge-transitive
group has at most two vertex orbits. If there is one, a vertex
stabilizer fixes the entire vertex orbit because the group is abelian.
Faithfulness makes it trivial. The group order equals the number of
vertices, so edge transitivity gives $`|E|\le|V|`$. Vertex
transitivity makes the graph regular; connectedness then makes it a
single edge or a cycle.

If there are two vertex orbits $`A,B`$, every edge joins the two.
For $`a\in A`$, its stabilizer $`H`$ fixes all of $`A`$ and
acts transitively on $`N(a)`$. Stabilizers of all vertices of $`A`$
are equal. If $`a'`$ shares a neighbor $`b`$ with $`a`$, then


```math
N(a)=Hb=N(a').
```


Connectedness propagates this equality, giving a complete bipartite
graph. These arguments are about the reconstructed graph, not about a
permutation of the Boolean vertices.

### Count inside each component's own Boolean union

A complete-bipartite component gives exactly the grid of faces in
(3), so Theorem (4) supplies at least one Boolean union vertex per
orbit state. This includes star and single-edge components.

A cycle component has length at least four, since $`G`$ is
triangle-free. Its line graph is a cycle of the same length. Each
maximal clique of that compatibility cycle has a nonempty common
Boolean intersection. These common intersections are disjoint for
distinct maximal cliques: a shared Boolean vertex would make their
union a clique, contradicting maximality. There are as many maximal
cliques as faces, so again the component's Boolean union has at least
as many vertices as orbit states.

Different compatibility components have disjoint Boolean unions;
otherwise an intersection would give an edge between components.
Summing these local estimates proves (6).

## 4. Exact scope and remaining obligation

The earlier global packing estimate could not be summed over disconnected
components. The truncated-downclosure lemma puts enough vertices
*inside* each component's face union and removes that defect. The result
is uniform in dimension and allows arbitrary larger face dimensions
elsewhere in the same orbit.

A nontrivial periodic orbit containing a Boolean state consists entirely
of Boolean states, so it already has at most $`2^n`$ states. Combining
that observation with (6), a counterexample to the sponsor's bound must
have at least two unknown coordinates in **every** orbit state. This
does not assume that the number of unknown coordinates is constant.

No argument here handles all such remaining antichains. In particular,
a face of dimension at least two does not force its compatibility
neighborhood to be two anticomplete cliques. The abstract line-graph
reconstruction is therefore unavailable in general. No bounty solution,
formal submission, payout request, or new completed target is claimed.

The independent parent review supplied the exact six-column repair
and checked the truncation/packing derivation. A second researcher then
checked the complete written argument and its primary shadow source;
the [independent review](GRID_REVIEW.md)
records no requested correction and the same remaining scope.

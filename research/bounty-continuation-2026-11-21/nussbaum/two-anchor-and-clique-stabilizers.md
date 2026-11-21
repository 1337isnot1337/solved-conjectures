# Two Boolean anchors and cyclic maximal-clique stabilizers

21 November 2026. This continues the
[Nussbaum period attempt](target-and-interpolation.md).
It proves a local system-of-distinct-representatives lemma for two anchors,
then records exactly what the cyclic maximal-clique count does and does
not imply. The full period conjecture remains unresolved by this note.
These deductions carry no priority claim.

Throughout, a face is a nonempty coordinate face of a Boolean cube. Its
vertices are Boolean vertices, not its barycenter. A family of faces is
an antichain when no two distinct members contain one another.

## 1. Two-anchor representatives

**Theorem.** Let $`\mathcal F`$ be an antichain of distinct faces of
$`\{0,1\}^n`$. Suppose there are two Boolean vertices $`r,s`$ such
that every member of $`\mathcal F`$ contains at least one of them.
There is an injection


```math
\rho:\mathcal F\longrightarrow\bigcup_{F\in\mathcal F}F,
\qquad \rho(F)\in F.
\tag{1}
```


In particular, the union contains at least $`|\mathcal F|`$ vertices.
The two anchors may coincide.

### Separate the fibers outside the anchor differences

If $`r=s`$, assign each face its corner opposite $`r`$. A face
containing $`r`$ is determined by its free-coordinate set, so these
corners are distinct.

Now let $`D=\{i:r_i\ne s_i\}\ne\varnothing`$. Complementing
coordinates, assume $`r_i=0,s_i=1`$ on $`D`$ and that their common
bit is zero off $`D`$.

For a face containing an anchor, every coordinate outside $`D`$ is
either free or fixed to zero. Partition the faces according to the set
$`E\subseteq[n]\setminus D`$ of free coordinates outside $`D`$.
For the class with index $`E`$, we will use only the vertex fiber


```math
\Omega_E=\{x:x_i=1\ (i\in E),\quad
                     x_i=0\ (i\notin D\cup E)\}.
\tag{2}
```


These fibers are pairwise disjoint. Intersecting a face in this class
with $`\Omega_E`$ does not remove any available choice on $`D`$.
It therefore suffices to construct representatives independently in
each fiber.

### The two antichains in one fiber

A face in this class containing both anchors is free on all of $`D`$.
It contains every other face in the class, because their free-coordinate
sets outside $`D`$ are the same and they have the same fixed outside
bits. Thus, by the antichain hypothesis, its class consists only of that
face. Choose any vertex of its fiber.

Otherwise each face in the class contains exactly one anchor. A face
containing $`r`$ is free on some proper subset $`A\subsetneq D`$
and fixed to zero on $`D\setminus A`$. Its opposite corner in this
fiber is the characteristic vector of $`A`$. Let $`\mathcal A`$
be the collection of these subsets.

A face containing $`s`$ is free on some proper subset $`T\subsetneq
D`$ and fixed to one on $`D\setminus T`$. Put $`B=D\setminus
T`$. Its opposite corner relative to $`s`$ is the characteristic
vector of $`B`$. Let $`\mathcal B`$ be the collection of these
subsets. The vertices available to this face are precisely the
supersets of $`B`$, inside the fiber.

Both $`\mathcal A`$ and $`\mathcal B`$ are antichains in the
Boolean lattice on $`D`$. For the first family, a containment of
subsets is a containment of the corresponding faces. For the second,
complementing the free-coordinate sets reverses containment, and still
preserves incomparability. There are no repetitions within either
family because a face is determined by these data.

Use the indicated opposite corners as initial representatives. The
only collisions are the sets in


```math
\mathcal C=\mathcal A\cap\mathcal B.
```


Each such corner is initially used twice, once by each type of face.

### Rematch each collided corner

Consider the graph of the Boolean cube on the ground set $`D`$.
Every cube neighbor of $`C\in\mathcal C`$ lies outside
$`\mathcal A\cup\mathcal B`$: it is strictly comparable to
$`C`$, which belongs to both antichains.

Every such neighbor is available to one of the two faces that collided
at $`C`$. A lower neighbor $`C\setminus\{i\}`$ belongs to the
first-anchor face with free set $`C`$. An upper neighbor
$`C\cup\{i\}`$ belongs to the second-anchor face whose fixed-one
set is $`C`$.

There is a matching from $`\mathcal C`$ into its cube neighborhood.
Indeed, for any $`\mathcal C'\subseteq\mathcal C`$, the cube has
exactly $`|D|\,|\mathcal C'|`$ edges from $`\mathcal C'`$ to
its neighborhood, and each neighbor is incident to at most $`|D|`$
of them. Consequently


```math
|N(\mathcal C')|\ge|\mathcal C'|.
```


Hall's matching criterion applies. Here $`|D|>0`$, as required by
the edge count.

For each matched lower neighbor, move the first-anchor face's
representative to that neighbor and keep the second-anchor face at the
old corner. For each matched upper neighbor, move the second-anchor
face's representative instead. All new representatives are distinct
by the matching, all lie outside the previously occupied set
$`\mathcal A\cup\mathcal B`$, and each lies in its assigned
face. Noncollided representatives stay unchanged. This proves (1)
in one fiber and, by (2), globally.

## 2. Consequences that use actual cube geometry

### A compatibility graph covered by two cliques

Pairwise intersecting cube faces have a common Boolean vertex: their
fixed coordinate requirements cannot conflict. If the compatibility
graph of an antichain of faces is covered by two cliques, choose a
common Boolean vertex for each clique and apply Theorem (1). The
result is a bound for the family's own union, so it can be added over
disjoint compatibility components.

This applies to every weighted $`2`$-by-$`b`$ grid of faces. Here
there are $`m`$ distinct incomparable faces in each cell, and faces
in distinct cells intersect exactly when their cells share a row or
column; faces within one cell are pairwise intersecting. Its two rows
are cliques, and hence


```math
\left|\bigcup_{i\in[2],j\in[b],t\in[m]}F_{ijt}\right|
\ge 2bm.
\tag{3}
```


### True-twin bundles over a cycle

The following separate observation also permits arbitrary multiplicity.
Suppose there are $`q\ge4`$ bundles of $`m`$ faces each, and
two faces are compatible exactly when their bundle indices are equal
or consecutive modulo $`q`$. Assume that all the faces together
form an antichain.

Choose a common Boolean vertex $`v_i`$ of the clique formed by
bundles $`i`$ and $`i+1`$. The vertices $`v_{i-1}`$ and
$`v_i`$ are distinct, since their equality would make the
nonconsecutive bundles $`i-1`$ and $`i+1`$ compatible.
Every face in bundle $`i`$ contains their cube hull, which has
dimension at least one.

More generally, if $`m`$ incomparable faces all contain a fixed
$`d`$-dimensional face, their union has at least $`2^d m`$
vertices. Factor out its free coordinates. The remaining faces form
an antichain containing a common vertex, and their opposite corners
are $`m`$ distinct vertices in the remaining union. Taking the
Cartesian product with the factored cube proves the assertion.

Thus each bundle union has at least $`2m`$ vertices. A Boolean
vertex belongs to at most two bundle unions, since three different
vertices of a cycle of length at least four cannot be pairwise
adjacent. Counting incidences between bundle unions and Boolean
vertices gives


```math
\left|\bigcup F\right|\ge qm.
\tag{4}
```


Neither (3) nor (4) assumes that the cyclic symmetry of the
compatibility graph extends to an automorphism of the ambient cube.

## 3. The cyclic maximal-clique count

Let $`F_0,\ldots,F_{p-1}`$ be a nontrivial Nussbaum orbit, viewed
as its completion faces. Its compatibility graph is preserved by the
regular cyclic action of $`\mathbb Z/p\mathbb Z`$. Let $`d`$
be the minimum dimension of one of the faces.

For each maximal clique $`C`$, put


```math
I_C=\bigcap_{F\in C}F.
```


This is a nonempty face. If $`C\ne C'`$, then $`I_C`$ and
$`I_{C'}`$ are disjoint. A common Boolean vertex would make
$`C\cup C'`$ a clique, contradicting maximality.

The maximal cliques containing a smallest face have disjoint nonempty
intersection regions inside its $`2^d`$ Boolean vertices. There
are therefore at most $`2^d`$ such cliques. Cyclic transitivity
makes their number, say $`r`$, the same through every orbit face.

Index the cyclic orbits of maximal cliques by $`i`$. Let a
representative $`C_i`$ have setwise stabilizer of order $`h_i`$.
Since the cyclic group acts regularly on faces, $`C_i`$ is a union
of $`k_i`$ stabilizer cosets for some positive integer $`k_i`$,
and


```math
|C_i|=k_i h_i.
```


There are $`p/h_i`$ cliques in this orbit. Counting their
incidences with the $`p`$ faces shows that exactly $`k_i`$
of them contain any given face. Consequently


```math
\sum_i k_i=r\le2^d,
\qquad
\#\{\text{maximal cliques}\}=p\sum_i\frac1{h_i}.
\tag{5}
```


Choosing one Boolean vertex from every pairwise disjoint $`I_C`$
therefore proves the desired period bound whenever


```math
\sum_i\frac1{h_i}\ge1.
\tag{6}
```


A counterexample to the full Nussbaum bound must fail (6). In
particular every maximal clique must have a nontrivial setwise
stabilizer, and a minimum square face gives $`r\le4`$. This is
only a necessary condition. Formula interpolation imposes further
conditions recorded in the target note.

## 4. What remains

The two-anchor lemma does not show that a cyclic compatibility
component has a two-clique cover. The known narrow-DNF eight-cycle
from the source comparison has compatibility graph $`K_{4,4}`$,
whose clique-cover number is four. That example has sufficient
distinct maximal-clique intersection regions for (6), but it rules
out an unconditional two-anchor reduction.

Nor does the abstract incidence count alone control true twins. When
two states belong to the same maximal cliques, the corresponding
faces can still be different incomparable faces. Their extra
geometric cost cannot be discarded. Equations (3) and (4) handle two
specific bundle structures. A weighted $`a`$-by-$`b`$ grid with
both $`a,b\ge3`$, or a more general cyclic clique-incidence
structure failing (6), is not settled here.

The earlier unweighted grid theorem remains valid, but selecting one
face from each cell repeatedly does not produce disjoint Boolean
unions and cannot simply be multiplied by the bundle size.

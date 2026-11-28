# One-star orbit bound and the remaining mixed-face problem

21 November 2026. This is a uniform restriction on possible counterexamples
to the [sponsor's three-valued period challenge](target-and-interpolation.md),
not a resolution of that challenge. The full paid-target count is unchanged.
The proof below was independently checked by the parent researcher. No
priority claim is made for this elementary graph argument.

## 1. Uniform one-star theorem

Let $`S\subseteq\{0,*,1\}^n`$ consist of distinct states, each with exactly
one star. Suppose a cyclic permutation of $`S`$ preserves compatibility:
two states are compatible exactly when they have no opposite definite bits
in any coordinate. Then


```math
|S|\le 2^n.
\tag{1}
```


Consequently a periodic orbit of a formula map cannot violate the sponsor's
bound if every state on the orbit has exactly one star. The statement is
uniform in $`n`$ and needs neither the narrower DNF convention nor any
assumption about a Boolean lift of the formula dynamics.

### Convert completion faces to cube edges

The Boolean completion face of a one-star state is an edge of the ordinary
$`n`$-cube. Let $`G`$ be the graph whose edges are these completion faces,
and whose vertices are their Boolean endpoints. There are no isolated
vertices in $`G`$. Distinct states are compatible exactly when their edges
share an endpoint. The compatibility graph is therefore the line graph
$`L(G)`$.

The given cyclic permutation is an automorphism of $`L(G)`$ acting
transitively on its vertices, equivalently on the edges of $`G`$.

### Lift the action without a line-graph exception

The graph $`G`$ is triangle-free. Every clique of size at least two in
$`L(G)`$ consists of edges sharing a single endpoint: two incident edges
have a common endpoint, and a third edge incident to both without using that
endpoint would complete a triangle in $`G`$. Thus the maximal cliques of
$`L(G)`$ of size at least two are exactly the stars at vertices of $`G`$
of degree at least two.

Reconstruct those vertices as maximal cliques. An edge of $`G`$ belonging
to just one such clique has a unique leaf endpoint, which is reconstructed
separately. A line-graph vertex in no such clique is an isolated-edge
component of $`G`$; its two endpoints can be chosen consistently while
permuting these components. This reconstructs $`G`$ and lifts the cyclic
line-graph generator to a graph automorphism.

Fix a connected component $`C`$ of $`G`$. Powers of the lifted generator
that preserve $`C`$ act transitively on its edges. After quotienting any
kernel on $`C`$, this gives a faithful finite cyclic, hence abelian, group
$`\Gamma`$ of edge-transitive automorphisms of $`C`$.

### Connected graphs with abelian edge transitivity

Such a graph has at most two vertex orbits, because every vertex is an
endpoint of an edge and every edge is an image of one fixed edge.

If there is one vertex orbit, a stabilizer of one vertex fixes every
vertex: stabilizers in an abelian transitive action are equal. Faithfulness
makes the stabilizer trivial. Hence $`|\Gamma|=|V(C)|`$. Edge transitivity
then gives


```math
|E(C)|\le |\Gamma|=|V(C)|.
```


If there are two vertex orbits $`A,B`$, every edge joins them. For a vertex
$`a\in A`$, let $`H`$ be its stabilizer. The subgroup $`H`$ fixes all
of $`A`$ and acts transitively on $`N(a)`$. If $`a'\in A`$ shares a
neighbor $`b`$ with $`a`$, the stabilizer of $`a'`$ is also $`H`$, so


```math
N(a)=Hb=N(a').
```


Connectedness propagates this equality and forces $`C`$ to be a complete
bipartite graph.

Two distinct vertices in a hypercube have at most two common neighbors:
having a common neighbor forces their Hamming distance to be two, and then
the two coordinates of difference give exactly the two possibilities. A
complete bipartite subgraph of a cube is therefore a star or $`K_{2,2}`$.
Both satisfy $`|E(C)|\le |V(C)|`$.

Sum over the components. Their endpoint sets are disjoint subsets of the
$`2^n`$ Boolean vertices. Thus


```math
|S|=|E(G)|\le |V(G)|\le 2^n,
```


which proves (1).

## 2. Why the standard additive-chain shortcut does not cover the class

The full primary paper by Lemmens, Scheutzow and Sparrow,
[*Transitive actions of finite abelian groups of sup-norm isometries*](https://www.kent.ac.uk/smsas/personal/bl81/ejclemmens2.pdf),
Theorem 2.7, proves the desired cardinality bound under an additional
no-anticlockwise-additive-chain hypothesis. On manuscript page 8, the paper
already gives an eight-point ternary cyclic isometry in dimension four
that violates that hypothesis.

After normalizing its coordinates to $`0,*,1`$, the cycle is


```math
\begin{aligned}
&(1,*,1,*),\quad (*,1,*,1),\quad (0,*,0,*),\quad (*,0,*,0),
\\ &(1,*,0,*),\quad (*,1,*,0),\quad (0,*,1,*),\quad (*,0,*,1).
\end{aligned}
```


The exact interpolation criterion in the target note produces
noncontradictory DNF formulas realizing this cycle. Every transition was
checked by the integer three-valued evaluator. The coordinator independently
replayed an [exact checker](check_nussbaum_formula_obstructions.py), whose
[record](nussbaum-formula-obstruction-check.json) also checks two concrete
failures of proposed Boolean lifts. Therefore the narrower
sponsor convention does not automatically exclude the obstruction in that
known theorem. This eight-cycle does not violate $`2^4`$; it only prevents
misapplication of the earlier theorem.

The same paper records that a period cannot be a prime greater than
$`2^n`$, citing Lyons and Nussbaum. No separate prime-period search was
undertaken here. The cited 2007 paper *Variations of a combinatorial problem
on finite sets* concerns $`\ell_1`$ equilateral sets and multiset Fisher
inequalities; it was not a period-bound shortcut.

## 3. Exact state of the counterexample search

The main reduction records an information antichain of nonbinary states
whose compatibility relation is invariant under one cyclic permutation.
In the broad formula class this is enough for an explicit extension: a
star-output clause can use both literals at every unknown coordinate to
isolate that state on the antichain. The narrower noncontradictory DNF
class additionally requires an uncovered Boolean completion for each
prescribed star output. That extra condition is proved in the target note
and is checked before any candidate is called a narrow-class example.

The first two MILP runs searched for periods 18 and 24 in dimension four,
allowing information ranks one through three. Both reached their 45-second
limits without an incumbent. A timeout gives neither a witness nor an
infeasibility certificate. Their records are
[period 18](nussbaum-orbit-n4-p18-r3.json) and
[period 24](nussbaum-orbit-n4-p24-r3.json).

A separate small counterexample search used the 24 states with exactly two
stars in dimension four. A cyclic orbit would induce a regular
compatibility graph. Among the composite candidate sizes above 16, the
regular subsets were the full 24-state set and twelve isomorphic
20-state sets; the other sizes had none. A direct exact permutation search
found no full cycle on either representative. This is recorded in
[the regular-subset data](nussbaum-n4-two-star-regular.json) and
[the automorphism-search record](nussbaum-n4-two-star-automorphisms.json),
with [the permutation search](search_nussbaum_two_star.py).
These finite negative searches receive no completion credit. They do not
settle dimension four with mixed ranks, much less the all-dimension target.

## 4. Remaining obligation

A full disproof still needs an explicit cyclic orbit of length greater
than $`2^n`$, an explicit formula extension in the relevant class, and an
independent exact check. A full proof still needs a cardinality argument
for arbitrary completion faces, including mixed dimensions.

The one-star proof does not extend merely by replacing edges by higher
faces: the intersection graph of higher-dimensional cube faces need not
reconstruct their Boolean endpoint incidence. A cyclic symmetry of that
intersection graph therefore cannot be assumed to lift to a Boolean
permutation. Even a formula map can have a ternary cycle while its Boolean
restriction has no cycle of the same period; coordinatewise formulas
$`x_{i+1}\vee\neg x_{i+1}`$ already rotate patterns of stars and ones
while sending every Boolean input to the all-one vector.

No general bound or counterexample has been obtained at this checkpoint.
No sponsor submission, email, fee, or payout request has been made.

## Stronger subsequent theorem

The [local grid-union argument](local-grid-and-one-star-orbit.md), with [independent review](GRID_REVIEW.md), strengthens the one-star result to any orbit containing at least one one-star state. It counts Boolean vertices in each compatibility component itself, so disconnected components can be added. The full all-states-at-least-two-stars case remains open in this work.

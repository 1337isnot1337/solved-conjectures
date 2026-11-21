# A barrier to using pair marginals alone

Research diagnostic, 21 November 2026. This is not a counterexample to the multiplicative Merino–Welsh conjecture and is not a partial resolution of it. It identifies a limitation of the first proposed proof route.

The [existing repository reduction](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/merino-welsh-research.md) requires a minimum-edge counterexample to have series/parallel classes of size two, certain safe pair-deletion/contraction properties, and strict intervals for their spanning-tree marginals. Those listed necessary conditions are jointly consistent with an explicit graphic example.

## The graph

Let `H` be the incidence graph of the Fano plane. Its two vertex classes are the seven nonzero vectors and seven nonzero covectors of the three-dimensional vector space over the field of two elements. Join a vector to a covector precisely when their pairing is zero. The graph has fourteen vertices and twenty-one edges and is cubic and bipartite.

Invertible linear changes of coordinates act transitively on incident vector–covector pairs. Indeed, any such pair consists of a nonzero vector inside a two-dimensional kernel, and a basis of that kernel can be completed to a basis of the full space. Thus `H` is edge-transitive.

It is also three-edge-connected. Here is a direct verification that avoids invoking a general transitivity theorem. Use vector labels `100`, `010`, and so on, and distinguish covectors by `L`. The edge from vector `100` to covector `L001` has, in addition to itself, the two paths

```math
P_{100},L_{010},P_{001},L_{100},P_{010},L_{001},
\qquad
P_{100},L_{011},P_{111},L_{110},P_{110},L_{001}.
```

Every listed pairing is zero, and these three paths have disjoint edge sets. Edge transitivity gives three edge-disjoint paths between the endpoints of every edge. A nonempty cut of size at most two would separate the endpoints of one of its edges and contradict those three paths. Connectedness follows directly because two distinct vectors lie in a common two-dimensional kernel and every covector has vector neighbors. Hence no such cut exists.

The graph is also two-vertex-connected. If a vertex were a cut vertex, each component after its removal would have at least three edges to that vertex by three-edge-connectivity. Two such components would require at least six incident edges, contradicting cubicity. Thus its cycle matroid is connected.

Form `G` by doubling every edge of `H`. Its cycle matroid remains connected, and each parallel class in `G` has exactly two elements. There are no series pairs: every cut in `G` has twice the size of the corresponding cut in `H`, so every nonempty cut has at least six edges. In particular no three-edge bond contains a parallel pair. Deleting a complete parallel pair leaves a bridgeless graph, because deleting one edge from the three-edge-connected graph `H` leaves a two-edge-connected graph and the other edges are still doubled.

## Exact tree marginals

Every spanning tree of `G` projects to a spanning tree of `H`. Each tree of `H` has exactly thirteen edges and lifts in exactly two to the thirteenth power ways. Consequently the projection of a uniform spanning tree of `G` is a uniform spanning tree of `H`.

By edge transitivity, all twenty-one edges of `H` have the same inclusion probability. Their probabilities sum to thirteen, so each probability is exactly

```math
p=\frac{13}{21}.
```

Therefore a uniform spanning tree of `G` meets every parallel pair with probability thirteen twenty-firsts. The strict comparisons are

```math
\frac35\lt\frac{13}{21}\lt\frac45.
```

There are no series pairs, so the series-pair conditions are vacuous. All the pair-size, safe-deletion, and marginal conditions displayed in the repository's prior note are satisfied.

The accompanying exact checker constructs the incidence graph, checks its cut sizes, and computes its reduced Laplacian determinant and inverse using rational arithmetic. It finds a spanning-tree count of 50,421 and the same resistance marginal thirteen twenty-firsts for every edge. The symmetry argument above proves the assertion independently of these finite checks.

## Consequence for the proposed route

A proof cannot finish by asserting that every graphic compressed core must violate one of those scalar marginal intervals or safe-deletion conditions. The doubled Fano incidence graph disproves that auxiliary assertion. A successful continuation needs stronger orientation-count information, a joint replacement inequality, or an additional graphic restriction on a hypothetical minimum counterexample. Nothing here asserts that this graph violates the Merino–Welsh inequality.

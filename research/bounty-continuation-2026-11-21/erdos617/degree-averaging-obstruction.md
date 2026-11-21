# A failed degree-averaging bridge

21 November 2026. This falsifies an auxiliary proof idea. It is not a conjecture target, a bounty solution, or a new-result claim.

The proposed bridge was that an edge-critical graph has a maximum independent set whose average vertex degree is at most the graph's average degree. This is false in general.

Take the disjoint union of K₄ and the square of the eleven-cycle, C₁₁². In the latter, adjacency means circular distance one or two.

K₄ has four vertices, six edges, independence number one, and degree three at every vertex. C₁₁² has eleven vertices, twenty-two edges, independence number three, and degree four at every vertex. An independent set has circular gaps at least three; four vertices would require circular length at least twelve. Three vertices, such as 0,3,6, are possible.

Both components are edge-critical. For the cycle square, cyclic symmetry reduces its two edge types to 0--1 and 0--2. Deleting 0--1 makes 0,1,4,7 independent; deleting 0--2 makes 0,2,5,8 independent. An edge deletion increases independence number by at most one, so these witnesses prove criticality.

The union has fifteen vertices, twenty-eight edges, and independence number four. Every maximum independent set has one K₄ vertex and three cycle-square vertices. Its degree sum is always fifteen. Thus its average degree is

```math
\frac{15}{4}>\frac{56}{15},
```

where the right side is the graph's average degree. Clearing denominators gives 225>224.

A bounded local falsification search first found an isomorphic instance; the exact argument above does not rely on that search. This example is disconnected. It does not decide a separately restricted connected version, and no connected version is assumed in the balanced-coloring arguments.


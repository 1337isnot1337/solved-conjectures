# Induced cut balance at a weighted extremizer

A necessary condition for a least-support counterexample to [Erdős Problem 23](https://www.erdosproblems.com/23), with weights maximizing the minimum monochromatic cost on its support. All vertex weights are positive by minimality and sum to 1. Let beta be the minimum unordered monochromatic edge mass. Every underlying edge has its endpoint product cost.

Use the [common law of optimal cuts from stationarity](BOUNDED-CODEGREE-TEMPLATES.md). For a vertex set X of mass x, let M_X be the random monochromatic edge mass internal to X in one of these cuts, and write Y for its complement. Then

    E M_X - E M_Y = beta (2x-1).

Indeed every vertex has expected monochromatic neighboring mass 2 beta. Summing this with weights over X gives twice E M_X plus the expected monochromatic crossing mass, whereas summing over Y gives twice E M_Y plus the same crossing mass. Subtracting proves the identity.

In particular if X is independent, its complement satisfies the stronger proper-subgraph constraint

    beta(G[Y]) <= E M_Y = beta (1-2x).

Thus every independent set has mass at most 1/2 at such an extremizer, and one with exactly 1/2 mass has bipartite complement. If the complement has positive minimum cost, the deficit from 1/2 is at least beta(G[Y])/(2 beta). For example one may lower-bound beta(G[Y]) by the least product edge mass on any odd cycle contained in Y. This is an upper constraint on complement costs, in contrast to simply bounding them by the all-order conjectured quadratic coefficient via minimality.

With X a vertex neighborhood, the weighted degree upper bound is 1/2, while the usual optimum-cut flip inequality gives the lower bound 4 beta. The upper bound uses extremal reweighting; it does not replace the [unconditional .59 degree criterion](BIPARTITE-CORE-HOLES.md) on a nonmaximizing counterexample. For a proper three-colouring with masses a,b,c, the same identity gives the three individual average monochromatic link costs: the A–B link has mean beta(1-2c), and cyclically. This follows by taking X=C, since the only possible internal edge of the other two colours lies between them.

Equivalently the edge kernel obtained by multiplying each present edge by its probability of being monochromatic has constant weighted degree 2 beta, still on the triangle-free support. The identity then follows from equal cross mass in the two sums of its degree function. This may be used in rooted constraints, but does not show that optimizing cuts of the separate induced pieces can be made simultaneously compatible.

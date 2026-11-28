# Weighted cuts around a Petersen core

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). This handles arbitrary order and does not assume an induced-path restriction.

Fix a Petersen subgraph, whose roots are labelled by the two-subsets of {1,2,3,4,5}, with disjoint subsets adjacent. A Petersen subgraph of a triangle-free graph is necessarily induced, since every missing root pair already has a common root neighbor. Let L consist of exterior vertices with at most two root neighbors, with total mass l. Every exterior vertex outside L has one of two types:

* A star profile: its roots all contain a unique common token.
* A triangle profile: its roots are exactly the three pairs contained in one three-token set.

Indeed the profile is a pairwise-intersecting family of at least three two-subsets. If it has no common token, start with {i,j},{i,k}; a member omitting i must be {j,k}, and no fourth distinct pair hits all three.

Let J be the mass of edges between high-profile star vertices. Then, writing e for all edge mass and e_cross for the mass of edges incident to exactly one vertex of L, the minimum cut cost obeys

    beta <= e/5 + (2/5)J + (3/10)e_cross + (2/47)l².

In particular the sharp bound holds in the middle density band if l<=1/50 and J<=1/200. More generally it holds whenever the expression on the right is at most 1/25. The density tails are already known. There is no assumption of twin classes or regularity.

## The lift into Clebsch

Use the Clebsch graph on subsets of five tokens, identifying a subset with its complement and taking representatives of sizes 0,1,2. Edge differences are the five singleton classes (symmetric difference modulo complement). In particular two pairs are adjacent exactly when disjoint, and singleton i is adjacent to pair P exactly when i is in P.

Keep root pair labels. Send a star profile to the singleton of its common token; send a triangle profile to the pair complementary to its three-token set. These label choices respect every root attachment. Two exterior adjacent vertices have disjoint root-neighbor profiles. Two triangle profiles on triples J1,J2 can be disjoint only if |J1 intersect J2|=1, so their complementary pairs are disjoint and their images adjacent. For a star with center i and a triangle on J1, disjointness implies i is not in J1: if it is, the triangle contains two distinct pairs through i, and a star of size at least three can omit at most one of those. Thus their images are also adjacent. The only possibly invalid edges outside L are star–star edges with distinct centers, since two stars sharing a center each use at least three of the four available roots and cannot be adjacent.

Take the five standard Clebsch cuts. Each generator direction is missed by exactly one of them, and a difference of two distinct singleton tokens is missed by exactly three. The cost inside the high-profile part, including the roots, is at most (its edge mass + 2J)/5. Take an optimum cut of L and align it with the high-profile cut using a fair independent sign. The cross contribution is e_cross/2; the internal contribution on L is at most (2/47)l² by [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179). Dropping the favorable subtraction e(L)/5 gives the displayed estimate. For the numerical consequence use e<=3197/20000 and e_cross<=l(1-l).

In particular, if every exterior vertex has either a triangle profile or a full four-root star profile, then L is empty and J=0, because different full stars share a root. In that case the whole graph maps to Clebsch, and the exact Erdős bound also follows directly from the five cut patterns and the classical large-density neighborhood cut.

## Relation to the circular obstruction

[Bodirsky et al., Theorems 5 and 20](https://doi.org/10.1002/jgt.23235) characterize the maximal triangle-free templates that do not have circular chromatic number below three. Combined with [the circular bound](CIRCULAR-THREE.md), any saturated counterexample must contain an induced C6 and a Petersen-minus-one-vertex subgraph. The latter may have extra edges, and it need not extend to a full Petersen core. The proof in this note requires a full Petersen root and cannot assume that every saturated counterexample supplies one. The next issue is to control the weights of low-attachment and defect classes, or to find a comparably useful cut template directly from the smaller obstruction.

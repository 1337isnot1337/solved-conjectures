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

## The smaller anchor suffices for a profile inequality

The same bound applies if only the forced Petersen-minus-one anchor is supplied. In this variant classify **every** vertex by its profile into that anchor, including a root vertex itself (it is not its own neighbor). No root label is held fixed in the output cut. The anchor vertices retain their distinct two-token names when used to describe profiles, and every disjoint pair of present root names is required to be joined in the graph. Extra root edges are harmless.

As before, the profiles of every vertex are pairwise-intersecting two-subsets. Define L using profiles of size at most two, and J as the mass of edges between vertices with high star profiles, now including any root vertex of these types. Every other high profile is a triangle. Send the high vertices to their Clebsch labels by profile alone. The pairwise argument from the first proof then applies to every edge of the high graph: endpoint profiles are disjoint, and only star–star edges can be mapped to distinct nonadjacent labels. This does not require root vertices to have positive or equal mass, and avoids any separate charge for an extra root edge. The same cut estimate follows:

    beta <= e/5 + (2/5)J + (3/10)e_cross + (2/47)l².

Thus each saturated counterexample has this nine-root configuration, and every such root set must have either l>1/50 or J>1/200. This is still not a proof that one of the anchors has small enough defects.

The last inequality can be encoded on at most eleven labeled draws. The first nine specify the required anchor edges; on the last two, the indicators for a high star, low profile, or mixed low/high pair determine J, l², and e_cross. In unordered conventions J is half the probability of an edge with two high stars, and e_cross is half that of an edge with exactly one low endpoint. The whole-graph e/5 term is also a scalar multiple of the terminal edge probability. No sampled root weights, equality tests, or deletions are needed. Condition on the anchor and multiply by any nonnegative root event; averaging gives a polynomial necessary inequality at any counterexample. This remains valid if some root draws repeat while all required edges are present: each pair of disjoint token names imposes an actual edge, exactly what the labeling argument uses.

## A coupled token-rank cut

The high star–star defect can also be cut directly. An independent internal research pass found that a three-neighbor star is naturally labelled (i,j), where i is its common token and {i,j} is its one missing star pair. This includes the nine-root case if the omitted pair is the missing root. A four-neighbor star is labelled by its center i. Adjacent stars have different centers and must omit their shared pair at one or both endpoints. Thus the possible star–star edges are:
- a directed chain (i,j),(j,k) for distinct i,j,k;
- a reverse pair (i,j),(j,i);
- a three-neighbor star (i,j) and a full star at j.

Choose a uniform ordering of the five tokens, and let k0 be the first token. Give a three-neighbor star (i,j) positive sign precisely when i precedes j. Give a full star at i positive sign if i is in the first two positions. Give a high triangle profile whose complementary pair is P the positive sign if k0 is not in P. The last rule is exactly one of the five Clebsch cuts, selected in a way that couples it to the star signs.

The missed-edge probabilities are as follows. A second version uses the first one position instead of the first two for the full-star sign.

| Edge type | First two for full stars | First one for full stars |
| --- | ---: | ---: |
| triangle–triangle | 1/5 | 1/5 |
| star chain | 1/3 | 1/3 |
| star reverse | 0 | 0 |
| three-neighbor star to full star | 1/5 | 3/10 |
| three-neighbor star (i,j) to triangle pair {i,r}, r not j | 3/10 | 3/10 |
| three-neighbor star (i,j) to triangle pair {i,j} | 1/2 | 1/2 |
| full star to triangle | 3/10 | 1/5 |

Here a triangle–triangle edge has disjoint complementary pairs, and a star–triangle edge has the star center in the complementary pair, as proved above. For the first row the signs match just when k0 is outside the two pairs. The chain agrees only in two of six relative orders; reversing a star label always reverses its sign. For an edge from (i,j) to a full star at j, conditional on the rank r of j the first sign is positive with probability (r−1)/4, which gives the two listed averages.

For a three-neighbor star and triangle pair {i,j}, exchange i,j: this flips the star sign and leaves the triangle sign unchanged, giving probability 1/2. For pair {i,r} with r distinct from j, conditioning on k0=i or j gives definite disagreement; each of the other three possible choices gives conditional agreement 1/2. For a full star at i against {i,r}, the first-one rule agrees exactly when k0=r, while the first-two rule agrees either when r is first and i is not second, or when a token outside the pair is first and i is second. These probabilities add to 3/10.

As before cut the low-profile set separately, using the quadratic bound (2l^2/47), and align fairly. Thus either column gives a further order-eleven cut inequality by charging each high edge its displayed probability and each low-to-high edge half its mass. Take the best of both rank cuts and the original Clebsch estimate. Keeping the triangle–triangle coefficient at 1/5 is the improvement over separating the high signs or replacing the triangle signs by an independent rank sum. The rank cuts do not uniformly dominate the original Clebsch estimate on star–triangle edges; those losses are the remaining trade-off.

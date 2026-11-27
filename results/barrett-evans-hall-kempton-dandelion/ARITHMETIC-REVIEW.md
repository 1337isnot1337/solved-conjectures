# Independent review of the anchored finite certificate for Conjecture 2

27 November 2026 UTC. A second Codex reviewer checked the source statement, the enumeration of anchor attachments, the branch symmetries, the strict spectral certificate and the exact arithmetic limits for orders 11 through 20.

## Mathematical coverage

Barrett, Evans, Hall and Kempton’s Conjecture 2 on printed p. 15 asks for the minimum when both a graph and its complement have diameter three. Their Lemma 4.2 gives the dandelion cubic used by the checker. Take vertices at distance three in the graph and two at distance three in the complement. In each graph the respective pair is nonadjacent and has no common neighbor. The two pairs are disjoint. A shared vertex would force its two opposite endpoints to be adjacent in neither graph, since either edge would create a common neighbor of one of the original pairs. The cross edges in either color form a perfect matching by counting incidences. Thus, after labeling, the graph contains the red path 0–1–2–3, with the complementary blue path 2–0–3–1. Each remaining vertex sees at most one of 0 and 3 in red, and at least one of 1 and 2 in red. These conditions give the nine integer masks 2, 3, 4, 5, 6, 7, 10, 12 and 14 used by the generator. Every remaining red/blue edge is still free. I also exhaustively enumerated all labeled graphs on four, five and six vertices. The two diameter-three conditions selected 12, 300 and 11,280 graphs respectively. All 12, 540 and 29,160 resulting choices of the anchor pairs had exactly the stated red path and allowed masks. No ordering assumption on Fiedler coordinates or permutation-graph reduction is needed. [Primary source and Lemma 4.2](https://arxiv.org/pdf/2201.04225#page=15)

Sorting the masks loses only relabelings of the free vertices. Reversing the path permutes its four coordinates; complementing and reading the old path in the order 2,0,3,1 gives another copy of the red path. The square of that transformation is path reversal, so the four tested transformations form the full cyclic group they generate. The objective, equality classification up to complementation and double-leaf condition are invariant under these operations. I computed the number of orbits independently from Burnside’s lemma by counting fixed weak compositions from the cycle lengths of each of the four permutations. The counts are shown below.

| Order | Canonical multisets | All multisets |
| ---: | ---: | ---: |
| 11 | 1,619 | 6,435 |
| 12 | 3,238 | 12,870 |
| 13 | 6,098 | 24,310 |
| 14 | 10,974 | 43,758 |
| 15 | 18,930 | 75,582 |
| 16 | 31,550 | 125,970 |
| 17 | 50,930 | 203,490 |
| 18 | 80,030 | 319,770 |
| 19 | 122,666 | 490,314 |
| 20 | 183,999 | 735,471 |

At a partial assignment, red, blue and unknown form an edge coloring. If two candidate neighbors have identical two-color incidence to every other vertex, their transposition fixes both colored boards, even if their mutual edge is fixed. This is an equivalence relation, and transpositions generate the full symmetric group on its class. The pivot is outside the class being permuted. Thus every possible completion is isomorphic at this node to one coloring the first k edges of that class red and the rest blue, for some k between zero and the class size. This proves the branch count reduction independent of how the pivot is chosen. A fully assigned graph which cannot be certified is an explicit failure. The node-limit return and any failure in a child propagate to the top-level exit.

A known degree at least n−2 in one layer forces degree at most one on the other layer in every completion. Restricting to connected complementary completions makes that degree exactly one. The skip triggers only when this reasoning applies on both sides. A leaf in each layer puts the graph, or its complement, in the previously classified double-leaf case. At all other accepted nodes strict lower bounds on the red and blue partial Laplacians apply to every completion by edge-addition monotonicity.

## Independent arithmetic checks

Grounding the last coordinate after centering gives the matrix L minus (t/256) times the identity-minus-constant-projection matrix on the other n−1 coordinates. Multiplication by 256n produces the integer entries in the checker. Positive definiteness certifies strict algebraic connectivity greater than t/256. The input cubic has a root in each of the three intervals cut out by 0, 1, n−1 and n. Enclosing the smallest root from above and the largest root from below produces a strict upper test for the dandelion comparison. When both dyadic certificates pass, the sum of the chosen numerators is at least that upper target, including the case when one coordinate alone exceeds the target. Floating-point operations only propose candidates or select an edge order.

For positive pivot intervals, all four products of endpoint numerators supply the exact product extrema. Dividing a negative lower product by the lower positive pivot and a nonnegative lower product by the upper pivot gives a rigorous lower endpoint. The upper endpoint uses the opposite pivot choice. C++ division truncates toward zero, so the signed-remainder floor and ceiling corrections have the correct direction. Interval subtraction reverses the endpoints of the subtrahend. At n≤20 and numerator t≤512, the initial scaled entries are below 2^30 in absolute value. Every retained intermediate interval has magnitude at most 2^30, products at most 2^60, and a subtraction before its guard has magnitude below 2^61. The cubic bisection uses signed 128-bit integers at grid denominator 65,536, with ample headroom at n≤20.

I cross-checked 1,228 individual Schur tests drawn from 400 independently generated graphs at orders 11 through 20. The oracle used arbitrary precision integer Bareiss elimination in the different mean-zero basis consisting of e_i−e_last. It reproduced all 913 passing decisions and all 315 rejections. The finite sample checks the implementation separately from the signed interval proof.

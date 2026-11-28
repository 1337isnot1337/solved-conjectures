# A degree-three root and a three-part residual graph

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). This applies to arbitrary weighted orders. A root is assumed to have ordinary degree at most three and to have every vertex at distance at most two. This second condition is automatic in a saturated triangle-free graph. The degree refers to the template, not to a blow-up.

For a degree-three root u, write a,b,c for its neighbors. Let S_i consist of the vertices outside {u,a,b,c} whose set of neighbors among a,b,c is exactly {i}; put S=S_a union S_b union S_c. If e is whole unordered weighted edge mass and beta(S) is the minimum monochromatic mass of the original induced graph on S, with its unnormalized masses, then

    beta(G) <= (e + 2 beta(S))/5.

Consequently the sharp bound holds if S is bipartite. It also holds whenever S has mass at most 17/25, without any bipartiteness hypothesis. In a least-support hypothetical counterexample with such a root, the necessary mass of S exceeds sqrt(803/1600), which is greater than 7/10.

## An explicit Clebsch map of all but the residual defect

Represent the Clebsch graph on the numbers 0 through 15, viewed as binary 4-vectors. Adjacency means that XOR is in {1,2,4,8,15}. Send u and all vertices adjacent to all of a,b,c to 0. Send a,b,c to 1,2,4 respectively. Send vertices whose root-neighbor sets are ab,ac,bc to 3,5,6 respectively.

Choose a minimum cut of G[S]. For the two cut signs, map the classes S_a, S_b, S_c as follows:

    class       first sign    second sign
    S_a              9             14
    S_b             10             13
    S_c             12             11

All profiles are nonempty outside the root and its neighbors, by the distance assumption. Edges between different exterior profiles can occur only if their neighbor sets are disjoint. Thus a pair profile can only be adjacent outside the root-neighbor set to its complementary singleton profile. The displayed map respects all these possible edges, and every edge from a singleton type to a different singleton type with the opposite cut sign, as direct XOR checks show. Any edge of G[S] with the same cut sign has two distinct nonadjacent images. These are the only edges not sent to Clebsch edges.

There are five sign characters on the 4-vectors that cut all but one of the five Clebsch generator directions: their masks are 15 and the four masks with three 1-bits. A uniform such character misses each Clebsch edge with probability 1/5. A nonzero non-generator difference is the sum of two distinct generators, so it is cut exactly when one of those two directions is the omitted one. Its miss probability is 3/5. Taking the expected cost proves the claimed formula.

## Consequences

For the unresolved whole-graph density interval, e <= 3197/20000. With s the total mass of S, Balogh–Clemen–Lidický gives beta(S) <= 2 s²/47, so s <= 17/25 implies e+2 beta(S) < 1/5. The two density tails are already known ([proof and weighted transfer](https://arxiv.org/abs/2103.14179)). At a least-support counterexample, S is a proper support, giving beta(S) <= s²/25 by minimality. The main formula then forces s² > (1/5-3197/20000)*25/2 = 803/1600. This conditional application of 1/25 does not assume the general conjecture.

If the root has degree two with neighbors a,b, all other profiles are singleton a, singleton b, or ab. The ab profile and the root can be merged into one label, and the singleton types can only be adjacent to each other and their own named neighbors. This gives a homomorphism to C5. The degree-one case gives a bipartite graph by the distance condition. Therefore any saturated least-support counterexample has ordinary minimum degree at least three; at every degree-three root all three singleton profiles must be nonempty and their union must have the large mass quantified above.

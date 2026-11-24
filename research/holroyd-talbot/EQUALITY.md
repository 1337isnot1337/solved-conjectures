# Equality cases for the private-clique theorem

Companion to [the main proof](README.md), issue #348. Status: written proof with the same imported weighted Chvátal theorem, not Lean-verified. This gives the complete strictness classification for the two-private-vertices graph class, including cliques of size two.

## Theorem

Suppose H has a partition into n nonempty cliques, each with at least two private vertices. Let t be the number of cliques of size exactly two. Then:

1. H is strictly r-EKR for 1≤r<n.
2. At r=n, H is strictly n-EKR if and only if t≤2.
3. If t≥1, identify the t two-vertex cliques with isolated edges, and let J be the induced graph on the other cliques. Every maximizing intersecting family of full transversals is of the form A×I_{n−t}(J), where A chooses precisely one of each pair of complementary bit strings in {0,1}^t. The maximum size is 2^{t−1}|I_{n−t}(J)|.

In point 3, I_0(empty) consists of the empty set, so the statement includes the disjoint union of n edges.

## Proof of point 1

Use the completion weights and representatives p_i,q_i of the main proof. For L={i}, x≠i and s=r−1, the injection from w(L∪{x}) to w(L) inserts q_x. When r<n, there are n−2≥s other available cliques outside {i,x}. Selecting s private q_j's there gives a completion avoiding C_x and hence outside the image. All singleton weights are positive. The strictness criterion of the main proof therefore makes every compressed maximizer a full star.

For reverse compression, use the same disjointness-connectivity argument, now with k=r−1<n−1. For two all-private k-sets differing in a choice within one clique, there are at least k other cliques because k≤n−2. A common disjoint independent k-set can simply avoid the conflicting clique; no third vertex is needed. For changes of support, use a disjoint private choice in any k cliques. Every independent k-set has a disjoint private k-set. This establishes connectivity and permits the reversal exactly as before.

The case r=1 is immediate.

## Full-transversal coupling

We need a coupling lemma for an arbitrary finite collection of cliques each having two designated private vertices, with any edges among nonprivate vertices. Let Ω be the set of its independent full transversals, i.e., independent sets choosing exactly one vertex in every clique. A uniform random transversal can be sampled by processing cliques in a fixed order and, at each step, choosing a vertex with probability proportional to the number of completions of the resulting prefix.

For each prefix, the two designated private options in the next clique have equal numbers of completions, each at least the number of completions of any other option: replace that option by the private vertex and delete it to invert the map on its image. Therefore every single option has conditional probability at most 1/2. If any option has conditional probability 1/2, the distribution is supported exactly on the two designated private choices, with probability 1/2 each. (If the option were a third vertex, the two private options alone would already contribute at least 1.)

For two prefix states, let p_a and q_a be the two marginal conditional distributions at the next clique. There exists a coupling with no equal choices, and with strictly positive mass on every pair (a,b) with a≠b and p_a q_b>0. To see existence, the transportation problem on the complete bipartite graph minus its diagonal has the weighted Hall constraints p_a≤1−q_a for each singleton row, since every set of at least two distinct rows has all columns in its neighborhood. These constraints hold because p_a,q_a≤1/2; weighted Hall follows from the max-flow/min-cut theorem. For full support, if p_a+q_a=1 for any a, both distributions are exactly the same two-private-choice distribution and the unique off-diagonal coupling has full allowed support. Otherwise all diagonal constraints are strict. For any allowed pair (a,b), subtract a sufficiently small positive δ from p_a and q_b and couple the residual distributions of mass 1−δ. For indices a,b the required singleton constraint follows from p_i+q_i≤1; at every other index choose δ≤1−p_i−q_i. Also choose δ≤p_a,q_b. This leaves a feasible transportation problem, and restoring δ on (a,b) yields positive mass there. Average such couplings over the finitely many allowed pairs.

Now sample two transversals simultaneously, using this coupling at each clique. The marginal law of each is uniform on Ω: conditional on its prefix and the other's prefix its next-choice marginal is precisely the prescribed completion distribution, which depends only on its own prefix. The two samples never choose the same vertex, so they are disjoint. Moreover every disjoint pair of full transversals has positive probability: every step along its prefixes has both marginal probabilities positive and different choices, hence positive joint probability. This supplies a uniform-to-uniform coupling supported exactly on the disjoint pairs. For zero cliques the unique pair of empty transversals supplies the analogous coupling.

## Connectivity and strict Hall for J

For t≥1, every size-two clique is an isolated edge because both its vertices are private. In J, every remaining clique has size at least three and two private choices. Its full-transversal disjointness graph D is connected when J is nonempty by the proof in the main note. It is also nonbipartite: the full p-transversal and full q-transversal are disjoint, hence adjacent. They are connected by an even walk obtained by changing one private choice at a time; each change admits a length-two walk through a transversal that uses a third vertex in the changed clique and the opposite private choice elsewhere. This even walk plus the edge gives an odd closed walk.

Consequently the bipartite double cover of D, with two labeled copies of Ω and edges across copies for disjoint pairs, is connected. Indeed, connectivity of D provides walks between any two vertices; a detour along a walk to an odd closed walk and back changes the parity, so both parity lifts are connected. If J is empty, the double cover is simply an edge between its two empty transversals.

Write N(X) for the neighborhood of a subset X of the left copy. The full-support coupling above gives |N(X)|≥|X|: all the mass |X|/|Ω| from X goes into N(X), whose marginal mass is |N(X)|/|Ω|. If equality holds and X is nonempty and proper, no mass from outside X can enter N(X). Full support means there is no edge from outside X to N(X); by definition no edge leaves X to the complement of N(X). This disconnects the double cover, a contradiction. Hence equality holds only for X empty or the entire left side.

## Proof of points 2 and 3

An independent full transversal of H corresponds to (x,T), where x is a bit string recording its choices on the t isolated edges and T∈Ω is a full transversal of J. Two such sets are disjoint exactly when their bit strings are complementary and their J-transversals are disjoint.

Partition the bit strings into the 2^{t−1} complementary pairs. On one such pair, an intersecting family selects subsets X,Y of the two copies of Ω with Y avoiding N(X). Hence |X|+|Y|≤|Ω|, and equality requires choosing the entire X side or the entire Y side, by strict Hall. Different complementary pairs never have disjoint sets across them: bit strings that are not complementary agree in at least one coordinate. So any selection of one full side per pair is intersecting and attains the maximum; every maximizer has this form. This proves point 3, including its equality statement.

For t=1 every antipodal selection is a one-coordinate star. For t=2, its two distinct chosen strings cannot be complements, so they agree in one coordinate and are exactly the two strings with that fixed bit. Thus these maximizers are full stars. For t≥3, choose the strings having at least two 1's among the first three bits. This chooses exactly one of each complementary pair and fixes no coordinate. The complete J-factor also has no common vertex because its designated p- and q-transversals are disjoint (and J may be empty). This is a maximum non-star family. For t=0, strictness follows from the main private-clique theorem. Point 2 follows.

## Audit and scope

- The second private vertex is essential to the coupling domination argument. The conditional distributions are on actual choices, not on unweighted projected supports.
- All clique sizes equal to two are genuinely isolated edges, not merely two-vertex induced subgraphs with external adjacencies.
- The double-cover strictness uses full support, not just a perfect matching, so equality cannot be attributed to connectedness alone.
- The classification at r=n is outside the original HT range for n>1 and is not counted as a separate conjecture resolution. It clarifies the strength and sharpness of the partial theorem.
- Hall's theorem and the elementary coupling argument are in addition to the weighted Chvátal inequality imported in the main note. No priority claim or independent review is made.

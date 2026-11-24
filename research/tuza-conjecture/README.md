# Tuza's conjecture — conditional packing/matching reduction

**Status (2026-11-24): partial research, not a resolution.** AI-assisted working note; independent mathematical review and priority verification remain outstanding. Tracking issue: [#312](https://github.com/1337isnot1337/solved-conjectures/issues/312).

## Target and source audit

For every finite simple graph G, Tuza's conjecture asserts that the minimum cardinality τ(G) of an edge transversal of its triangles is at most twice the maximum cardinality ν(G) of an edge-disjoint triangle packing. The factor 2 is attained by K4 and K5. Tuza, "A conjecture on triangles of graphs," Graphs and Combinatorics 6 (1990), 373–380, is a primary source. The problem dates to 1981.

The recent primary manuscripts [Wang, arXiv:2609.13831](https://arxiv.org/abs/2609.13831), [Liu–Zeng, arXiv:2610.15539](https://arxiv.org/abs/2610.15539) and [Tsujimura, arXiv:2611.11128](https://arxiv.org/abs/2611.11128) report respectively a 165/59 approximation, an edge-density condition, and triangle-overlap core conditions, rather than the unrestricted factor-two theorem. [Hughes et al.'s public Lean repository](https://github.com/mathdiscoveries/tuza-triangle-cover) reports a universal 81/29 bound (not independently replayed here). No complete prior resolution was found in this bounded literature search.

The classification of packing triangles into types 0, 1 and 3 and the exclusion of crossing triangles incident only to type-3 triangles are already in [Chalermsook, Khuller, Sukprasert and Uniyal, *Multi-transversals for Triangles and the Tuza's Conjecture*, SODA 2020, arXiv:2001.00257v2](https://arxiv.org/abs/2001.00257) (in particular Proposition 8, Corollaries 10–11, Propositions 12 and 15). Their later arguments for singly effective families (Claims 52–54) also overlap with the exchange approach here. These ideas are not asserted as new. The conditional matching formulation below is the specific deduction under investigation. Its novelty relative to all previous work is unestablished.

## Statement

Choose a maximum packing P with as many type-3 triangles as possible among all maximum packings. Write E(P) for its union of edges. A nonpacked triangle is private to T in P if its intersection with E(P) is one edge, belonging to T. A packed triangle's type is the number of its edges supporting private triangles. Call type-3 triangles rigid and types 0 and 1 flexible.

Each rigid R determines an anchored K4, K_R, containing exactly E(R) among the packed edges. Assume the anchored K4s are pairwise edge-disjoint. They may share vertices. This is a hypothesis, not an established property of all graphs.

For a flexible T, let F_T be the nonpacked triangles that meet T in an edge and meet no other flexible packed triangle in an edge; they may meet rigid packed triangles.

1. If F_T is nonempty, all its triangles contain a common edge b_T of T.
2. Choose two opposite edges of each K_R and the edge b_T for every nonempty F_T. Let D consist of nonpacked triangles not yet hit. Every U in D meets at least two flexible packed triangles.
3. Form a bipartite incidence graph with left vertices D and right vertices the flexible packed triangles, with incidences for shared edges. Give T capacity c_T=1 if F_T is nonempty, and 2 otherwise. Let M be the maximum number of left vertices assignable to adjacent right vertices without exceeding these capacities, and put d=|D|-M. Then τ(G) ≤ 2ν(G)+d.

In particular, if the capacitated Hall inequalities hold for all subsets S of D (|S| ≤ sum of c_T over T in N(S)), the conjecture holds. The incidence graph being a pseudoforest (each component has at most one cycle) is a sufficient condition. All statements apply to graphs of arbitrary size satisfying the hypotheses.

## Proof

### A. Known packing structure (reproved for self-containment)

Any nonpacked triangle hits at least one packed edge, by maximality, and at most one edge of any individual packed triangle, since two distinct triangles cannot share two edges.

If distinct edges of T have private witnesses with different outside vertices, the witnesses are edge-disjoint and meet no packed triangle other than T. Replacing T with these two witnesses augments P. Thus if at least two edges have witnesses, all witnesses on these two edges have the same outside vertex x. Their union with T contains all six edges of the K4 on V(T) and x. The three edges from x to T are nonpacked, by privacy of the witnesses. The third edge of T therefore also has a private witness with apex x. Any further private witness on any edge must use that same apex, or the exchange with a witness based on another edge augments P. This proves that type 2 is impossible and that each rigid T has a unique anchored K4 with exactly the three packed edges of T. Its three other faces are precisely the private witnesses.

No nonpacked triangle U can touch k≥2 packed triangles all of which are rigid. In fact, if it touches at least two rigid triangles, the following exchange works when these are *all* the packed triangles that U touches. Write e_i for the edge shared by U and rigid R_i, t_i for the third vertex of R_i, and z_i for its K4 apex. Distinct e_i share a vertex. The t_i lie outside U and are distinct: otherwise two packed triangles would share an edge. Each z_i is outside U: if it were the third vertex of U, then K_{R_i} would contain a packed edge e_j for j≠i. Also z_i cannot equal t_j for j≠i, because the edge from t_j to the common endpoint of e_i,e_j would then be a packed edge of R_j in K_{R_i}. By definition z_i is not t_i. Choose distinct endpoints w_i of the e_i (for two edges choose their noncommon endpoints, and for three choose cyclically). The private faces {w_i,t_i,z_i} are edge-disjoint from U and each other; they share at most an apex. They are disjoint from untouched packed triangles by privacy. Replacing the k triangles R_i by U and these k private faces augments P, a contradiction.

### B. Effective-family intersection under disjoint rigid blocks

Suppose U,V in F_T are edge-disjoint. Remove T and all rigid packed triangles R in the set S that U or V touches through a packed edge.

For each R in S, at most one edge of U and at most one edge of V lies in K_R. Indeed U and V each use an edge of T, which is outside K_R since the only packed edges in K_R belong to R. A triangle with two edges in a complete graph on four vertices has all three there. Hence neither U nor V can have two edges there.

At least one of the forbidden edges in K_R is an edge xy of R. Suppose it belongs to U. Because U also contains an edge of T, R and T meet in exactly one vertex w which is an endpoint of xy. The edge opposite xy in K_R joins the third vertex of R and its apex. Neither of these vertices is in T: the third vertex is excluded by edge-disjointness of R and T, and the apex cannot belong to T since its edge to w would then be a packed edge of T in K_R. A triangle containing the opposite edge cannot also contain an edge of T, because those two edges would have disjoint endpoints. Thus V cannot contain that opposite edge.

Consequently each K_R has at most two forbidden edges, which, if there are two, are adjacent. Some face avoids them (for two adjacent edges take the face excluding their common vertex). For one edge a face avoiding it also exists. Choose such a face for every R in S. The faces are pairwise edge-disjoint by the hypothesis on the anchored K4s. They avoid U, V and all untouched packed triangles, since K_R contains no packed edges outside R. The triangles U,V also avoid untouched packed triangles by the definition of S and F_T.

We have replaced |S|+1 packed triangles by |S|+2, contradicting maximality. This proves pairwise edge-intersection in F_T.

### C. Common effective base

If U,V in F_T use different edges of T, their pairwise edge-intersection forces the same outside vertex x: distinct outside vertices and different base edges would give at most a common vertex. All three edges from x to T occur in U or V. Each packed edge among these belongs to a rigid packed triangle R, by the definition of F_T. Such an R contains at most one of these edges, since two would force its third edge to be an edge of T.

For every such R, replace R by the face of K_R opposite x, freeing all three edges from x to T. These replacements retain a maximum packing: the anchored K4s are edge-disjoint and contain no other packed edges. Each formerly rigid triangle remains represented by a rigid triangle in its own K4. Indeed its block still has exactly the edges of its chosen packed face in the new packing; disjointness from all other original blocks and from other original packed edges is sufficient. Now T becomes rigid as well, because its three edges have private faces with apex x. The number of rigid packed triangles has increased, contrary to the lexicographic choice of P.

Therefore all members of a nonempty F_T use the same edge b_T of T.

### D. Matching and the transversal bound

Two opposite edges hit every face of K4. Select them for every rigid R, covering all packed rigid triangles and all nonpacked triangles touching only rigid triangles: such a nonpacked triangle must be private by Part A. Select b_T for each nonempty F_T, hitting all its triangles and T itself. Every remaining nonpacked triangle therefore touches at least two flexible triangles.

Use a maximum assignment of residual triangles to adjacent flexible triangles under capacities c_T (equivalently, duplicate each T into c_T matching slots). For each assigned U choose its shared edge with its assigned T. This uses at most c_T further edges per T. For each of the d unassigned triangles choose any one of its edges. If any flexible packed T remains uncovered, add an arbitrary edge of T. Such a T has an empty F_T and no assigned triangle, hence has unused capacity. The resulting set hits every triangle. Counting the edges by their origins gives at most two per packed triangle plus d extra edges. Taking the minimum yields τ(G) ≤ 2ν(G)+d.

The capacitated version of Hall's theorem gives d=0 precisely when the stated subset inequalities hold. If the incidence graph is a pseudoforest, the subgraph induced by any S and N(S) has at most |S|+|N(S)| edges, while each vertex in S has degree at least two, giving 2|S|≤|S|+|N(S)|. Thus |S|≤|N(S)|≤sum c_T and Hall applies. QED.

## Obstructions and scope audit

- The type-3 maximizing condition is needed in Part C, while Part B uses disjoint anchored K4s. Neither can simply be dropped from this proof.
- The Hall condition is sufficient, not necessary. K5 has ν=2, τ=4; every maximum packing consists of two triangles sharing one vertex. Both are flexible, each with its effective base opposite the shared vertex. The four nonpacked triangles containing the common vertex and one other vertex from each packed triangle remain. They have both packed triangles as neighbors, each of capacity one; the four left vertices have only two slots. In particular this assignment rule cannot certify K5, despite equality in Tuza's conjecture. A transversal using edges outside the packing is essential for the particular constrained choice of effective bases and residual assignment here. No universal Hall claim is made.
- Some small graphs have no eligible packing under the block-disjointness hypothesis. The reduction gives no bound on d that would imply the unrestricted conjecture.
- A full proof needs to handle overlapping anchored blocks, dense residual incidence obstructions, and/or selections of nonpacked edges or different packing modifications. A possible next step is a local replacement lemma combining multiple assigned and unassigned residual triangles, rather than treating each independently.
- No Lean verification or independent review is claimed. A finite graph-atlas cross-check is a check on the argument, not a proof of the conjecture.

## Computational cross-check

Run `python check_atlas.py` with NetworkX 3.6.1. The exact bitmask packing enumeration and integer bipartite matching test all 1,253 graphs in the graph atlas (orders 0 through 7), with the triangle-free cases skipped as trivial. Observed: 1,080 graphs containing triangles, 3,951 maximum packings, 3,701 eligible packings in 1,073 graphs; 2,402 zero-deficiency certifying packings in 961 graphs; 356 eligible packings with at least one rigid triangle; largest observed deficiency 14. These are checks of this construction with one deterministic choice of opposite edges, not new finite-order results, and not a claim about optimal transversals in the noncertified graphs.

# Graham's pebbling conjecture

Status: OPEN. Research checkpoint, 2026-11-24; associated issue #309. None of the results below resolves Graham's conjecture. Written proofs with finite cross-checks, not Lean-verified. Attribution for Graham's conjecture is to Ronald Graham as recorded by Fan Chung; the tree formula is classical (Chung, Fact 10). The present deductions are independent calculations in this session; priority for them is not established.

## Target and priority screen

For finite nonempty connected simple graphs, a pebbling move removes two pebbles at a vertex and adds one at an adjacent vertex. Let p(G,r) be the least number guaranteeing a pebble at the specified root r; let p(G)=max_r p(G,r). The original conjecture is

```math
p(G\square H)\le p(G)p(H).
```

Original source: Fan R. K. Chung, "Pebbling in Hypercubes", SIAM Journal on Discrete Mathematics 2 (1989), 467–472, Section 4, Question 3 (RLG), https://doi.org/10.1137/0402041. The original printed question on p. 472 was inspected.

Primary-source screen: Asplund, Hurlbert and Kenter, https://arxiv.org/abs/1801.07808, prove the general bound (p(G)+|V(G)|)p(H), hence the factor-two bound. Pulaj, Wood and Yerger, https://arxiv.org/abs/2411.19314, give restricted-support computations for products of eight-vertex Lemke graphs, not an unrestricted proof. Herscovici, "Pebbling Cartesian products of C5", Discrete Mathematics 349 (May 2026), article 114943, https://doi.org/10.1016/j.disc.2025.114943, treats a product case under an odd-two-pebbling condition. Searches for a complete proof or counterexample under the names Graham, graph pebbling and Cartesian-product pebbling, including recent AI-assisted research, found no full resolution as of 2026-11-24. This is a good-faith screen, not a guarantee of priority or absence of unpublished work.

The problem is significant within graph pebbling: it generalizes the grid and hypercube results and implies that Class 0 graphs (those with pebbling number equal to their order) are closed under Cartesian products. The aim here is structural reduction to a class of graphs with tightly controlled pebbling numbers, rather than finite product enumeration.

## 1. A general obstruction to tight unrooted Class 0 completions

**Theorem 1.** Let q:X→G be a surjective vertex map between finite connected graphs such that adjacent vertices of X have either equal or adjacent images. Put s_v=|q^{-1}(v)|. For every v and every x over v,

```math
p(X,x)\ge p(G,v)+s_v-1.
```

Proof. Choose a v-unsolvable configuration on G of size p(G,v)-1. Lift it to X using one arbitrary representative of each nonroot fiber. There are no pebbles over v in this lift. Add one pebble to each of the s_v-1 vertices over v other than x. Until the first move entering this fiber, no pebbling move can originate there, since each vertex in it has at most one pebble. Moves outside the fiber project to legal moves in G, except that a move with equal images can be omitted: omission leaves one additional pebble at the projected vertex. Inductively the projected configuration in the simulation dominates the projection of the moves of the lifted part, and the first entering move would put a pebble at v in G. This contradicts v-unsolvability. No such entering move can occur, and x remains empty. The configuration has p(G,v)+s_v-2 pebbles, giving the inequality. ∎

In particular p(G,v)≤p(X,x), and the product of two such surjections again satisfies the hypothesis.

If X is globally Class 0, put N=|V(X)| and n=|V(G)|. For every v,

```math
s_v\le N-p(G,v)+1.
```

Summing over fibers gives, for n≥2,

```math
N\ge\max\left(p(G),\,\left\lceil
\frac{\sum_v p(G,v)-n}{n-1}
\right\rceil\right).
```

Thus a globally Class 0 X of order exactly p(G) mapping onto G requires

```math
p(G)-n\le\sum_v(p(G)-p(G,v)).
```

This fails for every vertex-transitive G with p(G)>n: all the rooted pebbling numbers equal p(G), so every fiber would have size one. For example C6 has six vertices and p(C6)≥8 by the distance-three stack obstruction. More generally, for a vertex-transitive G with p=p(G)>n, any globally Class 0 surjective completion must have order at least

```math
p+\left\lceil\frac{p-n}{n-1}\right\rceil.
```

Consequently the tempting proof of Graham's conjecture by embedding each graph in a globally Class 0 weak retract of order exactly its pebbling number cannot work. This does not rule out rooted completions or other reductions.

## 2. Exact quotient formulation for clique blowups

For positive integers s_v, construct X=G[s] by replacing each v with a clique of s_v vertices and each base edge with all edges between its two fibers. Choose target x over r. A configuration is immediately solvable if x has a pebble or another vertex in the root fiber has a pair. Otherwise its root-fiber pebbles cannot participate before an external move arrives; such an arrival can be directed to x.

For each nonroot fiber v let M_v be its total initial pebbles and P_v its number of disjoint colocated pairs, i.e. the sum of floor(c(u)/2) over u in the fiber.

**Theorem 2 (exact quotient criterion).** In the non-immediate case, the configuration is x-solvable if and only if there exist nonnegative integers f_{uv} on the two directed versions of each base edge. Let I_v and O_v denote total incoming and outgoing multiplicities. The conditions are

```math
O_r=0,\quad I_r\ge1,\qquad
O_v-I_v\le P_v,\quad 2O_v-I_v\le M_v\quad(v\ne r).
```

Necessity: take an actual solution truncated at the first external arrival to the root fiber. Count only cross-fiber moves. Each arrival raises the number of colocated pairs in its destination by at most one, each departure removes one pair, and internal moves cannot increase the total pair count (one pair is used, at most one formed). This gives O_v-I_v≤P_v. Counting pebbles gives 2O_v-I_v≤M_v because internal moves also decrease total mass. No moves originate in the root fiber before the first arrival.

Sufficiency: eliminate directed cycles from the support of f, decrementing all arc multiplicities around a cycle by one (or their minimum). At every affected vertex both I_v and O_v decrease by the same amount, preserving the first inequality and improving the second. The root is not on any cycle because O_r=0. The process terminates since the total arc multiplicity decreases. In a topological order of the resulting acyclic digraph, all incoming pebbles to a fiber arrive before any departure. Assign incoming pebbles to vertices with odd counts whenever possible. If the fiber begins with O=M-2P odd counts, k arrivals can then make the number of pairs exactly

```math
P+\min(k,O)+\left\lfloor\frac{\max(k-O,0)}2\right\rfloor
=\min\left(P+k,\left\lfloor\frac{M+k}2\right\rfloor\right).
```

The first expression follows by pairing with each initial odd pile once, then pairing remaining arrivals. Both inequalities in the theorem guarantee enough pairs to execute every required outgoing move. Complete adjacency between neighboring fibers allows arbitrary placement at the destination. Direct the first arrival in the root fiber to x. This proves sufficiency without internal moves. ∎

This criterion gives a small integer feasibility formulation even when the blowup is large. In particular a fiber's individual distribution matters only through M and P. At fixed total M and fiber size s, the minimum possible number of pairs is

```math
P_{\min}(M,s)=\max(0,\lceil(M-s)/2\rceil).
```

For attainability, place one pebble at each of as many vertices as possible with parity matching M, then distribute the remaining even number of pebbles in pairs. Larger P can only make the feasibility inequalities easier. A worst root-fiber configuration contains s_r-1 singletons outside the target. Consequently a rooted blowup is Class 0 at x if and only if every vector of nonroot fiber masses summing to |V(X)|-s_r+1 satisfies the quotient criterion with P=P_min. The condition is sufficient for larger nonroot masses by monotonicity and necessary by the attainable worst configurations.

## 3. General upper bound and a safe one-vertex extension

For any clique blowup of order N of a base graph of order n,

```math
p(G,r)+s_r-1\le p(X,x)\le p(G,r)+N-n.
```

The lower bound is Theorem 1. For the upper bound, start with p(G,r)+N-n pebbles. If there is no immediate root solution, discard the root-fiber singletons. In each other fiber discard one pebble from every odd pile except one, if there are multiple odd piles. At most s_v-1 pebbles are discarded from each fiber, for at most N-n total. The aggregate projected configuration of at least p(G,r) pebbles is solvable on G. Simulate its moves: with at most one odd pile in each fiber, the number of available pairs equals the floor of half the aggregate mass; after each arrival put it on the unique odd pile if one exists. Removing pairs preserves the invariant. A move to r can be directed to x. ∎

For a single cloned vertex v≠r, a useful sufficient criterion for preserving p(G,r) is that every maximum r-unsolvable base configuration (of size p(G,r)-1) has an even count at v. Indeed, start with p(G,r) pebbles in the blowup. If the cloned pair is not both odd, projection is simulated without loss. If both are odd, discard one pebble from one clone; projection now has p(G,r)-1 pebbles and an odd count at v, so it is solvable by the stated condition. The lower bound ensures equality. This criterion is sufficient only. Cloning the root itself always increases the rooted number by exactly the number of extra clones, by the two bounds above.

## 4. Order-tight rooted completion for all rooted trees

Call a graph rooted Class 0 at x when p(X,x)=|V(X)|, regardless of its other roots.

**Theorem 3.** Every finite rooted tree (T,r) admits a clique blowup X of order p(T,r) that is rooted Class 0 at the unique vertex over r. In fact, orient T toward r and let h(v) be the maximum downward distance from v to a leaf in its descendant subtree. Set s_r=1 and s_v=2^{h(v)} for v≠r.

Proof, part A (identify the order). The classical rooted tree formula, expressed in these heights, is

```math
p(T,r)=1+\sum_{v\ne r}2^{h(v)}.
```

Here is a direct derivation to fix the convention and avoid any reliance on the equivalence of path partition definitions. For an ordinary tree configuration of masses m_v, let A_v=m_v+sum_c floor(A_c/2), summing over children. Rootward greedy moves produce A_r pebbles at r. This is maximal: under a move from a child to its parent the child's A decreases by two and its contribution to the parent decreases by one while the parent receives one, leaving the parent's A unchanged. Under a move from parent to child, the parent's local mass decreases by two and the child's contribution increases by at most one. Thus A_r never increases under arbitrary legal moves. This also handles moves away from the root.

For v≠r put W_v=sum_{u in the subtree of v}2^{h(u)}. Let F_v(k) be the largest mass in this subtree with floor(A_v/2)≤k, for an integer k≥0. We claim F_v(k)=W_v+2^{h(v)+1}k, with a maximizing configuration attaining floor(A_v/2)=k. At a leaf this is 2k+1. For an internal vertex, write k_c=floor(A_c/2), K=sum_c k_c, and a=2^{h(v)}. The constraint is m_v+K≤2k+1. Induction and 2^{h(c)+1}≤a imply total mass at most

```math
\sum_c W_c+aK+(2k+1-K)
\le\sum_c W_c+a(2k+1)=W_v+2ak.
```

Equality is attained by assigning k_c=2k+1 to a deepest child, k_c=0 to the others, and m_v=0, using the extremizers from induction. This also attains output k. Finally a root-unsolvable configuration must have m_r=0 and all its child outputs zero. Its largest mass is therefore sum_c W_c. Adding one proves the displayed rooted tree formula, which is the height form of Chung's classical Fact 10.

Part B (prove the blowup is rooted Class 0). Let N_v be the number of vertices in the blowup of the subtree of v, and let L_v be its initial total mass. Work bottom-up, using the greedy arrival rule of Theorem 2 at every fiber, then send every available pair to the parent fiber. Write k_v for the number sent, and K=sum_c k_c. Let m_v and P_v be local initial mass and pairs. The output is exactly

```math
k_v=\min\left(P_v+K,\left\lfloor\frac{m_v+K}2\right\rfloor\right).
```

For every nonroot v we prove L_v≤N_v+2s_vk_v. For a leaf s_v=1, k_v=floor(m_v/2), so m_v≤1+2k_v. At an internal v, induction gives child mass at most sum_c N_c+s_v K since 2s_c≤s_v. Write s=s_v≥2 and k=k_v.

If k=P_v+K, then m_v≤2P_v+s=2(k-K)+s (there are at most s odd piles). Hence

```math
L_v\le N_v+2k+(s-2)K\le N_v+sk\le N_v+2sk,
```

where K≤k. If k=floor((m_v+K)/2), then m_v+K≤2k+1 and K≤2k+1, so

```math
L_v\le\sum_c N_c+2k+1+(s-1)K
\le N_v+2sk.
```

This proves the induction. If the bottom-up strategy does not reach r, the root has zero initial mass and all child outputs are zero. The total initial mass is therefore at most sum_c N_c=|V(X)|-1. So every configuration of |V(X)| pebbles is solved. The reverse bound holds in any graph, by one singleton at every nontarget vertex. Part A identifies |V(X)| with p(T,r). ∎

**Corollary.** If a rooted graph (G,r) has a spanning tree T with p(T,r)=p(G,r), the same construction with the additional edges of G between its fibers gives an order-tight rooted Class 0 completion. The rooted tree blowup is a spanning subgraph; adding edges does not increase the rooted pebbling number. The universal order lower bound supplies equality.

This covers all rooted trees and every rooted graph with a pebbling-optimal spanning tree. Graphs that are already rooted Class 0 have the trivial completion.

## 5. Exact remaining problem and audit

If every rooted graph admitted an order-tight rooted Class 0 completion, and Cartesian products of rooted Class 0 graphs were rooted Class 0 at the pair of roots, then the stronger rooted form p(G □ H,(r,s))≤p(G,r)p(H,s) would follow by taking the two surjections and projecting a solution. This implies the original conjecture. Neither of those two remaining assertions is proved here. The original unrooted Graham inequality does not by itself give closure for graphs that are Class 0 only at designated roots; their global pebbling numbers may be larger.

Theorem 1 rules out using the analogous unrooted completion statement. Theorem 2 converts the rooted completion question to a finite exact optimization on the original quotient: choose positive fiber sizes summing to p(G,r), with the root fiber necessarily singleton, and test all worst-mass vectors at this total. Theorem 3 settles the completion question for rooted trees but not arbitrary graphs, and does not settle a product inequality for arbitrary partners.

Audit: The projection argument is valid even when an edge collapses; omitting such a move leaves a dominating configuration. Target-fiber singletons are inert before the first arrival. The quotient criterion counts both total mass and pairs, and its sufficiency explicitly removes all directed cycles before scheduling moves; it is not a relaxation. The tree proof uses actual achievable greedy outputs, not a fractional routing bound. The rooted/unrooted distinction is essential. All statements concern finite graphs with integer pebbles. No formal or external verification is claimed.

Possible next tests: use the exact quotient criterion to search for a rooted graph lacking a tight completion; develop a general rooted completion construction or identify a stronger necessary obstruction. Separately, attempt rooted Class 0 product closure using coupled quotient move schedules. Do not count these intermediate statements or finite searches as a solved named conjecture.

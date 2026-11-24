# Strong Target Conjecture

Status: **partial result, not a solution of the unrestricted conjecture.**

The graph is finite, simple and connected. A configuration C and demand D are nonnegative integer functions on the vertices. A pebbling move consumes two pebbles at one endpoint of an edge and delivers one at the other. Let π(G,D) be the least mass guaranteeing that every configuration can satisfy D. Let π_t(G)=max_r π(G,t e_r), t=|D|≥1, and s=|supp D|.

The Strong Target Conjecture asserts π(G,D)≤π_t(G)−s+1 for every such G and D. It strengthens the Target Conjecture of Herscovici–Hester–Hurlbert. The strong version is stated in Alcón et al., *Pebbling in powers of paths*, arXiv:2112.09753 (2021), and as Conjecture 10 in Adauto–Bardenova–Bidav–Hurlbert, *Target Pebbling in Trees*, Discrete Mathematics 349 (2026), 115029, arXiv:2504.10460v2, p. 6. The latter source reports it for trees and powers of paths. Searches through 2026-11-24 found no full resolution and no specific proof of the strong inequality for all complete multipartite graphs. This is not a comprehensive priority certification.

## 1. A general farthest-layer lower bound

**Lemma.** If r has eccentricity d≥1 and F={v:dist(r,v)=d}, then

    π(G,t e_r) ≥ 2^d t+|F|−1.

**Proof.** Define the integer potential

    Φ(C)=Σ_{dist(r,v)<d} 2^(d−1−dist(r,v)) C(v)
         + Σ_{v∈F} floor(C(v)/2).

Every move is nonincreasing in Φ. For edges with both endpoints outside F, the endpoint weights have ratio at most two. A move from F to its preceding layer decreases the pair count by one and increases the weighted count by one. A move in the reverse direction decreases the weighted count by two and increases the pair count by at most one. A move within F consumes a pair and creates at most one pair.

Stack 2^d t−1 pebbles at one vertex of F and place one at every other vertex of F. This has size 2^d t+|F|−2 and potential 2^(d−1)t−1. A configuration with t pebbles at r must have potential at least 2^(d−1)t. Thus the displayed configuration is unsolvable. ∎

Independently, for every graph of order n≥2, π_t(G)≥n+2t−2: use the same argument on K_n (d=1), then use monotonicity under deleting edges.

For a connected noncomplete multipartite graph with largest part size a≥2, the farthest layer of a root in a largest part has size a−1 and eccentricity two. Consequently

    π_t(G) ≥ max(n+2t−2, 4t+a−2).

The bound is a known exact single-root formula for this family; the proof below needs only the two elementary lower bounds, not the published exact formula.

## 2. Strong Target Conjecture for all complete multipartite graphs

**Theorem.** Let G be a connected complete multipartite graph of order n≥2 with largest part size a≥2. For every demand D of total t≥1 and support s,

    π(G,D) ≤ max(n+2t−s−1, 4t+a−s−1)
           ≤ π_t(G)−s+1.

For the complete graph K_n the first term alone suffices. For n=1 the strong conjecture is immediate.

**Proof.** Given C, reserve min(C(v),D(v)) pebbles at each vertex. The nonreserved pebbles are surplus, and the remaining demand at a vertex is its deficit. Use only nonreserved pebbles for moves and add arriving pebbles directly to the reserve whenever they satisfy a unit of deficit.

Write e for the total initial deficit, and J for the set of initially deficient vertices. Then

    t−e ≥ s−|J|.                                      (1)

Indeed, every initially nondeficient target vertex has at least one reserved pebble.

First use arbitrary direct moves from surplus pairs to adjacent deficient vertices until no such move is possible. Each reduces the total deficit by one, and total mass by one. If all demands are met, stop. Otherwise let k≥1 be the remaining total deficit, so the number of direct moves was e−k. Let S be the total remaining surplus. The remaining mass is t−k+S, and hence the original mass M satisfies

    M=t+e+S−2k.                                     (2)

No vertex of J ever acquires surplus during this first stage: it starts with no surplus and receives only until its deficit is zero. This invariant is important for the support correction.

If there are no remaining surplus pairs, S≤n−|J|. Equations (1) and (2) give

    M ≤ 2t+n−s−2.

Thus a configuration at the claimed threshold cannot terminate this way.

Otherwise, choose a remaining deficient vertex. Every vertex with a surplus pair must be in its part P; otherwise another direct move is possible. Since there is at least one surplus pair, every remaining deficient vertex must also belong to P. In particular, all vertices outside P have at most one surplus pebble and no deficit.

Let p be the total number of surplus pairs in P and q the number of surplus singletons outside P. Let a_P=|P| and j_P=|J∩P|.

All surplus pairs in P can send to any vertex outside P, since G is complete multipartite. Each of the q outside surplus singletons can receive a single pair-output and relay one pebble to any deficit vertex in P. Two further pair-outputs sent to the same outside vertex also create a relay pair. Thus a sufficient condition for satisfying every remaining demand is

    p≥k and p+q≥2k.                                 (3)

To see this constructively, first satisfy min(q,k) deficits via distinct singleton relays, using that many pair-outputs; if further deficits remain, allocate two pair-outputs per deficit to any outside relay, then use the resulting pair. Pair-outputs can be sent from the initial disjoint pairs in P, so no returned pebble is needed as a source. The destinations are deficient vertices and are disjoint from surplus-pair sources. At least one outside vertex exists since G is connected with at least two parts.

If (3) fails because p≤k−1, then

    S≤2p+n−|J|,

as all odd surplus piles have support outside J. Substitution in (2) and use of (1) give

    M≤2t+n−s−2.

If (3) fails because p+q≤2k−1, then

    S≤2p+(a_P−j_P)+q
     ≤4k−2−q+a_P−j_P.

Equation (2) yields

    M≤t+e+2k−2+a_P−j_P.

Every initially deficient vertex outside P has become satisfied in the first stage, which requires at least one direct move per such vertex. Therefore e−k≥|J|−j_P. Together with (1),

    3t−e−2k = 3(t−e)+2(e−k) ≥ s−j_P.

Hence

    M≤4t+a_P−s−2≤4t+a−s−2.

All ways in which the algorithm fails imply M≤max(n+2t−s−2,4t+a−s−2). At one more pebble than this upper bound, the algorithm must succeed, proving the theorem.

For a complete graph, the second stage with a deficit and a surplus pair in the same part cannot occur, since every part is a singleton and a vertex cannot have both surplus and deficit. Only the first bound is required. ∎

The proof is constructive, applies to every number and size of parts and every integral demand, and does not assume targets distinct or configurations stacked.

## 3. Exact cancellation and a general sufficient condition

**Cancellation lemma.** For nonnegative integer A, C, D,

    C satisfies D iff C+A satisfies D+A.

For completeness, C satisfies D exactly when there exist nonnegative integral arc multiplicities f on the two orientations of the edges satisfying

    C(v)+in_f(v)−2 out_f(v) ≥ D(v) for every v.

Necessity follows by counting the moves of a solution. For sufficiency, cancel directed cycles by subtracting one from each arc on a cycle. Each affected vertex's displayed balance increases by one, so feasibility persists. Repeat until the support is acyclic. In a topological order, all incoming moves at a vertex have arrived before its outgoing moves; the inequality ensures sufficient pebbles for those moves and the local demand. Thus the arc condition is sufficient. Adding A to both sides cancels exactly. This is the ordinary acyclic integer-flow pebbling criterion; no new priority claim is made for it.

Let Z=V(G)\\supp(D), z=|Z|, and let d=diam(G). Add one to both source and demand at every vertex of Z. The positive cover-pebbling stacking theorem (Sjöstrand; independently Vuong–Wyckoff) applied to the strictly positive demand D+1_Z gives

    π(G,D) ≤ max_v [Σ_u D(u)2^dist(v,u)
                     + Σ_{u∈Z}(2^dist(v,u)−1)].      (4)

Indeed, if M reaches the right-hand side, then C+1_Z has mass M+z at least the cover threshold for D+1_Z; cancellation yields a solution of D from C.

Write F_d(v)={u:dist(v,u)=d}, including the empty set if ecc(v)<d. Section 1 gives, for every v,

    π_t(G) ≥ 2^d t+|F_d(v)|−1,

where the case F_d(v)=∅ follows even more strongly from stacking at a diametral endpoint.

Consequently the Strong Target inequality follows whenever, for every v,

    Σ_{u∈supp D} D(u)(2^d−2^dist(v,u))
      ≥ Σ_{u∈Z}(2^dist(v,u)−1)+s−|F_d(v)|.           (5)

This is an explicit sufficient condition on arbitrary graphs, not an equivalent condition. In particular, it proves the strong inequality for every positive demand: then Z is empty, s=n, and each vertex not in F_d(v) contributes at least one on the left. It also applies whenever target mass is sufficiently spread toward vertices at distance less than d from every v. The single-vertex graph is immediate.

## 4. Scope and audit

- Only the complete multipartite family and demands satisfying (5) on general graphs are established.
- The proof uses exact integer pair counts; no fractional transport or unproved optimization assumption.
- Direct delivery never draws on reserved pebbles, and initially deficient vertices remain excluded from surplus counts during stage one.
- The relay construction cannot reuse a pair-output: each comes from an initial disjoint surplus pair in P. It uses vertices outside P only; all needed cross-part edges exist.
- The cases p<k and p+q<2k need not be mutually exclusive, but their union covers failure of (3).
- The universal cover bound uses a published theorem only for strictly positive demands. The cancellation step does not assume that extra pebbles are immobile.
- The unrestricted Strong Target Conjecture, and a fortiori Graham's conjecture, are not resolved by this work.
- Attribution: original conjectures and prior results belong to their respective authors. The proofs here were developed in this session; novelty and priority of the intermediate results remain uncertain. No external review or Lean verification is claimed.

References:
- https://arxiv.org/abs/2112.09753
- https://arxiv.org/abs/2504.10460
- https://doi.org/10.1016/j.disc.2026.115029
- https://arxiv.org/abs/0905.3949
- https://arxiv.org/abs/2011.10623
- https://www.kurims.kyoto-u.ac.jp/EMIS/journals/EJC/Volume_12/PDF/v12i1n22.pdf

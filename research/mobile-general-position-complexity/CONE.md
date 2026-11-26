# Mobile general position complexity

**Partial resolution of the [complexity question](https://arxiv.org/html/2501.19385v5#S6).** Deciding whether the mobile general position number reaches a given threshold is NP-hard even on diameter-two graphs with a universal vertex. On the explicit hard family the threshold language is NP-complete and positive instances have linear-length move sequences. The unrestricted problem is in PSPACE; this result does not decide whether the unrestricted problem is in NP or PSPACE-complete.

The problem is posed in the concluding section of [Klavžar et al., *Traversing a graph in general position*](https://users.fmf.uni-lj.si/klavzar/preprints/Moving.pdf). The graph starts with any general position set of k occupied vertices. One move takes a robot along one edge to an unoccupied vertex, leaving the occupied set in general position. Success means that each vertex has been occupied at least once by some robot, not that each individual robot visits every vertex.

## An exact cone identity

Let G be a finite graph of clique number at least three with a vertex outside some maximum clique, for instance an isolated vertex. Form H from three layers of G by adding all three edges between the copies of each individual vertex in different layers, then adding a universal vertex u. Thus H is the cone over G□K₃. Then
```math
\mathrm{Mob}_{gp}(H)=\omega(G)+1.
```

**Upper bound.** A successful schedule visits u. In any general position configuration containing u, all other occupied vertices must be pairwise adjacent, since nonadjacent vertices have a length-two geodesic through u. This upper bound for cones is [Theorem 4.4 of Klavžar et al.](https://doi.org/10.1016/j.dam.2025.10.041). In the Cartesian product any clique not contained in a single layer is contained in the three copies of a single base vertex: two adjacent vertices in different layers share their base vertex, and any vertex adjacent to both also has that base vertex. Thus the product clique number is max(ω(G),3)=ω(G).

**Lower bound.** Fix a maximum clique C and some base vertex p outside it. Put one robot on each element of a copy of C in one layer, and a spare robot at u. In a graph of diameter two the general position sets are precisely the sets that induce disjoint unions of cliques: a violation is exactly an induced three-vertex path. This makes the following moves legal.

1. While the clique robots occupy C in layer i, the spare can go from u to any copy of a vertex outside C in a different layer and return. The visited vertex is nonadjacent to every occupied vertex in layer i.
2. To transfer the clique robots from layer i to layer j, first move the spare from u to the copy of p in the third layer. Transfer each clique robot along its same-base-vertex edge to layer j, in any order. The two occupied subsets of the C copies induce cliques with no cross edges, because their base vertices are all distinct. The spare is isolated from both subsets. After the transfer, move the spare back to u, now adjacent to a single fully occupied clique.

Transfer the clique into each layer in turn, visiting every copy of every vertex of C. From a different layer, visit each remaining vertex using rule 1. The universal vertex was already occupied. At most three transfers and a two-move excursion per visited vertex suffice, with length O(|V(H)|). This proves the identity.

## Complexity consequences

The classical CLIQUE decision problem remains NP-complete for instances whose threshold is at least four and whose graph has clique number at least three with an isolated vertex. For example, first join the source graph to a fixed four-clique, increase the threshold by four, and then append an isolated vertex. Apply the identity and increase the resulting clique threshold by one. The construction has just three times as many base vertices plus the universal vertex, and diameter two. On the constructed family a clique certificate in the base graph, or the explicit linear move sequence, gives membership in NP. Even when the layer representation is not supplied, a certificate may give it and check its isomorphism to the input independently.

For an arbitrary graph, a state can store the occupied k-set and the set of visited vertices. There are at most 4^n states and shortest paths, occupancy and admissibility of each move are polynomial-time checks (all pairwise distances can be precomputed). An accepting walk exists exactly when it can be found with at most 4^n state transitions, since repeated identical states can be removed. Guess the initial general position set and each move while maintaining a polynomial-size step counter; nondeterministic polynomial space equals PSPACE. If the question is formulated as “at least k”, one can guess any permitted occupancy count between k and n, without assuming that coverage is downward-closed.

## Prior scope

The first paper asks the complexity of the unrestricted decision problem and even whether a given starting set can be certified mobile in NP. The later survey still lists the complexity question open. The product/join paper proves the cone upper bound and gives separate tight examples, including birdcage graphs built from a prescribed clique; the construction here preserves the entire clique problem of an arbitrary input graph and gives a uniform transfer schedule. Searches combined the mobile position terminology with the problem-number, PSPACE/NP-hardness, and cone/product formulations. No earlier matching reduction was located in those sources. This is a bounded prior search. [Coordination issue #923](https://github.com/1337isnot1337/solved-conjectures/issues/923).

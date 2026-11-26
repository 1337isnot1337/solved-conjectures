# Mobile general position complexity

**Theorem.** The mobile general position threshold problem is PSPACE-complete even for graphs of diameter two in which more than half the vertices are universal. This is also true if the initial occupied set is supplied and the question is whether that set can visit the entire graph.

In a mobile general position schedule one robot moves along one edge to an empty vertex at each step, no three occupied vertices may lie on a common shortest path, and every vertex must be visited at least once by some robot. The threshold problem asks for such a schedule with at least a specified number of robots, with an arbitrary start. These are the problems posed in the conclusions of [*Traversing a graph in general position*](https://users.fmf.uni-lj.si/klavzar/preprints/Moving.pdf) and [Section 6 of the current survey](https://arxiv.org/html/2501.19385v5#S6). The completely mobile variant requiring every labelled robot to visit every vertex is not used.

## PSPACE membership

Precompute distances. A state consists of the occupied set and the set of all vertices visited so far; there are at most 4ⁿ states. An accepting state is reachable if and only if it is reachable via a walk of at most 4ⁿ steps, since a repeated state can be removed. Nondeterministically guess a permitted initial set and one move at a time, using a step counter of O(n) bits. Checking adjacency, emptiness and the distance equality for any occupied triple takes polynomial time. The state also has polynomial size, and nondeterministic polynomial space equals PSPACE. For the version with a given start there is no need to guess it.

## A covering component in a clique reconfiguration graph

Start from [Bonsma–Cereceda's PSPACE-complete four-colouring reachability problem](https://doi.org/10.1016/j.tcs.2009.08.023). The input is an m-vertex graph X and two given proper colourings s,t. A step changes the colour of one vertex, retaining properness. Assume m≥1. We build a graph B whose vertex set is partitioned into K=m+2 independent slots:

- One data slot per vertex v, containing its four colour values and one extra value * called its backup.
- A mode slot containing Start, Sim, Bridge and Sweep.
- A lock slot containing Left and Right.

Between distinct data slots, two ordinary colours are adjacent precisely when they can coexist in a proper colouring: if their vertices of X are adjacent the colours must differ. A backup is adjacent to every value in every other data slot. Both locks are adjacent to every data value. The remaining edges are given by this table.

| Mode | Adjacent locks | Adjacent data values |
| --- | --- | --- |
| Start | Left | Only the source value s(v) in each slot v |
| Sim | Left | All four ordinary colours, never a backup |
| Bridge | Left, Right | The target value t(v) and the backup in each slot v |
| Sweep | Right | All five values in every slot |

The clique number of B is K: a clique uses at most one vertex per slot, and the Start configuration with the source data and Left attains K. Full cliques (size K) correspond exactly to the configurations given by the four rows. In the full-clique token-jump graph, one replaces one occupied vertex by one other vertex, not necessarily a neighbor, retaining a full clique. This is exactly a change of one slot; there is no way to replace a value with one from a different slot in a full clique.

**Claim.** Some component of this full-clique graph collectively contains every vertex of B if and only if s can reconfigure to t.

If s reaches t, start in Start with source data and Left. Switch Start to Sim, and follow the recolourings to t. Switch Sim to Bridge, replace each target value by its backup, then switch the lock to Right and the mode to Sweep. With all backups present, replace any one backup by any ordinary value from its slot, and immediately return to the backup. These excursions cover every data value, and the route already visited all the modes and locks. All these operations are valid full-clique token jumps by the table.

Conversely, a covering component must contain the Start configuration and some Sweep configuration. Consider a path from the Start configuration to its first Bridge or Sweep configuration. Sweep cannot be entered from Start or Sim since both the mode and the lock would have to change. Therefore the first exit is to Bridge with Left; the preceding data contain only ordinary colours, so they must all be target values. Before this first exit, every data change while in Sim is a proper recolouring, and any visit back to Start has the exact source data. Ignoring changes of mode gives a recolouring from s to t. This proves the claim.

## A universal bank implements exactly this covering condition

Let L=|V(B)|+1 and form H from B by adding a clique U of L universal vertices. Set the robot threshold R=L+K−1. The host has diameter two, since B has nonadjacent values in each data slot, and more than half its vertices are universal.

A set of size R necessarily includes an occupied universal vertex because R>|V(B)|. With a universal vertex occupied, a general position configuration is precisely a clique: if two occupied vertices were nonadjacent, the universal vertex is between them on a two-edge geodesic. Conversely any clique is general position. Thus in a schedule with R robots, the occupied base vertices always form a clique of size K−1 or K, since the bank has only L vertices and the base clique number is K.

Project a schedule to the occupied base clique. A slide between U and B adds or removes one base vertex. A slide within U does not change the base. If there is a slide between x and y in B, both x and y are adjacent to all other occupied base vertices and are adjacent to each other, so the union of the two base cliques is a clique. Replace this slide by adding y and then removing x. The resulting path uses only one-vertex additions/removals and never goes below K−1. This preserves every previously visited base vertex.

In the graph of cliques of size at least K−1 with addition/removal moves, any size-(K−1) clique in a nontrivial component is adjacent to a full clique containing it. A component with no full clique is a single state and cannot cover B. The full cliques of one component are connected by token jumps: contract each two-edge excursion through a (K−1)-clique, forgetting possible returns to the same full clique. Thus a base component covering all B gives a component of full cliques covering all B. This yields the forward implication from mobility to s–t reachability.

The threshold “at least R” does not create any new yes-instances. Above R only R+1 robots could form a clique, since a base clique has size at most K. With R+1 robots all of U and exactly K base vertices are occupied, so adding or removing a base vertex is impossible. A base slide would require two adjacent values in the same slot, since every slot is occupied; there are no such edges. The base occupancy cannot change, and it does not cover B.

For the reverse implication, a full-clique token jump can be performed with R robots as two actual slides. At a full base clique, exactly one bank vertex is empty. Move the old base robot to that empty universal vertex; then move a robot from the bank to the new base vertex. Both states are cliques and every move is along an edge. Start with the Start full clique in B and with any L−1 vertices of U occupied. All B is visited by the claim. The last unvisited bank vertex is easily visited by moving one currently occupied universal robot into it, either initially or when needed; this keeps a clique and does not change the base. Thus both the unrestricted and fixed-start thresholds are PSPACE-hard. The host and the explicit initial set have polynomial size.

The same reduction transfers the source's superpolynomial shortest recolouring distances to shortest successful schedules on these diameter-two hosts. A successful schedule must visit both of the two mode vertices Start and Sweep. The segment between such visits projects to at most twice as many addition/removal steps, can be extended by at most two endpoint steps to full cliques, and then yields a source-to-target recolouring by the first-exit argument (reverse the segment if needed). Therefore on these input families no uniform polynomial bound on witness length is possible. This does not, by itself, rule out a different polynomial certificate unless NP≠PSPACE.

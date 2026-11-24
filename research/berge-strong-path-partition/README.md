# Berge's strong path partition conjecture

**Partial research.** An acyclic comparison proves the conjecture for compositions of traceable digraphs whose quotient has symmetric strongly connected components. It also gives a criterion for a specified optimal partition in a more general composition. The unrestricted conjecture remains open. [Issue #344](https://github.com/1337isnot1337/solved-conjectures/issues/344)

## Statement and source check

Let $D$ be a finite loopless digraph and let $k\ge1$. For a directed path partition $\mathcal P$ of $V(D)$, its $k$-norm is $\sum_{P\in\mathcal P}\min(k,|V(P)|)$. Berge's strong conjecture asks whether **every** minimum-$k$-norm partition admits $k$ pairwise disjoint stable sets such that each $P$ meets $\min(k,|V(P)|)$ distinct sets. Sets may be empty when appropriate. This generalizes the prescribed-partition version of Gallai–Milgram and extends the acyclic directed-path counterpart of Greene–Kleitman. [Berge (1982)](https://doi.org/10.1016/S0195-6698(82)80022-X) · [Hartman, Conjecture 2.8](https://doi.org/10.1016/j.disc.2005.12.039)

The November 24, 2026 search checked the original statement, known acyclic results, known general regimes, and more recent papers for resolutions under other names. The proof for $k=2$ and the proof for $k\ge\lambda(D)-3$ have restricted quantifiers. The 2026 paper of de Paula Silva, Nunes da Silva and Lee proves relaxed Linial inequalities with acyclic sets. The conjectures on alpha-diperfect digraphs and undirected detour partitions concern different statements. No full resolution was located. [Berger–Hartman](https://doi.org/10.1016/j.ejc.2006.10.003) · [Herskovics](https://www.sciencedirect.com/science/article/pii/S0166218X15003923) · [de Paula Silva et al.](https://arxiv.org/abs/2603.17115) · [de Wet–Frick](https://doi.org/10.7151/dmgt.2590)

## Acyclic comparison for a prescribed partition

A composition $D=Q[H_1,\ldots,H_m]$ consists of disjoint copies of the $H_i$ and, for each arc $i\to j$ of the quotient $Q$, every arc from $H_i$ to $H_j$. Assume that each $H_i$ has a directed spanning path, allowing a one-vertex path.

**Proposition.** Let $\mathcal P$ be any $k$-optimal path partition of $D$. Build a digraph $F$ on $V(D)$ containing all arcs of the paths of $\mathcal P$, and the full set of interpart arcs corresponding to asymmetric quotient arcs. Here $i\to j$ is asymmetric if $j\to i$ is absent from $Q$. If $F$ is acyclic, then $\mathcal P$ has an orthogonal partial $k$-coloring.

Choose a total order of $V(D)$ extending a topological order of $F$. Construct an acyclic digraph $A$ on the same vertices.

- Within each $H_i$, put a transitive tournament with all arcs forward in the total order.
- Between parts joined by an asymmetric quotient arc, keep all the prescribed arcs.
- Between parts joined by both quotient arcs, put one arc for each cross pair, directed forward.
- Between parts with no quotient adjacency, put no arcs.

All arcs of $\mathcal P$ survive. Every adjacency of $D$ is an adjacency of $A$, so a stable set of $A$ remains stable in $D$.

For any path partition of $A$, split its paths into their maximal consecutive runs in individual parts. For a fixed $i$, the total size of its runs equals $|V(H_i)|$. Split a directed spanning path of the original $H_i$ into disjoint consecutive segments of exactly the run sizes, and assign one segment to each run. Do this for every part. Each interpart step between consecutive runs is still a directed step after the substitutions, because every such step of $A$ is supported by the corresponding quotient arc in $D$. The substituted paths partition $V(D)$, with every path retaining its size. The argument works if a path visits the same part in several runs, since the assigned segments are disjoint.

Therefore an improvement on $\mathcal P$ in $A$ would also improve it in $D$. It is $k$-optimal in $A$. The acyclic strong path-partition theorem now gives an orthogonal partial $k$-coloring in $A$. Its stable sets work in $D$ with the same specified path vertex sets. [Aharoni et al., acyclic theorem](https://doi.org/10.1016/S0195-6698%2886%2980036-1) · [Hartman, Theorem 2.9](https://doi.org/10.1016/j.disc.2005.12.039)

**Corollary.** If every strongly connected component of $Q$ is symmetric, the conjecture holds for all $k$ and all optimal partitions in $D$. Indeed, interpart arcs in $F$ between different components of $Q$ follow the acyclic condensation. Within a quotient component there are no asymmetric quotient arcs, so all arcs of $F$ there belong to the disjoint paths of $\mathcal P$. This makes $F$ acyclic.

In the special case of an acyclic quotient, the construction preserves the entire set of attainable path-size profiles. The reverse transfer is proved above. For a transfer from $D$ to $A$, split the transitive tournament's forward spanning path in each part into the requested sizes. Every interpart arc of $D$ also appears in $A$ in this case. This equality of profiles does not require that the parts be semicomplete. They only need directed spanning paths.

The composition operation has also been used for a different conjecture about partitioning vertices into two subdigraphs with bounds on their longest paths. That result does not address the prescribed orthogonality condition here. The dated search did not locate the exact acyclic comparison above. Priority remains provisional. [Ai–Gerke–Gutin–Zhou](https://arxiv.org/abs/2111.09633)

## Reduction for a counterexample search

For an arbitrary digraph and a prescribed $k$-optimal partition, delete one direction of each digon, choosing the deletion to retain the path arcs. The adjacency graph is unchanged. Deletion can only restrict path partitions, and the specified partition remains feasible, so it remains $k$-optimal. Thus a counterexample in a general digraph gives one in an oriented graph.

For a fixed list of path sizes, a counterexample search can use arc-presence variables and force the arcs of those paths. There are two kinds of separating clauses.

- If a candidate has an orthogonal partial coloring, every counterexample must contain at least one arc between two of that coloring's vertices of the same color.
- If a candidate has a strictly better path partition, every counterexample must omit at least one path arc of that partition.

To find a better partition, maximize the total savings $\sum_P\max(0,|V(P)|-k)$ over vertex-disjoint long paths. The unused vertices can all be singletons. A subset dynamic program records possible terminal vertices of a path on each subset. A second subset search packs the feasible long paths. To find a coloring it suffices to assign exactly $\min(k,|V(P)|)$ vertices on each prescribed path, in distinct colors, since deleting excess occurrences preserves orthogonality.

These tests target certificates for the original conjecture. A witness would require both exact optimality and impossibility of an orthogonal coloring. The current bounded searches are reconnaissance and supply no unrestricted conclusion. The structural obstacle for the written proof is that the path arcs and mandatory interpart arcs can form a directed cycle, or that a part can lack a directed spanning path needed to realize the requested runs.

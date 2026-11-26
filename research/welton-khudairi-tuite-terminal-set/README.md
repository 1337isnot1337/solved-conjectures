# Welton–Khudairi–Tuite terminal-set conjecture

**Status: partial.** Terminal sets lift through gated subgraphs. For an arbitrary substitution into a connected quotient, terminal sets are characterized exactly by their quotient and module choices. In particular a smallest counterexample is prime for modular decomposition and has no proper gated subgraph with at least two vertices. The general case remains open.

The target is [Conjecture 6 in the journal version](https://oro.open.ac.uk/98050/9/98050final.pdf) of *Lower General Position in Cartesian Products* (Conjecture 3.3 in the [arXiv version](https://arxiv.org/html/2404.19451#S3)). A set $S$ is general position if no three of its vertices satisfy a geodesic betweenness equality. It is terminal if, for every $x\notin S$, two distinct $a,b\in S$ satisfy $d(x,b)=d(x,a)+d(a,b)$. This endpoint property already implies maximality. We treat finite connected graphs; for a disconnected graph one can take the union of terminal sets of its components.

- [Distance-regular graphs](DISTANCE-REGULAR.md): every Delsarte clique is terminal, with elementary witnesses in several classical families.
- [Rank-threshold forms graphs](RANK-THRESHOLDS.md): terminal sets for all rectangular, symmetric, Hermitian, and alternating graph parameters, with an [exact graph-distance regression](check_rank_fibers.py).
- [Powers of exchange graphs](EXCHANGE-POWERS.md): terminal cliques in all powers of Hamming, Johnson, Grassmann, and classical dual polar graphs.
- [Strong products](STRONG-PRODUCTS.md): a rectangular subset is terminal exactly when every factor subset is terminal, also for scaled maximum metrics.
- [Odd graphs](ODD-GRAPHS.md): explicit constructions for all even parameters.

## Gated subgraphs

Suppose $H$ is an isometric subgraph of $G$ with at least two vertices and each vertex $x$ outside $H$ has a gate $g\in H$: for every $z\in H$,
$$
d_G(x,z)=d_G(x,g)+d_H(g,z).
$$
Every terminal set $S$ in $H$ is terminal in $G$. It is general position by isometry; vertices of $H\setminus S$ retain their witnesses. If $g\notin S$, combine the gate's endpoint witness with the displayed gate identities to obtain $d_G(x,b)=d_G(x,a)+d_H(a,b)$ for the same $a,b$. If $g\in S$, choose any $b\in S\setminus\{g\}$ and use the gate equality directly with $a=g$. Such a $b$ exists because no singleton is terminal in a connected graph of order at least two.

A connected graph with a gated edge therefore has a terminal set of size two; in a bipartite graph every edge is gated, since distances from any vertex to the endpoints differ by one. Gated factor layers also recover the terminal-set transfer for Cartesian products. More generally, if a single block in a connected graph has a terminal set, that set works in the whole graph: each vertex outside the block reaches it through its articulation gate. For a smallest hypothetical counterexample this says more generally that every proper gated subgraph is a singleton (assuming nonempty subgraphs).

## Arbitrary substitutions

Let $Q$ be connected with at least two vertices and let $S$ be a terminal set in $Q$. Replace each quotient vertex $v$ by a nonempty graph $H_v$, adding all edges between $H_v$ and $H_w$ precisely when $vw$ is an edge in $Q$. Write $G$ for the resulting graph. Distances between different modules equal the corresponding quotient distances. Inside a module the distance between distinct points is 1 for an edge and 2 otherwise: a vertex of an adjacent module supplies a length-two path. Thus no connectedness or diameter bound is needed on the individual modules.

For every $v\in S$, select a nonempty set $S_v$ inside $H_v$ by these rules:

- If $v$ has a neighbor in $S$, let $S_v$ be a maximal clique.
- If $v$ has no neighbor in $S$, let $S_v$ be a terminal set for the 1/2 metric of $H_v$.

For the second rule, a terminal set exists in the 1/2 metric of every nonempty simple graph. Choose a largest clique, and repeatedly choose a largest clique in the vertices having no neighbors in all previously selected cliques. The union is in general position because between cliques the distance is 2, and there is no path of length two through a third selected vertex between distinct cliques. An outside point $x$ has a neighbor in at least one selected clique. At the first such clique $C$, it was available for selection, so it cannot be adjacent to all of $C$ by maximal size. A neighbor and a nonneighbor of $x$ in $C$ give the endpoint witness. This is the diameter-two greedy proof in the primary paper, applied to the 1/2 metric even when $H_v$ is disconnected.

The union $\widehat S=\bigcup_{v\in S} S_v$ is in general position. Triples using three different modules reduce to $S$ in $Q$. Triples in one module work by construction. If two vertices lie in one module and the third in another, the two cross distances are the same positive integer $d$. Betweenness could hold only with internal distance $2d$, requiring $d=1$ and internal distance 2. But when selected modules are adjacent, both selected sets are cliques, so their internal distances are 1.

For a vertex $x\notin\widehat S$ in an unselected module, lift its quotient endpoint witness using any selected representative in each witness module. For $x$ in a selected module with no selected neighboring module, use the 1/2-metric witness. Otherwise let $u\in S_v$ be a nonneighbor of $x$ in its own module, which exists by maximality of the clique. Let $w$ be any chosen vertex in a neighboring selected module. Then $x,w,u$ is a geodesic of length two, giving the endpoint witness in the last case.

If a smallest connected counterexample has a proper nontrivial module, contract it to one vertex. The quotient remains connected, has at least two vertices, and is smaller. A terminal set in that quotient, supplied by minimality, lifts by this theorem, a contradiction. Hence a smallest connected counterexample has no proper nontrivial module. This extends the twin restriction in the primary paper to arbitrary module size and internal structure.

### Exact characterization and sizes

Conversely, let $\widehat S$ be any terminal set in $G$, set $S_v=\widehat S\cap V(H_v)$ and let $S=\{v:S_v\ne\varnothing\}$. Any collinear triple of quotient vertices in $S$ would lift to one in $\widehat S$, so $S$ is in general position. For any unselected module, take an outside point in it. Its two endpoint witnesses cannot be in a common module since their distances to the point would be equal. The witnesses therefore project to a quotient endpoint witness for that module. Hence $S$ is terminal in $Q$.

If $v\in S$ has a selected neighbor, then $S_v$ is a clique: two nonadjacent selected vertices there and one selected vertex in the neighboring module would be collinear. For any unselected point $x$ in $H_v$, two witnesses outside its module cannot work. If they are in different modules, they would make three vertices of $S$ collinear; if they lie in one module, their distances to $x$ are equal. Two witnesses inside $S_v$ also cannot work in this case if $x$ is adjacent to everyone in $S_v$. A witness pair using one $u\in S_v$ and one $w$ in another module works exactly when $d(x,u)=2$, the other module is adjacent to $v$, and $w$ is the middle vertex. Thus $x$ must have a nonneighbor in $S_v$, giving maximality of the clique. If $v$ has no selected neighboring module, a cross-module witness of this form is impossible, so $S_v$ must be terminal for the 1/2 metric.

This proves the exact characterization: terminal sets of $G$ are precisely those obtained by the two rules from terminal sets of $Q$. In particular, existence is equivalent for $G$ and $Q$. It also gives exact minimum and maximum cardinalities. For a fixed terminal $S$ in the quotient, take the sum over its occupied modules of the minimum (respectively maximum) size of a maximal clique when $v$ has a selected neighbor, and the minimum (respectively maximum) size of a 1/2-metric terminal set otherwise. Minimize (respectively maximize) these sums over terminal $S$ in the quotient.

## Independent regression

Run `python3 check_lifts.py` from this directory. It enumerates terminal sets directly from shortest-path distances and compares them with the full module prediction on 430 substitutions. It also checks unchanged transfer on 43 gated extensions. The finite check is a regression; the arguments above hold at every order.

## Consequences and prior scope

- Every distance-hereditary graph has a terminal set. This is already a direct combination of the primary paper's pendant/twin lifting argument in Lemma 3 and the [Bandelt–Mulder construction theorem](https://doi.org/10.1016/0095-8956(86)90043-2). It is not a separate priority claim.
- The same closure statements apply to arbitrary modular and gated extensions of previously certified graphs. For instance, they do not require every block of a connected graph to have small diameter or a known terminal set.
- The [general-position survey](https://arxiv.org/abs/2501.19385) records the full conjecture and the diameter, cograph and chordal results. Searches on 26 November 2026 covered the original paper and survey, the MathDB record, terminal general-position sets with gates, modules and lexicographic products, and both branches and issue trackers here. The original's twin and clique-separator arguments and Cartesian-layer characterization are prior results. No statement of the unrestricted modular lift was located in the inspected sources; this is a bounded search.
- The Cartesian-product numerical lower bound in [#854](https://github.com/1337isnot1337/solved-conjectures/issues/854) is a separate conjecture. Coordination for terminal existence is in [#869](https://github.com/1337isnot1337/solved-conjectures/issues/869).

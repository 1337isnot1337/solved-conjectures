# Welton–Khudairi–Tuite terminal-set conjecture

**Status: partial.** Terminal sets lift through gated subgraphs and through arbitrary substitutions into a connected quotient that has a terminal set. In particular a smallest counterexample is prime for modular decomposition and has no proper gated subgraph with at least two vertices. The general case remains open.

The target is [Conjecture 6 in the journal version](https://oro.open.ac.uk/98050/9/98050final.pdf) of *Lower General Position in Cartesian Products* (Conjecture 3.3 in the [arXiv version](https://arxiv.org/html/2404.19451#S3)). A set $S$ is general position if no three of its vertices satisfy a geodesic betweenness equality. It is terminal if, for every $x\notin S$, two distinct $a,b\in S$ satisfy $d(x,b)=d(x,a)+d(a,b)$. This endpoint property already implies maximality. We treat finite connected graphs; for a disconnected graph one can take the union of terminal sets of its components.

## Gated subgraphs

Suppose $H$ is an isometric subgraph of $G$ with at least two vertices and each vertex $x$ outside $H$ has a gate $g\in H$: for every $z\in H$,
$$
d_G(x,z)=d_G(x,g)+d_H(g,z).
$$
Every terminal set $S$ in $H$ is terminal in $G$. It is general position by isometry; vertices of $H\setminus S$ retain their witnesses. If $g\notin S$, append the gate's witness inequality with equality to the displayed gate identities to obtain $d_G(x,b)=d_G(x,a)+d_H(a,b)$ for the same $a,b$. If $g\in S$, choose any $b\in S\setminus\{g\}$ and use the gate equality directly with $a=g$. Such a $b$ exists because no singleton is terminal in a connected graph of order at least two.

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

## Consequences and prior scope

- Every distance-hereditary graph has a terminal set. This is already a direct combination of the primary paper's pendant/twin lifting argument in Lemma 3 and the [Bandelt–Mulder construction theorem](https://doi.org/10.1016/0095-8956(86)90043-2). It is not a separate priority claim.
- The same closure statements apply to arbitrary modular and gated extensions of previously certified graphs. For instance, they do not require every block of a connected graph to have small diameter or a known terminal set.
- The [general-position survey](https://arxiv.org/abs/2501.19385) records the full conjecture and the diameter, cograph and chordal results. Searches on 26 November 2026 covered the original paper and survey, the MathDB record, terminal general-position sets with gates, modules and lexicographic products, and both branches and issue trackers here. The original's twin and clique-separator arguments and Cartesian-layer characterization are prior results. No statement of the unrestricted modular lift was located in the inspected sources; this is a bounded search.
- The Cartesian-product numerical lower bound in [#854](https://github.com/1337isnot1337/solved-conjectures/issues/854) is a separate conjecture. Coordination for terminal existence is in [#869](https://github.com/1337isnot1337/solved-conjectures/issues/869).

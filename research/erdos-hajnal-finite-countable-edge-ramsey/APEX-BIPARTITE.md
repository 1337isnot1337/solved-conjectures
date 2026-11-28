# Erdős–Hajnal’s finite-to-countable edge Ramsey problem

[Problem #596](https://www.erdosproblems.com/latex/596), issue #1085. These are **edge** colorings, and subgraphs need not be induced. Call $`(F,H)`$ exceptional if $`F`$-free finite graphs are edge Ramsey for $`H`$ for arbitrarily many finite colors, yet every $`F`$-free graph of any size has a countable edge coloring without a monochromatic $`H`$. The following gives broad exact families, not the unrestricted classification.

## Countable escape from an apex-bipartite forbidden graph

Say $`F`$ is apex-bipartite if it embeds into $`K_{1,t,t}`$ for some finite $`t`$. Equivalently, some one-vertex deletion makes it bipartite (or it is already bipartite).

**Lemma.** If every neighborhood in $`G`$ induces a countably vertex-colorable graph, then $`E(G)`$ has a countable coloring with no monochromatic triangle.

Well-order $`V(G)`$. For each $`v`$, fix a proper coloring $`c_v:N(v)\to\omega`$. Give the edge $`uv`$, with $`u<v`$, the color $`c_u(v)`$. In any triangle $`u<v<w`$, the two edges at $`u`$ differ in color because $`v,w`$ are adjacent in $`G[N(u)]`$.

If $`G`$ is $`F`$-free for an apex-bipartite $`F\subseteq K_{1,t,t}`$, then it is $`K_{1,t,t}`$-free. Every link graph $`G[N(v)]`$ omits $`K_{t,t}`$, so it is countably vertex-colorable by the classical Erdős–Hajnal theorem. The lemma therefore gives the countable-escape clause for **every target $`H`$ containing a triangle**, with no bound on the host's vertex cardinality.

One can also obtain the same forced-cone statement from [Reiher's obligatory hypergraphs theorem](https://arxiv.org/abs/2403.11223), applied to the triple system on graph edges whose triples are triangles. The two large core sides of an expanded $`K_{m,m}`$ are graph edges with crosswise incidence. For $`m\ge5`$, one side cannot contain two disjoint edges: at most four edges meet both, leaving too few for the other side. A pairwise intersecting family of at least four distinct graph edges is a star. Every edge on the other side meets all of that star and so shares its center. The cross triangle completions give $`K_{1,m,m}`$. The local coloring proof above does not require this modern theorem.

## Finite Ramsey side

Use [Reiher–Rödl's girth Ramsey theorem](https://arxiv.org/abs/2308.15589) in the form of Theorem 1.2 of [Reiher–Rödl–Schacht, Unavoidable subgraphs in Ramsey graphs](https://arxiv.org/html/2502.09830). For any finite target $`H`$, finite palette, and finite bound $`\ell`$, it supplies a graph and a family of copies of $`H`$ capturing a monochromatic $`H`$; every subfamily of size between 2 and $`\ell`$ extends to a forest of copies. Each new copy in such a forest meets the preceding union in nothing, one vertex, or an edge common to both.

Replace the supplied graph by the union of those copies. If $`F`$ has no isolated vertices, any putative copy of $`F`$ uses at most $`|E(F)|`$ members of the system to cover all its edges. A single member is already a forest, and if there are several use $`\ell\ge |E(F)|`$. Consequently, if $`F`$ does not embed in any forest of copies of $`H`$, there are finite $`F`$-free Ramsey witnesses with all finite palettes. The same implication holds with isolated vertices if the nonisolated part of $`F`$ already fails to embed in those forests.

Two useful consequences:

1. If $`F`$ is 3-vertex-connected and not a subgraph of $`H`$, it does not embed into any such forest. An amalgamation separates the two sides by at most two vertices, so a 3-connected subgraph must remain on one side at each step. Conversely, if $`F\subseteq H`$, an $`F`$-free graph cannot contain even one $`H`$.
2. Every such forest has treewidth at most $`\max(1,\mathop{\mathrm{tw}}(H))`$ for targets with an edge (indeed at most $`\mathop{\mathrm{tw}}(H)`$). At each gluing, attach the decomposition trees at bags containing the connector; a vertex or edge lies in a bag on either side. Thus any $`F`$ of treewidth greater than that of $`H`$ is excluded by the construction. Isolated vertices of $`F`$ do not affect this strict comparison.

## Exact families

- **Every 3-connected apex-bipartite $`F`$, every triangle-containing $`H`$:** exceptional if and only if $`F\not\subseteq H`$.
- **Every apex-bipartite $`F`$, every triangle-containing $`H`$ of treewidth at most two:** exceptional if and only if $`\mathop{\mathrm{tw}}(F)\ge 3`$. Sufficiency uses the two previous sections. For necessity, every finite graph of treewidth at most two is a subgraph of a 2-tree after padding small graphs, and every 2-tree is a forest of triangles glued along edges. Theorem 1.3 of Reiher–Rödl–Schacht says every such forest is forced as a subgraph of every sufficiently multicolor edge-Ramsey graph for the triangle. A graph edge-Ramsey for $`H`$ is also edge-Ramsey for the triangle at the same palette. Hence there is a finite palette at which no $`F`$-free Ramsey witness exists, even among infinite hosts.
- **Forest criterion for balanced complete multipartite targets with a triangle:** let $`F`$ be apex-bipartite without isolated vertices and $`H`$ a balanced complete multipartite graph with at least three nonempty parts. Then $`(F,H)`$ is exceptional if and only if $`F`$ is not a subgraph of any forest of copies of $`H`$. The finite necessity is precisely the other family in Theorem 1.3; the countable-escape argument is unchanged.

For example, every wheel with even rim of length at least four is apex-bipartite, has treewidth three, and therefore gives an exceptional pair with every triangle-containing target of treewidth at most two. These examples are not a claim on the $`K_4`$-forbidden triangle target: $`K_4`$ is not apex-bipartite.

## Literature audit

- [Erdős 1987, Problem 5](https://www.renyi.hu/~p_erdos/1987-28.pdf), and [the current #596 statement](https://www.erdosproblems.com/latex/596), distinguish edge coloring from ordinary vertex Ramsey.
- [The #596 working report](https://erdosproblemaday.com/report/596) analyzes the $`C_4`$-forbidden row. It is a different slice from the nonbipartite forbidden graphs above.
- [Diskin–Hoshen–Krivelevich–Zhukovskii](https://arxiv.org/abs/2211.13966) exactly classify the **vertex** finite-Ramsey half by one-vertex amalgamation. Those statements do not settle the edge problem.
- The finite existence/nonexistence inputs used here are published results or preprints credited above. The contribution of this note is the combination with a direct countable escape condition to isolate classes of exceptional **edge** pairs. Searches by the original problem, cones over bipartite graphs, wheels, countable triangle-free edge partitions and forest-of-copies found no earlier source giving these combined classes; no absolute priority claim is made.

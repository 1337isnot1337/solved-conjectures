# Iterated cone obstructions to countable triangle Ramsey

Follow-up for [Erdős #596](https://www.erdosproblems.com/latex/596), issue #1085. A cone over a finite bipartite graph \(B\) consists of \(B\) plus a specified apex adjacent to all its vertices. Allow different \(B\) at different steps.

**Theorem.** Every graph that is edge Ramsey for a triangle under countably many colors contains every finite graph obtained by the following operations:

1. Add a disjoint cone over a finite bipartite graph, or add an isolated vertex.
2. Add a cone over a finite bipartite graph identifying **its apex** with any one vertex already present, keeping all its other vertices new.

This extends the single-cone criterion in [APEX-BIPARTITE.md](APEX-BIPARTITE.md). The resulting class can include graphs that are not apex-bipartite. For example, attach a second cone with a triangle at a rim vertex of the first, arranged so some triangle of the first misses that vertex.

## Proof

For a graph \(G\), repeatedly remove any vertex whose neighborhood in the graph still remaining is countably vertex-colorable. Continue by transfinite recursion, always choosing one such vertex if there is one, and stop at a residual graph \(R\). The recursion must stop because each removal uses a different vertex.

If \(R\) is empty, order \(V(G)\) by removal time. Each vertex \(v\) has a proper countable coloring \(c_v\) of its later neighborhood. Color an edge \(vw\) with \(v\) earlier than \(w\) by \(c_v(w)\). In any triangle, the two edges from the earliest vertex get different colors. This contradicts countable triangle Ramsey. Thus \(R\) is nonempty and, by construction, **every** vertex in \(R\) has a neighborhood of uncountable chromatic number within \(R\). In fact \(R\) itself must still be countably triangle Ramsey: if its edges have a countable triangle-avoiding coloring, use that coloring with a disjoint palette on \(R\), and the preceding earliest-vertex coloring on all edges with at least one removed endpoint.

Every neighborhood in \(R\) contains every finite bipartite graph by Erdős–Hajnal. This remains true after deleting finitely many previously used points, since a finite deletion cannot reduce an uncountable chromatic number to countable. In particular \(R\) is infinite. Embed the desired graph in \(R\) in its construction order. A fresh disjoint cone starts with any fresh apex, and an attached cone starts with the already assigned apex. Apply the neighborhood property, excluding the finitely many old vertices other than the apex, to find the new rim. Extra edges are irrelevant because embeddings need not be induced.

## Implications for the pair problem

If the forbidden graph \(F\) belongs to this iterated-cone class and target \(H\) contains a triangle, every \(F\)-free graph has a countable edge coloring avoiding \(H\). Therefore any applicable exact finite Ramsey criterion can now be used for this larger forbidden class. In particular:

- If \(H\) contains a triangle and \(\operatorname{tw}(H)\le2\), the pair is exceptional exactly when \(\operatorname{tw}(F)\ge3\).
- If \(H\) is balanced complete multipartite with at least three nonempty parts, the pair is exceptional exactly when \(F\) is not a subgraph of any forest of copies of \(H\). An isolated vertex can always be accommodated in an additional disjoint copy of \(H\), so it does not change the finite test.

The finite criteria are the same as in [APEX-BIPARTITE.md](APEX-BIPARTITE.md); the new point is the transfinite neighborhood-core criterion for countable escape. It does not put \(K_4\) in the class: a single cone over a bipartite graph contains no \(K_4\), and a \(K_4\) cannot cross the one-vertex separators. Thus it does not settle [Erdős #595](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/InfiniteTriangleFreeCovering.html).

# Gyárfás–Sumner for subgraphs of shift graphs

**Status: proof of the restricted host-class problem, not the full Gyárfás–Sumner conjecture.** We answer Problem 1.13 of Adenwalla, Braunfeld, Hons, Sylvester and Zamaraev, [*Set-defined graph classes: χ-boundedness meets tropical algebra*](https://arxiv.org/html/2607.23754v2#S1.SS2.SSS2). It is Problem 1.10 in v1 and Problem 1.13 in the November 20, 2026 revision. The proof allows arbitrary edge deletion, all target trees, and every shift dimension \(d\ge2\). We have not found an earlier proof of this specific statement; we do not claim priority.

## Theorem

Let \(T\) be a tree with \(t\ge2\) vertices and radius \(h\). For any integers \(d\ge2\) and \(n\), let \(G\) be any subgraph, not necessarily induced, of the canonical \(d\)-dimensional shift graph \(S(n,d)\). If
\[
\chi(G)>h(t-1),
\]
then \(G\) contains an induced \(T\). The bound is independent of \(n\) and \(d\). The one-vertex tree is immediate for nonempty \(G\).

## Proof

The vertices of \(S(n,d)\) are strictly increasing \(d\)-tuples from \([n]\), and its edges are obtained by forgetting the directions of the arcs
\[
(a_1,\ldots,a_d)\longrightarrow(a_2,\ldots,a_d,b),
\qquad b>a_d.
\]
Give the retained edges of \(G\) these directions. This orientation is acyclic because the last coordinate strictly increases along each arc.

Set \(m=t-1\), \(A_0=V(G)\), and for \(i\ge0\) put
\[
A_{i+1}=\{v\in V(G): |N^+_G(v)\cap A_i|\ge m\}.
\]
The sets are nested: \(A_1\subseteq A_0\), and \(A_i\subseteq A_{i-1}\) implies \(A_{i+1}\subseteq A_i\). If \(A_h=\varnothing\), the \(h\) layers \(A_i\setminus A_{i+1}\), \(0\le i<h\), partition \(V(G)\). Every vertex in a layer has at most \(m-1\) out-neighbors there, since it has fewer than \(m\) out-neighbors in \(A_i\). Reverse topological greedy coloring uses at most \(m\) colors per layer, so disjoint palettes give \(\chi(G)\le hm\). Thus under the theorem's hypothesis \(A_h\ne\varnothing\).

Root \(T\) at a center, and map its root to a vertex of \(A_h\). Embed the other vertices in any parent-before-child order, keeping an image at depth \(j\) in \(A_{h-j}\). In every step the new image is a retained out-neighbor of its parent's image and has a **fresh final coordinate**, not used in any coordinate of an earlier image.

Suppose \(\ell\) tree vertices have been embedded and the next vertex is a child of a vertex whose image is \(p=(a_1,\ldots,a_d)\) at depth \(j<h\). Since \(p\in A_{h-j}\), there are at least \(m\) retained out-neighbors of the form \(w=(a_2,\ldots,a_d,b)\) in \(A_{h-j-1}\). They have distinct final coordinates \(b>a_d\), because the prefix is fixed and \(G\) is a subgraph of a graph with one vertex per tuple. The earlier images use exactly \(d+\ell-1\) labels: the root used \(d\), and every additional image kept a suffix of its parent and used one fresh label. None of the \(d\) labels in \(p\) can be a candidate \(b\), so at most \(\ell-1\le t-2<m\) of the candidate out-neighbors can use an already used final label. Hence a choice with fresh \(b\) exists.

The chosen arc \(p\to w\) is in \(G\). For any earlier image \(u\), a shift arc \(u\to w\) would require the last coordinate of \(u\) to be \(a_d\). All earlier images have distinct last coordinates, so only the parent can do this. A shift arc \(w\to u\) would require that the fresh label \(b\) occur in \(u\), since \(d\ge2\). This is impossible. The embedding therefore adds exactly the one desired edge to earlier vertices at every step and yields an induced \(T\).

## Scope and attribution

- The cited paper defines a shift graph to be an *induced* subgraph of a canonical shift graph, and its Problem 1.13 then asks about arbitrary *subgraphs* of these shift graphs. Taking arbitrary subgraphs of the canonical graphs is equivalent. Its Lemma 6.5 establishes tree containment from high chromatic number for induced shift graphs; that proof does not allow arbitrary deletions of the shift adjacencies on a retained tuple set.
- The proof applies to avoiding any fixed forest as well: connect its components by edges, and subdivide each connecting edge by one new vertex to realize the forest as an induced subgraph of a tree; then use the theorem for that tree. Empty forests and singletons have the immediate interpretations.
- A shift-colorable graph in the paper's sense merely admits a homomorphism to a shift graph. This need not be injective. If arbitrarily many neighbors share their tuple label, the fresh-final-coordinate argument is invalid. We do not claim a result for all shift-colorable graphs, unions of two shift graphs (Problem 1.14 in v2), arbitrary set-defined classes, or arbitrary graphs of bounded clique number.
- Searches through the current source, the original version, and targeted literature queries for the exact problem formulation and paper identifier found the induced-host theorem and statements of the edge-deletion question, but no prior resolution of the edge-deletion question.

# Braun–Bruegge’s minimum facet conjecture

**Result.** Both global minimum clauses of Braun–Bruegge’s Conjecture 2 hold. Among connected simple graphs on \(n\) vertices, the unique minimizer is the balanced complete bipartite graph, with
\[
  \operatorname{Minf}(2k)=2^{k+1}-2,
  \qquad
  \operatorname{Minf}(2k+1)=3\cdot2^k-2.
\]
The proof is independent of enumeration. It does not establish either of the two maximum clauses in the same conjecture.

**Source and scope.** Benjamin Braun and Kaitlin Bruegge, [*Facets of Symmetric Edge Polytopes for Graphs with Few Edges*](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf), J. Integer Seq. 26 (2023), Article 23.7.2, Conjecture 2(3)–(4), pp. 2–3. The authors restated it in [Oberwolfach Report 58/2023, Problem 2(3)–(4)](https://publications.mfo.de/bitstream/handle/mfo/4147/OWR_2023_58.pdf?isAllowed=y&sequence=6). Mori, Mori and Ohsugi [proved the bounds](https://arxiv.org/html/2312.11287v3) for join graphs and, in Proposition 2.8, the lower bounds and uniqueness for bipartite graphs. Targeted searches for the global minimum question and for a matching-based proof did not identify an earlier general resolution. The only matching theorem needed is the elementary fact that an augmenting path increases a matching, proved in place. The two maximum clauses propose the values \(6^k\) for \(n=2k+1\), attained by a wedge of triangles, and \(14\cdot6^{k-2}\) for \(n=2k\), attained by wedging \(K_4\) with \(k-2\) triangles.

## 1. The polar and its matching faces

Let \(G=(V,E)\) be connected, with \(n=|V|\ge3\). The polar of the symmetric edge polytope of \(G\), in coordinates modulo constant shifts, is
\[
  P=\{ f\in \mathbb R^V/\mathbb R\mathbf 1:
    |f(u)-f(v)|\le 1\text{ for all }uv\in E\}.
\]
It is bounded because \(G\) is connected. Its vertices count the facets of the original polytope. As in the facet criterion of Higashitani, Jochemko and Michałek (Theorem 5 in Braun–Bruegge), a feasible \(f\) is a vertex exactly when the graph of its tight edges, where \(|f(u)-f(v)|=1\), is connected and spanning. Indeed, the directions preserving all tight equalities are the functions constant on each tight component. With more than one component a small nonconstant such displacement, in both signs, preserves all inequalities. With one component the tight equations determine a unique point modulo constants. In particular, a binary labeling is a vertex if its crossing graph is connected; for a nonconstant binary labeling the class modulo constants identifies the oriented binary labeling uniquely.

Fix a maximum matching \(M\) of size \(m\), with uncovered set \(U\) of size \(r=n-2m\). The set \(U\) is independent, or an edge in it could enlarge \(M\). For each of the \(2^m\) orientations of the matched edges, denote their low and high endpoints by \(l_i,h_i\). Impose \(f(h_i)-f(l_i)=1\) for every \(i\) to obtain a face \(Q\) of \(P\). It is nonempty: give all lows label 0, all highs label 1, and all unmatched vertices label \(1/2\). These faces are pairwise disjoint and their vertices are vertices of \(P\).

Write \(f(l_i)=t_i\) and \(f(h_i)=t_i+1\) on \(Q\). On the matched pairs let \(D\) have an arc \(i\to j\) whenever \(h_i l_j\in E\). The inequality \(t_i\le t_j\) holds throughout \(Q\) for that arc, and it is precisely the corresponding tight inequality at the displayed point \(t=0\). Every other nonmatching inequality at that point is slack. In particular, all inequalities incident to an unmatched vertex are slack there.

## 2. A maximum matching with two or more uncovered vertices

We show a stronger statement that is useful when \(r\ge2\): **each matching face \(Q\) has at least \(2^r\) vertices**.

For \(u\in U\), put
\[
  L_u=\{i:u l_i\in E\},\qquad H_u=\{i:u h_i\in E\}.
\]
For distinct \(u,v\in U\) there is no directed path in \(D\) from \(L_u\) to \(H_v\), allowing paths of length zero. If there were one, choose a path with distinct pair indices \(i_0,\ldots,i_s\). Then
\[
  u,l_{i_0},h_{i_0},l_{i_1},h_{i_1},\ldots,l_{i_s},h_{i_s},v
\]
would be a simple path in \(G\) alternating between edges outside and inside \(M\), beginning and ending outside \(M\) at uncovered endpoints. Exchanging its matched edges for its other edges increases the matching size by one, a contradiction.

Call \(u\) *anchored* if there is a directed path from \(L_u\) to \(H_u\), including the length-zero case. For each anchored vertex choose one such path and impose equality \(t_i=t_j\) along every arc of the chosen path. Each imposed equality is of the form \(f(h_i)-f(l_j)=1\), so their joint imposition defines a face \(Q'\subseteq Q\). The assignment \(t=0\) and unmatched labels \(1/2\) shows that \(Q'\) is nonempty.

Let \(R\) consist of the indices reachable in \(D\) from the union of \(L_u\) over unanchored \(u\). Give \(t_i\) the value 1 for \(i\in R\) and 0 otherwise. The definition of \(R\) makes \(t\) nondecreasing along each arc. No \(H_v\) meets \(R\): a source \(L_u\) with \(u\ne v\) is excluded by maximality of the matching, and \(u=v\) is excluded because the source is unanchored. Further, none of the vertices of a chosen anchored path lies in \(R\), since its endpoint belongs to some \(H_v\). Hence the assignment satisfies the extra equalities defining \(Q'\). It satisfies all matched-vertex edge constraints: endpoints from two lows or two highs have label difference at most 1, and for \(h_i l_j\in E\) the difference is \(1+t_i-t_j\in\{0,1\}\).

For each \(u\in U\), construct two mutually exclusive choices of a tight equation, both feasible with this same matched labeling:

* If \(u\) is unanchored, all its neighbors have label 1: its low neighbors have index in \(R\), its high neighbors outside it. It has a neighbor \(w\) since \(G\) is connected. Choose \(f(u)=0\) or \(2\), giving the opposite tight equations \(f(u)-f(w)=-1\) and \(f(u)-f(w)=1\).
* If \(u\) is anchored, its neighbors have labels in \(\{0,1\}\). Its chosen path runs from the index of a low neighbor \(l_i\) of label 0 to that of a high neighbor \(h_j\) of label 1. Choose \(f(u)=0\) using \(f(h_j)-f(u)=1\), or \(f(u)=1\) using \(f(u)-f(l_i)=1\). These two equations cannot both hold anywhere in \(Q'\), since \(t_i=t_j\) there and hence \(f(h_j)-f(l_i)=1\).

There are no edges within \(U\), so all \(2^r\) choices can be made independently. For each joint choice the selected tight equations define a nonempty face of \(Q'\); two different choices give disjoint faces by the mutual exclusion just proved. Each face supplies a distinct vertex of \(P\). Summing over the orientations gives
\[
  N(P_G)\ge 2^{m+r}=2^{(n+r)/2}.
\]
For even \(n\) and \(r\ge2\), this is at least \(2^{n/2+1}\); for odd \(n=2k+1\) and \(r\ge2\), one has \(r\ge3\), giving at least \(4\cdot2^k\). Both are strictly above the proposed minima.

## 3. A maximum matching with zero or one uncovered vertex

If \(D\) is strongly connected, the \(t_i\) are all equal on \(Q\). Otherwise, a topological ordering of the strongly connected components gives a nonconstant assignment nondecreasing along every arc. Scale it by a sufficiently small positive number to preserve the inequalities slack at \(t=0\). This is a feasible nonconstant direction in the pair shifts modulo constants. In addition, if there is one unmatched vertex, its label can vary independently in a small interval about \(1/2\), since its constraints are strict there. Thus a strongly connected orientation contributes at least one vertex when \(r=0\) and two when \(r=1\); any other orientation contributes at least two and three, respectively.

To recover the possible one-vertex shortfall for the strongly connected orientations, fix one of them. The matched-vertex crossing graph \(H\) of its binary labeling is connected and stays connected upon deleting any one vertex. Indeed, after deleting one endpoint of pair \(i\), contract the other matching edges. Every weak component of \(D-i\) has both an arc from \(i\) and an arc to \(i\), by strong connectivity. One of these arcs connects it to the surviving endpoint of pair \(i\), depending on whether the high or low endpoint was deleted. The conclusion also holds if there is only one matched pair.

If the matched-vertex induced graph has a same-color edge, choose such an edge and flip either endpoint of that edge. The crossing graph on the other matched vertices stays connected and the edge just chosen reattaches the flipped vertex. If there is an unmatched vertex, give it the opposite color of one of its neighbors in the resulting labeling. Fix any deterministic choice where there are several. This gives two distinct binary vertices of \(P\). In each, exactly one matched pair is unsplit, so the vertices lie outside every matching face counted so far.

If instead the matched-vertex orientation properly colors the induced graph, there are at most two such strong orientations, since that graph is connected whenever some strong orientation exists. Moreover, for nonbipartite \(G\) we can recover the shortfall even for these orientations. In that situation there must be one unmatched vertex \(u\), and it has neighbors in both colors, or the proper coloring would extend to \(G\). Choose a neighbor \(v\) in either color. Give \(u\) the old color of \(v\), and flip \(v\). The original crossing graph on the remaining matched vertices is connected, \(u\) attaches to an opposite-color neighbor among them, and \(v\) attaches via \(uv\). Again the two color choices give two distinct binary vertices, each with a sole unsplit matched pair.

In either construction an output can come from at most two pairs (original matching orientation, flipped vertex). The sole unsplit matching edge is specified by the output, and either of its two endpoints could be flipped back. A choice of endpoint determines the original matching orientation irrespective of the color of an unmatched vertex. Thus every strong orientation with a recovery construction contributes two incidences to a pool of outside vertices of multiplicity at most two.

Writing \(S\) for the number of strong orientations, the matching faces give at least \((2+r)2^m-S\) vertices. There are at least \(S-2\) outside vertices, and at least \(S\) if \(G\) is nonbipartite. This proves both proposed lower bounds, strictly for nonbipartite \(G\).

## 4. Sharpness and uniqueness

For connected bipartite \(G\) with parts of sizes \(a,b\), every vertex of \(P\) has all edges of \(G\) tight. In fact the tight spanning graph supplies a path of tight edges between the endpoints of an arbitrary edge. That path has odd length by bipartiteness, so the difference of the two labels is an odd integer, and feasibility forces its absolute value to be 1.

For \(K_{a,b}\) the labels in each part have constant parity and span at most 2. If one part takes two values with difference 2, the other part is forced to the common midpoint. The two possibilities of which part varies give \(2^a-2\) and \(2^b-2\) labelings modulo constants, respectively. If neither part varies, there are two choices for the difference between their constant values. The total is \(2^a+2^b-2\).

All these labelings remain vertices for every connected bipartite \(G\) with the same parts, as all its edges are tight for them. If \(G\ne K_{a,b}\), choose a missing cross-edge \(uv\). The graph-distance labeling \(f(x)=\operatorname{dist}_G(u,x)\) makes all edges of \(G\) tight, since distances change by at most one and have opposite parity across the two parts. But \(f(v)\ge3\), so this vertex is not among those counted for \(K_{a,b}\). This proves strictness for incomplete bipartite graphs. Finally \(2^a+2^b\) at fixed \(a+b=n\) is smallest exactly for \(|a-b|\le1\), as is seen by transferring one unit from the larger exponent to the smaller when they differ by at least two. Therefore the balanced complete bipartite graphs are the unique minimizers, up to isomorphism.

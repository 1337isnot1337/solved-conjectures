# Braun–Bruegge’s maximum facet bounds for chordal graphs

Among connected chordal graphs, the unrestricted conjectured maxima in [Braun–Bruegge, Conjecture 2(1)–(2)](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf) are attained and are sharp:
\[
  b(2k+1)=6^k,\qquad b(2k)=14\cdot6^{k-2}\quad(k\ge2).
\]
Take also \(b(1)=1\) and \(b(2)=2\). The even and odd extremizers specified by the conjecture are chordal, so this result proves both upper clauses within this class. The unrestricted problem remains open in this note. Searches for a previous general chordal upper bound identified the graph-family results of [Mori–Mori–Ohsugi](https://arxiv.org/html/2312.11287v3) for join graphs, but no exact chordal result.

For a connected graph \(G\), put
\[
 P(G)=\{f:\ |f(u)-f(v)|\le1\ \ (uv\in E(G))\}/\mathbb R\mathbf1.
\]
The vertices of this polar count the facets of the symmetric edge polytope of \(G\). In the criterion of Higashitani, Jochemko and Michałek (Theorem 5 in Braun–Bruegge), a feasible labeling is a vertex exactly when its tight-edge graph is connected. Indeed the tight equalities leave only displacements constant on each tight component; when there are at least two such components, a small displacement in either direction makes the point nonextreme. A vertex consequently has integer differences, by following a tight path.

We prove a strengthened statement. Fix any forest of \(r\) edges of \(G\), with one prescribed signed tight difference on each edge. The resulting face of \(P(G)\) has at most \(b(n-r)\) vertices, where \(n=|V(G)|\). In particular, the empty forest yields the asserted upper bound.

## Induction step

A chordal graph has a simplicial vertex: this is the classical simplicial-vertex theorem of [G. Dirac, *On rigid circuit graphs* (1961)](https://doi.org/10.1007/BF02992776). Remove such a vertex \(w\); its neighbors form a clique \(C\) in the remaining graph \(H\). If \(G\) is connected and \(n>1\), \(C\) is nonempty and \(H\) stays connected, since any segment of a path through \(w\) can be replaced by the clique edge between its adjacent vertices. Both induced subgraphs and simple edge contractions preserve chordality. To check the latter directly, suppose an induced cycle of length at least four in the contraction uses the merged vertex. The two neighbors of that vertex on the cycle either attach to the same original endpoint, giving a chordless lift, or to different endpoints, giving a chordless lift using the contracted edge. Other cycle vertices were adjacent to neither original endpoint. Either case contradicts chordality.

Let \(p\) be the number of fixed forest edges incident to \(w\). The old forest on \(H\) has \(r-p\) edges. Counting isolated vertices as forest components, let \(q\) be the number of old components that meet \(C\). The \(p\) selected neighbors of \(w\) must lie in distinct old components, else there would be a selected cycle. Write \(N=n-r\).

At a vertex of the given face, the restriction to \(C\) is constant or takes two consecutive integer values. In the latter case call these values low and high. Every crossing edge of the clique is tight, so its clique vertices all lie in one tight component in \(H\). Any other old tight component would be disjoint from \(C\) and could not be connected by \(w\). Thus the old labeling is a vertex of \(P(H)\). The clique's connected graph of tight crossing edges can supply \(q-1\) new independent forest constraints: contract each old component when choosing crossing edges, and take a tree connecting the resulting \(q\) nodes. Those signed equations, together with the old fixed signs, enforce the whole chosen clique pattern modulo a common shift. By induction, the number of old vertices for any fixed mixed pattern is thus at most \(b(N+p-q)\), since
\[
  (n-1)-(r-p+q-1)=N+p-q.
\]

If the clique labels are constant, contract \(C\) to one vertex. Every old tight component must meet \(C\) to be connected by \(w\), so the projected old labeling is a vertex of the contracted graph's polar. Its projected fixed edges can be simplified to a forest: choose a spanning forest in the projected multigraph of the fixed edges, discarding duplicates and cycles. Any discarded signed condition follows because its endpoints are connected by retained forest edges, and the existence of the original labeling ensures consistent signs. The contraction removes \(|C|-1\) vertices and merges \(q\) old forest components into one, so it removes exactly \(|C|-q\) from the fixed-forest rank. The effective order is again \(N+p-q\). This also bounds the number of old labelings in the constant case by \(b(N+p-q)\), by induction on the strictly smaller graph order.

## Count the clique patterns

If \(p=0\), the label at \(w\) has at most two choices for each old labeling. If \(C\) is constant, \(w\) must differ from that label by \(1\) in absolute value to have any tight edge. If \(C\) is mixed, feasibility forces \(w\) to have one of its two levels. Within each old forest component, all differences are fixed by the selected equations. If these differences prescribe the same level on all its clique vertices, give that component a free bit for low or high. If they require distinct levels within some component, the bit for that component is instead pinned, and a constant clique pattern is impossible. Therefore if all components are constant on \(C\) there are at most \(2^q-2\) mixed patterns and one constant pattern. Otherwise there are at most \(2^{q-1}\) mixed patterns and no constant pattern. In either case, there are at most \(2^q-1\) eligible patterns, giving the bound
\[
  2(2^q-1)b(N-q).
\]
This is at most \(b(N)\): from the displayed formulas \(b(j+1)\ge2b(j)\), \(b(j+2)\ge6b(j)\), \(b(j+3)\ge14b(j)\) for positive \(j\). These give \(q=1,2,3\), and \(2(2^{q+2}-1)\le6\cdot2(2^q-1)\) for \(q\ge2\) gives the rest.

If \(p\ge1\), each selected edge prescribes a difference of \(+1\) or \(-1\) from its clique neighbor to \(w\). All selected signs must coincide, since opposite signs would force two clique labels two units apart. For a mixed pattern the selected neighbors must all be low if this common sign is \(+1\), and all high if it is \(-1\), because the label of \(w\) is one of the two clique levels. This pins a bit in each of \(p\) distinct old components, so there are at most \(2^{q-p}\) mixed patterns. If the constant pattern is possible, represent it in this same bit count by setting every bit low for sign \(+1\) or every bit high for sign \(-1\), adding no entry beyond the \(2^{q-p}\) bound. Each pattern and old labeling gives at most one label at \(w\), so the count is at most \(2^{q-p}b(N+p-q)\le b(N)\).

This proves the forest-face bound by induction; the one-vertex base is immediate. Finally, a clique of size three or four has respectively six or fourteen facets, because its polar vertices are exactly the nonconstant binary labelings modulo constants. The polar of a one-vertex union is a product. A wedge of triangles, and a wedge of one \(K_4\) with triangles in the even case, therefore attains the bounds. These wedges are chordal because a simple cycle stays within one factor.

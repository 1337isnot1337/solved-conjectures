# Sharp maximum facet counts for polygonal edge-ear graphs

Let \(\mathcal C\) be the smallest graph class containing the single vertex and single edge and closed under the following operations:

1. Identify one vertex of each of two otherwise disjoint graphs.
2. At an existing edge \(uv\), add a new \(u\)-to-\(v\) path of length \(\ell\ge2\) whose internal vertices are new, retaining \(uv\).

For every \(n\ge2\), the largest number of facets of a symmetric edge polytope of an \(n\)-vertex graph in \(\mathcal C\) is
\[
 b(2k+1)=6^k,\qquad b(2k)=2\cdot6^{k-1}.
\]
The same maximum holds for connected outerplanar graphs. This gives the odd-order upper bound in [Braun–Bruegge, Conjecture 2(1)–(2)](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf) within these classes, and a strictly better even-order bound there (for \(n\ge4\)). It does not resolve either unrestricted upper clause. Searches scoped to outerplanar and polygonal 2-tree facets found the known bipartite outerplanar formulas, but not this nonbipartite extremal result. In particular, compare [D’Alì–Delucchi–Michałek, Proposition 56](https://emis.de/ft/30576) and [Mori–Mori–Ohsugi](https://arxiv.org/html/2312.11287v3) for related results.

## Preliminaries

For a connected graph \(G\), work in its polar
\[
 P(G)=\{f:|f(u)-f(v)|\le1\  (uv\in E(G))\}/\mathbb R\mathbf 1.
\]
A vertex has a connected spanning tight-edge graph. This follows by considering the allowable infinitesimal variation constant on each tight-edge component, and shows every vertex has integer labels modulo a common shift. Facets of the symmetric edge polytope count these vertices.

Take \(b(1)=1\). Directly from the even and odd formulas, for integers \(x,y\ge1\),
\[
 b(x)b(y)\le b(x+y-1),\qquad
 b(x+1)\ge2b(x),\qquad b(x+2)=6b(x).
\]
The first follows by the three parity cases: equality unless both are even, in which case the ratio of the left to the right is \(4/6\).

The class \(\mathcal C\) is closed under single-edge contractions, followed by simplification of parallel edges. To see this, induct on a construction. In a one-vertex union, contract in the factor containing the edge. In a path addition over \(uv\), an old edge different from \(uv\) leaves the operation valid over the image of \(uv\). Contracting \(uv\) itself attaches a cycle of length \(\ell\) at the merged vertex, or a single pendant edge if \(\ell=2\). Any cycle of length at least three belongs to \(\mathcal C\) by a path addition over a single edge. Contracting an edge on the new path shortens it by one, with no path addition needed if the shortened path is a duplicate of \(uv\).

Connected outerplanar graphs belong to \(\mathcal C\). For a 2-connected outerplane graph, the outer boundary is a simple cycle through all vertices. Its nonboundary edges, which are noncrossing chords of that cycle, dissect it into face polygons. The graph of bounded faces joined across chords is a tree: starting with no chords, each new chord splits a face into two, increasing the face count and dual edge count by one and preserving connectedness. Root that tree and add faces outward. Each new polygon shares its parent chord and introduces exactly its other boundary path: alternatively, recursively strip a leaf polygon, whose boundary path off the parent chord has no internal vertex incident to any other remaining edge. General connected outerplanar graphs are one-vertex unions of their 2-connected blocks and bridges.

## An upper bound for every signed forest face

We prove the stronger claim that, if \(F\) is a forest in \(G\in\mathcal C\) with \(r\) edges and one fixes a signed tight difference \(f(v)-f(u)=\pm1\) on every edge of \(F\), the resulting face has at most \(b(n-r)\) vertices. Empty faces have zero vertices. Use induction on \(n\), taking a nontrivial final operation in a construction; it is immediate for the single edge or vertex. For a one-vertex union of two nontrivial factors, the polar is the product after fixing the common root label to zero. The prescribed forest splits between the factors, and the claim follows from the product inequality for \(b\).

Suppose \(G\) is made from \(H\) by adding a path of length \(\ell\) across edge \(uv\). Orient that path from \(u\) to \(v\); among its increments, \(p\) have prescribed signs with sum \(s\), and \(q=\ell-p\) are free. Write \(N=n-r\); the effective order of \(H\) with its old forest is \(N-q+1\). At a vertex of the prescribed face of \(G\) (also a vertex of the full polar), set \(d=f(v)-f(u)\in\{-1,0,1\}\). There can be at most one zero increment along the new path, since two zero edges would disconnect a nonempty set of its internal vertices from the tight graph. Thus, for given labels on \(H\), there are at most
\[
 C_q(d-s)=A_q(d-s)+q A_{q-1}(d-s),\qquad
 A_j(t)=\binom{j}{(j+t)/2}
\]
extensions, with \(A_j(t)=0\) unless \((j+t)/2\) is an integer in \([0,j]\). The second term vanishes when \(q=0\), so \(C_0(t)=\mathbf 1_{t=0}\).

If \(d=\pm1\), the tight graph of the restriction to \(H\) must be connected, since \(uv\) is already tight and the added path cannot attach any old component containing neither endpoint. Accordingly, the old labeling is an actual vertex of the prescribed old face, also satisfying the sign on \(uv\). If \(d=0\), the old tight graph is either connected or has exactly two components containing \(u\) and \(v\) separately. In either case it gives a vertex after contracting \(uv\), since that contraction joins the two components in the latter case. If in addition the new path has a zero increment, the old tight graph must already be connected: the path now provides no tight connection between its endpoints. These conclusions are necessary conditions only, which suffice for an upper bound.

First assume the old forest does not already connect \(u\) to \(v\). For \(d=\pm1\), adding the constraint on \(uv\) preserves the forest property and raises its rank by one. When \(d=0\), contraction preserves the rank of the old forest while removing one vertex. In either case the number of eligible old labelings is at most \(b(N-q)\) by induction and the contraction closure. Thus an upper bound is
\[
  b(N-q) \sum_{d=-1}^{1} C_q(d-s).
\]
The cases \(q=0\) and \(q=1,s\ne0\) have sum at most 1 and 2, respectively, so satisfy the claim. When \(q=1,s=0\), treat all three values together: if \(d=0\) the free increment is zero and the old labeled graph must itself be a vertex, and this is already necessary for \(d=\pm1\) too. Each old vertex yields at most one extension because the final free increment is uniquely determined by \(d\). Hence the bound is \(b(N)\) in this case.

If the old forest already connects \(u\) to \(v\), \(d\) is prescribed by the signs along its unique forest path. There is no feasible vertex if \(|d|>1\). For \(d=\pm1\) no new condition is needed on \(H\). For \(d=0\), contract \(uv\); delete one edge from the old forest path before projecting the forest. This breaks the sole cycle created by identifying the two endpoints, and the deleted signed constraint follows from the remaining ones because the total prescribed difference along the path is zero. The resulting forest has lost one edge and the old graph one vertex. Thus, in both cases, the number of admissible old labelings is bounded by \(b(N-q+1)\), to be multiplied by the single coefficient \(C_q(d-s)\). Here \(q\ge1\), otherwise the selected edges would contain a cycle formed by the old forest path and the new path.

For completeness the scalar estimates needed to finish both cases are
\[
 \begin{aligned}
  \max_j C_q(j)&\le b(q) &&(q\ge1),\\
  \max_s\sum_{d=-1}^1 C_q(d-s)&\le
  \begin{cases}
     6^{q/2},&q\ge2\text{ even},\\
     2\cdot 6^{(q-1)/2},&q\ge3\text{ odd}.
  \end{cases}
 \end{aligned}
\]
Indeed the two summands of \(C_q(j)\) have opposite parities of support. The peak of the second dominates that of the first, with value \(M_q=q\binom{q-1}{\lfloor(q-1)/2\rfloor}\). For even \(q\ge2\), \(M_{q+2}/M_q=4(q+1)/q\le6\), starting from \(M_2=2\); for odd \(q\ge1\), the ratio is \(4(q+2)/(q+1)\le6\), starting from \(M_1=1\). This proves the first bound and gives the even three-term bound by \(3M_q\). For odd \(q=3,5\), direct binomial substitution gives three-term maxima 12 and 60. For odd \(q\ge7\), use \(3M_7=420<2\cdot6^3\) and the two-step recurrence. Multiplying these bounds by the corresponding \(b\) factors above proves the invariant: step two costs exactly a factor 6 and step one costs at least 2, while \(b(q)b(N-q+1)\le b(N)\) follows from the product inequality.

Taking an empty forest gives the stated upper bound. It is attained by wedging triangles at one vertex when \(n\) is odd, and wedging triangles and one edge when \(n\) is even: the polar product formula gives six vertices per triangle and two per bridge. These sharpness examples are outerplanar.

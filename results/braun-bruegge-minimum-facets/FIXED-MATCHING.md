# Sharp facet minimum at fixed matching number

Let $`G`$ be a connected simple graph on $`n\ge3`$ vertices and let $`\nu(G)=m`$ be its maximum matching size. The symmetric edge polytope of $`G`$ has at least
```math
  2^{n-m}+2^m-2
```
facets, with equality if and only if $`G\cong K_{m,n-m}`$. In particular this sharpens the [global minimum theorem](PROOF.md) on every prescribed matching-deficiency stratum. It is a supplement, not an additional named conjecture resolution. For $`n=2`$ the assertion is immediate from the single connected graph $`K_{1,1}`$.

## 1. Sharpen every nonstrong matching face

Use the notation $`r=n-2m,M,U,Q,D,t`$ of Sections 1–3 of the [global minimum proof](PROOF.md). The common-fiber construction in its Section 2 works without change for $`r=0,1`$ too: when $`r=0`$ the one face is $`Q`$ itself, and when $`r=1`$ the argument excluding a path between distinct uncovered vertices is vacuous. In all cases it produces $`2^r`$ pairwise disjoint nonempty faces, each containing a representative over the same vector $`t^*`$ of matched-pair shifts modulo constants. A nonempty face of a bounded polytope contains a vertex, and if it contains just one vertex it is a singleton.

If $`D`$ is not strongly connected, the projection of $`Q`$ onto the $`t`$-coordinates is not a point. Indeed, at the feasible midpoint with all $`t_i=0`$ and uncovered labels $`1/2`$, take a nonconstant assignment nondecreasing on the arcs, obtained by topologically ordering the strong components. Scale it small enough to preserve the originally slack inequalities. If $`Q`$ had only $`2^r`$ vertices, each selected face would be a singleton, and every vertex would project to $`t^*`$. By convexity the entire projection would then be a point, a contradiction. Thus a nonstrong orientation contributes at least $`2^r+1`$ vertices; a strong orientation contributes at least $`2^r`$.

## 2. Recover incidences outside the faces

In a strong orientation the crossing graph of the matched vertices is connected after deletion of any one matched vertex, as in Section 3 of the global proof. If an edge between matched vertices has both endpoints of the same color, flip either endpoint separately. Each time the chosen edge reattaches the flipped vertex. Color every uncovered vertex opposite to any one of its neighbors. The uncovered vertices are independent, so this yields a connected spanning crossing graph. The two output labelings are distinct and exactly one matched pair is unsplit in each.

When there is no such edge the strong orientation properly colors the matched induced graph, which is connected, hence at most two strong orientations can fail the preceding construction. If $`G`$ is nonbipartite, a proper coloring of the matched vertices must give some uncovered vertex $`u`$ neighbors in both colors. Otherwise each uncovered vertex can be colored opposite to its neighbors and the coloring extends to $`G`$. For each of the two old colors in turn, choose such a neighbor $`v`$ of $`u`$, give $`u`$ the old color of $`v`$, and flip $`v`$. The crossing graph on the other matched vertices is connected, $`u`$ attaches to a neighbor of the other old color, and $`v`$ attaches to $`u`$. Color every other uncovered vertex opposite to any of its neighbors. These are two distinct outside vertices with a unique unsplit matched pair.

For every output in either construction, the unique unsplit edge determines the possible flipped endpoint up to its two choices, and flipping back the chosen endpoint determines the original orientation. Therefore each output has at most two preimages among incidences indexed by the original matching orientation and flipped endpoint. If $`S`$ is the number of strong orientations, we obtain at least $`\max(0,S-2)`$ outside vertices, or at least $`S`$ when $`G`$ is nonbipartite. The total lower bound is
```math
 (2^r+1)2^m-S+(S-2)=2^{n-m}+2^m-2,
```
with a strict bound if $`G`$ is nonbipartite.

## 3. Equality for bipartite graphs

With any fixed connected bipartite graph, all its edges are tight at every polar vertex: a tight spanning path between the endpoints gives an odd integer difference, necessarily of magnitude one. Thus adding edges within the same bipartition cannot increase the count. More precisely, every vertex of the enlarged graph remains a vertex of the original because the original spanning graph is still tight. Inclusion is strict if an edge $`uv`$ is added: distance from $`u`$ in the original graph is tight on every original edge and takes value at least three at $`v`$, so that vertex is lost. This also gives strictness when adding a nonempty pack of edges.

If a bipartition side has size $`m`$, add all missing edges to obtain $`K_{m,n-m}`$. Its count is exactly the bound, by the complete-bipartite formula in the global minimum proof. Any missing edge before completion gives strictness.

It remains to exclude equality when both sides have size greater than $`m`$. By König’s matching theorem there is a minimum vertex cover of size $`m`$. Write its two sides as $`A,B`$ of sizes $`a,b`$, and the uncovered sides as $`C,D`$ of sizes $`x,y`$. Thus $`a+b=m, x+y=n-m, x>b, y>a`$. Both $`a,b`$ are positive: if one vanished, the opposite uncovered side would contain isolated vertices because the cover would be a proper subset of a single side. Complete the graph to the bipartite graph $`H`$ with all edges between $`A,B`$, between $`A,D`$, and between $`C,B`$, and no others. This completion is connected and does not change $`m`$, since the cover and original maximum matching both survive.

For $`H`$, all edges are tight at every polar vertex. In any of the four sets labels have constant parity and span at most two, since that set has a common neighbor. If both $`A,B`$ are constant, their relative labels differ by $`\pm1`$, and each vertex of $`C,D`$ may independently use either of two labels; this gives $`2^{x+y+1}`$ possibilities modulo translation. If $`A`$ varies, $`B,D`$ are forced to the common midpoint and each vertex of $`C`$ still has two choices. The $`2^a-2`$ assignments that make $`A`$ vary are the nonconstant two-level choices, normalized by giving its minimum value zero. Similarly if $`B`$ varies, there are $`(2^b-2)2^y`$ choices. $`A,B`$ cannot both vary because they are completely adjacent. Hence
```math
 F(H)=2^{x+y+1}+(2^a-2)2^x+(2^b-2)2^y
      >2^{x+y}+2^{a+b}-2,
```
where $`x+y>a+b`$. The original graph has at least as many facets as $`H`$. This excludes equality and completes the matching-number refinement.

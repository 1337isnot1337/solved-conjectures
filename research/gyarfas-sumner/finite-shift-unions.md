# Gyárfás–Sumner for finite unions of shift subgraphs

**Status: proof of published Problems 1.13 and 1.14 for their stated host classes, not the full Gyárfás–Sumner conjecture.** [Adenwalla, Braunfeld, Hons, Sylvester and Zamaraev](https://arxiv.org/html/2607.23754v2), *Set-defined graph classes: χ-boundedness meets tropical algebra*, ask in the November 20, 2026 revision whether an arbitrary subgraph of a shift graph (Problem 1.13), or a union of two shift graphs (Problem 1.14), must contain a prescribed induced tree when the chromatic number is sufficiently high as specified there. In v1 these are Problems 1.10 and 1.11. We prove the stronger finite-union theorem below. Targeted searches found the questions and the paper's earlier result for one *induced* shift subgraph (Lemma 6.5), but no prior resolution of the two questions. We make no priority claim.

## Theorem

Fix a finite tree \(T\), a positive integer \(k\), and dimensions \(d_0,\dots,d_{k-1}\ge2\). For each \(i\), let \(G_i\) be an arbitrary subgraph, not necessarily induced, of a canonical \(d_i\)-dimensional shift graph. If \(\chi(G_0\cup\cdots\cup G_{k-1})\) is sufficiently large as a function of \(T,k,d_0,\dots,d_{k-1}\), then the union contains \(T\) as an induced subgraph. In fact, it suffices that one constituent has sufficiently large chromatic number.

The canonical \(d\)-dimensional shift graph has strictly increasing \(d\)-tuples of numerical labels as vertices and adjacency whenever one tuple is obtained from the other by shifting left one position and appending a new label. Each constituent's tuple representation is injective. Constituent representations are independent of one another. This statement does not cover arbitrary noninjective homomorphisms to shift graphs.

## 1. Reduction and parameters

We prove the stronger last sentence for \(G_0\), called the red constituent, with \(b=k-1\) extra constituents called colors \(1,\dots,b\). Restrict to the red vertex set. If an extra constituent was absent on some of these vertices, treat those vertices as isolated in that color and assign each a tuple of fresh labels disjoint from all others. The one-vertex tree is immediate. Henceforth \(t=|V(T)|\ge2\) and \(h\) is its height when rooted at a center.

Orient every constituent by the natural shift orientation, which is acyclic. The red edge subsets used later keep that orientation. Define the integer parameters
\[
q=b\,t(t-1)+2,\qquad H=(b+2)^h,\qquad Q=q(2^H)^{H+1},
\qquad N=1+Q+\cdots+Q^H,\qquad
M=1+2N\sum_{i=0}^b d_i.
\]
The proof will repeatedly work with a restricted red subgraph \(K\) of \(G_0\); the extra constituents and the desired conclusion refer to the original union on the relevant vertex set.

A coordinate position in an extra color is **pinned** if, for every red source vertex \(v\), all vertices in its out-neighborhood in \(K\) have the same label at that coordinate. The common value may depend on \(v\), and pinning places no restriction on out-neighborhoods that are empty. Edge and vertex restrictions preserve existing pins. If all positions of any extra color are pinned, each red vertex has at most one red out-neighbor, because tuples in that extra color are injective. In this case \(\chi(K)\le2\) by reverse topological coloring.

## 2. Build a host tree or pin another coordinate

At a stage with a fixed collection of pins, define \(A_0=V(K)\). For a candidate vertex \(w\), let \(L(w)\) be the set of labels in its unpinned extra-color coordinates, tagged with their colors. Define \(A_{r+1}\) as the set of vertices \(v\) for which \(N^+_K(v)\cap A_r\) contains \(M\) distinct candidates with pairwise disjoint sets \(L(w)\). If \(b=0\), this means simply \(M\) distinct candidates. By monotonicity the \(A_r\) form a nested sequence.

### If \(A_H\ne\varnothing\)

Grow a complete \(Q\)-ary rooted host tree of height \(H\) in \(K\), in a parent-before-child order, with the root in \(A_H\) and all depth-\(r\) images in \(A_{H-r}\). At each step choose a child among \(M\) matching alternatives in the proper layer. Require its red *terminal* label to be new among all earlier red labels and require every unpinned extra-color label on the child to be new among all earlier labels of its respective color, including earlier labels in pinned positions.

Among red out-neighbors the red terminal labels are distinct, since their tuples have the same prefix. In any extra color, each earlier label excludes at most one of the matching alternatives. Fewer than \(N\sum_i d_i<M\) previous labels have been used across all colors, so an eligible child exists. The images are distinct because their red terminal labels are fresh.

The host tree is induced even in the **entire canonical red graph**, not just in \(K\). For a new child \(w\), the last label of any potential earlier predecessor must equal its red parent's last label, so only that parent can precede it, by global uniqueness of red terminal labels on the host. Nor can \(w\) be a red predecessor of any earlier image, because its new terminal label does not occur in any earlier tuple. This is why red edge restrictions do not compromise the final induced embedding.

For every extra color choose an orientation and a witnessing unpinned coordinate in its suffix, which consists of positions \(2,\dots,d_i\). Such a coordinate exists unless the only unpinned position is the first. In that case reverse every tuple's coordinate order and simultaneously reverse the total order on numerical labels. This represents the same underlying canonical shift graph and reverses its natural orientation, moving the unpinned position to the last. Freshness is unchanged by this relabeling. We are in the case with no fully pinned extra color, so these choices are possible.

In each resulting extra-color orientation, a vertex of the host has at most one incoming edge of that color within the host. Two predecessors would have the same suffix, hence the same witnessing coordinate, whose values on the host are distinct. Also no extra-color edge points from a later-added host vertex to an earlier one: the later vertex's suffix contains the fresh witnessing value, absent from the earlier vertex's prefix. This argument only needs that a retained extra edge obey the shift relation; extra edge deletion causes no problem. In particular, among comparable host-tree vertices all extra edges point from an ancestor to a descendant. Section 3 completes the embedding.

### If \(A_H=\varnothing\)

The layers \(A_r\setminus A_{r+1}\), \(0\le r<H\), partition \(V(K)\). Consider a single layer and the red subgraph it induces. If \(b=0\), every vertex has fewer than \(M\) out-neighbors in its layer, so \(\chi(K)\le HM\).

Otherwise, for each source \(v\) in the layer take any maximal matching among its out-neighbors in that layer. Its size is at most \(M-1\). Its union of tagged labels meets \(L(w)\) for every candidate \(w\) in that out-neighborhood: if not, another candidate could be appended. This uses that the extra colors have at least one unpinned position at this stage, so \(L(w)\) is nonempty. Sort the covering labels separately by color for each source. There are at most \(d_i(M-1)\) in a color \(i\).

Partition the red **edges** of the layer as follows. For each arc \(v\to w\), choose one covering tagged label in \(L(w)\) from \(v\)'s cover. Record its color, its index on \(v\)'s list for that color, and the unpinned coordinate of \(w\) at which that label occurs. Partition by these records, using the same index ranges for each \(v\). The number of classes is at most
\[
P=(M-1)\sum_{i=1}^b d_i^2 .
\]
Each class is a red edge subgraph in which one further coordinate is pinned: at a fixed source all edges of that class go to the same label value at the selected coordinate of the selected color. All old pins persist.

If every such red edge subgraph has chromatic number at most \(C\), the red layer has chromatic number at most \(C^P\), by assigning each vertex the tuple of its colors from the edge classes. The palettes can be taken disjoint across layers, so \(\chi(K)\le H C^P\).

## 3. Extract the induced tree from the host tree

For each host vertex record the set of positive distances to strict host-tree ancestors having an extra-color edge to it. There are at most \(2^H\) possible marks and at most \(b\) distances in any mark, by the indegree bound. Prune the full \(Q\)-ary host to a full \(q\)-ary host of the same height and root, without skipping levels, so that each level has a common mark. To see this, induct bottom-up. After pruning below each of a vertex's \(Q\) children, each child has a profile of at most \(H+1\) common marks on its retained levels. There are at most \((2^H)^{H+1}\) such profiles at a given depth. Keep \(q\) children of one common profile, with their pruned subtrees. Every retained vertex retains all its ancestors, so marks on it are unchanged.

Create the depth digraph on \(0,\ldots,H\). Give it all consecutive arcs \(i\to i+1\) and an arc \(i-a\to i\) for each distance \(a\) in the common mark at level \(i\). All arcs increase the level and the indegree is at most \(b+1\). Every level reaches \(H\). At most
\[
1+(b+1)+\cdots+(b+1)^{h-1}\le H
\]
levels have directed distance less than \(h\) to \(H\), so some shortest path ending there has length at least \(h\). Because every edge is forward, a shortest directed path is induced also in the undirected depth graph. Take \(h+1\) consecutive levels on that path, \(\ell_0<\cdots<\ell_h\).

Map the target root to any host vertex at depth \(\ell_0\). For an image at depth \(\ell_j\), place its children at depth \(\ell_{j+1}\) below it, using different immediate host branches for different children. Then the host ancestor order on the chosen vertices is exactly the target ancestor order. Comparable chosen vertices are adjacent in the graph union exactly when their corresponding levels are adjacent in the depth graph, by the definition of the marks and the induced red host property. Thus the comparable edges are precisely the desired parent-child edges. Incomparable pairs cannot be red-adjacent.

Choose the distinct branches by a uniform random injection independently at each target vertex. Conditional on the branches, choose each child's image uniformly among vertices of the required depth in its branch. For any ordered incomparable target pair \(u,v\), condition on the choices along the target root-to-\(v\) path. The image of their lowest common ancestor \(z\), the image of \(v\), and the immediate branch below the image of \(z\) taken toward \(v\) are now known. There are at most \(b\) candidate extra-color predecessors of \(v\)'s image. Each lies in at most one other immediate branch below the image of \(z\); if it is not in any such branch it cannot be the image of \(u\). The branch toward \(u\) remains uniform among the other \(q-1\) branches, since the branch choices are a uniform injection and the choices further along the path to \(v\) use only \(v\)'s assigned branch. Hence the conditional probability of an unwanted arc from the image of \(u\) to that of \(v\) is at most \(b/(q-1)\). A union bound over the at most \(t(t-1)\) ordered pairs is less than one. Some embedding is therefore induced in the union.

## 4. Finish the chromatic bound

If the original union is induced-\(T\)-free, the successful-host case of Section 2 cannot occur for any red edge restriction. For \(b>0\), induct on the number of unpinned positions across the extra colors. A stage with a fully pinned color has bound \(2\). Every other stage invokes the empty-core edge partition, increases the number of pinned positions in each child, and turns a bound \(C\) for its child stages into \(H C^P\) for its own stage. Since the number of coordinate positions is finite, this gives an explicit finite bound on the chromatic number of the red constituent. The \(b=0\) bound was handled separately. The same argument applies using any constituent as red. Finally, \(\chi(\bigcup_i G_i)\le\prod_i\chi(G_i)\) by the tuple-of-colors construction, so a sufficiently high chromatic number of the union forces one of the constituent bounds to fail. This completes the proof.

## Scope

This theorem answers the two source questions and strengthens them to any fixed number of shift subgraphs, with fixed but possibly different shift dimensions, permitting arbitrary edge deletion in every constituent. It applies to any fixed induced forest by first connecting the components into a tree using paths of length two with fresh internal vertices. It does not prove the conjecture for all set-defined classes: the source's decomposition gives unions of **shift-colorable** graphs, whose label maps need not be injective. The fresh-label and fully pinned arguments both use injectivity. No full Gyárfás–Sumner resolution is claimed.

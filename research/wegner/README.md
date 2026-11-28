# Wegner’s conjecture

**Status** · Open. This note proves the conjectured large-degree bound for planar graphs whose induced subgraph on vertices of degree other than two has sufficiently small maximum degree. [Issue #527](https://github.com/1337isnot1337/solved-conjectures/issues/527)

## Target and sources

For a finite simple planar graph $G$ of maximum degree $\Delta$, the standard square-coloring conjecture bounds $\chi(G^2)$ by 7 for $\Delta\le3$, by $\Delta+5$ for $4\le\Delta\le7$, and by $\lfloor3\Delta/2\rfloor+1$ for $\Delta\ge8$. The square joins vertices at distance at most two. Wegner’s 1977 manuscript gives the extremal diameter predictions in §3 and poses a broader equality of the extremal diameter, clique and coloring parameters in §4. The present target is the square-coloring bound as stated by Bousquet et al. [Wegner, §§3–4](https://doi.org/10.17877/DE290R-16496), [Bousquet et al.](https://doi.org/10.1016/j.disc.2022.113288)

Thomassen proved the subcubic case. Havet, van den Heuvel, McDiarmid and Reed proved the asymptotic $3\Delta/2+o(\Delta)$ bound for list coloring, and Deniz’s general bound is $2\Delta+7$. The primary-source search on 2026-11-24 found no full resolution of Wegner’s square-coloring conjecture. [Thomassen](https://doi.org/10.1016/j.jctb.2017.08.010), [Havet et al.](https://arxiv.org/abs/0807.3233), [Deniz, Theorem 1.2](https://doi.org/10.1016/j.dam.2026.10.042)

Squares of 1-subdivisions are total graphs of their underlying multigraphs. The case in which every edge is subdivided is covered by earlier total-coloring results and their extensions to subdivisions. The argument below allows many edges to remain unsubdivided. Searches for square coloring of mixed subdivisions and dense-triangle extensions found no earlier proof of the precise theorem below. Priority is provisional. [Borodin, Kostochka and Woodall, Theorem 1](https://kostochk.web.illinois.edu/docs/old/jctb97bw.pdf), [Borodin, survey on plane graph colorings](https://www.sciencedirect.com/science/article/pii/S0012365X12005031)

## Statement

**Theorem.** Let $G$ be a finite simple planar graph of maximum degree $\Delta$. Put $`U=\{v\in V(G):d_G(v)\ne2\}`$ and $s=\Delta(G[U])$, using $s=0$ for an edgeless induced graph. If $\Delta\ge32s+176$, then

```math
\chi(G^2)\le \left\lfloor\frac{3\Delta}{2}\right\rfloor+1.
```

The proof also applies to a plane multigraph whose edges are replaced by paths of arbitrary positive length to give a simple graph, when the unsubdivided edges form a graph of maximum degree at most $s$ and the same inequality on $\Delta$ holds. For that formulation the original vertices can be taken as $U$ in the proof even if some have degree two.

## Proof

### Remove long chains

Set $K=\lfloor3\Delta/2\rfloor+1$. In the canonical choice of $U$, every component of $G-U$ is a path or a cycle. Remove the components of $G-U$ with at least two vertices from the square for now. Each removed vertex has at most one neighbor in $U$, so it has at most $\Delta+2$ neighbors in the full square. Its two neighbors in $G$ have degrees summing to at most $\Delta+2$, which bounds its square degree. Such a vertex cannot be the middle vertex of a two-edge path between two retained vertices. In the path-expansion formulation, the same argument removes the interiors of the paths of length at least three. The retained square is therefore exactly the square of the retained graph. Every removed vertex can be colored greedily at the end because $K>\Delta+2$.

Write $S=G[U]$ for the unsubdivided edges. Every retained vertex outside $U$ has degree two and two distinct neighbors in $U$. Suppressing each such vertex gives an edge in a loopless planar multigraph $M$ on $U$. Distinct suppressed vertices give distinct edges, possibly parallel. Denote by $H$ the union of $S$ and $M$ on $U$ keeping their edge identities. It is a planar multigraph of maximum degree at most $\Delta$. Conflicts in the retained square have the following form.

- Two vertices of $U$ conflict if they are adjacent in $H$ or have a common neighbor in $S$.
- Two suppressed vertices conflict if their edges of $M$ share an endpoint.
- A suppressed vertex for edge $uv$ conflicts with the original vertices in the two closed neighborhoods $N_S[u]$ and $N_S[v]$.

These rules enumerate the paths of length one and two in the retained graph.

### Isolate the dense triangles

Let $B=4(2s+11)$ and use $B$ colors for the original vertices. We have $\Delta\ge4B$. A triple $T\subseteq U$ is dense when the number $e_T$ of edges of $M$ with both ends in $T$, with multiplicity, exceeds $K-B$. Since $K-B\ge5\Delta/4$, all three endpoint pairs in a dense triple are present.

The dense triples are vertex-disjoint. If two share exactly two vertices $u,v$, the sum of their two internal edge counts is at most $d_M(u)+d_M(v)\le2\Delta$. Edges on $uv$ are counted twice in both sums. If two share exactly one vertex $u$, each contributes at least $2e_T-2\Delta$ incidences at $u$. This follows by summing the two internal degrees at the other vertices of the triple. Both contributions are strictly greater than $\Delta/2$, and their incidences are disjoint. Either type of intersection violates the degree bound.

Remove all internal $M$-edges of the dense triples to obtain $M'$. For any odd set $W$ of at least five vertices, the odd-set density $2|E_{M'}(W)|/(|W|-1)$ is at most $\Delta |W|/(|W|-1)\le5\Delta/4$. For a triple the density is its internal edge count, at most $K-B$ after the removals. Also $\Delta(M')+1\le K-B$. The Goldberg–Seymour theorem now gives a proper edge coloring of $M'$ with at most $K-B$ colors. These colors are disjoint from the $B$ colors used for original vertices. [Chen, Jing and Zang, Theorem 1.1](https://doi.org/10.1007/s10878-025-01348-6)

### Color the original vertices

Contract each dense triple to one vertex of the planar multigraph $H$, discard loops, and take the underlying simple graph. The four-color theorem gives a coloring of the contracted graph. Lift this color to the vertices of $U$ as a first coordinate.

For a second coordinate take a square coloring of the simple planar graph $S'$ obtained by adding to $S$ the three edges of each dense triple wherever absent. Every added edge belongs to the underlying graph of $H$, so $S'$ is planar. The dense triples are vertex-disjoint, hence $\Delta(S')\le s+2$. By Deniz’s bound, at most $2(s+2)+7=2s+11$ values are needed for the second coordinate. Thus the pair of coordinates uses at most $B$ colors. [Deniz, Theorem 1.2](https://doi.org/10.1016/j.dam.2026.10.042)

The first coordinate distinguishes adjacent $H$-vertices in different contracted parts. The second distinguishes members of a dense triple and pairs at distance at most two in $S$. This is a proper coloring of the original-vertex conflicts. Moreover, a vertex adjacent in $H$ to a member of a dense triple and outside that triple has a first coordinate different from the common first coordinate of the triple. This property will control the colors excluded inside the triangle.

### Restore each dense triangle by Hall’s theorem

Fix a dense triple $`T=\{u,v,w\}`$. For each $i\in T$ let $F_i$ be the set of colors of the original vertices in $N_S[i]$ together with the colors of the already colored $M'$-edges incident with $i$. Let $r_i$ be the number of such edges and put $b_T=\sum_{i\in T}(d_S(i)+r_i)$. All $M'$-edges at $i$ are exterior to $T$. We have

```math
\sum_{i\in T}|F_i|\le3+b_T,\qquad 2e_T+b_T\le3\Delta.
```

Each internal edge of $M$ on pair $ij$ has the list consisting of the full palette of $K$ colors minus $F_i\cup F_j$. Every pair of internal edges in this triangle shares an endpoint, even if they are parallel. We need distinct representatives from these lists.

A single list has size at least $K-2-b_T$. In fact $b_T\le3\Delta-2e_T\le2B-3$, using $e_T\ge K-B+1$. Therefore $K-2-b_T\ge\Delta$ from $\Delta\ge4B$. Every set of edges on one or two endpoint pairs has size at most $\Delta$, since two different pairs in a triple share a vertex. These sets satisfy Hall’s condition.

For a set involving all three endpoint pairs, the union of its lists excludes precisely the colors that occur in at least two of $F_u,F_v,F_w$. There is a color occurring either once or three times in these sets. If $S[T]$ has an isolated vertex, that vertex’s original color occurs only in its own set. It differs from the other two original colors, cannot occur on an original neighbor outside the triple by the first coordinate, and cannot occur on an exterior edge because of the disjoint palettes. If $S[T]$ has no isolated vertex, then some vertex of it is adjacent to both others, so its original color occurs in all three sets. Thus the number of colors occurring at least twice is at most $\lfloor(2+b_T)/2\rfloor$. The degree bound gives

```math
K-e_T\ge \left\lfloor\frac{b_T}{2}\right\rfloor+1
           =\left\lfloor\frac{2+b_T}{2}\right\rfloor.
```

The union has size at least $e_T$, which verifies Hall’s condition for every set involving all three pairs. Choose distinct representatives and color the internal edges. Different dense triples share no vertices, so these choices do not conflict. This completes the square coloring of the retained graph. Greedily restoring the removed vertices proves the theorem.

## Audit and scope

The proof uses ordinary coloring and dedicated palettes on the first pass. It asserts no list-coloring theorem for mixed subdivisions. The disjoint triangles follow from the measured odd-set density, and the Hall count uses the actual degree budget at all three vertices. A valid preliminary coloring need not extend if the three original colors are repeated cyclically on the three outside neighbors. The contraction coloring prevents that failure. The alternative case of a color counted three times also gives the needed saving.

Run `python3 research/wegner/verify.py` from the repository root. The exact examples check a nonextendable preliminary coloring, its repair, and a triangle with a tight Hall count due to a color occurring in all three forbidden sets. The verifier checks the resulting square colorings. This is AI-assisted research with a written proof. Independent review and priority are pending. The full conjecture remains open, including graphs with unrestricted direct-edge degree.

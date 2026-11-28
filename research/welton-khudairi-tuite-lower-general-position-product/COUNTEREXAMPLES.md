# Welton–Khudairi–Tuite lower general position product conjecture

**Disproved.** For every integer $M\ge7$ there are finite connected graphs $G_M,H_M$ with
```math
\mathop{\mathrm{gp}}^{-}(G_M)=M,\qquad
\mathop{\mathrm{gp}}^{-}(H_M)\ge M,\qquad
\mathop{\mathrm{gp}}^{-}(G_M\square H_M)\le6.
```
The failure of the proposed lower bound is unbounded. This is [Conjecture 2.10 of the preprint](https://arxiv.org/html/2404.19451#S2) and Conjecture 3 of the [journal version](https://oro.open.ac.uk/98050/9/98050final.pdf) of Eartha Kruft Welton, Sharif Khudairi and James Tuite, *Lower General Position in Cartesian Products*. It is distinct from their terminal-set conjecture (issue #869). Coordination: [#854](https://github.com/1337isnot1337/solved-conjectures/issues/854).

A set is in general position if none of its vertices lies on a geodesic between two others. The lower general position number $`\mathop{\mathrm{gp}}^{-}`$ is the least cardinality of an inclusion-maximal such set, not the maximum general position number.

## The factor graphs

Let $G_M=K_M$. The entire vertex set is its unique maximal general position set, so $`\mathop{\mathrm{gp}}^{-}(G_M)=M`$.

Start $H_M$ with a six-vertex set $P$ grouped into pairs $`P_i=\{u_i,v_i\}`$ for $i=1,2,3$. Each pair is an edge; between $P_1,P_2$ and between $P_2,P_3$ put all four edges; between $P_1,P_3$ put none. For each $p\in P$, add a set $X_p$ of $M$ vertices. The union of the six new sets is one clique. Each $x\in X_p$ is adjacent among the original vertices to $p$ only. The resulting $H_M$ is connected, and all nonedges have distance two: two nonadjacent vertices of $P$ have a common neighbor in $P_2$, and any new vertex has a length-two route to each nonadjacent original vertex through that original vertex's added set.

The vertices of each $X_p$ are pairwise adjacent and have the same distances to every vertex outside the pair. If a general position set contains one and omits another, adding the omitted vertex preserves general position. Any triple involving both twins has lengths $(1,d,d)$ and is noncollinear, and a triple involving the new twin but not the old one has the same distances as an old triple. Thus a maximal general position set meeting $X_p$ must include the entire set $X_p$.

Suppose a maximal general position set had fewer than $M$ vertices. By that observation it would lie in $P$. It could not equal $P$, because one vertex from each of $P_1,P_2,P_3$ gives a length-two geodesic with its middle in $P_2$. Pick $p\in P$ omitted by the proposed maximal set. Every vertex of $X_p$ is at distance two from every selected vertex, while all mutual distances of selected vertices are at most two. Adding any point from $X_p$ therefore preserves general position, a contradiction. This proves $`\mathop{\mathrm{gp}}^{-}(H_M)\ge M`$.

## A six-vertex maximal set in the product

Pick three distinct vertices $g_1,g_2,g_3$ of $K_M$ and put
```math
S=\bigcup_{i=1}^3 \bigl(\{g_i\}\times P_i\bigr).
```
In the Cartesian product, distances add across coordinates. A betweenness equality therefore requires the same middle point to give equality in both factors, since each factor satisfies the triangle inequality.

A triple from three different rows is not collinear in the complete first factor. A triple from two rows uses the two endpoints of one pair and a point in another pair. The three second-coordinate distances are $(1,d,d)$ with $d=1$ or $2$ because adjacency between distinct pairs is uniform. They are not collinear. There is no triple within a row. Hence $S$ is in general position.

For maximality, take $(g,y)\notin S$. If $y\in P_i$, the distances in $H_M$ from $y$ to the two points of $P_i$ are 0 and 1. Otherwise $y\in X_p$ for a unique $p\in P_i$, and its distances to the points of $P_i$ are 1 and 2. In either case the two product distances from $(g,y)$ to $`\{g_i\}\times P_i`$ differ by one, because the same first-coordinate distance is added to each. The selected pair is adjacent. The resulting distance equality puts $(g,y)$ at an endpoint of a geodesic through both selected vertices, so it cannot be added. Thus $S$ is maximal, proving the counterexample.

## Source and review boundaries

The general-position survey, arXiv:2501.19385, restates the bound as Conjecture 5.14 in the version checked. The original papers on lower general-position sets and the original product paper give factor-layer results and examples, not the two-factor reverse inequality exhibited here. Searches on 26 November 2026 covered the exact author and title strings, both statement numbers, equivalent lower/minimum/maximal terminology, the survey and bibliography, and terms for complete factors, modules and twins. Both repository branches and issue/PR searches were checked; the earlier #854 checkpoint gives a partial lower bound and does not disprove the conjecture. No earlier resolution was located in this bounded search. A written proof is given here, not a Lean formalization or an external referee report.

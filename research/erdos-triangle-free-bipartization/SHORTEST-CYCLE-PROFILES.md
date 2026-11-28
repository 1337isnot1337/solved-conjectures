# Shortest-cycle walk profiles and an optimal depth of extension

Let $G$ have shortest odd cycle $C_g$, labeled $v_i$ modulo odd $g\ge7$. Write $S_r=\{-r,-r+2,\ldots,r\}$ modulo $g$. Say a vertex has a full profile of depth $r$ and center $i$ if for every index in $i+S_r$ there is an $r$-step walk from that vertex to the corresponding $v_j$. Let $D_r$ be all vertices with such a profile.

**Theorem.** For $0\le r\le(g-5)/2$ the centers are unique, and they extend to a labeling of all vertices by $C_g$ that respects every edge incident to $D_r$. The sets $D_r$ are nested. If an exterior vertex has neighbors in two different center classes of $D_r$, it has a full profile of depth $r+1$ with the intervening center. The depth bound for preserving all incident edges is best possible, even with no hypothesis on how the original odd cycle was selected.

The definition at depth one is exactly the usual double-neighbor classes of a shortest odd cycle. See [Lai–Liu](https://math.wvu.edu/~hlai2/Pdf/Hong-Jian_Lai_Pdf/055-BICA_2000.pdf) and [Messuti–Schacht](https://www.math.uni-hamburg.de/home/schacht/2015/3n4k.pdf) for related shortest-cycle and high-minimum-degree homomorphism methods. The profile statement uses no degree hypothesis.

## The short-walk test

Any walk of length $s<g$ in $G$ between original cycle vertices $v_a,v_b$ requires $b-a\in S_s$. For different endpoints, of the two cycle arcs one has the same parity as $s$. If that arc were longer than $s$, the other arc, combined with the walk, would be a closed odd walk shorter than $g$. Such a walk contains a shorter odd cycle. This is impossible. The same argument uses arc length zero when $a=b$ and $s$ is odd; an even $s$ already gives the claimed condition.

For any $j<g-1$, $S_j$ is a proper cyclic interval of $j+1$ consecutive labels in the order with step two. If an interval shifted by $t$ lies in another such proper interval, it cannot wrap through the latter's missing labels. For example,
- $t+S_j\subseteq S_j$ forces $t=0$;
- $t+S_j\subseteq S_{j+1}$ forces $t=\pm1$;
- $t+S_j\subseteq S_{j+2}$ forces $t\in\{-2,0,2\}$.

In each example, the larger set must be proper. The allowed shifts follow by comparing the two starting indices and counting possible placements inside the larger interval. Also $S_r-S_s=S_{r+s}$ by adding the original integer progressions and then reducing modulo $g$.

## Full profiles extend

If one vertex had two depth-$r$ centers $i,j$, concatenate its two walks in either order. The short-walk test gives $j-i+S_{2r}\subseteq S_{2r}$, so $i=j$. Extending walks by steps along the original cycle shows that a full profile remains full at larger depths with the same center whenever uniqueness applies.

For an edge between centers $i,j$ of $D_r$, the short-walk test for concatenation through the edge gives $j-i+S_{2r}\subseteq S_{2r+1}$; hence $i,j$ are adjacent. For any vertex $x$ with neighbors in center classes $i,j$ of $D_r$, concatenate through $x$ instead. This yields $j-i+S_{2r}\subseteq S_{2r+2}$, hence $j-i\in S_2$. The set $S_{2r+2}$ is proper under the stated bound on $r$. Thus all distinct labels on the $D_r$-neighbors of $x$ are pairwise at distance two. At most two distinct labels can occur, since the step-two cycle on $g$ labels has no triangle. Any such set fits within one open neighborhood of $C_g$. Label $x$ by a common neighbor, or choose any label when it has no $D_r$-neighbors. This extends over every incident edge. If the neighbor set contains both $i-1$ and $i+1$, prepend the edge from $x$ to walks from each neighbor. Their root labels together give $i+S_{r+1}$, proving the growth criterion.

## Sharpness at the next depth

Put $r=(g-3)/2$. Start with a cycle $C_g$. Choose two centers $i,j$ with $j-i\notin S_2$. Add a new vertex $x$ and a private internally disjoint length-$r$ path from $x$ to each root in $i+S_r$. Do the same with a disjoint second fan at $z$ and $j+S_r$. Finally add one vertex $y$ with edges to $x,z$ only.

The graph has odd girth $g$. A cycle traversing one fan between its root endpoints uses $2r=g-3$ edges. This is even. The odd root arc is at least three because the two root labels differ in $S_{2r}$, so the combined odd cycle has length at least $g$. A cycle with at least two fan traversals has length at least $4r=2g-6>g$. A cycle through $y$ has at least $2r+2=g-1$ edges in its segment through the two fans, and if odd has length at least $g$. Other cycles stay on the original cycle. The two fan vertices have the stated full profiles. Their centers are still unique since $S_{2r}$ is proper. But no label of $C_g$ is adjacent to both $i$ and $j$, so their labels cannot both extend over the edges incident to $y$.

## Consequences for bipartization

With vertex weights summing to one, suppose the exterior $V(G)\setminus D_r$ has mass $\nu$ and internal edge mass $Y$. For each of the $g$ cuts of $C_g$ missing just one cycle edge, pull it back along the extended labeling. Every edge incident to $D_r$ is missed by exactly one of these cuts, so in terms of total edge mass $e$,
$
\beta(G)\le e/g+(1-1/g)Y.
$
Alternatively, in the $i$-th cut the respected monochromatic edges have mass at most the product of two consecutive label-class masses $s_i s_{i+1}$. The lightest such product is at most $1/g^2$ by AM–GM, and the entire exterior can cost at most $Y\le\nu^2/4$ by weighted Mantel. Thus
$
\beta(G)\le\min\{e/g+(1-1/g)Y,\ 1/g^2+Y\}.
$
This is an all-order test and a quadratic error bound in the exterior vertex mass. It does not show that every graph has a cycle with sufficiently small uncovered mass for an exact $1/g^2$ bound.

[Erdős #23 and the odd-girth version](https://www.erdosproblems.com/23) · [Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

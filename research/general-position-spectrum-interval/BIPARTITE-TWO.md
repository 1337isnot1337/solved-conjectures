# Restrictions on general position number two in complete bipartite graphs

**Theorem.** If $r\ge s\ge2$, an orientation of $K_{r,s}$ has general position number two exactly when $r\le s+1$ or $(r,s)=(4,2)$. Together with the [imbalance band](BIPARTITE.md), this proves the interval conjecture for every $K_{s+3,s}$, in addition to the cases of imbalance one and two. It is still a partial result for general graphs.

Write $X$ for the side of size $r$ and call $P_x\subseteq Y$ the set of out-neighbors of $x\in X$. On $X$ use the directed distance $\delta$ equal to half the ordinary directed distance; all finite distances between distinct $X$ vertices have even ordinary length. A triple in $X$ is collinear exactly when it satisfies a finite directed distance equality in $\delta$ in some order.

## Profiles and clones

If $P_x\not\subseteq P_y$, then $\delta(x,y)=1$ by using any out-neighbor of $x$ not in $P_y$. Hence incomparable profiles have distance one in both directions. For distinct comparable profiles the downward distance is one and the upward distance is at least two or infinite.

Two distinct vertices with identical profiles are twins. If there is a directed path between them, there is a directed cycle through the first twin: replace the endpoint by the first twin using the identical neighborhoods. A shortest directed cycle through a given vertex in a bipartite tournament has length four, since any longer cycle has a chord from that vertex to a nonconsecutive vertex on the other side, and either direction of the chord shortens the directed cycle through that vertex. A directed four-cycle cannot contain both twins: its first two arcs between the twins would require their orientations to the intermediate vertex to differ. Therefore a shortest four-cycle through the first twin gives a length-four path to the second by substituting its end. Thus between distinct twins the value of $\delta$ is either two in both directions or infinite in both directions.

On a geodesic, two twins can occur together only as the two endpoints. If either one has a predecessor before the first or a successor after the second, the corresponding shortcut uses the common neighborhoods. Consequently two twins together with a vertex of a distinct **comparable** profile are in general position: the comparable third vertex cannot be internal on a shortest twin-to-twin path, since one of its two distances to and from that profile exceeds one. A twin class is in general position by the same shortcut. Three pairwise incomparable profiles also give a general-position triple, since their pair distances are all one.

Assume from now on that the orientation has general position number two. The width of distinct profiles is at most two, each profile occurs at most twice, and there can be at most one doubled profile if $r\ge5$. For if two distinct profiles were doubled, any third profile would have to be incomparable with both, and they in turn are incomparable, which is forbidden. If there were no third profile then $r\le4$.

## Layers on a longest geodesic

Let $d$ be the largest finite $\delta$ distance between distinct $X$ vertices; if there are no such distances then all of $X$ is in general position. We always have $d\le s$, because any directed path of ordinary length $2d$ alternating between the parts uses $d$ distinct vertices of $Y$.

If $d\le2$, three strictly nested profiles form a general-position triple: two downward moves cannot give a tight sum, and any upward move has length at least two, so cannot be part of a tight sum of length at most two. The profile poset has width and height at most two, hence at most four distinct profiles (put them in their height layers). If a class is doubled, all other classes are incomparable to it and must form a chain (two incomparable others would give an antichain of size three). That chain has size at most two. Two doubled classes were already seen to allow at most four vertices total. Thus $r\le4$ also allowing multiplicities.

Otherwise fix endpoints $u,v$ of a directed geodesic with $\delta(u,v)=d\ge3$. Their profiles are distinct (twins have finite distance at most two), so $\delta(v,u)=1$. Every other $X$ vertex lies on a shortest $u$–$v$ path: its triple with $u,v$ has to be collinear; extending through $u$ or $v$ gives a distance larger than $d$, and being internal in the reverse direction is impossible at distance one. Partition $X$ into layers $L_i$ of vertices with $\delta(u,x)=i$, $\delta(x,v)=d-i$. The endpoint layers are singletons.

Within an interior layer, two distinct profiles must be comparable, since a distance-one pair in both directions would form a general-position triple with $u$ (equal distances from $u$, and no positive two distances add to one). There are no twins **within the same layer**: for twins there their pair distance is two or infinite, so collinearity with $u$ forces $i=1$ and collinearity with $v$ forces $d-i=1$, contrary to $d\ge3$. Indeed the two equal layer distances force $u$ or $v$, respectively, to be the middle vertex. Thus the profiles in any interior layer form a strict inclusion chain. For $x<y$ in that layer, descending distance is one, and the two required collinearities imply
```math
\delta(x,y)=\delta(x,u)+i=d-i+\delta(v,y).
```
### The monotonicity shortcut

In fact, for **every** interior vertex $x$ we have $\delta(x,u)=\delta(v,x)=1$. Otherwise $\delta(x,u)>1$ or is infinite, so $P_x\subseteq P_u$. Take an $X$-successor $z$ of $x$ on a shortest $u$–$v$ path through it, in layer $i+1$. Since $i+1\ge2$, also $P_u\subseteq P_z$. This implies $P_x\subseteq P_z$, contradicting the forward step $\delta(x,z)=1$. The other equality follows by taking an $X$-predecessor $w$: if $\delta(v,x)>1$ or is infinite then $P_v\subseteq P_x$, while $\delta(w,v)=d-i+1\ge2$ gives $P_w\subseteq P_v$, contradicting $\delta(w,x)=1$.

Consequently a layer with at least two vertices must be at $i=d/2$, and every upward distance within it is $i+1$. That layer has at most two vertices: in a strict three-element chain with constant upward distance $i+1$ and downward distance one, two downward steps shortcut, and any upward step plus another positive step exceeds both possible direct distances. Three such vertices would therefore be in general position. We have proved $r\le d+2$, with the possible extra vertex only in the middle layer for even $d$.

### Saturation on the small side

If $d=s\ge3$, every $u$–$v$ geodesic uses every vertex of $Y$. List them as $y_1,\dots,y_s$ along the original geodesic; their distances from $u$ force them into the same order on every such geodesic. The profile of an $X$ vertex in layer $i$ is determined: the geodesic requires $y_i\to x\to y_{i+1}$ when these indices exist, and an arc $y_j\to x$ for $j<i$ or $x\to y_j$ for $j>i+1$ would shorten a distance from $u$. Thus all vertices of a layer would be twins, which was excluded for interiors. In this case $r\le s+1$.

## Conclusion

For $s\ge3$, if $d\le2$ we have $r\le4\le s+1$. If $d\ge3$ with $d<s$, the general layer bound gives $r\le d+2\le s+1$, while if $d=s$, saturation gives $r\le s+1$ directly. Conversely $K_{r,s}$ is traceable for $s\le r\le s+1$, and its Hamilton-geodesic orientation gives number two.

For $s=2$, [Theorem 4.28 of the source](https://arxiv.org/html/2604.15909v1) gives the lower bound $\lceil r/2\rceil$ when $r\ge4$. The exceptional $K_{4,2}$ reaches two by taking two clones on each of the two large-side positions of a directed four-cycle, as in the explicit upper-band construction. This completes the classification.

The imbalance-three band begins at four; now the only possible value below it is three. Thus the entire family $K_{s+3,s}$ has the interval property.

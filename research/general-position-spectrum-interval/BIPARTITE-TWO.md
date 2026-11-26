# Restrictions on general position number two in complete bipartite graphs

**Theorem.** If $r\ge s\ge2$ and $r\ge s+3$, then no orientation of $K_{r,s}$ has general position number two. In fact if $s\ge6$, number two is possible exactly when $r\le s+1$. Together with the [imbalance band](BIPARTITE.md), this proves the interval conjecture for every $K_{s+3,s}$, in addition to the cases of imbalance one and two. It is still a partial result for general graphs.

Write $X$ for the side of size $r$ and call $P_x\subseteq Y$ the set of out-neighbors of $x\in X$. On $X$ use the directed distance $\delta$ equal to half the ordinary directed distance; all finite distances between distinct $X$ vertices have even ordinary length. A triple in $X$ is collinear exactly when it satisfies a finite directed distance equality in $\delta$ in some order.

## Profiles and clones

If $P_x\not\subseteq P_y$, then $\delta(x,y)=1$ by using any out-neighbor of $x$ not in $P_y$. Hence incomparable profiles have distance one in both directions. For distinct comparable profiles the downward distance is one and the upward distance is at least two or infinite.

Two distinct vertices with identical profiles are twins. If there is a directed path between them, there is a directed cycle through the first twin: replace the endpoint by the first twin using the identical neighborhoods. A shortest directed cycle through a given vertex in a bipartite tournament has length four, since any longer cycle has a chord from that vertex to a nonconsecutive vertex on the other side, and either direction of the chord shortens the directed cycle through that vertex. A directed four-cycle cannot contain both twins: its first two arcs between the twins would require their orientations to the intermediate vertex to differ. Therefore a shortest four-cycle through the first twin gives a length-four path to the second by substituting its end. Thus between distinct twins the value of $\delta$ is either two in both directions or infinite in both directions.

On a geodesic, two twins can occur together only as the two endpoints. If either one has a predecessor before the first or a successor after the second, the corresponding shortcut uses the common neighborhoods. Consequently two twins together with a vertex of a distinct **comparable** profile are in general position: the comparable third vertex cannot be internal on a shortest twin-to-twin path, since one of its two distances to and from that profile exceeds one. A twin class is in general position by the same shortcut. Three pairwise incomparable profiles also give a general-position triple, since their pair distances are all one.

Assume from now on that the orientation has general position number two. The width of distinct profiles is at most two, each profile occurs at most twice, and there can be at most one doubled profile if $r\ge5$. For if two distinct profiles were doubled, any third profile would have to be incomparable with both, and they in turn are incomparable, which is forbidden. If there were no third profile then $r\le4$.

## Layers on a longest geodesic

Let $d$ be the largest finite $\delta$ distance between distinct $X$ vertices; if there are no such distances then all of $X$ is in general position. We always have $d\le s$, because any directed path of ordinary length $2d$ alternating between the parts uses $d$ distinct vertices of $Y$.

If $d\le2$, three strictly nested profiles form a general-position triple: two downward moves cannot give a tight sum, and any upward move has length at least two, so cannot be part of a tight sum of length at most two. The profile poset has width and height at most two, hence at most four distinct profiles (put them in their height layers). With the doubled-profile bound this gives $r\le5$.

Otherwise fix endpoints $u,v$ of a directed geodesic with $\delta(u,v)=d\ge3$. Their profiles are distinct (twins have finite distance at most two), so $\delta(v,u)=1$. Every other $X$ vertex lies on a shortest $u$–$v$ path: its triple with $u,v$ has to be collinear; extending through $u$ or $v$ gives a distance larger than $d$, and being internal in the reverse direction is impossible at distance one. Partition $X$ into layers $L_i$ of vertices with $\delta(u,x)=i$, $\delta(x,v)=d-i$. The endpoint layers are singletons.

Within an interior layer, two distinct profiles must be comparable, since a distance-one pair in both directions would form a general-position triple with $u$ (equal distances from $u$, and no positive two distances add to one). There are no twins **within the same layer**: for twins there their pair distance is two or infinite, so collinearity with $u$ forces $i=1$ and collinearity with $v$ forces $d-i=1$, contrary to $d\ge3$. Indeed the two equal layer distances force $u$ or $v$, respectively, to be the middle vertex. Thus the profiles in any interior layer form a strict inclusion chain. For $x<y$ in that layer, descending distance is one, and the two required collinearities imply
```math
\delta(x,y)=\delta(x,u)+i=d-i+\delta(v,y).
```
For $i\ge2$ the term $\delta(x,u)$ is one unless $x$ is a twin of $u$, in which case $i=2$ and the term is two. For $d-i\ge2$ the analogous statement holds for $\delta(v,y)$. These statements follow from comparability or incomparability and the finite twin distance. If a layer has a common finite upward distance at least two for all its pairs, it has at most two vertices: a two-step distance sum in any triple is not tight (downward–downward shortcuts, and any upward term plus another positive term exceeds the larger of the two possible distances).

### Bounds on layer sizes

If $d\ge5$ there is no repeat in layer one. A pair $x<y$ in that layer would have $\delta(v,y)=1$ and so $\delta(x,u)=d-1$. Follow a shortest $u$–$v$ path through $x$ to a vertex $z$ of layer three. We have $\delta(x,z)=2$ and $\delta(z,u)=1$ since $\delta(u,z)=3$ and $z$ cannot be a twin of $u$. This gives $\delta(x,u)\le3<d-1$. Reversing all arcs gives the same result for layer $d-1$.

For $d\ge6$, a pair in layer two cannot exist: its upward distance would be $d-1\ge5$ by the $v$ formula, but at most four by the $u$ formula. The reverse argument handles layer $d-2$. In all remaining interior layers both auxiliary distances are one, so a repeated layer can only be at $i=d/2$, with common upward distance $i+1$ and at most two vertices. This gives $r\le d+2$ for $d\ge6$.

For $d=5$, a repeat in layer two forces its smaller profile to be a twin of $u$, and the upward distance in any such pair is four. A repeat in layer three forces a twin of $v$. There cannot be both, since $u,v$ have distinct profiles and at most one profile is doubled for $r\ge5$. Both these layers have size at most two. Hence $r\le7$.

For $d=4$, a repeat in layer one forces its smaller profile $x$ to satisfy $\delta(x,u)=3$. Along any $u$–$v$ geodesic through $x$, its layer-two successor must be a twin of $u$; otherwise that successor has distance one back to $u$, giving $\delta(x,u)\le2$. A repeat in layer three analogously forces a twin of $v$. At most one of layers one and three can repeat, and each has common upward distance four when it repeats. In layer two, upward distance four in an ordered pair requires its smaller vertex to be a twin of $u$ and its larger one a twin of $v$, by the two formulas. This cannot happen for $r\ge5$, because only one profile can be doubled. Thus layer two has only upward distance three when it has a pair, and also has size at most two. Therefore $r\le7$.

For $d=3$, in layer one a pair has upward distance $2+\delta(v,y)$, which must equal three since it cannot exceed $d$. The reverse argument gives the same conclusion in layer two. Both layers have size at most two, so $r\le6$.

### Saturation on the small side

If $d=s\ge3$, every $u$–$v$ geodesic uses every vertex of $Y$. List them as $y_1,\dots,y_s$ along the original geodesic; their distances from $u$ force them into the same order on every such geodesic. The profile of an $X$ vertex in layer $i$ is determined: the geodesic requires $y_i\to x\to y_{i+1}$ when these indices exist, and an arc $y_j\to x$ for $j<i$ or $x\to y_j$ for $j>i+1$ would shorten a distance from $u$. Thus all vertices of a layer would be twins, which was excluded for interiors. In this case $r\le s+1$.

## Conclusion

For $s\ge6$, if $d\ge6$ then either $d=s$ and $r\le s+1$, or $d<s$ and $r\le d+2\le s+1$. If $d\le5$ then $r\le7\le s+1$. Conversely $K_{r,s}$ is traceable for $r\le s+1$, and the Hamilton-geodesic orientation gives number two.

For $s=2,3,4,5$ and $r\ge s+3$, apply $d=s$ saturation if $d=s\ge3$, and the bounds $r\le5,6,7$ for $d\le2,d=3,d\in\{4,5\}$ respectively in the other cases. For $s=2$, use instead the exact elementary $\lceil r/2\rceil$ lower bound in Theorem 4.28 of the [source](https://arxiv.org/html/2604.15909v1). In every case $r\ge s+3$ is impossible at value two. The imbalance-three band begins at four, and the only possible value below it is now three. Thus this entire family has the interval property.

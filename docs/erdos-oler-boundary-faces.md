# Thin boundary faces in Erdős–Oler packings

Use the centre formulation in [the research note](erdos-oler-research.md). Let $n=(k+1)(k+2)/2-1$ centres at pairwise distance at least one fit in an equilateral triangle $\Delta$ of side $L\lt k$. The argument below gives necessary conditions for such a configuration. It uses the area normalisation $`B(T)=4\mathop{\mathrm{area}}(T)/\sqrt3`$, so a unit equilateral triangle has $B=1$.

## All three corners can be occupied

A corner cap of size $r$ is the equilateral triangle of side $r$ cut off by a line parallel to the opposite side. Let $r$ be the smallest size of the closed cap containing a centre at a given corner. The convex hull of the centres is contained in the original triangle with the interior of this cap cut off. The perimeter of the truncated triangle is $3L-r$, and its normalised area is $L^2-r^2$. By Oler's inequality,

```math
2n\le L^2-r^2+3L-r+2.
```

As $2n=k^2+3k$ and $L\lt k$, this gives $r+r^2\lt2$. In particular there is a centre $P$ at distance less than one from the corner $V$. Any other centre $Q$ must have $|Q-V|\ge1$. Indeed, two points at distances strictly less than one from $V$ and angular separation at most $60^\circ$ have distance strictly less than one by the cosine rule. Also

```math
|Q-V|^2-|Q-P|^2
=2(P-V)\cdot(Q-V)-|P-V|^2\ge0,
```

since the angle is at most $60^\circ$ and $|Q-V|\ge1\gt |P-V|$. Thus $P$ may be moved to $V$ without losing separation. Apply the argument successively to the three corners. For $k\ge2$ any packing of $n$ points must have $L\gt1$, since at most the three vertices can have pairwise distances at least one in side one. The relocations therefore preserve any corner already occupied. The case $k=1$ cannot give a counterexample by the diameter bound. Henceforth assume all corners are occupied.

- [Oler's inequality and its triangulation proof](https://doi.org/10.4153/CMB-1969-096-7)

## Exterior Delaunay faces point to boundary edges

The packing is saturated in $\Delta$. A point at distance at least one from every centre would give the complete triangular number in side $L\lt k$, contradicting Oler's bound. Fix a Delaunay triangulation of the centres, including every centre on a straight hull side. Call a face **exterior** here if its circumradius exceeds one. Its circumcentre lies outside $\Delta$ by saturation, so the face is obtuse. Its longest side is unique, and the circumcentre is on the other side of that edge from the obtuse vertex.

For each exterior face, point across its longest edge, using the adjacent triangle if the edge is interior and stopping otherwise. If the face has largest angle $\theta\gt90^\circ$, the opposite angle $\phi$ across this edge obeys $\phi\le180^\circ-\theta$, by the Delaunay condition. The two circumcentres lie on the same side of the edge, and the new radius is at least the old radius because $\sin\phi\le\sin\theta$. Thus the next face is also exterior and hence obtuse. Its longest edge is strictly longer than the shared edge, because the angle $\phi$ opposite the shared edge is acute. These arrows cannot form a cycle. Each exterior face reaches a boundary edge.

Let $e=AB$ be this boundary edge on a given side. The path of circumcentres, with successive centres joined along the dual Voronoi edges, stays in the exterior of $\Delta$. The distance to the nearest packing centre along each such segment is at least the smaller endpoint radius, since the segment lies on one side of the associated Delaunay edge and moves away from its midpoint. Degenerate dual segments from cocircular faces obey the same statement. Thus every point on the path has at least two nearest centres and distance greater than one from them.

An exterior point whose orthogonal projection on $\Delta$ is an occupied corner has that corner as its unique nearest centre. The same holds for an exterior point that projects to any occupied point of a side. The Voronoi path can therefore exit neither the slab projecting to the relative interior of the given side nor the portion of the slab projecting to the open interval $AB$. The terminal circumcentre is in that portion because it is across an edge of the side and projects to its midpoint. A centre outside the vertical strip over $AB$ cannot be tied for nearest to a point in the slab, because $A$ or $B$ would be closer. All vertices of every face reaching $e$ are consequently in that strip. They are also at distance less than one from the side. Indeed, a circumcentre $O$ at distance $h$ from its projection on the side has radius $R\lt h+1$ by saturation at the projection, so the part of its circumcircle inside $\Delta$ has height at most $R-h\lt1$.

## A bound on total area of deficient faces

For a face with side lengths $a,b,c$ where $c$ is largest, write $t=a+b-c$. Heron's formula and $a,b,c\ge1$ imply $B(T)^2\ge t$, since the other factors are $a+b+c\ge3$ and $c^2-(a-b)^2\ge ab$ in the square of the normalised area. The triangle inequality and the same formula also give $B(T)\ge t$: the other factors satisfy $a+b+c\ge3t$ and $c^2-(a-b)^2\ge ab\ge1$, since $t\le\min(a,b)$. Every face of circumradius at most one has $B(T)\ge1$, by the sine-law argument in the research note.

On an exterior face, the edge excesses $|e|-1$ give the identity

```math
1-B(T)=(c-1)-(a-1)-(b-1)-(B(T)-t).
```

Each positive excess on an outgoing interior edge cancels one negative excess in the next face. The remaining positive excesses occur on distinct hull edges. Write $b$ for the number of hull edges, $P=3L$ for the hull perimeter and $F=2n-b-2$ for the number of triangles. The total edge excess on the hull is $P-b$. Summing gives

```math
\sum_{T\text{ exterior}}(B(T)-t(T))
+\sum_{T\text{ of radius }\le1}(B(T)-1)
\le L^2+3L+2-2n\lt2.
```

The cancellation can be performed on each side separately, by assigning each exterior face to the side of its terminal edge. Let $b_j$ count the boundary edges on side $j$ and let $D_j$ be the sum of $1-B(T)$ over the exterior faces assigned to it. Then $D_j\le L-b_j$. The sum of the three nonnegative quantities $L-b_j-D_j$ is at most $L^2+3L+2-2n$, since every face of radius at most one has nonpositive deficit. A side with no deficient face assigned to it costs at least $L-b_j\ge L-k+1$ in this sum. Writing $\delta=k-L\gt0$, two such sides would cost at least $2-2\delta$, while the available total is $2-\delta(k+L+3)\lt2-2\delta$. Thus at least two distinct sides must have deficient faces assigned to them. If there is a side without any, it must have exactly $k-1$ boundary edges, since a side with $b_j\le k-2$ would alone cost more than the available total.

A deficient face has $B(T)\lt1$ and largest angle $\theta\gt120^\circ$. The latter follows from $B(T)=(2/\sqrt3)ab\sin\theta$, since $a,b\ge1$ and $\theta\ge60^\circ$. For such a face, $a+b+c\ge2+\sqrt3$ and $c^2-(a-b)^2=2ab(1-\cos\theta)\ge3ab$. Hence

```math
B(T)^2\ge (2+\sqrt3)t(T),\qquad B(T)-t(T)\ge (\sqrt3-1)B(T).
```

Thus the sum of the normalised areas of **all deficient faces** is less than $1+\sqrt3$, uniformly in $k$.

## A necessary angle and area bound

Set $d=3k-b$. The hull boundary lemma gives $d\ge3$. The aggregate deficit of the Delaunay triangles is

```math
\sum_T(1-B(T))=2n-b-2-L^2\gt d-2.
```

For a deficient face, $t\le B(T)^2/(2+\sqrt3)\lt1$. For any exterior face with $B(T)\ge1$, the inequality $1-B(T)\le\kappa(1-t)$ holds for every $0\le\kappa\le1$. This is immediate if $t\le1$, and follows from $B(T)\ge t$ if $t\gt1$. So if $\kappa$ bounds the ratios $(1-B(T))/(1-t)$ on all deficient faces, the outgoing-edge cancellation gives

```math
 d-2\lt\sum_T(1-B(T))\le\kappa(P-b)\lt\kappa d.
```

In particular $\kappa\gt1-2/d$. Each deficient face satisfies

```math
\frac{1-B(T)}{1-t}
\le \frac{1-B(T)}{1-B(T)^2/(2+\sqrt3)}
\le 1-(\sqrt3-1)B(T).
```

Hence some face has normalised area less than $(1+\sqrt3)/d$. With the notation above, its longest edge has $c=a+b-t\ge2-t$, so its terminal hull edge has length greater than $2-(1+\sqrt3)^2/((2+\sqrt3)d^2)=2-2/d^2$.

For the angle bound, the ratio at largest angle $\theta$ is at most

```math
q(\theta)=\frac{1-(2/\sqrt3)\sin\theta}{2\sin(\theta/2)-1}.
```

To see this, put $t_0=2-2\sin(\theta/2)$ and $B_0=(2/\sqrt3)\sin\theta$, the values at $a=b=1$. The identity $t/(ab)=2(1+\cos\theta)/(a+b+c)$ gives $t/(ab)\le t_0$, since $c$ is increasing in either side for this obtuse angle. With $q=(1-B_0)/(1-t_0)$, therefore $B(T)-qt\ge ab(B_0-qt_0)=ab(1-q)\ge1-q$. Also $q(\theta)$ increases from zero to one on $[120^\circ,180^\circ]$. For fixed $0\le q\le1$, the derivative of $(2/\sqrt3)\sin\theta-q(2-2\sin(\theta/2))$ is strictly negative in the interior of that interval. This proves monotonicity by the defining equation $B_0-qt_0=1-q$. The largest angle of some face must satisfy $q(\theta)\gt1-2/d$. In particular it exceeds the unique angle solving $q(\theta)=1/3$, which is between $142^\circ$ and $143^\circ$.

The localisation and area budget leave a geometric obstruction to settle. A boundary edge just shorter than two can support a single deficient triangle of very small area, so the cancellation alone does not rule out several short slivers on different sides.

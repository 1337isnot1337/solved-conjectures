# A directional area bound for Erdős problem 352

Suppose a bounded measurable set $A$ in the plane contains no triangle of area one. Choose orthonormal coordinates and let $P$ be its projection on the horizontal axis. Write $E_x$ for its vertical section. Two ordinates in $E_x$ a distance $d>0$ apart form a triangle of area one with **any** point on either vertical line of abscissa $x+2/d$ or $x-2/d$.

## Dense projections

**Theorem.** If $P$ is dense in an interval $I$, then the area of $A$ in the vertical slab above $I$ is at most $4\log 2$. In particular, if the closure of one projection has at most $k$ interval components and its other components together have measure zero, then $|A|\le 4k\log 2$.

To prove this take $I=(a,b)$ of positive finite length and set $D(x)=\max(x-a,b-x)$. At almost every $x$ the fiber is measurable. If two density points of $E_x$ have separation $d>2/D(x)$, an open interval about $d$ belongs to $E_x-E_x$. Indeed, short intervals centered at the two density points are each almost full, and their translates still overlap in positive measure for all shifts sufficiently close to the center separation. Equivalently one may use continuity of the autocorrelation after restricting each fiber to bounded neighborhoods of these points. Pick the sign towards the farther end of $I$. The map taking a positive separation $s$ to $x\pm2/s$ then maps a neighborhood of $d$ onto an open subinterval of $I$. It contains an abscissa from $P$, giving the forbidden triangle. Thus the density points in $E_x$ have diameter at most $2/D(x)$. They have full measure in the fiber, so
```math
 |A\cap(I\times\mathbb R)|\le\int_a^b\frac{2\,dx}{\max(x-a,b-x)}=4\log2 .
```
The component assertion follows by summation and Fubini. This proof permits disconnected fibers, missing abscissas inside $I$, and arbitrarily many connected components of $A$.

## Fibers with controlled differences

An alternative bound uses the global endpoints $a=\inf P$ and $b=\sup P$ even when $P$ has gaps. Suppose for almost every nonempty measurable fiber the difference set $E_x-E_x$ contains $(0,|E_x|/K)$, for some fixed $K>0$. Then $|A|\le 4K\log 2$. Indeed, if $|E_x|/K>2/D(x)$, choose a point of $P$ sufficiently close to the farther endpoint. The corresponding vertical separation lies in the prescribed interval. Integration gives the bound.

This applies when almost every section is a union of at most $K$ intervals up to a null set, since the longest interval has length at least $|E_x|/K$ and all its smaller positive differences survive removing a null set. It also applies when each positive-measure section occupies at least a fraction $\lambda>1/2$ of its essential spanning interval. For a measurable subset of an interval of length $L$ with measure $m$, the overlap with its translate by $s$ has measure at least $2m-L-s$ for $s>0$. Take $K=\lambda/(2\lambda-1)$.

The constant $4\log 2$ is exact if only triangles with a vertical side are forbidden. Over $0<x<1$ take open vertical intervals centered at zero of length $2/\max(x,1-x)$. Every vertical separation is strictly below that length and every horizontal distance to a third point is bounded by the denominator. Fubini gives area $4\log2$. Other orientations matter for the sharp unrestricted constant.

## Scope and sources

Erdős's question asks for an absolute upper bound on the area even when every projection is fragmented and the fiber difference sets are unrestricted. Freiling and Mauldin obtained the sharp constant $4\pi/\sqrt{27}$ when all triangles have area at most one, and Mauldin treated unions of up to three convex interiors for the exact-area question. Bulj and Kovač proved a general upper bound depending on the side length of a containing square. Koizumi's discretization is equivalent to the full boundedness question. The estimates above require an additional geometric hypothesis. [Original problem and sources](https://www.erdosproblems.com/352) · [Mauldin, Section 1](https://sites.math.unt.edu/~mauldin/papers/no123.pdf) · [Bulj and Kovač, Theorem 2](https://arxiv.org/abs/2605.30033) · [Koizumi, Theorem 2](https://jkoizumi144.com/notes/erdos352.pdf).

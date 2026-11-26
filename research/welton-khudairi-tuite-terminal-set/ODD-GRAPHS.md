# Welton–Khudairi–Tuite terminal-set conjecture

## Odd graphs

**Partial result.** Every odd graph $K(2s+1,s)$ with even $s\ge2$ has an explicit terminal set of size $2(2^{v_2(2s)}-1)$. In particular when $s\equiv2\pmod4$ six vertices suffice, at arbitrarily large diameters. For odd $s$, a bisector reduction and a further product-slice reduction are given below. They do not settle all odd $s$.

The target and terminology are in the [main research note](README.md). For $s$-sets $X,Y$ put $i=|X\cap Y|$. The [odd-graph distance formula of Bailey et al.](https://www.math.mun.ca/rbailey00/papers/jk.pdf) is
$$
d(X,Y)=\min(2(s-i),\,2i+1).
$$
The distance is injective as a function of $i$: on each parity branch it is strictly monotone, and the two branches have different parities.

### An explicit set if $s$ is even

Write $2s=bm$ with $b$ the largest power of two dividing $2s$, and $m$ odd. Set aside one ground element $z$, and partition the other elements into $b=2^d$ blocks $B_u$ of size $m$, indexed by $u\in\mathbb F_2^d$. For every nonzero $a\in\mathbb F_2^d$, take the two $s$-sets formed by the blocks with $a\cdot u=0$ and $a\cdot u=1$, respectively. They are disjoint, so are adjacent. All chosen vertices are distinct. Between two different pairs the four intersections have size $s/2$, since different nonzero binary forms are independent. Their distance is therefore $s$. Selected distance triples are $(1,s,s)$ or $(s,s,s)$, so the union is in general position.

Any outside vertex distinguished by the distances to one selected adjacent pair has an endpoint witness: distinct distances to adjacent vertices differ by one. If $X$ contains $z$, its intersections with the two sides of every pair sum to $s-1$, which is odd, so they differ. If $X$ omits $z$ and all pairs have equal intersections, the vector $(|X\cap B_u|)_u$ is orthogonal to every nonconstant character $(-1)^{a\cdot u}$. It must be constant, with each value $s/b=m/2$, impossible for integral occupancies. Thus the union is terminal.

The Petersen instance $s=2$ is already known from the original terminal-set paper. Bailey et al. use Hadamard matrices for the distinct resolving-set problem. Searches through the original paper's Kneser section, the recent survey, and terminal-set searches with odd graphs and Hadamard constructions did not locate the terminal-set construction above. This is a bounded priority search. The construction was obtained in a background research pass and then independently checked in the active #869 work.

### Edge bisectors, and the case of odd $s$

Let a graph have diameter $D\ge2$ and odd girth $2D+1$. For adjacent $a,b$, let $E$ be the set of points equidistant from them. Both distances from any $x\in E$ are $D$: the two paths together with $ab$ form an odd closed walk of length $2d(x,a)+1$, and such a walk contains an odd cycle. Every point outside $E\cup\{a,b\}$ is terminal using the adjacent pair. For any general-position extension of the pair, all its other vertices must be in $E$. Any triple involving one or both endpoints and at least one bisector point has distances $(D,D,\ell)$ with $1\le\ell\le D$ and is noncollinear. Thus the terminal sets containing $ab$ are precisely $\{a,b\}\cup T$ for terminal $T$ in the restricted ambient metric on $E$.

For odd $s=2r+1$, take two disjoint $s$-sets $A,B$ and their leftover element $z$. By the distance formula, the equidistant $s$-sets are exactly
$$
X=\{z\}\cup U\cup V,\qquad U\in\binom A r,\quad V\in\binom B r.
$$
The distance to each endpoint is $s$, so the same bisector argument applies directly. On the coordinates $(U,V)$ let $\delta$ be the sum of the two Johnson distances; the restricted metric is
$$
\rho=f(\delta),\qquad f(j)=\min(2j,4r+3-2j).
$$
In particular, the threshold between the two branches is $r,r+1$. For $r=1$, all nonzero distances in the nine-point bisector are 2 or 3, so the whole bisector is terminal. This produces an explicit eleven-point terminal set in $K(7,3)$.

There is an orientation constraint on any collinearity in $\rho$. If all three distances are even, the equality is already a $\delta$-equality with the same orientation. If there are two odd distances and one even distance, an even distance cannot equal the sum of the two odds. Written in terms of the three corresponding $\delta$-distances, that would require their sum to be $4r+3$. In each Johnson coordinate this sum is at most $2r+1$: a ground point contributes exactly one if it belongs to one or two of the three subsets, and zero otherwise. Hence the total is at most $4r+2$. The remaining equality of one odd with an odd plus an even again implies a $\delta$-equality, but the longer and shorter odd-branch distances reverse their roles. The other parity patterns do not permit collinearity.

### A second reduction for the remaining odd case

Choose an $(r-1)$-subset $C$ of $A$ and let $\mathcal C=\{C\cup\{a\}:a\in A\setminus C\}$. Choose disjoint $r$-sets $Y_1,Y_2$ in $B$, with leftover element $b$. Start with
$$
T_0=\mathcal C\times\{Y_1,Y_2\}
$$
in the bisector. Its two cliques have internal $\rho$-distance 2; cross distances are $2r$ or $2r+1$, since the corresponding $\delta$-distances are $r$ or $r+1$. This is general position: a cross distance changes by at most one under changing an endpoint within either clique, and any two cross distances have sum greater than 2.

For a point $(U,V)$ outside $T_0$, put $k=|U\cap C|$. As $W\in\mathcal C$ varies, its Johnson distances to $U$ take both values $r-k-1$ and $r-k$: $U$ uses at least one point outside $C$, but cannot use all $r+2$ of them. Thus its distances in $\delta$ to $\mathcal C\times\{Y_i\}$ take consecutive values with lower value $r-k-1+d_J(V,Y_i)$. Passing to $\rho$, the values differ by 2, giving an endpoint witness via that clique, unless the lower $\delta$-value is $r$ (the cusp). Consequently every outside point is terminal with respect to $T_0$ except those satisfying
$$
d_J(V,Y_1)=d_J(V,Y_2)=k+1.
$$
Conversely for every point of this exceptional set all its distances to $T_0$ are $2r$ or $2r+1$. Such a point cannot be collinear with any two points of $T_0$; no two exceptional points can be collinear with a point of $T_0$ for the same reason (their distances to it differ by at most 1 and sum to more than the metric diameter). Thus extending $T_0$ to a terminal set is exactly the existence problem restricted to that exceptional set.

This is again a product slice. If $r=2h$, then $k=h-1$, $V$ omits $b$, and it contains $h$ points of each $Y_i$. If $r=2h+1$, then $k=h$, $V$ contains $b$, and it contains $h$ points of each $Y_i$. In both cases $U$ chooses $k$ points of $C$ and $r-k$ outside $C$. The distance stays $f$ of the sum of the four Johnson distances in these independent choices. This reduces the remaining parity further without silently replacing its ambient metric by an induced-graph metric.

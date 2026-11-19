# Haralambis’s conjecture on three missing differences

Cinna Davis and GPT-6.2 Astra · November 2026 · Unrefereed proof

Let $D=\{d_1,d_2,d_3\}$ be three distinct positive integers. Write $\mu(D)$ for the supremum of the upper densities of sets of integers $A$ in which no two elements differ by a member of $D$. Write $\|x\|$ for distance to the nearest integer and set
$$
\kappa(D)=\max_{t\in\mathbb R/\mathbb Z}\min_i\|d_i t\|.
$$

**Theorem.** For every such $D$, $\mu(D)=\kappa(D)$. An optimal periodic set exists with period equal to one of the three pair sums $d_i+d_j$.

This is the three-element conjecture attributed to Haralambis (1977). Liu and Robinson state it as Conjecture 3 and determine the density for several infinite families. The character lower bound $\mu\ge\kappa$ was already known. We prove the reverse inequality by comparing three short intervals in an arbitrary avoiding set. [Haralambis’s paper](https://doi.org/10.1016/0097-3165(77)90076-0) · [Liu and Robinson, Section 6](https://arxiv.org/pdf/1611.03940)

## A finite interval inequality

Assume first that $\gcd(d_1,d_2,d_3)=1$, and put $L=d_1+d_2+d_3$. Given any avoiding set in $[0,L)$, let $P_{ij}$ count its members in $[0,d_i+d_j)$. We prove
$$
\delta:=\min_{i<j}\frac{P_{ij}}{d_i+d_j}\ \le\ \kappa(D). \tag{1}
$$

We use the lattice height $h(x)=d_1x_1+d_2x_2+d_3x_3$ and its kernel $K\subset\mathbb Z^3$. In the unit cubic lattice, take the union $B$ of closed cubes with lower corners of negative height. Its boundary is a stepped plane. Indeed, $B$ is closed and is downward closed in the coordinatewise order. Every line in direction $(1,1,1)$ starts inside $B$ and ends outside it. Translating a point of $B$ a positive distance in the strictly negative diagonal direction puts it in the interior. Thus each such line meets the boundary exactly once. The boundary height along these lines is continuous because moving the base point by a vector of sup norm at most $\eta$ moves its diagonal parameter by at most $\eta$, by coordinatewise comparison. Diagonal projection therefore identifies the boundary with a plane. Translations in $K$ act on that plane as a rank-two lattice, since diagonal projection restricts to a linear isomorphism on the real kernel of $h$. The quotient surface is a torus.

The boundary vertices are the lattice points of heights $0,\ldots,L-1$. At a vertex $x$, the cubes with lowest and highest possible lower-corner heights have lower corners $x-(1,1,1)$ and $x$, respectively. They lie on different sides exactly in that range. Similarly an edge in direction $e_i$ with lower endpoint of height $u$ belongs to the boundary exactly when $0\le u<L-d_i$. A square in directions $e_i,e_j$ with lower corner of height $u$ belongs to it exactly when $0\le u<d_k$, where $k$ is the remaining index. These facts follow by comparing the cubes incident on the edge or square. In the quotient, vertices of the same height coincide, and every integer height occurs by coprimality. We can therefore mark a vertex occupied precisely when its height belongs to the given avoiding set. Each edge has at most one occupied endpoint.

### Sign the edges with two empty endpoints

Call an edge a defect if both endpoints are empty. Every square has an even number of defects. Indeed, each occupied corner removes its two incident sides from the four possible defects, and occupied corners are never adjacent. Form the dual graph on the squares, with a dual edge across each defect. Its degrees are even, so its edges can be oriented along Euler circuits with equal indegree and outdegree at every square.

Orient the torus. Assign each oriented surface edge $e$ a number $f(e)$ as follows. A nondefect gets zero. A defect gets $+1$ or $-1$ according to the direction in which its oriented dual edge crosses it. Reversing $e$ negates $f(e)$. The sum of $f$ around the boundary of every square is zero, since it counts signed dual crossings at a balanced vertex.

On the stepped plane the sum of the lifted $f$ along a path depends only on its endpoints. Every closed edge path in this simply connected square tiling is a sum of oriented square boundaries as an integer chain. For $v\in K$, write $H(v)$ for the sum along a path from a fixed vertex to its translate by $v$. Path independence and translation invariance imply that this sum is the same for any starting vertex and that $H:K\to\mathbb Z$ is additive. For example, translating a path joining two starting vertices by $v$ gives the same edge sum, so those two contributions cancel on the closed path comparing the starting vertices.

**Parity fixes the periods.** On any edge from $u$ to $u'$, we have $f(e)\equiv1+1_A(u)+1_A(u')\pmod2$, with the indicators evaluated at the vertex heights. The indicator terms cancel on any closed quotient walk. A lift ending at displacement $v$ has length congruent to $v_1+v_2+v_3$ modulo two. Hence $H(v)\equiv v_1+v_2+v_3\pmod2$ on $K$. In particular there are three **odd** integers $w_i$ such that $H(v)=w\cdot v$ for all $v\in K$. To see the integral extension explicitly, choose $u\in\mathbb Z^3$ with $h(u)=1$. The integer homomorphism $v\mapsto(H(v)-\sum_i v_i)/2$ on $K$ extends to $\mathbb Z^3$ by evaluating it at $x-h(x)u$. Twice the coefficients of this extension, plus one in each coordinate, give $w$.

### Read the three interval counts on the same torus

Fix $i<j$, put $p=d_i+d_j$ and $g=\gcd(d_i,d_j)$. On $0,\ldots,p-1$ the permutation $u\mapsto u+d_i\pmod p$ follows a positive $e_i$ edge when $u<d_j$ and a negative $e_j$ edge otherwise. All these edges belong to the surface. Its $g$ cycles have length $p/g$. Each lifts to displacement $(d_j/g)e_i-(d_i/g)e_j$, since the cycle uses $d_j/g$ positive steps and $d_i/g$ negative steps. Thus the sum of the signed edge values over all the cycles is $d_j w_i-d_i w_j$.

The cycles contain exactly $p-2P_{ij}$ defect edges in total. Each occupied vertex accounts for its two incident cycle edges, and no edge is counted by two occupied vertices. Since $|f|$ is the defect indicator, we obtain simultaneously for all three pairs
$$
|d_jw_i-d_iw_j|\ \le\ d_i+d_j-2P_{ij}
\ \le\ (d_i+d_j)(1-2\delta). \tag{2}
$$

Set $E=1-2\delta\ge0$. Inequality (2) says precisely that the three closed real intervals
$$
\left[\frac{w_i-E}{d_i},\frac{w_i+E}{d_i}\right]
$$
intersect pairwise. Thus they have a common point $x$. Each $d_i x$ is within $E$ of the odd integer $w_i$, so its distance from every even integer is at least $1-E=2\delta$. The single rotation $t=x/2$ satisfies $\|d_i t\|\ge\delta$ for every $i$. This proves (1).

## From intervals to density and attainment

At each position in any avoiding set on the line, apply (1) to the next $L$ sites. At least one block starting there, of length $d_i+d_j$, has density at most $\kappa(D)$. Take that block and repeat at its right endpoint. In any interval of length $N$ the complete blocks contain at most $\kappa(D)$ times their total length in occupied sites, and the final unused piece has length less than $L$. This gives the uniform bound $|A\cap I|\le\kappa(D)N+L$, and hence the upper density bound. For a common divisor $g>1$, partition into classes modulo $g$ and apply the primitive result for $D/g$ in each class. Their sum gives the same asymptotic upper bound. Also $\kappa(D)=\kappa(D/g)$ since multiplication by $g$ maps the circle onto itself.

For completeness, the maximum defining $\kappa$ occurs at some $t=j/p$ with $p=d_i+d_j$ for a pair $i<j$. The maximized function is the lower envelope of three triangular waves. Its positive maximum, if strictly below $1/2$, must have active linear pieces of opposite slopes. Otherwise a small displacement in one direction increases every active wave. At such a crossing $d_i t$ and $d_j t$ have opposite signed distances of equal magnitude from integers, so $(d_i+d_j)t$ is integral. If the maximum is $1/2$, every wave equals $1/2$ there and the same integrality holds. The maximum is positive because sufficiently small positive $t$ makes every wave positive.

Reduce this maximizing fraction to $t=u/q$ and put $H=q\kappa(D)$. It is an integer. Take the centers $n$ with $un\bmod q$ in $\{0,\ldots,H-1\}$. These residues give density $H/q$, since $u$ is a unit modulo $q$. A difference between two centers has circular residue distance less than $H$ after multiplication by $u$, whereas each forbidden difference has distance at least $H$. This attains $\kappa(D)$, and $q$ divides the pair sum $p$. Thus $p$ is a period of the construction.

For example, for $D=\{2,5,9\}$ the finite maximum over the three pair sums is $3/7$, attained at $t=2/7$. The residues $0,1,4$ modulo $7$ attain this density. The upper bound applies to every avoiding set.

## An algebraic check on the period argument

One can also obtain the odd vector without using the topology of the stepped plane. Write $F_i(t)$ for the signed value on the positive $i$-edge at height $t$. The square equations are
$$
F_i(t)+F_j(t+d_i)=F_j(t)+F_i(t+d_j)
$$
whenever the four heights are inside the window. Extend the occupancy indicator to be zero outside. We claim the edge values extend integrally to all integer heights, preserving both the square equations and the parity $F_i(t)\equiv1+1_A(t)+1_A(t+d_i)\pmod 2$. Outside the original window their magnitudes may grow.

To add the next height $T\ge L$, the only new unknowns are $u_i=F_i(T-d_i)$ on the three incoming edges. Each square with upper height $T$ prescribes the difference of two of the $u_i$. These three differences sum to zero around the cube with lower height $T-L$, because the three opposite squares are already closed. More explicitly, the alternating sum of all six square boundaries of a cube cancels every edge. Thus one can choose $u_1$ freely and solve for $u_2,u_3$ in integers. Choose $u_1$ of the prescribed parity. The other parities follow because the prescribed edge parities themselves sum to zero around every square. Continue upwards, then perform the reflected construction downwards with outgoing edges at each new lowest height.

Pull the extended values back to the whole cubic lattice by height. Their sum on any closed lattice walk vanishes, since steps in different coordinate directions may be interchanged across elementary squares and opposite steps cancel. Integrating therefore gives a potential. Translating by $K$ preserves all edge values, so potential differences under these translations are an integer homomorphism on $K$. Its parity is the coordinate sum by the prescribed edge parities. The same integral extension on $K$ as above yields odd $w_i$. All pair cycles used in (2) remain inside the original window, where the absolute values still count defects.

## Verification and priority

The [verifier](verify.py) constructs the dual orientations, checks every square sum and reconstructs an odd period vector and common rotation from the signed pair cycles. It uses only standard Python and can be run with `python3 results/haralambis-three-differences/verify.py`. The general proof uses no computational assumption. A literature search located the conjecture, earlier special cases and the known character bound. We found no earlier resolution for arbitrary triples. Priority remains provisional.

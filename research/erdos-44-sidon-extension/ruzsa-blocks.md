# A uniform mixed-sum count and an obstruction for Ruzsa blocks

Write $L=p(p-1)$ for a prime $p$. Consider any affine image, under a translation and invertible multiplier, of the classical cyclic Ruzsa Sidon set in $\mathbb Z/L\mathbb Z$. Write $B$ for its representatives in $[0,L)$. There are a primitive element $h\in\mathbb F_p^{\times}$, $d\in\mathbb F_p^{\times}$ and $e\in\mathbb F_p$ such that membership of the integer $a$ in the modular set is given by
```math
 h^a=d(a-e)\pmod p.
```
Indeed the original condition is $g^a=a\bmod p$; substituting an inverse affine map gives the indicated equation. In particular the parameters $x=h^a$ run over all nonzero field elements, with $a\equiv e+x/d\bmod p$ and $a\equiv\log_h x\bmod{p-1}$. The set is Sidon because a pair sum gives the sum and product of its field parameters.

## An outsider costs a positive fraction

For every $b\in[0,L)\setminus B$, uniformly in $b$ and the affine image, adjoining $b$ to an arbitrary subset of $B$ while preserving the integer Sidon property requires deleting at least $(1/8-o(1))p$ members of $B$. The count is for equality in the integers.

Put $t=h^b$, $s=d(b-e)$. The modular equation $a(x)+a(y)-a(z)=b\bmod L$ requires $x+y-z=s$ and $xy/z=t$. Thus
```math
 (x-t)(y-t)=t(t-s),\qquad z=xy/t .
```
An outsider has $t\ne s$, so $y=t+t(t-s)/(x-t)$. All but $O(1)$ nonzero $x$ give a unique solution with both $y,z$ nonzero. The two positive coordinates $(a(x)/L,a(y)/L)$ equidistribute on the unit square, uniformly in all parameters. To see this, put $\chi(x)=\exp(2\pi i\log_h(x)/(p-1))$. Up to a constant phase, the integer Fourier mode $(i,j)$ of the sum over $x$ is
```math
 \sum_x\chi(x^i y^j)\exp\bigl(-2\pi i(i x+j y)/(dp)\bigr),
```
where division by $d$ in the additive character is computed in $\mathbb F_p$. For $j\ne0$ and large $p$ the additive rational function $(ix+jy)/d$ has a simple pole at $x=t$. For $j=0$ and $i\ne0$ the additive function has a simple pole at infinity. The mixed Weil bound gives $O_{i,j}(\sqrt p)$ in both cases; the degrees for each fixed mode are uniformly bounded. Trigonometric approximation gives the asserted equidistribution. [Cochrane and Pinner, mixed rational-function sums](https://www.math.ksu.edu/~cochrane/research/stepmix.pdf).

The integer equation selects the band $b/L\le u+v<b/L+1$ in the square. Its area is at least $1/2$ for $b/L\in[0,1]$. Convergence for these moving bands is uniform: partition the square into fixed small boxes, and the boxes meeting a boundary line have uniformly vanishing total area as the mesh tends to zero. Thus at least $(1/2-o(1))p$ ordered triples give an actual collision. None can be an identical pair, since $b\notin B$. A specified member of $B$ occurs in at most one triple in each positive position, and at most two triples in the negative position since the remaining field sum and product are prescribed. Each deletion therefore eliminates at most four triples.

The Sidon prefix $`A=\{1,2,4,8\}`$ cannot lie inside **any** such affine Ruzsa block when $p>3$. Its positive differences are $1,2,3,4,6,7$. If all four exponents satisfied the membership equation, $h^j$ would agree with the linear polynomial $1+j(h-1)$ at $j=0,1,3,7$, after shifting by one and normalizing. The cubic identity forces $(h-1)^2(h+2)=0$. A primitive $h$ is not $1$, hence $h=-2$. The identity at seven now forces $p$ to divide $108$, a contradiction. Consequently a Sidon set containing $A$ includes at most $(7/8+o(1))p$ representatives of any such block. This conclusion also permits points outside that block. The separate perfect-difference-set obstruction of [Alexeev and Mixon](https://arxiv.org/abs/2510.19804) concerns a different family.

## An explicit extension coefficient

For any fixed prefix of size $k\ge1$ and $0<\delta<1$ choose the new block $m+B$ with $m=\lfloor(1-\delta)L\rfloor$. With $M=m+L$ the attainable limiting coefficient is at least
```math
 \frac{1-k\delta^2/4}{\sqrt{2-\delta}} .
```
For each old point $a$, the target for $B+B-B$ is the **negative integer** $a-m$. If its residue is an outsider, the same two-coordinate argument shows that the ordered collisions are $(\delta^2/2+o(1))p$, since the region is now $u+v<1+(a-m)/L=\delta+o(1)$. The diagonal $x=y$ has at most two solutions to the nondegenerate hyperbola equation. Thus at most $(\delta^2/4+o(1))p$ unordered collisions need a deletion. If the residue is a modular member, the Sidon property forces every modular solution to have one of its positive elements equal to that member and the other equal to the negative element. Its actual integer difference cannot equal the negative integer $a-m$. There are then no collisions to delete. Summing the deletions over the $k$ targets and handling the other collision types as in the [elementary argument](averaged-block.md) proves the estimate. It improves the half-interval coefficient for every fixed $k$ by taking $\delta$ sufficiently small.

The original question concerns arbitrary extending sets. The obstacle above rules out preserving a nearly complete affine Ruzsa block for this prefix, and the construction gives no coefficient tending to one for general prefixes. [Erdős #44](https://www.erdosproblems.com/44).

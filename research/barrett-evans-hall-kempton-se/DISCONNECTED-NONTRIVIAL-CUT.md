# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Partial result.** The $SE(s)$ bound is true for every one-fractional-edge weighting in which either rounding to a disconnected graph produces no singleton component, or produces at least three components. This includes every nontrivial disconnected rounding whose two components both have order at least two. The complementary version holds by symmetry.

Let $n\ge5$, and write $G=H+s e$ with $H$ a disconnected simple graph, $e=uv$ and $0<s<1$. Let $x=\lambda_2(G)$ and $y=\lambda_2(G^c)$. As in the [one-fractional-edge reduction](ONE-FRACTIONAL-EDGE.md), $x,y\ge0$, $x+y\le n$ and a violation of $F=x+y-2xy/n\ge1$ requires $x,y<1$. We show $F>1$ in the connected-support cases below whenever $y<1$.

## Reductions

If the fractional edge fails to connect the support, $x=0$. The complement contains a spanning complete multipartite graph with parts the support components of $G$ and with all cross weights one. Hence $y\ge1$, proving the bound. This covers every $H$ with at least three components and also the case where $e$ lies inside one of two components.

Otherwise $H$ has two components $C,D$ with $2\le |C|\le |D|$, and $u\in C,v\in D$. If $|C|\ge3$, then $\lambda_n(H)\le |D|\le n-3$. Adding the weighted edge changes the Laplacian by a rank-one matrix of norm $2s<2$, so $\lambda_n(G)<n-1$, hence $y>1$.

Assume therefore $|C|=2$ and write $`C=\{u,u'\}`$. If $v$ has some nonneighbor $z$ inside $D$, then the complement of $H+e$ has diameter at most two. Indeed every cross pair except $uv$ is adjacent; $u,z,v$ joins that pair in two steps; the two $C$ vertices share any neighbor in $`D\setminus\{v\}`$; and two $D$ vertices share $u'$. The simple diameter-two bound gives $\lambda_2((H+e)^c)\ge1$; decreasing $s$ only increases this connectivity. The diameter-two bound is [Einollahzadeh–Karkhaneei, Lemma 5](https://arxiv.org/abs/1901.02047); it follows because a Fiedler vector for an eigenvalue below one has opposite-sign extrema and all neighbors of each extremum have the same strict sign as that extremum, so the two extrema must be more than two steps apart.

## Universal attachment on the large component

The only remaining setup for this note has $v$ universal in $D$. Delete all edges of $`H[D\setminus\{v\}]`$ to obtain the weighted double star $T_s$, a star with a pendant path of length two and fractional inner edge. Write $`W=D\setminus\{v\}`$, so $|W|=n-3$. The subspace of vectors constant on $W$ has exactly the same action for $L(G)$ and $L(T_s)$. Its orthogonal complement consists of zero-sum vectors supported on $W$. There $L(G)$ is $I+L(H[W])$, of norm at most $1+|W|=n-2$, since a simple graph Laplacian is dominated by its complete graph Laplacian. Thus whenever $y<1$, the eigenvalue $\lambda_n(G)>n-1$ comes from the common quotient and equals $\lambda_n(T_s)$.

Indeed, on the parts $(u',u,v,W)$ the quotient matrix has rows
```math
(1,-1,0,0),\quad (-1,1+s,-s,0),\quad
(0,-s,s+n-3,-(n-3)),\quad(0,0,-1,1).
```
Besides zero its eigenvalues are the three roots of
```math
p_s(z)=z^3-(n+2s)z^2+(ns+2n+2s-4)z-ns.
```
At most one eigenvalue of $T_s$ can exceed $n-2$: it is a positive rank-one update of $K_2\sqcup K_{1,n-3}$, whose maximum eigenvalue is $n-2$, and the update vanishes on a codimension-one subspace. Since $\lambda_n(T_s)>n-1$, this forces
```math
p_s(n-1)=(n-2)^2(1-s)-1<0,
```
so $s>1-(n-2)^{-2}\ge 8/9$.

At $s=1$ the comparator $T_1$ is precisely the $n$-vertex dandelion of [Barrett–Evans–Hall–Kempton, Theorem 4.4](https://arxiv.org/pdf/2201.04225#page=16). Their bounds give $\lambda_2(T_1)>2-\varphi$ and $n-\lambda_n(T_1)>1-1/n$ for $n\ge5$, where $\varphi=(1+\sqrt5)/2$. By $L(G)\succeq L(T_s)\succeq sL(T_1)$ and $\lambda_n(T_s)\le\lambda_n(T_1)$,
```math
x>s(2-\varphi)>(8/9)(2-\varphi)>1/3\ge 1/(n-2),
\qquad
y>1-1/n.
```
Consequently
```math
F=y+x(1-2y/n)>1-1/n+\frac{1}{n-2}(1-2/n)=1,
```
using $y<1$. No numerical search is needed to certify the result.

## Remaining one-edge configurations

After this result and the [opposite disconnected endpoint classification](ONE-FRACTIONAL-EDGE.md), possible counterexamples have either all four unweighted endpoint connectivities positive, or, exchanging the roles of the weighting and its complement, a disconnected rounding with exactly two components and an isolated endpoint whose partner is not universal in the other component. Simple graphs are also part of the open remainder. No full resolution is claimed.

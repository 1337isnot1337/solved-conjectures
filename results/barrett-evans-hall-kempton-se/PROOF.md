# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

Let the weights on the pairs of $`n\ge5`$ vertices be $`w_{ij}\in[0,1]`$, with complement weights $`1-w_{ij}`$. Write $`x=\lambda_2(G)`$ and $`y=\lambda_2(G^c)`$ for the algebraic connectivities. We prove [Conjecture 6 and the following equality remark](https://arxiv.org/pdf/2201.04225#page=24):
```math
F(x,y):=x+y-2xy/n\ge1,
```
and, if $`x,y<1`$, equality holds exactly for $`SE(s)`$ with $`0<s<1`$. In $`SE(s)`$ the distinguished pair $`uv`$ has weight $`s`$, the other edges at $`u`$ have weight zero, those at $`v`$ have weight one, and the weights among the remaining vertices are arbitrary.

## 1. Simple endpoint theorem

For every simple $`G`$ with both $`G,G^c`$ connected,
```math
M(x,y):=\min\{(1-2/n)x+y,\ x+(1-2/n)y\}=x+y-2\max(x,y)/n>1. \tag{1}
```
The proof is split into three disjoint order ranges. For $`n\ge36`$ see the [analytic estimate](EXPLICIT-THRESHOLD.md). For $`11\le n\le35`$, use the [diameter estimates](DIAMETER-FOUR.md) if either connectivity is at least one; otherwise use the [rational comparison certificates](FINITE-COMPARATORS.md). For $`5\le n\le10`$, the [small-order verifier](check_small_graphs.cpp) enumerates all connected simple graphs up to isomorphism and certifies (1) when the complement is connected; the exact calculation and counts are explained in the [audit](AUDIT.md#orders-five-through-ten).

### A path bound on the coordinate range

For use in the analytic component, let $`a`$ be mean-zero and unit, with maximum $`P>0`$, minimum $`-N<0`$, and range $`R=P+N`$. Take a simple path joining the extrema in a connected simple graph. On the path write $`p_i=\max(a_i,0)`$ and $`m_i=\max(-a_i,0)`$. Telescoping the two squares in opposite directions gives
```math
P^2+N^2=\sum_i (p_i-p_{i+1})(p_i+p_{i+1})-\sum_i(m_i-m_{i+1})(m_i+m_{i+1}).
```
The sum of squared edge differences of these parts is bounded by the original energy $`E`$. The sum of squares of the adjacent sums of both parts is at most $`4\sum_i a_i^2-2(P^2+N^2)`$ by $`(u+v)^2\le2u^2+2v^2`$. Thus
```math
E\ge\frac{(P^2+N^2)^2}{4-2(P^2+N^2)}\ge\frac{R^4}{16-4R^2}. \tag{2}
```
The last step uses $`P^2+N^2\ge R^2/2`$ and monotonicity of the fractional expression on $`[0,1]`$. In particular (2) applies to a unit Fiedler vector and its algebraic connectivity.

## 2. At most one visible fractional edge

The identity $`L(w)+L(1-w)=nI-J`$ gives $`x+y\le n`$. Hence $`F\ge(x+y)/2`$. A global minimizer exists, and the authors’ $`SE(s)`$ examples have $`F=1`$ by [Theorem 4.8](https://arxiv.org/pdf/2201.04225#page=22). Therefore both connectivities of any minimizer are in $`[0,2]`$. On that square $`F`$ is strictly increasing in each coordinate since $`n\ge5`$.

Fix unit mean-zero Fiedler vectors $`a,b`$ at a minimizer. For an unoriented pair $`e=ij`$ let $`A_e=(a_i-a_j)^2`$ and $`B_e=(b_i-b_j)^2`$. At any feasible weight vector $`z`$ their energies are $`U(z)=\sum_e z_eA_e`$ and $`V(z)=\sum_e(1-z_e)B_e`$. The Rayleigh principle bounds the new connectivities from above by $`U,V`$. Near the minimizer these energies are strictly below $`n/2`$, so $`F(U,V)`$ cannot decrease in any feasible direction. Differentiating in a fractional coordinate gives
```math
(1-2y/n)A_e=(1-2x/n)B_e.
```
In particular a fractional pair is either invisible to both vectors ($`A_e=B_e=0`$) or nonzero for both.

If two distinct fractional pairs $`e,f`$ were visible, vary their weights in the direction $`(A_f,-A_e)`$ for a sufficiently small nonzero step. The derivative relation makes both energies exactly unchanged. The two actual eigenvalues therefore cannot increase, and global minimality and strict coordinate monotonicity force both to stay unchanged. Thus $`a`$ still attains the Rayleigh minimum and is still an eigenvector in the changed graph. Subtracting the eigenvector equations would give a nontrivial linear dependence between the two pair-incidence vectors, which is impossible for distinct pairs. There is at most one visible fractional pair.

Round every invisible fractional pair to zero or one, simultaneously and arbitrarily. The two test energies are unchanged. The same argument forces both connectivities to remain unchanged. We have reduced every minimizer to a graph with at most one fractional pair.

## 3. Interpolation to all weighted graphs

We need only treat graphs $`H+t e`$ with $`H`$ simple, $`e`$ a nonedge, and $`0<t<1`$, and the simple graphs themselves. Any disconnected weighted support has a unit complete multipartite graph in its complement across the components; hence its complement has algebraic connectivity at least one, proving $`F\ge1`$ in that case. If both supports are connected and $`\max(x,y)\ge1`$, then $`F>1`$ whenever $`F\le1`$ would be possible: by $`F\ge(x+y)/2`$ we would have $`x+y\le2`$, so whichever term is at least one has a positive coefficient for the other term in $`F=x+(1-2x/n)y`$ or its symmetric version. Thus consider only $`x,y<1`$.

Along the segment from $`H`$ to $`H+e`$, both connectivities are concave because each is the minimum of affine Rayleigh functions on the same mean-zero sphere. If every simple endpoint support is connected, both linear forms in (1) are greater than one at both endpoints and hence at every interior point. If only $`H`$ is disconnected, its endpoint has $`x=0,y\ge1`$, so the form $`(1-2/n)x+y`$ is at least one there and strictly greater at the other endpoint. This form is strictly greater than one along the open segment. If only $`(H+e)^c`$ is disconnected, use the other linear form. When both connectivities are less than one $`F`$ is at least either form, since $`F-((1-2/n)x+y)=(2x/n)(1-y)\ge0`$, and symmetrically. The simple graphs also follow from (1) or the disconnected-support argument.

It remains to handle opposite disconnected endpoints with both weighted supports connected. The component partitions of $`H`$ and $`(H+e)^c`$ each have two parts, and the endpoints $`u,v`$ of $`e`$ are in different parts of each partition. A pair crossing in both partitions must be $`uv`$: every other pair crossing the partition of $`H`$ is present in $`(H+e)^c`$. Any third vertex in the $`H`$-part of $`u`$ must therefore lie in the other partition’s part of $`v`$, and conversely. If both $`H`$-parts had third vertices, choosing one from each would give a further doubly crossing pair. Thus one part of the first partition is a singleton, say $`u`$, and the opposite part of the second partition is the singleton $`v`$. This is precisely $`SE(t)`$, hence has $`F=1`$ by Theorem 4.8.

All rounded minimizers satisfy $`F\ge1`$, so all original weights do. Suppose now an original graph has $`F=1`$ with $`x,y<1`$. It is a minimizer. Its rounding must be $`SE(t)`$, since that was the only equality case of the interpolation under these strict hypotheses. In $`SE(t)`$ the first Fiedler vector is constant on the nondistinguished part: modes of sum zero within that part have eigenvalues at least one, as the edges to $`v`$ add the identity there. Its three coordinate levels are pairwise different. If the core level equals that of $`v`$, a core row gives zero for that level, and the sum-zero condition makes the level at $`u`$ zero. If the core level equals that of $`u`$, eliminate the level at $`v`$ by the core equation, then the row at $`u`$ gives $`(1-t)x a_u=0`$. If the two distinguished levels are equal the row at $`u`$ immediately gives zero and the rest follow. Thus no rounded edge incident to either distinguished vertex could have been invisible to $`a`$. The original graph was already $`SE(t)`$.

### The corners

For completeness, equality with at least one connectivity at least one is possible only at $`(0,1)`$ or $`(1,0)`$. At $`(0,1)`$ the support of $`G`$ is disconnected, and its largest Laplacian eigenvalue is $`n-1`$. A component of size $`m`$ has largest eigenvalue at most $`m`$, by complementing its weights on that component. So the support consists of an isolated vertex and a component of size $`n-1`$. The complement within this large component must be disconnected, since its algebraic connectivity is $`(n-1)-(n-1)=0`$. These conditions also suffice, and the other corner is symmetric.

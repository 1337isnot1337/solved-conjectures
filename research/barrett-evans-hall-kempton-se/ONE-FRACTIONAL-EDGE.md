# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Research checkpoint.** [Conjecture 6](https://arxiv.org/pdf/2201.04225#page=24) concerns a weighted graph on $n\ge5$ vertices with weights $w_{ij}\in[0,1]$ and complement weights $1-w_{ij}$. If $x$ and $y$ are the two algebraic connectivities, it asserts
\[
F(x,y):=x+y-\frac{2xy}{n}\ge1.
\]
The authors’ $SE(s)$ weighted graphs attain equality and are conjectured to be the only equality cases with $x,y<1$. This note reduces the universal inequality to graphs with at most one fractional edge, and proves the conjecture throughout the case in which both complementary endpoint connectivities vanish at opposite ends of that edge. It leaves the remaining endpoint cases open.

## Fractional edge reduction

Because $L(w)+L(1-w)=nI-J$, one has $x,y\ge0$ and $x+y\le n$. Hence $F(x,y)\ge(x+y)/2$. For $n\ge5$, if $F(x,y)\le1$ then $x+y\le2<n/2$. On this range $F$ is strictly increasing in each coordinate; moreover $F(x,y)<1$ implies $x,y<1$, since if $x\ge1$ then $F=x+(1-2x/n)y\ge1$, and likewise for $y$.

Fix unit Fiedler vectors $a,b$ perpendicular to the all-one vector for respectively $w$ and $1-w$. Write $A_e=(a_i-a_j)^2$ and $B_e=(b_i-b_j)^2$ for $e=\{i,j\}$. Consider the linear program
\[
\text{minimize } \sum_e (1-z_e)B_e,\quad
\sum_e z_e A_e=x,\quad 0\le z_e\le1.
\]
The current weights are feasible. An extreme-point optimizer has at most one fractional coordinate: with two fractional coordinates there is a nonzero perturbation on just those coordinates in the kernel of the single equality. At this optimizer the Rayleigh principle bounds the new connectivities by $x$ and $y$ coordinatewise. Hence any violation has a violation with at most one fractional edge. The same argument preserves both connectivities exactly if applied to an original global minimizer of $F$ with $F\le1$, because strict monotonicity would otherwise improve the minimum.

## Additional structure at a minimizer

A global minimizer exists by compactness and has $F\le1$ by the known $SE(s)$ equality examples. For fixed Fiedler vectors at such a minimizer, the test-vector objective
\[
z\longmapsto F\left(\sum_e z_e A_e,\sum_e(1-z_e)B_e\right)
\]
is also minimized locally there. Indeed its arguments stay below $n/2$ in a neighborhood, and each bounds the corresponding true eigenvalue from above. In particular set $c=1-2y/n$, $d=1-2x/n$. At this optimizer:
- If $cA_e-dB_e>0$, the edge has weight $0$.
- If $cA_e-dB_e<0$, it has weight $1$.
- An edge with fractional weight has $cA_e=dB_e$.

Writing $p=\sqrt c\,a+\sqrt d\,b$ and $q=\sqrt c\,a-\sqrt d\,b$, the strict cases are determined by the sign of $(p_i-p_j)(q_i-q_j)$: weight $1$ for order inversions and weight $0$ for order agreements. Edges tying in at least one order require separate treatment. This is not a claim that an arbitrary tie pattern can be represented by two strict total orders.

At a global minimizer, at most one fractional edge can have $A_e+B_e>0$. Indeed, if two such edges $e,f$ are fractional, their cost vectors are proportional by the tie equation, and both $A_e,A_f$ are positive. Vary the two weights in the feasible direction $(A_f,-A_e)$ for a small nonzero step. Both test-vector energies remain fixed. Since the true connectivities cannot improve the global minimum, both are unchanged as well, and $a$ must still be the first Fiedler vector. Subtracting its two eigenvector equations gives
\[
A_f(a_i-a_j)(\mathbf e_i-\mathbf e_j)
-A_e(a_k-a_\ell)(\mathbf e_k-\mathbf e_\ell)=0
\]
for $e=\{i,j\}$ and $f=\{k,\ell\}$. This is impossible: distinct unoriented edges have linearly independent incidence vectors, and both coefficients are nonzero.

All fractional edges invisible to both eigenvectors can be rounded simultaneously in any way at a minimizer. The fixed vectors give unchanged upper bounds and strict monotonicity and global minimality force equality. If such a rounding is an $SE(s)$ graph with $0<s<1$, changing those invisible edges could not have changed any edge incident to either distinguished vertex. To see this, in $SE(s)$ the first Fiedler vector is constant on the other $n-2$ vertices and has three different coordinate levels on the three parts. It is constant on the large part because its zero-sum internal modes have Laplacian eigenvalue at least $1$ whereas $x<1$. If a distinguished vertex shared a level with the large part, the large-part row equation and then the edge of weight $s$ rule out a nonzero eigenvector. If the two singleton levels agreed, the pendant row would give $x a_u=0$ and then all entries would vanish. Thus invisibility only allows edges internal to the large part, already arbitrary in $SE(s)$. This would transfer the strict equality characterization back from the rounded case.

## Opposite disconnected endpoints

Let $H$ be the simple graph of edges with weight $1$, and let $e=uv$ be the only fractional edge, of weight $s$. Suppose $H$ and the complement of $H+e$ are both disconnected. If the positive-weight supports of the weighted graph and its complement are not both connected, then one of $x,y$ is zero, and the other is at least $1$ by the ordinary weighted spread bound (or by the complete join across support components).

Otherwise $e$ joins two components of $H$ and also two components of the complement of $H+e$. Call these component partitions $P$ and $Q$. The only pair allowed to cross both partitions is $uv$: any other pair crossing $P$ must be an edge of the complement of $H+e$. Both partitions have exactly two parts since adding $e$ yields a connected support.

Every third vertex in the part of $u$ in $P$ must then be in the part of $v$ in $Q$; similarly every third vertex in the part of $v$ in $P$ must be in the part of $u$ in $Q$. If both parts of $P$ contain third vertices, choosing one of each gives another pair crossing both. Thus one part of $P$ is a singleton, say $u$, and the opposite part of $Q$ is the singleton $v$. It follows that $u$ has weights zero to all other vertices except $v$, and $v$ has weights one to all other vertices except $u$. This is exactly $SE(s)$ and [Theorem 4.8](https://arxiv.org/pdf/2201.04225#page=22) gives equality in the conjecture.

## What remains

The reduction leaves simple graphs, plus one-fractional-edge graphs whose endpoints do not have the opposite disconnected configuration. No finite-order check is being offered as a resolution. The 2021 ordinary spread theorem, the 2023 weighted balanced extension, and Li–Ji’s [2026 elementary reproof](https://arxiv.org/abs/2607.03711) address the weaker $x+y\ge1$, not the term $2xy/n$.

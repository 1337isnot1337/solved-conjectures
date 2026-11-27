# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Exact finite comparators.** This component covers all weighted graphs of order at least 11. The orders 11–35 rely on the included exact Python verifier, not numerical eigenvalues. The orders at least 36 use the separate [analytic proof](EXPLICIT-THRESHOLD.md).

Let $`x=\lambda_2(G),y=\lambda_2(G^c)`$ for a simple graph with both supports connected. The [diameter checkpoint](DIAMETER-FOUR.md) settles $`\max(x,y)\ge1`$ at these orders. For $`x,y<1`$, both diameters are three. Use $`R_a,R_b`$ for the ranges of mean-zero unit Fiedler vectors, and take the graph with $`R_a\ge R_b`$ as $`G`$. If the strict endpoint bound fails, the fourth-moment and path estimates give
```math
xy\ge 1/6,\qquad x+y\le 1+2/n,\qquad R_a^2 \ge n/(n+2).
```

Let $`u,v`$ be extrema of the Fiedler vector of $`G`$. Their distance is three by [Einollahzadeh–Karkhaneei, Lemma 5](https://arxiv.org/pdf/1901.02047#page=6). Take a maximum collection of $`s`$ internally disjoint length-three paths. Let $`J`$ index the matched vertices next to $`v`$, $`K`$ those next to $`u`$, with corresponding matching edges. Let $`A=N_G(u)\setminus K`$, $`B=N_G(v)\setminus J`$, and $`C`$ be the remaining vertices other than $`u,v,J,K`$. Write $`a,b,c`$ for their sizes. Let $`\ell`$ be the maximum number of $`G`$-neighbors of a single vertex of $`J`$ in $`A`$ or of a single vertex of $`K`$ in $`B`$, allowing zero. The original conductance and comparison estimates (3) and (10), retaining the squared range before inequality (3), yield
```math
x\ge X=\frac{n}{n+2}\left(\frac{s-1}{3}+\frac{\ell+1}{\ell+3}\right),
\qquad 
y\ge\frac{n}{n+2+3s^2+6s\ell}.
```

The following edges always occur in $`G^c`$: the star from $`u`$ to $`v,B,C,J`$; the edges from $`v`$ to $`A,C,K`$; and every edge from $`A`$ to $`B`$. The last assertion holds because a $`G`$-edge there gives an additional disjoint path. For $`s=1`$ the nonempty bipartite graph of $`G`$ between $`N_G(u),N_G(v)`$ has matching number one, so all its edges share a center. Swap $`u,v`$ if necessary so the center is in $`J`$. Then exactly $`\ell`$ members of $`A`$ lack the edge to the sole member of $`J`$ in $`G^c`$, and every member of $`B`$ is a neighbor of the sole member of $`K`$ in $`G^c`$. Include these extra forced edges in the comparator.

Where this initial comparator does not suffice and $`s=2`$ or $`3`$, split both $`A`$ and $`B`$ into cells indexed by their $`G`$-adjacency masks to respectively $`J`$ and $`K`$. List all nonnegative cell-size vectors summing to $`a,b`$ with maximum column sum $`\ell`$. Reject a mask count if both members of some matched pair have unmatched neighbors on the opposite side in $`G`$: those two edges augment the matching. Add the complementary edges prescribed by each retained mask. There is no need to characterize all feasible masks exactly, since keeping an impossible mask only creates an additional comparator to check.

The one remaining comparator at $`n=11`$ has $`(s,a,b,c,\ell)=(1,7,0,0,7)`$. Let $`j`$ be the member of $`J`$. In $`G`$, $`v`$ is a leaf joined to $`j`$, and $`u,j`$ are both joined to all eight other vertices. In $`G^c`$ the edges $`uv,uj`$ and all edges from $`v`$ to those eight vertices are forced. Using these edges separately gives $`x>7/10`$ and $`y>3/7`$, which gives the strict bound.

## Exact certificate

For either coordinate the function $`L(x,y)=x+y-2\max(x,y)/n`$ is strictly increasing. Put $`d=1-2/n`$. If $`X\ge1`$ it contradicts the branch hypothesis. If $`X^2\ge1/(6d)`$ and $`dX+1/(6X)>1`$, then on $`x\ge X`$ the derivative of $`dx+1/(6x)`$ is nonnegative and $`x\ge1/(6x)`$, so the product bound settles it. Otherwise let
```math
q=\begin{cases}
(1-X)/d,&(1+d)X\le1,\\
1-dX,&(1+d)X>1 .
\end{cases}
```
This is the unique $`q`$ with $`L(X,q)=1`$. Certify $`y>q`$ with the published lower bound or by a comparator.

Each comparator is a blowup of a graph on cells, with no edges inside a cell. If the nonempty cell sizes are $`m_i`$, the block-constant energy has matrix $`B=\sum_{ij\text{ an edge}}m_im_j(e_i-e_j)(e_i-e_j)^{\mathsf T}`$. The squared norm after subtracting the mean has matrix $`N=\mathop{\mathrm{diag}}(m)-mm^{\mathsf T}/n`$. Since both forms kill the constant vector, ground the last coordinate at zero. Exact integer Bareiss elimination checks positive definiteness of $`B-qN`$ after a positive scaling, using positivity of every leading principal minor. For each cell of size more than one, separately check that its within-cell zero-sum eigenvalue (its common degree) is greater than $`q`$. Together these are a certificate of $`\lambda_2>q`$, so Laplacian monotonicity proves the same inequality in the actual graph.

Run `python3 check_small_parameters.py` without Python's optimization flag. The last two columns give the number of refined-mask checks and special configurations; for 11, 12, 13 and 14 vertices they are respectively $`(36,1),(32,0),(14,0),(14,0)`$. At orders 15–35 there are no refined cases. The [one-edge interpolation](PROOF.md#3-interpolation-to-all-weighted-graphs) transfers the strict endpoint inequality to the original weighted conjecture and equality characterization.

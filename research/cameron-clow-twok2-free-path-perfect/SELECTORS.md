# A second family from Rzążewski’s selector gadgets

A distinct deduction from
[Rzążewski, Section 4](https://arxiv.org/html/2608.17835v3#S4)
gives arbitrarily large vertex-critical counterexamples at
each fixed chromatic number $k\ge9$. The selector construction
and its two-edge-freeness are Rzążewski's. The application
below is the specialization to an edgeless input and the path
obstruction argument; the cited source does not state this
application.

Take the reduction in Theorems 4.1 and 1.2 with two input
groups of size $\ell$ and no edges between them. Each group
has a four-layer selector of size $4(\ell+1)$ and its own
palette of four colors. Claims 4.1.1 and 4.1.2 identify the
proper list colorings of each selector with the choice of one
of the $\ell$ input vertices. There are $\ell^2$ independent
nonedge vertices, one for every pair of choices. Claim 4.1.3
shows that the coloring determined by a pair fails to extend
to exactly its corresponding nonedge vertex, and extends to
all the others independently.

Now apply the paper's palette-clique reduction on eight
colors, yielding a graph $H_\ell$ with a core of size
$8(\ell+1)+8$ and $\ell^2$ independent vertices outside it.
The proof of Theorem 1.2 guarantees that this reduction
preserves the absence of an induced $2K_2$ for these
instances. The eight-vertex clique forces all eight
colors in any eight-coloring; naming them by the vertices
of that clique gives exactly the preceding list-coloring
problem on the gadgets. Thus there is no eight-coloring,
but deleting any one nonedge vertex allows one. Giving
that vertex a new color proves $\chi(H_\ell)=9$.

For any fixed $k\ge9$, join $H_\ell$ to a clique of
size $k-9$. A vertex of that clique cannot be part of an
induced $2K_2$ because it is universal. The chromatic
number is $k$: the added clique needs distinct colors
not used anywhere in $H_\ell$. The deletion of any of
the $\ell^2$ nonedge vertices leaves a $(k-1)$-colorable
graph. Choose $\ell$ so large that $\ell^2$ exceeds the
new core size plus one. Any path then misses a nonedge
vertex, so its span needs at most $k-1$ colors. The
palette clique together with the joined clique gives
the matching lower bound.

An induced $k$-vertex-critical subgraph must retain
every nonedge vertex, since deleting even one lowers
the chromatic number of the whole graph. Such subgraphs
have unbounded order at fixed $k$, and none has a
spanning path, by the same independent-set count.
Their path span is exactly $k-1$ by Cameron–Clow’s
[Theorem 1.5](https://arxiv.org/html/2506.19100v1#S1.SS2).
This differs from the families of growing chromatic
number in the self-contained [two-clique proof](PROOF.md).

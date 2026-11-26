# Erdős’s four-cycle threshold conjecture

## Covering restrictions on vertex-transitive regular candidates

Let $q=2^k\ge4$ and let $G$ be a vertex-transitive $q$-regular simple $C_4$-free graph on $q^2$ vertices. A transitive Sylow 2-subgroup $P$ of its automorphism group has a nontrivial central elementary abelian subgroup $K=Z(P)[2]$. Write $m=|K|$. Then:

1. $G$ is a regular $K$-cover of a simple $q$-regular graph $Q$ on $q^2/m$ vertices. In particular $2\le m\le q/2$.
2. Every pair of distinct vertices of $Q$ has at most $m$ common neighbors, and at any vertex the sum, over the other vertices, of the deficits from $m$ is exactly $q-m$.
3. On any nontrivial $K$-character subspace, every adjacency eigenvalue $\lambda$ of $G$ satisfies $m\le\lambda^2\le 2q-m$.
4. Every fiber is a clique in the leave graph. For every quotient vertex and every $a\in K$, at least one triangle through that vertex has voltage $a$. In particular, every quotient vertex is in at least $m$ triangles.

This gives necessary conditions on a quotient and its voltage labels; it does not exclude every vertex-transitive candidate.

### Free action and the quotient

For a vertex $x$ choose a Sylow 2-subgroup of the vertex stabilizer and a Sylow 2-subgroup $P$ of the full automorphism group containing it. Orbit–stabilizer gives $|P x|=q^2$ because the degree of the transitive action is a power of two. The center of a nontrivial finite 2-group has an involution. Any central element of $P$ fixing one vertex fixes them all by transitivity and is therefore the identity; $K$ acts freely.

For any nonidentity $g$ in the center of $P$, if $x$ were adjacent to $gx$, then $y$ would be adjacent to $gy$ at every vertex $y$. Take a neighbor $y$ of $x$ other than $gx$ or $g^{-1}x$, possible since $q\ge4$. The vertices $x,gx,gy,y$ would be distinct and form a four-cycle. Thus there is no edge within a $K$-orbit. If $x$ had distinct neighbors $y,gy$ in another $K$-orbit, the involution $g\in K$ would give the four-cycle $x,y,gx,gy,x$. There is at most one neighbor per other orbit, so every quotient edge lifts to a matching bijective between its two fibers. The quotient is simple and has degree $q$, hence $q^2/m\ge q+1$. Since $m$ is a power of two this forces $m\le q/2$.

### Common-neighbor deficits and signed spectra

Choose one lift of each vertex of $Q$ and label each quotient edge by the unique displacement in $K$ between those choices along a lifted edge. Use additive notation for $K$. The label in the reverse direction is the same because all elements have order at most two.

For distinct $x,y\in V(Q)$ the length-two paths from $x$ to $y$ have pairwise distinct total labels: equal labels give two common neighbors to the same pair of lifted vertices. Thus their number $\lambda_{xy}=|N_Q(x)\cap N_Q(y)|$ is at most $m$. For fixed $x$ it sums over $y\ne x$ to $q(q-1)$, so
$$
\sum_{y\ne x}(m-\lambda_{xy})
=m(q^2/m-1)-q(q-1)=q-m.
$$

For a nontrivial real character $\chi:K\to\{1,-1\}$, let $S_\chi$ be the adjacency of $Q$ with each edge weighted by $\chi$ of its label. Identifying a function on $Q$ with the lifted function that changes by the factor $\chi(a)$ under displacement $a$ gives the restriction of the adjacency of $G$ as $S_\chi$. Its square has diagonal $q$. For $x\ne y$, the entry is the sum of $\chi$ on the path labels, a subset of $K$. Since $\sum_{a\in K}\chi(a)=0$, the absolute value is bounded by the number $m-\lambda_{xy}$ of omitted labels. Thus $S_\chi^2-qI$ has absolute row sums at most $q-m$. It is symmetric, so its eigenvalues lie in $[-(q-m),q-m]$, which gives the claimed bound.

### The leave and triangle voltages

Two distinct vertices $v,gv$ of one fiber cannot have a common neighbor: if they had one, applying the involution $g$ would give another, distinct by freeness. Hence the fiber is a clique in the leave. In particular any leave component is a union of full fibers.

In $G$ every vertex has $q(q-1)$ distinct other vertices reached by nonreturning walks of length two. It therefore has just $q-1$ distinct other vertices with no common neighbor, so for two distinct nonadjacent vertices $v,w$ at least one of the $q$ neighbors of $v$ has a common neighbor with $w$. This gives a length-three walk from $v$ to $w$. For $w=v$ there is also at least one length-three closed walk: among the $q$ neighbors of $v$, at least one has a common neighbor with $v$, by the same count. Set $w$ to be the displacement-$a$ lift of the same quotient vertex. No within-fiber edges means the projected walk of length three is a triangle, and its voltage is $a$. Different voltages give different unoriented quotient triangles because reversal does not change the voltage.

### Every transitive 2-group has many long-cycle neighbor moves

Let $P$ be any transitive 2-subgroup of the automorphism group of a candidate $G$. Every vertex is in the same number $t$ of triangles by transitivity; the walk count above gives $t>0$. Because $3$ divides $q^2t$ and $q$ is a power of two, $3$ divides $t$.

Call an edge reversible if some element of $P$ swaps its two endpoints. If the edge lies in a triangle, its third vertex is the unique common neighbor of the endpoints and is fixed by that swapping element. Thus every such swap induces the corresponding transposition on the triangle. The setwise stabilizer of a triangle in $P$ has 2-power order, so its image in the triangle's symmetric group contains at most one transposition. At most one edge of each triangle is reversible. Since an edge is in at most one triangle, there are at least $2q^2t/3$ nonreversible edges. The graph of all such edges is $P$-invariant and hence regular. Its degree is at least $4t/3\ge4$.

For each of those neighbors $y$ of a vertex $x$, any $g\in P$ taking $x$ to $y$ has an orbit of length at least eight on $x$. Length two would make the edge reversible; length four yields the forbidden cycle $x,gx,g^2x,g^3x,x$. In particular, an exponent-four 2-group cannot act transitively. This argument does not assume a regular action or a Cayley presentation.

### Prior work and scope

The [standard voltage-lift spectral decomposition](https://arxiv.org/abs/1903.10776) identifies character blocks. The new restriction here comes from distinct two-step voltages and the exact deficiency sum at order $q^2$. The [earlier Cayley note](CAYLEY-OBSTRUCTIONS.md) concerns regular Cayley and Cayley sum graphs and does not give this quotient condition for arbitrary vertex-transitive graphs. Searches of the exact A-REG order, symmetric configurations, $C_4$ exclusions and voltage lifts did not locate this restriction in the inspected sources. This is a structural partial result for the A-REG route of [Walters et al.](https://aixiv.online/abs/2610.02192), not a resolution of [Erdős #85](https://www.erdosproblems.com/85). See [tracking issue #835](https://github.com/1337isnot1337/solved-conjectures/issues/835).

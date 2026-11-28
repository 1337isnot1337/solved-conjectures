# Barrett–Evans–Hall–Kempton’s dandelion conjecture

**Exact reduction of the remaining optimization.** At each order, a minimum among diameter-three complementary pairs is attained by an induced four-vertex path with one of nine attachments for each other vertex, and a permutation graph on the other vertices. More precisely, every minimizer has the permutation pattern between its joint Fiedler-coordinate classes. This reduces the search domain, but does not prove the global bound for all orders.

## The four anchors

Take a distance-three pair $a,b$ in $G$ and $c,d$ in $G^c$. In $G$, $a,b$ are nonadjacent and have no common neighbour, while $cd$ is a dominating edge: a vertex missing both would be adjacent to both in $G^c$. These pairs cannot share an endpoint. If $a=c$, then $b$ misses $c$ and must be adjacent to $d$ by domination; but $d$ is adjacent to $a$, contrary to the lack of a common neighbour. This is the same dominating-edge principle as [Barrett et al., Lemma 3.7](https://arxiv.org/pdf/2201.04225#page=10).

The edges from $a,b$ to $c,d$ form a perfect matching: each of the first pair meets the second, and each of the second pair can meet at most one of the first. Relabel so that the induced path in $G$ is $a-c-d-b$. Every other vertex chooses zero or one of $a,b$, and a nonempty subset of $c,d$, as $G$-neighbours. Conversely all nine choices are allowed independently for each vertex, and every edge between vertices outside the anchors is free. The edge $cd$ dominates $G$, while $ab$ dominates $G^c$, so both diameters are at most three. The designated pairs still have distance at least three.

## Minimize over two vectors

Let $f,g$ be unit mean-zero Fiedler vectors at a minimizing graph, respectively for $G,G^c$. For a pair $uv$ write
```math
\Delta_{uv}=(f_u-f_v)^2-(g_u-g_v)^2.
```
The sum of Rayleigh energies is reduced by choosing a free edge exactly when $\Delta_{uv}<0$. Since the minimizing graph can be compared to every toggle and the Rayleigh sums are upper bounds on the actual connectivities, the minimizing graph must obey this rule at every strict sign. In a tie, toggling gives an unchanged sum of the two test energies, so both vectors remain Fiedler. If a difference were nonzero, subtracting each old and new eigenvector equation forces the corresponding vector to be proportional to $e_u-e_v$, because the eigenvalue changes by the tested amount $\pm(f_u-f_v)^2$ or $\mp(g_u-g_v)^2$. The equal squared differences would force both vectors proportional to the same vector. They are orthogonal, since they have different eigenvalues in the common Laplacian basis on the mean-zero space: those are the smallest and largest nonzero eigenvalues of $G$, and coincidence would force all nonzero eigenvalues equal, impossible in a simple diameter-three graph. Thus a tie is exactly simultaneous equality of both coordinates.

Write $p=f+g$ and $q=f-g$. Between different joint coordinate classes on the outside, both $p$ and $q$ are distinct and $\Delta_{uv}=(p_u-p_v)(q_u-q_v)$. Hence edges are precisely inversions between the two class orders. Edges within a class can all be deleted at zero Rayleigh cost. At the same time one can give all its vertices the same minimizing attachment to the anchors, because the values of their two test coordinates are constant in the class and the choices are independent. This again attains the same minimum. Placing the members of each class consecutively in both orders in the same internal order realizes this independently expanded class structure as a permutation graph on the outside vertices. Labeling one order in advance leaves at most $9^m m!$ candidates for $m=n-4$ before symmetry and pruning.

### Strictness of attachment preferences

At the minimizing test vectors, each of the two attachment choices minimizes its own anchor cost. Ties are possible only when the involved anchor vertices and the outside vertex have both test coordinates equal. For a toggle of a single edge this is exactly the rank-one argument above. A tie between choosing $a$ and choosing $b$, or between choosing $c$ and choosing $d$, switches one edge for another, with both incident to the outside vertex. The same equality of Rayleigh upper bounds makes both test vectors remain eigenvectors. If one individual test energy changes by a nonzero amount, then the other does too, and subtracting the equations shows both vectors are supported on the three changed vertices. Being orthogonal and mean-zero, they span the whole two-dimensional mean-zero space on those vertices. The old eigenvector equations at a vertex outside this three-set then say its adjacency row to the three vertices is constant. But one of the other anchors sees exactly one of the two switched anchors by the fixed induced path, a contradiction. If the individual energies are unchanged, each rank-two difference equation is zero, and the two incidence vectors of the switched edges are independent, so both coordinate differences vanish. These exhaust ties between attachment optima for a pair of anchors, including the empty attachment and the double attachment as applicable.

## Explicit variational form

Use the fixed energies of the anchor path and its complement. For an outside vertex start provisionally with complement test energies to all four anchors, then add
```math
\min(0,\Delta_{ua},\Delta_{ub})+
\min(\Delta_{uc},\Delta_{ud},\Delta_{uc}+\Delta_{ud}).
```
For every outside pair add $\min((f_u-f_v)^2,(g_u-g_v)^2)$. Minimizing this expression over the two mean-zero unit spheres gives the exact minimum: the finite graph minimization and the vector minimizations commute. By contrast, discarding all outside pairs in both comparisons can lose a fixed amount; it cannot alone certify the remaining orders.

The four-anchor inversion and equality reduction was independently identified in parallel research review; the additional attachment-tie constraint is proved above. The [large-order theorem](LARGE-ORDER.md) and [all-orders missing-leaf theorem](MISSING-LEAF.md) cover distinguished regimes, while the general finite certificate is still open. [Original Conjecture 2](https://arxiv.org/pdf/2201.04225#page=15) · [Issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).

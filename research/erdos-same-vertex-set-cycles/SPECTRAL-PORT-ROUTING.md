# Prescribed spanning path covers in spectral blocks

**Scope.** This is a routing certificate inside a given host. It does not prove the sharp bound in [Erdős #585](https://www.erdosproblems.com/585). The [known upper bound](https://doi.org/10.1016/j.aim.2025.110228) on the average-degree threshold is polylogarithmic in the order, rather than double logarithmic.

## Statement

Take a simple balanced $`d`$-regular bipartite graph $`J`$ with $`m`$ vertices per shore. Let $`\lambda`$ be the second singular value of its biadjacency matrix, counted with multiplicity. Let $`H=J-W-F`$, where $`W`$ deletes at most $`u`$ vertices per shore and $`F`$ has maximum degree at most $`f`$.

In $`H`$, prescribe $`t\ge1`$ pairs with all $`2t`$ endpoints distinct. Let $`\ell`$ be the number of left-left pairs and $`r`$ the number of right-right pairs. The necessary balance condition is
```math
\ell-r=|L(H)|-|R(H)|.
```
Indeed each same-shore path contributes one more vertex on its endpoint shore. Opposite-shore paths contribute equally to the two shores.

Fix an integer $`C\ge2`$ large enough for [the bipartite Hamilton-path theorem, Theorem 4.1](https://arxiv.org/html/2507.22807v3). The balance condition is sufficient for a spanning cover of $`H`$ by vertex-disjoint paths joining the prescribed pairs if
```math
d\ge32(u+t),\qquad
\lambda+f\le d/(16Ct),\qquad
2\mathrm e\,t(td^2+1)\exp[-d/(128t)]\le1.
```
The constants are sufficient, not claimed optimal. Unlike a vertex-union-bound argument, these bounds have no dependence on host order.

## Proof

**Make every pair cross the shores.** For each same-shore pair $`\{a,b\}`$ choose a fresh neighbor $`x`$ of $`b`$ in $`H`$. Exclude all original endpoints and all neighbors selected for earlier pairs. These exclusions remove fewer than $`3t`$ choices; each endpoint has degree at least $`d-u-f>3t`$. Replace this pair by $`\{a,x\}`$ and temporarily remove $`b`$. After the $`\ell+r`$ removals, the two shores have the same size $`M\ge m-u-t`$. The modified pairs have distinct endpoints. Reinstating the edge $`bx`$ at the end recovers the required path and covers $`b`$.

**Partition the reduced shores.** Label the modified pairs by $`1,\ldots,t`$. In each shore, form one block from the $`t`$ prescribed endpoints and place each endpoint in its required class. Divide the other vertices into blocks of size $`t`$ and one remainder of size $`s=M\bmod t`$. Assign the remainder to classes $`1,\ldots,s`$, one per class. In each other block, independently assign a uniformly random permutation of the $`t`$ classes. Corresponding classes on both shores have the same size $`m_i`$. As $`u+t\le d/32\le m/32`$, we have
```math
\tfrac78(m/t)\le m_i\le \tfrac98(m/t).
```
For the lower bound use $`m_i\ge(m-u-t)/t-1\ge(m/t)(1-(u+2t)/m)`$.

**Control degrees independently of order.** For each vertex $`v`$ of the reduced graph and each class $`i`$ on the opposite shore, its random-block contribution is a sum of independent Bernoulli variables. In one block, the contribution is one exactly when the class receives a neighbor of $`v`$. Its expectation over all random blocks is at least
```math
(d-u-3t-f)/t\ \ge\ 7d/(8t).
```
The loss charges $`u+t`$ vertices per shore for deletions, fewer than $`2t`$ for fixed blocks, and $`f`$ for edges. Put $`q=d/t`$. The probability that the random-block contribution is below $`3q/4`$ is at most $`\exp(-q/128)`$. Indeed the lower-tail Chernoff exponent is at least $`(\mu-3q/4)^2/(2\mu)\ge q/112`$ for $`\mu\ge7q/8`$. The bad event for a vertex is a failure in any class, and has probability at most $`t\exp(-q/128)`$. Each event involves at most $`d`$ block permutations. Each permutation influences at most $`td`$ vertex events, because that block has $`t`$ vertices of maximum degree $`d`$. The symmetric Lovász local lemma applies with at most $`td^2`$ dependent events. Thus all vertices retain degree at least $`3d/(4t)`$ into each opposite class.

**Find spanning paths.** For each class take the induced bipartite subgraph $`B_i`$ of the reduced graph. For nonempty $`A`$ on one shore, of size at most $`m_i/(2C)`$, put $`D=N_{B_i}(A)`$. If $`|D|<C|A|`$, rectangular expander mixing in $`J`$ gives
```math
\frac{3d}{4t}|A|
 \le e_J(A,D)
 \le \big(\frac{d\,m_i}{2m}+\lambda\sqrt C\big)|A|
 \le \big(\frac9{16}+\frac1{16\sqrt C}\big)\frac d t |A|,
```
a contradiction. For opposite-shore sets $`A,D`$ of size at least $`m_i/(2C)`$ each, deleting edges costs at most $`f\sqrt{|A||D|}`$. Vertex deletions cost no edges between these retained sets. Thus
```math
e_{B_i}(A,D)
 \ge \sqrt{|A||D|}\big(d\,m_i/(2Cm)-\lambda-f\big)>0.
```
Here the positive term is at least $`7d/(16Ct)`$. These are precisely the bipartite $`C`$-expander conditions of Definition 3.1. Theorem 4.1 supplies a Hamilton path with the endpoints assigned to this class. The classes are disjoint. The paths, with the deleted endpoint edges restored, together span $`H`$.

## Independent covers on the same support

Prescribe several, possibly different, pairings on the same $`H`$. Within each pairing, all endpoints must be distinct; two different pairings may share terminals. Suppose each pairing satisfies the balance condition and has at most $`T`$ pairs. For $`a`$ covers, the same sufficient bounds apply with $`t=T`$ and $`f+2(a-1)`$ in place of $`f`$. Construct the covers one at a time. The union of earlier covers has maximum degree at most $`2(a-1)`$, so it can be forbidden in the next application. The local-lemma bound worsens monotonically as the maximum pair count increases to $`T`$.

In particular two arbitrary balanced port pairings can be imposed with no shared edge. This uses edges of the host, instead of adding paths outside it as in [the connector construction](PAIRED-CONNECTOR-CONSTRUCTION.md).

## Exact gluing with fixed ports

Partition a bipartite host into balanced blocks. Assume each block contains a spanning spectral graph satisfying the two-cover certificate. Select two disjoint families of external edges, with distinct endpoints within each family. Orient an external edge from its left endpoint to its right endpoint and contract each block to a vertex.

Suppose each family projects to a connected directed multigraph spanning the block set with balanced in-degree and out-degree. Assume there are at least two blocks. In each family, take an Euler tour of its projected multigraph. At each visit to a block, pair the right endpoint of the entering edge with the left endpoint of the departing edge. These pairs are prescribed by the actual edges and the tour. Apply the routing certificate inside each block, using separate edge sets for the two families. Joining the resulting paths along the fixed external edges gives two edge-disjoint Hamilton cycles on exactly the union of the blocks. No connectivity or spectral hypothesis on the graph as a whole is needed.

Conversely, any Hamilton cycle of a bipartite host with a balanced block partition projects to a connected spanning balanced set of external arcs. Within one block, the degree sums on its two shores are equal. Every internal edge contributes equally to those sums, so the numbers of entering and leaving arcs agree. Edge-disjoint cycles project to disjoint arc sets. The sufficient direction above still requires the distinct-port and capacity conditions. It strengthens [the designed-module realization](BALANCED-QUOTIENT-PACKING.md) when predetermined ports lie in suitable spectral blocks.

## Literature and remaining gap

The endpoint-cover terminology and shore-imbalance condition occur in [Kronenthal and Wong, *Paired many-to-many disjoint path covers of hypertori*](https://faculty.kutztown.edu/wong/DAM218%282017%29.pdf). The proof above uses equipartitions and the Lovász local lemma. [The Hamilton-path source](https://arxiv.org/html/2507.22807v3) also uses related local-lemma partitions for resilience. No priority claim is made for their combination here. The issue-specific advance is a quantitative certificate for separately prescribed, edge-disjoint covers using fixed host ports.

The sharp $`O(n\log\log n)`$ problem still needs a density-to-structure theorem. In particular the [cube-cover example](CUBE-COVER-OBSTRUCTION.md) obstructs unconditional extraction of a single global spectral block. This note does not establish that one can find a suitable family of blocks or an alternative source of spanning port covers at that density.

# A maximal clique with singly shared intersections

**Theorem.** Let the $`p`$ completion faces of a ternary formula orbit lie in the Boolean $`n`$-cube. Suppose some maximal clique of the compatibility graph meets each other maximal clique in at most one state. The union of the faces then contains at least $`p`$ Boolean vertices. In particular $`p\le 2^n`$. This applies to every diamond-free compatibility graph and to Hamming graphs with any number of coordinate directions.

A diamond is the graph on four vertices with exactly five edges. Distinct maximal cliques sharing two vertices supply a diamond: choose one vertex from each difference that are nonadjacent, which is possible by maximality. Conversely, the two triangles of an induced diamond extend to distinct maximal cliques sharing its central edge. Only one maximal clique needs the stated intersection property in the theorem.

## A local counting lemma

Let a family of distinct incomparable cube faces be partitioned into rows of size $`b\ge2`$. All faces of a row meet pairwise. Between two rows the intersection edges form either a perfect matching or the empty graph. The matching can depend arbitrarily on the pair of rows. Then the union has at least as many Boolean vertices as there are faces.

Choose a common Boolean anchor $`r_i`$ in each row $`i`$. It exists since the fixed bits of mutually compatible faces are consistent. Each face of that row is determined by its free-coordinate mask relative to $`r_i`$. The $`b`$ masks form an antichain. For any submask, flipping its bits from $`r_i`$ gives a point in the row's union.

For matched rows $`i,k`$, choose a Boolean point $`c_j`$ in each matched intersection. On the positions $`T`$ where the two anchors differ, orient bits with $`r_i`$ zero and $`r_k`$ one. For $`j\ne l`$, face $`j`$ of row $`i`$ is disjoint from face $`l`$ of row $`k`$ (index the matched partners alike). Off $`T`$ both faces allow the shared row bit. Their disjointness thus gives a bit of $`T`$ with $`c_j=0`$ and $`c_l=1`$. Exchanging labels gives the opposite strict difference. The $`b`$ restricted words form an antichain, so $`d_H(r_i,r_k)\ge\delta(b)`$, where $`\delta(b)`$ is the least width whose central binomial coefficient is at least $`b`$.

### Rows of size at least three

Put $`t=\lfloor(\delta(b)-1)/2\rfloor`$. In each row use the points in its face union at distance at most $`t`$ from its anchor. These sets from distinct rows are disjoint. Matched rows have centers farther than $`2t`$ apart, and unmatched rows have disjoint face unions regardless of their center distance.

For $`t\ge2`$, apply the [truncated-downclosure lemma](local-grid-and-one-star-orbit.md) to the actual free-coordinate antichain of this row. Its hypotheses hold because $`b\le\binom{2t+2}{t+1}`$. It gives at least $`b`$ union points within the radius. For $`t=1`$ and $`3\le b\le5`$ the empty flip and the singleton flips likewise suffice by the small-radius case of that lemma.

For $`b=6`$, each radius-one count is at least five. A row with only five points there has exactly four active coordinates, and its six masks are all the two-subsets of these four. Indeed the chain-counting inequality on a four-set forces every member of a six-element antichain to have size two. Such a row has six further points obtained by flipping a full two-subset. Each is private to one face *within the row*, and every other point in that face belongs to at least two faces of the row.

Each of those six outer points lies outside the counted part of every row. This follows from distance at least four between matched anchors and disjointness of unmatched unions. If two deficient rows share any outer point, the rows are matched. Every matched intersection between them must be private within each of the two rows, since the cross edges form a matching. Thus each of their six matched pairs shares its respective outer point, and the two sets of six outer points coincide. The coordinates varying among those six points are exactly the original four active coordinates. Centers of rows with the same outer set lie in a common four-cube and, since they are matched, have pairwise distance at least four. There are at most two such centers. Hence distinct outer sets are disjoint and each compensates the one-point deficits of at most two rows. This proves the count for $`b=6`$.

### Rows of size two

Both faces of a row contain its anchor, and no other row can meet their common intersection. A row whose common intersection has at least two vertices can therefore reserve two exclusive points. In every remaining row the two masks are disjoint and nonempty, and the anchor is the unique common point. Reserve it. For that row let $`N_i`$ be the set of its Hamming neighbors of the anchor in its two faces. There is one such neighbor for each bit in the union of its masks. These neighbors are outside all previously reserved points, since each reserved point belongs to both faces of its own row.

Assign mass $`1/|N_i|`$ to each point of $`N_i`$. Fix a point $`x`$ receiving mass from $`k`$ rows. Their centers are the distinct one-bit flips of $`x`$ on coordinates $`s_1,\dots,s_k`$. In each of these rows one face contains $`x`$. Those faces meet pairwise, so every pair of their rows is matched. Their opposite faces also meet pairwise by the matching property. They therefore share a Boolean point $`y`$. In row $`i`$, the face containing $`x`$ is free at $`s_i`$. Its opposite face fixes that bit to the center bit, since the masks are disjoint. Thus $`y`$ differs from $`x`$ on each of the $`k`$ specified coordinates. For $`j\ne i`$ the center of row $`i`$ agrees with $`x`$ on $`s_j`$, so its opposite face must be free at $`s_j`$ to contain $`y`$. The union of the row's masks contains all $`k`$ bits. It follows that $`|N_i|\ge k`$ for each contributing row. The total mass at $`x`$ is at most one. Hence the neighbors supply at least one additional vertex per remaining row.

The counting lemma above is for $`b\ge2`$. For single-vertex cliques in the orbit application, maximality forces those states to be isolated. Arbitrary single-face rows without this isolation need not satisfy a local count.

## From a clique orbit to matched rows

Translation by the cyclic group $`G=\mathbb Z/p\mathbb Z`$ preserves compatibility, and different faces in a periodic orbit are incomparable. These are the [standard orbit properties](target-and-interpolation.md). Let $`C`$ be a maximal clique with the stated intersection property and let $`H`$ be its setwise stabilizer. If $`H`$ is trivial there are $`p`$ distinct translates of $`C`$. Every maximal clique has a common Boolean point and different maximal cliques cannot have the same common point. This gives the required local bound.

Suppose $`|H|\ge2`$. Because $`G`$ is abelian, every translate of $`C`$ is a union of whole $`H`$-cosets. An intersection of two distinct translates would therefore have size at least $`|H|`$, contrary to the hypothesis. The translates partition the states, and the $`p/|H|`$ distinct translates each have size $`|H|`$. Thus each row is a single coset. A face outside a row cannot meet two faces of that row. Otherwise their triangle extends to a different maximal clique sharing the two row faces. Between any two rows, edges consequently form a matching. If one edge exists, translating it by $`H`$ reaches every point of both cosets, so the matching is perfect. The counting lemma now gives at least $`p`$ Boolean vertices in the union.

In a Hamming graph with an arbitrary product of finite coordinates of size at least two, adjacent words differ in one position. Every maximal clique is a coordinate line and different lines meet in at most one word. More directly, the parallel lines of any direction partition the graph into matched rows as above, even when the graph has no regular cyclic action. Thus the local bound applies to any cube-face antichain realizing this graph, including the [earlier formula examples with three or more directions](recurrent-completions-and-higher-face-gap.md). A single state satisfies the count directly.

A counterexample to the [sponsor's 100-dollar proof question](https://sites.math.rutgers.edu/~zeilberg/math640_10.html) would have to have a second maximal clique sharing at least two states with **every** maximal clique, in addition to the earlier stabilizer restrictions. This does not classify all remaining graphs.

## Finite checks

The [checker](check_matched_cliques.py) tested the coset conclusion for 1,685 eligible nontrivially stabilized maximal cliques among all 1,532 labeled undirected circulants of orders 2 through 18. Four explicit two-face families attain the unit capacity at a shared neighbor. A six-face family has two overlapping pairs of deficient rows with disjoint outer sets between the pairs. The proof covers arbitrary orders and face dimensions.

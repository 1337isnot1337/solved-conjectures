# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Sharp vertex-deletion threshold for a $`1+2+3`$ grouping of the hues.** In any completely balanced six-colouring of $`K_{6t+1}`$ and any grouping of its six hues into sets of sizes one, two, and three, some triangle uses one hue of each group. For even $`t\ge500`$, the smallest possible number of vertices meeting all such triangles is
```math
k_0=\min\{k:k(k-1)\ge3t\}.
```
In particular there are $`\Omega(\sqrt t)`$ vertex-disjoint transversal triangles in every such grouping. This is new for the $`1+2+3`$ grouping; the [existing $`1+1+4`$ theorem](PAIR-TRIANGLE-TRANSVERSALS.md) has a different sharp threshold.

Merge the groups to colours $`A,B,C`$ of vertex degrees $`t,2t,3t`$. A transversal in the original colouring is exactly a rainbow triangle after merging. Suppose a deletion set $`D`$ of size $`k\le t/10`$ leaves no such triangle, and put $`N=6t+1-k`$. Use [Gallai's partition theorem](https://users.renyi.hu/~pach/publications/gallaicoloring031113.pdf): a rainbow-triangle-free complete colouring has a nontrivial partition with monochromatic interfaces and at most two colours on the interfaces.

## The shapes of the Gallai partition

The colour $`C`$ occurs between parts. If it did not, every part would have size at least $`3t-k+1>2t`$ from the residual colour-$`C`$ degree, too large for any edge of colour $`A`$ or $`B`$ between parts.

If $`B`$ is absent between parts, each part has size at least $`2t-k+1>t`$. Thus $`A`$ cannot occur between parts either, and all interfaces have colour $`C`$.

Otherwise $`A`$ is absent between parts. Every part has size at least $`t-k+1`$. The graph $`J`$ of $`B`$-interfaces has degree at most two because three parts have total size greater than $`2t`$, and each part has at most three $`C`$-neighbours because four parts have total size greater than $`3t`$. Thus the partition has at most six parts.

If $`J`$ is disconnected, merge each of its components; all new interfaces have colour $`C`$. If $`J`$ is connected it is a path or a cycle. It cannot have two to four vertices: for a path, the consecutive $`B`$-degree constraints give total size at most $`4t`$, and for a cycle the sum of those constraints gives at most $`pt`$ for $`p`$ vertices. Explicitly for a three-vertex path the middle part has size at most $`2t`$ and the other two sum to at most $`2t`$; for a four-vertex path the two inner constraints bound the two alternating pairs by $`2t`$ each. A cycle of five parts gives at most $`5t`$. For a five-vertex path, the constraints at the second and fourth parts give sizes at most $`t+k-1`$ for the first, third and fifth parts, while the middle constraint gives at most $`2t`$ for the second and fourth together. Its total is at most $`5t+3k-3<N`$. So a connected $`J`$ leaves six parts and $`A`$ absent between all of them.

It follows that there are either two parts with all edges between them of colour $`C`$, or six parts with colour $`A`$ entirely internal. In the first alternative, after any merging used above there can only be two parts: with all interfaces $`C`$, each part must have size at least $`N-3t=3t+1-k`$, and three such parts do not fit.

## Lower bound on the deletion size

In the two-part case put $`a_i=3t-|S_i|`$. Each $`a_i`$ is nonnegative since the other part sees all of $`S_i`$ in colour $`C`$, and $`a_1+a_2=k-1`$. In particular $`k=0`$ is impossible. Each vertex in $`S_i`$ needs at least $`a_i+1`$ edges in $`A`$ or $`B`$ into $`D`$, because these colours only occur within its own part in the remainder. The deleted vertices have total degree $`3tk`$ in those two colours, giving
```math
3tk\ge\sum_{i=1}^2 (3t-a_i)(a_i+1)
=3t(k+1)-\sum_{i=1}^2 a_i(a_i+1).
```
The sum on the right that is subtracted is at most $`k(k-1)`$, by concentrating the sum $`k-1`$ in one coordinate. Hence $`k(k-1)\ge3t`$.

In the six-part case put $`b_i=t+1-|S_i|`$. Their sum is $`k+5`$, and each $`b_i\le k`$. The positive deficits alone require at least
```math
\sum_{b_i>0} b_i(t+1-b_i)\ge(t+1-k)(k+5)
```
colour-$`A`$ edges into $`D`$. The total available is at most $`tk`$, so $`(k-1)(k+5)\ge5t`$. This too is impossible when $`k<k_0`$ and $`k\le t/10`$, since then $`k(k-1)+5(k-1)<3t+t/2`$. In particular $`k=0`$ is impossible at every positive admissible $`t`$. If $`t\ge500`$ then $`k_0\le\sqrt{3t}+2\le t/10`$, so the proof covers every potentially smaller deletion size.

## Attainment

Set $`k=k_0`$. Partition the $`6t+1`$ vertices into $`D,S_1,S_2`$ of sizes $`k,3t+1-k,3t`$. Construct a graph $`H`$ with both $`S_i`$ complete, no edges between them, and every edge between $`D`$ and $`S_1`$. Take a graph $`J`$ on $`D`$ with exactly $`3t/2`$ edges, possible since $`t`$ is even and $`k(k-1)\ge3t`$. Put $`H[D]=K_k-J`$. Put the vertices in bijection of $`S_2`$ with the oriented endpoints of the $`J`$-edges, and give each exactly one neighbour in $`D`$, its designated endpoint. Then $`H`$ is $`3t`$-regular: a vertex in $`D`$ has $`3t+1-k`$ neighbours in $`S_1`$, $`k-1-d_J(v)`$ in $`D`$, and $`d_J(v)`$ in $`S_2`$. The other degrees are immediate.

Both $`H`$ and its complement have even degree $`3t`$. Split each into 2-factors and group them into three hues of degree $`t`$ in each graph. Use $`A`$ and the two $`B`$-hues in $`H`$, and the three $`C`$-hues in the complement. Once $`D`$ is deleted, a triangle cannot have both an $`A`$-edge and a $`B`$-edge inside their blocks and a $`C`$-edge between the blocks. Thus $`D`$ attains the threshold. A maximal packing of disjoint transversal triangles has a hitting set of three times its size; deduce the claimed packing order.

This is a transversal theorem, not a full resolution of the cycle or two-triangle subcases of [Erdős #811](https://www.erdosproblems.com/811). It gives a new usable constraint for the latter: a large counterexample has connected hue links even if triangles using any palette with fewer than four disjoint copies are ignored. Indeed, every deleted-palette family has a hitting set of at most nine vertices per palette. For a $`2+3`$ cut in a hue link, use the theorem just proved; for a $`1+4`$ cut use the prior pair theorem. The number of relevant palettes is bounded by 20, so for large $`t`$ these constant-size deletions are smaller than either guaranteed threshold. [Issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870).

### Four possibilities for a two-triangle counterexample

Call a palette rich if four vertex-disjoint rainbow triangles realize it. In a colouring with no rainbow two disjoint triangles, the complement of a rich palette cannot occur at all, since any one triangle meets at most three of those four disjoint witnesses. Hence the rich family is complement-free. The preceding deletion arguments make every hue link in the rich family connected for sufficiently large admissible order.

No hue belongs to every rich palette. Indeed, delete a hitting set for each nonrich palette avoiding that hue (at most 90 vertices). In the remaining graph the union of the other five hues has minimum degree at least $`5t-O(1)`$, and any adjacent pair has at least $`4t-O(1)`$ common neighbours in this union. The ordered triangle count is therefore at least $`(20t^2-O(t))N`$ on the remaining $`N`$ vertices. Those with a repeated hue are at most $`15t^2N`$, by choosing the middle vertex, the repeated hue, and the two same-hue neighbours, with three positions for the equality. There is a rainbow triangle avoiding the given hue after deletion, contradiction unless one such palette was rich.

Thus the [four complement-free connected-link families](CONNECTED-LINK-ABUNDANCE.md) from the existing palette enumeration now apply to the **rich palettes of any large finite two-triangle counterexample**, independently of its rainbow six-cycles or its cut limit. This does not eliminate those four families.

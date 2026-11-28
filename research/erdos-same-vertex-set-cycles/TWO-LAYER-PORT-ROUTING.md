# Two-layer routing with fixed spectral ratio

This strengthens the [prescribed spanning path-cover certificate](SPECTRAL-PORT-ROUTING.md). The allowed spectral ratio no longer degrades with the number of terminal pairs.

## Theorem

Use the same notation $`J,H,d,m,\lambda,u,f,t,\ell,r`$ as in the [first certificate](SPECTRAL-PORT-ROUTING.md#statement). Fix an integer $`C\ge2`$ large enough for [Theorem 4.1 of Hamilton cycles in pseudorandom graphs](https://arxiv.org/html/2507.22807v3). Put $`b=\lfloor m/1000\rfloor`$ and $`h=\lceil\log_2 b\rceil`$. Suppose
```math
d\ge16384,\qquad u+t\le d/32,\qquad
\lambda+f\le d/(4000C),\qquad 40t(h+1)\le m.
```
For every prescribed set of $`t`$ disjoint endpoint pairs satisfying $`\ell-r=|L(H)|-|R(H)|`$, there is a vertex-disjoint spanning path cover joining those pairs.

For fixed $`C`$ and modest deletion counts, the number of pairs can be a constant times $`\min(d,m/\log m)`$. The result also permits sequential packing of several such covers. Add two to the forbidden-degree bound for each previously constructed cover.

## 1. Balance the pairs and reserve vertices

Convert each same-shore pair to an opposite-shore pair by the [endpoint extension](SPECTRAL-PORT-ROUTING.md#proof). At the end of the proof, restore the removed endpoint and its last edge. At present the two shores have the same size $`M\ge m-u-t`$ and each has exactly $`t`$ terminals. Each retained vertex has degree at least $`d-u-t-f`$.

On each shore, put all the terminals in a routing set $`X`$. Divide the other vertices into groups of four, with at most three vertices left over. From each full group, choose one uniformly random vertex for $`X`$, independently. Put all other vertices in a reserve set $`Y`$. Both $`X`$ and $`Y`$ are balanced because the two shores have equal sizes and equal terminal counts. Each shore of $`X`$ has at least $`\lfloor(M-t)/4\rfloor\ge m/5`$ vertices. Each shore of $`Y`$ has at least $`3(M-t)/4\ge m/2`$ vertices.

There is a choice where every retained vertex has at least $`d/8`$ neighbors in $`X`$ and at least $`5d/8`$ in $`Y`$. To see this, ignore neighbors in the fixed groups. The number of eligible neighbors is at least $`d-u-2t-f-3`$. By the hypotheses, at least $`7d/8`$ neighbors are eligible. The two expected counts from full groups are at least $`7d/32`$ and $`21d/32`$. A change of one group changes either count by at most one. Hoeffding's inequality with at most $`d`$ contributing groups bounds each failure probability by $`\exp(-d/512)`$, using the smaller margin $`d/32`$. Grouping the two failures into one event per vertex gives event probability at most $`2\exp(-d/512)`$. Each event depends on at most $`d`$ groups, and at most $`4d`$ events use a given group. The symmetric local lemma applies because $`2\mathrm e(4d^2+1)\exp(-d/512)<1`$ for $`d\ge16384`$.

## 2. Route all but one pair

Let $`B=H[X]`$ after the endpoint conversion. If opposite-shore sets both have size at least $`b`$, rectangular mixing in $`J`$ guarantees an edge of $`B`$ between them. Indeed $`db/m>\lambda+f`$, and vertex deletions do not change edges between retained vertices. Within $`B`$, let $`S`$ start as the edgeless graph on the $`2t`$ terminals. We use bipartite $`(3,b)`$-extendability in [Definition A.2 of the Hamilton-path source](https://arxiv.org/html/2507.22807v3#A1).

Initially every vertex of $`B`$ has at least $`d/8-t\ge3d/32`$ neighbors outside $`S`$. For every set $`A`$ in one shore with $`1\le|A|\le2b`$, there are at least $`3|A|`$ neighbors outside $`S`$. If there were fewer, mixing would bound the incident edges to those neighbors by less than
```math
\big(6db/m+\sqrt3\,\lambda\big)|A| < (3d/32)|A|.
```
The lower bound $`3|A|`$ is sufficient for initial extendability, including the term for isolated terminal vertices in the definition.

At every stage keep fewer than $`m/20+8b`$ vertices in the current graph $`S`$. For any one-shore set of size at least $`b`$, at most $`b-1`$ vertices in the opposite shore of $`B`$ have no neighbor in it. So it has more than $`m/5-b-(m/20+8b)`$ neighbors outside $`S`$. This is greater than $`6b+1`$, as required by [Lemma A.3](https://arxiv.org/html/2507.22807v3#A1) to add a leaf while preserving extendability.

For the next short pair, start at its two isolated terminals. Attach a complete binary tree of depth $`h`$ to each root. The maximum degree never exceeds three. Both trees together add fewer than $`8b`$ vertices, since $`2^h<2b`$. Each has at least $`b`$ leaves. The two leaf sets lie on opposite shores, since their depths agree and the roots are on opposite shores. Join two leaves by an edge, which exists by joinedness. Keep the root-to-leaf paths and prune every unused tree vertex leaf by leaf. Pruning preserves extendability: removing a leaf adds it to the left side of the extendability inequality whenever its parent is in the test set. The change on the right side is precisely the indicator that the parent is in the test set. Adding the joining edge only decreases that right side. This is the two-tree argument from [Lemma A.4](https://arxiv.org/html/2507.22807v3#A1).

Each completed short path adds $`2h`$ interior vertices and leaves the other terminals untouched. The bound $`40t(h+1)\le m`$ gives $`2t+2h(t-1)\le m/20`$. This verifies the size bound during every pair construction. The short paths cover equal numbers on both shores, since their endpoints are on opposite shores.

## 3. Put every unused vertex on the last path

Delete the vertices of the completed short paths. The remaining graph has equal shore sizes $`m'\in[m/2,m]`$. It contains all of $`Y`$, so its minimum degree is at least $`5d/8`$. For sets of size at most $`m'/(2C)`$, mixing bounds the edge count into fewer than $`C`$ times as many neighbors by
```math
\big(dm'/(2m)+\lambda\sqrt C\big)|A| < (5d/8)|A|.
```
For opposite sets both of size at least $`m'/(2C)`$, mixing gives an edge because $`dm'/(2Cm)>\lambda+f`$. This proves the bipartite $`C`$-expander conditions. Apply Theorem 4.1 to find a Hamilton path between the two remaining terminals. Restore the endpoint extensions. The resulting path cover is spanning and has the prescribed pairs.

## Consequence for the fixed interface

The [fixed-interface characterization](FIXED-INTERFACE-COMPRESSION.md) also holds with these new routing bounds in each block, taking $`T_B`$ for the maximum number of prescribed pairs. In particular, there is no factor of $`T_B`$ in the spectral ratio needed to route the forced pairings after quotient compression.

This remains a partial structural result for [Erdős #585](https://www.erdosproblems.com/585). No argument here forces spectral blocks or the requisite interface in a graph with large average degree alone.

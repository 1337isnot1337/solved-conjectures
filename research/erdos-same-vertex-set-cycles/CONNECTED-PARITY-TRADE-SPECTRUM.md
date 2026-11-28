# Connected parity-reversing trades beyond the theta

This extends [the minimum-trade and skeleton bounds](PARITY-TRADE-GIRTH.md), as part of the work on [Erdős #585](https://www.erdosproblems.com/585). It classifies possible supports for a local recolouring. It does not force a recolouring or a same-support cycle pair in a dense host.

## Results

For even $`g\ge4`$:

1. Every three-colour trade of fewer than $`2g`$ changed edges that reverses the factorization sign is supported on a single theta. Its three paths are even. At minimum size, their lengths are the unique multiset in [the theta construction](PARITY-TRADE-GIRTH.md#construction-and-high-girth-completion).
2. The smallest connected sign-reversing support that is not a theta has $`2g+3`$ edges, except at $`g=6,8`$, where it has $`2g+2`$. At those two exceptional minima its suppressed skeleton is $`K_{3,3}`$ and its subdivision is unique up to relabelling.
3. The complete size spectrum for connected sign-reversing supports consists of all even sizes starting at $`2\lceil3g/4\rceil`$ and all odd sizes starting at $`2g+3`$.

Here the host is simple and bipartite and has girth at least $`g`$. Every claimed size is attained inside a connected quartic host. A disconnected trade may contain additional components that preserve the sign.

## Which suppressed skeletons are realizable?

Let a simple bipartite graph have only degree-two and degree-three vertices. Suppose that it is connected, has a branching vertex, and that suppression of its degree-two vertices yields a loopless bipartite cubic multigraph. Then it is the change graph of a three-colour trade in a quartic bipartite host of at least its girth.

Properly edge-colour the cubic multigraph with the three unordered pairs of trade colours. Such a colouring exists by the bipartite edge-colouring theorem. At a branch vertex $`v`$, let $`b(v)`$ be its shore sign in the original graph. Let $`t(v)`$ be its shore sign in the multigraph. Set the orientation of the local 3-cycle to $`\sigma(v)=b(v)t(v)`$. At each incident path use the unique colour that the local cycle sends to its partner in the path's pair. The three starting colours at the vertex are distinct.

Alternate the assigned pair along each path. For a path of length $`k`$ from $`u`$ to $`v`$, the two local orientations satisfy $`\sigma(u)\sigma(v)=(-1)^{k-1}`$. Thus the colours specified at its ends agree with the alternating pattern. Interchanging the two colours along every path makes the specified 3-cycle at every branch. At a degree-two vertex it makes a transposition. In both states the incident sets of colours agree. Apply the [protected matching completion](PARITY-TRADE-GIRTH.md#construction-and-high-girth-completion) to the first state and retain the exterior colouring in the second. The resulting trade reverses the sign exactly when its support has an odd number of degree-two vertices. The reverse implication, from the trade to the bipartite loopless skeleton, is in the earlier note.

## A rank bound for subcubic graphs

Write $`r`$ for the cycle rank and $`m`$ for the number of edges of a connected subcubic graph of girth at least $`g`$. If $`r\ge3`$ then
```math
m\ge 2g+r-3.
```
Keep a spanning tree and three non-tree edges. Prune leaves, preserving the rank-three core. Its suppressed cubic multigraph has four vertices. If it has a loop, the rest contains another cycle disjoint from that loop. If it has no loop but has a parallel pair, it has two parallel pairs. Indeed, each of the first pair's endpoints has one remaining incident edge. Those edges cannot go to the same vertex: the remaining two vertices could not both reach degree three. Thus each goes to a different vertex and the latter two vertices form the second parallel pair. A triple pair would disconnect the four-vertex multigraph. In either case there are two edge-disjoint cycles. The only other skeleton is $`K_4`$; its four triangles together count each edge exactly twice. These statements apply to the actual expanded cycles, so the rank-three core has at least $`2g`$ edges. The unkept non-tree edges supply at least $`r-3`$ more.

Each trade component contains a cycle. Thus a trade of fewer than $`2g`$ edges has just one component. Rank one is an even cycle and preserves the sign. Rank two has a loopless cubic skeleton with two vertices, hence is a theta. A connected trade with branching has $`m=n_2+3(r-1)`$, where $`n_2`$ counts the degree-two vertices. For a sign-reversing theta this makes $`m`$ even. Bipartiteness gives the same parity on all three theta paths, so all three paths are even. If $`4\mid g`$, equality at $`3g/2`$ forces all path lengths to be $`g/2`$. If $`g=4s+2`$, divide the three lengths by two and sort them. The two smaller lengths sum to at least $`2s+1`$ and the total is $`3s+2`$. The largest is at most $`s+1`$, which forces the triple $`(s,s+1,s+1)`$.

## The first support other than a theta

**Rank three.** The bipartite loopless cubic skeleton has two parallel pairs joined by two other edges. The two cycles need $`2g`$ edges and the connectors need at least two more. Since $`m=n_2+6`$ is odd, the bound rises to $`2g+3`$. To attain it, take an even-path pair totalling $`g`$ and an odd-path pair totalling $`g`$. Balance both pairs as closely as their parities permit. Take connector lengths one and two. The cycles confined to a pair have length $`g`$. Each cycle using both connectors has even length at least $`g+2`$: the shortest choices from the two pairs total $`g-1`$. All cycles are even and the graph is simple. The skeleton criterion realizes the trade.

**Ranks five and higher.** The rank bound is at least $`2g+3`$ for rank at least six. At rank five the size is odd, so the same bound follows. Rank four has even size, so these two facts already give the odd part of the claimed spectrum. Increasing one length by any even number in the theta or rank-three construction preserves the shore and sign conditions and does not decrease girth. This gives the complete stated size spectrum.

**Rank four.** The rank bound and the required even size give $`m\ge2g+2`$. If the six-vertex cubic skeleton has a parallel pair, take its cycle and its two connector paths. Delete these paths and their two branch vertices. The four-vertex skeleton left over has five edges and cycle rank at least two, even if disconnected. Two distinct cycles of length at least $`g`$ have union size at least $`3g/2`$ by considering their symmetric difference. The parallel pair, connectors and these cycles use at least $`5g/2+2\ge2g+3`$ edges in total. If there is no parallel pair, the skeleton is $`K_{3,3}`$. Its nine rectangles count each path four times, giving $`4m\ge9g`$. This excludes $`m=2g+2`$ for $`g\ge10`$.

The even-length paths of a bipartite subdivision of $`K_{3,3}`$ form a cut. Compare the side signs in the skeleton with the original side signs: their products differ across an edge exactly when its path is even. This cut has odd size because $`m`$ is even and there are nine paths. It is nonempty, hence has at least three edges. For $`g=4`$ this gives $`m\ge12`$.

At $`g=6`$ with $`m=14`$, the even-path cut can have size three or five. A size-three cut of $`K_{3,3}`$ is a star. The opposite $`K_{2,3}`$ then has all odd lengths. With minimum lengths two on the cut and one off the cut, only one increment of two is available. An edge of this $`K_{2,3}`$ is in just two of its three rectangles. So at least one rectangle would still have length four. A size-five cut, up to relabelling and complementation of its defining side, separates one vertex from each shore together from the other four. No increments are possible. The resulting length matrix is
```math
\begin{pmatrix}1&1&2\\2&2&1\\2&2&1\end{pmatrix}.
```
All nine rectangles have length six or eight. A six-edge skeleton cycle has length at least six. At $`g=8`$ with $`m=18`$, every rectangle has length eight by the sum bound. Comparing rectangles with two specified rows and common column shows that the difference between the other two columns sums to zero across each row pair. Three rows force all these differences to vanish. The rectangle lengths then force every entry to be two. Both exceptional graphs have odd $`n_2`$ and meet the girth bound; the skeleton converse realizes them.

## Related work

[Color trades on n-cubes and complete bipartite graphs](https://www.sciencedirect.com/science/article/pii/S0012365X24002309) studies trade-size spectra in specific hosts. [Switching 3-edge-colorings of cubic graphs](https://www.sciencedirect.com/science/article/pii/S0012365X22001698) concerns two-colour switches. The statements here concern sign reversal at prescribed girth, not the unrestricted size spectrum or ordinary Kempe equivalence. No broad priority claim is made.

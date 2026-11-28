# Regular completion with no short exterior ears

The [exterior-star shortening rule](EXTERIOR-STAR-SHORTCUTS.md) requires an exterior attachment with at least two neighbors on a cycle. Even arbitrarily high regular degree cannot force such an attachment on a shortest cycle meeting a fixed chord quota. In fact those cycles can have no exterior ears below any prescribed length. This does not rule out other, longer, chord-dense cycles in the same host.

## Completion lemma

Let $`H`$ be a finite connected simple bipartite graph with at least two vertices and let integer $`d>\Delta(H)`$. For any integer $`B\ge3`$ there is a finite connected $`d`$-regular bipartite graph $`G`$ partitioned into induced copies of $`H`$ such that:

1. Each pair of copies has at most one connecting edge.
2. Every cycle meeting more than one copy has length at least $`B`$.
3. Every simple path with different ends in one copy and all internal vertices outside that copy has length at least $`B`$ if it uses any connecting edge.

Write $`h(v)=d-d_H(v)`$ and set $`M=\sum_{v\in V(H)}h(v)\ge2`$. Take a simple $`M`$-regular bipartite graph $`K`$ of girth at least $`B`$, which exists by [Erdős–Sachs](https://www.renyi.hu/~p_erdos/1963-16.pdf). Keep one connected component. A regular bipartite graph decomposes into perfect matchings: by degree counting Hall's condition holds, and deleting a perfect matching preserves equal regular degrees. Allocate $`h(v)`$ whole matching colors to each $`v\in V(H)`$.

For each vertex of $`K`$ take a copy of $`H`$. An edge of $`K`$ in a color assigned to $`v`$ connects the two copies of $`v`$, and is the only edge between those copies of $`H`$. Each vertex of type $`v`$ gains exactly $`h(v)`$ edges, so the result is $`d`$-regular. Flip the bipartition of the copies on one shore of $`K`$; every connecting edge now joins opposite shores. Connectivity follows from connectivity of both $`K`$ and $`H`$.

Project a cycle or exterior path to $`K`$ by recording only the connecting edges. For an object that leaves and returns to a copy the projection is a nonempty closed walk. No two consecutive projected edges can be the same edge traversed in reverse: there is only one actual connecting edge realizing any base edge, and the original simple cycle or path cannot use an edge twice. In fact every projected edge is distinct for the same reason. A nonempty closed trail in a simple graph contains a cycle, so it uses at least $`B`$ edges. This proves both length claims. In particular, if $`H`$ has girth at least $`g`$ and $`B\ge g`$, so does $`G`$.

## Consequence for a shortest stock-constrained cycle

For every $`q\ge1`$, $`d\ge4`$, girth target $`g\ge3`$, and $`\varepsilon>0`$, take a bipartite rim $`C`$ with $`q`$ matching chords and no other edges in its support. To construct it, place the $`2q`$ chord endpoints around an abstract rim (insert a further unmarked vertex if needed to have at least three branch vertices). Prescribe opposite colors to the ends of each chord. Stretch each rim interval to length at least two with private vertices to realize those colors and force girth at least $`g`$. This works because the matching has no cycle and every cycle must traverse a whole rim interval. Choose the stretches large enough that $`q/L\le\varepsilon`$ for $`L=|C|`$. This seed has maximum degree at most three.

In the seed, any cycle with at least $`q`$ chords must use no matching edge as a cycle edge, since every chord comes from that matching or a rim edge. More precisely, an omitted rim edge can never become a chord of such a cycle: every rim edge has at least one endpoint of degree two in the seed, so any seed cycle containing that endpoint uses the edge. Thus the only possible chords are the $`q`$ matching edges. Any cycle using no matching edge is the entire rim.

Now complete the seed with $`B>L`$ (and as large as desired). Every cycle of length at most $`L`$ stays in one copy, so $`C`$ is a globally shortest cycle with at least $`q`$ chords. The only other shortest cycles meeting the quota are the replica rims. Each of those rims has no exterior vertex with two neighbors on it, and has no exterior ear of length less than $`B`$. At the same time $`G`$ is connected, bipartite, $`d`$-regular, and of girth at least $`g`$.

This rules out a particular forcing strategy: **select a shortest cycle with at least a given stock, then invoke high regular degree alone to find a short exterior ear to improve it.** The example does not constrain the best chord fraction over all longer cycles. It is not a counterexample to [Erdős #642](https://www.erdosproblems.com/642).

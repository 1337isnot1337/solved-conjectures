# Matching a bipartite block to a circularly ordered core

**Theorem.** Let a triangle-free graph be partitioned into a core (A) and a bipartite block (B), with arbitrary nonnegative product vertex weights of total mass one. Suppose (A) has a proper three-colouring, labelled 0,1,2, whose cyclic orientation is acyclic. Label (B) by 0,1,2,3 (this labeling need not be its bipartition), and suppose all cross edges join equal labels. If the total mass (h) of edges inside (B) with equal labels is at most (201/40000), then the graph satisfies the sharp bound in [Erdős Problem 23](https://www.erdosproblems.com/23).

In particular the result holds with a proper four-colouring of (B), and applies to all product-weighted homomorphic preimages of the Vega templates with (y) deleted. It also applies to preimages of the other Vega templates if the mass of the (xy) fiber link is within the stated threshold. Neither bound fixes the input graph order or requires the fibers to be complete.

## Proof

An acyclic cyclic three-colouring has circular chromatic number below three: place a vertex of colour i at i plus a small, strictly order-preserving offset from a topological order. In a circumference of 3, the forward arc along each edge is strictly greater than 1 and smaller than 2; rescale slightly down. Thus [the circular-three result](CIRCULAR-THREE.md) gives the sharp bound on the core alone.

Write (c) for core mass, (Q) for the cross edge mass, and (e) for all edge mass. It suffices to consider (ele3197/20000), since the larger densities are already handled by [Balogh–Clemen–Lidicky](https://arxiv.org/abs/2103.14179).

First take the three uniform 2-versus-2 splits of the four labels, reversing signs in (B). These cuts cross every cross edge, miss one third of the properly labelled internal edge mass, and miss all the defect edges in (B). Thus (etale(e-Q+2h)/3). Instead, put (B) in its bipartition, optimize the core cut, and fairly choose their relative signs. This gives (etale c²/25+Q/2). If (eta>1/25) then

    (2/25)(1-c²) < Q < 797/20000+2h <= 499/10000,

so (c²>301/800) and in particular (c>1/2).

Place all of (B) in a first block (X), and add a prefix of the acyclic order on (A) to bring its total mass to (1/2), splitting a false twin at the threshold if necessary. The suffix is the other block (Y). Keep the original 0,1,2 labels in (Acap X), and rotate the three labels down by one in (Y). Rotate them by the same permutation in (B), keeping 3 fixed. Every cross edge of this new split has equal labels: the old (B)-to-(A) matches persist across (X,Y), and any cross edge within (A) points forward in its old cyclic colour order. Old (B)-to-(A) matches internal to (X) now have different labels. The only monochromatic-label edges within the blocks are the old defect edges, of total mass (h).

Let (E) be the internal edge mass of the new blocks. The same label cuts now give (etale(E+2h)/3). Separate optimal cuts of the two balanced blocks and fair alignment give (etale1/8+e/2-3E/2), as in the [one-way proof](ONE-WAY-SEPARATORS.md). Combining to cancel (E) gives

    beta <= 1/44 + e/11 + 6h/11 <= 1/25.

This contradicts the supposed violation.

## Application to the Vega families

Use the construction in [Łuczak–Polcyn–Reiher, Section 4.1](https://arxiv.org/abs/2002.01498). The inner Andrásfai graph has three independent classes of consecutive vertices of respective lengths (i,i,i-1) on a circle with (3i-1) labels. Give its three classes labels 0,1,2 in that circle order. For each class, a vertex at offset (j) has forward cross arcs only to strictly later or weakly later offsets in the next class; an all-equal-offset directed cycle would require the last-to-first edge to have distance (i-1), which is a nonedge. Equivalently, place the vertices at their integer circle positions scaled to circumference 3. The three arcs of length 1 define exactly these three colour classes, and the fractional parts strictly increase along every cyclically oriented edge. The edge condition is strict since adjacent circular distance in the original model is at least (i>(3i-1)/3). Removing the indicated inner vertex preserves the order.

The outer block is bipartite: the six-cycle has opposite shores, (x) sees one shore and (y) the other, and (xy) lies across the extended bipartition. For the auxiliary labels, give each pair of opposite six-cycle vertices the label of its common inner attachment class (label 0,1,2), and give both (x,y) label 3. All edges within the outer block then have distinct labels except (xy), and all outer-to-inner edges join equal labels. If (y) is absent the defect is zero; otherwise its measured mass is precisely the edge mass between the (x) and (y) fibers. In a homomorphic preimage, all these orderings and bipartitions pull back even with missing edges.

This resolves the full weighted problem for the entire (y)-deleted family, but not for the unbounded (xy)-defect case of the other Vega templates or for unrestricted graphs.

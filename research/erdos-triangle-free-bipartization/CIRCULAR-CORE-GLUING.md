# Matching a bipartite block to a circularly ordered core

**Theorem.** Partition a triangle-free graph into a core $`A`$ and a bipartite block $`B`$, with product vertex weights of total mass one. Suppose $`A`$ has a proper three-colouring 0,1,2 whose cyclic orientation is acyclic. Label $`B`$ by 0,1,2,3 independently of its bipartition, with all cross edges joining equal labels. If the equal-label edge mass $`h`$ inside $`B`$ is at most $`201/40000`$, the graph satisfies the sharp bound in [Erdős Problem 23](https://www.erdosproblems.com/23).

Write $`c`$ for core mass, $`Q`$ for attachment edge mass and $`e`$ for total edge mass. Larger densities are known, so take $`e\le3197/20000`$. The [circular-three theorem](CIRCULAR-THREE.md) gives core deletion mass $`\le c^2/25`$. Cutting $`B`$, optimizing $`A`$, and using fair relative alignment gives $`\beta\le c^2/25+Q/2`$. On the other hand use the three uniform 2-versus-2 cuts of the four labels, reversing signs on $`B`$. Every cross edge is cut, and internal edges are missed with probability $`1/3`$ for different labels and 1 for equal labels. Thus $`\beta\le(e-Q+2h)/3`$. A supposed $`\beta>1/25`$ would imply
```math
 (2/25)(1-c^2)\lt Q<797/20000+2h\le499/10000,
```
hence $`c^2>301/800`$ and in particular $`c>1/2`$.

Put all of $`B`$ in a first block $`X`$, and fill it to mass $`1/2`$ with a prefix of the acyclic order on $`A`$. Split a false twin at the threshold if necessary. The suffix is the second block $`Y`$. Keep core labels in $`X`$ and rotate them down by one in $`Y`$; rotate the 0,1,2 labels of $`B`$ the same way, keeping 3 fixed. Every new cross edge matches, since the old core edges point forward in their cyclic colour order and the old attachments matched before the two rotations. Old attachments inside $`X`$ now have different labels. The only remaining internal equal-label mass is $`h`$.

If $`E`$ is the new internal edge mass, the two [one-way cut comparisons](ONE-WAY-SEPARATORS.md) give $`\beta\le(E+2h)/3`$ and $`\beta\le1/8+e/2-3E/2`$. Cancelling $`E`$ gives $`\beta\le1/44+e/11+6h/11\le1/25`$, a contradiction.

## Vega application

In [Łuczak–Polcyn–Reiher, Section 4.1](https://arxiv.org/abs/2002.01498), the inner Andrásfai graph has three independent consecutive classes of lengths $`i,i,i-1`$ in its $`3i-1`$-position circular representation. Rescaling the positions to circumference 3 gives exactly those classes by integer part. Fractional parts strictly increase along every cyclic edge since adjacent circular separation in the original representation is at least $`i>(3i-1)/3`$. This survives the indicated inner vertex deletion.

The outer block is bipartite. Give each pair of opposite six-cycle vertices the label of its common inner attachment class, and give both $`x,y`$ label 3. The only defect is $`xy`$, absent in the $`y`$-deleted family. The same matching and ordering work in arbitrary homomorphic preimages. This general gluing lemma covers low $`xy`$ edge mass; the stronger [full Vega theorem](VEGA-TEMPLATES.md) handles the entire family without that restriction.

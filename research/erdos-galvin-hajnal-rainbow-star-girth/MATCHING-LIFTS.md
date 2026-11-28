# Erdős–Galvin–Hajnal’s rainbow-star girth problem

## Matching lifts preserve girth and raise odd girth

For each prescribed $`g`$, there is one graph of girth at least six and odd girth greater than $`g`$ with a fixed countable edge palette, in which every finite vertex colouring gives a vertex with infinitely many same-colour neighbours at every label. The lower bound six on ordinary girth comes from the [unrestricted-host palette step](PALETTE-STEP.md). The new ingredient is a lift with matchings between fibres, not the full categorical product (which can create four-cycles).

**Matching-lift lemma.** Let $`H`$ be a simple graph whose edges have labels in $`I\times E(B)`$, where $`B`$ is a finite simple graph. Suppose every colouring of $`V(H)`$ with at most $`k^{|V(B)|}`$ colours gives a vertex having at least $`\mu`$ same-colour neighbours at each pair label. Suppose $`\chi(B)>k`$. Then a graph $`G`$ on $`V(H)\times V(B)`$ with palette $`I`$ has the same rooted $`\mu`$-neighbour property against $`k`$ vertex colours, has girth no smaller than $`H`$, and has odd girth no smaller than $`B`$.

For a base edge $`xy`$ with label $`(i,\{b,b'\})`$, insert just the two lifted edges
```math
 (x,b)(y,b'),\qquad (x,b')(y,b),
```
both labelled $`i`$. In particular the allowed edges between two given fibres form a matching. Given a $`k`$-colouring of the lift, colour each base vertex by the vector of colours on its fibre; there are at most $`k^{|V(B)|}`$ vectors. Obtain a base root $`x`$ and its same-vector neighbours across every pair label. The common vector, viewed as a $`k`$-colouring of $`B`$, has some equal-colour edge $`\{b,b'\}`$, because $`\chi(B)>k`$. For each $`i\in I`$, all the same-vector neighbours with label $`(i,\{b,b'\})`$ lift to same-colour neighbours of the *same* fixed root $`(x,b)`$. They are distinct and number at least $`\mu`$.

Projection of a simple cycle in $`G`$ to $`H`$ is a closed walk without an immediate reversal, including at the starting point: such a reversal would return along the same matching edge and repeat a lifted vertex. A nonbacktracking closed walk in a simple graph contains a simple cycle of at most its length. This proves the ordinary girth bound. Projection to $`B`$ is also a graph homomorphism, and an odd closed walk contains an odd cycle of no greater length, proving the odd girth bound.

Apply the lemma for each $`k<\omega`$ using a finite $`B_k`$ of chromatic number above $`k`$ and girth above $`g`$, from the classical Erdős high-girth chromatic theorem. As the base, take a graph from [the palette-step theorem](PALETTE-STEP.md) that works for the finite number $`k^{|V(B_k)|}`$ of vectors, relabelling its countable palette by $`\omega\times E(B_k)`$. The union of one lift for each $`k\ge1`$ has the claimed property. It can be kept at cardinality at most $`\sup_{k\ge2}\theta_k`$ in the notation of the previous theorem. This does not establish arbitrarily large *ordinary* girth for a single host handling all finite vertex colourings.

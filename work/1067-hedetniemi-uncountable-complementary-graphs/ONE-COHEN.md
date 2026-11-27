# Hedetniemi’s conjecture for uncountable complementary graphs

**Exact target:** [L. Soukup, Problem 1.4 (2026)](https://arxiv.org/html/2610.08027v1#S1), previously [Problem 8.1 (2015)](https://danieltsoukup.github.io/academic/norwich_handout.pdf). Does ZFC give a graph $`G`$ on $`\omega_1`$ with $`\chi(G)=\chi(\overline G)=\omega_1`$ and $`\chi(G\times\overline G)=\omega`$? Product means the categorical/direct graph product. The 2026 paper has the consistency result from diamond and from a ccc forcing of size $`\omega_1`$. The ZFC target remains open in this note.

## The one-Cohen theorem

In every extension by one Cohen real, there is such a graph. In fact the graph and complement can both have no uncountable homogeneous set, without needing extra vertices to ensure the product has chromatic number exactly $`\omega`$.

Start with a special coherent tree $`T\subseteq\omega^{<\omega_1}`$ of height $`\omega_1`$ in the ground model, for example the coherent special tree from finite walks. Its specializing map remains a specializing map in the extension. In the extension, take a finite-to-one coherent Aronszajn tree $`U`$ without stationary antichains, as given by [Hrušák–Martínez Ranero, Theorems 1, 2 and 5 and their $`\rho_1`$-tree construction](https://www.matmor.unam.mx/~michael/reprints_files/some_remarks_on_non-special_coherent_Aronszajn_trees.pdf); the one-Cohen conclusion is also explicitly used in [Countryman basis and club-isomorphisms under MA($`\omega_1`$), Section 5](https://arxiv.org/html/2610.05582v1#S5).

Use the latter paper's Facts 2.1–2.3 and Proposition 2.4. In detail, both lexicographic orders are Countryman lines. The trees have no club-isomorphic subtrees: otherwise the club restriction of a height-$`\omega_1`$ subtree of $`U`$ would be special, via the isomorphism with a subtree of $`T`$. Its nodes on the club heights would be a countable union of antichains, so one antichain would meet stationarily many levels of $`U`$. This is impossible. Consequently the lexicographic orders are far both directly and after reversing either one: there is no isomorphism or reverse isomorphism between uncountable suborders.

Identify these two orders with two orders $`<_{0},<_{1}`$ on the same set $`X`$ of size $`\omega_1`$. Use the comparison graph of Soukup, Theorem 1.2: $`x,y`$ are adjacent exactly when the orderings agree on the pair. An uncountable clique gives an uncountable order isomorphism, and an uncountable independent set gives an uncountable reverse isomorphism. Neither exists. Both chromatic numbers are thus $`\omega_1`$.

For each $`i=0,1`$, cover $`X^2`$ by countably many coordinatewise $`<_{i}`$-chains, using the Countryman property. Assign $`(x,y)`$ the ordered pair of chain indices. If two product vertices with distinct corresponding coordinates have the same indices, the direction of $`x`$ to $`x'`$ equals the direction of $`y`$ to $`y'`$ in each order separately. Therefore either both coordinate pairs are edges in $`G`$, or neither is. This is a proper countable coloring of $`G\times\overline G`$.

Each of $`G,\overline G`$ also has a countably infinite clique. Indeed, the infinite Dushnik–Miller relation implies that a graph on $`\omega_1`$ with no uncountable independent set has an infinite clique. Pair the members of the two countably infinite cliques to get a countably infinite clique in the product. Hence its chromatic number is exactly $`\omega`$.

This gives a counterexample to the common-uncountably-chromatic-subgraph assertion in [D. T. Soukup’s Question 4.3](https://danieltsoukup.github.io/academic/norwich_handout.pdf) in every one-Cohen extension. If $`H`$ embedded as a subgraph in both factors, the pair of embeddings would send every edge of $`H`$ to a product edge, so the product's coloring would give a countable proper coloring of $`H`$. The same relative-consistency refutation of Question 4.3 already follows from the 2026 diamond example; the improvement here concerns the forcing needed.

## Barrier for the comparison approach under PFA

Under PFA, two arbitrary Countryman lines are either biembeddable or reverse-biembeddable (see [Moore's basis theorem](https://doi.org/10.4007/annals.2006.163.669) and the first section of [the Countryman basis paper](https://arxiv.org/html/2610.05582v1#S1)). After reversing one if necessary, embed both into one Countryman line. Their coordinatewise product is then a countable union of chains. For an arbitrary identification of the two domains with $`X`$, the diagonal corresponding to that identification is also covered by those chains. Each diagonal chain is a subset of $`X`$ on which the two orders agree. Thus the disagreement graph is countably chromatic; if one orientation was reversed, this instead makes the agreement graph countably chromatic. This rules out the entire two-Countryman-order comparison proof under PFA, but not a different kind of graph.

## Structural reductions for arbitrary candidates

Let $`h:[X]^2\to 2`$ be the adjacency bit and $`c:X^2\to\omega`$ any proper product coloring. Replace $`c`$ by $`f(x,y)=(c(x,y),c(y,x))`$. For any distinct $`x,x'`$ and distinct $`y,y'`$, equality of $`f(x,y)`$ and $`f(x',y')`$ implies

```math
h(x,x')=h(y,y').
```

The two coordinates of $`f`$ rule out the two possible inequalities. Conversely any countable $`f`$ with this equality condition properly colors the product.

1. **No uncountable homogeneous set.** If there were an uncountable clique $`C`$ in one factor, choose for each vertex in the other factor a product color occurring on an uncountable subset of its column over $`C`$. Identical chosen colors at adjacent vertices give a product edge of one color (use distinct members of $`C`$). This would countably color the other factor. In particular both factors are uncountably chromatic on every uncountable subset.
2. **Initial segment injections on a club.** For distinct $`x,x'`$ and a label $`n`$, if $`f(x,y)=f(x',y)=n`$ holds for all $`y`$ in $`B`$, then all pairs of distinct elements of $`B`$ have bit $`h(x,x')`$. Thus $`B`$ is countable, and taking the union over $`n`$ shows that the two rows agree only countably often. The transposed statement follows in the same way. Close a club under the bounds of these coincidence sets. For every $`\delta`$ in this club and $`y\ge\delta`$, the restrictions $`x\mapsto f(x,y)`$ and $`x\mapsto f(y,x)`$ to $`x<\delta`$ are injective. Distinct preimages of a common label in two such columns always inherit their adjacency bit from the two column indices.
3. **Uncountable lexicographic replication.** For any two uncountable subsets $`A,B\subseteq X`$, there are an uncountable $`B'\subseteq B`$ and pairwise disjoint uncountable $`A_y\subseteq A`$ for $`y\in B'`$, such that all cross pairs from $`A_y`$ and $`A_z`$ have bit $`h(y,z)`$ whenever $`y\ne z`$. To see this, find a common label $`n`$ with uncountably many occurrences $`f(x,y)=n`$ in $`x\in A`$ for every $`y`$ in an uncountable $`B'`$. For two such label fibers the cross bit is constant by the equality rule, so their intersection must be countable by point 1. Thin the fibers to be disjoint by subtracting earlier intersections along an $`\omega_1`$-enumeration. This gives a quotient copy of the graph on $`B'`$ in every uncountable $`A`$, with each fiber itself still carrying both uncountable chromatic numbers.

These properties do not prove an obstruction under PFA; in particular an uncountable sequence of such quotient refinements need not have a nonempty intersection along any infinite branch.

## Search and next step

Cross-checked Soukup’s original handout and October 2026 arXiv paper, the October 2026 Countryman-basis paper, the 2005 coherent-tree paper, Moore’s basis theorem, and searches for the exact title, arXiv ID, and the forcing-axiom/Cohen variants. The comparison graph and chain coloring are from Soukup, not new; the use of a single Cohen real follows by combining them with the prior tree separation. No indexed ZFC solution or single-Cohen graph statement was located. The remaining task is to leverage the square-coloring equality relation beyond comparison graphs or find an unconditional construction.

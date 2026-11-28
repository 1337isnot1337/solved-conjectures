# Finite monochromatic templates in the four-configuration forcing

This note supplements [the proposed resolution of EGH Problem 9/C](https://github.com/1337isnot1337/solved-conjectures/pull/1082). It uses exactly the same forcing. It makes no additional claim about Problem 9/D.

Call a **valid ordered template** a finite set with a linear order and a triple system whose repeated pairs are bottom pairs and whose shadow triangles are all triples. In the generic triple system:

> For every countable coloring of the vertices, every valid ordered template occurs monochromatically, with the template order preserved. The embedding preserves the induced hypergraph on its image.

To prove this, fix a template of size $m$ and a condition purportedly forcing that a given coloring has no such monochromatic copy. Carry out the double pressing-down argument in the main proof with $m$ conditions instead of three. There are $m$ distinct marked vertices $x_0<\cdots<x_{m-1}$, all forced to have the same color, all above every marked bound, and each in a separate petal with no root neighbor. Form the free union and add exactly the triples prescribed by the template on the marked vertices. No new pair can repeat an old pair because all added pairs are cross-petal. Repeat-pair requirements among added triples hold by the template order. A new shadow triangle uses at least one new pair between two marked vertices. A root vertex cannot complete it; a nonroot vertex in any petal can only meet a marked vertex in a different petal if it is also marked. Thus every new shadow triangle is entirely on the marked vertices, where the template is already shadow-complete. The extension order fixes the induced hypergraph on the marked vertices. It does not fix missing shadow pairs there, since a later edge with an outside third vertex might create one.

Consequently the exact *weak* finite hypergraph age of this generic example has a finite criterion. For a finite triple system $F$, let $F^+$ be the system of all triangles in its own pair shadow. Then $F$ weakly embeds in the generic hypergraph if and only if the vertices of $F^+$ admit an order in which every repeated pair is a bottom pair. Necessity follows by inheriting the generic order: all triples of $F^+$ must be present by shadow completeness. Conversely the pair shadow of $F^+$ is the same as the pair shadow of $F$, so $F^+$ with the proposed order is a valid template. Apply the previous argument and drop the supplementary edges. Isolated vertices may be retained.


## A version with a Hajnal–Máté shadow and induced graph copies

One can strengthen the extension order in the main proof without changing its finite conditions. In addition to the existing clauses, require the shadow induced on the old support to be unchanged. Also require that, for each old vertex $v$, any newly acquired smaller neighbor be **larger than all points of the old support below $v$**.

In a free union over a root that is below all petals, no old vertex gains any neighbor below it from the other conditions: a root vertex can acquire only petal neighbors above it, and a petal vertex does not occur elsewhere. No old support gains any internal shadow pair, by agreement of the root shadows. The resulting union is therefore an extension for the stronger order as well. When adding a template on the marked vertices, the new shadow pairs join different petals, so do not change any old induced shadow. At a marked vertex $x_i$, its old support below $x_i$ is exactly $R_{h_i}$; all other marks are above the union of the $R_{h_j}$ by their selection. All new smaller neighbors therefore lie above every point of that old support. Adding an isolated point is still valid. The precaliber and double pressing-down proofs go through unchanged.

In the strengthened generic order, fix $\gamma<\beta<\omega_1$ and take a condition in the generic filter containing both ordinals. No later extension of it can add any smaller neighbor of $\beta$ at or below $\gamma$. Hence the generic shadow is a Hajnal–Máté graph. It is uncountably chromatic because every countable vertex coloring has a monochromatic hyperedge. Moreover the embedding of each monochromatic finite valid template now preserves the induced **shadow graph as well as the hypergraph**. All missing pairs on the marks are permanently decided by the stronger extension order.

The shadow is $K_4$-free and each neighborhood is a disjoint union of stars, as in the working reformulation. This is not a regressive Hajnal–Máté graph: by [the separate earlier-clique result](https://github.com/1337isnot1337/solved-conjectures/issues/1080), its $K_4$-freeness implies a proper regressive coloring. The stronger order does not assert that the witness exists without forcing.


## Effective finite criterion and book cycles

The order test on $F^+$ is equivalent to acyclicity of a finite digraph. For every pair $`\{a,b\}`$ shared by at least two triples of $F^+$ and each triple $abx$, give the digraph arrows $a\to x$ and $b\to x$. If an order exists, each arrow increases. Conversely a topological sort of an acyclic digraph puts both members of every repeated pair below its third vertex, exactly the required condition. Thus the weak finite age is decidable from the shadow and the arrows, without searching over orders.

This criterion is stronger than mere avoidance of the four configurations. As an example, for each $m\ge4$ use distinct $a_i,b_i,c_i$ for $i\in\mathbb Z/m\mathbb Z$ and take the edges
```math
\{a_i,b_i,a_{i+1}\},\qquad\{a_i,b_i,c_i\}.
```
The only repeated pairs are $a_i b_i$, and each triple contains just one. Its shadow triangles are exactly the displayed edges: the $a$-vertices induce an $m$-cycle, each $c_i$ only sees $a_i,b_i$, and the two adjacent neighbors of $b_i$ on the $a$-cycle are $a_i,a_{i+1}$. These two facts exclude all four configurations by the same shadow argument as in the main proof, which needs only that each triple have at most one repeated pair. But the order criterion gives $a_i\to a_{i+1}$ for every $i$, a directed cycle. None of these systems occurs in the generic example.

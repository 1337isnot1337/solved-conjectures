# Henning–Joos–Löwenstein–Sasse induced cycles conjecture

**Connected tight graphs of unbounded order.** The original Figure 6 gives a tight graph on twelve vertices. There are connected cubic graphs on $12t$ vertices with induced cycles vertex number exactly $6t$ for every $t\ge1$. The construction uses one carefully chosen edge in each copy of Figure 6. It proves sharpness for arbitrarily large connected graphs, not the conjectured lower bound.

## An edge which is safe to remove

Let $B$ be the three-square ring defined in the [initial note](README.md), and let $xy$ be one of the two matching edges at one interface between blocks. The two properties needed are
```math
c_{\rm ind}(B-xy)=6,\qquad
\text{there is a size-six feasible set in }B-xy\text{ avoiding both }x,y.
```

For the upper bound the local block analysis still applies. Any selected $(1,1)$ block requires one selected outside edge at each side. Across an interface with exactly one active edge, the adjacent block cannot have two selected ports there: they would either both require outside edges or both forbid them. Nor can it have just one selected port there and two on the far side, because its one port would already have internal degree two. So the $(1,1)$ state propagates, including across the damaged interface if the surviving match is used, and gives exactly six selected vertices.

In the absence of $(1,1)$ blocks, an occupied block is a full square or one half of a six-cycle pair. The pair must use both edges at its shared interface, so cannot cross the damaged interface. There cannot be two full squares: any two blocks are adjacent and even the damaged interface retains an edge. There cannot be a full square together with a six-cycle pair covering the other two blocks: the square has at least one intact neighboring interface, at which any nonempty neighbor would use at least one port and hence create an extra edge at the square. Thus every feasible set has size at most six. For the lower bound take a cycle using one left and one right port per block, crossing the damaged interface on its surviving matching edge. Choices at the other two interfaces are arbitrary and independent. This cycle misses both endpoints of the deleted edge.

## Assemble copies around a cycle

Take $t$ disjoint copies of $B-xy$ with degree-two ports $x_i,y_i$. Add $y_i x_{i+1}$ for each $i$ cyclically, restoring the deleted edge when $t=1$. The graph is simple, cubic and connected (each damaged block is connected). Let a selected set induce a 2-regular graph in this assembly. Every copy has either zero or two selected crossing edges, since the sum of the selected degrees within that copy is even. This parity statement applies for $t\ge2$; the case $t=1$ is the original graph. With zero crossing edges, its selected vertices induce a feasible set of $B-xy$, of size at most six. With two crossing edges, its selected ports each have exactly one internal neighbor and every other selected vertex has two. Replacing the two outside edges by the original edge $xy$ gives a feasible set of $B$, also of size at most six. Summing yields the upper bound $6t$. The avoiding set of size six within every copy combines with no interaction, giving equality.

The same argument applies to any finite simple connected cubic graph $B$ with a nonbridge edge $xy$ such that $c_{\rm ind}(B-xy)\le c_{\rm ind}(B)$ and $B-xy$ has an optimum of the latter size avoiding $x,y$. It preserves the exact induced cycles vertex number per copy. No assertion is made that every tight graph, or every counterexample, admits such an edge.

# When Type 4 still gives every countable target

The [counterexample to Zhang 5.5](PROOF.md) has no uncountable rainbow, but **does** have a rainbow of every countable order type. The following sufficient criterion explains why it cannot be used unchanged against Question 5.4.

Suppose $`f`$ is a colouring of $`[\omega_1]^3`$ in which every collision is of Zhang's Type 4, so it has the form
```math
 f(\{u,a,b\})=f(\{v,a,b\}), \qquad u\lt v\lt a\lt b.
```
Assume that for each top pair $`a<b`$ there are at most $`D`$ unordered pairs $`\{u,v\}`$ giving a collision, for one fixed finite $`D`$. Then every countable ordinal is the order type of an $`f`$-rainbow set.

Form an auxiliary graph on the **pairs** of ordinals. From each top pair $`\{a,b\}`$, draw an edge to $`\{u,v\}`$ for each such collision. The outgoing degree is at most $`D`$. Therefore each finite induced subgraph has at most $`D`$ times as many edges as vertices, also for its induced subgraphs, so its undirected graph is $`(2D+1)`$-colourable by degeneracy. By graph compactness the entire auxiliary graph has a proper finite colouring. (If $`D=1`$, the directed edges also strictly decrease the maximum ordinal, so the graph is a forest and two colours suffice.)

View this proper colouring as a finite colouring of $`[\omega_1]^2`$. The [Baumgartner–Hajnal theorem](https://doi.org/10.4064/fm-78-3-193-203) gives a homogeneous subset of any prescribed countable order type. Such a subset must be $`f`$-rainbow: a collision would put both its top pair and its interchangeable lower pair in the homogeneous class despite their adjacency in the auxiliary graph.

In the construction for 5.5 there is only one instruction at each top pair, so $`D=1`$. This proof does not extend to arbitrary 2-bounded colourings: two-element colour fibres do not bound the number of different collision fibres addressed by one top pair. The other three normal collision types are also not covered.

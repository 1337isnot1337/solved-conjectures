# An exact branch-transfer test for two spanning trees

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This gives a test for eliminating branches on one side of a bipartite common-support tree packing. It does not force the test to pass.

Let a bipartite graph on sides $`L,R`$ have its edge set split into spanning trees $`T`$ (red) and $`U`$ (blue). In the [quartic rigidity circuits](FOUR-TERMINAL-COMPLETION.md) that arise from the tree relaxation, all vertices have total degree three or four and each colour degree lies in $`\{1,2,3\}`$.

## A single adjacent transfer

For red $`ux`$ and blue $`vx`$, with $`u,v\in L`$ and $`x\in R`$, exchange their colours. This is valid exactly when $`v`$ lies on the $`u`$-side of the red cut $`T-ux`$, and $`u`$ lies on the $`v`$-side of the blue cut $`U-vx`$. These are exactly the conditions under which each inserted edge reconnects the components of its deleted edge.

The transfer decreases the red degree of $`u`$ by one, increases that of $`v`$ by one, and leaves the degree of $`x`$ in each colour unchanged. At a red branch $`u`$ (red degree three), it removes the branch. A valid transfer from such a branch can either hit a red leaf (the total number of branches strictly falls) or a red-degree-two vertex (the red branch moves to that vertex). Indeed $`v`$ must have blue degree at least two because it cannot be isolated in the reconnected blue tree. In the quartic setting this excludes red degree three at $`v`$. When $`v`$ has red degree one, its new red degree is two, and its blue degree decreases, so no new branch is created. When $`v`$ has red degree two, validity forces old blue degree two and the red branch moves. A path of apparent transfers calculated in one initial decomposition is not necessarily performable sequentially: each transfer can change later fundamental cuts.

## Simultaneous transfer test

Choose distinct red edges $`e_1,\dots,e_m`$ and distinct blue edges $`f_1,\dots,f_m`$, with $`e_i,f_i`$ meeting at a vertex of $`R`$ for every $`i`$; the meeting vertices need not be distinct. Write $`e_i=u_i x_i,\ f_i=v_i x_i`$ with $`x_i\in R`$. Draw a transfer arrow $`u_i\to v_i`$ on $`L`$. Its outdegree minus indegree gives the decrease in red degree at each vertex of $`L`$, and the red degree on $`R`$ is unchanged.

Define two binary matrices by

```math
(M_T)_{ij}=1_{\{e_i\text{ is on the unique }T\text{-path joining the ends of } f_j\}},
\qquad
(M_U)_{ij}=1_{\{f_i\text{ is on the unique }U\text{-path joining the ends of } e_j\}}.
```

The simultaneous exchange gives two spanning trees **if and only if both matrices are invertible over $`\mathbb F_2`$**. To verify the red statement, take columns of the edge-incidence matrix over $`\mathbb F_2`$, deleting one vertex row. The columns of the initial red tree form a basis; the coordinate vector of an added edge is its old tree path. The unchanged red columns are distinct unit columns, so expanding the replacement basis determinant along them gives the determinant of $`M_T`$, up to sign. Do the same for the blue tree. In particular, a family of valid individual transfers with no off-diagonal incidences is simultaneously valid, but merely having nonzero diagonals in both matrices is not sufficient.

This is also a **necessary** certificate for any achievable target red degree function on $`L`$ while all red degrees on $`R`$ remain fixed. Given a successful recolouring into two spanning trees, at each $`x\in R`$ pair its red-to-blue edges bijectively with its blue-to-red edges, possible by equality of old and new red degrees at $`x`$. Each pair gives a transfer as above; every changed edge appears once. The arrows have the required divergence, and both matrices are invertible since the recoloured graphs are trees.

## Use and limitation

In the quartic circuit, choose the two terminals meant to be red endpoints, setting the target red degree to one there and two elsewhere. If the red degrees on $`R`$ are already at their targets, an arrow family with the required degree divergence and both matrices invertible is an exact condition for finishing the path pair without altering those right-side degrees. The same holds with the two sides swapped. Degree feasibility and the underlying spanning-tree existence do not separately guarantee an invertible two-matrix certificate. This is a graph-incidence basis-exchange identity applied to the branch repair, not a claim of a new matroid basis theorem.

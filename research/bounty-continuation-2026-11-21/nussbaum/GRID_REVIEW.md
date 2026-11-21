# Independent review of the local grid and one-star orbit bound

Reviewed 21 November 2026: [the authored proof](local-grid-and-one-star-orbit.md). The uniform proof passes this review. No numerical test, new priority claim, or full-bounty conclusion is part of this assessment.

## 1. Truncated downclosures

I checked the quoted Lovász shadow bound directly in [Keevash's author-hosted paper](https://people.maths.ox.ac.uk/keevash/papers/kk-journal.pdf), pages 1686–1687. The primary text states both the one-level bound and its iterated version. The application in the note uses exactly those hypotheses.

For a top level of size $`k\ge t+2`$, its cardinality is at most $`\binom{2t+2}{t+1}\le\binom{2k-1}{k}`$. Thus the real-binomial parameter satisfies $`x\le2k-1`$, and its immediate shadow has at least as many members. Replacing the entire top level by an equally large selection from that shadow preserves the antichain: a retained lower set contained in a new shadow member would have been contained in an old member, while equality with a retained set gives the same contradiction. The total size decreases, so the replacement terminates. Its full downclosure remains inside the original one.

At the final level $`k=t+1\ge3`$, the parameter satisfies $`x\le2k`$. Each ratio $`\binom{x}{j}/\binom{x}{k}`$ decreases in $`x`$, so the sum of proper-shadow lower bounds is at least its value at $`x=2k`$. The required endpoint inequality is

```math
3\binom{2k}{k}\le4^k.
```

It holds at $`k=3`$, and the normalized central binomial coefficient decreases thereafter by the displayed factor $`(2k+1)/(2k+2)`$. Lower-level antichain members are outside the top level's downclosure and can be added without double counting. The separate radius-one statements for three, four, and five members follow from the stated elementary antichain bound; the six 2-subsets of a 4-set explain the exceptional value precisely.

## 2. The bound counts vertices in the actual union

The row and column witness vertices exist by the coordinatewise Helly property of Boolean faces. Their distinctness follows by choosing a nonincident row-column pair. For two row witnesses, a separation of the corresponding hulls must occur in a coordinate on which the row witnesses differ. Applying this to both orders of two columns makes the restricted column patterns an antichain. Hence the row distances are at least $`\delta(b)`$.

For a fixed row, the sets of coordinates flipped toward the column witnesses form an antichain as well. Their truncated downclosure is not merely a collection of ambient cube vertices: every such vertex lies in one of the hulls and therefore in an actual face of that row. Radius $`\lfloor(\delta(b)-1)/2\rfloor`$ makes the row balls disjoint, while the downclosure lemma supplies at least $`b`$ vertices in each ball. This establishes the required local count for every nonexceptional column count.

The six-column repair also checks. A bad row uses precisely the six 2-subsets of one 4-coordinate set; the equality case follows from the maximal-chain count. That coordinate set is exactly the variation set of the six column vertices and is therefore shared by every bad row. All bad centers lie in its 4-cube, have pairwise distance at least four, and number at most two. Each of the six column vertices is distance two from a bad center and at least two from every other row center. All six therefore lie outside the disjoint radius-one balls. They repair the deficit of at most two vertices. The cases with a side of size one or two are covered separately and correctly.

Thus every grid in the stated theorem has at least $`ab`$ Boolean vertices **in its own union**. This is the property needed for addition across compatibility components.

## 3. The graph reduction and addition across components

A one-star face is a cube edge. Another antichain face meeting it must fix its free coordinate, or it would contain that edge. The neighbors consequently split into two cliques with no edges between them. The transitive cyclic graph action transfers this local property to every compatibility vertex.

The maximal-clique reconstruction produces a simple triangle-free graph whose line graph is the compatibility graph. Distinct maximal cliques cannot meet in more than one compatibility vertex, and each vertex belongs to at most two of them. Private leaf endpoints handle vertices belonging to one maximal clique; an isolated vertex gives an isolated edge. A triangle in the reconstructed graph would contradict the two anticomplete neighborhood parts.

The cyclic action lifts to this reconstruction. Powers stabilizing one connected component remain edge-transitive on it. After quotienting the action's kernel, the resulting abelian edge-transitive action is faithful. The classification in the note is justified: a connected component has at most two vertex orbits; one orbit makes the action regular and gives degree at most two, while two orbits give a bipartite graph whose shared-neighbor stabilizer argument forces complete bipartiteness.

For complete bipartite components, the proved grid bound applies locally. For cycle components, different maximal cliques have disjoint common Boolean intersections; a shared Boolean vertex would make their union a clique. Different compatibility components also have disjoint Boolean unions. These facts justify summing the local bounds and prove the stated $`2^n`$ bound whenever the orbit contains a one-star state.

## 4. Scope

I found no missing hypothesis or invalid algebraic step in the written argument. The reduction does not show that every cyclic information antichain has a one-star state. When every state has at least two stars, its neighborhood need not split into two anticomplete cliques, so the reconstructed-graph argument is unavailable. The full sponsor target remains unresolved by this proof.

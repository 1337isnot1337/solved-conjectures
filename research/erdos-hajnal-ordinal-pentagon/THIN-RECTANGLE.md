# A thin-neighborhood obstruction to column fusion

The [ordinal pentagon conjecture](REDUCTIONS.md) concerns a graph
with $`\omega_1`$ columns of type $`\omega_1^\omega`$.
One might try to fuse such columns by seeking full-type slices with
no edge across each pair. Finite ordinal rank of each individual
cross-neighborhood is not enough, even when the two-column graph is
bipartite.

**Lemma.** For $`\kappa=\omega_1`$ there is a bipartite graph on
two parts $`A,B`$ of type $`\kappa^\omega`$ such that:

- Each vertex has a cross-neighborhood of type less than
  $`\kappa^\omega`$.
- Every two subsets $`A'\subseteq A,B'\subseteq B`$ each of type
  $`\kappa^\omega`$ have an edge between them.

The same example works for any regular uncountable $`\kappa`$.

Write each part as the ordinal sum of levels $`A_n,B_n`$ of
type $`\kappa^{n+1}`$ for $`n<\omega`$.
Independently in each level, give its vertices distinct labels
from $`\kappa`$. Denote the labels of $`a\in A_n,b\in B_m`$ by
$`\ell(a),\ell(b)`$. Join them exactly when one of these holds:

- $`n\le m`$ and $`\ell(b)<\ell(a)`$;
- $`n>m`$ and $`\ell(a)<\ell(b)`$.

For a fixed $`a\in A_n`$, the earlier levels $`B_m`$ with $`m\lt n`$
have finite combined ordinal rank; in all the other levels the
adjacent labels are bounded by $`\ell(a)`$, so they give a set of
cardinality below $`\kappa`$ even after their countable union.
For a fixed $`b\in B_m`$, reverse the reasoning: the initial
levels with $`n\le m`$ have finite combined rank and the rest give
only a set of cardinality below $`\kappa`$. This proves the
individual bound. It in fact gives a finite bound depending only
on the level of the fixed vertex.

On the other hand some $`A'\cap A_n`$ has cardinality $`\kappa`$,
since otherwise $`A'`$ would be a countable union of sets of
cardinality below $`\kappa`$. The infinite-rank set $`B'`$ has some
point $`b`$ in a level $`B_m`$ with $`m\ge n`$. The labels of
$`A'\cap A_n`$ are unbounded, so choose $`a`$ there with label
strictly bigger than $`\ell(b)`$. Then $`ab`$ is an edge.

As a bipartite graph the construction itself has an independent
side and does not obstruct the whole pentagon conjecture. It rules
out the simple pairwise fusion inference under the hypothesized
smallness of individual neighborhoods.

[Tracking issue #984](https://github.com/1337isnot1337/solved-conjectures/issues/984).

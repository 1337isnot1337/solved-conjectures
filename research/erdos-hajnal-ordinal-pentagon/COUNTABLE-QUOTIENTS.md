# Countable quotients in the ordinal pentagon problem

Let $`\kappa=\omega_1`$, $`\alpha=\kappa^{\omega+1}`$, and
write $`C_\beta`$ for the natural $`\kappa^\omega`$ columns
indexed by $`\beta<\kappa`$. Any graph on $`\alpha`$ with a
homomorphism to a countable graph with no infinite clique
has an independent subset of order type $`\alpha`$.
In particular this excludes counterexamples that are blow-ups
of a countable $`C_5`$-free graph, even when the target has
unbounded finite chromatic number.

Let $`f:G\to Q`$ be the homomorphism, and let $`A_q`$
be the fiber of a vertex $`q\in Q`$. Each fiber is
independent. If a fiber has full order type, we are done.
Otherwise, by the [rank description](REDUCTIONS.md#the-rank-description),
it has an eventual finite column-rank bound. Define the
rank of the fiber by

```math
r(q)=\sup\bigl\{m<\omega:
\{\beta<\kappa:\mathop{\mathrm{otp}}(A_q\cap C_\beta)
\ge\kappa^m\}\text{ is unbounded}\bigr\},
```

using $`-1`$ when the set of levels is empty. Every
$`r(q)`$ is finite or $`-1`$ in this case.

These ranks are unbounded in $`\omega`$. Otherwise take
a common finite level $`m`$ above all ranks. Beyond a cutoff
depending on $`q`$, each $`A_q\cap C_\beta`$ has order type
less than $`\kappa^m`$. There are only countably many fibers,
so regularity gives one common cutoff. A countable union
of sets each of type below $`\kappa^m`$ still has type
below $`\kappa^m`$, by the countable indivisibility of finite
powers of $`\omega_1`$. This contradicts that the fibers
cover every late column, which has type $`\kappa^\omega`$.

Choose distinct vertices $`q_0,q_1,\ldots`$ of strictly
increasing ranks. The infinite Ramsey theorem gives an
infinite independent subsequence in $`Q`$, since the target
has no infinite clique. Take the union of that subsequence's
fibers. It is independent. Its rank cannot have a uniform
finite bound in late columns: for every finite level some
included fiber reaches that level in unboundedly many
columns. The rank description therefore makes its order
type $`\alpha`$.

The target condition is not mere countable colorability.
For comparison, color each column's consecutive finite-rank
levels by their level indices and join all pairs of
different colors. No color class has full type, so this
countably colorable graph does not have a full independent
set. It contains pentagons and is not a counterexample to
the original question. There is no asserted reduction of
arbitrary countably colorable pentagon-free graphs to the
countable no-infinite-clique targets above.

## Countable images in individual columns

Here the target graph may be uncountable. Suppose
$`f:G\to Q`$ is a homomorphism to a graph whose edges are
a finite union of $`C_5`$-free graphs, and that for every finite $`m`$ there are unboundedly many
columns in which some fiber has type at least $`\kappa^m`$.
Then $`G`$ has an independent subset of full type. This
condition holds in particular if each sufficiently late
column has countable image under $`f`$, by countable
indivisibility of finite powers.

To prove it, call a fiber repeating at level $`m`$ if
it reaches $`\kappa^m`$ in unboundedly many columns.
If repeating fibers exist at arbitrarily high levels,
one fiber has full type or there is a sequence of
distinct such fibers of increasing rank. The infinite
Ramsey argument above applies without any restriction
on the size of $`Q`$. There is no infinite clique in $`Q`$:
color each edge of a hypothetical infinite clique by one
of the finitely many covering graphs and use infinite Ramsey.

Otherwise, choose a finite $`m_0`$ such that no fiber repeats
at levels $`m\ge m_0`$. We may select vertices of
$`Q`$ and witnessing columns, indexed by
$`(m,\xi)\in[m_0,\omega)\times\kappa`$, so that all
selected quotient vertices are distinct and, for each fixed
level, the selected columns are strictly increasing.
Run the selections in the order of increasing $`\xi`$ and,
for each $`\xi`$, increasing $`m`$. At any step there
are countably many previously selected vertices. Each one
has a bounded set of possible witnessing columns for this
level. By regularity their union is bounded. Go beyond
that bound and beyond the previously selected columns
for this level, and use the assumed unbounded supply.

For each $`m\ge m_0`$, let $`B_m`$ be the set of selected
quotient vertices at level $`m`$. These are disjoint and
have size $`\kappa`$. Use the known
[Erdős–Hajnal relation for the smaller ordinal](https://combinatorica.hu/~p_erdos/1982-24.pdf#page=4)
to get an independent set in $`Q`$ meeting infinitely many
$`B_m`$ in $`\kappa`$ vertices. To see exactly how that
relation applies, lay out successive blocks of types
$`\kappa,\kappa^2,\ldots`$ in an ordinal of type
$`\kappa^\omega`$. Label each block by a bijection with
one of the $`B_m`$ in order of increasing $`m`$ (all the
blocks have cardinality $`\kappa`$), and pull back the
edges from $`Q`$. Apply the cited relation separately
to each of the finitely many covering graphs, always
retaining the full order type. The resulting set is
independent in their union and has type $`\kappa^\omega`$. It cannot
meet all but finitely many blocks only countably: the
finite initial blocks together have order type below
$`\kappa^\omega`$, and those countable tail slices together
have countable order type. Its projected independent set
therefore meets infinitely many of the $`B_m`$ uncountably.

Take the union of the projected independent set's fibers
in $`G`$. At each level with uncountably many selections,
the witnessing columns are unbounded. Since these levels
are arbitrarily high, the rank description again yields
full type. The result leaves open how to obtain such a
quotient for an arbitrary pentagon-free graph.

The [robust-link graphs](ROBUST-PARTS.md) from the other note
fit this target condition. Orient every pentagon cyclically,
choose a total order of the vertices, and split the edges
according to whether their arrows point forward or backward.
Neither of the two graphs can contain a pentagon: its cyclic
orientation cannot follow a strict total order in one
direction. This only gives a permissible target; it does not
obtain the homomorphism or the large-fiber condition.

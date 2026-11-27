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

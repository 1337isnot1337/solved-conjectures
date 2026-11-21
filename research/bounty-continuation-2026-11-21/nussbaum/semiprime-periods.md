# Periods with two distinct prime factors of multiplicity one

**Theorem.** Let a ternary Boolean-formula orbit have length $`p=qr`$ with $`q,r`$ distinct primes. Its completion faces contain at least $`p`$ distinct Boolean vertices in their union. In particular $`p\le2^n`$ in dimension $`n`$. Together with [the prime-power theorem](prime-power-periods.md), this covers all semiprime periods and all powers of a single prime. The [US$100 question](https://sites.math.rutgers.edu/~zeilberg/math640_10.html) includes other periods.

## A dichotomy for the compatibility graph

The argument applies to any graph on $`\mathbb Z/(qr)`$ whose translations preserve adjacency. Use the Chinese remainder theorem to label its vertices by the cells of a $`q`$-by-$`r`$ array. A *row cylinder* consists of a subset of the rows, with every cell of every selected row. Define column cylinders the same way.

If a maximal clique has trivial stabilizer, its $`p`$ translates are distinct maximal cliques. The completion faces belonging to each clique share a Boolean vertex. Vertices shared by different maximal cliques must differ. This already gives the conclusion. A complete graph likewise satisfies the [least-stabilizer theorem](prime-power-periods.md).

Suppose the graph is incomplete and no maximal clique has trivial stabilizer. Its remaining possible stabilizers are the two prime-order subgroups, since a nonempty clique stabilized by the entire group is the entire vertex set. Thus every maximal clique is a row cylinder or a column cylinder. If all cliques have the same kind, their stabilizers coincide and the least-stabilizer theorem applies. Assume both kinds occur. Every row and every column is a clique, by translating any one row or column from the corresponding cylinder.

Give the row indices a graph $`R`$ by joining two *different* indices if their whole rows occur together in a row-cylinder clique. Define $`S`$ on the column indices similarly. Both graphs are translation-invariant. Two cells with different row and column indices meet in the graph exactly when their rows are adjacent in $`R`$ or their columns are adjacent in $`S`$: every edge extends to a maximal clique, and every clique of either kind includes all indicated cells. Neither $`R`$ nor $`S`$ can be complete, because otherwise all cells would be pairwise adjacent.

Suppose $`i,k,i'`$ is an induced three-vertex path in $`R`$. Take nonadjacent distinct indices $`j,j'`$ in $`S`$. The three cells

```math
(i,j),\quad(i',j),\quad(k,j')
```

form a clique. The first two share their column and the third is adjacent to each by its row. A maximal clique containing these cells cannot be a row cylinder, because $`i,i'`$ are nonadjacent in $`R`$. Nor can it be a column cylinder, because $`j,j'`$ are nonadjacent in $`S`$. This contradicts the cylinder dichotomy. Thus $`R`$ has no induced three-vertex path, and by symmetry neither does $`S`$.

Any connected graph without an induced three-vertex path is complete: the first three vertices of a shortest path between nonneighbors would form such a path. On the other hand a translation-invariant graph on a cyclic group of prime order is connected as soon as it has one edge, because any nonzero step generates that group. It follows that both $`R`$ and $`S`$ are edgeless. The original graph therefore has adjacency exactly for cells in a shared row or column.

## Completion in the grid case

There is just one orbit face per cell. Faces in different rows and columns are disjoint, and those sharing a row or column intersect. The [local grid-union theorem, `2](local-grid-and-one-star-orbit.md) gives at least $`qr`$ Boolean vertices in the union, with arbitrary face dimensions. This proves the assertion.

For arbitrary periods, clique stabilizers can have further proper subgroups, and the two-cylinder dichotomy need not hold. In particular an array of *classes* with multiple faces per cell is not the unweighted grid in the last step above. Applying the argument to an iterate does bound every semiprime divisor of an arbitrary orbit period. No inference from the individual divisor bounds to the entire period is made here.

## Finite checks

The [checker](check_cyclic_periods.py) independently enumerates maximal cliques and their setwise stabilizers. It tested the replica construction on 293 prime-power circulants, including an order-27 example with stabilizer orders 3 and 9, and on two literal small-cube face families. It also enumerated every undirected circulant with the specified cyclic labeling at orders 6, 10, 14, 15, 21 and 22. At each of the six orders exactly one graph reached the grid case after excluding graphs with a trivial clique stabilizer or a single common stabilizer. These are checks of the argument on finite inputs. The general theorem follows from the proof above.

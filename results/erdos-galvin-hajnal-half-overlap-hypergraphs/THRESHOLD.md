# The complete overlap threshold on $`\aleph_2`$ vertices

This is a consequence of the [rectangle construction](PROOF.md)
and the neighboring theorems in the original paper. It concerns
all finite uniformities, including odd ones.

Fix integers $`r\ge3`$ and $`1\le i\lt r`$. Consider the existence
of an $`r`$-uniform hypergraph on exactly $`\aleph_2`$ vertices
with uncountable chromatic number and pairwise intersection
at most $`i`$. Then, relative to the consistency of ZFC:

| Parameters | Status |
| --- | --- |
| $`r\le2i`$ | Such a hypergraph exists in ZFC, with chromatic number exactly $`\aleph_1`$. |
| $`r=2i+1`$ | Existence is independent of ZFC. |
| $`r\ge2i+2`$ | No such hypergraph exists in ZFC. |

For the first row, if $`r`$ is even use the construction
at width $`r/2`$, where the overlap is exactly bounded by
$`r/2\le i`$. If $`r`$ is odd, use width $`(r+1)/2\le i`$
and delete one vertex from each edge. A monochromatic
original edge still supplies a monochromatic retained
edge. Both rows of each edge are still occupied, so
distinct original row pairs give distinct retained edges
and the union still has size $`\aleph_2`$. Coloring by
column remains proper, because the retained edge uses
at least two columns. In particular, the two existence
questions of EGH Problem 12 follow as numerical corollaries
of this general result, not as separate targets.

For the boundary $`r=2i+1`$, existence in a GCH model is
[EGH Theorem B(b) and Corollary 12.4](https://www.renyi.hu/~p_erdos/1975-24.pdf),
with base cardinal $`\aleph_0`$ and two successor steps.
In a model of $`\mathrm{MA}_{\aleph_2}`$, their Theorem 5.6
says any uncountably chromatic $`r`$-uniform hypergraph on
$`\aleph_2`$ vertices has an $`(i+1)`$-set in at least two
edges. This is incompatible with the required overlap.
The Martin's axiom model is the classical
[iterated ccc forcing model](https://annals.math.princeton.edu/1971/94-2/p01)
with continuum above $`\aleph_2`$. Both models are relatively
consistent with ZFC. These two
boundary directions are credited to the original paper.

For $`r\ge2i+2`$, the nonexistence is their Theorem B(a)
with the same base cardinal and two successors. Thus the
rectangle construction supplies a uniform ZFC existence proof throughout
the first row, including all the half-overlap cases in Problem 11.
Some individual cases in this row, including $`(4,2)`$ and $`(9,6)`$, were
already known unconditionally. The boundary and impossibility results
are due to Erdős, Galvin and Hajnal.

## Other successor cardinals

The rectangle argument works unchanged on
$`\lambda^+\times\lambda`$, for any infinite $`\lambda`$
admitting a strong coloring
$`\lambda^+\nrightarrow[\lambda^+]^2_{\lambda^+}`$.
For a palette of size $`\mu<\lambda`$, every row has at
least $`n`$ columns of one color; there are at most
$`\lambda`$ choices of a color and $`n`$-set of columns.
Some choice occurs on $`\lambda^+`$ rows, and the
strong coloring yields its rectangle. Coloring by
column is proper for $`n\ge2`$, so the exact
chromatic number is $`\lambda`$. This construction
therefore applies to all infinite regular $`\lambda`$
by [Rinot–Todorčević (2013)](https://doi.org/10.4064/fm220-2-2).
The odd-uniformity trimming also works.


## One family for every width at once

One may send the strong coloring to the set of all finite
subsets of $`\lambda`$ of size at least two, rather than to
just $`[\lambda]^n`$, and keep one rectangle per row pair
as before. For each finite $`n\ge2`$, the layer of $`2n`$-edges
has chromatic number $`\lambda`$ by the same argument.
Across different layers, two distinct edges intersect in
at most half the size of the smaller edge, because their
row pairs share at most one row.

Moreover, for any coloring with fewer than $`\lambda`$
colors, a **single vertex color** has monochromatic edges
in every layer. In each row choose a vertex color occurring
infinitely often (indeed, if $`\lambda`$ is regular, some
color occurs on $`\lambda`$ columns). Fix that color on
$`\lambda^+`$ rows. For any prescribed $`n`$, then choose and
fix an $`n`$-set of columns on $`\lambda^+`$ of those rows.
The graph of row pairs realizing its label has an edge
on every subset of those rows of size $`\lambda^+`$.
Recursively discarding the endpoints already used gives
$`\lambda^+`$ disjoint monochromatic $`2n`$-edges there.

## Direct check of the impossible range

For $`r\ge2i+2`$, the original conclusion can also be seen
by applying finite-trigger closure twice. On at most
$`\aleph_2`$ vertices, close sets under adjoining the unique
edge containing a given $`(i+1)`$-set, whenever it exists.
The closure of a set of infinite size does not increase that
size. Use a continuous covering chain of closed sets of
size at most $`\aleph_1`$, starting empty. For each edge,
at most $`i`$ of its vertices are below the last layer that
it meets, or closure would put the whole edge below that layer.

Within each layer $`D`$, repeat with a continuous chain of
countable subsets, using closure under adjoining $`E\cap D`$
when an $`(i+1)`$-set is contained in an original edge $`E`$.
Color each of these countable differences injectively by
$`\omega`$, reusing the same palette everywhere. For a given
edge, take its last first-level layer $`D`$, then its last
second-level difference within $`D`$. At most $`i`$ edge
vertices in $`D`$ lie below this difference by the second
closure. So at least $`r-2i\ge2`$ edge vertices belong to a
single injectively colored difference. This makes the
original coloring proper.

# Low-load biclique covers and large maximal independent sets

**Partial for Erdős #611.** In this note $`H`$ is the complement of
the graph in the clique-transversal statement. We hit all maximal
independent sets of size at least $`cn`$, even if $`H`$ also has smaller
maximal independent sets. The unrestricted question stays open.

## The upper bound

Let $`0<c\le1`$. Let $`H`$ have $`n`$ vertices, and suppose its edges are covered by
complete bipartite subgraphs with disjoint sides $`A_i,B_i`$.
The subgraphs and their sides need not be induced. Let
$`L=\sum_i(|A_i|+|B_i|)`$ be the total vertex incidence in the cover,
and write $`K=L/n`$. For $`n\ge 4`$, a set of size

```math
O\left(\frac{\sqrt n}{c}
      +\frac{K^2n}{c(\log n)^2}\right)
```

meets every maximal independent set of size at least $`cn`$.
In particular the conjectured sublinear bound holds for cover
load $`L=o(n\log n)`$ when $`c>0`$ is fixed.

For example, this applies when conflicts between graph vertices
are represented by oppositely signed occurrences of labels and
the average number of occurrences per vertex is bounded. Each
label gives a biclique between its positive and negative
occurrences. Two copies of a bounded-rank hypergraph, with
cross-copy conflicts given by intersection, are one instance.

### A bound for any cut in the cover

Arrange the normalized loads $`p_i=(|A_i|+|B_i|)/n`$ in
nonincreasing order, extending by zeros. Fix a positive integer
$`h`$ and call the first $`h`$ bicliques heavy. Independent sets
use at most one side of each heavy biclique, including when
the sides themselves contain edges. We may assign a side
arbitrarily if the set meets neither. For each of the $`2^h`$
orientation patterns, let its candidate region consist of
all vertices that avoid the forbidden sides. A maximal independent
set realizing a pattern is contained in that candidate region.

Take $`s=\lceil(h\log 2+\log 4)/c\rceil`$ independent uniform
samples from the vertices, with replacement. The probability
of missing even one candidate region of size at least $`cn`$
is at most $`2^h(1-c)^s\le 1/4`$. To each sample $`v`$ add $`v`$
itself and every neighbor linked to it through a light
biclique. The expected total size of these additions,
counting repetitions to upper bound their union, is at most

```math
s\left(1+\frac{2}{n}\sum_{i>h}|A_i||B_i|\right)
\le s\left(1+\frac n2\sum_{i>h}p_i^2\right).
```

With positive probability all the large regions are hit by
the samples and the size of the additions is at most twice
the expectation, by Markov's inequality.

Let $`I`$ be a maximal independent set of size at least $`cn`$.
There is a sample $`v`$ in the candidate region of a pattern
realized by $`I`$. If $`v\in I`$, it already hits $`I`$. Otherwise
maximality gives a neighbor $`w\in I`$ of $`v`$. No heavy
biclique can contain the edge $`vw`$, since both vertices
avoid the forbidden sides. The edge must occur in a light
biclique, so $`w`$ was added.

### Choosing a cut with small squared tail

For $`j\ge0`$ set $`Q_j=(2^j\sum_{i>2^j}p_i^2)^{1/2}`$.
By separating the tail into dyadic index bands,

```math
 Q_j\le \sum_{\ell\ge j}2^{(j-\ell)/2}
          \bigl(2^\ell p_{2^\ell+1}\bigr).
```

For $`\ell\ge1`$ the expression in parentheses is at most twice
the sum of the entries with indices $`2^{\ell-1}<i\le2^\ell`$,
by monotonicity. These index bands are disjoint; the
$`\ell=0`$ term is at most $`p_1`$. Summing over $`j`$ and using a
geometric series gives $`\sum_{j\ge0}Q_j=O(K)`$. Thus, among
$`0\le j\le\lfloor\tfrac12\log_2 n\rfloor`$, some $`Q_j`$ is
$`O(K/\log n)`$. Use $`h=2^j`$ in the preceding bound and
$`s=O(h/c)`$ to obtain the result.

## Sparse residual edges

If the exact bicliques leave a graph of $`m`$ additional
edges uncovered, add the uncovered neighbors of each
sample too. The expected extra cost is at most $`2sm/n`$.
The same proof works, choosing the dyadic cut amongst
$`1\le h\le M=\min\{\sqrt n,n/\sqrt{m+1}\}`$ when $`M\ge 2`$.
The bound is then

```math
O\left(\frac{\sqrt n+\sqrt{m+1}}{c}
        +\frac{K^2n}{c(\log M)^2}\right).
```

In particular $`L=O(n)`$ and $`m=o(n^2)`$ suffice. This uses
a biclique incidence budget, not a geometric neighborhood
representation or a bound on induced bicliques.

## Both kinds of edit error

The union $`H_0`$ of the given bicliques need not be a subgraph of
$`H`$. The sublinear conclusion still follows from $`L=O(n)`$ and
$`|E(H)\mathbin{\triangle}E(H_0)|=m=o(n^2)`$.

For proof, keep the first $`h`$ cover terms heavy. Put
$`\eta=c/(4h)`$ and include in the transversal every vertex
with at least $`\eta n`$ missing neighbors in the opposite
side of some heavy biclique. Each missing edge counts at most
twice per cover term, so at most $`2hm/(\eta n)`$ vertices
are included. Consider a size-at-least-$`cn`$ maximal independent
set $`I`$ not already hit. For a heavy term, if $`I`$ uses at least
$`\eta n`$ vertices of one side, it uses none of the opposite
side: a vertex of $`I`$ on the opposite side would have too many
missing neighbors and already have been included. Label the term
by the large side. Otherwise label it inactive. Across all
inactive terms, removing both sides from $`I`$ loses at most
$`2h\eta n=cn/2`$ vertices.

A candidate region now consists of vertices compatible with
every large-side label and on neither side of an inactive
term. There are at most $`3^h`$ regions, and the region associated
with an unhit $`I`$ has size at least $`cn/2`$. Use $`O(h/c)`$ uniform
samples as before. A sample compatible with $`I`$ cannot be linked
by any heavy biclique to any vertex in $`I`$, including those
removed just for the region calculation. Thus any actual
neighbor in $`I`$ of this sample is linked by a light biclique,
or is an added edge outside $`H_0`$. Add both kinds of neighbors
to the transversal. Their expected total contribution has the
same bound as for a sparse residual. The potential false
positive light edges only increase that bound.

Take the dyadic cut with
$`M=\min\{\sqrt n,(n^2/(m+1))^{1/4}\}`$, for $`M\ge2`$.
The additional exceptional-vertex cost is
$`O(h^2 m/(cn))=O(\sqrt{m+1}/c)`$, and the resulting bound
has the same form as for the sparse residual, with this new
value of $`M`$. In particular $`M`$ tends to infinity when
$`m=o(n^2)`$.

## Signed hypergraph pitfall

If a ground-set two-coloring makes each selected support
nonmonochromatic, the associated disjointness clique avoids
the selected copies, but it need not be maximal. Extending
it may introduce a selected copy: an oppositely colored
element of its support may occur in no monochromatic support
on that side. In fact, with support size and element degrees
both bounded, the closed conflict neighborhood of any one
support already gives a bounded transversal. Local
two-colorability of target supports alone cannot yield a
counterexample to the unrestricted conjecture.

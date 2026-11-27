# A Hamiltonian strengthening

Every co-diamond-free vertex-critical graph with at least three
vertices has a Hamilton cycle. Continue using I, R, the integer s
and the label classes from [PROOF.md](PROOF.md). Write A_i for the
set of vertices of R whose sole missing neighbor in I is i.

## Extra degree from criticality

For $`s\ge3`$, write k for the chromatic number of G and take a
$`(k-1)`$-coloring of $`G-i`$ for any $`i\in I`$. The remaining
$`s-1`$ members of I must receive distinct colors. If two shared a
color, their class could contain no member of R, which misses at
most one member of I. Then i could reuse that color. A vertex of
the nonempty class A_i sees all remaining members of I, hence
requires another color. It follows that $`k-1\ge s`$. The standard
criticality bound now gives minimum degree at least $`k-1\ge s`$:
otherwise a coloring after deleting a vertex of smaller degree
could be extended to it.

## No cut of size s minus one

It suffices to consider exactly $`s-1`$ deleted vertices, since
the previous proof handles smaller cuts. If at least three members
of I survive, the shared-neighbor argument connects all surviving
R vertices in the bipartite subgraph. If any deletions were in I,
at least two different labels survive in R, so every surviving
I vertex attaches to that component. If all deletions were in R,
one instead uses the minimum degree bound s to conclude that every
vertex of I has a surviving neighbor in R. Thus these cuts do not
disconnect the graph.

If exactly one member i of I survives, all of R is still present.
Suppose a component C does not contain i. Every vertex of C
belongs to A_i. Each such vertex has s minus one neighbors in I
before deletion, so the minimum degree bound forces it to have a
neighbor in R. Hence C contains an edge. If any member of A_i
were outside C, it would be nonadjacent to i, and those two vertices
with an edge of C would form an induced co-diamond. Thus C
contains all of A_i, the remaining R vertices attach to i, and
the rest of the graph after the cut is a clique B containing i:
any nonadjacent pair in B with an edge of C is again forbidden.
Putting $`m=\max(\chi(C),|B|-1)`$, we can color C and $`B-i`$ using
the same m colors, since they are anticomplete, and use one fresh
color on all of I. But $`m+1`$ is already attained by one of the
proper induced subgraphs B or $`C+j`$ with $`j\in I\setminus\{i\}`$.
This contradicts vertex-criticality.

If exactly two members of I survive and $`s\ge4`$, at most one
vertex of R was deleted, and at least two distinct labels were
outside the surviving pair. At least one such representative
survives and joins the two members of I, so all surviving R
vertices attach to that component.

The remaining case is $`s=3`$ with two surviving members a and b.
The cut comprises the third member c and one member w of R.
To fail the preceding joining argument, w must be the sole
representative of label c and there can be no zero label.
Then a is joined to A_b and b is joined to A_a. If a cut
disconnects the graph, these are exactly its two components
X and Y, with no edges between them. Both contain edges by
nonemptiness of A_a and A_b, so each must be a clique:
two nonadjacent vertices in one and an edge in the other
would induce a co-diamond.

Each of the induced graphs on X plus the cut, and Y plus the
cut, is $`(k-1)`$-colorable by criticality. Each allows distinct
colors on c and w. In fact, in X the attachment of c is to every
vertex except a and w is adjacent to a. If $`|X|=k-1`$, c must
receive the color of a and w must receive another. If
$`|X|<k-1`$, use the color of a for c and a spare color for w.
The same reasoning uses b for Y. Since c and w are nonadjacent,
the described colorings in the latter case have no further conflict.
Permuting colors to agree on the two cut vertices and joining
the sides gives a $`(k-1)`$-coloring of G, a contradiction.

Thus the connectivity is at least $`s=\alpha(G)`$ for $`s\ge3`$,
and the [Chvátal–Erdős Hamilton cycle theorem](https://www.renyi.hu/~p_erdos/1972-02.pdf#page=1)
applies. For independence number two a vertex-critical graph
on at least three vertices is connected: otherwise removing a
vertex in a component other than one of maximum chromatic number
would preserve the chromatic number. It has no cut vertex, since
subgraph colorings across a cut vertex can be made to agree by
permutation.
Its connectivity is therefore at least two and the same theorem
applies. Independence number one means the graph is complete.

# Cameron–Clow’s co-diamond path-perfect conjecture

Every graph with no induced copy of $`K_2+2K_1`$ is path-perfect.
That is, every induced subgraph H has a path whose vertex set
induces a graph of chromatic number $`\chi(H)`$.

This is the co-diamond-free assertion separately raised in §1.2
and listed in Conjecture 7.3 of
[Cameron and Clow](https://arxiv.org/html/2506.19100v1).
It does not claim the companion $`2K_2`$-free assertion or the
unrestricted odd-cycle question of Erdős and Hajnal.

## Reduction to vertex-critical graphs

For any induced subgraph H, take a smallest induced subgraph G
of H with the same chromatic number. G is vertex-critical:
deleting any vertex lowers its chromatic number. A Hamilton
path of G suffices, since H induces exactly G on its vertices.
The empty graph is harmless; for nonempty G with independence
number at most three, traceability follows from Cameron and
Clow's Lemma 2.2 by vertex-criticality. We prove traceability
for every larger independence number.

Let I be a maximum independent set, of size $`s\ge4`$, and put
$`R=V(G)\setminus I`$. Every vertex of R is adjacent to some
vertex of I by maximality. It misses at most one vertex of I:
two missed vertices and any adjacent vertex of I would induce
$`K_2+2K_1`$ together with it. Label each vertex of R by its
unique missed vertex of I, or by 0 if it misses none.

Every label in I occurs. For a fixed $`i\in I`$ choose a
different $`j\in I`$ and take a $`(\chi(G)-1)`$-coloring of
$`G-j`$. The color of i must occur on a neighbor of j; otherwise
it can be given to j. That neighbor lies outside I, and it
misses i because it has the same color as i. Its label is
therefore i. In particular $`|R|\ge s`$.

## Cover the remainder by s oriented paths

Start with one path per vertex of R and repeatedly concatenate
two paths with adjacent endpoints. Each concatenation reduces
the number of paths. Once no such pair remains, choosing one
endpoint from each gives an independent set, so there are at
most s paths. A single vertex counts as a path with both
endpoint labels equal.

We can split paths until there are exactly s, while preserving
the following property: there is a zero endpoint label, or at
least two distinct nonzero endpoint labels. If the existing
endpoints already satisfy this property, splitting preserves it.
Otherwise all the endpoints have the same label a. There must
be fewer than s paths at this point: s endpoints, one from
each, would be independent and all would miss the vertex of I
labeled a, contradicting maximal size s. Some outside vertex of
a different label b is internal to a path. Split at either
edge incident with it to create an endpoint of label b while
retaining the original endpoints. Further splitting is possible
until there are s paths because $`|R|\ge s`$.

## The gap matching lemma

Consider any s disjoint paths, with $`s\ge4`$, whose endpoint
labels come from $`\{0,1,\ldots,s\}`$, and with a zero label
or two distinct endpoint labels. Order the paths and orient
each. There will be s slots for connector vertices: one before
the first path, and one between each two consecutive paths.
Each slot forbids the nonzero labels of its bordering
endpoints, so the first forbids at most one and each other
slot at most two.

We arrange the endpoints so that:

1. If the exterior slot's forbidden label is a, some internal
   slot permits a.
2. At least one internal slot forbids at most one label, or two
   internal slots forbid different two-element label sets.

To do so, choose the first path and its exterior endpoint so that
either the exterior label is zero or two other paths each have
an endpoint differing from its nonzero label a. Such a selection
exists. If zero occurs, use it. Otherwise start with any exterior
label a. If at most one other path has a different endpoint
label, at least $`s-2\ge2`$ other paths have both endpoints
labeled a. Choose an endpoint of a different label as the
exterior instead; those all-a paths are now the required two.

Choose two other paths B and C and a facing endpoint from each,
of labels b and c, neither equal to a when a is nonzero. If these
labels are equal or one is zero, put B and C next to each other
with these endpoints facing. The resulting slot satisfies both
requirements.

Otherwise b and c are distinct and nonzero. Take a fourth path D
distinct from the first path, B and C. Let d be the inward endpoint
label of the first path. If possible place D second, oriented with
its left endpoint so the new slot does not forbid exactly
$`\{b,c\}`$, and then put B and C consecutively with their
chosen labels facing. This gives the two different internal
forbidden sets and the B–C slot permits a. If D cannot be
oriented that way, d is one of b,c and both endpoints of D
carry the other label. Put D next to the path among B and C
whose facing endpoint has that other label, making an internal gap
with just that label forbidden. This supplies both requirements.
Any paths with no specified location or orientation can be
appended arbitrarily.

Now form the bipartite graph of s slots and s labels in I,
joining a slot to each permitted label. Hall's condition holds.
A nonempty collection of at most $`s-2`$ slots has at least
$`s-2`$ labels available. Of collections of $`s-1`$ slots, any
that includes the exterior slot already has at least $`s-1`$
available labels. For the collection of all internal slots,
requirement 2 prevents two labels being forbidden everywhere.
Finally all s slots together allow every label by requirement 1
or because the exterior slot permits every label. A perfect
matching assigns every label to exactly one slot.

## Finish

For the R paths, a label is permitted in a slot exactly when
the corresponding vertex of I is adjacent to every bordering
endpoint of the slot. Insert the matched vertices of I in
their slots. This concatenates the oriented paths to a single
Hamilton path of G. All arguments apply for arbitrary s and
graph order. Returning to the first reduction proves
path-perfectness for the entire co-diamond-free class.

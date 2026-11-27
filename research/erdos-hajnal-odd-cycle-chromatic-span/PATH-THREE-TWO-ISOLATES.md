# The three-vertex path with two isolates forces path-perfectness

Every graph forbidding an induced three-vertex path together with
two isolated vertices is path-perfect. This is a further whole
hereditary class, not a bound at a fixed chromatic number or order.
It does not settle the unrestricted Erdős–Hajnal odd-cycle question.

## Clique branches around a maximum independent set

It suffices to find a spanning path in every vertex-critical graph
G of the class. Let I be a maximum independent set, of size s.
If s <= 4, the [small-independence deduction](../cameron-clow-independence-four-path-perfect/PROOF.md)
already gives a spanning path. Assume s >= 5.

Every vertex outside I has a neighbor in I. Call it light if it
has exactly one, and heavy otherwise. A heavy vertex misses at
most one vertex of I: two of its neighbors in I form an induced
three-vertex path with it, and two nonneighbors in I would be the
forbidden isolates.

For each i in I let C_i consist of i and all light vertices
whose unique neighbor in I is i. Each C_i is a clique: two
nonadjacent lights in the same branch, with center i, form
the forbidden path while any two other vertices of I are
isolates. The branches are mutually anticomplete. Indeed an
edge between lights in branches i and j would give an induced
path starting at i, and two vertices in I outside i,j would
be isolates. Edges involving representatives do not occur
by the definition of light.

Put R equal to the heavy vertices. Any vertex v in R is complete
to all but at most one whole branch. Otherwise take nonneighbors
in two distinct branches, i and j. There are at least two of v's
neighbors in I outside i,j because s >= 5 and v misses at most
one representative. They form an induced path with center v,
and the two chosen nonneighbors from the distinct branches
are independent and anticomplete to this path.

Give each v in R the label of its unique branch of incomplete
adjacency, or no label if it is complete to every branch.
At most one label is unused. If branches C_i,C_j were both
complete to all of R, choose i with |C_i| <= |C_j|. Delete
one vertex u from C_i and take a coloring with one fewer than
the chromatic number. All |C_j| colors on C_j are absent from
R, while at most |C_i|-1 appear in the rest of C_i. Thus one
of the colors on C_j can be used on u, since distinct branches
are anticomplete. This contradicts criticality. In particular
|R| >= s-1, with at least s-1 distinct nonempty labels.

## A path-cover lemma with two prescribed endpoints

In any graph H, any two distinct prescribed vertices can be
made endpoints of paths in a cover of H by at most alpha(H)
disjoint paths. A singleton counts as its own endpoint.

Start with singletons, and concatenate paths whenever their
available endpoints are adjacent, while keeping the two
prescribed vertices as endpoints of different paths. An
available endpoint is one other than the prescribed endpoint,
or the sole vertex of a singleton. If no concatenation is
possible, choose one available endpoint per path. The only
possible edge among them is between the two paths containing
the prescribed vertices. If there is no such edge, the chosen
endpoints are an independent set and the number of paths is at
most alpha(H). If the edge exists, those two paths can now
be concatenated. Both prescribed vertices remain endpoints,
and before this last merge the selected endpoints minus one
form an independent set, bounding the final number of paths
by alpha(H).

## Interleaving the branch cliques and the heavy paths

First suppose |R|=s-1. Use the heavy vertices as singleton paths.
All their labels are distinct. Arrange the s-1 paths in a line,
with an extra branch slot at either end and one between every
two consecutive paths.

If |R|>=s, choose two vertices in R with different nonempty
labels. Use the path-cover lemma to make both endpoints in
a cover of G[R] with at most alpha(G[R])<=s paths. Split some
of the paths, if necessary, to obtain exactly s paths. Splits
preserve the prescribed endpoints. We will arrange and orient
these s paths in a line. Place one branch slot in each interior
gap and one at the final end, where the last path ends.

There are s branch slots in either case, each to be filled by
one of the s distinct branch cliques. A branch is allowed in
a slot if no adjacent path endpoint has its label. As a result
each interior slot forbids at most two labels and each end slot
at most one. Realize a match by inserting a spanning path of the
chosen branch clique in its slot, since both adjacent endpoints
are complete to that clique whenever the branch is allowed.

We show that the slots have a perfect matching to the branches
by Hall's theorem. Any subset of at most s-2 slots has at least
s-2 allowed branches even in a single slot. A subset of s-1
slots that includes an end slot also satisfies Hall. Therefore
the only potential obstructions are:

1. A single label is forbidden from all s slots.
2. In the case of just one end slot, the s-1 interior slots
   all forbid the same pair of labels.

For |R|=s-1 the second obstruction does not apply, and the
distinct labels at the two ends prevent the first. So we may
assume there are s heavy paths and only one end slot.

If some path endpoint has no label, put its path last and
orient it toward that endpoint. This rules out the first
obstruction. Among the other s-1>=4 paths, if two endpoints
on different paths share a label, or one has no label, make
those paths consecutive so the endpoints face each other.
The resulting slot forbids at most one label. If this is
not possible, nonempty endpoint-label sets of distinct
nonfinal paths are disjoint and none of those paths has an
unlabelled endpoint. Choose four nonfinal paths and make two
disjoint such consecutive pairs. The two resulting interior
slots forbid different pairs. In all cases the second
obstruction is avoided as well.

If every endpoint has a label, there is a path that can
be oriented as the final path, ending at a label i, and at
least two other paths each with an endpoint of label
different from i. Otherwise, for each endpoint label i,
its path would have at least s-2 other paths all of whose
endpoints are labelled i. For the two distinct labels
present this would require two disjoint sets of s-2 paths,
contradicting s>=5.

Make two such nonfinal paths consecutive, facing their labels
j,k different from i toward one another. This gives an
interior slot that does not forbid i, preventing the first
obstruction. If j=k the same slot forbids just one label.
If j and k differ and any remaining nonfinal path has an
endpoint with label outside {j,k}, make a second consecutive
pair using that endpoint and any other nonfinal path
disjoint from the first pair. This is possible because there
are at least four nonfinal paths. The two interior slots
forbid different sets. In the remaining case all endpoints
on the other nonfinal paths lie in {j,k}. Pair an endpoint
of one of those paths with the endpoint of its own label
from the original pair. The resulting slot forbids just
that one label, still different from i, so it avoids both
obstructions at once.

Hall's condition now holds and the interleaving gives the desired
spanning path. The proof works for every critical graph
in the class, giving the hereditary assertion.

## Related literature

[Cameron–Clow, Theorem 1.5](https://arxiv.org/html/2506.19100v1#S1.SS2)
proves path-perfectness for the stronger condition excluding
a three-vertex path and one isolated vertex. That does not imply
the result here. [Abuadas–Cameron–Hoàng–Sawada](https://arxiv.org/abs/2206.03422)
prove finiteness of fixed-chromatic-number critical graphs for
a three-vertex path plus any fixed number of isolates, not
traceability of each of these graphs. Work on
[Hamilton cycles under toughness](https://arxiv.org/abs/2107.08476)
in the two-isolate class assumes a substantially stronger
condition and addresses a different property.

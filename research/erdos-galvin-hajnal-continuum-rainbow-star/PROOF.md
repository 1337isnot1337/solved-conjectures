# Erdős–Galvin–Hajnal’s continuum rainbow-star problem

**Answer: yes in ZFC.** For every positive integer (n) there is
a graph (G) on (2^{aleph_0}) vertices, with no
(C_3,C_5,ldots,C_{2n+1}), whose edges can be labelled with
(2^{aleph_0}) labels so that in every countable colouring of
the vertices, one vertex has same-colour neighbours along
edges of every label.

This is [Problem 6, p. 462 of Erdős–Galvin–Hajnal (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=38),
with [Definition 6.3 on p. 448](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=24).
We in fact retain the ordinary chromatic number of the base
graph and obtain as many neighbours per label as there are
vertices in the host.

## A star-labelling transfer

**Theorem.** Let (muge1) be a cardinal and (lambda) an
infinite cardinal with (lambda^mu=lambda). Let (B)
be a simple graph on at most (lambda) vertices such that
(chi(B)>mu). Then there is a simple graph (G) on
exactly (lambda) vertices and a graph homomorphism
(G	o B), together with an edge labelling
(ell:E(G)	olambda) with this property: under any
vertex colouring of (G) with at most (mu) colours,
some vertex has (lambda) neighbours of its own colour
along edges of each of the (lambda) labels.

The required number of vertices is best possible for such
a label palette, already in the one-colour case.

### Construction

Orient every edge of (B), using exactly one direction per
edge. For (win V(B)) let (V_w) be an independent fibre of
size (lambda), and make the fibres pairwise disjoint.
Put
[
I_w=igcup_{u	o w} V_u.
]
This is a set of at most (lambda) vertices. For each (w),
a **code** is a pair ((S,p)) with (Ssubseteq I_w),
(0<|S|lemu), and (p:S	olambda). There are at most
(lambda) codes: the graph of (p) is a nonempty subset
of (I_w	imeslambda) of size at most (mu), and each
such subset is the range of a (mu)-sequence (repetition
allowed). Thus one can allocate (lambda) distinct
vertices of (V_w) to each code, with disjoint allocations
for different codes. If there are no codes, leave (V_w)
unallocated.

For every (xin V_w) allocated to ((S,p)), join (x) to
each (sin S) by an edge of label (p(s)). There are no
other edges. An unordered pair can get a label only from
the target of its underlying oriented template edge.
That endpoint belongs to at most one code. Hence labels
are well-defined. The fibre map is a homomorphism, and the
total vertex count is (lambda).

### No new colour can appear everywhere

Fix a vertex colouring (a) with at most (mu) colours.
For (win V(B)), let (P(w)) be the nonempty set of
colours appearing on (V_w). There must be a vertex (w)
such that
[
P(w)subseteqigcup_{u	o w}P(u).
]
Indeed, if every (w) had a colour (b(w)) in its own
profile and not in that union, then (b) would properly
colour (B) with at most (mu) colours: for every
(u	o w), one has (b(u)in P(u)) but (b(w)
otin P(u)).
This contradicts (chi(B)>mu).

For each colour in (P(w)), choose one representative
in (I_w) of that colour. Let (S) be the set of these
representatives, so (0<|S|lemu). If the desired
property failed at every vertex, then for each (sin S)
one could choose a label (p(s)) for which (s) has
strictly fewer than (lambda) same-colour neighbours
along edges of that label. Consider the (lambda)
vertices assigned to ((S,p)) in (V_w). Each one
has the colour of some (sin S) and is joined to that
representative by the label (p(s)).

This is impossible because (operatorname{cf}(lambda)>mu).
For finite (mu) this holds for any infinite (lambda).
For infinite (mu), if (operatorname{cf}(lambda)lemu),
König's theorem gives
(lambda < lambda^{operatorname{cf}(lambda)}
lelambda^mu=lambda), a contradiction. Consequently the
union over at most (mu) representatives of fewer than
(lambda) exceptions per representative has size strictly
less than (lambda), whereas every allocated vertex lies
in that union. This proves the theorem. For the original
assertion of at least one neighbour per label, the same
argument uses only one target per code and needs no
cofinality argument.

## The original problem and an arbitrary-cardinal extension

Fix an infinite cardinal (mu) and a positive integer (n).
By [Erdős–Galvin–Hajnal, Lemma 8.3, p. 456](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=32),
the generalized Specker graph on (mu^+) vertices has
chromatic number (mu^+) and no odd cycle of length
(3,5,ldots,2n+1); take it for (B). Set (lambda=2^mu).
Then (mu^+lelambda) and
[
lambda^mu=(2^mu)^mu=2^{mucdotmu}=2^mu=lambda.
]
Apply the transfer theorem. An odd cycle of length at most
(2n+1) in (G) would project to an odd closed walk of the
same length in (B). Such a walk contains a simple odd
cycle of no greater length: if a vertex repeats before
the full walk ends, split there and retain the odd shorter
closed walk, and continue. This contradicts the choice of
(B). Also (chi(G)lechi(B)=mu^+) by the homomorphism,
and (chi(G)>mu) by the labelled-star property, so
(chi(G)=mu^+).

Taking (mu=aleph_0) gives both the exact continuum
size and palette in Problem 6, against all countable
vertex colourings, without CH. More generally this works
for every (mu) at (2^mu), one cardinal lower than the
ZFC host size exhibited by the original Theorem 8.6.

## Difference from the earlier fibre argument

The construction adapts the edge-label coding in
[Erdős–Galvin–Hajnal, Theorem 8.6, pp. 458–459](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=34).
There, codes on the incoming side of **one template edge**
require a pair of identically profiled fibres. Their
ordinary template chromatic number exceeds (2^mu) to
find such a pair. Here a code can draw representatives
from **all incoming fibres at one template vertex**. Asking
whether a profile contains a new colour then uses the
stricter contradiction (chi(B)>mu) instead of
(chi(B)>2^mu). This is what permits size (2^mu).

The result forbids only odd cycles, as asked in Problem 6.
The separate [Problem 7](https://github.com/1337isnot1337/solved-conjectures/issues/1020)
asks to forbid all short cycles on a countable host, with
finitely many vertex colours and infinitely many edge labels.
It has a different, negative answer.

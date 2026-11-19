# A local certificate for Frankl's conjecture

**Restricted theorem.** Suppose a finite union-closed family has a generating collection on a cyclically ordered ground set, with each generator contained in some four consecutive positions. If the family has a nonempty member then some point occurs in at least half its members. The number of positions and the placement of generators are unrestricted. A generator can skip interior positions. The unrestricted conjecture remains open. The proof of this case is computer-assisted.

Adjoin the empty set if necessary. An abundance witness after adjoining it also works before it was adjoined. We may use an inclusion-minimal generating collection. The result for ground sets of at most ten points follows from the published eleven-element theorem (a smaller ground can also be padded by empty columns). Below assume at least eleven positions. [Bošnjak and Marković](https://doi.org/10.37236/812)

## Local test for a general generating collection

Let W be a nonempty subset of ground points. Call generators touching W local, and let B be the points outside W belonging to a local generator. Enumerate unions of local generators, including the empty union, as pairs (S,T) of their traces on W and B. For any two boundary masks M⊆E⊆B form

    C(E,M) = {S : (S,T) is a local union for some M⊆T⊆E}.

Suppose there are nonnegative weights on W, not all zero, for which every C(E,M) has nonnegative total weighted imbalance. The imbalance of an inside pattern is the weight of its present points minus the weight of its missing points. Then some point of W is abundant in the full family.

Indeed fix any occurring exterior trace X on the complement of W. Take the union Z of *all* generators disjoint from W and contained in X, allowing the empty union. Let E=X∩B and M=(X minus Z)∩B. Since X occurs, X minus Z lies in B. Each compatible inside trace occurs in C(E,M) by separating the two types of generators in a representation. Conversely any local union contributing to C(E,M), joined to Z, has exterior exactly X. Thus C(E,M) counts distinct inside patterns exactly once, regardless of how many generator representations they have. Sum the weighted inequalities over all exterior traces to obtain the claim. Testing unrealizable boundary conditions can only make the certificate harder to find.

## Finite proof for four consecutive positions

A singleton gives abundance by adjoining it. For a two-set its two points' imbalances sum to a nonnegative number, since joining the pair injects sets containing neither into sets containing both. A further shortcut works for any generator g: if two points of g together hit every generator meeting g, a member avoiding both is disjoint from g. Joining g injects these members into members containing both points. This is also the set formulation of the two-neighbor criterion of Bruhn, Charbit, Schaudt and Telle. We also use Vaughan's theorem that three distinct triples containing the same point imply Frankl's conjecture. [Two-neighbor criterion](https://arxiv.org/abs/1212.4175) · [Vaughan's theorem as stated in Pulaj, Theorem 7](https://arxiv.org/abs/1903.02317)

After excluding generators of size one or two, a site can start any subset of four shapes. In increasing order of bits, their offset sets are {0,1,2}, {0,1,3}, {0,2,3}, {0,1,2,3}. Thus the generator list becomes a cyclic word in an alphabet of masks. A four-set containing two of the triples would be their union, and can be omitted from a minimal generating list.

1. Enumerate six-letter words. Discard local occurrences of three triples through a point, and of a four-set containing two triples. The same restrictions at a single start can already be imposed on the alphabet. This leaves 65,248 states.
2. Join two states when they overlap on five letters to give a seven-letter word. Reject the word if a generator starting at its middle site passes the two-point test. All generators that could meet this middle generator are visible. There are 227,424 edges. A cyclic list can use only edges whose ends lie in the same strongly connected component. This leaves 20,265 edges, including the all-zero loop.
3. In each remaining seven-letter word examine the middle four sites. All starts that can touch this window are among the seven given letters. There are at most six outside boundary sites. The local test gives certificates for 9,088 words. The 11,177 other words have only 35 edges on directed cycles.
4. Overlap those 35 edges to give the 48 possible eight-letter words. This time the middle window has five sites. The local test gives certificates for 31 words. Of the 17 other edges only the all-zero loop lies on any directed cycle. Thus no nonempty cyclic list can evade every test.

For the middle windows the union of the core with its six possible boundary sites has at most eleven positions, all distinct by the small-ground reduction. All weights used are integers from zero to three. A failed weight search always retains the window.

## Replay

Run `python span_four.py` from this directory. It compiles two separate C++ programs in a temporary directory and checks every generated local witness. The first computes the union of all generators contained in each candidate mask, uses subset sums to count feasible inside patterns for each boundary, and searches for weights. The second explicitly generates all local unions and records which ternary boundary assignments permit each distinct inside trace. It verifies every supplied weight vector over all 729 assignments. The graph reduction is implemented once in the Python driver. The final strongly connected component test leaves only the empty word on a cycle.

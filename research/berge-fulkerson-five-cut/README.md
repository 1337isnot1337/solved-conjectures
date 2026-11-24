# Berge–Fulkerson conjecture

**Status:** partial research checkpoint, not a resolution; priority unverified. The finite classification below is computer-assisted. The full conjecture asserts that every finite bridgeless cubic graph has six perfect matchings (repetitions allowed), with every edge covered exactly twice.

## Literature and priority

- D. R. Fulkerson, *Blocking and anti-blocking pairs of polyhedra*, Mathematical Programming 1 (1971), 168–194, https://doi.org/10.1007/BF01584085.
- P. D. Seymour, *On multi-colourings of cubic graphs, and conjectures of Fulkerson and Tutte*, Proc. London Math. Soc. 38 (1979), 423–460.
- E. Máčajová and G. Mazzuoccolo, *Reduction of the Berge-Fulkerson conjecture to cyclically 5-edge-connected snarks*, Proc. Amer. Math. Soc. 148 (2020), 4643–4652, https://doi.org/10.1090/proc/15057.
- E. Máčajová, G. Mazzuoccolo and V. Tabarelli, *Cycle separating cuts in possible counterexamples to the cycle double cover and the Berge-Fulkerson conjectures*, Ars Math. Contemp. 26(2) (2026), P2.03, https://doi.org/10.26493/1855-3974.3409.c13. The primary publisher abstract already classifies possible admissible-set pairs at 5-cuts into 13 possibilities. This directly overlaps the present approach. The full article was inaccessible during this check; this checkpoint may be a rediscovery or a reformulation of their work. Do not claim priority or improvement over their theorem without comparing full definitions and proofs.
- Magalhães Júnior and Silva, https://arxiv.org/abs/2607.29511, treats the general problem as open in July 2026. No earlier resolution was located in this session.

## Conditional five-cut reduction

Suppose G is a minimum-order counterexample to the conjecture. By the 2020 reduction, it is cyclically 5-edge-connected. Consider a cyclic 5-edge cut with at least seven vertices on each side. Regard each side as a 5-pole, with the cut edges replaced by five labeled stubs.

Each side H is connected: a cyclic component on a disconnected side would itself have a cut of size at least five, leaving no cut edges for other components of a connected G. No vertex of H has internal degree at most one: deleting a degree-one vertex from the side preserves a cycle and decreases the cut size, contradicting cyclic connectivity; degree zero contradicts connectedness. Thus the stubs are attached at distinct vertices. No edge of H is a bridge: both components after removing a bridge would have cycles (all degrees are at least two except possibly one endpoint of the deleted edge in each component), so their cuts in G would each have size at least five. Their cut sizes sum to 5+2=7, impossible. The number of vertices on each side is odd by the degree sum.

A six-cover of a 5-pole consists of six partial perfect matchings, each saturating every internal vertex exactly once, counting stubs as incident edges, and together using every internal edge and stub exactly twice.

The **profile** of a six-cover is the multiset of its six subsets of selected stubs, labeled 1,...,5. Each subset has odd cardinality by the parity of the order of the side; each label occurs twice in the multiset. The six cardinalities sum to ten. Hence there are precisely 56 candidate profiles:

- A: the full five-element set together with the five singletons.
- B(T,U): two three-element sets T,U, allowing equality, and four singleton occurrences. The number of copies of singleton j is 2 minus the multiplicity of j in T,U. There are 55 unordered pairs of triples.

A matching pair of profiles on the two sides gives a six-cover of G by permuting matching indices to agree on all five cut edges. Thus their attainable profile sets X,Y are disjoint in a counterexample.

### Small-cap constraints

By minimality, each side has a common profile with each of these 37 cap constructions; the resulting cubic graph has smaller order and is bridgeless. Bridgelessness follows from internal bridgelessness of H and the fact that every cap edge is on a cycle through the connected H or wholly inside the cap. Every attaching edge is on a cycle by the same argument. All terminals are distinct.

1. For each pair of labels, join those stubs directly and attach the remaining three to one new vertex (10 choices). A matching mask contains either both or neither of the joined pair, and exactly one of the other labels. There are six compatible profiles per cap. The joined edge is used twice, as required.
2. Attach two stubs to each endpoint of a new three-vertex path and the remaining stub to its center (15 choices). A matching mask is either a singleton at an endpoint or a triple containing one label from each of the three vertex groups. The two internal path edges each receive multiplicity two because every endpoint has two stubs, each already used twice in the six matchings. There are ten compatible profiles per cap.
3. Attach one stub at each vertex of a new 5-cycle (12 distinct choices of undirected labeled cycle). A matching mask is a singleton, the full set, or a triple whose complementary pair is an edge of the 5-cycle. Each mask has a matching extension. At every cap vertex the sum of the internal-edge multiplicities is four. On an odd cycle this forces every internal-edge multiplicity to be two. There are sixteen compatible profiles per cap.

The three sizes of the added caps are one, three and five vertices respectively, strictly smaller than the opposite side, whose size is at least seven.

### Exchange constraints

For any attained profile p, represent its six entries by slots, including repeated entries as separate slots. For two slots with masks S,T whose symmetric difference has four labels, the symmetric difference of the corresponding matchings has alternating cycles and alternating paths. Its four boundary endpoints are paired in one of three ways. Swapping the colors on the path containing the least boundary endpoint changes both masks by symmetric difference with the corresponding two-element endpoint set. The resulting profile is attained.

For two disjoint slot pairs of this kind, the switches commute (they involve disjoint matching colors), even if their paths intersect. The same choices of endpoint pairings must yield both individually switched profiles and the simultaneously switched profile. This is stronger than asking for independent existence of each resulting profile.

### Finite classification

Let X,Y be disjoint subsets of the 56 profiles, each hitting all 37 cap-profile sets and each satisfying the single-switch and simultaneous-switch constraints just described.

Then there exists a Hamiltonian cycle C of the complete graph on the five labels such that, after possibly exchanging X,Y,

- X is contained in the 30 profiles B(T,U) whose two complementary pairs both belong to C or both belong to its complementary 5-cycle;
- Y is contained in the other 26 profiles: A and the B(T,U) whose complementary pairs belong to opposite cycles.

This is an exact finite classification, not a claim that any such pair is realized by actual 5-poles.

Verification constructs a Boolean variable for membership of every profile in each set (112 variables). Disjointness and cap hitting give clauses directly. An exchange implication with options F is encoded as the clauses not-p OR (OR over H), for every inclusion-minimal hitting set H of the option family after removing p. This is equivalent to requiring some option entirely present: if none is entirely present, choosing an absent entry from each option produces a hitting set of absent entries, which contains a minimal hitting set. Empty options make the implication automatic.

For each of the twelve oriented pentagon partitions W, append one clause requiring that X contains a profile outside W or Y contains a profile inside W. These clauses exclude all pairs contained in a pentagon partition. The base model has 17,310 distinct non-tautological clauses; the blocked model has 17,322. It is unsatisfiable. A Z3 4.13.3.0 proof log was checked independently by reverse unit propagation through its first empty clause: 17,322 initial clauses, 18,055 RUP additions, 9,364 deletions. The input and proof-log initial clauses were compared exactly after the variable renaming (x_i -> 2i-1, y_i -> 2i for 1-based i). Every oriented full pentagon partition satisfies the unblocked model. Thus these particular constraints alone cannot rule out the surviving obstruction. Reproduction code accompanies this checkpoint.

## Remaining mathematical gap

One possible next target is the realization question: can all six-cover profiles of a connected, internally bridgeless 5-pole lie in one of these opposite pentagon classes? The finite model does not answer that question. It also does not handle a five-vertex side, since a five-vertex cap need not give a smaller graph.

The obstruction can be expressed in parity form. For a fixed pentagon C, sum over its five edges ij the number of matching colors containing both boundary labels i,j, modulo two. On A this is one. On B(T,U) this equals one if and only if the complementary pairs of T,U belong to opposite pentagons. Indeed the parity of the number of C-edges induced by a triple equals the parity of the C-edge indicator of its complementary pair plus one, using that every vertex of C has degree two and C has five edges. Singletons contribute zero. Showing that attainable profiles necessarily exhibit both parity values for each fixed C would exclude this particular obstruction, but no proof of that assertion is given.

**No full conjecture is proved here.** This is an independently developed finite reduction whose relation to the 2026 published classification remains to be checked. No Lean verification is claimed. The scope is a hypothetical minimum counterexample with a cyclic 5-cut whose two sides each have at least seven vertices.

Research coordination: https://github.com/1337isnot1337/solved-conjectures/issues/297

# Why the template theorem is not a degree-only proof of Erdős 23

The [Andrásfai](CIRCULAR-THREE.md) and [Vega](VEGA-TEMPLATES.md) results leave open whether a near-counterexample can be forced close to one of these classes. The following elementary control rules out using only density, minimum and maximum degrees, saturation, long induced paths and the current pentagon floor. It is not a counterexample to [Erdős Problem 23](https://www.erdosproblems.com/23).

Take the Mycielskian of the Clebsch graph: each of the 16 originals has a shadow adjacent to all of its original neighbors; shadows are independent and all see one new apex. Assign equal mass 1/33 to the 33 vertices.

## It has the elementary obstruction properties

- It is triangle-free, and maximal triangle-free. For an original nonedge, or a nonadjacent original/shadow pair, use an original common neighbor in the Clebsch graph (for an original and its own shadow, use any original neighbor). Two shadows have the apex in common. The apex and an original share a shadow of any neighbor of that original.
- Its ordinary degrees are 10 on originals, 6 on shadows, and 16 at the apex. Thus all weighted degrees lie strictly between 4/25 and 1/2, while its ordered density is (272/1089), in the unresolved middle band.
- It is not four-colourable. In the five-token Clebsch representation, translate an independent set so that it contains the empty class; all its other members are pairwise-intersecting two-subsets, at most four. Thus a proper colouring of the 16 original vertices needs at least four colours. If the Mycielskian had a proper four-colouring, recolour each original with the colour of the apex using its shadow's colour instead. Adjacent originals cannot both have the apex colour, and each shadow has the same original neighbors as its original. This would give a proper three-colouring of Clebsch, a contradiction.
- It has an induced six-vertex path. In four-bit original labels 0 through 15 with edges at XOR Hamming weights one and four, use originals (0,1,3,7), followed by the shadow of 6 and the apex. The consecutive edges respect the definitions, and no nonconsecutive pair is adjacent.
- Its labeled pentagon homomorphism density is (31120/33^5>.00079). For the count, a closed walk of length five in Clebsch must use each of its five generators once, so there are `16 × 5!/10 = 192` undirected pentagons. Each has 11 lifts avoiding the apex, choosing an independent set of its positions to be shadows. A pentagon through the apex is an apex–shadow–original–original–shadow cycle, and projects between the shadow positions to any ordered base walk of length three, counted twice by reversal. There are `16 × 5³/2 = 1000` such undirected pentagons. Thus total pentagons are `192 × 11 + 1000 = 3112`, and each has ten labeled cyclic traversals.

It is at least (1/1089) in unordered product edge-deletion mass from every four-colourable graph, even if original atoms may be split. For split atoms, each original vertex induces a distribution over the four colours. Independently choose one colour for each original using its distribution. The expected weight of monochromatic original edges equals the same-colour pair mass under the split labels, which any edit has to delete, while every integral choice misses at least one original edge. This bounds the edit distance. In particular the graph is farther than (1/10000) from both dense template families.

## It nonetheless has a cheap cut

Take any of the balanced five Clebsch coordinate cuts on the originals and give each shadow the sign of its original. The cut misses eight original edges, and sixteen original–shadow edges. Exactly eight shadows share the apex's sign. Thus the total loss is at most (32/1089<1/25).

This tests only the named necessary conditions above, not the full maximizing-weight stationarity law or any assertion about a near-optimal deletion value. It shows that a route to template proximity must use additional information about genuine cut optimality, rather than only the density, degree and rooted-pattern exclusions.

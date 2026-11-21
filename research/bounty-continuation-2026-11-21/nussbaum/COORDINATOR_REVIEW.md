# Coordinator review of the Boolean-orbit interpolation criterion

Date: 21 November 2026. Reviewed note: [target and interpolation](target-and-interpolation.md). This is a mathematical review of the stated restricted criterion, not a prize resolution.

The information-order convention is correct: star is below both definite bits. Minimum, maximum, and negation preserve this order. Iterating an order comparison around a periodic orbit shows that a nontrivial orbit is an antichain. Each formula is nonexpansive in the sup norm, so distances on a finite orbit are preserved by its cyclic permutation. Boolean input states remain Boolean; any counterexample to the advertised bound must therefore have no Boolean state.

For a noncontradictory DNF clause, its satisfying Boolean assignments form a face C. Its value on a partial assignment x is one precisely when V(x) is contained in C, zero precisely when V(x) is disjoint from C, and star otherwise. This proves the stated necessity of separation between the positive and negative faces and of an uncovered completion for every star-output face.

The proposed sufficiency construction is valid. A positive face supplies its own clause, and each star-output face supplies a full minterm at an uncovered Boolean completion. Negative inputs annihilate all clauses. Antichain incomparability prevents a positive-face clause from taking value one at a different star-output input. A full minterm cannot take value one at a nonbinary input, and the chosen minterm takes value star at its intended input. Taking the maximum therefore gives exactly the prescribed output. The construction applies coordinate by coordinate.

The note explicitly permits empty conjunction and disjunction as constants. A proposed bounty counterexample must verify the sponsor's actual clause convention and every output coordinate; a generic interpolation statement alone is not a formula witness.

The broader syntax requires care. If contradictory clauses are allowed, the conjunction of all known literals of a state u and both literals at every star coordinate evaluates to star at u and zero at every other point of an information antichain. A nonzero value at another state would imply that state is below u. This can remove the uncovered-completion condition in the broader formula class. It must not silently replace the narrower convention used by the sponsor's generator.

I inspected the sponsor's primary course page and exact public offer. Its printed deadline and amounts are recorded as source statements, not as a present payment guarantee. No new confirmation from the sponsor is claimed. The source's already-awarded sharpness example is not a new solution.

The criterion is proved, but no orbit longer than 2^n with a valid narrower-class formula has been supplied. A timed-out optimization run with no incumbent is neither a witness nor an exclusion theorem.

## Uniform one-star theorem

I also independently checked the [one-star proof](one-star-and-mixed-face-gap.md). The completion faces become edges of a triangle-free cube subgraph. Its maximal line-graph cliques reconstruct all vertices of degree at least two; leaf endpoints and isolated edges can be added consistently. Hence the cyclic compatibility action lifts to the edge set of that graph.

On each connected component the stabilizing powers form an abelian edge-transitive action. If it is vertex transitive, faithfulness makes the vertex action regular and bounds the edge count by the vertex count. If it has two vertex orbits, equal stabilizers on either orbit make any two vertices sharing a neighbor have identical neighborhoods. Connectedness then forces a complete bipartite graph. The cube's common-neighbor bound makes such a component a star or a four-cycle, again with no more edges than vertices. Summing components gives the stated bound uniformly in dimension.

This argument needs exactly one star per state. It does not justify reconstructing Boolean incidences from an intersection graph of higher-dimensional faces. The full paid target remains unresolved.

## Stronger local grid and one-star-orbit theorem

The [new uniform proof](local-grid-and-one-star-orbit.md) and its [independent review](GRID_REVIEW.md) pass coordinator audit. The classical Lovasz form of Kruskal-Katona was checked directly in Keevash's author-hosted 2008 paper, pages1686-1687; the inspected 2010 addendum does not alter the input used here.

The truncated-downclosure replacement preserves the antichain and its size while decreasing total set size. The final shadow sum is bounded at its largest real-binomial parameter; the endpoint inequality is valid from level3 onward. Row-center Hamming balls are disjoint, and every counted point is in an actual row face, which supplies the needed local union bound. The exceptional six-column case is repaired using its six common column vertices: there are at most two deficient centers in the same four-cube, and those six vertices lie outside all radius-one row balls. The small side cases were checked separately.

The compatibility graph's cyclic action carries the neighborhood property of one one-star state to every vertex. Its line-graph reconstruction is simple and triangle-free. A faithful abelian edge-transitive component action gives either a cycle or a complete bipartite graph, with isolated-edge and clique cases covered. The local grid bound and the disjoint Boolean unions of different components permit addition. Thus one one-star state anywhere in the orbit suffices for the stated period bound.

This closes the earlier additive counting gap. It does not cover an orbit whose every state has at least two unknown coordinates. No full-target or novelty claim follows. The exact formula checker was rerun after the constructor's constant-coordinate syntax fix; all recorded method obstructions remained unchanged.

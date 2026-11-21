# Independent review of the three-terminal relaxation

Reviewer: algebra lane. Date: 21 November 2026 UTC.

## Disposition

The synchronized `THREE_TERMINAL_REPLACEMENTS.md` and both exact checkers pass this review. The result is an obstruction to the specified induction relaxation. It is not a graph counterexample and does not resolve the multiplicative Merino–Welsh conjecture. In particular, no graph realization of the normalized boundary data is established.

This review uses the final witness with `r_ij=11/8`, `d=363/256`, `a_ij=99/100`, `b=49/50`, and `c=(101/100,21/10,21/10,21/10,27/10)`. The earlier witness with `r_ij=11/10` is superseded and is not part of the reviewed claim.

## Structural identities checked

1. **Vertex deletion.** Given the imported minimal-counterexample reductions, deleting the doubled three-arm vertex leaves a connected graph. If the remainder had a bridge, its two sides would each contain a terminal; one side would contain exactly one. Deleting that terminal's complete parallel pair in the original graph would leave the same bridge, contradicting the imported reduction. The argument is conditional on this local configuration and does not assert that every minimum counterexample has it.

2. **Quotients.** Pairwise nonadjacency of the three terminals prevents loops after any terminal identification. Connectedness and bridgelessness survive identification. Thus the five boundary graphs are legitimate smaller graphs for the proposed induction. This nonadjacency hypothesis is retained throughout the review.

3. **Orientation inequalities.** Acyclicity after pair identification means there is no directed path between those two terminals in either direction. All-three acyclicity is exactly the intersection of the three pair events, so the stated union bound is valid. For totally cyclic orientations, a successful pair identification is also successful after all three are identified. For an orientation that is not already totally cyclic, choose a directed cut of its condensation. A pair capable of repairing the orientation must straddle that cut, and at most two of the three terminal pairs can do so. This proves the three-pair counting inequality with the stated normalization.

4. **Resistance determinant.** Adding two terminal edges and applying the rank-two determinant lemma gives the stated effective-resistance Gram determinant. The off-diagonal term is half the sum of the two resistances based at terminal one minus the resistance between the other terminals. Comparison with the spanning-forest expansion identifies the mixed coefficient as the all-three quotient tree count.

5. **Stars and triangles.** The acyclic signs agree with chromatic evaluation at minus one, including the vertex changes under terminal contraction. The cyclic star coefficient has a necessary minus-one term: selecting none of the new edges leaves an isolated internal vertex in the random-cluster expansion. The spanning-tree triangle formula correctly omits the three-edge product, which would select a cycle. All 52 nonempty star multiplicity triples of total size two through five and all 56 terminal-triangle triples of total size at most five are eligible smaller graphs under the stated hypotheses.

## General gadget formula and enumeration

I independently derived equation (13). Let the outside graph have `N` vertices, let a gadget have `k` additional vertices, and fix a subset `F` of gadget edges. Write `h` for its terminal-free components and `s` for its terminal-identification rank. The random-cluster expansion separates this contribution as the factor `q^h` times the polynomial of the corresponding quotient of the outside graph.

For acyclic orientations, use edge weight minus one, then convert the chromatic evaluations to orientation counts. The total vertex count is `N+k`, while the quotient has `N-s` vertices. The resulting sign is precisely `(-1)^(k+|F|+h-s)`. For totally cyclic orientations, connectedness gives `Z(-1,1)=-C`; the signs for the outside quotient cancel, leaving `(-1)^h`. For spanning trees, the subset must be a forest with `h=0`. Its terminal-containing components can then be contracted, and the remaining choice is exactly a spanning tree of the outside quotient. No other subsets contribute.

The enumeration range is exhaustive for this stated finite replacement class. In a connected bridgeless attachment every internal vertex has degree at least two. If any internal vertices are present, the total terminal degree is at least two. With at most five edges this gives `k<=4`. The program enumerates all edge multisets on the three labelled terminals and zero through four labelled internal vertices. Its auxiliary terminal path only tests connectivity after attachment; it does not enter any counting polynomial. Requiring connectivity after deletion of each original gadget edge is equivalent to requiring that no gadget edge becomes a bridge when the terminals are connected through the outside graph. Parallel edges are represented separately by subset positions and are counted correctly.

The union-find cycle test, the five terminal-partition coordinates, the internal-component count, and all three coefficient updates implement these formulas. Deduplicating by the complete triple of boundary coefficient vectors preserves every distinct inequality under consideration.

## Exact replay

Both scripts were read and replayed successfully using their rational arithmetic:

- `check_three_terminal_relaxation.py`: 132 checks passed, including all 52 smaller stars and 56 smaller triangles. Their least margins are `1/25` and `1/100`.
- `check_all_small_gadgets.py`: 1,832 labelled admissible gadgets produced 470 distinct triples of boundary coefficient vectors. Every resulting margin is positive; the smallest is `1/100`, at the unchanged outside graph.
- Both calculations give the doubled-star margin `-6507957/128000`. The formal inclusion probability `41/57` satisfies the previously imposed open interval condition.

These executions certify the finite auxiliary statement that the final abstract data satisfy every listed replacement constraint. They supply no evidence that the data can occur as graph counts. The note's conclusion correctly identifies an additional graph-specific boundary relation as necessary for this induction route.

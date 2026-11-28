# Source and prior-resolution audit

## Exact statement

Shuyan Chen, [*Hypergraph Universality and Erdős–Pósa Failure for Chromatically Rich Odd Cycles*](https://arxiv.org/abs/2609.26158), [Problem 6.5, pp. 13–14](https://arxiv.org/pdf/2609.26158v1#page=14), asks for a half-integral packing versus transversal bound for cycles using exactly one edge of a prescribed matching of nonedge markers. Its second question imposes a parity on the supply segment. The bound must not depend on the number of markers.

Deleting the unique marker gives a simple supply path with its prescribed ends; closing the path by its marker recovers the original cycle. The two have the same vertex set. Requiring the packed paths to use distinct demand identities is stronger than allowing different cycles for the same marker. The proof permits a separate parity per demand. The unrelated moving-real-core question in Problem 6.6 is not claimed.

## Nearest results and their scope

| Primary source | Why it is different |
|---|---|
| [Marx–Wollan, *An exact characterization of tractable demand patterns*](https://arxiv.org/abs/1411.0871), and Chen §6.3 | The matching obstruction concerns the integral packing-versus-cover principle. It does not refute congestion two. The conjecture under audit is not the ordinary fixed-list disjoint-paths decision problem. |
| [Kawarabayashi–Reed, SODA 2009](https://doi.org/10.1137/1.9781612973068.128) | Decides whether a specified list of k terminal pairs can all be routed with specified parity and congestion two. It treats the same routing feasibility after the list is fixed, but does not bound a vertex set hitting every allowable path when no k pairs can be selected from an arbitrarily large matching. |
| [Huynh, *The k-disjoint paths problem for group-labelled graphs*, Nov. 25, 2026](https://arxiv.org/abs/2611.34307) | Decides fixed-k routing with prescribed finite-abelian gains and integral disjointness. The stronger labels apply to a different quantifier and conclusion; the theorem has no uniform transversal alternative. |
| [Kwon–Yoo, *Erdős–Pósa property of A-paths in unoriented group-labelled graphs*](https://arxiv.org/abs/2411.05372v2) | Half-integral packing and covering for allowed path labels with endpoints in an arbitrary prescribed set. It does not distinguish an unbounded number of exact partner identities. Encoding them in a separately growing finite label group would not give a uniform bound. |
| [Chekan et al., *Half-integral Erdős–Pósa property for non-null S–T paths*](https://arxiv.org/abs/2408.16344) | The source and target sets specify allowed endpoint classes, not a matching of allowable individual partnerships. The bound depends on a fixed finite label group. |
| [Gollin et al., *A unified half-integral Erdős–Pósa theorem for cycles in graphs labelled by multiple abelian groups*](https://arxiv.org/abs/2102.01986) | Gives bounds for cycles whose group values avoid fixed finite forbidden sets. Counting markers in a finite cyclic group does not distinguish exactly one from a larger congruent count; counting in a torsion-free group does not make the complement of exactly one a fixed finite forbidden set. This does not exclude every imaginable reduction, but the published theorem does not state the exact-one matching filter. |
| [Huynh–Joos–Wollan, *A unified Erdős–Pósa theorem for constrained cycles*](https://arxiv.org/abs/1605.07082) | Supplies the structural theorem used in our proof, not a prescribed-pair packing-covering theorem. Its structural wall linkages do not by themselves preserve the identities of demands. |

## Search and conclusion

On November 27, 2026, the audit checked the original statement, primary routing and constrained-packing papers above, and indexed arXiv, Hexagon, and general web results using combinations of “exact-one-marker”, “Problem 6.5”, “Shuyan Chen”, “matching demands”, “prescribed pair parity”, and “half-integral Erdős–Pósa”. No earlier full resolution of the exact uniform statement was identified. This is a bounded literature check, not a claim to exclude unpublished arguments.

The [proof](PROOF.md) supplies the uniform alternative by selecting free whole pairs, preserving their identities through the routing, and giving a cover in the bipartite block case. The [independent AI re-read](REVIEW.md) records the checked proof revision; it is not external human refereeing.

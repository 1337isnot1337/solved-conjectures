# Odd-minor obstruction in the middle-density band

This note uses a classical theorem to remove a broad structural class from [Erdős #23](https://www.erdosproblems.com/23). It does not prove the full conjecture.

Let G be triangle-free, with vertex weights p_v, total weight N, and edge costs p_up_v summing to e_w. If G has a homomorphism to a triangle-free H with no odd-K₅ minor, then β(G)≤e_w/5. Consequently G satisfies β(G)≤N²/25, and throughout the open middle-density band that bound is strict with a uniform gap. This includes the entire class of graphs with no ordinary K₅ minor, planar templates, and their arbitrary weighted blow-ups and edge-deleted blow-ups. It subsumes the simple bipartization bound for the parallel-path class; the separate elementary proof there does not need a signed-minor theorem or the high-density cut.

Put Σ=E(H) in signed graph notation. The polyhedron of odd-circuit covers is defined by x_e≥0 and ∑_{e∈C}x_e≥1 for each odd cycle C. By [Guenin’s theorem in Schrijver’s proof](https://homepages.cwi.nl/~lex/files/guenin2.pdf), it is integral if the signed graph has no odd-K₅ minor. The point x_e=1/5 is feasible since odd cycles have length at least five. Thus, for any nonnegative edge costs c_e, an integral optimum has cost at most ∑c_e/5. Deleting a cover of all odd cycles makes the graph bipartite, so an optimal cut costs no more. For a homomorphism from G, assign each H-edge the total cost of its preimages and pull the cut back. This proves β(G)≤e_w/5, regardless of whether the vertex-weighted blow-up itself has an odd-K₅ minor.

For completeness if e_w≥N²/5, the weighted original neighbourhood cut suffices with no minor hypothesis. Normalize ∑p_i=1, let d_i=∑_{j∼i}p_j and e_w=(∑p_i d_i)/2. Use the cut N(v) versus its complement, where v is chosen with distribution p. The expected crossing weight is ∑p_i d_i²: all edges meeting N(v) cross, since it is independent. Jensen makes this at least 4e_w². Therefore β≤e_w−4e_w²≤1/25 for e_w≥1/5, since the quadratic is decreasing there. Rescale for general N.

## A quantitative exclusion

The hard band has e_w/N²≤3197/20000. Suppose there is a set F of edges whose deletion leaves an odd-K₅-minor-free graph, and let w(F)=∑_{uv∈F}p_up_v. Then

    β(G) ≤ (e_w−w(F))/5 + w(F) = e_w/5 + 4w(F)/5.

Thus w(F)≤(803/80000)N² is already enough everywhere in the middle-density band. A variant deletes X⊆V(G), first cuts the minor-free induced subgraph on the complement, then independently colours X uniformly. With e_touch the weighted mass of edges having at least one endpoint in X, this gives β≤e_w/5+(3/10)e_touch; the sufficient threshold is e_touch≤(803/30000)N². These are one-way criteria, not evidence that every band graph admits such deletions.

The [middle-band research audit](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) independently records the standard cut-distribution homomorphism transfer (for example to the Clebsch graph); the present deduction uses the integrality of signed odd-circuit covers to produce the requisite cut bound for a different template class. Guenin’s theorem is not a new result.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

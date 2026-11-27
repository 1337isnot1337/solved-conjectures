# Arbitrarily weighted bundles of parallel paths

A **parallel-path graph** consists of finitely many internally vertex-disjoint paths joining the same two vertices. Suppose it is simple and triangle-free. For arbitrary positive vertex weights p_v, with edge costs p_u p_v, it satisfies

    β(G) ≤ (∑_v p_v)²/25.

This proves [Erdős #23](https://www.erdosproblems.com/23) for this unbounded family and all its blow-ups; it is not a proof for general triangle-free graphs. It also applies blockwise by [the articulation reduction](BLOCKS.md).

## Exact optimization of endpoint parity

Write h,k for the endpoint weights and s=h+k. Let μ_i be the minimum edge cost on path i, which has length ℓ_i. For a fixed endpoint parity, a path whose length has the correct parity can be fully cut; a wrong-parity path must leave at least one edge and can choose to leave only its cheapest edge. Internal vertices of the paths are disjoint, so

    β = min(∑_{ℓ_i even} μ_i, ∑_{ℓ_i odd} μ_i).

Assume β>0 and put b=√β. Choose t_i∈[0,μ_i] with sum β over each parity separately. In each parity the numbers a_i=t_i/β are a probability distribution. Ignore terms with t_i=0 throughout. Let I_i denote the total weight of path i's internal vertices.

Whenever ℓ_i≥2, increasing its internal weights by the factor β/t_i makes every edge on it have weight at least β, without changing h,k. A single internal endpoint of an edge scales the weight by β/t_i; two internal endpoints scale it by its square, which is no smaller. Denote the new internal total by J_i=I_i/a_i. A direct path (length 1) has no internal vertices and no such scaling; handle it below.

For each pair i,j of opposite parity and with scaled edge costs at least β on both paths, the two paths form a triangle-free odd cycle of length at least five. Consecutive vertices have weight sum at least 2b. Sum over its edges and divide by two to get

    s + J_i + J_j ≥ (ℓ_i+ℓ_j)b ≥ 5b.

If no direct path has positive t_i, or if the direct path has cost hk≥β, this applies to all pairs. Average it over the two independent parity distributions. The weighted sums of J_i are just the corresponding sums of I_i, and the endpoint weight s is counted once. This proves the target.

## Direct edge cheaper than β

A simple graph has at most one direct path, on the odd side. Suppose it has hk<β. All even paths then have length at least four, by triangle-freeness. If s≥3b, the even paths alone suffice: each has two consecutive internal vertices with weight sum at least 2√t_i; summing gives at least 2b on those internal vertices.

Otherwise s<3b. Let λ=b/√(hk)>1. Choose the odd parity distribution to assign t₀=hk to the direct edge (possible because the other odd capacities total at least β−hk); thus its probability is a₀=1/λ². For an opposite pair not involving the direct edge, the odd path has length at least three and the even length at least four, giving the stronger bound s+J_i+J_j≥7b.

For a pair involving the direct edge, increase both endpoint weights by λ solely to apply the odd-cycle bound. The direct edge then has cost β, and no other cost decreases. The cycle bound gives λs+J_i≥5b, or s+J_i≥5b−(λ−1)s with the original endpoint weights. Average the two types of pairs to obtain the bound

    ∑_v p_v ≥ 5b + 2b(1−a₀) − (λ−1)s a₀
             = 5b + a₀(λ−1)(2b(λ+1)−s)
             ≥ 5b.

The final inequality follows from λ>1 and s<3b. This finishes the proof for all path lengths, path counts, and weights.

**Blow-ups.** For an integral vertex-weight realization, all edges between adjacent fibres are filled. The monochromatic weight of a cut that may split a fibre is affine in the fraction of that fibre assigned either colour when all other choices are fixed, since the fibre is independent. Successively move each fraction to an endpoint without increase. Thus the minimum equals the weighted minimum above. Deleting edges only lowers the minimum, so arbitrary subgraphs of these blow-ups satisfy the conjectured bound as well.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

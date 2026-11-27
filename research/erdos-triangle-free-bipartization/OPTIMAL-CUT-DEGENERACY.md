# A unique extremal maximum cut would require many almost-tied vertices

Let W be a triangle-free graphon globally maximizing its ordered monochromatic cost m>0. Let d be its degree. If it has a unique optimal cut up to complementation, then

    d(x)>2m almost everywhere,
    limsup_(z↓0) |{x : 0<d(x)−2m≤z}| / z > 0.

In particular a maximizing graphon with a uniform degree gap above 2m has at least two different optimal cuts. This is a second-order supplement to [vertex-weight stationarity](GRAPHON-EXTREMIZERS.md), not a proof that the unique-cut possibility is impossible.

## Uniqueness and the local margin

Write the optimal cut as a sign function f, and its crossing and internal kernels as B and M. The fractional rounding argument in [GRAPHON-EXTREMIZERS](GRAPHON-EXTREMIZERS.md) shows that uniqueness among sign functions implies uniqueness also among fractional cuts, up to complementation: on a positive-measure fractional region every rounding is optimal, giving distinct noncomplementary cuts. The optimal-cut stationarity statement there now forces the internal degree function of f to be the constant m.

The net degree margin for flipping a point is therefore Δ=d_B−d_M=d−2m≥0. If {Δ=0} has positive measure, it has an independent measurable subset of positive measure. To check this, the minimum degree ≥2m means every positive-measure set has positive incidence to a random vertex; choose a vertex with a positive-mass intersection of its positive neighborhood with the set. That neighborhood is independent almost everywhere by triangle-freeness. One may take the subset smaller than 1/2. Flipping it leaves the cost unchanged, since the local margin integrates to zero and it has no internal edges to correct the integral. This contradicts uniqueness.

## A reweighting that raises the optimum if near-ties are too sparse

Assume for contradiction that |{Δ≤z}|=o(z). Let h=f−∫f, so ∫h=0. Reweight vertices by 1+t h for small t>0; this preserves the graphon class and triangle-freeness. For the original cut, the new cost is exactly

    m + m t²∫h².

The linear term vanishes because internal degree is constant, and on each internal edge the two endpoints have the same h value. Also ∫h²>0, since a constant sign is not optimal for any graphon with edges.

Any other cut is obtained by flipping a measurable set S, with measure s≤1/2 after complementation. Its cost minus the cost of the original cut, before reweighting, is

    2∫_{S×Sᶜ}(B−M) ≥ 2∫_S Δ − 2s².

Under the reweighting this difference changes by at most Kt s for some fixed constant K, since only edges on the boundary of S are involved and h is bounded.

For any fixed L>0 there is s_L>0 such that for s≤s_L one has ∫_S Δ≥(L+1)s². Indeed, for sufficiently small s the set where Δ≤2(L+1)s has measure at most s/2, by the assumed o(z) bound. Thus the reweighted cost difference is at least

    2Ls²−Kt s ≥ −K²t²/(8L).

For sets with s≥s_L the unweighted cost difference is uniformly positive. Otherwise a sequence of cuts with costs tending to m would have a weak L² limit that is fractionally optimal by compactness of the graphon operator. By uniqueness that limit would be f or −f. Weak convergence to a sign function is strong because all the sign functions and the limit have norm one. This contradicts the lower bound on the distance from both f and −f. The uniform positive gap on these larger sets persists under sufficiently small reweighting.

Choose L so large that K²/(8L)<m∫h². The original cut's positive quadratic increase then exceeds all possible cost reductions by small flips; large flips still cost more. The reweighted graphon has optimal cost strictly greater than m, a contradiction.

The argument also shows why first-order stationarity alone is insufficient: a unique optimum would have the constant internal degree profile, but small competing cuts around low-margin vertices can in principle offset the second-order increase. Here their required near-tie mass is quantified qualitatively.

## In fact each side must contain a thick near-tie set

The same conclusion holds when the measure in the limsup is restricted to either side. For example, suppose the small-margin set on the positive side alone has measure o(z). Reweight with the same h=f−∫f, using t>0, so that the constant weight multipliers satisfy r_+>r_− and both tend to one. For a flip S, write S_+,S_− for its intersection with the two sides and C_+, C_− for the respective *internal* boundary masses w_M(S_±,side_±\S_±). If D_0 and D_t are the original and reweighted **ordered** cost increases of the flip, then

    D_t = r_+r_− D_0 + 2(r_+−r_−)(r_− C_−−r_+ C_+).

This follows by grouping crossing edges (all get multiplier r_+r_−) and internal edges (multiplier r_+² or r_−²). For small flips, m s_±−s_±²≤C_±≤m s_±. Thus if s_−≥3s_+, the correction term is nonnegative for small enough s,t. Otherwise s<4s_+. The o(z) hypothesis on the positive side alone gives ∫_(S_+)Δ≥(16+L)s_+² for arbitrarily large fixed L and all sufficiently small s_+, so D_0≥2Ls_+². The negative part of the correction term is only O(t s_+). Optimizing in s_+ makes the possible loss o(t²), by choosing L arbitrarily large, so it again cannot offset the positive quadratic cost increase. The large-flip argument is identical. Interchanging sides proves the other case.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

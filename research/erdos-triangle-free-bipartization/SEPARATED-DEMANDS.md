# Exact bound for separated defect demands

Partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). Unlike the [general hop-distance tail bound](HOP-DISTANCE-TAIL.md), this sharp bound requires joint separation of endpoint sets.

Let G be a finite graph with nonnegative vertex masses of total one and product edge masses. Fix a maximum cut; write B for its crossing graph and D for its defect edges. Suppose F is a subset of D of mass t>0, and every edge in F goes between sets A and C at distance at least L≥1 in B. This requires every pair in A×C to be at distance at least L, not just pairs belonging to F. Then

```math
 t\le (L+1)^{-2}.
```

For even L≥4 this is sharp in triangle-free graphs, and equality forces a balanced blow-up of the odd cycle of length L+1 after ignoring zero-mass vertices.

## Proof and equality

Give each vertex level f(v)=min(L,dist_B(A,v)), with unreachable vertices at level L. Write a_i for the masses of the levels. Across the prefix of levels 0 through i, for 0≤i<L, crossing-graph edges go only between levels i and i+1. Flipping the original cut on the prefix shows that their mass is at least the defect mass across the prefix, which comprises all of F and possibly other defects. Thus a_i a_(i+1)≥t. Also a_L a_0≥t since F lies between the end levels. Multiplying the m=L+1 inequalities and invoking AM–GM gives

```math
 t^m\le \left(\prod_{i=0}^{L} a_i\right)^2\le m^{-2m}.
```

At equality all levels have mass 1/m and all consecutive level pairs are complete, including the closing pair in F. No other interlevel edge can lie in B. No interlevel defect outside F can be present either: it would cross a prefix and make its defect mass exceed t. In a triangle-free graph no intralevel edge is possible, since its endpoints would have a common neighbor in an adjacent level. For the converse take the balanced blow-up of the odd cycle and leave exactly one complete consecutive pair uncut. Its cut is maximum: one can move each independent twin class to a single side without decreasing the cut, and every cut of the odd cycle omits at least one edge.

## Quantitative stability

Write t=(1−δ)/m² with 0≤δ<1 and let u_i=1/m. The product inequality gives relative entropy at most −½ log(1−δ) from the uniform masses to the a_i. Pinsker therefore gives

```math
 s=\sum_i |a_i-u_i|\le\sqrt{-\log(1-\delta)} .
```

The sum of the excesses a_i a_(i+1)−t over all cyclic pairs, including the closing pair, is

```math
 \delta/m+\sum_{i\bmod m}(a_i-u_i)(a_{i+1}-u_{i+1})\le\delta/m+s^2/2.
```

For m≥3 the last inequality bounds the sum by all unordered distinct pairs of absolute deviations. The total missing mass M of the cycle-edge pairs is at most this excess sum. Every extra interlevel edge outside the cycle template belongs to D and crosses at least one prefix; the total mass of such edges is at most the sum of excesses over the L prefixes.

For triangle-free G, take an intralevel edge at level i. Its endpoints' missing masses into the next cyclic level add to at least a_(i+1). Summing this over intralevel edges bounds their mass by the missing mass across the pair times a_i/a_(i+1): the product-mass degree of one endpoint within its level is at most a_i. Each cyclic pair is charged only once. For s<1/m all these ratios are bounded by (1/m+s)/(1/m−s). In particular, for fixed even L≥4 the graph is within O_L(δ) in product edge-edit mass of a cycle blow-up whose class masses differ from uniform by O(√δ) in total absolute deviation.

## Scope

Pointwise large distance for individual defect edges does not supply jointly separated sets. The defect graph need not be bipartite; even when it is, the two endpoint classes need not be separated in B. The [general tail argument](HOP-DISTANCE-TAIL.md) uses a partition method and does not have the constant in this note. See Komlós’s [Covering odd cycles](https://doi.org/10.1007/BF01215920) and the [higher odd-girth sparse-half theorem](https://arxiv.org/abs/1609.05712) for related prior results; this note does not claim priority for the elementary layer argument.

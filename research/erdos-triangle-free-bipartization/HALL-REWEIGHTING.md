# A quantitative Hall restriction on extremizers

This is an all-order reduction for [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution. A weighted graph that has a large independent set with too small a neighborhood can increase **every** product-weighted cut cost by reweighting the same support.

Normalize vertex mass to one. Let I be independent, let J be its neighborhood, and let D=μ(I)−μ(J)>0. Assume D<1. Multiply the masses on I, J and the rest by, respectively,

```math
 1/(1+D),\qquad 1/(1-D),\qquad 1/(1-D^2).
```

The new total weight is one: writing i=μ(I), j=μ(J) and r=1−i−j, the numerator over 1−D² is (1−D)i+(1+D)j+r=1−D². Edges incident with I go only to J and their product multiplier is exactly 1/(1−D²). All other edges have two factors at least 1/(1−D²). Thus the minimum bipartization cost increases by a factor at least 1/(1−D²). The case D=1 has no positive-mass edges. The same proof gives a weighted graphon result, using the essential neighborhood and changing the underlying probability density.

Let M be the global maximum of ordered monochromatic mass. It follows that any graphon with Hall deficit D satisfies m(W)≤M(1−D²). In particular a positive maximizing graphon has no Hall deficit. A deficit witnessed by an arbitrary set S can be witnessed by an independent set: use I=S minus its essential neighborhood. It has no edges to S, its neighborhood is contained in N(S) minus S up to null sets, and the difference of these two measures is the original deficit or larger. With the established universal bound M≤4/47 from [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179), this proves the exact Erdős inequality whenever an independent set has deficit at least √(3/50).

## A finite normalization on the same template

There is an exact general way to find such edge-nondecreasing weights. Ignore zero-mass vertices and isolates first; removing isolates and renormalizing only increases normalized cut costs. Let μ be the remaining probability weights. Minimize

```math
 Z(h)=\sum_v \mu_v e^{h_v}
 \quad\text{subject to }h_u+h_v\ge0\ \text{on each edge }uv.
```

The minimum is attained. On the sublevel Z≤1 each h_v is bounded above, and the existence of a neighbor bounds it below. Zero is feasible. The new masses ν_v=μ_v e^{h_v}/Z multiply each edge by at least 1/Z²≥1. By the convex Lagrange multiplier conditions (strict feasibility follows by taking all h positive), there are nonnegative edge weights λ_uv on the tight edges with

```math
 \sum_{u:\,uv\text{ edge}}\lambda_{uv}=\mu_v e^{h_v}.
```

Dividing by Z shows that the new mass vector is exactly the degree vector of a nonnegative edge weighting on the same support. Conversely such a weighting at the original masses would certify that h=0 already minimizes Z, by summing h_u+h_v against its edge weights and using Jensen. Thus one may impose the existence of this fractional matching without losing any finite weighted counterexample. This is a normalization, not a classification of the supports with no Hall deficit.

The stationary cut law in [the attachment note](ATTACHMENT-STATIONARITY.md) gives a stronger statement at a global maximizer: the edge kernel formed by averaging the monochromatic parts of its optimal cuts already has constant row mass m. The elementary formula above adds a quantitative cost comparison for a single graph before it reaches extremality.

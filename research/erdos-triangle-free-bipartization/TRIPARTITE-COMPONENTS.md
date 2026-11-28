# A cut certificate from tripartite components

All-order partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). The statement allows arbitrary numbers and sizes of components and arbitrary vertex product weights. No structural claim that every counterexample has the required partition is made.

Let a triangle-free graph have independent classes A,B,C and vertex mass one. Write e for its unordered edge mass. Within A∪B, fix the connected components. Suppose it is possible to delete a set of attachment edges of total mass U so that **each vertex in C sees at most one shore in each component**. The choice of shore can vary independently across vertices and components. Let D be the surviving mass of attachments to components *outside* any chosen collection of at most five components. Then

```math
 \beta(G)\le\frac{5e+3D+16U}{21}.
```

In the unresolved density band e≤3197/20000, the conjectured bound follows whenever 3D+16U≤163/4000. In particular the tail components need not be absent; their aggregate attachment mass is what matters.

## Proof

Work after deleting the U edges. Let Q be the mass of edges in A∪B and let R=e−U−Q be the remaining attachment mass. The cut placing all C on one side and all A∪B on the other pays Q.

For another cut, orient the bipartition of each A∪B component independently using a fair sign, so all Q edges cross. For x∈C, write w_i(x) for its weighted degree to component i. All its neighbors within i share a sign because x sees only one shore. Thus the smaller side sum among its attachments has expectation

```math
 \frac12\left(\sum_i w_i(x)-\mathbb E\left|\sum_i\varepsilon_i w_i(x)\right|\right)
```

for independent fair signs ε_i. Color each vertex of C on its best side; they have no internal edges. Conditioning on the signs of the selected components and then using Jensen, removing all other components cannot increase the expected absolute sum. Among five nonnegative coefficients of fixed sum, that absolute-sum expectation is minimized at equal coefficients by convexity and permutation symmetry. Pad with zeros if fewer than five components were selected. The factor for five equal coefficients is 3/8, by the five-sign binomial sum. This proves a cut of cost at most (5R+3D)/16. Taking the weighted average of this bound and Q, with weights 16/21 and 5/21 respectively, then restoring the U edges, proves the assertion.

## A way to bound the attachment repair cost

If an edge uv of A∪B has its endpoints together adjacent to all but C-mass δ_(uv), then the C-neighborhood indicators of u and of v are complements up to L¹ error δ_(uv): triangle-freeness rules out a common neighbor. Choose an anchor per component. Along a path to another vertex, alternate the anchor profile and its complement. The symmetric difference between the assigned profile and the actual neighborhood has mass at most the sum of the δ values of the path edges, by the triangle inequality. Delete only the attachments inconsistent with the assigned profile. The shore condition now holds and U is at most the sum over each vertex in A∪B of its mass times that vertex's shortest weighted path distance from its anchor (edge lengths δ). This also treats singleton components with zero error.

The certificate does not require regularity, complete bipartite components, or any computation at fixed graph order. It does not show that a suitable tripartition exists or handle arbitrary triangle-free graphs. The density tails are the established [Balogh–Clemen–Lidický theorem](https://arxiv.org/abs/2103.14179), and the use of random signs by itself is standard.

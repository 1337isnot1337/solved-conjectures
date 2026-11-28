# An order-independent signed flag hierarchy for Erdős #23

This concerns completeness of an all-order proof search, not a result for graphs up to a fixed order. The sharp conjectured value is not established here.

Use ordered monochromatic mass m, and let M be its maximum over all triangle-free graphons. Let ν be an exchangeable probability vector on signed, triangle-free graphs on N labeled vertices. Its objective is the expected fraction of ordered distinct pairs that are edges and have equal signs. A genuine ν obtained by sampling an optimal cut of a graphon has objective m. It obeys the [attachment and stationary-degree constraints](ATTACHMENT-STATIONARITY.md) if the graphon maximizes m. The following separate family of linear optimality rows lets one use such cuts without claiming that the restricted signs optimally cut every individual sampled graph.

## Rows from globally defined cuts

Choose an ordered list of at most k root positions from the N labels, with repeats allowed. Choose two distinct test labels uniformly outside the *distinct* roots. A recipe takes the rooted graph and its own randomness and gives each test vertex a sign using only its adjacency profile against the roots, never inspecting the test edge. It defines a measurable (possibly fractional) cut on the original graphon. Consequently,

```math
 \mathbb E_\nu[\text{test edge and original signs equal}]
 \le
 \mathbb E_\nu[\text{test edge and recipe signs equal}].
```

This is valid for every recipe: conditional on the root positions in a graphon draw and their observed graph, the two distinct fresh locations are independent, and the new rule is one common rule for both. It therefore has expected cost at least the known optimal cut cost. The inequality is linear in ν because the recipe and the label sampling distribution are fixed in advance. Extra rows may condition on signed or unsigned root events and allow the recipe to keep/flip original signs. The unconditional rows alone suffice for the convergence result below.

## Completeness with an effective error

The [learned rooted-cut rule](OPTIMAL-ROOT-RATE.md) is one universal randomized recipe: for every finite triangle-free H it uses k independent uniform draws *with replacement*, plus an independent hash seed, and has expected cost at most m(H)+C/√k on an independent test pair. Here m(H) has the blow-up normalization 2β(H)/N², including diagonal pairs of zero edge mass, and C is absolute. This recipe is defined without prior knowledge of which H is sampled.

Apply the same recipe to a column H of the signed LP, by choosing the k root labels independently and uniformly from its N labels. Then choose the two test labels uniformly among ordered distinct pairs outside the root support. Assume k≤N−2. Couple to an unrestricted independent uniform test pair by keeping the pair unless it meets the root support or its two indices agree, and replacing it with a uniform valid pair otherwise. For any fixed roots the probability of replacement is at most (2k+1)/N. On the event of no replacement the recipe observes exactly the finite-graph sample it expects. Thus its column coefficient on the right is at most

```math
 m(H)+\frac{C}{\sqrt{k}}+\frac{2k+1}{N}
 \le M+\frac{C}{\sqrt{k}}+\frac{2k+1}{N}.
```

The marginal test pair is uniform over ordered distinct labels, so the left coefficient is exactly the LP objective in each column. This argument does **not** assume that the candidate signed distribution comes from any graphon. Choosing k of order N^(2/3) gives an upper optimum at most M+O(N^(−1/3)), while sampling a true maximizing graphon gives a feasible value M. The result persists after adding any valid maximizer constraints, such as the new attachment rows. It does not require a representability assertion for pseudodistributions, or solve the exact sharp inequality.

## Restricting the underlying density band

Let [a,b] be the closed middle-density band, and write p(H)=2e(H)/N². For a genuine sample from a fixed graphon of density p in the band, the distance of p(H) to [a,b] has expectation O(N^(−1/2)), uniformly. Indeed the distinct-pair density is a bounded U-statistic with independent edge experiments on disjoint pairs; only pairs sharing an index contribute to the variance, and the diagonal normalization changes the mean by O(1/N). By using a conservative rational constant, the upper bound on expected distance is an additional exact linear LP constraint.

For any candidate ν obeying it, the probability that p(H) is farther than η from the band is O(1/(η√N)). In the other columns replace M in the preceding argument by the maximum on the η-expanded band. As η decreases to zero that maximum tends to the maximum on the closed band by cut compactness and cut continuity of the objective. Hence the signed hierarchy is also complete for the band maximum. In particular a strictly positive gap there would eventually have a rational finite flag certificate. The limiting proof gives no finite order that certifies the target at equality and no evidence on its own that a gap exists.

The distinction matters: an LP based on only a few root-flip or Gram rows can still have an artificial feasible law above the conjectured threshold, even if the conjecture is true. Reusing the older [Ferudun envelope](https://arxiv.org/abs/2606.28041) is not necessary for validity of these rows. The overlap is the use of a root recipe that extends to a global cut, rather than treating a cut of the sample as one of the graphon.

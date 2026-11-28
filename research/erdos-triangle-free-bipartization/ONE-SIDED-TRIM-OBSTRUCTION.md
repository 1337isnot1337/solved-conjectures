# One-sided trims cannot force a second-order gain

A first-order obstruction to the [split-and-trim approach](SPLIT-AND-TRIM.md) for [Erdős Problem 23](https://www.erdosproblems.com/23). It applies to a saturated zero-one graphon maximizer with arbitrarily many optimum cuts. It requires no compactness of the trimmed rows and no uniform cut-margin bound.

Let W be a maximizing triangle-free graphon of vertex mass one with optimum unordered monochromatic cost B>0. Use the [common law of actual optimum signs](SATURATED-GRAPHON-EXTREMIZER.md) for which the expected smaller sign mass in every measurable independent set I is at most 2B, and exactly 2B for almost every full neighborhood. The same proof works for a finite graph with that common law.

For almost every root x, suppose its neighborhood N(x) is replaced by a measurable subset R_x. Call the replacement guarded if for almost every sampled optimum f:

* almost all removed neighbors have sign opposite f(x);
* even after deleting them, the opposite-sign mass in R_x is strictly greater than the mass with sign f(x).

For any jointly measurable choice of such rows, let

    L_x = {y outside R_x : integral_(z in R_x) W(y,z) dz = 0}.

Then for almost every x, almost every y in L_x has sign opposite f(x) in almost every sampled optimum. In particular every original nonneighbor of x whose full neighborhood is disjoint from this trimmed attachment is forced to cross under the common optimum law.

## Proof

Fix a root x where the hypotheses and equality for N(x) hold. Let F_I(f) denote the smaller of the two sign masses in I. At an optimum, x's sign is a cheaper attachment sign for N(x); alternatively the strict guarded hypothesis already implies this. Because only opposite-sign neighbors are removed and that sign remains the majority in R_x, the exact payoff on each such cut is preserved:

    F_(R_x)(f) = F_(N(x))(f).

Let J be any measurable independent subset of L_x. By the definition of L_x and Fubini, R_x union J is independent. If the attachment sign imbalance of R_x is D_f>0 and the mass of J of sign f(x) is a_f, then

    F_(R_x union J)(f) - F_(R_x)(f) >= min(D_f,a_f) >= 0.

Indeed, write the two initial masses as m and m+D_f; only the first receives the a_f same-sign mass and the second can only increase. The expected difference is also at most zero, since R_x already has expected minimum 2B and the common law bounds the expected minimum for the union. Therefore a_f=0 almost surely.

The whole positive-degree graphon can be covered, modulo null sets, by countably many independent neighborhoods. Draw independent uniform roots: any positive-degree vertex is missed by them all with probability zero, and Fubini gives a realization covering almost all the space. Subtract earlier overlaps to obtain a partition by independent sets. Intersect this partition with L_x and use the result for each of its countably many pieces. This proves the claimed sign condition on all of L_x. Joint measurability then gives the two-root form by Fubini.

## Consequence for a split-and-trim search

Suppose a candidate new edge joins an original nonedge x,y, and the two retained attachments R_x,R_y are disjoint in measure. Under the same guards on both rows, if this edge has any positive chance of being monochromatic in the common law, both of the following masses must be positive, almost everywhere on the set of such candidate edges:

    mass(R_x intersect (N(y) minus R_y)),
    mass(R_y intersect (N(x) minus R_x)).

In fact if the first is zero, disjointness of R_x,R_y makes y compatible with R_x and the theorem forces opposite signs. The second follows symmetrically. The two asymmetric conflict sets are disjoint. Trimming only one endpoint therefore cannot yield a second-order witness whose new edge is missed in any cut from the stationary law. This remains true for whole sets of additions: integrate the individual condition over the added kernel to obtain zero expected missed addition. It also applies when both rows were trimmed but one asymmetric conflict set is null.

The search left open is genuinely two-sided: it must find useful pairs with positive residual conflicts in both directions, clear them on opposite rows, and make some added edge monochromatic in each relevant optimum. Nothing here proves that such a configuration must exist, or closes the full conjecture.

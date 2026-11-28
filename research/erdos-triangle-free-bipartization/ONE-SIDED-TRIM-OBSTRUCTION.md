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


## Quantitative exchange for a genuinely two-sided trim

For a fixed guarded root x let J be any independent set outside N(x). Let K consist of the points of R_x adjacent to a positive measure of J (for finite vertices, at least one vertex of J). Then (R_x minus K) union J is independent, by symmetry and Fubini. For each sampled optimum write D_f for the old sign imbalance on R_x, j_f and k_f for the masses of J and K having the sign f(x), and j=mass(J), k=mass(K). The exact first-order test is

    E min(j_f − k_f, D_f + j − k − j_f + k_f) <= 0.        (1)

Indeed, relative to the old smaller mass, the two sign totals of the new attachment have exactly the two displayed excesses. Their minimum has expected excess at most zero. It follows, for instance, that

    E min(j_f, (D_f−k)_+) <= E k_f + E (k−D_f)_+.

This uses min(j_f−k_f,D_f+j−k−j_f+k_f) >= min(j_f,D_f−k)−k_f and the identity min(j_f,D_f−k)=min(j_f,(D_f−k)_+)−(k−D_f)_+ for j_f>=0. When j+k<=D_f almost surely, no clipping is required: the first displayed entry is always the smaller or tied, so E j_f<=E k_f.

For a candidate addition layer H, take J within the new neighbors of x. It is independent in the original graph since H≥W on the source set and H is triangle-free. Under disjoint guarded trims, for any sampled cut, same-sign members of J cannot contribute to the same-sign conflict k_f. More explicitly, if z in R_x of sign f(x) is adjacent to y in J, then disjointness forces z outside R_y. The old edge yz was trimmed at y and must have endpoints of opposite signs; hence f(y) differs from f(x). Thus (1) prices any expected missed additions to J only against conflicts supplied by the *oppositely* signed part of J, not against every removed neighbor. In particular if all of J agrees with x under the law and k<D_f almost surely, then J must be null: the lower bound inside the expectation is strictly positive as soon as j>0.

For a finite weighted pair x,y, apply this with J={y}, write pi for their probability of equal signs, and let u_y=mass(N(y) minus R_y). If both rows are guarded and D_f>=a>u_y on R_x for all supported cuts, then K is contained in the trim of y and has mass at most u_y. In equal-sign cuts k_f=0 and the attachment gain is at least min(w_y,a−u_y); in opposite-sign cuts it is at least −u_y. Consequently

    pi min(w_y,a−u_y) <= (1−pi)u_y.

The same comparison in the other direction uses the mass and trim budget of x. In particular an always-monochromatic pair of positive-mass atoms cannot be repaired by guarded trims on both endpoints if their per-row trim bounds are smaller than the residual margins. On a graphon the atom argument cannot be applied to a null singleton. The measurable-set version instead uses the mass of the union of its conflicts, which need not be controlled by bounds on each individual trim.


## Linear robustness via random independent-neighborhood tests

The closure argument in fact has a quantitative form that does not assume optimum cuts or an exact common law. Suppose a probability law on signs satisfies E F_I <= c for every independent set I. For a particular independent attachment R define its slack theta=c−E F_R>=0. Its compatible exterior L consists of the vertices outside R with zero adjacency into R. For each sign cut let D_f be the absolute imbalance of the sign masses in R, and let sigma_f be its minority sign, arbitrary on ties. Then

    integral_L d_W(y) E[D_f 1_(f(y)=sigma_f)] dy <= theta.   (2)

In particular, on a graphon of minimum degree d_0>0, if the residual margins satisfy D_f>=a>0 almost surely, the total expected minority mass in the compatible exterior is at most theta/(a d_0). Without a uniform margin, the same bound applies to the expected minority mass contributed by the cuts for which D_f>=a, for any a>0.

To prove (2), for an independent subset J of L the increment in smaller mass on adding J is at least min(D_f,m_f(J)), where m_f(J) is its sigma_f-sign mass. Both quantities are in [0,1], so this increment is at least D_f m_f(J). The expected increment is at most theta by the common test bound. Apply this to J=L intersect N(z) for an almost-everywhere good root z, then integrate over z and use Tonelli. In a zero-one graphon the root integration weights y by d_W(y) exactly. For a fractional graphon, use positive neighborhoods, whose summed indicator degree is at least the weighted degree d_W, yielding the same conclusion. For finite product-weighted graphs use a root sampled by its weight. This is linear in the slack, without the extra losses of covering L by many pieces or discretizing the sign law.

For a guarded tight trimmed neighborhood, theta=0 and its margin is positive almost surely. Thus (2) also gives the exact obstruction above immediately. Near a maximizing graphon the [approximate common law](INDEPENDENT-ATTACHMENT-LAW.md) can be plugged in by using its universal bound as c. The estimate controls missed one-sided additions only when the actual residual slack and margins are known; it provides neither disjointness nor small slack for a general trim.

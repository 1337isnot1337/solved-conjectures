# Erdős's triangle-free bipartization conjecture

## Switching at the degree floor

A necessary structural condition for the saturated extremizer in [Erdős #23](https://www.erdosproblems.com/23). This is not an all-graph proof.

Use total vertex mass one and unordered edge masses. Let B be the minimum missed mass and let W be the zero-one triangle-free extremizer from the [stationary law construction](SATURATED-GRAPHON-EXTREMIZER.md). Thus d(x)>=4B almost everywhere, and its common law of optimum signs f has expected missed degree 2B at almost every vertex. Write M for W times the probability of a missed edge in this law, and put T={x:d(x)=4B}, S=T^c.

Then:

1. Almost every edge inside T is missed by almost every cut in the common law.
2. More generally, for almost every y,
   
       2 integral_T (W−M)(x,y) dx <= d(y)−4B.              (1)

3. For almost every optimum sign in the law and almost every y, let d_S(y) and m_(S,f)(y) be its original and missed degrees into S. Then

       d_S(y)−2m_(S,f)(y) >= d_T(y).                      (2)

In particular the original degree into S is at least that into T. The conclusion is local to each vertex. It is not obtained merely by bounding the total cost of a cut.

### Proof

For any optimum sign f put a_f(x)=d(x)−2m_f(x); this is nonnegative almost everywhere by the first-order optimality condition (or by switching an independent neighborhood subset). In the common law E a_f(x)=d(x)−4B, so for almost every f, a_f vanishes almost everywhere on T. Fix such a cut. For X and Y independent, lying on opposite f signs, switch all their vertices. Changing each side separately would increase the missed mass by integral_X a_f + integral_Y a_f. This sum counts the cost of each crossing X–Y edge twice, when in fact switching both ends leaves its status unchanged. Therefore optimality implies

       2 e(X,Y) <= integral_X a_f + integral_Y a_f.       (3)

For any independent X in one sign of T, its first term on the right is zero. Inequality (3) for every independent Y on the opposite sign says a_f(y)>=2d_X(y) there almost everywhere: otherwise take a positive-measure piece of its strict violation inside one of the countably many independent partition classes from the saturation proof.

To let X vary with y, first take a countable L1-dense family among all characteristic functions of independent subsets of the given sign of T. Such a family exists because L1 is separable and every subspace of a separable metric space is separable. Discard the union of the resulting exceptional null sets of y. For each remaining y, the neighborhood subset of T on the sign opposite to y is independent, since almost all neighborhoods are independent. Approximate that characteristic function by the countable family. Because W<=1, the integrals against W(y,.) converge. This proves, simultaneously for almost every y,

       2 integral_T W(y,x) 1_{f(x)!=f(y)} dx <= a_f(y).   (4)

The two sign choices use two countable families. For y in T the right side is zero, so the first conclusion follows. Averaging (4) gives (1), by Fubini and the jointly measurable representatives of the optimum signs. Finally, move the left side in (4) to the right and cancel the contributions of missed neighbors in T. The resulting inequality is (2).

In fact (2) means that if the optimum signs on S are held fixed, changing the signs on T arbitrarily cannot create a beneficial single-vertex flip at a vertex of S: its signed excess of crossing edges into S already dominates its entire degree into T. It does not assert optimality against many flips on S at once.

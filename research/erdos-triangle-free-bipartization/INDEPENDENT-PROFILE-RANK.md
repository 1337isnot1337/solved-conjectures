# Optimal-cut profile rank on independent sets

A necessary condition for a least-support counterexample to [Erdős Problem 23](https://www.erdosproblems.com/23). This does not assert that a fixed weighting, or every maximizing weighting, has the property.

Fix a least-order finite triangle-free template supporting a counterexample. Normalize the masses to 1. Among the maximizing weight vectors, choose one at which the number of optimal bipartitions (counted up to global exchange) is largest. All coordinates are positive: otherwise the maximum above 1/25 is achieved on a smaller support. Write b for this maximum and C for the finite set of optimal bipartitions.

For each vertex x, form the vector p_x indexed by cuts in C, whose coordinate at a cut is the mass of neighbors of x having the same sign as x in that cut. For every independent set I, the vectors {p_x : x in I} are affinely independent. In particular the number of optimal cuts is at least the independence number of the template.

## Proof

An affine dependence gives nonzero real coefficients d_x supported on I with sum d_x=0 and sum d_x p_x=0. Along w+t d every cut cost is affine in t, since no edge has both endpoints in I. Its linear coefficient is the sum of d_x times its monochromatic neighbor mass at x. Thus every cut in C stays exactly at b until the weights reach the boundary. Every other cut starts strictly above b. Increase t until the first zero weight or first additional cut at equality. The first event exists since a nonzero zero-sum direction has a negative coordinate. At the event all cuts still cost at least b and all old optimal cuts are still optimal. A zero weight contradicts minimal support. An additional equality with all weights positive contradicts the choice of the maximizing vector. This proves affine independence.

For the count, stationarity of the weighted maximum gives a probability distribution lambda on C for which lambda dot p_x=2b for all x. Thus the profiles lie in an affine hyperplane of dimension at most |C|-1, so an independent set cannot have more than |C| vertices. The affine independence proof itself does not require stationarity, only the count uses it.

Unlike the first-order equalities, these rank requirements come from the exact linearity of cuts on independent-set weight directions and from choosing an extreme pattern of ties. They furnish no upper bound yet on the number of attainable profiles in a triangle-free support. The next useful step would be to exploit additional structural restrictions, for example restricted attachment classes, to bound the rank from above.

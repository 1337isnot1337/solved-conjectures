# A chain link in a triangle-free three-colouring

**Theorem.** A triangle-free graph with a proper three-colouring satisfies the sharp weighted bound in [Erdős Problem 23](https://www.erdosproblems.com/23) if the link between some two colour classes is a chain graph (the neighborhoods on one side are nested). The result extends to links with an explicit weighted one-sided approximation error. It does not assume row balance or that the missing link is a union of disjoint rectangles.

Normalize total vertex mass to 1, with product costs on edges, and write A,B,C for the independent classes. A proposed chain approximation to the A–B link consists of an ordering a_1,...,a_m of A and a threshold k(b) in {0,...,m} for each b in B. Its proposed edges to b are exactly a_1,...,a_(k(b)). Let P be the actual edge mass outside the proposed link, Q the missing pair mass inside the proposed link, and c the mass of C. Then a sufficient condition for the sharp bound is

    P + c sqrt(2Q) <= 201/40000.

The square-root term can be replaced by sqrt(2c times the total weighted inversion mass defined below).

## Order the three classes

Orient edges cyclically A to B, B to C, C to A. Give a_i key 2i and b key 2k(b)+1. Every real A–B edge going backwards in this order is outside the proposed link, so their total cost is P.

For x in C, place it at a key minimizing the weighted attachment mass going backwards. If the key is t, this loss is the mass of its neighboring A-vertices below t plus the mass of its neighboring B-vertices above t. Keys can be chosen not to equal any A- or B-key, and choices for different vertices in C do not affect each other.

Write l_x for the minimum loss for x, and I_x for the mass of pairs (a,b) in its attachment rectangle for which the key of a is smaller than the key of b. Such a pair is necessarily proposed in the chain and absent in the real graph, by triangle-freeness. Thus I_x <= Q.

For a scan of the keys from left to right, let S be the cumulative neighboring A-mass and R the remaining neighboring B-mass. At each gap S+R>=l_x. When a neighboring a is reached, R is unchanged as its own mass is traversed, because the keys of A and B have opposite parity. During that mass interval R>=l_x-S remains valid. Both total A-attachment mass and total B-attachment mass are at least l_x, by the extreme thresholds. Therefore integrating against the growing A-mass gives

    I_x = integral R dS >= integral_(0 to l_x) (l_x-S) dS = l_x²/2.

The total backward edge mass in the resulting order is at most P+c sqrt(2Q). More precisely it is at most P+sqrt(2c sum_(x in C) w_x I_x), by Cauchy–Schwarz. The sum inside this last bound is a weighted triple count over a missing proposed A–B pair and a common C-neighbor.

## Cut at the mass median

Take the weighted median of the constructed order. If it crosses the mass of one vertex, split that atom into two adjacent-in-order false twins of the appropriate masses. This does not change the minimum cut: the twins have identical neighbors and no edge between them, so putting them together on their cheaper side never raises cost. It also preserves total backward mass. The two shores of the median cut now have mass exactly 1/2.

Use the original three labels on the first shore and the labels rotated by one on the second, as in [the one-way separator proof](ONE-WAY-SEPARATORS.md). Every forward cross edge has matched labels; the unmatched cross edge mass is at most the entire backward mass. The one-way separator theorem permits this mass to be at most 201/40000 on a balanced split. It gives the sharp conclusion, using the known density tail outside the middle band.

For an exact chain link P=Q=0, the construction gives an acyclic cyclic orientation. Equivalently, each x with both kinds of neighbors has all its B-neighbor keys strictly below all its A-neighbor keys, since otherwise they form a triangle. All the proofs are uniform in the number of row types. The unresolved step is to derive a chain or similarly useful ordering, at an adequate weighted error, from a general three-colouring.

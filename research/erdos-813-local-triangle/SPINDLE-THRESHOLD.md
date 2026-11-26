# Erdős–Hajnal local triangle conjecture

**Exact spindle appearance threshold in the independent Hermitian model.** Start with the fair random pencil splits. Retain secants independently with probability p and edges independently with probability s. Set
```math
T=q^{17}p^7s^{11}.
```
If T tends to zero, there is no spindle with high probability. If T tends to infinity, there is a spindle with high probability, and the number of distinct copies is asymptotic in probability to T/16384. If T tends to a fixed positive λ, the number of copies converges in distribution to a Poisson variable with mean λ/16384. These statements hold along arbitrary prime powers q tending to infinity. In particular the vertex-only threshold is p=q^(−17/7), far sparser than the p required for a polynomial gain on the square-root independence scale. This is a sharp statement about the random construction, not an answer to Erdős #813.

## Generic configurations and the leading count

Use the labels u,v,w,A,B,C,D and the [geometric patterns](SPINDLE-SHARP-COUNT.md). There are (1+O(1/q))q¹⁷ ordered patterns satisfying both opposite-tip nonincidences and having eleven distinct unital intersection points. For the leading constant, there are (1+O(1/q))q⁸ ordered choices of u,v and then (1+O(1/q))q³ choices of w. For each diamond choose its first two pencil points in (q+1)² ways. With those fixed, all q other points on the apex line except possibly one yield a unique second core by the Baer projection argument. Hence each diamond gives (1+O(1/q))q³ choices; excluding a fixed finite list of earlier pencils and core lines does not alter this estimate.

The number of additional geometrically feasible ordered patterns is O(q¹⁶). When u is incident to either opposite tip, the three tips have O(q¹⁰) choices, not O(q¹¹), and the uniform bound O(q³) on each diamond still applies. When neither incident opposite-tip pair occurs, any repeated pencil location must be one of the five first-diamond points, the five second-diamond points, or the joining tip point v∩w, with no repetition within one diamond. To realize such a collision one of the two diamonds must contain a prescribed point, reducing its count from O(q³) to O(q²). These are exactly the exclusions estimated in the [sharp count](SPINDLE-SHARP-COUNT.md).

## Extra chords cost a factor q

We also exclude all geometric incidence edges between the seven lines other than the eleven required ones. A basic three-line estimate suffices. Suppose two lines L₁,L₂ meet at a unital point Y and a third line L₃ meets each outside the unital. Then the number of other secants incident to all three is O(q). The choices through Y are at most q+1, one per unital point on L₃. For the others, take an affine chart with Y at infinity and set L₁:y=0, L₂:y=1. The central projection from a center P on L₃ from L₁ to L₂ is an affine transformation, with multiplier 1−1/y(P); at infinity away from Y its multiplier is 1. As P varies on L₃ this multiplier is a projective coordinate, sending the intersections with L₂ and L₁ to 0 and ∞ respectively. The image in that coordinate of the unital points on L₃ is a Baer subline omitting 0 and ∞.

As in the [two directions argument](SPINDLE-SHARP-COUNT.md), the two Baer sublines on L₁ and L₂ are affine subfield lines plus their common point at infinity. The multipliers for which the projected line and the L₂ line are parallel form the nonzero finite part of a Baer subline containing 0 and ∞. At most two of the unital centers can have such a multiplier. For every other center at most one further line joins the center to two finite unital points on L₁,L₂: the affine subfield lines of different directions meet in exactly one point. Even for the exceptional centers there are at most q possibilities per center. This proves the three-line estimate.

A core of one diamond with an extra edge to the other tip is incident to both its own tips and the other tip. In that triple the two opposite tips v,w are incident, while u is incident to neither, so the three-line bound gives O(q) choices of the offending core. Its partner has O(q) choices by the [single-core completion bound](SPINDLE-EDGE-PACKING.md). For the other diamond there are O(q³) choices, and the tips have O(q¹¹), so the patterns with this kind of extra chord number O(q¹⁶). Now assume no such cross-tip chords. For an extra cross-core chord, say AC, first choose the diamond with cores A,B in O(q³) ways. The remaining core C is incident to all of u,A,w. Here u,A are incident, and w is incident to neither, so again C and then D have only O(q²) choices together, giving O(q¹⁶) patterns. These cases cover all ten possible extra edges.

Thus there are (1+O(1/q))q¹⁷ ordered geometrically chordless patterns with eleven distinct pencils, and all omitted but geometrically feasible patterns number O(q¹⁶). Divide by eight to count copies as vertex sets: the abstract spindle has its apex singled out by degree four, and removing it leaves two triangles joined by a bridge. One may swap the two triangles and independently swap each pair of nondistinguished vertices, giving exactly eight automorphisms. Chordlessness means there is only one spindle on a given vertex set. Each of these favorable copies survives with probability 2⁻¹¹p⁷s¹¹ because it has distinct pencils. Consequently their mean is (1+O(1/q))T/16384. The expected number of surviving omitted copies is O(T/q) by the upper bound on omitted patterns, even after discarding all split conditions.

## Dependence and the Poisson window

A surviving favorable copy requires its seven vertices, eleven edges, and independent incidence bits for its eleven split tests. Two copies with disjoint vertex sets depend on disjoint random variables. For distinct ones sharing r vertices, r is at most six. If they share k required edges, the joint probability is at most p^(14−r)s^(22−k). The [uniform completion recurrence](SPINDLE-EDGE-PACKING.md) bounds the number of ordered pairs for a fixed r by O(q^(17+c_r)), with
```math
(c_1,\ldots,c_6)=(13,10,8,6,4,2),\qquad
(k_1,\ldots,k_6)=(0,1,3,5,6,8),
```
where k_r bounds k. If T is bounded below by a positive constant, write p=q^(−a), s=q^(−b) with a,b≥0. Then 7a+11b≤17+o(1), and
```math
q^{c_r-17}p^{-r}s^{-k_r}
\le q^{\,c_r-17+(17+o(1))\max(r/7,k_r/11)}
=o(1)
\qquad (1\le r\le6).
```
The last claim uses a strict negative exponent in each of the six cases. It is the bound, relative to the squared mean up to constants, on the sum of joint probabilities for that overlap size. For T tending to infinity, Chebyshev gives concentration about the mean for the favorable count, with the diagonal variance bounded by its mean. Markov shows the omitted count is o(T) in probability. For T tending to zero the first moment for all geometrically feasible copies gives absence with high probability.

For T tending to λ>0 use the dependency-graph version of the [Arratia–Goldstein–Gordon Poisson approximation](https://doi.org/10.1214/aop/1176991491), with each favorable copy's neighborhood consisting of all copies sharing at least one vertex, including itself. The sum of joint probabilities over distinct dependent pairs tends to zero by the six strict exponent bounds just proved, since the mean stays bounded. The sum of products of individual probabilities is O(q³⁰p¹⁴s²²)=O(q⁻⁴T²)=o(1), using the one-label completion bound. The conditional-dependence term is zero by disjointness of the underlying variables outside the dependency neighborhood. The Poisson approximation therefore holds in total variation for the favorable count. The omitted copies survive with probability o(1) by their first moment and do not affect the limit.

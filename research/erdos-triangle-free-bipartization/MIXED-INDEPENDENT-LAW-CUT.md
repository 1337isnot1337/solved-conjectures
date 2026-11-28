# Combine a stationary optimum cut with an independent-set law

An all-order cut inequality for [Erdős Problem 23](https://www.erdosproblems.com/23). It requires neither an exact half independent set nor a fixed finite list of tests. It uses one complete stationary optimum-cut law, not merely a lower bound on the usual fractional chromatic number.

Normalize vertex mass to one. Let e be the unordered edge mass and B the optimum unordered deletion mass of a triangle-free weighted graph or graphon. Suppose a law of optimum signs has expected monochromatic degree d=2B almost everywhere, as at a [global maximizer](SATURATED-GRAPHON-EXTREMIZER.md). Let an arbitrary independent-set probability law have inclusion function p(x); use a jointly measurable law, which in particular holds for any finite distribution of measurable sets. Set

    Delta = 1−2 integral p(x) dx,
    p'(x) = p(x) clipped to the interval [1/4,3/4].

Then

    B (1−(5/4) Delta+(1/2) Delta²)
      <= e/4 + (1/2) integral d_W(x) [p'(x)−p(x)] dx.       (1)

Here d_W is the *original* weighted degree. In particular, if p already lies in [1/4,3/4], the correction vanishes. In the middle-density band e≤3197/20000 this implies the sharp conjectured bound whenever Delta≤3/4000 (that is, the average independent set has mass at least .499625). Every density value here is in normalized weighted units. This is a sufficient condition; no general theorem providing such a law at an extremizer is claimed.

## The mixed cut

Let f be an optimum sign drawn independently from the stationary law. We sample a subset S as follows. The eventual cut is S versus its complement; S does **not** have to be independent.

* With probability one half take S to be a sample of the independent-set law.
* Otherwise choose one sign of f uniformly. Independently sample an independent set I and a single common uniform number U on [-1/2,1/2]. For vertices of the chosen sign include x in S exactly when

      1−2p'(x) + U [1−2 indicator_(x in I)] > 0.

The same I and the same U are used everywhere in this option. Conditional on I, the term multiplied by U is a sign, so each vertex of the chosen f-shore is included with probability 3/2−2p'(x). Thus the full inclusion probability is

    3/8 + [p(x)−p'(x)]/2.

Now examine an original edge xy, and write q=1−p(x)−p(y). This equals the probability that both endpoints avoid I, because I never contains both ends of an edge. In particular q≥0. If f(x)≠f(y), the endpoints cannot both be included in either sampling option. If f(x)=f(y), both are included only when the second option is used and their shared sign is chosen, of total probability one quarter.

In that case, suppose first neither p(x) nor p(y) exceeds 3/4. Then clipping only raises the smaller inclusion probabilities and therefore weakly lowers both thresholds of the form 1−2p'. On the event that exactly one endpoint belongs to I, the two sign multipliers of U are opposite. The interval of U satisfying both inequalities has length at most 2q: before clipping the sum of the two offsets is 2q, and clipping only reduces it. On the event that both endpoints avoid I, both sign multipliers equal +1. The probability that both inequalities hold is at most

    3/2−2 max(p(x),p(y)) ≤ 1/2+q.

If one endpoint has p above 3/4 instead, its clipped second-option inclusion probability is zero, so it cannot be jointly included. Combining cases, conditional on the chosen common sign and the second option, the joint inclusion probability is at most

    (1−q) 2q + q(1/2+q) = (5/2)q−q².

The case of both endpoints in I has probability zero. Thus conditional on a fixed f, an edge has missed probability at most

    1/4 + [p'(x)−p(x)+p'(y)−p(y)]/2
        + indicator_(f(x)=f(y)) [(5/4)q−q²/2].

This follows from adding the two marginal probabilities and subtracting twice the joint inclusion probability to obtain the chance the edge crosses.

## Average using the regular monochromatic kernel

Write M for W times the probability of equal f signs. Then M has unordered mass B and degree 2B. Use unordered edge integration (one half the full symmetric integral). The stationarity identity gives

    integral_edges M q = B−2B integral p = B Delta.

In particular 0≤Delta≤1. Cauchy–Schwarz in the edge measure with density M gives integral_edges M q²≥B Delta², with the B=0 case immediate. The clipping endpoint terms integrate to (1/2) integral d_W(p'−p). Taking the average of the sampled cut losses proves (1) because none of those losses is below B. If p stays in the given interval and Delta≤3/4000, then its coefficient on the left is at least 1−(5/4)(3/4000)+(1/2)(3/4000)². Multiplying that by 1/25 gives strictly more than 3197/80000, establishing the stated sufficient condition. Negative correction from heavily covered vertices can also offset some undercoverage; the signed integral in (1) is the exact correction in this proof.

Unlike the [half-independent covering argument](HALF-INDEPENDENT-COVER.md), (1) needs no grouping into complementary membership cells, and its error depends on the *average* mass deficit rather than the number of test sets. At zero deficit it recovers the same e/4 loss bound if the marginal coverage lies between one quarter and three quarters. It is not an ordinary fractional colouring certificate at nonzero deficit; some sampled shores can contain edges, and their cost is paid explicitly.


## Tune the mixture to the available coverage

The choice of one half above is not required. The following extension was independently derived in a background research pass and checked before integration. Fix a probability a in (0,1). Put l=2a/(1−a), and now let p' be p clipped to the interval [1/2−1/(2l), 1/2+1/(2l)]. For B>0, let E_M and Var_M denote expectation and variance under the probability measure obtained by normalizing the unordered monochromatic edge measure M by B. Then

    B [1−(1+3a) Delta/2+a Delta²]
      <= (1−a)e/2 + a integral d_W(p'−p)
          − a B Var_M(q) − a integral_edges M q |p(x)−p(y)|,       (2)

where q=1−p(x)−p(y). If B=0 the sharp cut conjecture already holds; the variance term can also be interpreted as zero.

Use the independent-set option with probability a. Otherwise choose the optimum shore as before and use the offset l(1/2−p'(x)) in the common-uniform test. It belongs to [-1/2,1/2], and the full probability that a vertex enters the sampled cut shore is (1+a)/4+a(p−p'). On an edge the probability that both endpoints enter the second option, conditional on choosing their shared sign, is bounded as follows. Let r=|p(x)−p(y)|. Exactly one endpoint belongs to the independent test with probability 1−q; the allowed interval of the common uniform variable has length at most lq. With probability q neither belongs to that test, and the concurrent inclusion probability is at most 1/2+l(q−r)/2. These comparisons hold when no coverage is upper-clipped, since lower clipping only decreases the offsets. If one coverage is upper-clipped, its second-option inclusion probability is zero, so the resulting joint upper bound still holds: (l+1/2)q−lq²/2−lqr/2 is nonnegative because q+r=1−2 min(p(x),p(y))≤1. If the optimum signs are opposite, no joint inclusion is possible in either option.

The missed-edge probability is one minus the sum of the marginals plus twice the joint probability. Thus it is at most the base (1−a)/2, plus a times the two clipping corrections, plus, on equal optimum signs only,

    [(1+3a)/2] q − a q² − a qr.

Average over edges and the stationary cut law. Use E_M q=Delta and E_M q²=Delta²+Var_M(q). This proves (2). The two savings beyond Jensen's bound are nonnegative. Taking a=1/2 and dropping them recovers (1).

### A lower average-mass criterion

Take a=3/5, so the clipping interval is [1/3,2/3]. If the original degree is positive almost everywhere and p≥1/3 almost everywhere, then p≤2/3 almost everywhere as well: any vertex with greater coverage could have no positive-measure neighborhood, since each edge satisfies p(x)+p(y)≤1. The clipping term therefore vanishes. If the average independent set has mass at least 847/2000=.4235, then Delta≤153/1000. On this interval, the left coefficient in (2) is decreasing in Delta. At B=1/25 its minimum product is exactly .031993816, while for e≤3197/20000 the right side, after omitting the savings, is at most .03197. The strict rational margin is 2977/125000000. This proves the sharp bound for any stationary middle-band graph with that independent-set law.

More generally a uniform lower coverage c in [1/4,3/8] yields the tradeoff by taking a=1/(3−4c); the upper clipping limit 1−c follows from positive degree. At c=3/8 the independent sets alone already suffice by taking one as the cut shore. Intermediate mixing values matter when that direct argument does not apply. The existence of suitable laws at all extremizers is not established.


## Test existence of the law by weighted independence

For any graphon of mass one and any 0≤c≤m≤1, the following are equivalent:

1. There is a jointly measurable independent-set law with p≥c almost everywhere and average mass at least m.
2. For every bounded nonnegative test weight v, its weighted independence supremum alpha_v satisfies

       alpha_v >= c integral v + (m−c) ess inf v.          (3)

The finite weighted version is the same statement with essential infimum replaced by minimum on the positive-mass support. Thus, for example, a hypothetical stationary middle-band counterexample has a specific bounded nonnegative witness weight that violates (3) at c=1/3 and m=847/2000. This is a way to look for or rule out the required laws; it does not assert all triangle-free graphons pass (3).

Here is the graphon compactness detail. In weak L², the set K of functions 0≤u≤1 with integral W(x,y)u(x)u(y) dx dy=0 is compact and metrizable. Indeed the integral operator of a bounded graphon is compact on L², so this quadratic expression is weakly continuous on the unit ball. Since W is nonnegative, the positive support of each such u is independent. Rounding u by a common uniform threshold on [0,1] realizes u as the marginal coverage of independent sets. The barycenters of probability laws on K therefore form a weakly compact convex set P of attainable coverage functions. Conversely any jointly measurable independent-set law has its indicator in K. To justify jointly measurable representatives for laws on K, use dyadic conditional averages and take their almost-everywhere limits, as in the [stationary law construction](SATURATED-GRAPHON-EXTREMIZER.md).

Necessity of (3) follows by averaging weighted independent-set mass. For sufficiency, if P misses the closed convex set {h in L²: h≥c, integral h≥m}, weak separation of a compact convex set from a disjoint closed convex set gives a real weight v in L² with

       sup_(p in P) integral v p  <  inf_(h≥c, integral h≥m) integral v h.

The right infimum can be finite only for v≥0 almost everywhere, since an arbitrarily large nonnegative function may be added on a subset where v is negative. That infimum equals c integral v+(m−c) ess inf v: start at the constant c and put the remaining mass on a positive-measure set where v is close to its essential infimum. The left supremum is alpha_v since mixtures and threshold rounding do not raise a linear supremum. Finally upper truncation of v preserves the strict inequality for a sufficiently high cutoff, because all p are bounded by one, the L¹ error tends to zero, and the essential infimum is unchanged. This contradicts (3) and proves the equivalence.

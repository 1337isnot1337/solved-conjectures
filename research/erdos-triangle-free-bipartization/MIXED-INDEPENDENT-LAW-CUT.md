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

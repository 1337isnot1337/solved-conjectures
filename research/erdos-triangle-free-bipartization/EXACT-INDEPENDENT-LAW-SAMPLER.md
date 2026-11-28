# Erdős's triangle-free bipartization conjecture

## An exact independent-law sampler

This sufficient condition for [Erdős #23](https://www.erdosproblems.com/23) strengthens the [mixed independent-law cut](MIXED-INDEPENDENT-LAW-CUT.md). It is not a resolution of the conjecture.

Normalize vertex mass to 1. Write e for the unordered edge mass and B for the optimum missed mass. Fix an actual cut f with missed mass L. Let m_f be its missed-edge degree. Take any jointly measurable law of independent sets with coverage function p. Fix l >= 1 and suppose

    (1−1/l)/2 <= p(x) <= (1+1/l)/2                         (1)

almost everywhere. Put a=l/(l+2). There is a random cut whose conditional missed-edge probability on an original edge xy is exactly

    (1−a)/2 + 2a 1_{f(x)=f(y)} (1−p(x)−p(y)).             (2)

Consequently,

    B <= (1−a)e/2 + 2a (L−integral m_f p).               (3)

Neither triangle-freeness nor stationarity is needed. Positive degree and the lower bound in (1) imply the upper bound, since adjacent coverages sum to at most one. Isolated vertices can be ignored in applying the condition.

### Sampler

With probability a take one independent test as the cut shore. Otherwise choose one shore of f uniformly, sample an independent test I, and sample a common uniform U in [0,1]. Only vertices on the chosen shore may enter the new cut shore. For such a vertex of coverage p, use a left interval from 0 if the vertex belongs to I and a right interval ending at 1 if the vertex lies outside I. Include the vertex if U belongs to its interval. The two interval lengths u(p), v(p) are

    p <= 1/2:   u(p)=(l−1)(1/2−p)/p,      v(p)=1;
    p >= 1/2:   u(p)=0,                     v(p)=1−(l−1)(p−1/2)/(1−p).

At p=0 or 1, which is only permitted for l=1, set u=0 and v=1 by continuity in p for this fixed l. At p=1/2 both definitions agree. Condition (1) is exactly what keeps both fractions in [0,1]. The second-option conditional inclusion probability is

    p u(p)+(1−p)v(p)=1/2+l(1/2−p).

Since f-shore selection contributes a factor 1/2, the overall inclusion probability is (1+a)/4, independent of p. A crossing edge of f has zero simultaneous inclusion because the independent sets cannot contain its two ends and the second option only uses one f-shore.

For an edge missed by f set q=1−p(x)−p(y). Its endpoints are simultaneously absent from I with probability q. Condition on using the second option and choosing their common f-shore.

* If both coverages are at most 1/2, a vertex outside I uses the whole interval. The joint inclusion probability is q+p(x)u(p(x))+p(y)u(p(y))=l q.
* Otherwise order the two coverages as 1/2−x and 1/2+y, where 0 < y <= x and q=x−y. The higher-coverage endpoint contributes nothing on the event it is in I. On the event only the lower one belongs to I, opposite endpoint intervals meet in length
  (l−1)[x/(1/2−x)−y/(1/2−y)], which is nonnegative. Multiply by the lower coverage (1/2−x) to obtain (l−1)q/(1−2y). On the event both are outside I, their right intervals meet in length 1−(l−1)y/(1/2−y). Weighted by q, this contribution sums with the previous one to l q. When y=1/2, the degenerate endpoints have coverages 0 and 1, q=0, and the joint event never happens. When l=1, the direct definitions also give l q.

The second option with the common f-shore has probability (1−a)/2. Combining marginals and joint probabilities now gives (2), using (1−a)l=2a. Integrating the missed probability establishes (3). In the earlier mixed sampler, on (1) the joint-inclusion upper estimate conditional on selecting the shared shore was lq + q[1−l(q+|p(x)−p(y)|)]/2. The bracket is nonnegative since q+|p(x)−p(y)|=1−2 min(p(x),p(y))<=1/l. Thus (2) is never worse than the earlier bound, even compared before discarding its heterogeneity savings.

### New threshold for the unresolved density band

Take l=3 and a=3/5. At a stationary graph average (3) over the optimum-cut law, for which the expected missed-edge degree is 2B. Set m=integral p. Then

    B [1−(6/5)(1−2m)] <= e/5.

For e<=3197/20000 the right side is at most 3197/100000. At B=1/25 the sufficient threshold is m>=3997/9600 (approximately .416354), with pointwise coverage p>=1/3 and positive degree. The earlier general criterion used .4235; the improved one extends the stronger overlapping-three-cover threshold to **arbitrary** independent-set probability laws. Indeed sampling three overlapping covering sets equally yields m=(1+t)/3 on the positive-degree support, where t is the mass covered twice. At a stationary candidate for the conjecture there are no isolated points of positive mass. With a single fixed optimum cut the same threshold uses the expectation of p under density m_f/(2B), not ordinary vertex mass, and requires no stationarity.

This does not establish that a law of the required pointwise coverage and average mass exists at an unrestricted extremizer.

### Extend the sampler to arbitrary coverage

For p outside (1), clip the probability of the left interval and the right interval separately: if p<c=(1−1/l)/2 take both lengths 1; if p>1−c take both lengths 0. The formulas match at the valid endpoints (for the right endpoint its member interval is already empty). Let p' denote p clipped to [c,1−c]. The overall marginal now equals (1+a)/4+a(p−p'), since the average inclusion in the second option is 1/2+l(1/2−p').

The joint probability J in the second option, conditional on a common f-shore, is still at most lq where q=1−p_x−p_y. Here is the exact deficit that can be kept in the inequality:

* If both endpoint coverages p_x,p_y are at most 1/2, let eta(p) = l(c−p)_+. The formula is J=lq−eta(p_x)−eta(p_y), since p u(p)=(l−1)(1/2−p)−eta(p).
* If their coverages are p_low=1/2−x, p_high=1/2+y with y>0 and p_high<=1−c, the formula is J=lq−min(eta(p_low),(l−1)q/(1−2y)). Indeed the two right intervals contribute q v(p_high) exactly, and the left-right contribution is the positive part of (l−1)q/(1−2y)−eta(p_low).
* If the high endpoint has p_high>1−c then J=0. If l=1 use J=q directly, including the degenerate endpoints 0 and 1.

Consequently for arbitrary p,

    B <= (1−a)e/2 + a integral d_W (p'−p)
          + 2a (L−integral m_f p) − (1−a) integral_edges M_f (lq−J).

Here d_W is the full degree and M_f is the kernel of edges missed by f, with the last integral unordered. This incorporates the reduction in simultaneous inclusion caused by clipping, rather than charging its full marginal cost on every missed edge. Omitting the last nonnegative subtraction still gives a valid sufficient test.

The following equivalent stationary form is useful for checking constants. If there is a stationary optimum law and the coverage avoids clipping, let m=integral p; then

    B [2+l(4m−1)] <= e.

For a single optimum cut, use m=integral m_f p/(2B) instead. The exact closure condition in the middle band is l(4m−1)>=1597/800. (Indeed 25·3197/20000−2=1597/800.) These tests concern actual independent-set laws; the edge inequality p_x+p_y<=1 alone does not give an attainable law.

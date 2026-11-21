# Independent root review

Reviewed on 21 November 2026. The proposed proof passes source, analytic, interval-arithmetic and complete replay checks. This is a computer-assisted mathematical proof of the full real-parameter statement; no Lean verification or external peer review is claimed.

## Source and scope

I independently opened the 2023 PLOS article and the November 2026 arXiv manuscript. The latter's Section 3 still leaves monotonicity of A(a)=2^(1/a)m(a)−a open. Bounds between the endpoint constants are a different assertion.

I also checked the primary Berg–Pedersen papers: the derivative bound follows from Theorem 3.3 of arXiv:math/0411282, and strict convexity is Theorem 1.1 of arXiv:math/0609442. The unit-scale conventions agree. The proof does not rely on an unproved statement about the transformed median.

## Analytic tails

I independently differentiated a log m + log E = a g − log 2. With q=−E_m/E, the resulting identity is

(a−mq)v'/v = a g' + log(E)/a − E_a/E + (log 2)mq/a².

This matches the draft. The bound on the partial derivative E_a follows after integration by parts; the dependence of m on a is not counted twice.

The comparison at x0=(2/3)2^(−1/a) proves m<x0 before that bound is used to estimate v'. For a≤1/10, monotonicity of 2^(−1/a)/a and 2^(−1/a)/a³ gives the three numerical bounds in the proof. The denominator remains positive, and the upper numerator used after discarding log E/a is positive, so replacing a−mq by a−m preserves the required upper estimate. The exact bound v'<2000/2289 is below one.

For a≥7, the published bounds m'<1 and m>a−1/3 give the displayed estimate. The cubic Taylor polynomial for exp(−t) has a strictly positive remainder. The remaining factor a(3 log2−2)−(log2)² is bounded below by 63/1000. This is a global tail argument, not an asymptotic sign assertion.

## Covering real intervals

For x in [a,b] and c>b, convexity bounds m'(x) above by the forward secant from b to c. Monotonicity and positivity bound exp(−log2/x)+(log2)m(x)/x² below by the expression using a and b in the certificate. The strict comparison of these bounds proves A'(x)<0 throughout the closed interval.

The deterministic integer node recurrence starts at 1/10, ends at 7, and adds 7007/1000 only to supply the last forward secant. The 4256 checked cells cover [1/10,7] exactly. The analytic tails include both boundary points. There is no unchecked gap.

## Interval arithmetic audit

I read the complete verifier. Its integer intervals contain every exact rational input. Addition and negation are exact at the fixed scale. Multiplication takes the extrema of all four endpoint products and rounds outward. A reciprocal is formed only after a strictly positive lower-endpoint check. These rules handle signed intermediate intervals.

Power-of-two reduction puts each logarithm argument in [1,2]. The 64-term odd-power series has a positive tail beginning at power 129, bounded by the geometric majorant used in the code. The arctangent truncation ends with a negative term, so its first omitted positive term bounds the remainder; Machin's formula therefore encloses pi.

The positive exponential series is evaluated after division by sixteen. Its tail begins at term 41 and later ratios are at most y/42; four squarings recover the intended exponential. Stirling's eight coefficients and the positive next coefficient agree with the displayed formulas. The recurrence subtracts log(a+j), j=1,...,16, from the expansion at a+17 and therefore encloses log Gamma(1+a).

For the incomplete-gamma series, the first omitted term is t81 and all later ratios are bounded by x/(a+82). The normalization by Gamma(1+a) is correct. Strict signs of the interval for log(2P) certify the two median bounds. Interval dependency widens enclosures and does not reverse these implications.

The certificate file is treated as untrusted data. Its rational node partition is independently regenerated, its bracket endpoints must be integers, and every bracket is proved by the CDF inequalities. Floating-point quantile proposals play no role in any accepted inequality.

## Complete independent replay

I ran the complete verifier from the finalized source, without modifying its arithmetic or certificate data. It passed all 4258 median brackets and all 4256 real-interval inequalities in 104.189 seconds in this run. The minimum certified margin is

38316221661991044002598352939471477 / 340282366920938463463374607431768211456 > 0.

The elementary constants used by the analytic tails also passed. The positivity of this minimum is evidence for the finitely stated certificate; the written interval implication and analytic tails extend the result to every positive real shape.

The mathematical claim is accepted as a complete proposed resolution. The separate source audit records the limits of the priority search.


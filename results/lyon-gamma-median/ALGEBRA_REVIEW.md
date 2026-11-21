# Independent algebra and certificate review

Status: the proposed proof passes. The complete interval certificate was replayed successfully. This review establishes internal validity and primary-source scope, not absence of earlier public work.

## Scope and established inputs

I independently read Lyon's current primary manuscript, arXiv:2611.14429v1, introduction and Section 3. It defines A(a)=2^(1/a)m(a)−a and explicitly leaves its monotonic decrease open. This is distinct from the already proved bounds on A between its two limiting values.

- https://borowiecki.dev/pdf/2611.14429
- https://arxiv.org/abs/2611.14429

I independently checked the unit-scale gamma convention and the required published inputs in Berg–Pedersen's primary preprints: 0<m'(a)<1 on the positive half-line; m(a)>a−1/3; and Theorem 1.1 giving m''(a)>0.

- https://arxiv.org/pdf/math/0411282
- https://arxiv.org/pdf/math/0609442

The revised small-tail argument does not need Lyon's upper bound on the median. The proof therefore does not import any unproved monotonicity claim or confuse a bound with a derivative inequality.

## Small tail

Starting from a log m+log E=log Gamma(1+a)−L, direct differentiation gives

```math
(a-mq)\frac{m'}m
 = a g'(a)+\frac La+\frac{\log E}{a}-\frac{E_a}{E}.
```

Subtracting L/a² gives exactly equation (4) of the draft, including the positive correction Lmq/a². The formula for g' follows from g(a)=integral_0^1 psi(1+at)dt. The integration-by-parts identity for E and the bound −E_a<=m/(a+1)² are correct. The derivatives are partial derivatives where stated, so dependence of m on a is not accidentally counted twice.

For x0=(2/3)exp(−L/a), the revised comparison is independent of the median:

```math
\log\Gamma(1+a)\leq-\gamma a+\frac56a^2,
\qquad
\frac{x_0}{a}\leq\frac5{768}.
```

Together with the certified constants gamma>57/100 and log(3/2)<41/100, it yields log(2P(a,x0))>449a/6400. Thus m<x0 and v<2/3 are justified before their use in the derivative estimate. The monotonicity of exp(−L/a)/a^j for j=1,3 follows from L−ja>0 on this entire range. All bounds in (5), the positive denominator a−mq, and the arithmetic v'<2000/2289<1 follow.

In replacing the denominator by a−m and discarding log E/a, the resulting numerator is positive, so the inequality direction is valid. This is a relevant sign check because v' itself need not have been assumed positive.

## Large tail

The derivative bound and Chen–Rubin lower bound give equation (6) in the correct direction. The cubic Taylor polynomial for exp(−t) has a strictly positive fourth-order remainder for every t>0. The resulting factor

```math
a(3L-2)-L^2
```

is positive for a>=7 by the stated rational bounds on L. Thus the large-tail argument requires no unverified asymptotic remainder.

## Coverage of each real interval

Convexity gives m'(x)<=m'(b)<[m(c)−m(b)]/(c−b) for x in [a,b], hence the upper secant enclosure used in (7). Monotonicity and positivity give

```math
\exp(-L/x)+\frac{Lm(x)}{x^2}
\geq\exp(-L/a)+\frac{Lm(a)}{b^2}.
```

The independent bounds on the numerator and denominator are in the required directions. Inequality (7) therefore proves A'(x)<0 throughout the cell. The certificate is not an inference from sampled derivative values.

The integer node recurrence produces 4,258 nodes, beginning at 1/10 and ending with 7 and the extra secant node 7007/1000. The 4,256 checked triples cover all consecutive cells from 1/10 through 7, with no omitted endpoint or gap.

## Interval arithmetic and series

I reviewed the implementation rather than treating a PASS message as sufficient. Rational endpoints use integer floor and ceiling. Signed multiplication takes the minimum and maximum of all four endpoint products. Reciprocals require a strictly positive lower endpoint. The logarithm uses monotonic endpoint evaluation and a valid positive arctanh-series tail after power 127. Power-of-two reduction keeps its reduced argument in [1,2].

The exponential routine sums the constant and 40 nonconstant terms after division by 16. Its geometric tail starts at term 41 with later ratios bounded by y/42; four squarings recover exp(x). The arctangent routine's 64-term alternating truncation ends with a negative term, so its first omitted positive term correctly bounds the remainder. Machin's identity then encloses pi.

All eight Stirling coefficients through B16/(16*15) and the next coefficient 43867/244188 are correct. The recurrence from z=a+17 subtracts log(a+j) for j=1,...,16, giving log Gamma(1+a). DLMF 5.11(ii) explicitly permits the signed first-neglected-term remainder for positive real arguments:

https://dlmf.nist.gov/5.11#ii

The positive incomplete-gamma series has the correct normalization by Gamma(1+a). After retaining terms through n=80, its tail is bounded by t81/[1−x/(a+82)], because the subsequent ratios decrease. DLMF 8.11.4 confirms the convergent expansion:

https://dlmf.nist.gov/8.11.E4

The sign of the resulting enclosure of log(2P) gives the claimed strict CDF comparisons. Dependency between interval occurrences only widens the enclosures; it does not invalidate them.

The loaded median brackets use integer endpoints. Explicit integer type assertions were added during review to preserve that guarantee for untrusted certificate input. They do not change the mathematical computation. No float enters a sign assertion.

## Replayed result

I executed the complete verifier and obtained PASS for all 4,258 median brackets and 4,256 interval inequalities in approximately 68 seconds. The smallest certified margin was

```math
\frac{38316221661991044002598352939471477}
 {340282366920938463463374607431768211456}>0.
```

The small-tail proof was then simplified as described above; its newly used constant checks were executed separately and passed. The cell data, enclosure formulas, and interval inequalities were unchanged. No substantive corrections remain.

Algebra agent, 21 November 2026.

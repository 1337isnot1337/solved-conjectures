# Independent review of the Chollet rank bound

Review date: 20 November 2026 (America/Chicago).

Reviewed the complete analytic argument in
`../inequalities/chollet_projection_checkpoint.md`, the exact interval
verifier, and its stored certificate. The auxiliary proposition passes this
review: a complex correlation matrix of rank r at least five and order
n at least r squared satisfies the strict self-conjugate Chollet inequality.
For r at least 64 the displayed exponential bound also follows.
This is a restricted theorem. It does not resolve Chollet's conjecture and
is not counted toward the requested ten resolutions.

## Later priority correction

The [source audit](chollet_rank_priority_audit.md) establishes that the
entire range with rank at least 18 follows from published inequalities.
At smaller ranks, prior work also covers every sufficiently large order.
Only a finite rank/order region remains outside the audit's conservative
criteria, and this review establishes no novelty there. The proof check
below remains valid; it does not make the large-rank result new.

## Tilt and upper bound

The sphere identity has the correct normalization. A standard complex
Gaussian vector in dimension r has squared radius with Gamma(r,1)
distribution, whose nth moment is the rising factorial (r)_n. Wick's
formula then gives the permanent of the Gram matrix.

For the tilted measure, expand the dth power of the linear form in a
coordinate along v and an orthogonal coordinate. Integration over coordinate
phases eliminates cross terms, including after multiplication by the log of
the squared first coordinate. The binomial coefficient squared in the
expansion is multiplied by j!(d-j)!/(r)_d. After normalizing by (r)_d/d!,
the occupation weights are exactly the Binomial(d,t) probabilities. Thus
the beta log expectation is H_j-H_(r+d-1), as stated.

Concavity of the finite harmonic sequence gives H_j at least j H_d/d.
The sum of t over the unit Gram vectors is the largest frame eigenvalue.
The entropy term has the stated sign and normalization; subtracting it in
Jensen's inequality gives L_d. For d=0 the same formula follows from the
untilted identity. There is no regularity problem from zeros of linear forms:
their logarithms are integrable on the complex sphere and the density is
bounded.

The extension of Bregman's bound to rows with fractional sums is valid.
After maximizing over the product of row polytopes, each row has at most one
fractional entry. Expanding that row as a convex combination of binary rows
with adjacent degrees and using multilinearity gives the product of affine
interpolants of (k!)^(1/k). The argument does not require concavity of that
interpolant. The bound on every squared-Gram row sum by the largest
eigenvalue follows from C squared at most lambda C in the PSD order.

I rederived both derivatives of h. They give h positive, increasing, and
strictly concave on [1,infinity), with h''/h = ((log x)^2-x)/x^4. Therefore
h lies above the relevant interpolant, and its logarithmic derivative is
at most 1/x. The integral upper bound on log(k!) used at integer endpoints
has the correct inequality direction.

## Uniform extension and analytic tail

With c=lambda/n fixed, L_d/n separates into the Gamma difference, the two
harmonic terms, and minus the entropy divided by n. The derivative estimate
uses f(0)=0 and the identity

```math
n f'(n)-f(n)=\int_0^n t f''(t)\,dt.
```

The positive trigamma series exceeds its integral 1/(r+t). Together with
the upper logarithmic derivative of h, this gives the stated lower bound

```math
\frac{d}{dn}G_d(n,r,cn)
>\frac1n\left(1-\frac{2r}{n}\log(1+n/r)\right)>0
```

for r at least three and n at least r squared. The last sign follows from
the decreasing function log(1+x)/x and log(4)/3 less than one half.
Consequently the interval cover at n=r squared really does cover every
larger integer order; it is not a finite-order check substituted for an
all-order statement.

For r at least 64, d=floor(r/4) gives 2J_d/n at most 1/(2r).
The bound (r)_n at least n! at least (n/e)^n, followed by
a x minus log x at least 1 plus log a, has the correct constants.
The harmonic comparisons give precisely the displayed tail expression.
After replacing Euler's constant with its indicated lower and upper bounds,
that expression increases with r. The rational estimates at r=64 yield
0.1935625, strictly larger than 19/100. Thus the tail covers all ranks at
least 64 and all corresponding orders, without a numerical asymptotic
assumption.

## Exact certificate

The verifier was read before execution. Its logarithm enclosure uses a
positive atanh series after exact rational scaling into [1,2]. The omitted
tail bound is valid, including the endpoint 1. Negative powers of two use
the correct reversal of lower and upper log(2) bounds.

The Robbins formula is applied to Gamma(t) by subtracting log(t) from the
formula for t!. Hence the factor t minus one half is correct, and the
common log(2 pi)/2 term cancels. The lower numerator remainder and upper
denominator remainder give a valid lower bound for the Gamma difference.

The verifier checks every rank from 5 through 63, exact matching endpoints,
the full interval [r,r squared], and a strictly positive rational gap in
each interval. Floating point is used only for optional certificate
generation and descriptive output; it never decides acceptance.

Execution returned:

```text
Verified 458 closed intervals covering all ranks 5..63 at n=r^2.
Smallest certified interval gap exceeds 0.000271422543 (display only).
Verified rational constants in the analytic tail for every rank >=64.
Unrestricted Chollet still requires the unproved face-reduction bridge.
```

The exact Wick enumerator also returned the stated positive
determinant-square remainder. That identity blocks the proposed immediate
Wishart-projection implication; it does not block every possible projection
argument.

## Limit of the result

Extreme complex correlation matrices have the needed rank bound. The proof
does not establish that a violating matrix, if one exists, can be replaced
by an extreme one. The exhibited two-by-two example correctly rules out
unqualified quasiconvexity, while leaving the narrower violating-superlevel
claim undecided.

The source audit correctly credits sphere integrals, row interpolation, and
polynomial tilts to prior work. This review verifies the displayed argument;
it does not establish historical priority. The corrected Zhang discussion
does not transfer a theorem about an unnormalized permanent to this ratio.
No complete conjecture resolution follows from this checkpoint.

# Independent root review

Reviewed on 2026-11-21. This is an internal mathematical review, not external
peer review or proof-assistant verification.

## Verdict

The written argument proves the complete published Conjectures 2, 5, and 8
of López Pouso and Segura, with strict monotonicity. No mathematical gap
was found. The three related assertions should be recorded as one named
result package and one campaign count. The separate finite-degree
Gauss–Legendre conjectures are not established by this proof.

## Source comparison

The published article, DOI
\lt https://doi.org/10.1186/s13660-025-03283-w>, was inspected directly.
Equation (16) and Conjecture 2 agree with the manuscript's indexing of
the trapezoidal-error sequence. Equation (18) and Conjecture 5 agree
with the midpoint-error sequence, including the limit minus pi squared
over six. The nearby source prose contains a conflicting denominator;
the numbered conjecture and numerical value identify the intended
constant. Equation (19) and Conjecture 8 agree with the weighted
first-moment expression. Appendix D establishes finiteness of the
first limit, not its conjectured value or monotonicity.

## Analytic checks

1. Nicholson's order-zero integral has factor eight over pi squared.
   Substituting twice the square root of the argument times the
   hyperbolic sine gives exactly the manuscript's factor four.
   Squaring and applying the beta integral gives the stated positive
   measure. Its mass is four over pi squared and its first moment is
   one over pi squared. Differentiation is locally dominated, and the
   second derivative of the squared auxiliary function is strictly
   positive because the measure is supported at positive values.

2. The phase starts at minus pi over two, reaches pi over two at the
   first positive zero, and increases strictly by the Wronskian.
   Thus the positive zeros occur at the claimed integer phase values.
   Both the inverse-phase differential identity and its third
   derivative have the stated factors. The endpoint value and first
   derivative tend to zero. Taking limits preserves convexity at
   zero, and strict convexity remains on every nonempty interval.

3. The first sequence is exactly half the composite trapezoidal error
   for the inverse-phase derivative. The difference of consecutive
   terms adds one positive local error. The second sequence's
   consecutive difference is exactly a negative midpoint-rule error.
   These facts prove signs and strict monotonicity for all indices.

4. The radial Green-function computation has the correct boundary
   sign: integration by parts contributes one from the singular
   endpoint. Subtracting the zero-parameter Green function makes the
   Fourier–Bessel coefficients summable, of order the inverse cube of
   the index. The bound on the order-zero Bessel function gives
   uniform convergence on the closed interval. Hilbert-space
   completeness therefore gives equality at the endpoint as well as
   in the interior. Differentiation with respect to the positive
   parameter is locally uniform, so the resolvent identity follows.

5. The leading reciprocal terms in the zero and amplitude
   asymptotics cancel. This is essential: it makes the renormalized
   weight errors absolutely summable. Dominated convergence handles
   their contribution to the scaled resolvent difference. The
   denominator perturbation is bounded by splitting the displayed
   sum at the large parameter and tends to zero after scaling.

6. The shifted Euler–Maclaurin correction has the required sign:
   the second Bernoulli polynomial at three quarters is minus one
   over forty-eight. The rational test function and its first four
   derivatives have the decay required by the remainder estimate.
   Subtraction gives the renormalized sum and both conjectured
   limits. Recomputing the arithmetic sums reproduces the constants.

7. Expanding the squared sum of weights proves the exact
   first-moment weighted-average identity. Every added value is
   larger than every preceding value, so the average increases
   strictly. Divergence of the total weight and convergence of the
   averaged sequence imply the claimed limit by a finite-prefix
   and tail argument.

The additional circle-constant monotonicity follows from the same
positive measure. The manuscript correctly stops short of treating
it as a proof of the uniform finite-degree circle conjecture.

## Limits of this review

The proof uses classical Bessel identities, Fourier–Bessel
completeness, and asymptotic expansions. Their exact source locations
belong in the bibliography. This review checks the mathematical
deductions; it does not certify worldwide priority. The separate
source audit records the literature search and its limits.

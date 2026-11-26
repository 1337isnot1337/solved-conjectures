# Integral representation for Taylor sections

Independent derivative and integral-bridge source review: passed. Both frozen sources match `section-integral-handoff.json` and their integrated root copies. The final closure verification is separate.

The finite-section derivative is proved by induction from the literal coefficient recurrence and the actual principal-square-root derivative on the right half-plane. The successor cancellation uses the proved square identity and a justified nonzero square root. No power-series remainder or coefficient-differentiation premise is assumed.

For every z with norm at most 1 and z != 1, `segment_re_pos` proves positive real part of 1 - tz for the whole real closed interval 0 <= t <= 1. The quotient expression for the actual resolvent therefore has the correct principal branch. The real half-power weight is exactly the inverse square root of 1 - t on the open interval. The proved beta normalization cancels this weight and yields the actual real-segment integral.

`segment_section_hasDerivAt` includes the factor z^(M+1) from the real parameter derivative; the proof never divides by z, so z = 0 is included. Continuity of the actual derivative kernel on the closed real segment proves interval integrability. The fundamental theorem of calculus evaluates the two endpoints as sqrt(1-z) invSection M z and 1, giving `invSection_remainder_identity` with only the intended closed-disk and z != 1 assumptions. The separate already verified section positivity at z = 1 completes the missing boundary point in the final theorem.

This is the square-root instance of Section 1, equation (2), of the existing repository proof at commit `6432592c03b24aed190ed7b3204ed942a40a8da4`, recorded by Cinna Davis, for Leonid V. Kovalev’s original Conjecture 1.2. No general fractional-exponent supplement is claimed.

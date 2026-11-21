# Independent review of López Pouso–Segura's Bessel-weight conjectures

Reviewed by the algebra agent on 21 November 2026. Draft reviewed:
`agent-analysis/lopez-pouso-segura-bessel/PROOF.md`.

**Verdict:** no substantive mathematical gap found. This is an independent
proof review, not an independent historical-priority certification.

The original [Springer article](https://link.springer.com/article/10.1186/s13660-025-03283-w)
was read at equations (16), (18), and (19), and Conjectures 2, 5, and 8.
Its definitions and index ranges agree with the draft. The separate uniform
Gauss–Legendre assertions are correctly left outside the claimed result.

## Checks

- Nicholson's integral in [DLMF 10.9.30](https://dlmf.nist.gov/10.9.E30)
  gives the coefficient `4/pi^2` after the stated change of variables.
  Squaring and using the beta integral gives the positive measure coefficient
  `16/pi^5`. Its mass is `4/pi^2` and its first moment is `1/pi^2`.
- The branch of the phase starts at `-pi/2`; its first positive Bessel zero
  corresponds to phase coordinate one. The Wronskian gives
  `lambda'(k)=4a_k`. Differentiating the inverse-phase ODE gives precisely
  `lambda'''=(pi^6/2) H (H^2)'' > 0`.
- The trapezoidal expression for `2 C_i` and midpoint expression for
  `E_i-E_(i-1)` have the asserted signs and constants. The initial interval
  is valid because `lambda'(0+)=0`.
- In the Green identity, the lower endpoint contributes `-1` to
  `r(phi F_s' - F_s phi')`, so the integrated boundary difference is `+1`.
  This yields the coefficient `1/(lambda_k+s^2)` with the correct sign.
- The difference series has coefficients `O(k^-3)`, hence uniform
  convergence on `[0,1]` from `|J_0|<=1`. The limit at zero is
  `log(s/2)+gamma+K_0(s)/I_0(s)`. Differentiation yields the factor `4s`
  in the resolvent identity.
- McMahon's expansion [DLMF 10.21.19](https://dlmf.nist.gov/10.21.E19)
  and the Nicholson-integral amplitude expansion cancel the reciprocal
  term in `a_k`, leaving an absolutely summable `O(k^-3)` correction.
  The denominator replacement contributes `O((1+log s)/s^2)` after the
  prescribed multiplication by `s^4`.
- In the shifted Euler–Maclaurin calculation, `B_2(3/4)=-1/48`, so the
  correction to the scaled sum is `+1/(96A)`. Consequently the second
  resolvent coefficient is `-1/16+pi^2/192` and the renormalized sum is
  `1/16-pi^2/192`. The integrable fourth derivative gives the required
  `O(A^-3)` sum remainder.
- The arithmetic limits are `C_i -> pi^2/12` and `E_i -> -pi^2/6`.
  The identity expressing `K_i` as the `a_j`-weighted average of
  `C_(j-1)` is exact and proves positivity, strict increase, and the limit.
- The additional circle-constant consequence agrees with the measure
  identity and tends monotonically to `1/4`; it does not establish the
  separate finite-degree circle conjecture.

## Citation refinement

[DLMF 10.23.18–20](https://dlmf.nist.gov/10.23#iii) supplies a direct
Fourier–Bessel expansion theorem: weighted integrability and local bounded
variation imply equality at each interior point. The smooth difference
`F_0-F_s` satisfies these hypotheses. This provides a precise source for
the interior equality before the uniformly convergent series is extended
to zero. It can replace or supplement the draft's general reference to
Hilbert-space completeness.

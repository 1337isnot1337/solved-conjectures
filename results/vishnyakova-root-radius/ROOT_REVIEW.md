# Independent root review

21 November 2026. I checked the complete ordinary proof and read the primary July and August source statements, together with the precise Grace–Walsh–Szegő and Hurwitz formulations in Borcea–Brändén. No Lean work is part of this review.

The July source's transformed-polynomial characterization is exactly the beta=1 class used here. The August Definition 1.4 and Open Problems 7.1–7.2 use the same weighted falling-factorial transform and the full positive-real weight domain. Thus the proof addresses the unrestricted conjecture in both formulations, counted as one result.

I checked the generating function by differentiating it and comparing coefficients, the sign of the off-diagonal product in the tridiagonal determinant recurrence, and the boundary term in the quadratic-form estimate. The n=1 case is covered. Complex eigenvectors do not invalidate the Rayleigh identity: D and K are Hermitian, so their quadratic forms are real even though J is not Hermitian.

The reciprocal-segment lemma is correct for every complex parameter in the specified half-plane. The upper endpoint has modulus strictly below one; the segment's real crossing lies strictly between minus one and one. Its upper portion is therefore inside the unit disk. This proves the necessary complex-parameter diagonal exclusion, which is stronger than an equal-real-parameter calculation.

Grace–Walsh–Szegő applies to the symmetric multiaffine parameter polynomial in a convex circular domain. The subsequent Hurwitz argument uses a connected exterior half-disk in the root variable and excludes an identically zero limit through the fixed leading coefficient. This treats repeated parameters and boundary values. The corrected finite Vandermonde identity has no alternating factor inside its sum; expanding Q(-w-1) supplies the global sign. The resulting reflection identity and positive falling-factorial expansion bound all real roots. The all-one vector attains the claimed extremal modulus.

I independently reran verify.py: all 73 exact algebraic checks pass. These are diagnostics of the identities, not a finite-range substitute for the argument. The analysis reviewer caught and repaired the draft Vandermonde sign display before this final review.

Earlier equal-parameter recurrence and matrix work is explicitly credited in the proof and audit. The recorded earlier all-degree equal-parameter and low-degree independent-parameter results do not supply the new arbitrary-parameter extension. The written proof passes this internal mathematical review; its novelty remains bounded by the documented literature search, and external review remains outstanding.

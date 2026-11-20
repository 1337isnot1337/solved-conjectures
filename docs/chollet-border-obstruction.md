# Coefficientwise Schur-border induction is insufficient

2026-11-20. Research obstruction; no novelty or full-conjecture claim.

After normalizing a positive final diagonal to one, every PSD matrix can be written

    A(u) = [[R+u² vv*, uv], [uv*, 1]],

at u=1, with R PSD. This suggests induction on the order via a polynomial in t=u². All A(u) are PSD for real u: if R=VV*, use Gram rows (V_i,u v_i) followed by (0,...,0,1).

A tempting sufficient claim is that every coefficient of

    per(A(u))² − per(|A(u)|²)

is nonnegative. Its constant coefficient is precisely the lower-order Chollet gap. The other coefficients might then have supplied an all-order induction. However the coefficientwise claim fails.

Use real data

    V = [[−1,−1], [1,−1], [−1,0]],  v=(1,−1,−1),
    R = [[2,0,1], [0,2,−1], [1,−1,1]].

The exact polynomials in t=u² are

    per(A)=8+8t+6t²+24t³,
    per(|A|²)=24+40t+168t²+112t³+110t⁴+12t⁵+24t⁶.

Their difference is

    40+88t−8t²+368t³+310t⁴+276t⁵+552t⁶.

The coefficient of t² is negative. `border_certificate.py` independently enumerates the 24 permutation terms using integer polynomial arithmetic and asserts every coefficient.

This is NOT a violation of Chollet: for t≥0 the difference equals

    40(1−t²/10)² + 88t + 368t³ + (1548/5)t⁴ + 276t⁵ + 552t⁶,

which is positive. Thus a full induction would need to retain compensation across polynomial degrees, rather than proving coefficientwise positivity in this basis.

This is a counterexample only to the auxiliary proof strategy developed during this research. No claim is made that the auxiliary observation is previously unpublished, or that it resolves a named open problem.

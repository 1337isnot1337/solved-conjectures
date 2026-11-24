# Adversarial review of the restricted cofactor arguments

Review by the alternate-PH agent, 23 November 2026. This is a written mathematical review, not formal verification or external peer review.

## Composition multiples

I read COMPOSITION_MULTIPLES.md in full and checked its extraction against FOURIER_RESULTANT_FILTER.md and the BCJS source.

No gap was found in the final generic-center proof. Since phi is nonconstant in characteristic zero, phi-prime(R) is a nonzero polynomial. At every point of its nonvanishing set, the analytic inverse of phi expresses R as a one-variable power series in F-F(b). Only D scalar coefficients are required to compute the order-D Taylor polynomial. Truncated evaluation costs polynomially many gates even if F has unbounded formal degree. Moving the generic center toward the prescribed center gives the required border limit, including at arbitrarily ramified points. Diverging inverse-series constants are permitted; the polynomial outputs converge.

The circuit overhead is polynomial in L, input dimension, and D. The scalar inverse-series coefficients are allowed nonuniform complex constants. The resulting lower bound only covers univariate compositions of the resultant, as stated. I reread this shorter final proof after it replaced the earlier ramification-root construction.

## Cofactors with few polynomial parameters

I read FEW_PARAMETER_COFACTORS.md in full. The local analytic dependence argument is correct in both cases. If R is transcendental over C(h), the derivative of the nonconstant polynomial T q(T,h) remains nonzero after evaluation at R. If R is algebraic over that field, separability and denominator clearing give an equation with nonzero T derivative. Algebraic dependence among the h_i does not prevent applying the implicit-function theorem on an ambient neighborhood of their numerical values.

The binomial number of Taylor coefficients is counted explicitly. The coefficients can be used as constants without an algorithm constructing them. Truncated substitution and the moving-center limit give the claimed bound. Rational dependence of the cofactor must remain excluded; the example q(T,H)=H/T would otherwise make the hypothesis vacuous.

I found one gap in the original resultant application: specializing a nonzero multiple first can make it zero if its cofactor vanishes on the BCJS grid. I supplied the repair now present in Section 2. Apply the jet lemma first to the original nonzero multiple in the full coefficient space, at the point corresponding to the grid origin. Then pull back the resultant jet along the affine grid map. Taylor truncation commutes with this affine substitution. I reread the corrected Section 2 and found that it implements this repair and records the failed specialization explicitly.

I also checked the BCJS dimension relation directly in Lemma 3.3 and Appendix A.1. A grid of allowed side m can represent the permanent of size m-1 by padding with one identity entry. The hard coefficient carries a nonzero scalar kappa, which the circuit extraction divides out. For a pure projection that folds kappa into an extra matrix entry, taking permanent size m-2 also suffices. Either choice is Theta(m); no unsupported exponential parameter relation is used.

The general all-nonzero-multiple statement remains unproved. A generic HN accepting branch does not restrict its cofactor to a polynomial in the resultant and few easy parameters. Neither reviewed note supplies that missing hypothesis.

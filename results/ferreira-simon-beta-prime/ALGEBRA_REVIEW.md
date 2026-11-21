# Independent algebra-agent review

Reviewed 21 November 2026. The complete proposed proof of Ferreira–Simon Conjecture 1 passes the independent mathematical audit. I read the original primary manuscript, checked the exact conjecture and Proposition 5, derived the conditional Mellin integral independently, and then checked every step of PROOF.md. Novelty is a separate gate and is not certified by this note.

## Exact source and transformation references

The original [arXiv:2108.09244v2](https://arxiv.org/pdf/2108.09244), printed page 20, states exactly the proposed independent-factor distribution identity for every a>0 and 0<b<1/2. Proposition 5 is on printed page 15. The source's special cases a=1/2 and a=1-b do not cover the new proof's complete domain.

The needed quadratic identity is precisely [DLMF 15.8.15](https://dlmf.nist.gov/15.8.E15), not either of the neighboring square-root or two-branch formulas. Its variable is x=(1-u)/(1+u), which lies strictly between 0 and 1. Its denominator is 1+A-B with A=-s and B=1/2-b. The hypotheses hold directly, and no continuation across a cut or choice between quadratic branches occurs. Euler and Pfaff transformations are [DLMF 15.8.1](https://dlmf.nist.gov/15.8.E1).

## Independent derivation of the mixture transform

For fixed U=u^2, the conditional expectation equals

```math
\frac{2}{\mathrm B(b,1/2-b)}
\int_0^1 v^{2b-s-1}(1-v^2)^{-b-1/2}(u+v)^s\,dv.
```

Under v=(1-y)/(1+y), the unnormalized integral acquires the factor 2^(-2b)(1+u)^s. All powers of 1+y cancel. The resulting beta integral has positive parameters 1/2-b and 2b-s and gives 2F1(-s,1/2-b;b+1/2-s;x).

The quadratic transformation replaces x by 4x/(1+x)^2=1-u^2. Its prefactor combines with (1+u)^s to give 2^s. Thus the conditional normalization before gamma duplication is

```math
\frac{2^{1-2b+s}\sqrt\pi\,\Gamma(2b-s)}
{\Gamma(b)\Gamma(b+1/2-s)}.
```

Averaging over U~Beta(a,1/2), or equivalently over 1-U~Beta(1/2,a), gives exactly the 3F2 called T_(a,b)(s) in the proof. Its excess is a+b>0. The displayed K_b(s) and its alternative product-of-gammas form are both correct. All series coefficients are positive in -2a<s<0, so the uses of Tonelli are justified without conditional-convergence arguments.

## Independent check of the sum transform and matching

The convolution density follows by putting each summand equal to xt and x(1-t). Their denominator product is 1+x+x^2t(1-t). Under z=4t(1-t), the two symmetric halves contribute the factor 2^(1-2a) B(a,1/2)=Gamma(a)^2/Gamma(2a), giving the constant written in the proof.

Pfaff's identity sends -x^2/[4(1+x)] to x^2/(x+2)^2 and changes the second numerator parameter to 1/2. The subsequent substitution x=2y/(1-y) yields the factor 2^(2a+s) and endpoint weights y^(2a+s-1)(1-y)^(2b-s-1), as stated. Beta integration and duplication of (2a+s)_(2n)/(2a+2b)_(2n) cancel the original (a+b)_n and recover the primary Proposition 5 exactly. The remaining 3F2 has excess b-s>0.

The transformation from H to T can be checked without any table of Thomae relations: integrate the numerator parameter 1/2 against Beta(1/2,a+b), apply Euler's identity to the inner 2F1, and obtain the new endpoint exponent b-s-1. The ratio of beta normalizations is exactly

```math
\frac{\Gamma(a+b+1/2)\Gamma(b-s)}
{\Gamma(a+b)\Gamma(b+1/2-s)}.
```

Gamma duplication at a+b verifies equation (13), including every power of 2, sqrt(pi), and Gamma(b). It leaves the Mellin transform Gamma(2a+s)Gamma(b-s)/(Gamma(2a)Gamma(b)) of the independent beta-prime factor.

## Domain and uniqueness

The interval -2a<s<0 is nonempty for every allowed a. Every beta parameter used in the derivation is positive there. The factor Q>=1 has all negative moments, and Q<=1+V^(-1/2) gives finite positive moments below 2b. Therefore the proposed product has moments throughout -2a<s<b. The same strip for the sum follows from the derived negative moments and elementary bounds on positive moments of a sum.

Moment bounds at nearby real points dominate the complex powers and their logarithmic derivatives on compact substrips. Both Mellin transforms are holomorphic on the claimed connected strip. Their equality on the negative real interval extends to the imaginary axis by the identity theorem. Uniqueness of characteristic functions for the logarithms then gives the complete positive distribution identity. No moment-determinacy assumption is missing.

I found no proof gap, parameter exception, missing independence assumption, normalization mismatch, or source-scope reduction. The nearby Conjectures 2 and 3 are correctly kept outside the claimed result.

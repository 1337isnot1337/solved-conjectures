# Kovalev’s square-root Taylor-section zero-free conjecture

## Independent review of the beta transport and comparison

Reviewed on 24 November 2026 by the `claim_audit` lane, which did not author or modify the five modules under review. This is a mathematical and statement audit of the frozen transport/comparison chain. It is not a claim that the final Taylor-section endpoint or the whole candidate’s build, axiom audit and kernel replay have already passed.

The exact source hashes are recorded in `TRANSPORT_REVIEW.json`. The reviewed modules are `KovalevZeroFreeMobius`, `KovalevZeroFreeEuler`, `KovalevZeroFreeCoupling`, `KovalevZeroFreeTransport` and `KovalevZeroFreeComparison`. Their lane and shared-root copies were reported identical by the author; this review independently hashed the lane files against the five supplied hashes. No compiler or replay process was launched, and no source was changed.

The primary statement was read directly in Leonid V. Kovalev, [*Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1](https://arxiv.org/html/2507.04544v1), Section 1, Conjecture 1.2. It concerns every Taylor section of the normalized square root of `1+z+...+z^d`, for every `d>2`, on the closed unit disk. The neighboring trigonometric Conjecture 1.3 is distinct. The argument under formalization is the existing repository `PROOF.md`, Sections 1–3, at Cinna Davis’s commit `6432592c03b24aed190ed7b3204ed942a40a8da4`; its checked SHA256 is `3deeb1ba260ce9ce18d482f8d6911a2b4beabdfc1db0b8659a9bffd4d3901924`. This audit does not make a new mathematical priority claim or extend the documented bounded priority search.

## Exact law and parameter scope

`map_oddsScale_beta` proves the following equality of actual measures for every three positive real parameters `a,b,c`:

```math
\left((v,t)\longmapsto\frac{vt}{1-t+vt}\right)_*
\bigl(\operatorname{Beta}(a,b)\otimes\operatorname{Beta}(a+b,c)\bigr)
=\operatorname{Beta}(a,c).
```

The measures are mathlib’s `ProbabilityTheory.betaMeasure`, defined by its beta probability density with respect to Lebesgue measure. The product measure supplies the independence; no independence or transport identity is postulated. The positivity hypotheses are exactly `0<a`, `0<b`, `0<c`, with no integer-shape, half-shape or bounded-parameter restriction.

For fixed `v>0`, `mobius v t = t/(v+(1-v)t)` is the inverse change of variable. The code proves that both maps preserve `(0,1)`, proves both inverse identities and injectivity, computes the derivative `v/(v+(1-v)t)^2`, and proves that this Jacobian is positive. The denominator is positive on the required interval. Thus the change of variables does not rely on a missing injectivity, image or boundary assumption. The beta densities vanish outside the open interval; endpoint atoms are not silently added.

The Euler identity is derived from this explicit substitution and the already established beta normalization. In the joint density computation the factor integrated over `v` is

```math
\frac{v^{a+c-1}(1-v)^{b-1}}
     {(t+(1-t)v)^{a+b+c}}.
```

Its integral is `B(a+c,b)/t^b`. Multiplying the remaining factor cancels `t^b` and gives the exact `Beta(a,c)` density. The gamma-product normalization is proved using positivity of the gamma factors. All powers are real powers of positive bases, so no branch or division-by-zero convention substitutes for the intended density.

The transport proof first establishes the integral identity for every measurable nonnegative test function, uses Tonelli on the measurable joint density, and then invokes measure extensionality. This establishes the pushforward law itself, rather than an identity for a selected moment. The complex expectation transport follows from that law. The later comparison separately supplies actual integrability bounds, so it does not obtain a norm estimate from the default value of an undefined Bochner integral.

## Comparison and source adaptation

The concrete remainder is

```math
R_M(z)=\int
\bigl(\sqrt{1+(1-z)t/(1-t)}\bigr)^{-1}
\,d\operatorname{Beta}(M+1,1/2)(t).
```

I checked its definition and the support, normalization, integrability and first-moment interfaces used by the five modules. `Complex.sqrt` is the actual principal square root. For `|z|≤1` and nonnegative odds, the inverse square root has norm at most one.

There is a deliberate, proved simplification relative to the recorded proof. The source uses `p(v)=2/(1+sqrt(v))`. The Lean comparison uses the larger coefficient `2-v`. The supporting `inverse_sqrt_linear_comparison` first proves `p(v)≤2-v` on `[0,1]`, then adds the nonnegative coefficient difference times an inverse square root of norm at most one. It thereby proves

```math
\left|(2-v)(1+w)^{-1/2}-(1+vw)^{-1/2}\right|\le 1-v
\qquad(0\le v\le1,\ \operatorname{Re}w\ge0).
```

This is sufficient for the recorded coefficient budget and avoids introducing the expectation of the sharper nonlinear coefficient. The code proves the exact first moment `E(2-V)=1+b/(a+b)` and `E(1-V)=b/(a+b)`. Product integration factors the first term; the proved pushforward law handles the second term. Both terms and the real majorant are integrable under the actual product probability measure.

Finally, `remainder_comparison` substitutes `a=M+1`, `b=n-M`, `c=1/2` under the sole index hypothesis `M<n`. It explicitly proves `n-M>0` and the cast identity `M+1+(n-M)=n+1`. The resulting statement is

```math
\left|\left(1+\frac{n-M}{n+1}\right)R_n(z)-R_M(z)\right|
\le\frac{n-M}{n+1}
\qquad(M<n,\ |z|\le1).
```

This includes the closed disk and `z=1`. Strictness away from one belongs to the separately proved remainder-norm lemma; this comparison does not incorrectly assert strictness at the boundary point. The statement has no abstract coupling, gamma-independence, normalization, finite-range or unexplained analytic hypothesis.

## Verdict and remaining scope

The five reviewed modules match the beta-comparison role in the documented argument, with the explicit coefficient enlargement above. I found no mathematical or statement discrepancy. The exact product law, parameter order, odds transformation, Jacobian, normalization, measurable transport, integrability and natural-index casts are all represented by proved declarations.

This review covers the transport/comparison chain only. The actual Taylor-coefficient bridge, correction identity, final nonvanishing assembly, and the complete candidate’s fresh strict build, all-owned/private axiom audit and exact stock-kernel replay remain separate acceptance obligations. The broader fractional-exponent and sharp-segment supplements are not established by these square-root modules. The absence of `sorry`, `admit` and `axiom` tokens in these five sources was checked; the final transitive axiom audit is not replaced by that lexical check.

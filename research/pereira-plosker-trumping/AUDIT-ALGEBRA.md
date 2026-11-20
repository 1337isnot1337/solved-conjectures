# Pereira–Plosker's trumping conjecture: independent audit

Date: 20 November 2026.

Reviewed draft: `CANDIDATE_PROOF.md`, commit
`f69a43204d7db4faa94f05b943748740111d3f6e`, followed by the revised
constructive Section 3 in commit `06ce248d557183606f301948f0db7b0e84618117`.

## Conclusion

The exact convolution criterion and both boundary corollaries pass this independent mathematical audit. I found no gap in the nine-section draft. This is an internal review, not an external referee report.

The source interpretation and prior-theorem audit remain separate gates. This review does not declare that the named conjecture has been resolved. In particular, a finite nonzero right derivative at the boundary does not imply the holomorphic extension used in the positive corollary.

## The power-series multiplier lemma

The semiring argument is valid even though its cone need not be closed.

The Neumann series in equation (6) proves that the unit is an interior point and that every algebra element is a difference of cone elements. If the proposed input lies outside the cone, separation from the open interior gives a nonzero continuous functional. Adding a small positive multiple of the unit approximates every cone element by interior points, so the separating functional is nonnegative on the whole cone. Normalizing at the unit is justified because the functional cannot vanish there.

The normalized state space is weak-* compact. The face minimizing the proposed input contains an extreme point. For a cone element $`s`$, the two positive functionals obtained by multiplying by $`s`$ and by $`M1-s`$ yield the claimed convex decomposition. The zero-value case is also covered: positivity of $`s(N1\pm u)`$ forces $`L(su)=0`$. Consequently an extreme state is multiplicative. Continuity and the value of the shift identify it with evaluation at a point in $`[0,1]`$. This contradicts strict positivity of the input on that closed interval.

No unjustified assertion that the cone is closed is needed. Strict positivity at both endpoints is material.

### Independent constructive route

The root agent proposed a shorter replacement, which also passes review. Define the same cone of quotients of coefficientwise nonnegative absolutely summable series, with denominator constant coefficient positive.

A real polynomial positive on $`[0,1]`$ belongs to this cone. Negative real roots give factors with positive coefficients. A positive real root $`r>1`$ gives a factor $`1-z/r`$, whose reciprocal has positive absolutely summable coefficients. For a conjugate pair, rescale the variable to write the factor as

```math
1-2\cos(\theta)u+u^2,\qquad 0<\theta<\pi.
```

Let $`N=\lceil\pi/\theta\rceil`$ and

```math
Q(u)=\sum_{j=0}^{N-2}\frac{\sin((j+1)\theta)}{\sin\theta}u^j.
```

All coefficients of $`Q`$ are positive, and direct multiplication gives

```math
(1-2\cos\theta\,u+u^2)Q(u)
=1-\frac{\sin(N\theta)}{\sin\theta}u^{N-1}
+\frac{\sin((N-1)\theta)}{\sin\theta}u^N.
```

The two displayed terminal coefficients are nonnegative. If $`\pi/\theta`$ is an integer, the first is zero, which is permitted.

Now approximate an absolutely summable series $`A>0`$ on $`[0,1]`$ by a polynomial $`P`$ with $`\|A-P\|_1<\varepsilon<\min A/3`$. Then $`P-\varepsilon`$ is a positive polynomial, while $`\varepsilon+(A-P)`$ belongs to the cone by the same Neumann construction. Addition closure gives $`A`$. This provides an independent proof of the multiplier lemma without the separation argument. It is not a claim that this general algebraic method is new.

## Rounding and the sufficient direction

The rounding direction is correct: delaying a positive atom and advancing a negative atom both decrease convolution with the increasing kernel $`k(t)=1-e^{-t}`$. Each displacement changes the integral by its magnitude times the absolute atom weight. Since every pointwise difference has the same sign, Tonelli proves the exact equality in (8), even when rounded atoms coincide.

The choice of one mesh works uniformly on the entire positive Laplace axis. On a bounded interval, the positive lower bound for $`g(z)/z`$ and the error $`\delta z\|\mu\|`$ suffice. On the remaining ray, the positive initial atom dominates all negative atoms, which stay a fixed positive distance away. Thus the argument does not choose a mesh depending on the transform variable.

The rounded cumulative coefficients are absolutely summable because they equal $`h_\delta+h_\delta'`$ on grid intervals. Their generating series is positive at zero, inside the interval, and at one. The endpoint value is $`d_\delta/\delta`$. Applying the multiplier lemma therefore uses its exact hypotheses. Multiplying by $`(1-w/2)^{-1}`$ makes every multiplier coefficient positive and preserves summability.

The factor preceding the nonnegative coefficient series in (12) is indeed the Laplace transform of $`k(t)-k(t-\delta)\geq0`$. Laplace uniqueness and continuity justify the pointwise conclusion.

## Necessity and the analytic boundary condition

The necessity proof does not assume a global inverse for a measure transform. The broad smoothing of $`\nu-m\delta_0`$ has arbitrarily small $`L^1`$ norm by translation continuity and dominated convergence. Its Neumann inverse exists in the unitized $`L^1`$ algebra. Restricting a second Fourier cutoff to the region where the smoothed transform equals the original transform gives exactly $`f*\nu=p`$. Boundedness of $`h`$ justifies the required associativity.

The complementary multiplier

```math
\frac{1-\psi(\omega)}{i\omega(1+i\omega)}
```

has an integrable inverse transform: it and its second derivative are integrable, so the inverse is bounded and has quadratic decay. Applying the distribution identity $`D(D+1)h=\mu`$ then recovers the remaining part of $`h`$ in $`L^1`$.

Under holomorphic extension, the low-frequency quotient has a removable zero-frequency singularity and becomes a smooth compactly supported transform after cutoff. The residual homogeneous distributional equation has only constant tempered solutions. The limit of $`h`$ at positive infinity and integrability of the constructed solution force that constant to vanish. This step does not infer an absolute first moment for the signed measure from analytic continuation.

## Dirichlet conversion and the weaker-boundary counterexample

The shift of the first exponent preserves the positive initial atom and converts the denominator exactly to $`z(z+1)`$. The constructed multiplier has positive coefficients, strictly increasing positive exponents, and absolute boundary convergence. The reverse implication follows from Laplace uniqueness after exponential damping if necessary; the original bounded convolution defines a signed measure whose damped total variation is finite.

For the alternating-block example, the sequence has bounded variation because only block boundaries contribute jumps of order $`k^{-2}`$. Complete-block sums are alternating harmonic sums, while an incomplete-block contribution tends to zero. All cumulative sums are at least one, which proves strict positivity of its generating series on $`[0,1)`$. Abel convergence proves the finite positive right derivative. Absolute summability fails by the harmonic series. The identity $`h+h'=a_n`$ on unit intervals, with $`h'\in L^1`$, then proves $`h\notin L^1`$. The necessity theorem rules out every finite positive multiplier, not merely grid multipliers.

## Source and independent literature check

The [primary preprint](https://arxiv.org/pdf/1405.2845), Definition 2 and Conjecture 1 on printed page 7, uses a strictly increasing positive exponent sequence and closed-half-plane absolute convergence. It states a simple zero at the boundary without defining that term there. Definition 2 first restricts its variables to real values, while the conjecture uses half-plane language. These passages do not settle the extension convention.

The authors' earlier [Dirichlet-polynomial paper](https://arxiv.org/html/1310.5088v2), Proposition 3.3 and Corollary 4.11, concerns entire finite sums. It supplies no boundary convention for the later infinite series. Its positive-polynomial multiplier method is relevant background, not a prior theorem for the exact infinite-series statement.

Independent searches through both available engines covered the exact conjecture, author names with trumping and simple-zero terms, infinite-dimensional trumping, and absolutely summable positive multipliers. No prior exact resolution appeared in those searches. The [MathDB entry](https://mathdb.com/p/327870/characterization-of-positivity-by-completely-monotone-dirich) reproduces the open statement but is not evidence of exhaustive novelty. [Plosker's research page](https://people.brandonu.ca/ploskers/research/) still links the original paper; its publication list ends in 2022 and cannot establish the absence of later work.

The same-author [2019 majorization paper](https://arxiv.org/html/1806.09062v3) concerns stochastic operators and convex-function inequalities and has no trumping occurrence. The separate 2025/2026 paper [A finite sufficient set of conditions for catalytic majorization](https://arxiv.org/html/2502.20588v1), Section II, explicitly works with finite probability vectors and their union over finite lengths. Its finite sufficient inequalities address that setting rather than the arbitrary absolutely convergent Dirichlet series here.

Diamond–Essén, [Functions with non-negative convolutions](https://doi.org/10.1016/0022-247X(78)90091-4), remains a material primary-source audit item assigned to the root agent. This review does not claim to have read that paper or cleared that priority risk.

Coordination: [issue 96](https://github.com/1337isnot1337/solved-conjectures/issues/96).

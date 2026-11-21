# Simon's stable-infimum conjecture: independent audit

Audit date: 21 November 2026. Coordination: [issue #175](https://github.com/1337isnot1337/solved-conjectures/issues/175). Manuscript reviewed: `PROOF.md`, initially committed as `f01ba454b97ea702b4eb3a764bd133ef4d2a953a`.

## Verdict and limits

The proof establishes the convex-order statement in Simon's Remark 6 for every pair $`1/2\leq\beta<\alpha<1`$. I found no mathematical gap. The boundary case $`\beta=1/2`$, the moment normalization, the construction of the independent multiplier, and the convergence requirements of the Lévy integrals all check.

This is a mathematical audit, not a certification of priority. The factorization and Mellin transforms are established results and must be credited as such. The separate source search determines whether this proof qualifies as a new resolution.

## 1. Exact statement and normalization

I checked Remark 6 on printed page 13 of the [final EJP article](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/3058/3058-16117-1-PB.pdf), Thomas Simon, *Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), no. 16, [DOI 10.1214/EJP.v19-3058](https://doi.org/10.1214/EJP.v19-3058), and the normalization preceding Theorem B. The same conjecture appears on printed pages 13–14 of [arXiv:1310.1888v2](https://arxiv.org/pdf/1310.1888).

For the spectrally negative strictly $`1/\alpha`$-stable process normalized by $`\mathbb E e^{\lambda X_t}=e^{t\lambda^{1/\alpha}}`$, put $`I_\alpha=-\inf_{0\le t\le1}X_t`$ and $`V_\alpha=\Gamma(1+\alpha)I_\alpha`$. The requested ordering is exactly

```math
V_\beta\preceq_{\mathrm{cx}}V_\alpha,
\qquad \frac12\le\beta<\alpha<1.
```

The proof covers this entire range and has the correct direction. The corresponding ordering for the suprema runs in the other direction; it is not substituted for the infimum conjecture.

## 2. Established transform and independent algebra check

The factorization $`I_\alpha\stackrel d=M_\alpha Y_\alpha`$ with independent factors is recorded in the original remark. The density of $`Y_\alpha`$ there agrees with the density used in the manuscript.

The fractional moments are also explicitly present in Pierre Patie and Thomas Simon, *Intertwining certain fractional derivatives*, [arXiv:1008.4713v1](https://arxiv.org/pdf/1008.4713): Lemma 3.3 and Proposition 3.6. Their stability parameter lies in $`(1,2)`$ and must be replaced by $`1/\alpha`$. Their reflected process at time one has the required infimum law by the identity explained in their proof. This confirms the manuscript's transform from an independent primary source.

I also checked the integral calculation directly. After $`u=t^{1/\alpha}`$, the two exponents in the elementary quadratic-denominator integral are $`1-\alpha+\alpha s`$ and $`1+\alpha s`$. Their simultaneous integrability interval is

```math
1-\frac1\alpha<\Re s<\frac1\alpha.
```

The sine addition formula gives

```math
\mathbb E Y_\alpha^s
=\frac{\alpha\sin(\pi\alpha)\sin(\pi s)}
{\sin(\pi\alpha s)\sin(\pi\alpha(1-s))}.
```

Both apparent singularities at $`s=0,1`$ are removable. Multiplying by $`\mathbb E M_\alpha^s=\Gamma(1+s)/\Gamma(1+\alpha s)`$ and applying the reflection and recurrence formulas gives

```math
\mathbb E I_\alpha^s
=\frac{\Gamma(1-\alpha s)\Gamma(1+\alpha-\alpha s)
\Gamma(1-\alpha+\alpha s)}
{\Gamma(1+\alpha)\Gamma(1-\alpha)\Gamma(2-s)}.
```

One way to check the cancellation is first to replace $`\alpha/[\Gamma(1+\alpha s)\sin(\pi\alpha s)]`$ by $`\Gamma(1-\alpha s)/(\pi s)`$, and then replace $`\Gamma(1+s)\sin(\pi s)/(\pi s)`$ by $`1/\Gamma(1-s)`$. The remaining reflection identity and one recurrence yield the displayed formula.

At $`\alpha=1/2`$, duplication reduces this expression to

```math
\frac{2^s\Gamma((1+s)/2)}{\sqrt\pi}
=\frac{\Gamma(1+s)}{\Gamma(1+s/2)},
```

which is the half-Gaussian moment formula in this normalization. Thus the proof includes the endpoint rather than obtaining it from an unproved continuity assertion. Evaluation at $`s=1`$ gives $`\mathbb E I_\alpha=1/\Gamma(1+\alpha)`$, hence $`\mathbb E V_\alpha=1`$.

## 3. Lévy representation

The logarithm of the gamma quotient is analytic on a strip containing the imaginary axis and $`[0,1]`$. Its factors have neither zeros nor poles in that strip. The logarithm with value zero at the origin is therefore well defined.

The integral identity used for each gamma term follows by differentiating twice and using the integral for the trigamma function; fixing the value and derivative at zero determines the linear term. It does not assume infinite divisibility in advance.

I checked the contributions after changing variables $`t=\alpha u`$ in the three gamma terms whose slopes have magnitude $`\alpha`$:

| Term in the cumulant | Jump side | Contribution to the kernel before division by $`t`$ |
|---|---|---|
| $`\log\Gamma(1-\alpha s)`$ | positive | $`1/(e^{t/\alpha}-1)`$ |
| $`\log\Gamma(1+\alpha-\alpha s)`$ | positive | $`e^{-t}/(e^{t/\alpha}-1)`$ |
| $`-\log\Gamma(2-s)`$ | positive | $`-e^{-2t}/(1-e^{-t})`$ |
| $`\log\Gamma(1-\alpha+\alpha s)`$ | negative | $`e^t/(e^{t/\alpha}-1)`$ |

The resulting kernels are exactly

```math
k_\alpha(t)=\frac{1+e^{-t}}{e^{t/\alpha}-1}
-\frac{e^{-2t}}{1-e^{-t}},
\qquad
h_\alpha(t)=\frac{e^t}{e^{t/\alpha}-1}.
```

For every fixed $`t>0`$, their parameter derivatives are strictly positive. Also $`k_{1/2}(t)=0`$ by direct cancellation, so neither kernel has a hidden negative part in the required parameter interval.

Near zero, the kernels satisfy $`k_\alpha(t)=(2\alpha-1)/t+O(1)`$ and $`h_\alpha(t)=\alpha/t+O(1)`$. Dividing by $`t`$ produces a measure integrable against $`t^2`$ near zero, as Lévy–Khintchine requires. The first absolute moment of the small jumps need not be finite, but the compensated integrands have second-order zeros and converge.

At infinity, the positive-jump kernel is $`O(e^{-t/\alpha})`$ and the negative-jump kernel is $`O(e^{-(1/\alpha-1)t})`$. Both large-jump first moments are finite. The compensation by the linear term over the whole half-line is therefore valid. Since $`1/\alpha>1`$, the positive jumps also have a finite exponential moment at parameter one. These bounds apply to each nonnegative difference of kernels as well.

## 4. Difference of cumulants and convex order

Let $`K_\alpha(s)=\log\mathbb E V_\alpha^s`$. For $`\beta<\alpha`$, both kernel differences are positive. Consequently $`K_\alpha-K_\beta`$ is a valid Lévy–Khintchine exponent, with the difference of the drifts in the manuscript's common compensation convention.

The resulting real random variable $`L_{\beta,\alpha}`$ has a finite exponential moment at one. The integral representation and the normalization already checked give

```math
\mathbb E e^{L_{\beta,\alpha}}
=\exp\bigl(K_\alpha(1)-K_\beta(1)\bigr)=1.
```

Take $`L_{\beta,\alpha}`$ independent of $`V_\beta`$ and set $`R_{\beta,\alpha}=e^{L_{\beta,\alpha}}`$. Comparing characteristic functions of logarithms proves

```math
V_\alpha\stackrel d=V_\beta R_{\beta,\alpha}.
```

This step uses the full transform on the imaginary axis, not an assertion that finitely many moments determine the law. The product is integrable and has conditional mean $`V_\beta`$. Conditional Jensen proves the stated convex order for every convex test function with defined expectations. Subtracting a supporting affine function gives the usual extended interpretation when the positive expectation is infinite.

## 5. Conclusion

The mathematical conclusion is valid for all parameter pairs in the source conjecture. The proof uses known distributional formulas followed by an explicit increasing-kernel argument. No numerical evidence, finite parameter reduction, or Lean verification is needed for this audit. Priority remains the responsibility of the separately documented literature search.


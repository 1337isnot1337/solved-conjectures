# Independent analytic review

Reviewed on 2026-11-20.

## Scope and verdict

I read the complete [PROOF.md at commit 9a5f90c84d13e85352b79402e4e79fc0f7819c2a](https://github.com/1337isnot1337/solved-conjectures/blob/9a5f90c84d13e85352b79402e4e79fc0f7819c2a/research/kvz-bessel-unimodality/PROOF.md). The proof establishes the full unimodality assertion for arbitrary real orders and positive scales in the stated domain. Its stronger five-case classification also follows. I found no mathematical gap.

This is an internal mathematical review. It does not establish priority or constitute external peer review. The complete prior-resolution search is a separate task.

## Primary statement

I directly inspected [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), printed pages 11–12, including Conjecture 1. The domain is

```math
\nu_1\geq\nu_2\gt-1,\qquad 0\lt a_1\leq a_2,
```

and the ratio is $I_{\nu_1}(a_1x)/I_{\nu_2}(a_2x)$ on the entire positive half-line. The additional parameter $b\geq0$ does not occur in this ratio and imposes no mathematical restriction on it. The source's definition of unimodality, printed page 4, includes monotone and constant functions.

The source has a second assertion about log-concavity for positive orders. I also read the [public log-concavity refutation record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/). Its encoded claim is expressly limited to that second assertion and excludes the unimodality question. The present proof does not repeat or claim credit for that prior refutation.

## Series and differential equation

For every order greater than minus one, all series coefficients

```math
c_k=\frac{(a/2)^{\nu+2k}}{k!\Gamma(k+\nu+1)}
```

are strictly positive. Removing $x^\nu$ leaves an entire power series in $x^2$. Termwise differentiation on compact positive intervals is therefore justified, including when the order is negative. The coefficient recurrence

```math
4k(k+\nu)c_k=a^2c_{k-1}
```

gives the scaled modified Bessel equation exactly. The local two-term expansion and its differentiated form follow from a convergent series; the proof does not differentiate an uncontrolled asymptotic remainder.

## Wronskian sign and zero endpoint

With $f=I_{\nu_1}(a_1x)$, $g=I_{\nu_2}(a_2x)$, and $H=x(f'g-fg')$, direct substitution of the two differential equations gives

```math
R'(x)=\frac{H(x)}{xg(x)^2},\qquad
H'(x)=f(x)g(x)\left(\frac{A}{x}-Bx\right),
```

where $A=(\nu_1-\nu_2)(\nu_1+\nu_2)$ and $B=a_2^2-a_1^2$. The orientation of both identities is correct. In particular, ordered real orders do not imply $A\geq0$; the manuscript retains the negative case.

If $\delta=\nu_1-\nu_2\gt0$ and $\rho=\nu_1+\nu_2$, multiplication of the two local series gives

```math
H(x)=C_1C_2x^\rho\bigl(\delta+O(x^2)\bigr).
```

Thus $H$ is positive near zero for every allowed sum of orders. For $\rho\lt0$ it tends to positive infinity; the argument never assumes a finite zero limit in that case.

When the orders are equal to $\nu$, the leading terms cancel and the next term is

```math
H(x)=C_1C_2x^{2\nu+2}
\left(\frac{a_1^2-a_2^2}{2(\nu+1)}+O(x^2)\right).
```

The exponent $2\nu+2$ is positive throughout the full source domain. Hence $H\to0$ at zero even for $-1\lt\nu\lt0$. This validates the equal-order decreasing case without an unstated nonnegative-order hypothesis.

## Infinity endpoint

The global lower bounds used in the proof are valid because they select positive terms from the two convergent series:

```math
fg\geq c_0x^\rho,\qquad fg\geq c_1x^{\rho+2},
\qquad c_0,c_1\gt0.
```

If $B\gt0$, then eventually $A/x-Bx\leq-Bx/2$. Multiplication by the positive lower bound reverses the direction in the expected way because the coefficient is negative:

```math
H'(x)\leq-\frac{Bc_0}{2}x^{\rho+1}.
```

If $B=0$ and $A\lt0$, the second series bound gives

```math
H'(x)\leq Ac_1x^{\rho+1}.
```

In both cases $\rho\gt-2$, so the integral of $x^{\rho+1}$ over an unbounded positive interval diverges. Consequently $H(x)\to-\infty$. These bounds are sufficient at all real orders in the domain; no large-argument Bessel expansion or unproved uniformity assertion is required.

## Complete classification

For equal orders, $A=0$. Equal scales give the constant ratio. Strictly unequal scales give $H'\lt0$ and $H(0+)=0$, hence strict decrease everywhere.

For distinct orders, $H$ starts positive. With equal scales and $\rho\geq0$, its derivative is nonnegative, so the ratio remains strictly increasing. At the boundary $\rho=0$, $H$ is a positive constant, which still gives strict increase. With equal scales and $\rho\lt0$, $H$ decreases strictly from positive values to negative infinity and therefore has exactly one zero.

With distinct scales, $B\gt0$. If $A\leq0$, $H$ decreases strictly and has exactly one zero. If $A\gt0$, its derivative is positive before $\sqrt{A/B}$ and negative afterwards. It is still positive at that turning point and eventually tends to negative infinity. Hence it again has exactly one zero, strictly beyond $\sqrt{A/B}$.

The positivity of $xg(x)^2$ transfers every sign conclusion to $R'$. The nonmonotone cases have strict increase followed by strict decrease and thus a unique strict global maximum. These cases exhaust the source's parameter domain, including both negative orders, mixed-sign orders, equality of orders, equality of scales, and zero sum of distinct orders.

## Source-search limit

I ran supplementary searches in both available engines for Bessel-ratio unimodality, different orders and arguments, the Wronskian method, and the exact authors and conjecture. The returned target statements and log-concavity refutations did not contain an earlier full unimodality proof. A recent Riccati-reduction paper and older Bessel-ratio literature are being screened in the separate priority audit. This review does not infer worldwide novelty from the present search results.

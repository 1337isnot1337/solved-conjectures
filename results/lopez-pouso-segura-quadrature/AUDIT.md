# Independent audit of López Pouso–Segura's quadrature conjectures

Reviewed on 21 November 2026. This audit reconstructs the calculation from the Legendre differential equation. It does not infer an infinite statement from sampled quadrature rules.

## Verdict and scope

The proposed disproof of Conjecture 3 passes. For every sufficiently large even degree, the smallest positive primary node violates the asserted upper bound. The fourth-order coefficient is strictly positive. Thus restricting the inequality to sufficiently large degrees would not repair it.

The exact two-point rule also disproves Conjecture 7 as written. The calculation below establishes eventual failure only for Conjecture 3; it makes no corresponding eventual claim for Conjecture 7.

This is a mathematical audit. Historical priority requires the separate literature audit.

## Exact source conventions

The primary source is Óscar López Pouso and Javier Segura, [*Uniform relations between the Gauss–Legendre nodes and weights*](https://link.springer.com/article/10.1186/s13660-025-03283-w), Journal of Inequalities and Applications 2025, article 40, published 20 March 2025.

Section 4, equations (13) and (14), defines the cumulative nodes and their midpoints by

```math
\bar z_i=-1+\sum_{j=1}^{i}w_j,
\qquad z_i=\frac{\bar z_{i-1}+\bar z_i}{2}.
```

Conjecture 3 asserts, at all defined ratios,

```math
0<\frac{x_i}{z_i}-1<\frac{\pi^2}{12\kappa^2},
\qquad \kappa=n+\frac12.
```

For even $`n=2m`$, symmetry gives $`\bar z_m=0`$ and $`z_{m+1}=w_{m+1}/2`$, as the source's Remark 1 states. The conjectured inequality itself has no eventual-degree restriction. Remark 2 explicitly excludes ratios of the form $`0/0`$, so such ratios are not counterexamples.

Conjecture 7 uses $`\alpha_i=-2\sum_{j=1}^i x_jw_j`$ and asserts the same upper bound for $`\alpha_i/(1-\bar z_i^2)-1`$.

## Exact low-degree obstruction

For $`n=2`$, the nodes are $`\pm1/\sqrt3`$ and both weights are $`1`$. Consequently $`z_2=1/2`$, $`\bar z_1=0`$, and $`\alpha_1=2/\sqrt3`$. Both conjectured error ratios equal

```math
\frac2{\sqrt3}-1>\frac17>\frac{\pi^2}{75}.
```

The first comparison follows from $`\sqrt3<7/4`$. For the second, $`\pi<22/7`$ gives $`\pi^2/75<484/3675<1/7`$, with the last integer comparison $`3388<3675`$. Since $`12\kappa^2=75`$, both asserted upper bounds fail exactly.

## Independent reconstruction of the central asymptotics

Put $`\epsilon=\kappa^{-2}`$ and normalize the even Legendre polynomial by

```math
f(u;\epsilon)=
\frac{\sqrt{\cos(u/\kappa)}\,P_n(\sin(u/\kappa))}{P_n(0)}.
```

Substitution into $`(1-x^2)P_n''-2xP_n'+n(n+1)P_n=0`$ gives the exact equation

```math
f''+\left(1+\frac\epsilon4\sec^2(\sqrt\epsilon\,u)\right)f=0,
\qquad f(0)=1,\quad f'(0)=0.
```

The coefficient is analytic in $`\epsilon`$ near zero on a fixed compact interval containing $`u_0=\pi/2`$. Analytic dependence of the initial-value problem, together with the simple zero of $`\cos u`$ at $`u_0`$, justifies expansion of the solution, its derivative, and its nearby zero, with uniform remainders. Uniform convergence to $`\cos u`$ on the interval before that zero ensures this is the smallest positive zero when $`\epsilon`$ is small.

Writing $`f=f_0+\epsilon f_1+\epsilon^2 f_2+O(\epsilon^3)`$, the coefficient equations and the initial conditions give

```math
\begin{aligned}
f_0(u)&=\cos u,
\\ f_1(u)&=-\frac{u\sin u}{8},
\\ f_2(u)&=\frac9{128}(u\sin u-u^2\cos u)
          -\frac{u^3\sin u}{24}.
\end{aligned}
```

In particular $`f_1''+f_1=-\cos u/4`$ and $`f_2''+f_2=u\sin u/32-u^2\cos u/4`$, which directly verifies both correction terms.

Let $`u_\epsilon`$ be the first positive zero. Expanding the equation $`f(u_\epsilon;\epsilon)=0`$ gives

```math
u_\epsilon=u_0-\frac{u_0}{8}\epsilon
 +\left(\frac{11u_0}{128}-\frac{u_0^3}{24}\right)\epsilon^2
 +O(\epsilon^3),
```

and differentiating the displayed solution gives

```math
f'(u_\epsilon;\epsilon)^2
=1+\frac\epsilon4+\frac{u_0^2-1}{8}\epsilon^2+O(\epsilon^3).
```

The exact central value $`P_{2m}(0)=(-1)^m\binom{2m}{m}/4^m`$ and Stirling's expansion, with $`\kappa=2m+1/2`$, give

```math
P_{2m}(0)^2=
\frac2{\pi\kappa}
\left(1-\frac1{8\kappa^2}
 +\frac{11}{128\kappa^4}+O(\kappa^{-6})\right).
```

These coefficients were also reconstructed by squaring the central-binomial expansion in $`m^{-1}`$ and substituting $`m=(\kappa-1/2)/2`$.

At the corresponding node $`x=\sin(u_\epsilon/\kappa)`$, the derivative transformation and the exact Gaussian weight formula yield

```math
w=\frac{2\cos(u_\epsilon/\kappa)}
        {\kappa^2P_n(0)^2 f'(u_\epsilon;\epsilon)^2},
\qquad
\frac{2x}{w}=
\kappa^2P_n(0)^2
\tan(u_\epsilon/\kappa) f'(u_\epsilon;\epsilon)^2.
```

Multiplying the expansions, all nongeometric terms cancel through order $`\epsilon^2`$:

```math
\frac{2x}{w}
=1+\frac{u_0^2}{3}\epsilon+\frac{2u_0^4}{15}\epsilon^2
 +O(\epsilon^3)
=1+\frac{\pi^2}{12\kappa^2}
 +\frac{\pi^4}{120\kappa^4}+O(\kappa^{-6}).
```

The positive coefficient $`\pi^4/120`$ therefore makes the conjectured strict upper bound fail for every sufficiently large even degree. The leading coefficient $`\pi^2/12`$ remains correct, so this disproof does not contradict the source's leading-order asymptotic relation.

## Checks and limitations

The transformation, coefficient equations, root expansion, derivative square, amplitude conversion, and final multiplication were independently derived. Local symbolic algebra checked the polynomial identities; it was not used to estimate an infinite tail. The analytic remainder follows from the differential equation and the implicit-function theorem. No Lean work was performed.

The separately proposed Bessel-sequence results and the classical interlacing assertion are outside this audit. They cannot be inferred to fail from this counterexample.

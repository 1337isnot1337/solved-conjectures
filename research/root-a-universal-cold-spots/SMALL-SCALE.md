# A uniform small-parameter interval for the type-A root lattices

Independent joint-limit proof, 27 November 2026 UTC. We use the standard Euclidean realization $`L=A_{N-1}=\mathbb Z^N\cap H`$, $`H=\mathbf1^\perp`$, and the Gaussian $`P_\alpha(x)=\sum_{k\in L}e^{-\alpha\|k-x\|^2}`$. Put $`a=\pi^2/\alpha`$ and $`q=e^{-a}`$.

**Theorem.** There exist $`a_0,N_0`$ such that for every $`a\ge a_0`$ and $`N\ge N_0`$ the global minimizers on $`H/L`$ are exactly the central classes with common coordinate phase $`e^{2\pi i k/N}`$ and $`k`$ nearest $`N/2`$. These are precisely the deep holes. Combining the claim with the fixed-rank small-parameter cases gives an absolute low-parameter interval that works simultaneously for every rank. The [positive half-line theorem](HALF-LINE.md) now gives all positive parameters in every sufficiently high rank. Choose the lower endpoint of that half-line inside the uniform small-parameter interval and take the larger of the two rank thresholds.

Write phases as $`z_i=e^{-2\pi i x_i}`$. The torus is exactly the set with $`\prod_i z_i=1`$. The central classes nearest the all-minus tuple have angular deviations $`0`$ (even $`N`$) or $`\pm\pi/N`$ (odd $`N`$). The [compact-interval proof](HIGH-RANK.md) identifies them geometrically as deep holes.

## The first reciprocal shell when the dimension is at most the eighth power of the reciprocal scale

Write $`\pi`$ for orthogonal projection onto $`H`$. Poisson summation expresses $`P_\alpha`$, up to a positive constant, as the sum of $`e^{-a\|\pi m\|^2}\prod_i z_i^{m_i}`$ over $`m\in\mathbb Z^N/\mathbb Z\mathbf1`$. Use all representatives with $`|\sum m_i|\le N/2`$, weighting both boundary representatives by $`1/2`$ when there are two. The resulting real Fourier series $`F`$ extends to independent angular variables, is invariant under permutations and conjugation, and agrees with the original sum on $`\prod z_i=1`$.

Let $`\ell=\|m\|_1`$ and $`w=e^{-a(1-1/N)}`$. The $`2N`$ representatives with $`\ell=1`$ contribute $`2w\sum_i\mathop{\mathrm{Re}}z_i`$. For $`\ell\ge3`$, $`\|\pi m\|^2=\sum m_i^2-(\sum m_i)^2/N\ge \ell/2`$, using $`|\sum m_i|\le\min(\ell,N/2)`$. Consequently $`\|\pi m\|^2-(1-1/N)\ge\ell/6`$. For $`\ell=2`$ the same inequality follows from $`1-3/N\ge1/3`$ for $`N\ge6`$. There are at most $`(2N)^\ell`$ vectors of a given length. The Hessian operator norm of the remaining Fourier series is therefore at most

```math
w\sum_{\ell\ge2}\ell^2(2Ne^{-a/6})^\ell=o(w),
```

uniformly when $`N\le a^8`$ and $`a\to\infty`$. Its gradient at the all-minus tuple vanishes, since every Fourier sine does. Write $`z_i=-e^{it_i}`$ with $`t_i\in[-\pi,\pi]`$. Integration of the Hessian remainder along $`[0,t]`$ gives $`F(t)-F(0)\asymp w\sum t_i^2`$ on the entire angular box: use $`2t_i^2/\pi^2\le1-\cos t_i\le t_i^2/2`$. A deepest competitor has $`\sum t_i^2\le\pi^2/N`$. Every constrained minimizer therefore lies in $`\sum t_i^2=O(1/N)`$. On that ball the full Hessian is positive definite for $`a,N`$ large. If two angles differ, interchanging them gives a second minimum; their connecting straight segment maintains their sum and hence the product-one constraint. Strict convexity gives a contradiction. The diagonal restriction is even and strictly convex on the remaining angular interval, so the nearest permitted diagonal levels are the only minima.

## The local Gaussian estimate in larger dimensions

Let $`\Theta(y)=\sum_k e^{-\alpha(k-y)^2}`$ and $`K_y`$ have individual probabilities proportional to the summands. Write $`m(y),v(y)`$ for its mean and variance and $`v_*=v(1/2)`$. All constants below are independent of $`a,N`$ for $`a`$ sufficiently large. Define

```math
f(t,\theta)=\sum_{r\in\mathbb Z}q^{r^2}e^{2art}e^{ir\theta}.
```

With $`\theta=-2\pi y`$, one-dimensional Poisson gives

```math
\mathbb E e^{2\pi itK_y}=e^{2\pi ity-at^2}\frac{f(t,\theta)}{f(0,\theta)}.
```

For $`|t|\le1/a`$, $`f=1+O(q)`$ and, for each fixed $`1\le r\le4`$, $`|\partial_t^r\log f|\le C_r q a^r`$. This follows by termwise differentiation since $`e^{2a|k||t|}\le e^{2|k|}`$. Symmetry in $`t`$ gives $`\partial_t\log|f|(0,\theta)=0`$. Thus the modulus of the normalized characteristic function is at most $`e^{-c a t^2}`$ on the central interval. The same bound holds for $`1/a\le|t|\le1/2`$. Indeed, for $`|t|\le1/4`$, $`|f(t,\theta)|\le1+C e^{-a/2}`$, while $`a t^2\ge1/a`$ in this exterior range. For $`1/4\le|t|\le1/2`$, $`|f(t,\theta)|\le C`$ while $`a t^2\ge a/16`$. Always $`f(0,\theta)=1+O(q)`$.

For independent site variables of arbitrary phases let $`S=\sum K_i`$, $`V=\mathop{\mathrm{Var}}S`$, and $`b=k-\mathbb ES`$ for an integer $`k`$ with $`|b|\le1`$. We claim

```math
\Pr(S=k)=\frac{e^{-b^2/(2V)}}{\sqrt{2\pi V}}\left(1+O(qa^2/N)\right).
```

In fact $`c a\le v(y)\le C a`$ by two derivatives of the preceding characteristic function. On $`|t|\le1/a`$ the centered logarithm summed over all $`N`$ sites has the form $`-2\pi^2Vt^2+i\Gamma t^3+E(t)`$ with $`|\Gamma|\le CNqa^3`$, $`|E(t)|\le CNqa^4t^4`$. The latter obeys $`|E|\le C qa\,(Na t^2)`$ and can be absorbed in a Gaussian envelope when expanding $`e^E-1`$. Integrating the real part, use $`|\cos(v+p)-\cos v|\le |p|\,|v|+p^2/2`$ with $`v=2\pi bt`$. Relative to the main Gaussian integral the errors are bounded by

```math
C\left(\frac{Nqa^4}{(Na)^2}+\frac{Nqa^3}{(Na)^2}+\frac{N^2q^2a^6}{(Na)^3}\right)=O(qa^2/N).
```

The exterior costs $`O(e^{-cN/a})`$ before dividing by the main term, negligible at this precision for $`N\ge a^8`$. The Gaussian Fourier integral itself gives the displayed exponential in $`b`$; retaining it is essential in odd dimension.

As in the compact-parameter proof, $`m'=2\alpha v`$ and $`(\log\Theta)''=4\alpha^2v-2\alpha`$. The Jacobi log Fourier series shows that $`v(y)\le v_*`$. The same series gives $`(\log\Theta)''(1/2)\asymp q`$, whence $`\alpha-1/(2v_*)\asymp q`$ as $`\alpha v_*\asymp1`$. The product formula’s first factor, with the remaining factors each minimized at the midpoint, gives $`\log\Theta(y)-\log\Theta(1/2)\ge c q\mathop{\mathrm{dist}}(y,1/2+\mathbb Z)^2`$. Indeed the ratio from the first factor alone is $`1+2q(1+\cos(2\pi y))/(1-q)^2`$.

For $`x\in H`$, choose its common tilt $`u`$ such that the sum of means at $`y_i=x_i+u`$ is zero. Then $`P_\alpha(x)=e^{\alpha Nu^2}\prod_i\Theta(y_i)\Pr(S=0)`$. At a deepest center use the exact midpoint formula with $`j_0=0,\pm1/2`$, giving $`\Theta(1/2)^Ne^{\alpha j_0^2/N}\Pr(\sum K_{1/2}=N/2+j_0)`$. The Gaussian exponential here combines with the prefactor to give $`e^{(\alpha-1/(2v_*))j_0^2/N}=1+O(q/N)`$. The local estimate at both points and $`V\le Nv_*`$ therefore bound $`\alpha Nu^2+\sum_i[\log\Theta(y_i)-\log\Theta(1/2)]`$ by $`Cqa^2/N`$ at every minimizer. In particular, writing the angular deviations from minus one as $`\delta_i`$, we have

```math
\sum_i\delta_i^2\le C a^2/N,\qquad \sum_i|\delta_i|\le Ca.
```

This follows first for $`y`$ from the midpoint gap, then for $`x`$ using $`Nu^2\le Cqa^3/N`$. An absolute angular factor $`2\pi`$ is absorbed by $`C`$.

## Convexity in the localized region

Integrating the product of the one-site Poisson formula over $`[-1/2,1/2]`$ enforces $`\sum k_i=0`$. On $`H`$, $`\sum x_i=0`$ cancels the linear phase, so the following real integral $`F`$ agrees with $`P_\alpha`$, up to a positive constant, on the product-one constraint:

```math
F(\delta)=\int_{-1/2}^{1/2}e^{-Nat^2}\prod_i f(t,\pi+\delta_i)\,dt.
```

Consider any straight coordinate-swap segment from a localized minimizer. Its sum is fixed, and it retains both displayed norm bounds. The same bounds hold for the diagonal $`\delta_i=s`$ if $`|s|\le C a/N`$. Put $`G=e^{-Nat^2}\prod f`$, $`B=\prod_i f(0,\pi+\delta_i)>0`$ and $`U=\log f`$. On $`|t|\le1/a`$ the first- and second-angular derivative estimates are

```math
|U_\theta(t,\pi+s)|\le Cq(|s|+a|t|),\qquad \mathop{\mathrm{Re}}U_{\theta\theta}(t,\pi+s)\ge c q,\qquad |U_{\theta\theta}|\le Cq
```

for $`|s|=o(1)`$ uniformly. The $`k=\pm1`$ terms of $`f_{\theta\theta}`$ give $`2q\cosh(2at)\cos s`$ for its real part, and the remaining terms plus division by $`f`$ and the square of the first logarithmic derivative give $`O(q^2)`$. For the first-derivative bound one may use $`f_\theta(0,\pi)=0`$ and uniform bounds $`O(q)`$ and $`O(aq)`$ for its derivatives in $`\theta,t`$. Moreover $`|\arg f(t,\pi+s)|\le C q a|t||s|`$ by grouping the terms with indices $`\pm k`$, since their imaginary parts contain both $`\sinh(2akt)`$ and $`\sin(ks)`$. Therefore $`|\arg G|\le Cqa=o(1)`$, and from the bounds on $`\partial_t^2\log|f|`$,

```math
B e^{-(1+Cqa)Na t^2}\le |G(t)|\le B e^{-(1-Cqa)Na t^2}.
```

On the core, $`\int |G|\asymp B/\sqrt{Na}`$ and $`\int t^2|G|\le CB/(Na)^{3/2}`$. Outside the core, all angular derivatives of $`f`$ up to order two are bounded by an absolute constant, using the defining series for $`|t|\le1/2`$. Unmodified factors satisfy the exterior envelope already established. Differentiating at most two factors therefore costs at most $`C N^2 B e^{-c(N-2)/a}`$ in the total integral for every derivative below, which is $`o(q B/\sqrt{Na})`$ for $`N\ge a^8`$.

In a pair direction $`e_i-e_j`$ the second derivative integrand on the core is

```math
G[U_{i,\theta\theta}+U_{j,\theta\theta}+(U_{i,\theta}-U_{j,\theta})^2].
```

The first two terms have weighted real part at least $`cq|G|`$ by the argument bound. The last is $`O(q^2)|G|`$. Thus the exchange segment is strictly convex. Equal minimum endpoints related by a coordinate swap must coincide, so a global minimizer is a scalar tuple with $`|s|\le Ca/N`$.

The scalar restriction $`F(s,\ldots,s)`$ is even by complex conjugation and $`t\mapsto-t`$. On the core, its second derivative divided by $`N`$ has integrand $`G(U_{\theta\theta}+NU_\theta^2)`$. The first term has real part at least $`cq|G|`$. The absolute integral of the second, relative to $`\int |G|`$, is at most

```math
C Nq^2\left(s^2+\frac{a^2}{Na}\right)\le C q^2 (a+a^2/N)=o(q).
```

The exterior derivative estimate above completes strict convexity throughout this scalar interval. Its permitted arguments nearest zero are precisely $`0`$ for even $`N`$ and $`\pm\pi/N`$ for odd $`N`$. These are therefore the only global minimizers, completing the two-regime proof.

## All ranks on a fixed low-parameter interval

For fixed $`N\ge3`$, the first-shell trace on the determinant-one torus has its minimum exactly on the nearest scalar phases. Indeed, at a trace-critical point all sines agree. A mixture of positive and negative cosines gives trace at least $`-(N-2)`$, whereas $`-N\cos(\pi/N)<-(N-2)`$ for odd $`N\ge3`$ and $`-N<-(N-2)`$ for even $`N`$. If all cosines are zero the trace is zero. At a minimum they must all be negative, which with the common sine forces identical phases. Their Hessian on $`H`$ is strictly positive. Scalar classes are exact stationary points of the full Gaussian by permutation symmetry. For each fixed $`N\ge3`$ the reciprocal first shell is exactly $`\{\pm\pi(e_i)\}`$ and the remaining shells are exponentially suppressed with two derivatives as $`a\to\infty`$, giving the full minimum by compactness and local strict convexity. In rank one the one-dimensional Jacobi product gives the midpoint at all parameters. Taking the smallest interval for the finitely many $`N\lt N_0`$ and the common interval proved above gives an absolute low-parameter interval in all ranks.

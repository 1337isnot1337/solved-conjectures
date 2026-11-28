# Fujii's conjecture: independent Mellin review

Research checkpoint: 20 November 2026. Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## Scope and conclusion

This note reviews section 6 of [the proof candidate at commit 95819aa7a270dd97301abbde2d8061d7832ccbbd](https://github.com/1337isnot1337/solved-conjectures/blob/95819aa7a270dd97301abbde2d8061d7832ccbbd/research/rh-transfer/fujii.md).

**No fatal gap was found in the passage from the zero expansion to the original prime sum.** The stated Sobolev estimate, its summability over zeros, the prime-square sign, and the size of the remainder are valid. The proof should explicitly supply a cutoff limit because an identity in distributions initially applies to compactly supported test functions. Section 2 below supplies that limit.

This is an independent analytic review of one part of a proof candidate. It does not establish priority, verify the exact historical formulation of Fujii's conjecture, or certify the other sections of the candidate. No numerical calculation or formal verification is used here.

Throughout, alpha is an arbitrary fixed positive real number. Constants may depend on alpha. Nothing below claims uniformity as alpha tends to infinity.

## 1. Inputs and normalization

Let chi be the nonprincipal real primitive character modulo 4. Write

~~~math
\theta_\chi(t)=\sum_{p\le t}\chi(p)\log p,\qquad
S_\alpha(x)=\sum_{p>2}\chi(p)e^{-(p/x)^\alpha}.
~~~

The analytic inputs are RH for zeta, GRH for the Dirichlet beta function, and its standard explicit formula as stated in the candidate. Write its nontrivial zeros, with multiplicities, as rho = 1/2 + i gamma. Their counting function satisfies

~~~math
\#\{\rho:|\gamma|\le T\}=O(T\log(T+2)).
\tag{R1}
~~~

The prime-power decomposition gives, as distributions on t greater than 2,

~~~math
\theta_\chi(t)
=-\sqrt t-\sum_\rho\frac{t^\rho}{\rho}+E(t),
\qquad
E(t)=O\!\left(t^{1/3}\log^2(t+2)\right).
\tag{R2}
~~~

For completeness, the square contribution to psi_chi is the ordinary theta function at sqrt(t), with the prime 2 omitted, since chi(p)^2 = 1 at every odd prime. RH for zeta gives its main term sqrt(t) and error O(t^(1/4) log^2(t+2)). For powers k at least 3, the elementary bounds p at most t^(1/3), k at most log(t)/log(2), and log(p) at most log(t) give an O(t^(1/3) log^2(t+2)) total. The bounded constant and trivial-zero terms of the beta explicit formula are absorbed into E. Midpoint conventions at prime powers do not affect the distribution or any Lebesgue integral involving E.

Choose a smooth function eta with 0 <= eta <= 1, eta(u) = 0 for u <= 0, and eta(u) = 1 for u >= 1. For y = log(x), with x sufficiently large, set

~~~math
f_x(t)=\eta(\log t-y/4)\frac{e^{-(t/x)^\alpha}}{\log t}.
\tag{R3}
~~~

Define it to be zero below its support; the apparent singularity at t = 1 is then absent. The difference between the prime sum and its Stieltjes integral is supported on primes at most e x^(1/4). Thus

~~~math
S_\alpha(x)=\int_0^\infty f_x(t)\,d\theta_\chi(t)
+O(x^{1/4}).
\tag{R4}
~~~

This error uses only the number of integers in that interval, not a prime-number theorem.

## 2. Extending the distribution identity to the decaying weight

Let h be a smooth function with h(u) = 1 for u <= 0 and h(u) = 0 for u >= 1. For a large real R define

~~~math
f_{x,R}(t)=f_x(t)h(\log t-R).
~~~

For fixed x, these functions are smooth and compactly supported inside t greater than 2. Differentiating (R2) and pairing with f_(x,R) gives

~~~math
\begin{aligned}
\int f_{x,R}(t)\,d\theta_\chi(t)
={}&-\frac12\int f_{x,R}(t)t^{-1/2}\,dt
\\ &-\sum_\rho\int f_{x,R}(t)t^{\rho-1}\,dt
-\int E(t)f_{x,R}'(t)\,dt.
\end{aligned}
\tag{R5}
~~~

The differentiated zero series is well-defined in distributions. More explicitly, logarithmic change of variables turns its pairing with a compact test function into the Fourier transform of a compact smooth function, evaluated at gamma. The decay of that transform and (R1) make the resulting series absolutely convergent. Differentiation is continuous on distributions, so the derivative can be taken term by term.

For the passage R to infinity, put

~~~math
g_x(u)=e^{u/2}f_x(e^u).
~~~

For each fixed x and alpha, this is a Schwartz function on the real line. It vanishes on u <= y/4. As u tends to positive infinity, it and all of its derivatives decrease faster than every exponential, because of exp(-exp(alpha(u-y))). Moreover,

~~~math
g_x(u)h(u-R)\longrightarrow g_x(u)
\quad\text{in the Schwartz topology as }R\to\infty.
\tag{R6}
~~~

The zero integrals in (R5) are exactly

~~~math
\int f_{x,R}(t)t^{\rho-1}\,dt
=\int_{\mathbb R}g_x(u)h(u-R)e^{i\gamma u}\,du.
~~~

Schwartz convergence and (R1) imply convergence of their sums. To see this without a topology shorthand, take an integer N greater than 2. Fourier integration by parts bounds the difference at gamma by

~~~math
C_N(1+|\gamma|)^{-N}
\left(
\|g_xh(\,\cdot-R)-g_x\|_{L^1}
+\|(g_xh(\,\cdot-R)-g_x)^{(N)}\|_{L^1}
\right).
~~~

The parentheses tend to zero, and the sum of (1+|gamma|)^(-N) over zeros is finite.

The Stieltjes integral also converges: its absolute value is dominated by the convergent series sum over integers n at least 2 of exp(-(n/x)^alpha). The integral involving t^(-1/2) converges by ordinary dominated convergence.

For the E term, differentiation introduces the additional tail term

~~~math
\int_{e^R}^{e^{R+1}}
 E(t) f_x(t)\frac{h'(\log t-R)}{t}\,dt.
~~~

Its absolute value is at most

~~~math
O_{\alpha,x}\!\left(
(R+1)e^{(R+1)/3}
\exp\!\left[-(e^R/x)^\alpha\right]
\right),
~~~

which tends to zero. The remaining E term converges by the integrability established in section 3. Consequently (R5) yields exactly

~~~math
\begin{aligned}
\int f_x(t)\,d\theta_\chi(t)
={}&-\frac12\int f_x(t)t^{-1/2}\,dt
\\ &-\sum_\rho\int f_x(t)t^{\rho-1}\,dt
-\int E(t)f_x'(t)\,dt.
\end{aligned}
\tag{R7}
~~~

This supplies the noncompact-test justification missing from the short version of section 6.

## 3. The error distribution contributes a smaller term

Writing L = log(t) and q = exp(-(t/x)^alpha), differentiation gives the three terms

~~~math
f_x'(t)
=\frac{\eta'(L-y/4)q}{tL}
-\frac{\eta(L-y/4)q}{tL^2}
-\frac{\alpha x^{-\alpha}\eta(L-y/4)q\,t^{\alpha-1}}{L}.
\tag{R8}
~~~

On the support, log(t+2) is bounded by a constant times L.

The cutoff derivative is supported on x^(1/4) <= t <= e x^(1/4), so its contribution to the integral of |E f'_x| is

~~~math
O\!\left(
\int_{x^{1/4}}^{e x^{1/4}}t^{-2/3}\log t\,dt
\right)
=O(x^{1/12}y).
\tag{R9}
~~~

The derivative of the reciprocal logarithm contributes at most

~~~math
C\int_{x^{1/4}}^\infty t^{-2/3}e^{-(t/x)^\alpha}\,dt
\le C_\alpha x^{1/3}.
\tag{R10}
~~~

The derivative of the exponential weight contributes at most

~~~math
C_\alpha x^{-\alpha}
\int_{x^{1/4}}^\infty
t^{\alpha-2/3}\log t\,e^{-(t/x)^\alpha}\,dt
\le C_\alpha x^{1/3}(y+1).
\tag{R11}
~~~

For the last inequality substitute t = x r and bound |y + log(r)| by y + |log(r)|. Both resulting integrals are finite. At zero the exponent alpha - 2/3 is greater than -1; at infinity the exponential weight dominates.

Therefore

~~~math
\int_0^\infty |E(t)f_x'(t)|\,dt
=O_\alpha(x^{1/3}y+x^{1/12}y)
=o\!\left(\frac{\sqrt x}{y^2}\right).
\tag{R12}
~~~

This calculation confirms both integrability for section 2 and the error size claimed in the candidate.

## 4. A detailed uniform Mellin estimate

Define

~~~math
a(v)=e^{v/2-e^{\alpha v}},\qquad
w_y(v)=\frac{\eta(v+3y/4)}{y+v},\qquad
b_y(v)=a(v)w_y(v).
~~~

Set w_y = 0 wherever the numerator vanishes. For y positive and large this defines a smooth function, since the denominator is at least y/4 on the support of the numerator.

Every derivative of a is a polynomial in exp(alpha v), with alpha-dependent coefficients, times a. In particular, every polynomially weighted derivative of a belongs to L^1(R).

Fix an integer N at least 0. Split the real line at v = -3y/4 + 1.

On the left interval all derivatives of a are bounded by C_(alpha,N) exp(v/2). Derivatives of w_y, including derivatives arising from eta, are bounded by C_N/y for y at least 1. Hence the contribution of this interval to every derivative of b_y - a/y through order N is

~~~math
O_{\alpha,N}(y^{-1}e^{-3y/8})
=O_{\alpha,N}(y^{-2}).
\tag{R13}
~~~

On the right interval eta is identically one. The zeroth derivative satisfies

~~~math
\left|\frac1{y+v}-\frac1y\right|
=\frac{|v|}{y(y+v)}
\le \frac{4|v|}{y^2}.
\tag{R14}
~~~

For every j at least 1,

~~~math
\left|
\frac{d^j}{dv^j}\left(\frac1{y+v}-\frac1y\right)
\right|
=\frac{j!}{(y+v)^{j+1}}
\le j!4^{j+1}y^{-j-1}
\le C_j y^{-2}.
\tag{R15}
~~~

Leibniz's rule and the integrability of a and its weighted derivatives give

~~~math
\|b_y-a/y\|_{W^{N,1}(\mathbb R)}
\le C_{\alpha,N}y^{-2}.
\tag{R16}
~~~

This proves the exact estimate used in the candidate. Its constant is independent of y and gamma, but it is allowed to depend on alpha and N.

Fourier integration by parts, combining the zeroth and Nth derivative bounds, now gives

~~~math
\left|
\int_{\mathbb R}(b_y(v)-a(v)/y)e^{i\gamma v}\,dv
\right|
\le C_{\alpha,N}y^{-2}(1+|\gamma|)^{-N}.
\tag{R17}
~~~

The Mellin transform of a is

~~~math
\int_{\mathbb R}a(v)e^{i\gamma v}\,dv
=\frac1\alpha\Gamma\!\left(\frac{1/2+i\gamma}{\alpha}\right).
\tag{R18}
~~~

After t = x exp(v), equations (R17) and (R18) yield

~~~math
\int_0^\infty f_x(t)t^{\rho-1}\,dt
=\frac{x^\rho}{y}\frac{\Gamma(\rho/\alpha)}{\alpha}
+O_{\alpha,N}\!\left(
\frac{\sqrt x}{y^2}(1+|\gamma|)^{-N}
\right).
\tag{R19}
~~~

Equation (R1) makes the error summable over all zeros, with multiplicities, for N greater than 2. This is an absolute error estimate; it requires no cancellation between zeros and no hypothesis about relations among their ordinates.

## 5. Sign, factor, and final error

Apply (R19) at gamma = 0 to the first integral in (R7). Its prefactor is minus one half, so the normalized prime-square contribution is

~~~math
-\frac1{2\alpha}\Gamma\!\left(\frac1{2\alpha}\right)
+O_\alpha(y^{-1}).
\tag{R20}
~~~

Thus the factor and sign in the candidate are correct. Summing (R19), using (R4), (R7), and (R12), gives

~~~math
\frac{\log x}{\sqrt x}S_\alpha(x)
=-\frac1{2\alpha}\Gamma\!\left(\frac1{2\alpha}\right)
-\sum_\rho
 \frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma\log x}
+O_\alpha\!\left(\frac1{\log x}\right).
\tag{R21}
~~~

The cutoff error normalizes to O(y x^(-1/4)). The E error normalizes to O_alpha(y^2 x^(-1/6)). Both are o(1/y). The Mellin remainder supplies the stated O_alpha(1/y) error.

The series in (R21) is also absolutely and uniformly convergent in log(x), for each fixed alpha, by the exponential decay of Gamma on vertical lines and (R1). That last fact concerns the main zero series, whereas the Sobolev estimate controls the summed error.

## 6. What this review does and does not establish

The exact bridge needed by the candidate is valid: for every fixed alpha greater than zero, the original unweighted-prime sum has the normalized asymptotic in (R21), with the stated negative square bias.

The proof makes no interchange of the limits alpha to infinity and x to infinity. It permits a separate argument to choose a fixed alpha, after which (R21) is applied as x tends to infinity. The dependence of all constants on that fixed alpha therefore creates no problem for this bridge.

The historical target statement, the Hardy-Littlewood oscillation input, the distributional limit as alpha tends to infinity, the almost-periodicity argument, and the priority search remain separate review obligations.

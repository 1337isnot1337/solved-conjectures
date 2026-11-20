# Sagan–Swanson conjecture

Status: complete unrefereed proof. Independent analytic, source/model, and root mathematical audits passed. This document concerns Conjecture 7.8, not the separate log-concavity and bottom-heaviness conjectures.

## 1. Statement and exact probability models

Sagan and Swanson, *q-Stirling numbers in type B*, European Journal of Combinatorics **118** (2024), 103899, Conjecture 7.8, ask whether the coefficient distributions of all four polynomials below are asymptotically normal whenever $`n,k\to\infty`$ and $`k/n\to\alpha\in(0,1)`$:

```math
S[n,k],\qquad c[n,k],\qquad S_B[n,k],\qquad c_B[n,k].
```

For a polynomial $`P(q)=\sum_j p_jq^j`$ with nonnegative coefficients, its coefficient distribution assigns probability $`p_j/P(1)`$ to $`j`$. Asymptotic normality means convergence to the standard normal distribution after centering by the distribution's own mean and dividing by its own standard deviation.

Primary source: [published manuscript](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf), printed pages 31–32; [arXiv record](https://arxiv.org/abs/2205.14078). The symmetric-function identities used here are the classical type-A identities and Theorem 2.1 in type B:

```math
\begin{aligned}
c[n,k]&=e_{n-k}([1]_q,[2]_q,\ldots,[n-1]_q),\\
c_B[n,k]&=e_{n-k}([1]_q,[3]_q,\ldots,[2n-1]_q),\\
S[n,k]&=h_{n-k}([1]_q,[2]_q,\ldots,[k]_q),\\
S_B[n,k]&=h_{n-k}([1]_q,[3]_q,\ldots,[2k+1]_q).
\end{aligned}
```

Here $`[a]_q=1+q+\cdots+q^{a-1}`$, and $`e_m`$ and $`h_m`$ are elementary and complete homogeneous symmetric polynomials. These identities can also be checked directly: the elementary identity follows by adding the last variable, while the complete homogeneous identity uses

```math
h_m(x_1,\ldots,x_L)=h_m(x_1,\ldots,x_{L-1})+x_Lh_{m-1}(x_1,\ldots,x_L).
```

They reproduce the four defining recurrences, with the same initial conditions.

We prove a common theorem that applies to all four expressions. Fix integers $`d\ge1`$ and $`\beta`$ with $`d+\beta\ge1`$. Let $`L_n,m_n`$ be integer sequences with $`L_n\ge1`$ and $`m_n\ge0`$, and put

```math
a_j=dj+\beta,\qquad 1\le j\le L_n,\qquad
L_n/n\longrightarrow\kappa>0,\qquad m_n/n\longrightarrow\rho>0.
```

In the elementary case assume also $`\rho\lt \kappa`$. Define

```math
Q_n(q)=e_{m_n}([a_1]_q,\ldots,[a_{L_n}]_q)
```

in the elementary case, or replace $`e_{m_n}`$ by $`h_{m_n}`$ in the complete homogeneous case.

**Theorem.** In either case, $`Q_n`$ is nonzero for all sufficiently large $`n`$. Its coefficient distribution, standardized by its actual mean and variance, converges to the standard normal distribution.

For each $`n`$, introduce an auxiliary parameter $`\lambda_n>0`$. In the elementary case let the independent occupation counts $`K_j`$ be Bernoulli, with

```math
\Pr(K_j=1)=\frac{\lambda_n a_j}{1+\lambda_n a_j}.
```

In the complete homogeneous case require $`\lambda_n a_{L_n}<1`$ and let

```math
\Pr(K_j=r)=(1-\lambda_n a_j)(\lambda_n a_j)^r,\qquad r\ge0.
```

Independently of the counts and of one another, let $`U_{j,\ell}`$ be uniform on $`\{0,\ldots,a_j-1\}`$. Set

```math
Y_j=\sum_{\ell=1}^{K_j}U_{j,\ell},\qquad
T_n=\sum_jK_j,\qquad Y_n=\sum_jY_j.
```

The bivariate probability generating factors are respectively

```math
\frac{1+\lambda_n z[a_j]_q}{1+\lambda_n a_j},
\qquad
\frac{1-\lambda_n a_j}{1-\lambda_n z[a_j]_q}.
```

Taking the coefficient of $`z^{m_n}`$ proves the exact identity

```math
\mathbb E[q^{Y_n}\mid T_n=m_n]=\frac{Q_n(q)}{Q_n(1)}.
```

Thus the auxiliary parameter can be chosen to make conditioning convenient without changing the desired distribution.

## 2. Saddle parameter and covariance limits

Choose $`\lambda_n`$ uniquely so that $`\mathbb ET_n=m_n`$. For sufficiently large $`n`$, this is possible: the Bernoulli expectation increases continuously from 0 to $`L_n`$, while the geometric expectation increases continuously from 0 to infinity as $`\lambda_n`$ approaches $`1/a_{L_n}`$.

Write $`\tau_n=n\lambda_n`$. Define

```math
\nu(w)=\begin{cases}w/(1+w)&\text{elementary},\\w/(1-w)&\text{complete},\end{cases}
\qquad
v(w)=\begin{cases}w/(1+w)^2&\text{elementary},\\w/(1-w)^2&\text{complete}.
\end{cases}
```

There is a unique $`\tau>0`$ satisfying

```math
\int_0^\kappa\nu(\tau d x)\,dx=\rho.
```

In the elementary case the integral increases from 0 to $`\kappa`$ as $`\tau`$ increases from 0 to infinity. In the complete homogeneous case it increases from 0 to infinity on $`0\lt \tau<1/(d\kappa)`$; the divergence at the upper endpoint is logarithmic.

Moreover, $`\tau_n\to\tau`$. To see this without presupposing a saddle-point approximation, choose two fixed parameters on either side of $`\tau`$, within the relevant domain. Their expectation sums, divided by $`n`$, converge by Riemann sums to integrals lying on opposite sides of $`\rho`$. Monotonicity traps $`\tau_n`$ between them for all sufficiently large $`n`$. Arbitrarily close choices give the convergence.

Consequently, in the geometric case all $`\lambda_na_j`$ are uniformly bounded above by some constant strictly below 1. On the index interval $`\kappa n/3\le j\le2\kappa n/3`$, which contains a positive multiple of $`n`$ indices, the Bernoulli probabilities or geometric ratios are bounded away from both 0 and 1. The constants may depend on $`\rho,\kappa,d,\beta`$, which are fixed.

For brevity write $`\nu_x=\nu(\tau dx)`$ and $`v_x=v(\tau dx)`$, and define

```math
A=\int_0^\kappa v_x\,dx,\qquad
B=\frac d2\int_0^\kappa x v_x\,dx,\qquad
D=d^2\int_0^\kappa x^2\left(\frac{\nu_x}{12}+\frac{v_x}{4}\right)dx.
```

Since a uniform variable on $`\{0,\ldots,a-1\}`$ has mean $`(a-1)/2`$ and variance $`(a^2-1)/12`$, conditioning on $`K_j`$ gives

```math
\begin{aligned}
\mathop{\mathrm{Cov}}(K_j,Y_j)&=\mathop{\mathrm{Var}}(K_j)\frac{a_j-1}{2},\\
\mathop{\mathrm{Var}}(Y_j)&=\mathbb EK_j\frac{a_j^2-1}{12}
 +\mathop{\mathrm{Var}}(K_j)\frac{(a_j-1)^2}{4}.
\end{aligned}
```

Riemann sums therefore imply

```math
\frac{\mathop{\mathrm{Var}}T_n}{n}\to A,\qquad
\frac{\mathop{\mathrm{Cov}}(T_n,Y_n)}{n^2}\to B,\qquad
\frac{\mathop{\mathrm{Var}}Y_n}{n^3}\to D.
```

Both $`A`$ and the conditional variance constant $`V=D-B^2/A`$ are positive. Cauchy–Schwarz gives

```math
V\ge\frac{d^2}{12}\int_0^\kappa x^2\nu_x\,dx>0.
```

## 3. Uniform joint expansion

The centered vectors

```math
\left(K_j-\mathbb EK_j,\frac{Y_j-\mathbb EY_j}{n}\right)
```

have uniformly bounded exponential moments in a fixed neighborhood of the origin. Indeed, $`a_j/n`$ is uniformly bounded, so $`0\le Y_j/n\le C K_j`$. Bernoulli counts are bounded. Geometric counts have a common positive exponential-moment radius because their ratios are uniformly bounded below 1. Their means are uniformly bounded as well.

Taylor expansion of the logarithm of each centered characteristic function is consequently uniform through order three near zero. For fixed real $`s,w`$, independence and the covariance limits give

```math
\begin{aligned}
&\mathbb E\exp\left(
 i\frac{s}{\sqrt n}(T_n-m_n)
 +i\frac{w}{n^{3/2}}(Y_n-\mathbb EY_n)\right)\\
&\hspace{20mm}\longrightarrow
\exp\left[-\tfrac12(As^2+2Bsw+Dw^2)\right].
\end{aligned}
```

For completeness, the sum of the remainders is $`O(n^{-1/2}(|s|+|w|)^3)`$: there are $`O(n)`$ summands and each third-order remainder is $`O(n^{-3/2}(|s|+|w|)^3)`$. No conditional central limit theorem is assumed in this step.

## 4. Uniform Fourier bound away from the central point

Fix real $`w`$ and put $`\eta=w/n^{3/2}`$. The characteristic function of a uniform mark has the form

```math
\mathbb Ee^{i\eta U_{j,1}}=R_j e^{i\delta_j},\qquad
\delta_j=\eta(a_j-1)/2,
```

where $`R_j`$ is real because the centered uniform distribution is symmetric. Also

```math
1-Cw^2/n\le R_j\le1,\qquad |\delta_j|\le C|w|/\sqrt n.
```

The lower bound follows from $`\cos x\ge1-x^2/2`$. In particular $`R_j\ge1/2`$ for all indices when $`n`$ is sufficiently large.

In the elementary case the uncentered joint characteristic factor is

```math
F_j(u,w)=1-p_j+p_jR_j e^{i(u+\delta_j)},
```

where $`p_j=\Pr(K_j=1)`$. On the middle index interval from Section 2,

```math
|F_j(u,w)|^2
\le1-2p_j(1-p_j)R_j(1-\cos(u+\delta_j)).
```

In the complete homogeneous case, writing $`r_j=\lambda_na_j`$, the corresponding factor is

```math
F_j(u,w)=\frac{1-r_j}{1-r_jR_j e^{i(u+\delta_j)}}.
```

Its squared denominator is at least

```math
(1-r_j)^2+2r_jR_j(1-\cos(u+\delta_j)).
```

Thus in either case, on a positive multiple of $`n`$ indices,

```math
|F_j(u,w)|\le
\exp\bigl[-c\,\mathop{\mathrm{dist}}(u+\delta_j,2\pi\mathbb Z)^2\bigr]
```

for a fixed $`c>0`$. All other factors have modulus at most 1. For $`u\in[-\pi,\pi]`$, the distance function is 1-Lipschitz and $`\mathop{\mathrm{dist}}(u,2\pi\mathbb Z)=|u|`$. Multiplying the bounds gives

```math
\prod_j|F_j(u,w)|
\le \exp\left[-c_1n\left(|u|-\frac{C_1|w|}{\sqrt n}\right)_+^2\right].
```

Centering the variables changes no moduli. After $`u=s/\sqrt n`$, this is the integrable bound

```math
\exp[-c_1(|s|-C_1|w|)_+^2]
```

on the whole integration interval, uniformly in $`n`$. This explicitly supplies the aperiodicity and tail estimate needed for the rare conditioning event. Merely applying an unconditional bivariate central limit theorem would not supply it.

## 5. Conditioning by Fourier inversion

Let $`\mu_n=\mathbb EY_n`$, and define

```math
I_n(w)=\mathbb E\left[
 e^{iw(Y_n-\mu_n)/n^{3/2}}\mathbf1_{T_n=m_n}\right].
```

Since $`T_n`$ is integer-valued and $`\mathbb ET_n=m_n`$, Fourier inversion yields

```math
I_n(w)=\frac1{2\pi}\int_{-\pi}^{\pi}
\mathbb E\exp\left[iu(T_n-m_n)+iw(Y_n-\mu_n)/n^{3/2}\right]du.
```

Substitute $`u=s/\sqrt n`$ and extend the integrand by zero outside its integration interval. Sections 3 and 4 permit dominated convergence:

```math
\begin{aligned}
\sqrt n I_n(w)
&\longrightarrow\frac1{2\pi}\int_{\mathbb R}
 e^{-(As^2+2Bsw+Dw^2)/2}\,ds\\
&=\frac1{\sqrt{2\pi A}}e^{-Vw^2/2}.
\end{aligned}
```

In particular,

```math
\Pr(T_n=m_n)\sim\frac1{\sqrt{2\pi A n}}.
```

Dividing by $`I_n(0)`$ and applying the characteristic-function continuity theorem proves

```math
\left.\frac{Y_n-\mu_n}{n^{3/2}}\,\right|\,\{T_n=m_n\}
\ \xrightarrow{d}\ \mathcal N(0,V).
```

The centering here is still unconditional. The next step justifies the centering and scaling required by the conjecture.

## 6. Actual conditional means and variances

For fixed real $`t`$, set $`h=t/n^{3/2}`$ and tilt the independent variables by $`e^{hY_n}`$. Denote the tilted probability by $`\Pr_h`$. Then

```math
\mathbb E\left[e^{h(Y_n-\mu_n)}\mid T_n=m_n\right]
=e^{-h\mu_n}\mathbb Ee^{hY_n}
 \frac{\Pr_h(T_n=m_n)}{\Pr(T_n=m_n)}.
```

The first factor is bounded by $`e^{C t^2}`$ uniformly for all sufficiently large $`n`$. This follows from the uniform exponential moments in Section 3: for every centered $`(Y_j-\mathbb EY_j)/n`$, the logarithm of its moment generating function is at most $`C u^2`$ for uniformly small real $`u`$. Take $`u=t/\sqrt n`$ and sum over $`O(n)`$ indices.

The tilted count laws remain independent. Let

```math
A_j(h)=\mathbb Ee^{hU_{j,1}}=1+O(n^{-1/2})
```

uniformly in $`j`$. Bernoulli odds become $`\lambda_na_j A_j(h)`$; geometric ratios become $`\lambda_na_j A_j(h)`$. The latter remain uniformly below 1, and on the same middle interval the tilted probabilities or ratios remain uniformly bounded away from 0 and 1. The usual one-dimensional version of the factor bound from Section 4, now with no mark phase, therefore gives

```math
\Pr_h(T_n=m_n)
\le\frac1{2\pi}\int_{-\pi}^{\pi}e^{-cnu^2}\,du
\le Cn^{-1/2}.
```

No assumption that $`m_n`$ is the tilted mean is needed for this upper bound. Section 5 gives a matching lower-order bound for the untilted denominator. Hence, for every fixed real $`t`$,

```math
\sup_{n\text{ sufficiently large}}
\mathbb E\left[e^{t(Y_n-\mu_n)/n^{3/2}}\mid T_n=m_n\right]\lt \infty.
```

Use one positive and one negative $`t`$ to obtain a uniform exponential moment for the absolute value. All fixed moments are then uniformly integrable. The distributional convergence in Section 5 implies

```math
\frac{\mathbb E[Y_n\mid T_n=m_n]-\mu_n}{n^{3/2}}\to0,
\qquad
\frac{\mathop{\mathrm{Var}}(Y_n\mid T_n=m_n)}{n^3}\to V>0.
```

Centering and rescaling by these actual conditional moments now gives the standard normal limit. This proves the common theorem.

## 7. All four families and conclusion

Apply the theorem with $`m_n=n-k`$ and the following parameters:

| Family | Symmetric function | $`L_n`$ | $`d`$ | $`\beta`$ | $`\kappa`$ | $`\rho`$ |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| $`c[n,k]`$ | elementary | $`n-1`$ | 1 | 0 | 1 | $`1-\alpha`$ |
| $`c_B[n,k]`$ | elementary | $`n`$ | 2 | −1 | 1 | $`1-\alpha`$ |
| $`S[n,k]`$ | complete homogeneous | $`k`$ | 1 | 0 | $`\alpha`$ | $`1-\alpha`$ |
| $`S_B[n,k]`$ | complete homogeneous | $`k+1`$ | 2 | −1 | $`\alpha`$ | $`1-\alpha`$ |

Every hypothesis holds for every fixed $`\alpha\in(0,1)`$, including the elementary inequality $`0\lt \rho\lt \kappa`$. No rate of convergence of $`k/n`$ is assumed. The exact probability identity in Section 1 transfers the conditional limit to the coefficient distributions. This proves all four assertions of Sagan–Swanson Conjecture 7.8.

The proof establishes the full conjectured proportional regime. It makes no claim about the boundary regimes $`k/n\to0`$ or $`1`$, or the distinct log-concavity conjectures. No numerical verification is used as a proof step.

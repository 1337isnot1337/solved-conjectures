# A weighted Gaussian noise remainder bound

Research lemma, 21 November 2026. The algebra lane independently derived the operator estimate and every constant below from the route proposed by the analysis and root lanes. This note does not assert the Standard Simplex conjecture or a new-priority claim. The bound applies to positive and negative correlations, with a constant depending on the chosen score-space dimension and not on the ambient dimension.

## Statement and conventions

Let $`\gamma_d`$ be standard Gaussian measure on $`\mathbb R^d`$, and let

```math
T_\rho f(x)=\int_{\mathbb R^d}
 f\bigl(\rho x+\sqrt{1-\rho^2}\,y\bigr)\,d\gamma_d(y),
\qquad -1<\rho<1.
```

Let $`P_j`$ be orthogonal projection onto total Hermite degree $`j`$, and define

```math
R_{\rho,d}=T_\rho-P_0-\rho P_1
 =\sum_{j\geq2}\rho^jP_j.
```

In particular, $`R_{-t,d}=T_{-t}-P_0+tP_1`$. The inner product is the real $`L^2(\gamma_d)`$ inner product.

Fix an $`r`$ dimensional subspace $`E\subseteq\mathbb R^d`$, with $`1\leq r\leq d`$, and a unit vector $`n\in E`$. Put

```math
z=P_E x,\qquad s=n\cdot x,\qquad
w_E(x)=\exp(-|z|^2/16),\qquad
c_r=(8/7)^r.
```

For every measurable real $`h`$ with $`|h|\leq1`$ and every $`0\lt t\leq1/4`$,

```math
\bigl|\langle h,R_{-t,d}h\rangle\bigr|
\leq \langle h,R_{t,d}h\rangle
\leq88c_r t^2
 \int_{\mathbb R^d}w_E(x)\min(|s|,1)|h(x)|\,d\gamma_d(x).
\tag{1}
```

There is no support, smoothness, or mean-zero assumption. The estimate does not condition the noise quadratic form onto $`E`$.

## 1. An exact Schur bound on the score space

In dimension $`r`$, let $`\alpha=1/16`$ and $`w(z)=e^{-\alpha|z|^2}`$. As quadratic forms on $`L^2(\gamma_r)`$,

```math
0\preceq T_{1/2}^{E}\preceq c_r M_w,
\qquad
c_r=(64/49)^{r/2}=(8/7)^r,
\tag{2}
```

where $`M_w`$ denotes multiplication by $`w`$. This is a quadratic-form inequality, not a pointwise comparison of outputs.

The noise kernel relative to Gaussian measure is

```math
K_\rho(z,z')=(1-\rho^2)^{-r/2}
\exp\left(
\frac{2\rho z\cdot z'-\rho^2(|z|^2+|z'|^2)}
     {2(1-\rho^2)}
\right).
```

It is real, symmetric, and positive. Conjugate $`T_{1/2}`$ by multiplication by $`e^{\alpha|z|^2/2}`$, initially on compactly supported functions. The resulting symmetric kernel is

```math
\mathcal K(z,z')
=e^{\alpha(|z|^2+|z'|^2)/2}K_{1/2}(z,z').
```

Use the positive Schur test function $`p(z)=e^{|z|^2/8}`$. Completing the square in the Gaussian integral gives, whenever $`2b(1-\rho^2)<1`$,

```math
T_\rho(e^{b|\cdot|^2})(z)
=[1-2b(1-\rho^2)]^{-r/2}
\exp\left(\frac{b\rho^2|z|^2}{1-2b(1-\rho^2)}\right).
```

Here $`b=\alpha/2+1/8=5/32`$ and $`\rho=1/2`$, so the denominator is $`49/64`$. Thus the conjugated operator $`\mathcal T`$ satisfies the exact identity

```math
\frac{\mathcal T p(z)}{p(z)}
=\left(\frac{64}{49}\right)^{r/2}
\exp\left[
\left(\frac1{32}+\frac5{98}-\frac18\right)|z|^2
\right]
=c_r\exp\left(-\frac{67|z|^2}{1568}\right)
\leq c_r.
\tag{3}
```

For completeness, symmetry of the kernel and

```math
2|g(z)g(z')|
\leq |g(z)|^2\frac{p(z')}{p(z)}
    +|g(z')|^2\frac{p(z)}{p(z')}
```

give

```math
|\langle g,\mathcal T g\rangle|
\leq\int |g(z)|^2\frac{\mathcal T p(z)}{p(z)}\,d\gamma_r(z)
\leq c_r\|g\|_2^2.
```

Apply this with $`g=e^{-\alpha|z|^2/2}f`$ for compactly supported $`f`$. It yields (2). For arbitrary $`f\in L^2(\gamma_r)`$, truncate $`f`$ on balls. The noise operator is an $`L^2`$ contraction and $`0\lt w\leq1`$, so both sides converge in the required forms. This avoids treating either unbounded multiplier as a bounded operator.

The convention $`c_0=1`$ gives the trivial zero-dimensional version. Tensoring (2) with the identity on any unused coordinates is legitimate: apply the scalar bound on each unused-coordinate fiber and integrate.

## 2. Retaining the score smoothing in the Hermite expansion

Let $`F`$ be an $`a`$ dimensional subspace of a Gaussian space, with arbitrary orthogonal complement $`Y`$. Define

```math
Q_F=T_{1/2}^{F}\otimes I_Y.
```

On Hermite degree $`m`$ in $`F`$ and degree $`k`$ in $`Y`$, this operator has eigenvalue $`2^{-m}`$. For $`0\lt t\leq1/4`$, comparison of these eigenvalues gives

```math
0\preceq R_{t,F\oplus Y}\preceq4t^2Q_F.
\tag{4}
```

Indeed, if $`m+k\geq2`$ and $`m\geq2`$, then

```math
t^{m+k}\leq t^2(1/2)^{m-2}=4t^2\,2^{-m}.
```

For $`m=0,1`$, the same bound follows from $`t^{m+k}\leq t^2`$. Degrees zero and one on the left are absent. All these operators are diagonal in one orthonormal Hermite basis, so coefficientwise comparison proves the form inequality.

Combining (4) with (2) on $`E`$ gives the useful far-region estimate

```math
\langle f,R_{t,d}f\rangle
\leq4c_r t^2\int w_E|f|^2\,d\gamma_d.
\tag{5}
```

For the near region we retain the normal coordinate separately. Write

```math
x=(s,z',y),\qquad
E=\mathbb R n\oplus E',\qquad
\dim E'=r-1,
```

where $`y`$ ranges over the unused orthogonal complement. Let $`H_\ell`$ be the orthonormal probabilists' Hermite polynomial and write

```math
h_\ell(z',y)=\int H_\ell(s)h(s,z',y)\,d\gamma_1(s).
```

On a normal degree $`\ell`$ slice, let $`m`$ and $`k`$ be the degrees in $`E'`$ and the unused space. The coefficients of $`R_{t,d}`$ admit the following bounds:

| Normal degree | Present tangent degrees | Coefficient | Upper bound |
|---|---|---|---|
| $`\ell=0`$ | $`m+k\geq2`$ | $`t^{m+k}`$ | $`4t^2\,2^{-m}`$ |
| $`\ell=1`$ | $`m+k\geq1`$ | $`t^{1+m+k}`$ | $`2t^2\,2^{-m}`$ |
| $`\ell\geq2`$ | All | $`t^{\ell+m+k}`$ | $`t^\ell\,2^{-m}`$ |

The first row is (4). For the second, if $`m\geq1`$, use $`t^{m+k-1}\leq(1/2)^{m-1}`$; if $`m=0`$, use $`k\geq1`$. The third uses $`t^m\leq2^{-m}`$ and $`t^k\leq1`$.

Apply (2) in $`E'`$, fiberwise in $`y`$, to each row. Orthogonality and Parseval then give

```math
\langle h,R_{t,d}h\rangle
\leq c_{r-1}\int e^{-|z'|^2/16}
\left(
4t^2|h_0|^2+2t^2|h_1|^2+
\sum_{\ell\geq2}t^\ell|h_\ell|^2
\right)\,d\gamma_{d-1}(z',y).
\tag{6}
```

No averaging over $`y`$ has been performed. Zero-dimensional tangent or unused spaces simply have degree zero only.

## 3. The normal mass estimate

For $`0\leq g\leq1`$ on the line, put

```math
a=\int g\,d\gamma_1,\qquad b=\int |s|g(s)\,d\gamma_1(s).
```

Writing $`\phi(s)=(2\pi)^{-1/2}e^{-s^2/2}`$, the bound
$`\int_{-u}^{u}g\,d\gamma_1\leq2\phi(0)u`$ yields

```math
b=\int_0^\infty\int_{|s|>u}g(s)\,d\gamma_1(s)\,du
\geq\int_0^{a/(2\phi(0))}(a-2\phi(0)u)\,du
=\frac{a^2}{4\phi(0)}.
```

Since $`4\phi(0)<2`$, this implies $`a^2\leq2b`$.

The normalized [Mehler formula, DLMF18.18.28](https://dlmf.nist.gov/18.18.E28), gives

```math
\sum_{\ell\geq0}v^\ell H_\ell(s)^2
=(1-v^2)^{-1/2}
\exp\left(\frac{vs^2}{1+v}\right).
```

At $`v=1/2`$ and $`|s|\leq1`$, the right side is at most $`2e^{1/3}/\sqrt3<2`$. For example, $`e^{1/3}\leq3/2<\sqrt3`$ follows by bounding the exponential series by the geometric series. Hence

```math
M_\ell^2:=\sup_{|s|\leq1}|H_\ell(s)|^2\leq2^{\ell+1}.
\tag{7}
```

## 4. The near and far regions

First suppose $`h`$ vanishes outside $`|s|\leq1`$. On each $`(z',y)`$ fiber let

```math
a(z',y)=\int|h(s,z',y)|\,d\gamma_1(s).
```

Since $`H_0=1`$ and $`H_1=s`$, one has $`|h_0|,|h_1|\leq a`$. Also $`|h_\ell|\leq M_\ell a`$. For $`t\leq1/4`$, (7) gives

```math
\sum_{\ell\geq2}t^\ell M_\ell^2
\leq\frac{8t^2}{1-2t}\leq16t^2.
```

Thus the parenthesis in (6) is at most $`22t^2a^2`$. Apply the mass estimate on every fiber and then use
$`e^{-|z'|^2/16}\leq e^{1/16}w_E(x)`$ on this support. We obtain

```math
\langle h,R_{t,d}h\rangle
\leq44e^{1/16}c_{r-1}t^2
\int w_E(x)|s||h(x)|\,d\gamma_d(x).
\tag{8}
```

For a general bounded $`h`$, split

```math
h=h_{\mathrm n}+h_{\mathrm f},\qquad
h_{\mathrm n}=h\,1_{\{|s|\leq1\}},\qquad
h_{\mathrm f}=h\,1_{\{|s|>1\}}.
```

The positive operator $`R_{t,d}`$ defines a seminorm, so

```math
\langle h,R_{t,d}h\rangle
\leq2\langle h_{\mathrm n},R_{t,d}h_{\mathrm n}\rangle
 +2\langle h_{\mathrm f},R_{t,d}h_{\mathrm f}\rangle.
```

Use (8) on the near part and (5), together with $`|h_{\mathrm f}|^2\leq|h_{\mathrm f}|`$, on the far part. The respective coefficients are

```math
88e^{1/16}c_{r-1}
\quad\text{and}\quad
8c_r.
```

Finally $`e^{1/16}\leq16/15<8/7`$ and $`c_r=(8/7)c_{r-1}`$, so both coefficients are at most $`88c_r`$. This proves the second inequality in (1).

The negative-correlation inequality follows directly from orthogonality:

```math
\bigl|\langle h,R_{-t,d}h\rangle\bigr|
=\left|\sum_{j\geq2}(-t)^j\|P_jh\|_2^2\right|
\leq\sum_{j\geq2}t^j\|P_jh\|_2^2
=\langle h,R_{t,d}h\rangle.
```

The series are absolutely convergent for every $`L^2`$ function. In particular, the indefinite operator $`R_{-t,d}`$ is never used as if it defined a positive seminorm.

## 5. Partition-transfer corollary

Let $`\mathcal A,\mathcal C`$ be measurable partitions into $`q`$ cells. Put

```math
h_i=1_{A_i}-1_{C_i},\qquad
g_{ij}=1_{A_i\cap C_j}-1_{A_j\cap C_i}.
```

Then $`h_i=\sum_{j\ne i}g_{ij}`$, $`g_{ji}=-g_{ij}`$, and $`|g_{ij}|\leq1`$. Suppose a unit normal $`n_{ij}\in E`$ is specified for each unordered pair, and define

```math
W_E(\mathcal A,\mathcal C)
=\sum_{i\lt j}\int
e^{-|P_E x|^2/16}\min(|n_{ij}\cdot x|,1)
|g_{ij}(x)|\,d\gamma_d(x).
```

Cauchy–Schwarz in the positive $`R_t`$ seminorm and (1) give

```math
\begin{aligned}
\sum_i\bigl|\langle h_i,R_{-t,d}h_i\rangle\bigr|
&\leq\sum_i\langle h_i,R_{t,d}h_i\rangle
\\ &\leq2(q-1)\sum_{i\lt j}\langle g_{ij},R_{t,d}g_{ij}\rangle
\\ &\leq176(q-1)(8/7)^r t^2 W_E(\mathcal A,\mathcal C).
\end{aligned}
\tag{9}
```

No equal-mass hypothesis is needed for this estimate. In a simplex application the normals lie in the common score space, so $`r`$ is fixed by the number of cells while arbitrary unused coordinates retain the identity operator throughout the proof.

## Scope

All integrals and expansions above are in the original ambient Gaussian space. The lemma does not assert that conditioning on the score space preserves noise stability. The positivity used for the near/far split and transfer sum belongs to $`R_t`$; the negative remainder is controlled by its spectral absolute-value bound first. The Schur constant depends only on the score dimension. Any application to a negative-correlation simplex comparison must still establish the matching potential lower bound, coercivity, tail estimates, and absorption of the displayed remainder. Those further steps are not conclusions of this lemma.

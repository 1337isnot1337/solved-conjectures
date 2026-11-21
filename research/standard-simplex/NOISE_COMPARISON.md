# Standard Simplex conjecture: weighted noise comparison

Research note, 21 November 2026. This note proves three estimates that enter a comparison with a regular-simplex partition: a weighted higher-Hermite bound, a uniform one-sided noise-potential bound, and a moment-coercivity estimate after orthogonal alignment. The estimates do not yet imply the Standard Simplex conjecture. Section 5 records the remaining absorption problem explicitly. No first-discovery claim is made for these auxiliary estimates.

We use the normalization and the credited balanced first-moment extremum in [FIRST_MOMENT_STABILITY.md](FIRST_MOMENT_STABILITY.md). In particular, $`r=q-1`$, $`F_q=c_q^2`$, and $`\beta_q>0`$ is the covariance-deficit constant in that note. The weighted Hermite estimate in Section 1 does not depend on that prior extremum.

## 1. A dimension-free weighted Hermite bound

Let $`\gamma_d`$ be standard Gaussian measure, let $`T_\rho`$ be its noise operator, and let $`P_j`$ be orthogonal projection onto total Hermite degree $`j`$. For $`0<\rho\le1/4`$, set

```math
R_{\rho,d}=T_\rho-P_0-\rho P_1
=\sum_{j\ge2}\rho^jP_j.
```

Thus $`0\preceq R_{\rho,d}\preceq\rho^2 I`$. Write $`x=(s,y)`$ in any orthogonal normal/tangent decomposition. For every measurable real function $`h`$ with $`|h|\le1`$,

```math
\langle h,R_{\rho,d}h\rangle
\le72\rho^2\int\min(|s|,1)|h(s,y)|\,d\gamma_d. \tag{1}
```

There is no support, smoothness, or mean-zero hypothesis in (1), and its constant is independent of dimension.

### 1.1. A one-dimensional mass estimate

Write $`\phi(s)=(2\pi)^{-1/2}e^{-s^2/2}`$. If $`0\le g\le1`$ and

```math
a=\int g\,d\gamma_1,\qquad b=\int|s|g(s)\,d\gamma_1(s),
```

then

```math
b=\int_0^\infty\int_{|s|>t}g(s)\,d\gamma_1(s)\,dt
\ge\int_0^{a/(2\phi(0))}(a-2\phi(0)t)\,dt
=\frac{a^2}{4\phi(0)}.
```

Consequently $`a^2\le4\phi(0)b<2b`$. The bound on the omitted mass uses only $`\int_{-t}^t g\phi\le2\phi(0)t`$.

### 1.2. The normal Hermite expansion

Let $`H_\ell`$ denote the orthonormal probabilists' Hermite polynomial. The classical [Mehler identity, DLMF 18.18.28](https://dlmf.nist.gov/18.18.E28), after the change from physicists' to normalized probabilists' Hermites, gives

```math
\sum_{\ell\ge0}t^\ell H_\ell(s)^2
=\frac{1}{\sqrt{1-t^2}}
\exp\left(\frac{t s^2}{1+t}\right),\qquad 0<t<1. \tag{2}
```

For $`|s|\le1`$ and $`t=1/2`$, the right side is at most $`2e^{1/3}/\sqrt3<2`$. For example, $`e^{1/3}<1/(1-1/3)=3/2`$ suffices for the last strict inequality. Therefore

```math
M_\ell^2:=\sup_{|s|\le1}|H_\ell(s)|^2\le2^{\ell+1}. \tag{3}
```

First suppose $`h`$ vanishes for $`|s|>1`$. Define

```math
h_\ell(y)=\int H_\ell(s)h(s,y)\,d\gamma_1(s),
\qquad a(y)=\int|h(s,y)|\,d\gamma_1(s).
```

Normal degree zero contributes at most $`\rho^2\|h_0\|_2^2`$ to $`\langle h,Rh\rangle`$, since only tangent degrees at least two remain. Normal degree one contributes at most $`\rho^2\|h_1\|_2^2`$, since only tangent degrees at least one remain. Normal degree $`\ell\ge2`$ contributes at most $`\rho^\ell\|h_\ell\|_2^2`$. Orthogonality and Parseval justify this decomposition directly in $`L^2`$; in tangent dimension zero the absent degrees contribute zero.

Since $`H_0=1`$, $`H_1=s`$, and $`|s|\le1`$ on the support, the first two terms are each at most $`\rho^2\|a\|_2^2`$. By (3), the remaining terms are at most

```math
\left(\sum_{\ell\ge2}\rho^\ell M_\ell^2\right)\|a\|_2^2
\le\frac{8\rho^2}{1-2\rho}\|a\|_2^2
\le16\rho^2\|a\|_2^2.
```

Applying the one-dimensional mass estimate on every fiber gives

```math
\langle h,Rh\rangle
\le18\rho^2\|a\|_2^2
\le36\rho^2\int |s||h|\,d\gamma_d. \tag{4}
```

### 1.3. The far part

For general $`h`$, split $`h=h_{\mathrm n}+h_{\mathrm f}`$ at $`|s|\le1`$. Positivity of $`R`$ gives

```math
\langle h,Rh\rangle
\le2\langle h_{\mathrm n},Rh_{\mathrm n}\rangle
 +2\langle h_{\mathrm f},Rh_{\mathrm f}\rangle.
```

The first term is controlled by (4). For the second,

```math
\langle h_{\mathrm f},Rh_{\mathrm f}\rangle
\le\rho^2\|h_{\mathrm f}\|_2^2
\le\rho^2\int_{|s|>1}|h|\,d\gamma_d.
```

Combining these estimates proves (1). The weight in the far region is one, which is why the truncated weight in (1) is valid.

## 2. Transfer functions for a partition

Let $`\mathcal C=(C_1,\ldots,C_q)`$ be a central regular-simplex partition, and let $`\mathcal A=(A_1,\ldots,A_q)`$ be another measurable partition. Put

```math
h_i=1_{A_i}-1_{C_i},\qquad
g_{ij}=1_{A_i\cap C_j}-1_{A_j\cap C_i}\quad(i\ne j).
```

Then $`g_{ji}=-g_{ij}`$, $`h_i=\sum_{j\ne i}g_{ij}`$, and $`|g_{ij}|\le1`$. Write $`n_{ij}`$ for the unit normal to the $`i,j`$ score-tie hyperplane pointing toward $`C_i`$. Define

```math
W(\mathcal A\mid\mathcal C)
=\sum_{i<j}\int\min(|n_{ij}\cdot x|,1)|g_{ij}(x)|\,d\gamma_d(x).
```

The common moment-edge length is

```math
\ell_q=|m_i^{\mathcal C}-m_j^{\mathcal C}|
=c_q\sqrt{2/r}.
```

The regular assignment cost is

```math
D(\mathcal A\mid\mathcal C)
=\sum_{i\ne j}\int_{C_i\cap A_j}
 (m_i^{\mathcal C}-m_j^{\mathcal C})\cdot x\,d\gamma_d
=\ell_q\sum_{i<j}\int|n_{ij}\cdot x||g_{ij}|\,d\gamma_d. \tag{5}
```

In particular, $`\ell_qW\le D`$. The seminorm associated with the positive operator $`R`$ obeys Cauchy--Schwarz, so (1) implies

```math
\sum_i\langle h_i,R_{\rho,d}h_i\rangle
\le2(q-1)\sum_{i<j}\langle g_{ij},R_{\rho,d}g_{ij}\rangle
\le144(q-1)\rho^2 W. \tag{6}
```

This estimate holds without equal cell masses. When the masses are equal, the zero-degree terms in the later noise comparison vanish as well.

## 3. A uniform simplex-potential lower bound

Let $`\Phi`$ be the standard normal distribution function, and set

```math
b_q=2^{2-q}\phi(1)\phi(2)>0.
```

For every $`0<\rho<1`$, every $`x\in C_i`$, and every $`j\ne i`$,

```math
T_\rho(1_{C_i}-1_{C_j})(x)
\ge b_q\rho\min(n_{ij}\cdot x,1). \tag{7}
```

The estimate is uniform in all tangent coordinates. To prove it, realize the regular labels as the maximum of independent standard normal scores with deterministic means. Projecting those scores to $`\mathbf1^\perp`$ does not change their ordering. After subtracting the mean of score $`i`$, write

```math
\mu_i=0,\qquad \mu_j=-\theta,\qquad \mu_k\le0\ (k\ne i,j),
\qquad \theta=\frac{\rho\sqrt2}{\sqrt{1-\rho^2}}\,n_{ij}\cdot x\ge0.
```

Conditioning on the value of the winning score gives the exact probability difference

```math
\int_{\mathbb R}
 [\phi(z)\Phi(z+\theta)-\phi(z+\theta)\Phi(z)]
 \prod_{k\ne i,j}\Phi(z-\mu_k)\,dz. \tag{8}
```

The bracket is nonnegative. Indeed, $`\phi(z)/\Phi(z)`$ decreases strictly: its derivative is $`-u(z)(z+u(z))`$, where $`u=\phi/\Phi`$, and $`z+u(z)>0`$. For negative $`z`$, the latter follows from
$`\phi(z)=\int_{-\infty}^z(-t)\phi(t)\,dt>(-z)\Phi(z)`$; for nonnegative $`z`$ it is immediate.

Since $`\mu_k\le0`$, the product in (8) is at least $`\Phi(z)^{q-2}`$. If $`0\le\theta\le1`$ and $`0\le z\le1`$, the derivative of the bracket with respect to $`\theta`$, at $`t\in[0,\theta]`$, is

```math
\phi(z+t)[\phi(z)+(z+t)\Phi(z)]\ge\phi(2)\phi(1).
```

Integrating over $`t`$ and then over $`z\in[0,1]`$, where $`\Phi(z)\ge1/2`$, bounds (8) below by $`b_q\theta`$. For $`\theta\ge1`$, lowering the mean of score $`j`$ can only increase the probability that $`i`$ wins and decrease the probability that $`j`$ wins. Thus (8) is at least $`b_q\min(\theta,1)`$ for all $`\theta\ge0`$. Finally,

```math
\min(\theta,1)\ge\rho\min(n_{ij}\cdot x,1),
```

which proves (7).

Define the linear potential loss

```math
L_\rho(\mathcal A\mid\mathcal C)
=\sum_{i\ne j}\int_{C_i\cap A_j}
 [T_\rho1_{C_i}-T_\rho1_{C_j}]\,d\gamma_d.
```

Summing (7) over the transfers gives

```math
L_\rho(\mathcal A\mid\mathcal C)\ge b_q\rho W. \tag{9}
```

## 4. Moment coercivity after polar alignment

Now assume $`\mathcal A`$ is balanced, with $`d\ge r`$. Its moment matrix $`M`$ has rows $`m_i`$, and $`F=\|M\|_F^2`$. If $`F>0`$, put $`V=M/\sqrt F`$ and $`Q=VV^T`$. Extend the partial polar isometry of $`V`$ to a $`q\times d`$ matrix $`U`$ satisfying

```math
UU^T=P,\qquad V=\sqrt Q\,U.
```

This is possible even when $`Q`$ is singular because $`d\ge r`$. Choose the regular partition whose score matrix is $`Q_*^{1/2}U`$. Its moment matrix is

```math
M_{\mathcal C}=c_qQ_*^{1/2}U=\frac{c_q}{\sqrt r}U.
```

This choice maximizes the inner product with $`M`$ among regular moment matrices. Both $`M`$ and $`M_{\mathcal C}`$ lie in the $`r`$ dimensional row space of $`U`$.

Let

```math
u=\frac{\mathop{\mathrm{tr}}\sqrt Q}{\sqrt r}\le1,
\qquad \varepsilon=c_q^2-F.
```

The assignment cost in (5) is

```math
D=c_q^2-\langle M_{\mathcal C},M\rangle_F
=c_q^2-c_q\sqrt F\,u. \tag{10}
```

Since $`Q_*`$ is scalar on $`\mathbf1^\perp`$ and $`\mathop{\mathrm{tr}}Q=1`$,

```math
1-u=\frac12\|\sqrt Q-\sqrt {Q_*}\|_F^2
\le\frac r2\|Q-Q_*\|_F^2. \tag{11}
```

The inequality follows eigenvalue by eigenvalue from
$`(\sqrt\lambda-1/\sqrt r)^2\le r(\lambda-1/r)^2`$, including $`\lambda=0`$.
The earlier covariance-deficit bound gives $`\varepsilon\ge\beta_q\|Q-Q_*\|_F^2`$. Therefore

```math
D\le\varepsilon+c_q^2(1-u)
\le\left(1+\frac{c_q^2r}{2\beta_q}\right)\varepsilon. \tag{12}
```

Set

```math
\kappa_q=\left(1+\frac{c_q^2r}{2\beta_q}\right)^{-1}>0.
```

The exact moment identity and (12) imply

```math
\|M-M_{\mathcal C}\|_F^2=2D-\varepsilon
\le(2-\kappa_q)D. \tag{13}
```

When $`F=0`$, choose any regular partition. Then $`D=\varepsilon=c_q^2`$, so (12) and (13) still hold. This argument does not require the positive-correlation noise conjecture.

## 5. Exact noise identity and the remaining obstruction

For balanced $`\mathcal A`$ and $`\mathcal C`$, define

```math
S_\rho(\mathcal A)=\sum_i\langle1_{A_i},T_\rho1_{A_i}\rangle.
```

Expanding $`1_{A_i}=1_{C_i}+h_i`$ and using $`\int h_i\,d\gamma_d=0`$ gives exactly

```math
S_\rho(\mathcal A)-S_\rho(\mathcal C)
=-2L_\rho(\mathcal A\mid\mathcal C)
 +\rho\|M-M_{\mathcal C}\|_F^2
 +\sum_i\langle h_i,R_{\rho,d}h_i\rangle. \tag{14}
```

The first term has the uniform lower bound (9), and the last term has the uniform upper bound (6). However, the middle term is controlled in (13) by the untruncated cost $`D`$, while (9) uses $`W`$. The ratio $`D/W`$ need not be bounded for transfers far from a score-tie hyperplane. Moreover, the constant in (9) is not the sharp first-order slope $`\ell_q`$. Equations (6), (9), and (13) therefore do not establish a sign for (14).

For every fixed partition, $`L_\rho/\rho\to D`$ as $`\rho\downarrow0`$, but an unjustified uniform version of this limit would lose the Gaussian tails. A further argument must connect the tail contribution to the degree-one term, while retaining the strict moment deficit in (13). This is the next research step, not an assumption of this note.

## Sources and status

- The Gaussian spectral normalization and Mehler formula are classical; the exact scalar formula was checked against [DLMF 18.18.28](https://dlmf.nist.gov/18.18.E28), including the Hermite normalization change.
- The balanced all-cell first-moment extremum and covariance identities are credited in [FIRST_MOMENT_STABILITY.md](FIRST_MOMENT_STABILITY.md), with a pinned public source. Section 4 imports their proved quantitative consequence explicitly.
- The original conjecture, recent partial results, and the limits of the current priority search are in [PRIOR_AUDIT.md](PRIOR_AUDIT.md) and [STABILITY_PRIOR_AUDIT.md](STABILITY_PRIOR_AUDIT.md).
- This note is a research checkpoint. It contains no claimed resolution of the Standard Simplex conjecture and no change to the collection's result count.

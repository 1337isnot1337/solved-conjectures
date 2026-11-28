# Standard Simplex conjecture: negative potential and weighted tail control

Research note, 21 November 2026. This note proves a global negative-correlation potential estimate and a matching Gaussian tail estimate. Both constants depend only on the number of cells through the fixed score-space dimension. The potential estimate includes comparisons with a cell that is not the most likely winner. No noise-optimality theorem or full-conjecture conclusion is asserted here.

## 1. Coordinates and the weighted cost

Let $`q\ge2`$, $`r=q-1`$, and $`d\ge r`$. Let $`E`$ be the $`r`$-dimensional score subspace of a central regular-simplex partition $`\mathcal C=(C_1,\ldots,C_q)`$. Write $`z=P_E x`$. Choose an isometry $`U:\mathbb R^r\to\mathbf1^\perp\subset\mathbb R^q`$, with rows $`u_i`$, so

```math
C_i=\{x:u_i\cdot z\ge u_k\cdot z\text{ for every }k\},\qquad
n_{ij}=\frac{u_i-u_j}{\sqrt2},\qquad |n_{ij}|=1.
```

Gaussian score ties have measure zero. Put $`\alpha=1/16`$ and $`w(s)=\min(|s|,1)`$. For transfers $`g_{ij}`$ between $`\mathcal C`$ and another partition, define

```math
W_\alpha
=\sum_{i\lt j}\int e^{-\alpha|z|^2}
 w(n_{ij}\cdot z)|g_{ij}(x)|\,d\gamma_d(x).
```

This is a weighted comparison cost. It is not the Gaussian symmetric-difference distance.

## 2. A global negative-correlation winner gap

Let $`\phi`$ and $`\Phi`$ be the standard normal density and distribution function, and set

```math
b_q^-=\frac{2^{2-q}e^{-8}}{2\pi}.
```

For $`0\lt t\le1/16`$, $`x\in C_i`$, and $`j\ne i`$,

```math
T_{-t}(1_{C_j}-1_{C_i})(x)
\ge b_q^-\,t\,e^{-\alpha|z|^2}(n_{ij}\cdot z)
\ge b_q^-\,t\,e^{-\alpha|z|^2}\min(n_{ij}\cdot z,1).
\tag{1}
```

### Proof

The ordering of a projected vector of independent standard normal scores is unchanged by subtracting its coordinate mean. Consequently the cell probabilities at $`x`$ can be calculated by asking which independent normal score has the largest value when its deterministic mean is

```math
\mu_k=-a\,u_k\cdot z,\qquad
a=\frac{t}{\sqrt{1-t^2}}.
```

Since $`x\in C_i`$, the mean $`\mu_i`$ is smallest. Subtract it from all means. In the resulting coordinates,

```math
\mu_i=0,\qquad \mu_j=\theta=a\sqrt2\,s,\qquad
s=n_{ij}\cdot z\ge0,\qquad
0\le\mu_k\le M,\qquad M\le a\sqrt2\,|z|.
\tag{2}
```

There is no assumption that $`\mu_j=M`$. Conditioning on the winning score gives the exact probability difference

```math
P_j-P_i
=\int_{\mathbb R}
 \bigl[\phi(v-\theta)\Phi(v)-\phi(v)\Phi(v-\theta)\bigr]
 \prod_{k\ne i,j}\Phi(v-\mu_k)\,dv.
\tag{3}
```

The bracket is nonnegative on the whole real line. Indeed, $`\phi(v)/\Phi(v)`$ decreases strictly. Its derivative equals $`-h(v)(v+h(v))`$, where $`h=\phi/\Phi`$; for $`v\lt0`$, the identity
$`\phi(v)=\int_{-\infty}^v(-y)\phi(y)\,dy>(-v)\Phi(v)`$ proves $`v+h(v)>0`$, and the claim is immediate for $`v\ge0`$.

Restrict (3) to $`v\in[M+1,M+2]`$. Every remaining distribution-function factor is at least $`1/2`$. For $`0\le u\le\theta\le M`$,

```math
\frac{\partial}{\partial u}
 \bigl[\phi(v-u)\Phi(v)-\phi(v)\Phi(v-u)\bigr]
=\phi(v-u)\bigl[\phi(v)+(v-u)\Phi(v)\bigr]
\ge\phi(M+2)^2.
```

Here $`1\le v-u\le M+2`$ and $`1\le v\le M+2`$, so both density factors are at least $`\phi(M+2)`$; the additional summand is nonnegative. Integrating first over $`u\in[0,\theta]`$, then over the unit-length interval for $`v`$, proves

```math
P_j-P_i\ge 2^{2-q}\theta\,\phi(M+2)^2
=\frac{2^{2-q}}{2\pi}\theta e^{-(M+2)^2}.
\tag{4}
```

The elementary inequality $`(M+2)^2\le2M^2+8`$ and (2) give

```math
(M+2)^2
\le \frac{4t^2}{1-t^2}|z|^2+8
\le \frac4{255}|z|^2+8
\le \alpha|z|^2+8.
\tag{5}
```

The last inequality uses $`64\le255`$. Also $`\theta\ge ts`$. Equations (4) and (5) prove the first inequality in (1); $`s\ge\min(s,1)`$ proves the second. Zero normal distance causes no exception.

All score probabilities use only the projection onto $`E`$. Thus the estimate is independent of the ambient dimension, including along tangential directions in which both $`i`$ and $`j`$ have small winning probabilities.

## 3. Compact-core first-order comparison

Let $`\ell_q=|m_i^{\mathcal C}-m_j^{\mathcal C}|`$. For every fixed $`R<\infty`$ and $`\delta>0`$, there exists $`t_{q,R,\delta}>0`$ such that

```math
T_{-t}(1_{C_j}-1_{C_i})(z)
\ge(1-\delta)t\ell_q(n_{ij}\cdot z)
\quad
(z\in C_i,\ |z|\le R,\ 0\lt t\le t_{q,R,\delta}).
\tag{6}
```

This follows from the same Gaussian-convolution argument as [TAIL_CONTROL.md, Section 4](TAIL_CONTROL.md#4-sharp-first-order-potential-on-a-fixed-compact-core), with both signs reversed. Explicitly, for $`F_{ij}=1_{C_j}-1_{C_i}`$,

```math
t^{-1}\nabla T_{-t}F_{ij}(z)
=-\frac1{\sqrt{1-t^2}}\,
 \mathbb E\!\left[G_rF_{ij}
       (-tz+\sqrt{1-t^2}G_r)\right]
\longrightarrow
-\int zF_{ij}(z)\,d\gamma_r(z)
=\ell_q n_{ij}
```

uniformly on the fixed ball. Changing variables transfers differentiation and the limit to the smooth Gaussian density, with a common integrable Gaussian majorant for $`t\le1/2`$ and bounded $`z`$. Reflection across the score-tie hyperplane exchanges $`C_i`$ and $`C_j`$, so the potential is zero on that hyperplane. Integrating its normal derivative along a segment in the ball yields (6), including at the hyperplane.

For a transfer from $`C_i`$ into label $`j`$, the linear increase in the negative-correlation comparison uses the potential $`T_{-t}(1_{C_j}-1_{C_i})`$. Consequently (1) gives the global lower bound $`b_q^-tW_\alpha`$, and (6) retains the sharp first-order coefficient on a fixed compact core.

## 4. Weighted Gaussian tail lemma

For $`r\ge1`$ and $`R>1`$, define

```math
A_r(R)=\int_{|z|>R}(1+|z|^2)e^{\alpha|z|^2}\,d\gamma_r(z),
```

```math
B_r(R)=
\int_{|y|>\sqrt{R^2-1}}(2+|y|^2)e^{\alpha|y|^2}\,
 d\gamma_{r-1}(y)
\quad(r\ge2),
\qquad B_1(R)=0,
```

```math
\eta_r^\alpha(R)
=2\bigl[A_r(R)+4\phi(0)e^\alpha B_r(R)\bigr].
\tag{7}
```

Since $`\alpha<1/2`$, the integrands are integrable and $`\eta_r^\alpha(R)\to0`$ as $`R\to\infty`$.

**Tail lemma.** If $`|g|\le1`$, $`g(z)=0`$ for $`|z|\le R`$, and $`n`$ is any unit vector in $`\mathbb R^r`$, then

```math
\left|\int g\,d\gamma_r\right|^2
+\left|\int z g(z)\,d\gamma_r(z)\right|^2
\le \eta_r^\alpha(R)
 \int e^{-\alpha|z|^2}w(n\cdot z)|g(z)|\,d\gamma_r(z).
\tag{8}
```

### Proof

Rotate so $`z=(s,y)`$ and $`n\cdot z=s`$. Split $`g=g_{\mathrm f}+g_{\mathrm n}`$ at $`|s|>1`$ and $`|s|\le1`$. Let $`W_{\mathrm f},W_{\mathrm n}`$ be their respective weighted costs on the right of (8). These costs add exactly because the supports are disjoint.

For the far part, $`w(s)=1`$. Vector Cauchy--Schwarz, followed by $`|g_{\mathrm f}|\le1`$, yields

```math
\left|\int(1,z)g_{\mathrm f}\,d\gamma_r\right|^2
\le W_{\mathrm f}
 \int_{|z|>R}(1+|z|^2)e^{\alpha|z|^2}
                |g_{\mathrm f}|\,d\gamma_r
\le A_r(R)W_{\mathrm f}.
\tag{9}
```

For the near part, define on each normal fiber

```math
v(y)=\int|g_{\mathrm n}(s,y)|\,d\gamma_1(s),\qquad
b(y)=\int e^{-\alpha s^2}|s|\,|g_{\mathrm n}(s,y)|\,d\gamma_1(s),
```

```math
M(y)=\int g_{\mathrm n}(s,y)\,d\gamma_1(s),\qquad
N(y)=\int s g_{\mathrm n}(s,y)\,d\gamma_1(s).
```

The one-dimensional mass inequality from [NOISE_COMPARISON.md, Section 1.1](NOISE_COMPARISON.md#11-a-one-dimensional-mass-estimate) gives

```math
v(y)^2
\le4\phi(0)\int |s||g_{\mathrm n}(s,y)|\,d\gamma_1(s)
\le4\phi(0)e^\alpha b(y).
\tag{10}
```

For completeness, the first inequality follows by integrating the lower bound
$`\int_{|s|>a}|g_{\mathrm n}|\phi(s)\,ds\ge(v-2\phi(0)a)_+`$
over $`a\ge0`$.

Both $`|M(y)|`$ and $`|N(y)|`$ are at most $`v(y)`$, the latter because $`|s|\le1`$. The near part vanishes unless $`|y|>\sqrt{R^2-1}`$. Define the augmented vector $`V(y)=(M(y),yM(y),N(y))`$. Then

```math
|V(y)|^2\le(2+|y|^2)v(y)^2.
```

Weighted vector Cauchy--Schwarz therefore gives

```math
\begin{aligned}
\left|\int(1,z)g_{\mathrm n}\,d\gamma_r\right|^2
&=\left|\int V(y)\,d\gamma_{r-1}(y)\right|^2
\\ &\le B_r(R)
 \int e^{-\alpha|y|^2}
       \frac{|V(y)|^2}{2+|y|^2}\,d\gamma_{r-1}(y)
\\ &\le4\phi(0)e^\alpha B_r(R)
       \int e^{-\alpha|y|^2}b(y)\,d\gamma_{r-1}(y)
\\ &=4\phi(0)e^\alpha B_r(R)W_{\mathrm n}.
\end{aligned}
\tag{11}
```

For $`r=1`$, the near part is empty because $`R>1`$, and (11) holds with both sides zero. Finally apply $`|a+b|^2\le2|a|^2+2|b|^2`$ to (9) and (11). Formula (7) is a common upper bound for the resulting coefficients, proving (8).

## 5. Conditioned partition tails and unbalanced masses

Condition arbitrary partition indicators on the fixed score space $`E`$:

```math
f_i(z)=\mathbb E[1_{A_i}(X)\mid P_EX=z],\qquad
\widetilde g_{ij}=f_i1_{C_j}-f_j1_{C_i}.
```

The transfer has a fixed sign on each of $`C_i`$ and $`C_j`$, so conditioning preserves its absolute value and all costs depending only on $`z`$, including $`W_\alpha`$. It also preserves the linear potential increase. It does not preserve the full noise stability.

Let $`h_i^E=f_i-1_{C_i}`$, and put

```math
e_i^{\mathrm t}=\int_{|z|>R}h_i^E\,d\gamma_r,\qquad
M_i^{\mathrm t}=\int_{|z|>R}z h_i^E\,d\gamma_r,
```

```math
W_{\alpha,\mathrm t}
=\sum_{i\lt j}\int_{|z|>R}e^{-\alpha|z|^2}
 w(n_{ij}\cdot z)|\widetilde g_{ij}(z)|\,d\gamma_r(z).
```

Since $`h_i^E=\sum_{j\ne i}\widetilde g_{ij}`$, vector Cauchy--Schwarz and (8) imply

```math
\|e^{\mathrm t}\|^2+\|M^{\mathrm t}\|_F^2
\le \eta_q^\alpha(R)W_{\alpha,\mathrm t},
\qquad
\eta_q^\alpha(R)=2(q-1)\eta_r^\alpha(R)\longrightarrow0.
\tag{12}
```

Each unordered pair is counted twice. Also $`W_{\alpha,\mathrm t}\le1`$, because the sum of all absolute transfer masses at a point in $`C_i`$ is $`1-f_i\le1`$ and both cost factors are at most one.

No balance hypothesis is used in (12). If the full cell-mass error is $`e_i=\gamma_d(A_i)-1/q`$, then the core mass error is

```math
e^{\mathrm c}=e-e^{\mathrm t},
```

rather than $`-e^{\mathrm t}`$ unless the original partition is balanced. In polar coordinates for the full moment matrix, the full square moment matrix is symmetric, so the core skew part is the negative of the tail skew part. Consequently

```math
\|e^{\mathrm c}\|^2+
 \|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2
\le2\|e\|^2+2\eta_q^\alpha(R)W_{\alpha,\mathrm t}.
\tag{13}
```

When the original moment row space is contained in $`E`$, conditioning also preserves all moment coordinates used in this comparison; otherwise (12) concerns only their projections onto $`E`$. This distinction must be respected in any subsequent localization argument.

## Status

The global gap (1), compact-core estimate (6), and tail estimates (12)--(13) are proved above. A negative-correlation optimality argument additionally needs a higher-Hermite bound for this same weighted cost, a justified localization of possibly unbalanced competitors, the local core coercivity estimate, and an order of choices that absorbs their errors. Those steps and the status of any assembled theorem are separate from this note.


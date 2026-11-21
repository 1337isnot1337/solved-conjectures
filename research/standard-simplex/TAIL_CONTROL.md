# Standard Simplex conjecture: tail transfer control

Research note, 21 November 2026. This note complements [NOISE_COMPARISON.md](NOISE_COMPARISON.md). It proves that, in a fixed finite-dimensional simplex subspace, the squared tail mass and moment errors are small relative to the truncated transfer cost. The ambient dimension does not enter. It also records the sharp first-order potential comparison on a fixed compact core. These are auxiliary estimates, not a resolution of the Standard Simplex conjecture.

## 1. A Gaussian tail lemma

For a standard Gaussian vector $`G_k\in\mathbb R^k`$, define

```math
p_k(a)=\mathbb P(|G_k|>a),\qquad
m_k(a)=\mathbb E[|G_k|^2 1_{\{|G_k|>a\}}].
```

Take $`p_0=m_0=0`$. For $`r\ge1`$ and $`R\ge\sqrt2`$, put $`a=R/\sqrt2`$ and

```math
\eta_r(R)=2\bigl[r p_1(a)+m_1(a)+6p_{r-1}(a)+4m_{r-1}(a)\bigr]. \tag{1}
```

For each fixed $`r`$, $`\eta_r(R)\to0`$ as $`R\to\infty`$.

**Tail lemma.** Let $`g:\mathbb R^r\to\mathbb R`$ be measurable, $`|g|\le1`$, and suppose $`g(z)=0`$ for $`|z|\le R`$. For any unit vector $`n`$, set $`s=n\cdot z`$ and $`w(s)=\min(|s|,1)`$. Then

```math
\left|\int g\,d\gamma_r\right|^2
+\left|\int z g(z)\,d\gamma_r(z)\right|^2
\le\eta_r(R)\int w(s)|g(z)|\,d\gamma_r(z). \tag{2}
```

The same $`\eta_r`$ works for every direction $`n`$ and every such function $`g`$.

### Proof

Rotate coordinates so $`z=(s,y)`$ with $`y\in\mathbb R^{r-1}`$. Split

```math
g_1=g1_{\{|s|>a\}},\qquad g_2=g-g_1,
\qquad B_j=\int w(s)|g_j|\,d\gamma_r.
```

The second function is supported in $`|y|>a`$: otherwise $`|s|\le a`$ and $`|y|\le a`$ would imply $`|z|\le R`$. The supports of $`g_1,g_2`$ are disjoint, so $`B_1+B_2=\int w|g|`$.

For the augmented vector $`v(z)=(1,z)`$, Cauchy--Schwarz and $`|g_1|\le1`$ give

```math
\left|\int v(z)g_1(z)\,d\gamma_r(z)\right|^2
\le\left[\int_{|s|>a}(1+|z|^2)\,d\gamma_r(z)\right]
     \int|g_1|\,d\gamma_r
=\bigl[r p_1(a)+m_1(a)\bigr]B_1. \tag{3}
```

Here $`w(s)=1`$ on the support because $`a\ge1`$.

For $`g_2`$, define on each normal fiber

```math
A(y)=\int|g_2(s,y)|\,d\gamma_1(s),\qquad
B(y)=\int w(s)|g_2(s,y)|\,d\gamma_1(s),
```

```math
M(y)=\int g_2(s,y)\,d\gamma_1(s),\qquad
N(y)=\int s g_2(s,y)\,d\gamma_1(s).
```

We need two estimates valid on every fiber:

```math
|M(y)|^2\le A(y)^2\le4B(y),\qquad |N(y)|^2\le2B(y). \tag{4}
```

For the first, split the mass into $`|s|\le1`$ and $`|s|>1`$, writing $`A=A_{\mathrm n}+A_{\mathrm f}`$ and similarly $`B=B_{\mathrm n}+B_{\mathrm f}`$. The mass estimate in [NOISE_COMPARISON.md, Section 1.1](NOISE_COMPARISON.md#11-a-one-dimensional-mass-estimate) gives $`A_{\mathrm n}^2\le4\phi(0)B_{\mathrm n}`$. Also $`A_{\mathrm f}^2\le A_{\mathrm f}=B_{\mathrm f}`$. Therefore

```math
A^2\le2A_{\mathrm n}^2+2A_{\mathrm f}^2
\le8\phi(0)B_{\mathrm n}+2B_{\mathrm f}\le4B.
```

For the second estimate in (4), weighted Cauchy--Schwarz gives

```math
|N(y)|^2
\le B(y)\int\frac{s^2}{w(s)}|g_2(s,y)|\,d\gamma_1(s)
\le B(y)\left[\mathbb E|G_1|+\mathbb E G_1^2\right]
\le2B(y).
```

Set the quotient at $`s=0`$ to zero. This changes no integral.

Since these functions vanish for $`|y|\le a`$, another Cauchy--Schwarz estimate yields

```math
\left|\int (1,y)M(y)\,d\gamma_{r-1}(y)\right|^2
\le\bigl[p_{r-1}(a)+m_{r-1}(a)\bigr]\int|M(y)|^2\,d\gamma_{r-1}(y)
\le4\bigl[p_{r-1}(a)+m_{r-1}(a)\bigr]B_2.
```

The remaining normal coordinate obeys

```math
\left|\int N(y)\,d\gamma_{r-1}(y)\right|^2
\le p_{r-1}(a)\int|N(y)|^2\,d\gamma_{r-1}(y)
\le2p_{r-1}(a)B_2.
```

These are orthogonal coordinates of the augmented moment vector, so

```math
\left|\int v(z)g_2(z)\,d\gamma_r(z)\right|^2
\le\bigl[6p_{r-1}(a)+4m_{r-1}(a)\bigr]B_2. \tag{5}
```

Finally, apply $`|u+v|^2\le2|u|^2+2|v|^2`$ to (3) and (5). Equation (1) is a convenient common upper bound for both resulting coefficients, proving (2). All moments used above are finite Gaussian moments. Dominated convergence proves $`\eta_r(R)\to0`$.

## 2. Conditioning onto the aligned simplex subspace

Use the polar-aligned regular partition $`\mathcal C`$ from [NOISE_COMPARISON.md, Section 4](NOISE_COMPARISON.md#4-moment-coercivity-after-polar-alignment), and let $`E`$ be its $`r=q-1`$ dimensional score subspace. The original partition's moments lie in $`E`$ as well.

Write $`x=(z,u)\in E\oplus E^\perp`$, and condition the cell indicators on $`z`$:

```math
f_i(z)=\int 1_{A_i}(z,u)\,d\gamma_{d-r}(u).
```

Then $`0\le f_i\le1`$, $`\sum_i f_i=1`$, and $`\int f_i\,d\gamma_r=1/q`$. The moments $`\int zf_i(z)\,d\gamma_r`$ are exactly the coordinates of the original moments in $`E`$. Their perpendicular coordinates are zero by the choice of $`E`$.

For a pair of cells, the conditioned transfer is

```math
\widetilde g_{ij}(z)=f_i(z)1_{C_j}(z)-f_j(z)1_{C_i}(z).
```

On each of $`C_i`$ and $`C_j`$, the unconditioned transfer has a fixed sign. Thus conditioning commutes with its absolute value:

```math
\int |g_{ij}(z,u)|\,d\gamma_{d-r}(u)
=|\widetilde g_{ij}(z)|. \tag{6}
```

Consequently every transfer cost depending only on $`z`$, including $`D`$, $`W`$, their core and tail restrictions, and the linear potential loss, is preserved exactly by conditioning. We do not assert that conditioning preserves the full noise stability; the higher-Hermite bound is applied to the original indicators in the original ambient dimension.

## 3. Tail mass and moment errors for a partition

Put $`h_i^E=f_i-1_{C_i}`$ and split the conditioned perturbation at $`|z|\le R`$. Define

```math
e_i^{\mathrm t}=\int_{|z|>R}h_i^E(z)\,d\gamma_r(z),
\qquad
M_i^{\mathrm t}=\int_{|z|>R}z h_i^E(z)\,d\gamma_r(z),
```

and let $`M^{\mathrm t}`$ be the matrix with rows $`M_i^{\mathrm t}`$. Write

```math
W_{\mathrm t}
=\sum_{i<j}\int_{|z|>R}
 \min(|n_{ij}\cdot z|,1)|\widetilde g_{ij}(z)|\,d\gamma_r(z).
```

Since $`h_i^E=\sum_{j\ne i}\widetilde g_{ij}`$, the vector Cauchy--Schwarz inequality and (2) yield

```math
\|e^{\mathrm t}\|^2+\|M^{\mathrm t}\|_F^2
\le 2(q-1)\eta_r(R)W_{\mathrm t}. \tag{7}
```

Each unordered pair appears twice in this sum. Also $`0\le W_{\mathrm t}\le1`$, because at each point the total absolute pair-transfer mass is $`1-f_i(z)\le1`$ for the original regular label $`i`$.

The core fractional partition

```math
f_i^{\mathrm c}(z)
=1_{C_i}(z)+1_{\{|z|\le R\}}(f_i(z)-1_{C_i}(z))
```

remains a partition, but generally is not exactly balanced. Its mass-error vector is $`e^{\mathrm c}=-e^{\mathrm t}`$. Its moment matrix is $`M^{\mathrm c}=M-M^{\mathrm t}`$.

To describe the rotational error, choose orthonormal coordinates on $`E`$ and a $`q\times r`$ matrix $`U`$ with $`U^TU=I_r`$ and $`UU^T=P`$, so the regular moment matrix is $`M_{\mathcal C}=(c_q/\sqrt r)U`$. The polar alignment makes $`N=U^TM`$ symmetric positive semidefinite. Every moment matrix in this paragraph has zero row sum, so left multiplication by $`U^T`$ preserves its Frobenius norm. Therefore

```math
\mathop{\mathrm{skew}}(U^TM^{\mathrm c})
=-\mathop{\mathrm{skew}}(U^TM^{\mathrm t}),
```

and (7) gives

```math
\|e^{\mathrm c}\|^2
+\|\mathop{\mathrm{skew}}(U^TM^{\mathrm c})\|_F^2
\le 2(q-1)\eta_r(R)W_{\mathrm t}. \tag{8}
```

This is the quadratic mass/alignment error needed for a local core coercivity estimate. Such an estimate is a separate step and is not assumed here.

## 4. Sharp first-order potential on a fixed compact core

Let $`R<\infty`$ and $`\delta>0`$ be fixed. There exists $`\rho_{q,R,\delta}>0`$ such that, for $`0<\rho\le\rho_{q,R,\delta}`$,

```math
T_\rho(1_{C_i}-1_{C_j})(z)
\ge(1-\delta)\rho\ell_q(n_{ij}\cdot z)
\quad\text{if }z\in C_i,\ |z|\le R. \tag{9}
```

Here $`\ell_q=|m_i^{\mathcal C}-m_j^{\mathcal C}|`$ is the exact first-order moment slope. To justify the uniform statement at the tie hyperplane as well as away from it, put $`F_{ij}=1_{C_i}-1_{C_j}`$. Gaussian convolution gives

```math
\nabla T_\rho F_{ij}(z)
=\frac{\rho}{\sqrt{1-\rho^2}}
\mathbb E\left[G_r F_{ij}\bigl(\rho z+\sqrt{1-\rho^2}G_r\bigr)\right]. \tag{10}
```

For bounded $`F_{ij}`$, changing variables to its argument rewrites the expectation using a smooth Gaussian density and its first derivative. On every compact set of $`z`$, those integrands converge uniformly in the weighted $`L^1`$ norm as $`\rho\downarrow0`$. A fixed integrable Gaussian majorant follows, for example, by restricting $`\rho\le1/2`$ and $`|z|\le R`$. Thus

```math
\rho^{-1}\nabla T_\rho F_{ij}(z)
\longrightarrow\int zF_{ij}(z)\,d\gamma_r(z)
=\ell_q n_{ij}
```

uniformly on $`|z|\le R`$.

Reflection across the $`i,j`$ score-tie hyperplane exchanges $`C_i`$ and $`C_j`$ and preserves every other score. Therefore $`T_\rho F_{ij}`$ vanishes on that hyperplane. Write $`z=sn_{ij}+y`$ with $`s\ge0`$, integrate its normal derivative from $`y`$ to $`sn_{ij}+y`$, and use the uniform gradient convergence. Every point on that segment remains in the ball of radius $`R`$. This proves (9), including at $`s=0`$.

Summing over core transfers gives

```math
L_{\rho,\mathrm c}\ge(1-\delta)\rho D_{\mathrm c}. \tag{11}
```

The tail retains the uniform estimate $`L_{\rho,\mathrm t}\ge b_q\rho W_{\mathrm t}`$ from [NOISE_COMPARISON.md](NOISE_COMPARISON.md). The two estimates have different purposes: (11) retains the sharp first-order coefficient on a chosen compact core, while the tail estimate controls all remaining locations.

## Status

Equations (7) and (8) address the mass and moment cost of cutting off transfers. Equation (11) supplies compact-core convergence with the necessary factor of normal distance. A proof still needs the fixed-simplex core coercivity estimate, a justified order of choices for all constants, and a source comparison for any resulting small-correlation theorem. No full-conjecture conclusion is asserted in this note.

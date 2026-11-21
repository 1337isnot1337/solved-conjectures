# Standard Simplex: quantitative stability at low positive correlation

Proposed corollary, 21 November 2026. This is a quantitative consequence of the proof in [SMALL_CORRELATION.md](SMALL_CORRELATION.md), with the same explicitly credited first-moment dependency. It is not a separate conjecture target or a full resolution of Standard Simplex. The source comparison and its limits are recorded in [LOW_CORRELATION_PRIOR_AUDIT.md](LOW_CORRELATION_PRIOR_AUDIT.md).

## 1. Statement and fixed constants

Let $`\mathscr S_{q,d}`$ be the family of central regular-simplex partitions of $`\mathbb R^d`$, including all orthogonal transformations and relabelings. For a balanced measurable partition $`\mathcal A=(A_1,\ldots,A_q)`$, define

```math
d_{\mathscr S}(\mathcal A)
=\inf_{\mathcal D\in\mathscr S_{q,d}}
  \sum_{i=1}^q\gamma_d(A_i\mathbin{\triangle}D_i),
\qquad
\Delta_\rho(\mathcal A)
=S_\rho(\mathcal C_0)-S_\rho(\mathcal A), \tag{1}
```

where $`\mathcal C_0`$ is any central regular-simplex partition. Its noise value does not depend on this choice. In particular, $`0\le d_{\mathscr S}(\mathcal A)\le2`$.

**Proposed quantitative corollary.** For each integer $`q\ge3`$, there exist $`\widehat\rho_q>0`$ and $`\nu_q>0`$, depending only on $`q`$, such that every balanced measurable $`q`$-partition in every $`d\ge q-1`$ satisfies

```math
\Delta_\rho(\mathcal A)
\ge\nu_q\rho\,d_{\mathscr S}(\mathcal A)^2
\qquad(0<\rho\le\widehat\rho_q). \tag{2}
```

The squared-distance power is sharp. The factor $`\rho`$ has the correct order uniformly as $`\rho\downarrow0`$. Neither the threshold nor the constants are claimed to be optimal.

Use the notation of [SMALL_CORRELATION.md, Sections 2–3](SMALL_CORRELATION.md): $`c^2`$ is the prior balanced first-moment maximum, $`C_{\mathrm g}>0`$ is the global polar-alignment constant, $`\delta_0,\kappa,K`$ are the local core constants, $`\ell=c\sqrt{2/(q-1)}`$, $`b=2^{2-q}\phi(1)\phi(2)`$, and $`\rho_q`$ is that note's threshold. All tail and core parameters chosen there remain fixed. Put

```math
a_q=\min\left(\frac{c^2}{4},\frac{\delta_0^2}{32C_{\mathrm g}}\right),
\qquad
\widehat\rho_q=\min(\rho_q,a_q), \tag{3}
```

```math
A_q=q(q-1)\phi(0),\qquad
v_q=\min\left(\frac{\kappa\ell}{8},b\right),\qquad
\nu_q=\min\left(\frac{a_q}{4},\frac{v_q}{16A_q}\right)>0. \tag{4}
```

These choices establish (2).

## 2. Localization of every small-deficit competitor

Let $`M`$ be the moment matrix of $`\mathcal A`$, and set $`\varepsilon=c^2-\|M\|_F^2\ge0`$. The Hermite bounds used in the earlier proof apply to every balanced competitor and give

```math
\Delta_\rho(\mathcal A)
\ge\rho\varepsilon-\rho^2(1-1/q),
\qquad
\varepsilon\le\frac{\Delta_\rho(\mathcal A)}\rho
 +\rho(1-1/q). \tag{5}
```

First suppose $`\Delta_\rho(\mathcal A)\lt a_q\rho`$. From (3) and (5),

```math
\varepsilon\lt a_q+\rho\le2a_q
\le\min\left(\frac{c^2}{2},\frac{\delta_0^2}{16C_{\mathrm g}}\right). \tag{6}
```

In particular the moment norm is positive. Choose the **same polar-aligned** regular partition $`\mathcal C`$ used in the global alignment estimate. A partial polar isometry may be extended as in the earlier proof. Then

```math
\|M-M_{\mathcal C}\|_F
\le\sqrt{C_{\mathrm g}\varepsilon}\le\delta_0/4. \tag{7}
```

This replaces the earlier proof's localization obtained from the stronger assumption that the competitor attains or exceeds the simplex benchmark. That benchmark assumption was used only to obtain this neighborhood estimate; it is not needed in the subsequent core and noise comparison once (7) holds.

For completeness, condition the indicators onto the score subspace of this chosen $`\mathcal C`$, and use the previously fixed radius $`R`$. The tail estimate and $`W_{\mathrm t}\le1`$ give

```math
\|M_{\mathrm t}\|_F^2+\|e_{\mathrm t}\|^2
\le\eta_q(R)W_{\mathrm t},\qquad
\eta_q(R)\le\delta_0^2/16.
```

Consequently the actual core moment matrix and core mass error satisfy

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F\le\delta_0/2,
\qquad \|e_{\mathrm c}\|\le\delta_0/4. \tag{8}
```

The full aligned square moment matrix is symmetric, so the core skew error is controlled by the tail moment error. These are exactly the hypotheses used in [SMALL_CORRELATION.md, Sections 5–6](SMALL_CORRELATION.md). Conditioning preserves moments and absolute transfer costs; it does not replace the original noise value. The higher-Hermite term is still estimated in the original ambient space.

The already proved absorption inequality therefore gives

```math
\Delta_\rho(\mathcal A)
\ge\rho\left(\frac\kappa8D_{\mathrm c}+bW_{\mathrm t}\right)
\ge v_q\rho W,
\qquad W=W_{\mathrm c}+W_{\mathrm t}, \tag{9}
```

because $`D_{\mathrm c}\ge\ell W_{\mathrm c}`$. None of the constants in this step is chosen from the competitor or from the original ambient dimension.

## 3. Convert weighted transfer cost to partition distance

Work with the original deterministic labels. For $`i\lt j`$, set

```math
g_{ij}=1_{A_i\cap C_j}-1_{A_j\cap C_i},
\qquad
W=\sum_{i\lt j}\int
 \min(|n_{ij}\cdot x|,1)|g_{ij}(x)|\,d\gamma_d(x), \tag{10}
```

where $`n_{ij}`$ is a unit normal to the score-tie hyperplane of cells $`i,j`$. The fixed-sign conditioning identity in [TAIL_CONTROL.md](TAIL_CONTROL.md) identifies (10) with the cost in (9).

Every point whose label differs between $`\mathcal A`$ and $`\mathcal C`$ contributes to exactly one unordered transfer pair. If $`\mu`$ is the total disagreement probability, then

```math
0\le W\le\mu\le1,
\qquad
\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)=2\mu. \tag{11}
```

For $`0\lt s\le1`$, divide disagreement points according to whether their corresponding normal distance is at most $`s`$. The first group is contained in the union of $`\binom q2`$ Gaussian slabs. Since each unit normal has a standard normal marginal, that union has measure at most $`q(q-1)\phi(0)s=A_qs`$. On the second group the weight in (10) is at least $`s`$. Thus

```math
\mu\le A_qs+W/s. \tag{12}
```

For $`q\ge3`$, $`A_q>1`$. If $`W>0`$, choose $`s=\sqrt{W/A_q}\le1`$. If $`W=0`$, let $`s\downarrow0`$ in (12). In either case,

```math
d_{\mathscr S}(\mathcal A)
\le\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)
\le4\sqrt{A_qW}. \tag{13}
```

Combining (9) and (13) proves (2) with coefficient $`v_q/(16A_q)`$ in the small-deficit branch.

In the remaining branch, $`\Delta_\rho(\mathcal A)\ge a_q\rho`$, and $`d_{\mathscr S}(\mathcal A)\le2`$ gives

```math
\Delta_\rho(\mathcal A)
\ge\frac{a_q}{4}\rho\,d_{\mathscr S}(\mathcal A)^2. \tag{14}
```

Equations (4), (13), and (14) prove the corollary for every competitor. In particular, noise deficit at most $`\eta`$ implies

```math
d_{\mathscr S}(\mathcal A)
\le\sqrt{\frac{\eta}{\nu_q\rho}}. \tag{15}
```

This removes the additive $`O_q(\sqrt\rho)`$ localization error from the first-moment-only estimate in the established low-correlation interval.

## 4. Uniform sharpness by a balanced strip exchange

Use the construction in [FIRST_MOMENT_STABILITY.md, Section 8](FIRST_MOMENT_STABILITY.md). In the score space $`\mathbb R^{q-1}`$, fix a compact patch $`D`$ of positive Gaussian measure in the relative interior of an $`ij`$ facet, away from the other facets. Let $`n`$ point into $`C_i`$. Fix $`t_0>0`$ so that, for $`y\in D`$ and $`|s|<2t_0`$, the point $`y+sn`$ has label $`i`$ for $`s>0`$ and label $`j`$ for $`s<0`$.

For $`0\lt t\lt t_0`$, exchange labels on $`D\times(0,t)`$ and its reflection $`D\times(-t,0)`$, producing $`\mathcal A_t`$. Gaussian reflection preserves the two masses exactly. Extend the construction cylindrically in the remaining $`d-q+1`$ coordinates. All partitions remain balanced.

Put $`F=1_{C_i}-1_{C_j}`$. Differentiating its Gaussian convolution, rather than its indicator, gives for every $`x`$

```math
\left|\partial_nT_\rho F(x)\right|
\le\frac{\rho}{\sqrt{1-\rho^2}}\mathbb E|G_1|
\le K_0\rho,
\qquad
K_0=\frac{\sqrt{2/\pi}}{\sqrt{15/16}}, \tag{16}
```

because $`|F|\le1`$ and $`\rho\le\widehat\rho_q\le1/4`$. This derivative formula is valid for bounded measurable functions by differentiation of the smooth Gaussian kernel. Reflection in the score-tie hyperplane exchanges the two regular cells, so $`T_\rho F`$ vanishes on that hyperplane. Integrating (16) along a normal line yields

```math
|T_\rho F(y+sn)|\le K_0\rho|s|. \tag{17}
```

Let $`p_D>0`$ be the Gaussian measure of the patch in its tangent hyperplane. The linear loss of the two exchanged strips therefore satisfies

```math
L_\rho(\mathcal A_t,\mathcal C)
\le2K_0\rho p_D\int_0^t s\phi(s)\,ds
=2K_0\rho p_D[\phi(0)-\phi(t)]. \tag{18}
```

For positive correlation, $`T_\rho`$ is positive semidefinite, as is immediate from its nonnegative Hermite eigenvalues. Writing $`h_i=1_{A_{t,i}}-1_{C_i}`$, the exact identity gives

```math
0\le\Delta_\rho(\mathcal A_t)
=2L_\rho-\sum_i\langle h_i,T_\rho h_i\rangle
\le2L_\rho
\le2K_0p_D\phi(0)\rho t^2. \tag{19}
```

The last step uses $`1-e^{-t^2/2}\le t^2/2`$.

For any convex comparison cell, its intersection with each normal line is an interval. On the three successive intervals $`(-t,0)`$, $`(0,t)`$, and $`(t,2t)`$, the modified cell $`A_{t,i}`$ has occupancy pattern one, zero, one. Every interval differs from this pattern on a set of Lebesgue length at least $`t`$. Since the Gaussian density is at least $`\phi(2t_0)`$ on this range, integration over the patch gives

```math
d_{\mathscr S}(\mathcal A_t)
\ge p_D\phi(2t_0)t. \tag{20}
```

This holds against every rotated or relabeled regular partition because each comparison cell is convex. In a larger ambient dimension, fix an arbitrary unused-coordinate value before taking the normal-line section, then integrate over that Gaussian factor; the same constants apply even if the comparison partition is rotated outside the original score space.

Equations (19)–(20) rule out replacing the power two in (2) by any smaller power with a fixed positive coefficient, even at one fixed correlation in the proved interval. Together with (2), they give a deficit of order $`\rho t^2`$ for this family, with both constants uniform over $`0<\rho\le\widehat\rho_q`$ and all permitted ambient dimensions. This also proves the sharp square-root dependence in (15) for the stated partition metric.

## 5. Scope

This corollary reuses the established low-correlation proof and its credited prior first-moment extremum. It adds a quantitative conclusion and a sharpness construction; it does not expand the correlation interval to all positive correlations, address negative correlations, supply optimal constants, or add another resolved conjecture to the repository.

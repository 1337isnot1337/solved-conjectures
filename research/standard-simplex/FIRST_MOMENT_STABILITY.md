# Standard Simplex conjecture: quantitative first-moment stability

Working proof, 21 November 2026. This is a proposed quantitative deduction from an existing first-moment extremum, not a resolution of the Standard Simplex conjecture. The exact all-cell extremum and covariance-deficit identity are credited to the public [mxym/math manuscript](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), dated 8 October 2026. The argument below derives an explicit power of the partition deficit, with a constant depending only on the number of cells. No first-discovery claim is made while the quantitative prior-art screen remains incomplete.

## 1. Statement and normalization

Fix $`q\ge3`$, put $`r=q-1`$, and let $`Z_1,\ldots,Z_q`$ be independent standard normal variables. Define

```math
a_q=\mathbb E\max_{i\le q}Z_i,
\qquad c_q=\frac{a_q}{\sqrt r},
\qquad F_q=c_q^2.
```

Let $`d\ge r`$, and let $`\mathcal A=(A_1,\ldots,A_q)`$ be a measurable Gaussian partition of $`\mathbb R^d`$ with every cell of probability $`1/q`$. Set

```math
m_i=\int_{A_i}x\,d\gamma_d(x),
\qquad F(\mathcal A)=\sum_i|m_i|^2,
\qquad \varepsilon=F_q-F(\mathcal A).
```

**Proposed stability theorem.** There is a finite constant $`K_q`$, depending only on $`q`$, such that some central regular-simplex partition $`\mathcal C`$ in a $`q-1`$ dimensional subspace satisfies

```math
\sum_{i=1}^q\gamma_d(A_i\mathbin{\triangle}C_i)
\le K_q\sqrt\varepsilon. \tag{1}
```

The orthogonal complement of that subspace is unrestricted. The labels of $`\mathcal C`$ can be chosen freely. In the corresponding product $`L^2`$ metric,

```math
\left(\sum_i\|1_{A_i}-1_{C_i}\|_{L^2(\gamma_d)}^2\right)^{1/2}
\le \sqrt{K_q}\,\varepsilon^{1/4}. \tag{2}
```

No numerical bound on $`K_q`$ is asserted. Section 8 shows that the exponent $`1/2`$ in (1) cannot be increased, even when the comparison allows every convex partition. The same argument works for fractional partitions, replacing the left side of (1) by $`\sum_i\int|f_i-1_{C_i}|\,d\gamma_d`$, but ordinary partitions suffice for the present application.

## 2. Credited covariance identities

Let $`P=I-\mathbf1\mathbf1^T/q`$, and define

```math
\mathcal K=\{Q=Q^T\succeq0:Q\mathbf1=0,\ \mathop{\mathrm{tr}}Q=1\},
\qquad Q_* =P/r.
```

For centered Gaussian scores $`Y\sim N(0,Q)`$, the balanced assignment value is

```math
\mathcal V(Q)=\inf_{\lambda\in\mathbb R^q}
\left[\frac1q\sum_i\lambda_i+
\mathbb E\max_i(Y_i-\lambda_i)\right]. \tag{3}
```

The source uses the notation $`\mathcal C(Q)`$ for this value. We write $`\mathcal V`$ to distinguish it from a partition. It is continuous on the positive semidefinite cone, homogeneous of degree one-half in $`Q`$, and smooth where $`Q`$ is positive definite on $`\mathbf1^\perp`$.

On that positive cone, use a centered score matrix with row vectors $`v_i\in\mathbb R^r`$ and Gram matrix $`Q`$. The unique balancing prices in the gauge $`\sum_i\lambda_i=0`$ define cells

```math
B_i(Q)=\{x:v_i\cdot x-\lambda_i\ge v_j\cdot x-\lambda_j
\text{ for every }j\}.
```

For an unordered pair $`e=\{i,j\}`$, put

```math
\ell_e=|v_i-v_j|,
\qquad A_e=\int_{\partial B_i\cap\partial B_j}
 (2\pi)^{-r/2}e^{-|x|^2/2}\,d\mathcal H^{r-1}(x),
\qquad w_e=A_e/\ell_e.
```

The surface measure uses the ambient Gaussian density. Put $`S=\sum_e w_e\ell_e`$ and $`W=\sum_e w_e`$. Gaussian flux gives

```math
\mathcal V(Q)=\sum_e w_e\ell_e^2,
\qquad d\mathcal V(Q)[D]=\tfrac12\mathop{\mathrm{tr}}(LD),
```

where $`L`$ is the graph Laplacian with weights $`w_e`$. The Gaussian multi-bubble perimeter theorem of [Milman–Neeman](https://doi.org/10.4007/annals.2022.195.1.2), applied in $`r=q-1`$ dimensions to the equal positive masses, gives

```math
S\ge S_*:=c_q\sqrt{r/2}.
```

The source's covariance comparison then gives $`\mathcal V(Q)\le c_q`$ on $`\mathcal K`$, with equality only at $`Q_*`$. More precisely, for

```math
Q_t=Q_*+t(Q-Q_*),\qquad 0\le t<1,
```

its exact identity is

```math
c_q^2-\mathcal V(Q)^2
=\int_0^1\frac{D(t)}{t^2}\,dt, \tag{4}
```

```math
D(t)=\frac2r\left[
 \sum_{e<f}w_e(t)w_f(t)(\ell_e(t)-\ell_f(t))^2
 +S(t)^2-S_*^2\right]\ge0. \tag{5}
```

The passage to a singular endpoint $`Q`$ uses continuity, not endpoint differentiability. For clarity, (4) follows by setting $`h(t)=\mathcal V(Q_t)^2-c_q^2`$; the flux and derivative identities give $`th'(t)=h(t)-D(t)`$. At the regular covariance, symmetry gives $`h(0)=h'(0)=0`$, so integrating $`(h/t)'=-D/t^2`$ proves (4). The upper bound follows at the same time.

All statements in this section are existing inputs or their displayed verification from the cited source. The quantitative deduction begins next.

## 3. A uniform quadratic covariance deficit

Let

```math
\mathcal K_{1/2}=\{R\in\mathcal K:R\succeq Q_*/2\}.
```

It is compact and contained in the positive cone. Every score list there is affinely independent. Consequently every pair of cells has a genuine facet: prescribe the two corresponding affine scores to tie strictly above all the other scores, using the invertibility of the score-difference map. The tie contains an open subset of its hyperplane, so its Gaussian facet area is positive.

The balancing prices and facet weights depend continuously on $`R`$ on this compact set. One justification is to use the positive square root as score coordinates. Gaussian integration over fixed score-order regions gives smooth probabilities; their price Jacobian is the positive weighted Laplacian, invertible on the zero-sum gauge. The implicit function theorem supplies smooth prices. The facet weights are the corresponding threshold derivatives of these smooth Gaussian orthant probabilities. Therefore

```math
\omega_q:=\min_{R\in\mathcal K_{1/2}}\min_e w_e(R)>0. \tag{6}
```

For $`0\le t\le1/2`$, $`Q_t\in\mathcal K_{1/2}`$. Write $`\Delta=Q-Q_*`$ and

```math
\delta_{ij}=\Delta_{ii}+\Delta_{jj}-2\Delta_{ij}.
```

Since $`\Delta\mathbf1=0`$ and $`\mathop{\mathrm{tr}}\Delta=0`$,

```math
\sum_{i<j}\delta_{ij}=0,
\qquad
\sum_{i<j}\delta_{ij}^2
=q\sum_i\Delta_{ii}^2+2\|\Delta\|_F^2
\ge2\|\Delta\|_F^2. \tag{7}
```

For the second identity, form the full matrix
$`D_{ij}=\Delta_{ii}+\Delta_{jj}-2\Delta_{ij}`$ and expand its squared Frobenius norm. The mixed terms with $`\Delta`$ vanish because its row sums vanish; the remaining diagonal cross term is $`2(\mathop{\mathrm{tr}}\Delta)^2=0`$. The full matrix counts each unordered pair twice.

Every $`\ell_e(t)^2\le2`$, since $`Q_t`$ is positive semidefinite of trace one. Moreover, $`\ell_e(t)^2=2/r+t\delta_e`$. Hence

```math
(\ell_e(t)-\ell_f(t))^2
=\frac{t^2(\delta_e-\delta_f)^2}{(\ell_e(t)+\ell_f(t))^2}
\ge\frac{t^2}{8}(\delta_e-\delta_f)^2. \tag{8}
```

There are $`M=q(q-1)/2`$ unordered pairs. The zero sum in (7) gives

```math
\sum_{e<f}(\delta_e-\delta_f)^2
=M\sum_e\delta_e^2\ge2M\|\Delta\|_F^2.
```

Substitute this and (6)–(8) into (5), and discard the nonnegative perimeter deficit:

```math
D(t)\ge\frac{M\omega_q^2}{2r}\,t^2\|\Delta\|_F^2
\qquad(0\le t\le1/2).
```

Integrating only this half of (4) yields the global estimate

```math
c_q^2-\mathcal V(Q)^2
\ge\beta_q\|Q-Q_*\|_F^2,
\qquad \beta_q=\frac{q\omega_q^2}{8}>0. \tag{9}
```

No lower bound on the endpoint eigenvalues is needed; the uniform facet estimate was used only on the initial half of the path.

## 4. Near-maximal moments force nearly regular scores

Let $`F=F(\mathcal A)>0`$, let $`M`$ have rows $`m_i`$, and set

```math
V=M/\sqrt F,\qquad Q=VV^T\in\mathcal K.
```

The original labels are a feasible balanced assignment for these scores. Their assignment value is $`\sqrt F`$, so

```math
\sqrt F\le\mathcal V(Q)\le c_q.
```

Combining this with (9),

```math
\|Q-Q_*\|_F\le\sqrt{\varepsilon/\beta_q}. \tag{10}
```

Restrict first to $`0\le\varepsilon\le\varepsilon_q`$, where $`\varepsilon_q>0`$ is small enough that $`F\ge c_q^2/2`$ and the right side of (10) is at most $`1/(2r)`$. Then $`Q\succeq Q_*/2`$ on $`\mathbf1^\perp`$ and $`M`$ has rank $`r`$.

Define $`U=Q^{-1/2}V`$ on $`\mathbf1^\perp`$, so $`UU^T=P`$. A regular score list in the same row space is

```math
V_*=Q_*^{1/2}U.
```

Because $`Q_*`$ is scalar on $`\mathbf1^\perp`$, diagonalizing $`Q`$ and applying the scalar square-root identity gives

```math
\|V-V_*\|_F
=\|Q^{1/2}-Q_*^{1/2}\|_F
\le C_q\|Q-Q_*\|_F. \tag{11}
```

Here and below $`C_q`$ denotes finite constants depending only on $`q`$, not necessarily the same at each occurrence. Smoothness of the balancing prices, and their zero value at $`Q_*`$, give

```math
\|\lambda(Q)\|\le C_q\|Q-Q_*\|_F. \tag{12}
```

The distribution of the score vector depends only on $`Q`$, so these are the balancing prices for the original rows of $`V`$ as well. Let $`\mathcal B`$ be their balanced winning partition, and let $`\mathcal C`$ be the zero-price regular winning partition of $`V_*`$.

## 5. Assignment cost controls the distance to the winning cells

Let $`I(X)`$ be the cell label of the original partition. In the zero-sum price gauge, balance gives

```math
\mathbb E\bigl[v_{I(X)}\cdot X-\lambda_{I(X)}\bigr]=\sqrt F.
```

The expected assignment loss is therefore

```math
\delta=\mathbb E\left[
\max_i(v_i\cdot X-\lambda_i)
 -(v_{I(X)}\cdot X-\lambda_{I(X)})\right]
=\mathcal V(Q)-\sqrt F
\le\frac{\varepsilon}{c_q+\sqrt F}
\le C_q\varepsilon. \tag{13}
```

Every score difference has variance at least $`1/r`$, because $`Q\succeq P/(2r)`$. Its normal density is bounded by $`\sqrt{r/(2\pi)}`$, independently of its mean. If $`g(X)`$ is the largest adjusted score minus the second largest, the union bound over pairs gives, for all $`t>0`$,

```math
\mathbb P\{g(X)\le t\}
\le 2M\sqrt{r/(2\pi)}\,t. \tag{14}
```

If the original label is not the winning label and $`g(X)>t`$, its assignment loss exceeds $`t`$. Markov's inequality and (14) imply

```math
\mathbb P\{I(X)\ne I_{\mathcal B}(X)\}
\le C_q t+\delta/t.
```

Taking $`t=\sqrt\delta`$ when $`\delta>0`$, and using uniqueness of winners when $`\delta=0`$, proves

```math
\sum_i\gamma_d(A_i\mathbin{\triangle}B_i)
=2\mathbb P\{I(X)\ne I_{\mathcal B}(X)\}
\le C_q\sqrt\varepsilon. \tag{15}
```

## 6. Nearly regular winning cells are close to regular cones

If the winners of $`\mathcal B`$ and $`\mathcal C`$ differ, at least one pairwise score comparison changes sign. For nonzero vectors $`u,u_*`$ and a scalar $`b`$,

```math
\mathbb P\{\mathop{\mathrm{sgn}}(u\cdot X-b)
                 \ne\mathop{\mathrm{sgn}}(u_*\cdot X)\}
\le\frac{|b|}{\sqrt{2\pi}|u|}
     +\frac{\mathop{\mathrm{angle}}(u,u_*)}{\pi}. \tag{16}
```

The first term bounds the Gaussian interval between the thresholds zero and $`b`$. The second is the exact Gaussian sign-disagreement probability for two centered halfspaces. On the score lists here, both pairwise norms are bounded below by a positive constant depending only on $`q`$. The angle is at most $`C_q|u-u_*|`$, using the chord bound on the unit sphere.

Apply (16) to $`u=v_i-v_j`$, $`u_*=v_{*,i}-v_{*,j}`$ and $`b=\lambda_i-\lambda_j`$, then sum over pairs. Equations (10)–(12) give

```math
\sum_i\gamma_d(B_i\mathbin{\triangle}C_i)
\le C_q\bigl(\|V-V_*\|_F+\|\lambda(Q)\|\bigr)
\le C_q\sqrt\varepsilon. \tag{17}
```

The triangle inequality with (15) proves (1) when $`\varepsilon\le\varepsilon_q`$. For larger deficits, the sum of symmetric differences of two labelled partitions is at most two. Increasing $`K_q`$ to at least $`2/\sqrt{\varepsilon_q}`$ proves (1) for the remaining range, including $`F=0`$. Formula (2) follows because the squared $`L^2`$ difference of two indicators is their symmetric-difference probability.

## 7. What this would and would not supply for noise stability

There is a direct localization consequence. Let $`0<\rho<1`$ and suppose the balanced partition satisfies $`S_\rho(\mathcal A)\ge S_\rho(\mathcal C_*)-\eta`$, where $`\mathcal C_*`$ is any regular-simplex partition and $`\eta\ge0`$. The Hermite expansion and Parseval give

```math
S_\rho(\mathcal A)=\frac1q+\rho F(\mathcal A)+R_\rho(\mathcal A),
\qquad 0\le R_\rho(\mathcal A)\le\rho^2(1-1/q).
```

The same expansion gives $`S_\rho(\mathcal C_*)\ge1/q+\rho F_q`$. Consequently,

```math
\varepsilon\le\rho(1-1/q)+\eta/\rho.
```

Applying (1), some regular-simplex partition $`\mathcal C`$ therefore satisfies

```math
\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)
\le K_q\sqrt{\rho(1-1/q)+\eta/\rho}. \tag{18}
```

Thus any balanced optimizer, or any competitor meeting the simplex benchmark, is within $`O_q(\sqrt\rho)`$ in symmetric-difference distance as $`\rho\downarrow0`$. This is localization, not exact optimality at any fixed positive correlation.

The metric in (2) is the product $`L^2`$ partition metric, minimized over rotations and labels when needed. Heilman's [2014 paper](https://arxiv.org/pdf/1211.7138v2), Lemma 2.8, obtains exponent $`1/8`$ for the unrestricted three-cell first-moment problem. Section 8 says a corresponding balanced stability estimate is needed beyond three cells. The all-cell bound above supplies this type of geometric estimate, assuming the credited covariance identities.

It does not automatically extend the 2014 proof. That proof optimizes a correlation derivative over unrestricted three-cell partitions, using the fact that the unrestricted propeller optimum has three equal cells. For more cells, the unrestricted first-moment optimum can discard labels, and the balanced problem introduces volume multipliers in its first variation. The feedback lemma and those multipliers still require a separate argument. No all-correlation or small-correlation Standard Simplex theorem is asserted here.

## 8. Sharpness of the exponent

This construction was supplied by the independent root review. Fix a regular-simplex partition in $`\mathbb R^{q-1}`$ and a pair of cells $`C_i,C_j`$. Let $`n`$ be the unit normal to their interface pointing into $`C_i`$. Choose a compact patch $`D`$ of positive Gaussian surface measure in the relative interior of that interface, away from its boundary. There is $`t_0>0`$ such that, for $`y\in D`$ and $`|s|<2t_0`$, the point $`y+sn`$ lies in $`C_i`$ when $`s>0`$ and in $`C_j`$ when $`s<0`$.

For $`0<t<t_0`$, exchange the labels on $`D\times(0,t)`$ and $`D\times(-t,0)`$, leaving every other point unchanged. Reflection in the interface preserves Gaussian measure, so all cell masses stay exactly $`1/q`$. The resulting partition is denoted $`\mathcal A_t`$.

Let $`\phi(s)=(2\pi)^{-1/2}e^{-s^2/2}`$, and let $`p_D`$ be the standard Gaussian measure of $`D`$ in the $`q-2`$ dimensional interface hyperplane. The changed tangential moments cancel. The two changed moment vectors are

```math
m_i(t)=m_i-h(t)n,\qquad m_j(t)=m_j+h(t)n,
```

```math
h(t)=2p_D\int_0^t s\phi(s)\,ds
=2p_D[\phi(0)-\phi(t)]=\Theta_q(t^2).
```

The regular moment difference is $`m_i-m_j=\ell n`$ for a fixed $`\ell>0`$. Thus

```math
F_q-F(\mathcal A_t)=2h(t)[\ell-h(t)]=\Theta_q(t^2). \tag{19}
```

Now compare $`A_{t,i}`$ with any convex set $`E_i`$. For each $`y\in D`$, the section $`\{s:y+sn\in E_i\}`$ is an interval, possibly empty or unbounded. On the three successive intervals $`(-t,0)`$, $`(0,t)`$, $`(t,2t)`$, the indicator of $`A_{t,i}`$ has values one, zero, one. Every interval differs from this pattern on a set of Lebesgue length at least $`t`$: if it meets both occupied intervals, it contains the intervening gap; otherwise it misses an entire occupied interval. The same lower bound follows by continuity if an endpoint is included or omitted.

Since $`\phi(s)\ge\phi(2t_0)>0`$ on this range, integration over $`D`$ gives

```math
\gamma_{q-1}(A_{t,i}\mathbin{\triangle}E_i)
\ge p_D\phi(2t_0)t. \tag{20}
```

Every cell of any rotated or relabelled regular-simplex partition is convex. Therefore (20) lower-bounds the total partition distance uniformly over all such comparisons. Equations (19)–(20) rule out any bound $`K_q\varepsilon^\alpha`$ with $`\alpha>1/2`$ as $`t\downarrow0`$. The $`L^2`$ exponent $`1/4`$ in (2) is correspondingly optimal for this metric.

# Localization with unrestricted cell masses

Working deduction, 21 November 2026. This note supplies dimension-independent
localization for a possible minimizer at a small negative correlation. It
also records the mass-error terms needed by the core lemma. The complete
negative-correlation comparison requires the separate weighted remainder,
potential, and tail estimates.

## 1. A dimension-independent balancing operation

Fix an integer $`q\ge3`$ and let $`f_1,\ldots,f_q`$ be any fractional
Gaussian partition: the functions are measurable, nonnegative, and sum to
one. Define

```math
p_i=\int f_i\,d\gamma_d,\qquad e_i=p_i-1/q,
\qquad m_i=\int x f_i(x)\,d\gamma_d(x),
\qquad M=(m_i)_{i=1}^q.
```

Both the entire moment matrix and each row obey

```math
\|M\|_F\le1,\qquad \|m_i\|\le1. \tag{1}
```

For the matrix estimate, the first Gaussian Hermite projection is an
orthogonal projection and
$`\sum_i\int f_i^2\,d\gamma_d\le\sum_i\int f_i\,d\gamma_d=1`$.
For the row estimate, apply Cauchy--Schwarz to its scalar projection in any
unit direction. These arguments do not introduce a factor depending on
$`d`$.

Put $`H=\sum_{e_j>0}e_j=\|e\|_1/2`$. If $`H=0`$, leave the partition
unchanged. Otherwise, define

```math
h(x)=\sum_{e_j>0}\frac{e_j}{p_j}f_j(x),
\qquad
\bar f_i(x)=
\begin{cases}
(1-e_i/p_i)f_i(x),&e_i>0,
\\ f_i(x)+(-e_i/H)h(x),&e_i<0,
\\ f_i(x),&e_i=0.
\end{cases} \tag{2}
```

Every denominator $`p_j`$ in this definition is at least $`1/q`$.
The functions remain nonnegative and sum to one. Since
$`\int h\,d\gamma_d=H`$, every new mass is exactly $`1/q`$.

Let $`N`$ be the moment matrix of the balanced fractional partition in
(2). If $`w=\sum_{e_j>0}(e_j/p_j)m_j`$, donor rows lose
$`(e_j/p_j)m_j`$ and receiver rows gain $`(-e_i/H)w`$. Consequently,

```math
\sum_i\|m_i-n_i\|
\le2\sum_{e_j>0}\frac{e_j}{p_j}\|m_j\|
\le2qH=q\|e\|_1.
```

Thus, with $`L=q^{3/2}`$,

```math
\|M-N\|_F\le L\|e\|. \tag{3}
```

The construction also makes every row of $`N`$ a linear combination of
the rows of $`M`$. In particular, it does not create a new moment direction.

## 2. The balanced first-moment inputs apply to fractional labels

Use the constants $`c=c_q`$ and $`C_{\mathrm g}>0`$ from
[NOISE_COMPARISON.md](NOISE_COMPARISON.md). The credited balanced
first-moment theorem and its covariance estimate imply, for the matrix
$`N`$ in (3),

```math
F_N:=\|N\|_F^2\le c^2,
\qquad
\|N-M_{\mathcal D}\|_F^2
\le C_{\mathrm g}(c^2-F_N) \tag{4}
```

for a regular-simplex partition $`\mathcal D`$ in every
$`d\ge q-1`$.

Here no passage from fractional labels to deterministic labels is
assumed. The previous covariance and global-alignment arguments use the
feasible-assignment inequality
$`\sqrt{F_N}\le\mathcal V(NN^T/F_N)`$. It holds directly for fractional
labels of the prescribed masses, because their normalized score payoff
is $`\sqrt{F_N}`$. The remaining covariance and polar estimates depend
only on the moment matrix. The case $`F_N=0`$ is included by the same
global bound, or directly by choosing any regular moment matrix.

Write $`F=\|M\|_F^2`$. Both moment norms are at most one by (1), so

```math
|F-F_N|\le2\|M-N\|_F\le2L\|e\|,
\qquad F\le c^2+2L\|e\|. \tag{5}
```

This is a global mass-error estimate. It avoids any assumption that the
balanced assignment prices remain bounded near singular covariances.

## 3. A negative-correlation competitor has small mass and moment errors

Now let the original labels be the indicators of a measurable partition
$`\mathcal A`$, without a mass restriction. For $`0\lt t\le1`$, the Hermite
expansion is

```math
S_{-t}(\mathcal A)=\sum_i p_i^2-tF+R_{-t}(\mathcal A),
\qquad |R_{-t}(\mathcal A)|\le t^2. \tag{6}
```

The remainder estimate follows by summing the nonnegative squared Hermite
coefficients of degrees at least two and taking absolute values of the
eigenvalues. Their total is at most one. The same bound applies to a
regular-simplex partition $`\mathcal C_0`$, whose masses are $`1/q`$ and
whose first-moment value is $`c^2`$.

Suppose the competitor satisfies

```math
S_{-t}(\mathcal A)\le S_{-t}(\mathcal C_0). \tag{7}
```

Since $`\sum_i p_i^2=1/q+\|e\|^2`$, equations (6)--(7) give

```math
\|e\|^2-t(F-c^2)\le2t^2. \tag{8}
```

Combining (5) and (8) yields
$`\|e\|^2-2Lt\|e\|-2t^2\le0`$. The positive root of this quadratic
therefore gives

```math
\|e\|\le K_e t,
\qquad K_e=L+\sqrt{L^2+2}. \tag{9}
```

Also, (8) implies $`F\ge c^2-2t`$. Thus the balanced fractional
partition constructed above has deficit

```math
0\le c^2-F_N
\le2t+2L\|e\|
\le K_Ft,
\qquad K_F=2+2LK_e. \tag{10}
```

Apply (4), then restore the difference between $`M`$ and $`N`$:

```math
\|M-M_{\mathcal D}\|_F
\le LK_et+\sqrt{C_{\mathrm g}K_Ft}. \tag{11}
```

Choose the regular partition $`\mathcal C`$ by the polar alignment of
the actual matrix $`M`$. It minimizes Frobenius distance from $`M`$ over
all regular moment matrices: those matrices have fixed norm $`c`$, and
the singular-value decomposition maximizes their inner product with
$`M`$ at its polar factor. An orthogonal extension handles deficient
rank because $`d\ge q-1`$. Hence (11) also holds with this particular
$`\mathcal C`$. For $`t\le1`$ it gives

```math
\|M-M_{\mathcal C}\|_F^2\le C_{\mathrm{loc}}t,
\qquad
C_{\mathrm{loc}}=2L^2K_e^2+2C_{\mathrm g}K_F. \tag{12}
```

All constants in (9)--(12) depend only on $`q`$. In particular, this is
localization around the same polar simplex whose full square moment
matrix is symmetric, as needed in the core argument.

## 4. Precise core hypotheses and the mass term

Use $`\delta_0,\kappa,K`$ for the local constants in
[CORE_COERCIVITY.md](CORE_COERCIVITY.md), decreasing
$`\kappa`$ so that $`0<\kappa\le1`$. If

```math
t\le\min\left\{
\frac1{16},\frac{c^2}{4},
\frac{\delta_0^2}{16C_{\mathrm{loc}}},
\frac{\delta_0}{4K_e}
\right\}, \tag{13}
```

then $`F\ge c^2/2>0`$,
$`\|M-M_{\mathcal C}\|_F\le\delta_0/4`$, and
$`\|e\|\le\delta_0/4`$.

Let the weighted tail estimate of
[NEGATIVE_POTENTIAL_TAIL.md](NEGATIVE_POTENTIAL_TAIL.md) give

```math
\|e_{\mathrm t}\|^2+\|M_{\mathrm t}\|_F^2
\le\eta_q(R)W_{\mathrm t},
\qquad \eta_q(R)\le\delta_0^2/16,
\qquad 0\le W_{\mathrm t}\le1. \tag{14}
```

Conditioning onto the polar score space preserves masses and moments.
After replacing its fractional labels by the regular labels outside the
radius $`R`$,

```math
M_{\mathrm c}=M-M_{\mathrm t},\qquad
e_{\mathrm c}=e-e_{\mathrm t}.
```

Thus the core moment distance and its mass error are both at most
$`\delta_0/2`$. These are within the local lemma's hypotheses. The
full aligned square moment matrix is symmetric, so the core skew part
is the negative tail skew part. Consequently,

```math
\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2
\le2\|e\|^2+2\eta_q(R)W_{\mathrm t}. \tag{15}
```

The original total mass error has not been set to zero. Combining the
local lemma with the exact core first-moment identity yields

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F^2
\le(2-\kappa)D_{\mathrm c}
 +2K\|e\|^2+2K\eta_q(R)W_{\mathrm t}. \tag{16}
```

Set

```math
\tau=\kappa/8,\qquad
K_m=2(1+\tau)K,\qquad
K_*=2(1+\tau)K+(1+\tau^{-1}).
```

Restoring the tail moment with the quadratic Young inequality gives

```math
\|M-M_{\mathcal C}\|_F^2
\le(2-\kappa/2)D_{\mathrm c}
 +K_m\|e\|^2+K_*\eta_q(R)W_{\mathrm t}. \tag{17}
```

Here the coefficient follows from
$`(1+\kappa/8)(2-\kappa)\le2-\kappa/2`$.
The additional term $`K_m\|e\|^2`$ is required for an unrestricted-mass
comparison. In the negative-noise identity it is multiplied by $`t`$,
while the exact degree-zero term contributes $`+\|e\|^2`$. This is the
specific mass balance needed by the subsequent absorption argument.

## Scope

The balancing construction, localization, and core moment estimate are
proved here. A minimum is never assumed to exist: (7) is imposed only on
a hypothetical partition whose value is no larger than the regular
benchmark. No negative-correlation extremum or full Standard Simplex
resolution is claimed from this note alone.

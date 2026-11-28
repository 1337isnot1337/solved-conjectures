# Standard Simplex conjecture: a small negative correlation regime

Proposed partial theorem, 21 November 2026. This note assembles a negative-correlation comparison for every fixed number of cells and every permitted ambient dimension. The competitors have arbitrary cell masses. The proof imports the explicitly credited balanced first-moment and covariance results used in the positive-correlation notes; it does not assume an unrestricted first-moment extremum. The complete named conjecture remains open outside the small correlation intervals treated here. The [root](NEGATIVE_ROOT_REVIEW.md), [algebra](NEGATIVE_ASSEMBLY_ALGEBRA_REVIEW.md), and [combinatorics](NEGATIVE_CORRELATION_COMBINATORICS_REVIEW.md) reviews found no gap in the written assembly. The [bounded negative-specific audit](NEGATIVE_PRIOR_AUDIT.md) is complete. These checks are not external acceptance or a worldwide-priority claim; no full-result entry or resolution count is attached to this note.

## 1. Statement

For a measurable partition $`\mathcal A=(A_1,\ldots,A_q)`$ of $`\mathbb R^d`$, set

```math
S_\rho(\mathcal A)
=\sum_{i=1}^q\langle1_{A_i},T_\rho1_{A_i}\rangle_{L^2(\gamma_d)},
\qquad
T_\rho f(x)=\int f(\rho x+\sqrt{1-\rho^2}\,y)\,d\gamma_d(y).
```

**Proposed partial theorem.** For each integer $`q\ge3`$, there is a number $`t_q>0`$ such that, in every dimension $`d\ge q-1`$ and for every measurable $`q`$-partition $`\mathcal A`$,

```math
S_{-t}(\mathcal A)\ge S_{-t}(\mathcal C)
\qquad(0\lt t\le t_q), \tag{1}
```

where $`\mathcal C`$ is a central regular-simplex partition. No constraint is imposed on $`\gamma_d(A_i)`$, and empty cells are allowed. Equality holds exactly for central regular-simplex partitions, up to orthogonal transformations, relabeling, and Gaussian null sets.

The threshold depends only on $`q`$. No useful numerical value or asymptotic size of this threshold is asserted. The Gaussian negative-correlation clause in the original Isaksson–Mossel conjecture has no equal-mass restriction; the separate discrete plurality parameter range is not a restriction on the Gaussian statement.

## 2. Inputs, normalization, and the cost

Put $`r=q-1`$, let $`Z_1,\ldots,Z_q`$ be independent standard normal variables, and set

```math
c=\frac{\mathbb E\max_{i\le q}Z_i}{\sqrt r},
\qquad \ell=c\sqrt{2/r},
\qquad \alpha=\frac1{16}.
```

Every regular-simplex partition has first-moment squared norm $`c^2`$ and moment-edge length $`\ell`$. The inputs used here are:

- The balanced first-moment extremum and covariance identities from the prior [8 October 2026 manuscript](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), with the quantitative deductions in [FIRST_MOMENT_STABILITY.md](FIRST_MOMENT_STABILITY.md).
- The global polar-alignment consequence in [NOISE_COMPARISON.md, Section 4](NOISE_COMPARISON.md#4-moment-coercivity-after-polar-alignment).
- The local coercivity lemma in [CORE_COERCIVITY.md](CORE_COERCIVITY.md), which permits unequal masses and includes a rotation error.
- The weighted, original-space Hermite bound in [WEIGHTED_NOISE.md](WEIGHTED_NOISE.md).
- The negative winner gap, compact-core limit, and weighted tail estimates in [NEGATIVE_POTENTIAL_TAIL.md](NEGATIVE_POTENTIAL_TAIL.md).
- The balancing construction and unrestricted-mass localization in [NEGATIVE_LOCALIZATION.md](NEGATIVE_LOCALIZATION.md).

The earlier balanced manuscript is an unrefereed public source. Its inputs are stated and checked in the first-moment notes; they are not new claims of this proof.

Use $`C_{\mathrm g}>0`$ for the global alignment constant: a balanced fractional partition with moment matrix $`N`$ admits a regular moment matrix satisfying

```math
\|N-M_{\mathcal D}\|_F^2
\le C_{\mathrm g}(c^2-\|N\|_F^2). \tag{2}
```

This estimate holds for fractional labels by the same feasible-assignment argument, without a purification assumption. Let $`\delta_0>0`$, $`0\lt\kappa\le1`$, and $`K\ge1`$ be local core constants. Decreasing $`\kappa`$ and increasing $`K`$ to these ranges preserves the core inequality

```math
\varepsilon_{\mathrm c}\ge\kappa D_{\mathrm c}
-K\left(\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2\right). \tag{3}
```

Here $`A_{\mathrm c}`$ is the square core moment matrix in regular coordinates, $`e_{\mathrm c}`$ is its mass error, and $`\varepsilon_{\mathrm c}`$ may be negative. The hypotheses are that its moment matrix is within $`\delta_0`$ of the fixed regular matrix and $`\|e_{\mathrm c}\|\le\delta_0`$.

For a chosen regular partition $`\mathcal C`$ with score space $`E`$, write $`z=P_E x`$ and let $`n_{ij}\in E`$ be the unit score-tie normal pointing toward $`C_i`$. Define

```math
h_i=1_{A_i}-1_{C_i},\qquad
g_{ij}=1_{A_i\cap C_j}-1_{A_j\cap C_i},
```

```math
W_\alpha
=\sum_{i\lt j}\int e^{-\alpha|z|^2}
\min(|n_{ij}\cdot z|,1)|g_{ij}(x)|\,d\gamma_d(x). \tag{4}
```

The core and tail costs $`W_{\mathrm c},W_{\mathrm t}`$ restrict this integral to $`|z|\le R`$ and $`|z|>R`$, respectively. Thus $`W_\alpha=W_{\mathrm c}+W_{\mathrm t}\le1`$. Define the core regular assignment cost

```math
D_{\mathrm c}
=\ell\sum_{i\lt j}\int_{|z|\le R}|n_{ij}\cdot z|\,
|g_{ij}(x)|\,d\gamma_d(x),
\qquad
W_{\mathrm c}\le D_{\mathrm c}/\ell. \tag{5}
```

These costs also apply to the conditioned fractional labels; the conditional absolute-transfer identity preserves their values.

## 3. Choose all constants before the competitor

Set

```math
b=\frac{2^{2-q}e^{-8}}{2\pi},\qquad
H=176(q-1)(8/7)^r,
\qquad L=q^{3/2},
```

```math
K_e=L+\sqrt{L^2+2},\qquad
K_F=2+2LK_e,\qquad
C_{\mathrm{loc}}=2L^2K_e^2+2C_{\mathrm g}K_F. \tag{6}
```

The weighted-tail note provides a function $`\eta_q^\alpha(R)\to0`$ such that

```math
\|e_{\mathrm t}\|^2+\|M_{\mathrm t}\|_F^2
\le\eta_q^\alpha(R)W_{\mathrm t}. \tag{7}
```

Put

```math
\tau=\kappa/8,\qquad
K_m=2(1+\tau)K,\qquad
K_*=2(1+\tau)K+(1+\tau^{-1}).
```

Fix $`R\ge2`$ large enough that

```math
\eta_q^\alpha(R)\le
\min\left\{\frac{\delta_0^2}{16},\frac b{2K_*}\right\}. \tag{8}
```

For this fixed radius, the compact negative-potential limit supplies $`t_{\mathrm c}>0`$ so that the core linear increase satisfies

```math
J_{t,\mathrm c}\ge(1-\kappa/8)tD_{\mathrm c}
\qquad(0\lt t\le t_{\mathrm c}). \tag{9}
```

The definition of $`J_t`$ is given in Section 6. Equivalently, (9) follows by integrating the pointwise compact-core estimate in the negative-potential note with relative error $`\kappa/8`$.

Choose

```math
t_q=\min\left\{
\frac1{16},\frac{c^2}{4},
\frac{\delta_0}{4K_e},
\frac{\delta_0^2}{16C_{\mathrm{loc}}},
\frac1{2K_m},
\frac{\kappa\ell}{8H},
\frac b{2H},t_{\mathrm c}
\right\}>0. \tag{10}
```

Only $`q`$ determines these choices. The covariance and core constants come first, then the radius, and finally the correlation threshold. None depends on the ambient dimension or on a competitor.

## 4. Localization without equal masses

Fix $`0\lt t\le t_q`$ and a partition $`\mathcal A`$. It suffices to consider the case

```math
S_{-t}(\mathcal A)\le S_{-t}(\mathcal C_0), \tag{11}
```

where $`\mathcal C_0`$ is any regular-simplex partition. All regular partitions have the same noise value by orthogonal invariance. No existence of a minimizer is assumed.

Let

```math
p_i=\gamma_d(A_i),\qquad e=p-\mathbf1/q,\qquad
m_i=\int_{A_i}x\,d\gamma_d(x),\qquad
M=(m_i)_{i=1}^q,\qquad F=\|M\|_F^2.
```

The Hermite expansion and $`\sum_i\|1_{A_i}\|_2^2=1`$ give

```math
S_{-t}(\mathcal A)=\frac1q+\|e\|^2-tF+\mathcal R_A,
\qquad |\mathcal R_A|\le t^2.
```

The same remainder estimate holds for the regular partition. Hence (11) implies

```math
\|e\|^2-t(F-c^2)\le2t^2. \tag{12}
```

The proportional balancing construction in the localization note gives a balanced fractional partition with moment matrix $`N`$ satisfying

```math
\|M-N\|_F\le L\|e\|,\qquad
\|N\|_F^2\le c^2,\qquad
|F-\|N\|_F^2|\le2L\|e\|.
```

Every donor cell has mass at least $`1/q`$, so this estimate has no small-denominator problem. Both moment norms are at most one by the first Hermite projection.

Combining these inequalities with (12), and then applying (2), proves

```math
\|e\|\le K_e t,\qquad
F\ge c^2-2t,\qquad
c^2-\|N\|_F^2\le K_Ft. \tag{13}
```

Choose $`\mathcal C`$ by polar alignment of the **actual** matrix $`M`$. Its regular moment matrix is the Frobenius-nearest regular moment matrix to $`M`$. The localization note consequently gives

```math
\|M-M_{\mathcal C}\|_F^2\le C_{\mathrm{loc}}t. \tag{14}
```

This is the same chosen simplex used from now on. The regular matrix in (2) is only an intermediate comparison and is not substituted for this actual polar simplex.

By (10), (13), and (14),

```math
F\ge c^2/2>0,\qquad
\|e\|\le\delta_0/4,\qquad
\|M-M_{\mathcal C}\|_F\le\delta_0/4. \tag{15}
```

A partial polar isometry can be extended because $`d\ge r`$. Its $`r`$ dimensional score space $`E`$ contains all rows of $`M`$. In regular coordinates on $`E`$, the full square moment matrix is symmetric positive semidefinite; the local neighborhood in (15) puts it in the required positive-definite neighborhood.

## 5. Core coercivity and restoration of the tail

Condition the original indicators on $`E`$:

```math
f_i(z)=\mathbb E[1_{A_i}(X)\mid P_EX=z].
```

Because the original moment rows lie in $`E`$, this preserves all masses and moments. It also preserves the absolute transfer costs and linear potential increase. It does not preserve the full noise value, which remains in $`\mathbb R^d`$ throughout Section 6.

Identify the moment matrices with their coordinates in $`E`$; this preserves their Frobenius norms. Replace $`f_i`$ by $`1_{C_i}`$ outside $`|z|\le R`$. The resulting core fractional partition has

```math
M_{\mathrm c}=M-M_{\mathrm t},\qquad
e_{\mathrm c}=e-e_{\mathrm t}. \tag{16}
```

The full mass error $`e`$ has not been set to zero. From (7), (8), (15), and $`W_{\mathrm t}\le1`$,

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F\le\delta_0/2,
\qquad
\|e_{\mathrm c}\|\le\delta_0/2. \tag{17}
```

The rectangular-to-square moment map in regular coordinates is an isometry on centered rows, so (17) supplies the hypotheses of (3). Symmetry of the full aligned square matrix implies that the core skew part is the negative tail skew part. Therefore

```math
\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2
\le2\|e\|^2+2\eta_q^\alpha(R)W_{\mathrm t}. \tag{18}
```

The exact first-moment identity for the core fractional labels is

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F^2
=2D_{\mathrm c}-\varepsilon_{\mathrm c}.
```

Apply (3) and (18), then restore the tail with
$`|u+v|^2\le(1+\tau)|u|^2+(1+\tau^{-1})|v|^2`$. Since
$`(1+\kappa/8)(2-\kappa)\le2-\kappa/2`$, this yields

```math
\|M-M_{\mathcal C}\|_F^2
\le(2-\kappa/2)D_{\mathrm c}
+K_m\|e\|^2+K_*\eta_q^\alpha(R)W_{\mathrm t}
\le(2-\kappa/2)D_{\mathrm c}
+K_m\|e\|^2+(b/2)W_{\mathrm t}. \tag{19}
```

The $`K_m\|e\|^2`$ term is essential for unrestricted masses. Its coefficient in the noise comparison is multiplied by $`t`$, whereas the degree-zero contribution is exactly $`+\|e\|^2`$.

## 6. The original-space noise comparison

Define the linear increase

```math
J_t=\sum_i\langle h_i,T_{-t}1_{C_i}\rangle
=\sum_{i\ne j}\int_{C_i\cap A_j}
\bigl[T_{-t}1_{C_j}-T_{-t}1_{C_i}\bigr]\,d\gamma_d. \tag{20}
```

The negative winner gap and the compact-core estimate (9) give

```math
J_t\ge(1-\kappa/8)tD_{\mathrm c}+btW_{\mathrm t}. \tag{21}
```

Let $`P_j`$ denote projection onto total Hermite degree $`j`$ and put
$`R_{-t,d}=T_{-t}-P_0+tP_1`$. Expanding the original indicator functions, without conditioning their noise quadratic forms, gives the exact identity

```math
\begin{aligned}
\Delta_-&:=S_{-t}(\mathcal A)-S_{-t}(\mathcal C)
\\ &=2J_t+\|e\|^2-t\|M-M_{\mathcal C}\|_F^2
+\sum_i\langle h_i,R_{-t,d}h_i\rangle.
\end{aligned} \tag{22}
```

The weighted remainder theorem, including the partition-transfer factor, states

```math
\left|\sum_i\langle h_i,R_{-t,d}h_i\rangle\right|
\le Ht^2(W_{\mathrm c}+W_{\mathrm t})
\le Ht^2(D_{\mathrm c}/\ell+W_{\mathrm t}). \tag{23}
```

Its proof retains the identity operator on all unused coordinates. The indefinite negative remainder is controlled through its spectral absolute values by the positive remainder; it is not treated as a positive seminorm.

Combine (19), (21), (22), and (23):

```math
\Delta_-\ge
(1-K_mt)\|e\|^2+
t\left[
\left(\frac\kappa4-\frac{Ht}{\ell}\right)D_{\mathrm c}
+\left(\frac{3b}{2}-Ht\right)W_{\mathrm t}
\right].
```

The choices in (10) imply

```math
\boxed{\displaystyle
\Delta_-\ge
\frac12\|e\|^2+
t\left[\frac\kappa8D_{\mathrm c}+bW_{\mathrm t}\right]\ge0.
} \tag{24}
```

Thus any hypothetical competitor satisfying (11) has value at least the regular value. All other competitors already have strictly larger value. This proves (1).

## 7. Equality and scope

If $`S_{-t}(\mathcal A)=S_{-t}(\mathcal C)`$, it satisfies (11), so (24) forces

```math
e=0,\qquad D_{\mathrm c}=0,\qquad W_{\mathrm t}=0.
```

By (5), the entire weighted cost vanishes. The exponential weight is strictly positive at every finite point, and the normal weight vanishes only on a finite union of Gaussian null hyperplanes. The transfer functions therefore vanish almost everywhere. Hence $`\mathcal A=\mathcal C`$ up to null sets for the chosen polar labels. Orthogonal changes and relabelings preserve the noise value, proving the equality description.

The argument uses the balanced first-moment theorem only after an explicit balancing operation or in the local unequal-mass assignment comparison. It never assumes a global unrestricted first-moment extremum. It also never substitutes a conditioned noise value for the original one.

This is an all-cell, dimension-independent **small-negative-correlation partial theorem**. It does not settle the full negative interval or the full Standard Simplex conjecture, and it is not counted as a named-conjecture resolution. The completed [negative-specific primary/search audit](NEGATIVE_PRIOR_AUDIT.md) and [independent archive comparison](NEGATIVE_ARCHIVE_COMPARISON.md) record the exact earlier three-cell and first-moment overlaps, with their limits. They do not assert worldwide priority.


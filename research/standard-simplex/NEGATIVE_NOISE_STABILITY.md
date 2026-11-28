# Standard Simplex conjecture: quantitative stability at negative correlation

Proposed quantitative corollary, 21 November 2026. This note strengthens the reviewed small-negative-correlation theorem in [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md) after decreasing its threshold. It controls both the cell-mass imbalance and ordinary Gaussian distance from a regular-simplex partition. The argument uses the same explicitly credited balanced first-moment input. It is a corollary within the partial research program, not a resolution of the full Standard Simplex conjecture or a new standalone target.

## 1. Statement and metric

Fix $`q\ge3`$ and $`d\ge q-1`$. Let $`\mathscr S_{q,d}`$ be the central regular-simplex partitions of $`\mathbb R^d`$, allowing all orthogonal transformations and label permutations. For any measurable $`q`$-partition $`\mathcal A`$, define

```math
d_{\mathscr S}(\mathcal A)
=\inf_{\mathcal D\in\mathscr S_{q,d}}
\sum_i\gamma_d(A_i\mathbin{\triangle}D_i),
\qquad
e_i=\gamma_d(A_i)-1/q.
```

No mass constraint is imposed on $`\mathcal A`$, and empty cells are permitted. Since the total symmetric difference of two labeled partitions is twice their disagreement probability, $`0\le d_{\mathscr S}\le2`$.

For any regular partition $`\mathcal C`$, put

```math
\Delta_t^-(\mathcal A)
=S_{-t}(\mathcal A)-S_{-t}(\mathcal C).
```

The value on the right does not depend on the orientation or labeling of the regular benchmark.

**Proposed quantitative corollary.** There are constants $`\widehat t_q,\nu_q^->0`$, depending only on $`q`$, such that every measurable partition in every $`d\ge q-1`$ satisfies

```math
\boxed{\displaystyle
\Delta_t^-(\mathcal A)
\ge\frac18\sum_{i=1}^q
 \left(\gamma_d(A_i)-\frac1q\right)^2
+\nu_q^-t\,d_{\mathscr S}(\mathcal A)^2
\qquad(0\lt t\le\widehat t_q).
} \tag{1}
```

The squared-distance power and the linear correlation scale in the second term are sharp, already among balanced competitors. No optimality is claimed for the mass coefficient $`1/8`$, the constants, or the correlation threshold.

## 2. Constants and weighted distance

Retain $`r=q-1`$, $`c,\ell,\delta_0,\kappa,K,C_{\mathrm g},L,K_e,K_F,H,b,t_q`$ from [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md). In particular,

```math
L=q^{3/2},\qquad
K_e=L+\sqrt{L^2+2},\qquad
K_F=2+2LK_e,
```

```math
H=176(q-1)(8/7)^r,\qquad
b=\frac{2^{2-q}e^{-8}}{2\pi}.
```

The radius $`R`$ and all core and tail constants remain exactly those of that theorem. Set

```math
K_F'=1+K_F+2L=3+2L(K_e+1),
\qquad
C_*=2L^2(K_e+1)^2+2C_{\mathrm g}K_F',
```

```math
a=\min\left\{
1,\frac{c^2}{6},
\frac{\delta_0}{4(K_e+1)},
\frac{\delta_0^2}{16C_*}
\right\}>0,
\qquad B=2L^2+2>1.
\tag{2}
```

Define

```math
M_q=\binom q2,\qquad
C_r=5(8/7)^{(r-1)/2},\qquad
v=\min(\kappa\ell/8,b)>0.
```

Choose

```math
\widehat t_q=\min(t_q,a/B),
\qquad
\nu_q^-=\min\left\{\frac a8,\frac{v}{4M_qC_r}\right\}>0.
\tag{3}
```

Since $`B>1`$, every $`t\le\widehat t_q`$ also satisfies $`t\le a\le1`$.

The [weighted-distance lemma](WEIGHTED_DISTANCE.md) proves, for every chosen regular comparison $`\mathcal C`$,

```math
\left(\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)\right)^2
\le4M_qC_r W_\alpha(\mathcal A\mid\mathcal C),
\qquad \alpha=1/16.
\tag{4}
```

This estimate controls ordinary distance even though the cost has an exponentially decaying score-space weight. Its proof uses bounded transfer density, a normal-fiber mass bound, and a finite Gaussian exponential moment. It requires no balance, no moment-row-space assumption, and no conditioning of noise.

## 3. Small positive deficit gives the required polar neighborhood

Fix $`0\lt t\le\widehat t_q`$. By the underlying negative theorem, $`\Delta:=\Delta_t^-(\mathcal A)\ge0`$. First suppose

```math
\Delta\lt at. \tag{5}
```

This assumption allows a small positive deficit. The older optimality proof localized only competitors whose value was no larger than the regular benchmark; its localization cannot be applied here without the following extra argument.

Let $`M`$ be the actual moment matrix, $`F=\|M\|_F^2`$, and $`E=\|e\|`$. The exact Hermite expansion, with each individual remainder bounded by $`t^2`$, gives

```math
E^2-t(F-c^2)\le\Delta+2t^2\le at+2t^2.
\tag{6}
```

Use the proportional balancing construction of [NEGATIVE_LOCALIZATION.md](NEGATIVE_LOCALIZATION.md). Its balanced fractional moment matrix $`N`$ satisfies

```math
\|M-N\|_F\le LE,\qquad
F_N:=\|N\|_F^2\le c^2,\qquad
F-c^2\le2LE.
```

Equations (6) and these bounds imply

```math
E^2-2LtE-at-2t^2\le0.
```

Solving the scalar quadratic and using $`\sqrt{x+y}\le\sqrt x+\sqrt y`$ yields

```math
E\le Lt+\sqrt{(L^2+2)t^2+at}
\le K_et+\sqrt{at}
\le(K_e+1)a.
\tag{7}
```

The last step uses $`t\le a`$. Dropping the nonnegative $`E^2`$ in (6) gives

```math
F\ge c^2-a-2t\ge c^2-3a\ge c^2/2>0.
\tag{8}
```

Also,

```math
\begin{aligned}
0\le c^2-F_N
&\le a+2t+2LE
\\ &\le a+K_Ft+2L\sqrt{at}
\\ &\le K_F'a.
\end{aligned}
\tag{9}
```

Apply balanced global alignment to $`N`$, then use the Frobenius-nearest property of the regular matrix polar-aligned with the **actual** $`M`$. For that same regular partition $`\mathcal C`$,

```math
\begin{aligned}
\|M-M_{\mathcal C}\|_F^2
&\le2L^2E^2+2C_{\mathrm g}(c^2-F_N)
\\ &\le2L^2(K_e+1)^2a^2+2C_{\mathrm g}K_F'a
\\ &\le C_*a.
\end{aligned}
\tag{10}
```

Here $`a\le1`$ is used in the last inequality. The choices in (2) therefore give

```math
\|e\|\le\delta_0/4,\qquad
\|M-M_{\mathcal C}\|_F\le\delta_0/4.
\tag{11}
```

The moment row space lies in the chosen polar score space. After conditioning onto it, discarding the same fixed-radius tail, and identifying the centered square coordinates, (11) gives exactly the core hypotheses used in Sections 5–6 of the negative theorem. Its tail estimates require only $`W_{\mathrm t}\le1`$, not the sign assumption on $`\Delta`$.

Consequently, the algebra of those sections applies unchanged. It evaluates the higher-Hermite term in the original ambient space and gives

```math
\Delta\ge\frac12E^2+
t\left[\frac\kappa8D_{\mathrm c}+bW_{\mathrm t}\right]
\ge\frac12E^2+tvW_\alpha.
\tag{12}
```

Combining (4) and (12), and then taking the infimum over regular comparisons only on the distance side, proves

```math
\Delta\ge\frac12E^2+
\frac{v}{4M_qC_r}t\,d_{\mathscr S}(\mathcal A)^2
\qquad(\Delta\lt at).
\tag{13}
```

The comparison simplex entering all intermediate costs is the same one selected in (10).

## 4. Large deficits and the global mass term

Now suppose $`\Delta\ge at`$. The same balancing bound and the global Hermite remainder estimate imply, without a localization assumption,

```math
\Delta\ge E^2-2LtE-2t^2
\ge\frac12E^2-(2L^2+2)t^2
=\frac12E^2-Bt^2.
\tag{14}
```

The middle inequality is $`2LtE\le E^2/2+2L^2t^2`$. Since $`t\le a/B`$ and $`\Delta\ge at`$,

```math
Bt^2\le at\le\Delta.
```

Equation (14) then gives $`\Delta\ge E^2/4`$. Independently, $`d_{\mathscr S}\le2`$ gives $`\Delta\ge(a/4)t\,d_{\mathscr S}^2`$. Averaging these two lower bounds yields

```math
\Delta\ge\frac18E^2+
\frac a8t\,d_{\mathscr S}(\mathcal A)^2
\qquad(\Delta\ge at).
\tag{15}
```

Equations (13), (15), and the definition of $`\nu_q^-`$ prove (1) for every partition. All constants remain independent of ambient dimension.

## 5. Uniform sharpness from balanced reflected strips

Work first in the $`r=q-1`$ dimensional score space of a fixed regular-simplex partition. Choose a compact patch $`D`$ of positive Gaussian measure in the relative interior of a regular $`ij`$ facet, away from the other facets. It lies in the $`r-1`$ dimensional facet hyperplane. Let $`n`$ point into $`C_i`$, and let $`p_D>0`$ be the Gaussian measure of $`D`$ in that hyperplane. Fix $`0\lt u_0\le1/2`$ so that for $`y\in D`$ and $`|s|<2u_0`$, the point $`y+sn`$ has original label $`i`$ when $`s>0`$ and $`j`$ when $`s<0`$. Choose this patch and width once for each $`q`$; the larger-ambient-dimension construction below is their cylindrical extension.

For $`0\lt u\lt u_0`$, exchange the labels on $`D\times(0,u)`$ and $`D\times(-u,0)`$. Denote the modified partition by $`\mathcal A_u`$. Reflection preserves each mass exactly, so $`e=0`$. Extend the construction cylindrically in every unused coordinate.

For $`F_{ij}=1_{C_j}-1_{C_i}`$, Gaussian-kernel differentiation gives

```math
|\partial_nT_{-t}F_{ij}(x)|
\le\frac{t}{\sqrt{1-t^2}}\mathbb E|G_1|
\le K_0t,
\qquad
K_0=\frac{\sqrt{2/\pi}}{\sqrt{15/16}},
\tag{16}
```

because $`|F_{ij}|\le1`$ and $`t\le\widehat t_q\le1/16<1/4`$. The potential vanishes on the tie hyperplane by reflection. Thus

```math
|T_{-t}F_{ij}(y+sn)|\le K_0t|s|.
```

The linear increase and weighted transfer cost of the two strips satisfy

```math
J_t(\mathcal A_u\mid\mathcal C)
\le2K_0t\,p_D[\phi(0)-\phi(u)],
\qquad
W_\alpha(\mathcal A_u\mid\mathcal C)
\le2p_D[\phi(0)-\phi(u)].
\tag{17}
```

The second inequality uses $`e^{-\alpha|z|^2}\le1`$ and $`\min(|s|,1)\le|s|`$.

The operator $`T_{-t}`$ is indefinite, so its full quadratic term cannot be discarded as in the positive-correlation proof. Instead, the exact balanced identity gives

```math
\Delta_t^-(\mathcal A_u)
=2J_t-t\|M_{\mathcal A_u}-M_{\mathcal C}\|_F^2
+\sum_i\langle h_i,R_{-t,d}h_i\rangle
\le2J_t+Ht^2W_\alpha.
```

Use (17) and $`\phi(0)-\phi(u)\le\phi(0)u^2/2`$:

```math
0\le\Delta_t^-(\mathcal A_u)
\le(4K_0+2Ht)t\,p_D[\phi(0)-\phi(u)]
\le(2K_0+H\widehat t_q)p_D\phi(0)\,t u^2.
\tag{18}
```

The nonnegative lower bound is already given by the underlying theorem. No positivity of $`T_{-t}`$ was assumed.

On the three successive normal intervals $`(-u,0)`$, $`(0,u)`$, and $`(u,2u)`$, the modified cell $`A_{u,i}`$ has occupancy one, zero, one. Every interval differs from this pattern on a set of Lebesgue length at least $`u`$. A convex comparison cell has an interval on each such line, so for every regular comparison, even after an arbitrary ambient rotation or relabeling,

```math
d_{\mathscr S}(\mathcal A_u)
\ge p_D\phi(2u_0)u.
\tag{19}
```

For a larger ambient dimension, fix the unused coordinates before taking the normal-line section and then integrate over them. Convexity and the same constants remain valid.

The elementary upper comparison with the original regular partition also gives

```math
d_{\mathscr S}(\mathcal A_u)
\le4p_D\int_0^u\phi(s)\,ds
\le4p_D\phi(0)u.
\tag{20}
```

Together, (1) and (18)–(20) show that this balanced family has deficit of order $`tu^2`$ and partition distance of order $`u`$, uniformly for $`0\lt t\le\widehat t_q`$ and every $`d\ge q-1`$. Therefore the squared-distance exponent cannot be decreased with a fixed positive lower-bound coefficient. Fixing a nonzero small width and sending $`t`$ to zero also rules out replacing the factor $`t`$ by a uniformly larger scale. No sharpness claim is made for the mass coefficient.

## 6. Scope and dependencies

The underlying all-cell low-negative-correlation theorem and its [bounded negative-specific source audit](NEGATIVE_PRIOR_AUDIT.md) are the source boundary for this corollary. The weighted-distance lemma adds the quantitative transfer estimate; the small-positive-deficit localization is established explicitly in Section 3 rather than inferred from a no-worse-competitor argument.

The prior balanced first-moment extremum and covariance identities remain credited to their public unrefereed source. The theorem does not cover all negative correlations, optimize the constants, or settle the full Standard Simplex conjecture. This addition creates no result-table entry and no resolution count.


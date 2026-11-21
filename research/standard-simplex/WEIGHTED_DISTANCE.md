# Weighted transfer cost controls ordinary partition distance

Research lemma, 21 November 2026. This note proves an unweighted mass and partition-distance estimate from the exponentially weighted cost used in the negative-correlation comparison. Its constants depend only on the score-space dimension. No balance hypothesis or optimality claim is needed.

## 1. A weighted mass estimate

Put $`\alpha=1/16`$. For $`r\ge1`$, define

```math
C_r=5(8/7)^{(r-1)/2}.
```

For every measurable $`g:\mathbb R^r\to[0,1]`$ and every unit vector $`n`$,

```math
\left(\int g\,d\gamma_r\right)^2
\le C_r\int e^{-\alpha|z|^2}
 \min(|n\cdot z|,1)\,g(z)\,d\gamma_r(z).
\tag{1}
```

### Proof

Rotate coordinates so $`z=(s,y)`$ and $`s=n\cdot z`$. Fix $`y`$ temporarily. Split the fiber mass and its weighted cost into the regions $`|s|\le1`$ and $`|s|>1`$:

```math
a_{\mathrm n}=\int_{|s|\le1}g(s,y)\,d\gamma_1(s),
\qquad
a_{\mathrm f}=\int_{|s|>1}g(s,y)\,d\gamma_1(s),
```

```math
b_{\mathrm n}=\int_{|s|\le1}e^{-\alpha s^2}|s|g(s,y)\,d\gamma_1(s),
\qquad
b_{\mathrm f}=\int_{|s|>1}e^{-\alpha s^2}g(s,y)\,d\gamma_1(s).
```

The normal mass estimate in [NOISE_COMPARISON.md, Section 1.1](NOISE_COMPARISON.md#11-a-one-dimensional-mass-estimate) gives

```math
a_{\mathrm n}^2
\le4\phi(0)\int_{|s|\le1}|s|g(s,y)\,d\gamma_1(s)
\le4\phi(0)e^\alpha b_{\mathrm n}.
\tag{2}
```

Weighted Cauchy--Schwarz and $`g\le1`$ give

```math
a_{\mathrm f}^2
\le b_{\mathrm f}\int_{|s|>1}e^{\alpha s^2}g(s,y)\,d\gamma_1(s)
\le(1-2\alpha)^{-1/2}b_{\mathrm f}
=\sqrt{8/7}\,b_{\mathrm f}.
\tag{3}
```

The constants can be bounded without numerical approximation:
$`\phi(0)<1/2`$, $`e^{1/16}\le16/15`$, and $`\sqrt{8/7}<2`$. Hence

```math
(a_{\mathrm n}+a_{\mathrm f})^2
\le2a_{\mathrm n}^2+2a_{\mathrm f}^2
\le5(b_{\mathrm n}+b_{\mathrm f}).
\tag{4}
```

Indeed, the near coefficient is less than $`64/15<5`$ and the far coefficient is less than $`4<5`$.

Write $`a(y)=a_{\mathrm n}+a_{\mathrm f}`$ and $`b(y)=b_{\mathrm n}+b_{\mathrm f}`$. Weighted Cauchy--Schwarz in the tangent variables gives

```math
\begin{aligned}
\left(\int a(y)\,d\gamma_{r-1}(y)\right)^2
&\le
 \left(\int e^{\alpha|y|^2}\,d\gamma_{r-1}(y)\right)
 \left(\int e^{-\alpha|y|^2}a(y)^2\,d\gamma_{r-1}(y)\right)\\
&\le
 5(1-2\alpha)^{-(r-1)/2}
 \int e^{-\alpha|y|^2}b(y)\,d\gamma_{r-1}(y).
\end{aligned}
```

This is (1). In dimension $`r=1`$, the tangent integral is over a point and its exponential moment is one, so the same proof applies with $`C_1=5`$. All integrals are finite because $`\alpha<1/2`$.

## 2. Original-space partition distance

Let $`\mathcal C=(C_1,\ldots,C_q)`$ be a regular-simplex partition in $`\mathbb R^d`$, with score space $`E`$ of dimension $`r=q-1`$. Let $`\mathcal A`$ be any measurable $`q`$-partition, with arbitrary masses. Write

```math
g_{ij}(x)=1_{A_i\cap C_j}(x)-1_{A_j\cap C_i}(x),
\qquad
\mu_{ij}=\int|g_{ij}|\,d\gamma_d,
\qquad
M_q=\binom q2.
```

For each unordered pair, condition its absolute transfer on $`z=P_E x`$:

```math
G_{ij}(z)=\mathbb E[|g_{ij}(X)|\mid P_EX=z].
```

Then $`0\le G_{ij}\le1`$. Applying (1) with the pair normal $`n_{ij}\in E`$ gives

```math
\mu_{ij}^2
\le C_r\int e^{-\alpha|P_Ex|^2}
 \min(|n_{ij}\cdot x|,1)|g_{ij}(x)|\,d\gamma_d(x).
\tag{5}
```

This is simply conditioning of a nonnegative integral; it makes no assertion about conditioning the noise operator or about the partition's moment row space.

At a point whose labels in $`\mathcal A`$ and $`\mathcal C`$ differ, exactly one unordered pair has absolute transfer one. Thus

```math
\sum_i\gamma_d(A_i\triangle C_i)
=2\sum_{i\lt j}\mu_{ij}.
\tag{6}
```

Cauchy--Schwarz over the $`M_q`$ unordered pairs and (5) prove

```math
\boxed{\displaystyle
\left(\sum_i\gamma_d(A_i\triangle C_i)\right)^2
\le4M_qC_r W_\alpha(\mathcal A\mid\mathcal C).
}
\tag{7}
```

The same constant works for every orientation of the score space and in every ambient dimension $`d\ge r`$. Taking the infimum of the distance over orthogonal images and relabelings of regular partitions can only decrease its left side for any chosen comparison simplex.

## 3. Scope for a stability application

The estimate controls ordinary Gaussian symmetric difference, although the comparison cost contains an exponentially decaying tangential weight. The boundedness of the transfer density and the Gaussian exponential moment are both used in the proof.

To turn (7) into a quantitative deficit theorem for all partitions, the noise lower bound must hold for the same chosen comparison simplex in a neighborhood specified by small positive deficit. The equality/optimality argument alone, which localizes competitors with value no larger than the regular benchmark, is not by itself that quantitative statement. A separate deficit dichotomy can supply this extension. This note asserts only (1) and (7); no named-conjecture result count changes.


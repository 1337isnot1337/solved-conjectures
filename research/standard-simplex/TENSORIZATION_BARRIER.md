# Standard Simplex conjecture

## Status of this note

This is a characterization of one proposed second-variation route. It is not a proof or disproof of the Standard Simplex conjecture, and no priority is claimed for the calculation. Product Mehler kernels and Hermite eigenfunctions already appear in Heilman's variational arguments, including Section 6 of [Hyperstable Sets with Voting and Algorithmic Hardness Applications](https://arxiv.org/pdf/2209.11216v1). The purpose here is to identify exactly what extra conditions can, and cannot, be obtained by adjoining independent Gaussian coordinates.

The conclusion applies to arbitrary numbers of cells and auxiliary coordinates. It is not a finite-dimensional check. It also does not establish that an optimizer is hyperstable.

## 1. The quadratic form

Let $`\mathcal A=(A_1,\ldots,A_q)`$ be a stationary partition of $`\mathbb R^n`$ for Gaussian noise stability at a fixed $`-1<\rho<1`$, $`\rho\ne0`$. In the positive-correlation problem, stationarity is for the Lagrangian obtained by subtracting the Gaussian-volume multipliers. In the negative-correlation problem considered here, volumes are unrestricted and the ordinary noise stability is stationary.

Work on relatively compact, smooth pieces of the interfaces, with the supports separated from the singular strata. This avoids imposing unproved regularity or compatibility at junctions. Let $`N_{ij}`$ point from $`A_i`$ into $`A_j`$, and let $`f_{ij}=-f_{ji}`$ be the normal component of a smooth variation. Define the signed surface measures

```math
\nu_i^f=\sum_{j\ne i}f_{ij}\,d\sigma_{ij},
\qquad \Sigma_{ij}=\partial A_i\cap\partial A_j.
```

Let $`G_{\rho,n}(x,y)`$ be the joint density of correlated standard Gaussian vectors in $`\mathbb R^n`$. The half-Hessian of the stationary Lagrangian has the form

```math
Q_\rho(f)=B_\rho(f)+L_\rho(f),
\qquad
B_\rho(f)=\sum_{i=1}^q
 \iint G_{\rho,n}(x,y)\,d\nu_i^f(x)\,d\nu_i^f(y),
```

```math
L_\rho(f)=\sum_{i<j}\int_{\Sigma_{ij}}
 a_{ij}(x)f_{ij}(x)^2\,d\gamma_n^{\partial}(x),
\qquad
a_{ij}(x)=\partial_{N_{ij}}T_\rho(1_{A_i}-1_{A_j})(x).
```

Here $`d\gamma_n^{\partial}(x)=\gamma_n(x)\,d\sigma(x)`$. This is the normal form obtained from Heilman's Lemma 4.5, equation (26), after the stationarity and volume-multiplier terms are cancelled. For a positive-correlation maximizer, Lemma 4.6 writes the coefficient as $`a_{ij}=-\lvert\nabla T_\rho(1_{A_i}-1_{A_j})\rvert`$. We do not require this sign for the tensorization identity.

The first variation of the $`i`$th volume is

```math
m_i(f)=\sum_{j\ne i}\int_{\Sigma_{ij}}f_{ij}\,d\gamma_n^{\partial}.
```

For the fixed-volume positive-correlation problem, admissible fields satisfy $`m_i(f)=0`$. The negative-correlation clause of the original conjecture does not impose these equations.

## 2. Exact splitting into auxiliary Hermite degrees

Consider the cylindrical partition $`\widetilde A_i=A_i\times\mathbb R^k`$. Let $`H_\alpha`$ be the orthonormal Gaussian Hermite polynomial of multi-degree $`\alpha`$, so

```math
\int H_\alpha H_\beta\,d\gamma_k=\delta_{\alpha\beta},
\qquad T_\rho H_\alpha=\rho^{|\alpha|}H_\alpha.
```

For a separated normal speed $`F_{ij}(x,z)=f_{ij}(x)H_\alpha(z)`$, the quadratic form is

```math
\widetilde Q_\rho(F)=\rho^{|\alpha|}B_\rho(f)+L_\rho(f). \tag{1}
```

Indeed, the joint Gaussian density factors as

```math
G_{\rho,n+k}((x,z),(y,w))
=G_{\rho,n}(x,y)G_{\rho,k}(z,w).
```

The auxiliary factor in the nonlocal term is therefore

```math
\iint H_\alpha(z)H_\alpha(w)G_{\rho,k}(z,w)\,dz\,dw
=\langle H_\alpha,T_\rho H_\alpha\rangle
=\rho^{|\alpha|}.
```

The cylindrical noise potential and its normal derivative are independent of $`z`$. The auxiliary factor in the local term is $`\int H_\alpha^2\,d\gamma_k=1`$. This proves (1).

More generally, for a finite Hermite sum

```math
F_{ij}(x,z)=\sum_\alpha f_{ij,\alpha}(x)H_\alpha(z),
```

orthogonality gives

```math
\widetilde Q_\rho(F)
=\sum_\alpha\bigl[\rho^{|\alpha|}B_\rho(f_\alpha)
                         +L_\rho(f_\alpha)\bigr]. \tag{2}
```

The volume derivative only sees the constant Hermite coefficient:

```math
\widetilde m_i(F)=m_i(f_0). \tag{3}
```

These identities are quadratic-form identities. They do not assume that an unbounded polynomial speed generates a globally admissible flow. To realize a nonconstant Hermite mode, first approximate it in $`L^2(\gamma_k)`$ by smooth compactly supported functions. Subtract a compactly supported smooth bump times the Gaussian mean to make the approximants have mean zero. The correction tends to zero because a nonconstant Hermite polynomial has zero mean. On the compact base support, both the boundary-kernel form and the local form are continuous in this auxiliary $`L^2`$ norm: $`T_\rho`$ is an $`L^2`$ contraction. The identities and sign tests then follow by passage to the limit. Constant modes can be approximated without the mean-zero correction. Formula (2) extends to convergent sums whenever the corresponding forms converge; no assertion about all singular-interface variations is needed here.

## 3. Positive correlation: degree one dominates every higher degree

For $`0<\rho<1`$, the nonlocal form is nonnegative:

```math
B_\rho(f)\ge0. \tag{4}
```

This is Heilman's Lemma 4.3, applied to each signed boundary measure. One can also verify it directly on the compact supports used here. Up to positive one-variable factors, the Mehler kernel is

```math
\exp\left(\frac{\rho}{1-\rho^2}x\cdot y\right).
```

Its uniformly convergent power expansion is a sum, with nonnegative coefficients, of kernels $`(x\cdot y)^r`$. Each such kernel is positive semidefinite because it is the inner product of the tensor powers $`x^{\otimes r}`$ and $`y^{\otimes r}`$. Integration against a finite signed measure preserves the resulting quadratic inequality.

For every integer $`d\ge1`$,

```math
\rho^d B_\rho(f)+L_\rho(f)
\le \rho B_\rho(f)+L_\rho(f). \tag{5}
```

Consequently, within the variation class above, all cylindrical fixed-volume second-variation inequalities for a local maximum are equivalent to the following two requirements:

1. $`B_\rho(f)+L_\rho(f)\le0`$ for base fields satisfying every volume constraint.
2. $`\rho B_\rho(f)+L_\rho(f)\le0`$ for arbitrary admissible base fields.

Necessity follows from the constant and degree-one auxiliary modes. Sufficiency follows from (2), (3), and (5). One extra Gaussian coordinate already realizes every nonnegative integer degree, so using more auxiliary coordinates creates multiplicities rather than new scalar factors.

The second requirement does allow base fields that do not preserve base volumes, because their degree-one auxiliary extension has zero mean. This is a real extra condition. Once it has been imposed, higher degrees give no additional condition for unrestricted partition variations.

If an additional symmetry is imposed on variations, the admissible degree-one mode can disappear. The conclusion must not be imported into such a smaller variation class. In particular, Heilman's Section 6 uses a degree-two mode in a centrally symmetric problem; that is consistent with the present calculation.

## 4. Negative correlation: degrees zero and one are the endpoints

Suppose $`-1<\rho<0`$. For every integer $`d\ge0`$,

```math
\rho\le\rho^d\le1.
```

For a fixed field $`f`$, the expression $`tB_\rho(f)+L_\rho(f)`$ is affine in $`t`$. It is nonnegative throughout $`[\rho,1]`$ if it is nonnegative at the two endpoints. Hence

```math
B_\rho(f)+L_\rho(f)\ge0,
\qquad \rho B_\rho(f)+L_\rho(f)\ge0 \tag{6}
```

imply every Hermite-mode second-variation inequality for a cylindrical local minimum. No positivity of $`B_\rho`$ is required.

The original negative-correlation conjecture minimizes over all cell masses. Therefore the same base field is permitted in both inequalities (6), and the equivalence is valid in the stated variation class. In a different problem with fixed masses, the degree-zero test would be restricted and this endpoint argument would not automatically apply to the unrestricted nonconstant modes.

## 5. Consequence for the current attack

Adding independent Gaussian coordinates and testing higher Hermite polynomials cannot supply an additional Hessian condition beyond the constant and linear auxiliary modes for the original optimization problems. A proof of the Standard Simplex conjecture still needs a classification or comparison principle in the base variables, or an argument beyond this second variation. The computation gives no reason that ordinary optimality implies Heilman's hyperstability condition at correlation zero.

The calculation was independently checked by the algebra lane on 21 November 2026. Its status is a documented route barrier, not a new conjecture resolution.

# Uniform local validity at every positive definite pair of equal matrices

Let $`X,Y`$ be positive definite Hermitian matrices of the same finite order. Suppose $`mI\le X,Y\le MI`$ for some $`0\lt m\le M`$. If
```math
M\lVert X-Y\rVert_{\mathrm{op}}\le m^2/16,
```
then Bourin's crossed-Heinz inequality holds simultaneously for all $`0\lt t\lt1`$ and all unitarily invariant norms. The bound is independent of the dimension, multiplicities and smallest spacing of distinct eigenvalues. It allows every finite joint condition number. At rank $`k`$, equality holds precisely when some $`k`$-dimensional maximizing spectral subspace of $`X+Y`$ is annihilated by $`X-Y`$. The condition gives a neighbourhood around every positive diagonal pair $`(C,C)`$, including matrices $`C`$ with repeated eigenvalues.

Bourin’s original Question 4 covers arbitrary pairs. Sababheh and Bourin's first version proves local validity about a fixed positive definite matrix with simple spectrum for a compact interval of exponents. The result here removes those restrictions and supplies a neighbourhood depending only on the stated spectral bounds. [Bourin, Question 4](https://arxiv.org/pdf/0805.1954#page=6) · [Sababheh and Bourin, first version, Theorem 5.1](https://arxiv.org/html/2610.04567v1#S5)

## A comparison between two rectangular operators

Rescale by $`m`$ so that $`I\le X,Y\le\kappa I`$ with $`\kappa=M/m`$. Put $`C=(X+Y)/2`$, $`D=X-Y`$, $`d=\lVert D\rVert_{\mathrm{op}}`$ and $`\epsilon=\kappa d\le1/16`$. All undecorated matrix norms below are operator norms, and the inner product of rectangular matrices is the real part of their Hilbert–Schmidt inner product. Write $`L_k`$ for a sum of the $`k`$ largest eigenvalues in decreasing algebraic order. For any isometry $`U`$ with $`k`$ columns set
```math
P=UU^*,\qquad C_U=U^*CU,\qquad Z=DU,\qquad
x=\lVert Z\rVert_F,\qquad
\delta_U=L_k(2C)-\mathop{\mathrm{tr}}(U^*(2C)U).
```
The leakage bound for the cutoff is
```math
\lVert CU-UC_U\rVert_F^2=\lVert(I-P)CU\rVert_F^2\le\kappa\delta_U .
```
In fact, write $`C-sI=H_+-H_-`$ at its $`k`$th largest eigenvalue $`s`$. The two nonnegative traces $`\mathop{\mathrm{tr}}(H_+(I-P))`$ and $`\mathop{\mathrm{tr}}(H_-P)`$ sum to $`\delta_U/2`$. Using $`H_\pm^2\le\lVert H_\pm\rVert H_\pm`$ and Cauchy–Schwarz, the squared off-diagonal norm is at most $`(\lVert H_+\rVert+\lVert H_-\rVert)\delta_U/2`$. The norms sum to the spectral diameter, which is at most $`\kappa-1`$.

For $`0\lt r\lt1`$, put $`c_r=\sin(\pi r)/(\pi r)`$, $`R_L(s)=(L+sI)^{-1}`$ and
```math
F_r=(X^r-Y^r)/r
=c_r\int_0^\infty s^r R_X(s)D R_Y(s)\,ds .
```
This follows by applying the scalar integral for the fractional power to each positive matrix and using the resolvent identity. Explicitly, the scalar power divided by $`r`$ is $`c_r\int_0^\infty s^{r-1}v/(s+v)\,ds`$ at $`v>0`$. The normalization $`c_r\int_0^\infty s^r/(s+1)^2\,ds=1`$ follows by differentiating at $`v=1`$. In particular $`\lVert F_r\rVert\le d`$.

For the fixed $`U`$, define the operator on rectangular matrices
```math
G_r(Z)=c_r\int_0^\infty s^r R_C(s) Z R_{C_U}(s)\,ds .
```
In orthonormal eigenbases of $`C`$ on the left and $`C_U`$ on the right, this is entrywise multiplication by $`(a^r-b^r)/(r(a-b))`$. For $`a=b`$ its value is $`a^{r-1}`$. Since $`1\le a,b\le\kappa`$, the mean value theorem bounds each multiplier between $`\kappa^{r-1}`$ and one. Both exponent factors use the same two bases, hence
```math
\lVert G_r(Z)\rVert_F\le x,\qquad
\langle G_t(Z),G_{1-t}(Z)\rangle\ge x^2/\kappa .
```

The relative comparison at $`U`$ is
```math
\lVert F_r U-G_r(Z)\rVert_F\le d\bigl(x+\sqrt{\kappa\delta_U}\bigr).
```
For its proof, subtract the integrands. Suppressing their common argument $`s`$, the difference is
```math
(R_X-R_C)D U R_{C_U}+R_XD(R_YU-U R_{C_U}).
```
Here $`R_X-R_C=-R_X(D/2)R_C`$ and $`R_YU-U R_{C_U}=-R_Y((CU-UC_U)-DU/2)R_{C_U}`$. Each resolvent has norm at most $`(1+s)^{-1}`$. The first term therefore has Frobenius norm at most $`d x/(2(1+s)^3)`$, and the second at most $`d(x/2+\sqrt{\kappa\delta_U})/(1+s)^3`$. Integration gives the estimate using $`(1+s)^{-3}\le(1+s)^{-2}`$.

## Absorbing both variational errors

Let $`U,V`$ be isometries of column number $`k`$, and use the quantities at $`U`$ defined above. Set $`z=\lVert U-V\rVert_F`$, $`a=x/\sqrt\kappa`$, $`b=\sqrt{\delta_U}`$ and $`W=a^2+b^2+z^2`$. Then
```math
\langle F_tU,F_{1-t}V\rangle\ge a^2-\alpha W,\qquad
\alpha=\tfrac92\epsilon+2\epsilon^2\lt1/2 .
```
To see this, first put $`V=U`$. Each error when replacing an $`F_rU`$ by $`G_r(Z)`$ is bounded by $`d\sqrt\kappa(a+b)`$. The sum of the two one-error products is at most $`2\epsilon a(a+b)\le3\epsilon(a^2+b^2)`$. The two-error term is at most $`2\epsilon^2(a^2+b^2)`$ since $`\kappa\ge1`$. Returning to general $`V`$ costs at most $`\lVert F_tU\rVert_F d z`$. The relative estimate bounds this by $`d\sqrt\kappa((1+d)a+db)z\le(3/2)\epsilon W`$, because $`d\le1`$ and $`2az,2bz\le W`$. Combining the bounds proves the claim.

Write $`T=X+Y`$, $`u=t(1-t)`$ and $`K=X^tY^{1-t}+Y^tX^{1-t}`$. The ordered identity $`T-K=uF_tF_{1-t}`$ holds for noncommuting inputs. Consequently
```math
L_k(T)-\Re\mathop{\mathrm{tr}}(U^*K V)
=(\delta_U+\delta_V)/2+
\tfrac12\mathop{\mathrm{tr}}((U-V)^*T(U-V))+
u\langle F_tU,F_{1-t}V\rangle .
```
Since $`T\ge2I`$, this is bounded below by
```math
u(1-\alpha)a^2+(1/2-u\alpha)\delta_U+
\tfrac12\delta_V+(1-u\alpha)z^2 .
```
The four coefficients are positive. Maximizing over $`U,V`$ proves the Ky Fan inequality for each $`k`$ and Ky Fan dominance gives every unitarily invariant norm. Equality forces $`U=V`$, $`\delta_U=0`$ and $`DU=0`$. Conversely such a $`U`$ spans a top subspace for $`C`$ reducing both inputs, on which their powers give $`K=T`$. It realizes equality in that rank.

The common spectral-band theorem controls two inputs throughout one absolute interval around a scalar. The present result permits an arbitrary positive spectrum and controls the distance between the two inputs. Neither hypothesis contains the other for all pairs. The argument here does not require the external operator-norm theorem.

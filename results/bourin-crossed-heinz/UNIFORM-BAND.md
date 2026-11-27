# A dimension-free neighbourhood of the scalar matrices

Let $`A,B`$ be Hermitian matrices of any common finite order, let $`M=\max(\|A\|_{\mathrm{op}},\|B\|_{\mathrm{op}})`$, and take a common shift $`\lambda\ge(3+2\sqrt2)M`$. Put $`X=\lambda I+A`$ and $`Y=\lambda I+B`$. For all $`0<t<1`$ and all unitarily invariant norms,

```math
\|X^tY^{1-t}+Y^tX^{1-t}\|\le\|X+Y\|.
```

The constant is absolute and is a sufficient bound. Equivalently, if both positive inputs have spectra in a common interval $`[a,b]`$ with $`0<a\le b\le\sqrt2\, a`$, the inequality holds simultaneously for all exponents and norms. Indeed one may take the common centre $`(a+b)/2`$ and radius $`(b-a)/2`$, since $`(\sqrt2+1)/(\sqrt2-1)=3+2\sqrt2`$. If $`a=b`$ both matrices are the same scalar matrix. The pair of zero inputs also gives equality. The matrices, their size, the exponents, the eigenvalue multiplicities and the singular-value ranks are unrestricted. We choose the units $`M=1`$ by homogeneity. The case $`M=0`$ gives equality directly.

Write $`S=A+B`$, $`D=A-B`$, $`C=S/2`$, $`T=2\lambda I+S`$ and $`u=t(1-t)`$. Thus $`\|D\|,\|S\|\le2`$, $`\|C\|\le1`$. Let $`L_k(S)`$ denote the sum of the largest $`k`$ eigenvalues of $`S`$. For an isometry $`U`$ with $`k`$ columns put $`P=UU^*`$ and

```math
\delta_U=L_k(S)-\mathop{\mathrm{tr}}(U^*SU),\qquad x_U=\|DU\|_F.
```


**Leakage from a nonmaximizing subspace.** Let $`s`$ be the $`k`$th eigenvalue in decreasing order, and $`H_+,H_-`$ the positive and negative parts of $`S-sI`$. Then

```math
\delta_U=\mathop{\mathrm{tr}}(H_+(I-P))+\mathop{\mathrm{tr}}(H_-P),\qquad
\|(I-P)SU\|_F^2\le (\|H_+\|+\|H_-\|)\delta_U\le4\delta_U.
```

Indeed the positive part contributes at most $`\|(I-P)H_+\|_F\le\sqrt{\|H_+\|\mathop{\mathrm{tr}}(H_+(I-P))}`$ to the off-diagonal norm. The negative part contributes at most $`\|H_-U\|_F\le\sqrt{\|H_-\|\mathop{\mathrm{tr}}(H_-P)}`$. Apply Cauchy–Schwarz and note that the two operator norms sum to the spectral diameter of $`S`$.

**A relative power estimate.** Set $`C_U=U^*CU`$. Both $`C`$ and $`C_U`$ have norm at most one, and $`\|CU-UC_U\|_F\le\sqrt{\delta_U}`$. Telescoping the powers gives $`\|C^jU-UC_U^j\|_F\le j\sqrt{\delta_U}`$ and hence

```math
\|D C^jU\|_F\le x_U+2j\sqrt{\delta_U}.
```

In the difference $`A^m-B^m`$, telescope $`A^m-C^m`$ and $`C^m-B^m`$ separately. Each contributes terms with $`D/2`$ in the middle and powers of $`C`$ on the right (for $`C^m-B^m`$ use the negative of $`B^m-C^m`$). Their left factors are contractions, so

```math
\|(A^m-B^m)U\|_F\le m x_U +m(m-1)\sqrt{\delta_U}.
```

For $`0<r<1`$ define $`F_r=(X^r-Y^r)/(r\lambda^{r-1})`$. In the absolutely convergent binomial expansion, the linear term is $`D`$, and $`|\binom{r}{m}|/r\le1/m`$. Consequently

```math
\|(F_r-D)U\|_F\le\frac{x_U}{\lambda-1}
 +\frac{\lambda\sqrt{\delta_U}}{(\lambda-1)^2}
 \le\eta(x_U+\sqrt{\delta_U}),\qquad \eta=\lambda/(\lambda-1)^2.
```

The estimate uses no eigenvalue gap or dimension-dependent factor.

**The variational deficit.** Let $`U,V`$ be isometries of the same column number and set $`z=\|U-V\|_F`$, $`W=x_U^2+x_V^2+\delta_U+\delta_V`$. With the real Hilbert–Schmidt inner product, the relative estimate gives

```math
\Re\langle F_tU,F_{1-t}V\rangle \ge
(x_U^2+x_V^2-4z^2)/2-\alpha W,\qquad
\alpha=\sqrt{2}\eta+\eta^2\le7/16
```

for $`\lambda\ge3+2\sqrt2`$. Indeed $`\lambda/(\lambda-1)^2\le1/4`$ at this threshold and thereafter, and $`\sqrt2/4+1/16\le7/16`$. For verification, the term without errors equals $`(x_U^2+x_V^2-\|D(U-V)\|_F^2)/2`$. The two one-error terms are bounded in total by $`\sqrt2\eta W`$ using $`x_U+\sqrt{\delta_U}\le\sqrt{2(x_U^2+\delta_U)}`$ and the arithmetic–geometric mean inequality. The two-error term is bounded by $`\eta^2W`$.

The ordered identity $`T-(X^tY^{1-t}+Y^tX^{1-t})=(u/\lambda)F_tF_{1-t}`$ also holds when $`X,Y`$ do not commute. As $`T\ge(2\lambda-2)I`$, the variational deficit of $`T`$ at $`U,V`$ is

```math
L_k(T)-\Re\mathop{\mathrm{tr}}(U^*TV)
=(\delta_U+\delta_V)/2+\tfrac12\mathop{\mathrm{tr}}((U-V)^*T(U-V))
\ge(\delta_U+\delta_V)/2+(\lambda-1)z^2.
```

It follows that the deficit of the crossed sum at the same two isometries is at least

```math
(1/2-\alpha u/\lambda)(\delta_U+\delta_V)
 +(\lambda-1-2u/\lambda)z^2+
 (u/\lambda)(1/2-\alpha)(x_U^2+x_V^2).
```

Every displayed coefficient is positive. Maximizing the real trace for the crossed sum over isometries gives its Ky Fan singular-value norm. The inequalities for every $`k`$ imply the assertion by Ky Fan dominance. Equality in rank $`k`$ holds precisely when a maximizing spectral subspace for $`S`$ is annihilated by $`D`$: the bound forces $`U=V`$, $`\delta_U=0`$, $`x_U=0`$, and any such isometry attains the common sum. This proof, including its equality criterion inside the ball, does not need the Tian–Xu theorem.

The result guarantees an absolute neighbourhood around a common scalar. The full positive cone in Bourin's question remains open. Sababheh and Bourin obtain the factorization above and a local result about a fixed simple-spectrum centre for a compact interval of exponents. The relative estimate and absorption of the two variational defects are the new steps.

[Question 4](https://arxiv.org/pdf/0805.1954#page=6) · [Source comparison and independent review](SHIFT-REVIEW.md) · [Asymptotic deficit](COMMON-SHIFT.md)

# Pruning bounds for averaged projection entropies

If the full optimizer of the averaged projection objective assigns mass $`e\le1/2`$ to the deleted traces, the inverse Hessian applied to the gradient at the conditional survivor law has Fisher norm $`O(\sqrt e)`$. For a finite deletion, the squared Hellinger distance between the two optimizers is $`O(e)`$ when the restricted optimizer and the conditional survivor law have uniformly close likelihood ratios. Both estimates apply to arbitrary linear costs. For approximate catalogues, a [nested learner with hidden restriction marks](hidden-restriction-marks.md) now gives a linear information bound. The general finite pruning question for the averaged objective remains open.

## The inverse along random restriction chains

Use the [averaged schedule from the fixed-pool proof](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#2-averaged-prediction-projections). There are $`N`$ coordinate tests on a finite alphabet. At scales $`m_j=d4^j`$ for $`0\le j\le J`$, with $`m_J\le N`$, let $`b_j=b_0\rho^{-j}`$ for $`0\le j\le J+1`$, where $`\rho=21/20`$ and $`b_0>0`$. Write $`\tau=b_{J+1}`$ and $`a_j=b_j-b_{j+1}`$. Choose a random nested chain $`\pi`$ of uniform coordinate subsets of sizes $`m_j`$, using the prefixes of a uniform permutation.

For a positive probability $`r`$ on the alphabet, work on $`\mathcal H=L^2_0(r)`$, the real mean-zero functions with inner product $`\langle f,g\rangle_r=\mathbb E_r[fg]`$. Let $`P_j^\pi`$ denote conditional expectation for the restriction to the $`j`$th subset. Extend the filtration by the trivial sigma field at $`-1`$ and the full sigma field at $`J+1`$, giving $`P_{-1}^\pi=0`$ and $`P_{J+1}^\pi=I`$ on $`\mathcal H`$. The mutually orthogonal increments are $`B_j^\pi=P_j^\pi-P_{j-1}^\pi`$ for $`0\le j\le J+1`$. Set

```math
B_j=\mathbb E_\pi B_j^\pi,\qquad
T_\pi=\sum_{j=0}^{J+1}b_j B_j^\pi=\tau I+\sum_{j=0}^J a_j P_j^\pi,\qquad
A=\mathbb E_\pi T_\pi.
```

For every $`f\in\mathcal H`$,

```math
\bigl(\mathbb E_\pi\|T_\pi A^{-1}f\|_r^2\bigr)^{1/2}
\le 2\|f\|_r .
\tag{1}
```

To prove this, define the isometry $`Wg=(B_j^{1/2}g)_j`$, the orthogonal projection $`\mathsf P=WW^*`$, and the block diagonal operator $`D=\mathop{\mathrm{diag}}(b_j I)`$. The $`ij`$ block of $`D\mathsf P D^{-1}-\mathsf P`$ is $`(b_i/b_j-1)B_i^{1/2}B_j^{1/2}`$. The fixed-pool overlap inequality gives $`\|B_i^{1/2}B_j^{1/2}\|\le2^{-(|i-j|-1)}`$ for $`i\ne j`$. Both the maximum row sum and column sum of the block norms are bounded by

```math
2\sum_{h\ge1}(\rho^h-1)2^{-(h-1)}=\frac8{19}.
```

The row and column sum bound therefore controls the operator norm by $`8/19`$. For $`y=DWg`$ we have $`D\mathsf P D^{-1}y=y`$, so $`\|y\|\le\|\mathsf P y\|+(8/19)\|y\|`$. Here $`\|\mathsf P y\|=\|WAg\|=\|Ag\|_r`$. Orthogonality along each chain also gives

```math
\|DWg\|^2=\sum_j b_j^2\langle g,B_jg\rangle_r
=\mathbb E_\pi\|T_\pi g\|_r^2 .
```

This proves (1) by taking $`g=A^{-1}f`$.

## A supermartingale estimate

For each fixed chain let $`Z^\pi_{-1},\ldots,Z^\pi_J`$ be a nonnegative supermartingale on the alphabet with law $`r`$, adapted to the restriction filtration. Use $`u^\circ=u-\mathbb E_r u`$ for centering. Then

```math
\left\|A^{-1}\mathbb E_\pi\sum_{j=0}^J a_j(Z_j^\pi)^\circ\right\|_r
\le 32\left(\mathbb E_\pi\left\|\max_{-1\le j\le J}Z_j^\pi\right\|_r^2\right)^{1/2}.
\tag{2}
```

For a fixed chain suppress $`\pi`$ from the notation and let $`Z^*=\max_j Z_j`$. Define $`D_\ell=\mathbb E_r[Z_{\ell-1}-Z_\ell\mid\mathcal F_{\ell-1}]\ge0`$ for $`0\le\ell\le J`$, $`V_{-1}=0`$, and $`V_j=\sum_{\ell=0}^jD_\ell`$. The process $`M_j=Z_j+V_j`$ is a martingale. Predictability and telescoping give

```math
\mathbb E_r\sum_{\ell=0}^J V_{\ell-1}D_\ell
=\mathbb E_r\sum_{\ell=0}^J V_{\ell-1}(Z_{\ell-1}-Z_\ell)
=\mathbb E_r\left(\sum_{\ell=0}^J D_\ell Z_\ell-V_JZ_J\right).
```

Since $`0\le D_\ell\le Z_{\ell-1}`$, expanding $`V_\ell^2-V_{\ell-1}^2`$ yields $`\mathbb E_r V_J^2\le3\mathbb E_r[V_J Z^*]`$. Thus $`\|V_J\|_r\le3\|Z^*\|_r`$ and $`\|M_J^\circ\|_r\le4\|Z^*\|_r`$.

For a test function $`f\in\mathcal H`$, put $`g=A^{-1}f`$ and $`w_\pi=T_\pi g`$. The martingale part of the sum inside (2) pairs with $`g`$ as $`\mathbb E_\pi\langle M_J^\circ,(T_\pi-\tau I)g\rangle_r`$. Its absolute value is at most $`8\|f\|_r(\mathbb E_\pi\|Z^*\|_r^2)^{1/2}`$ by Cauchy–Schwarz and (1), since $`\|(T_\pi-\tau I)g\|_r\le\|T_\pi g\|_r`$.

For the drift part, interchange the two sums to get $`\mathbb E_\pi\sum_{\ell=0}^J(b_\ell-\tau)D_\ell^\circ`$. Pairing the $`\ell=0`$ term with $`g`$ gives zero. For each $`\ell\ge1`$ predictability allows replacing $`g`$ by $`P_{\ell-1}^\pi g`$, and

```math
b_\ell P_{\ell-1}^\pi g
=\sum_{j=0}^{\ell-1}\frac{b_\ell}{b_j}(P_j^\pi-P_{j-1}^\pi)w_\pi.
```

The coefficients on the right are increasing in $`j`$ and at most one. Summation by parts therefore bounds the pointwise absolute value by $`2\max_{0\le j\le J}|P_j^\pi w_\pi|`$. Replacing $`b_\ell`$ on the left by $`b_\ell-\tau`$ preserves this bound. As the $`D_\ell`$ are nonnegative and sum to $`V_J`$, the absolute drift pairing is at most

```math
2\mathbb E_\pi\mathbb E_r\!\left[V_J\max_{0\le j\le J}|P_j^\pi w_\pi|\right]
\le 4\bigl(\mathbb E_\pi\|V_J\|_r^2\bigr)^{1/2}
       \bigl(\mathbb E_\pi\|w_\pi\|_r^2\bigr)^{1/2}.
```

The last inequality is Doob's $`L^2`$ maximal inequality applied to the conditional expectations of $`w_\pi`$, followed by Cauchy–Schwarz across chains. Using (1) and the drift bound gives $`24\|f\|_r(\mathbb E_\pi\|Z^*\|_r^2)^{1/2}`$. Adding the two parts and taking the dual norm proves (2).

## Application to the conditional law on survivors

Let $`q`$ minimize the original averaged objective on the full finite alphabet. Let $`E`$ be deleted, with $`e=q(E)\le1/2`$, and let $`r=q(\cdot\mid E^c)`$. Work on the survivor alphabet and use its operators from the preceding sections. For each chain, write $`q_j`$ and $`r_j`$ for the full and survivor laws projected onto the $`j`$th restriction. On the survivor alphabet define $`L_j(v)=q_j(v|_{M_j})/r_j(v|_{M_j})`$ and $`L_{-1}=1`$. This process is an $`r`$-supermartingale. On a parent cell with positive $`r`$ mass, the conditional expectation over its child cells sums precisely the $`q`$ masses of children having positive $`r`$ mass, then divides by the parent's $`r`$ mass. The sum is at most the parent's $`q`$ mass.

The mixture identity $`q=(1-e)r+q|_E`$, with $`q|_E`$ the unnormalized restriction, gives $`L_j\ge1-e`$. Therefore $`Y_j=L_j-(1-e)`$ is a nonnegative supermartingale with $`Y_{-1}=e`$. With $`Z_j=\log(1+Y_j/(1-e))`$, conditional Jensen gives another nonnegative supermartingale. The maximal inequality for $`Y`$ implies, for $`s>0`$,

```math
r(\max_j Z_j>s)\le
\min\left(1,\frac{e}{(1-e)(\exp(s)-1)}\right).
```

Integrating the tail against $`2s\,ds`$ gives $`\|\max_jZ_j\|_r^2\le C_0e`$ with an absolute $`C_0`$. For $`s\le1`$ use $`\exp(s)-1\ge s`$, and for $`s\ge1`$ use $`\exp(s)-1\ge(1-\exp(-1))\exp(s)`$.

Write $`F_{\rm surv}`$ for the unchanged objective restricted to the survivor simplex. Represent a tangent vector to the probability simplex at $`r`$ as $`r u`$ with $`u\in\mathcal H`$. The first derivative in direction $`r u`$ is $`\langle u,\nabla^\circ F_{\rm surv}(r)\rangle_r`$ and the second derivative in two such directions is the bilinear form of $`A`$. In fact each projected negative entropy has second derivative $`\langle P_j^\pi u,P_j^\pi v\rangle_r`$ in directions $`r u,r v`$, and full negative entropy contributes $`\langle u,v\rangle_r`$.

The stationarity equation at the positive full optimizer $`q`$ is constant over the full alphabet. Subtract it from the survivor gradient and center under $`r`$. The loss cancels and the full negative entropy contributes only the constant $`\tau\log(1/(1-e))`$, which centering removes. The surviving gradient is therefore

```math
\nabla^\circ F_{\rm surv}(r)
=\mathbb E_\pi\sum_{j=0}^J a_j(\log r_j-\log q_j)^\circ
=-\mathbb E_\pi\sum_{j=0}^J a_j Z_j^\circ ,
```

where the projected functions are evaluated at the survivor's restriction. Equation (2) now gives

```math
\|A^{-1}\nabla^\circ F_{\rm surv}(r)\|_r\le 32\sqrt{C_0e}.
```

For the speed interpretation, put $`h=\nabla^\circ F_{\rm surv}(r)`$ and minimize $`F_{\rm surv}(p)-(1-t)\mathbb E_p h`$. At $`t=0`$ the optimizer is $`r`$ by stationarity and strict convexity. Invertibility of $`A`$ gives its derivative $`-r A^{-1}h`$ there, by differentiating stationarity. Its Fisher norm is the bounded quantity above. Finite pruning would require control up to $`t=1`$, where the Hessian is evaluated at the new optimizer and the conditional-law supermartingale used in the proof need not be available along the path.

## Finite pruning under a likelihood-ratio bound

Let $`p`$ be the restricted optimizer, $`r=q(\cdot\mid E^c)`$ as above, and assume

```math
\max_{v\in E^c}\left|\frac{p(v)-r(v)}{p(v)+r(v)}\right|\le\frac1{100}.
```

Then $`H_2^2(p,q)\le C e`$ with a universal constant. The reference law for this proof is the midpoint $`\mu=(p+r)/2`$ on the survivors. Define $`h=(p-r)/(p+r)`$ and $`c=\|h\|_\infty`$. Use $`\mu`$ in all conditional expectation operators and centerings below.

Apply the estimate (2) also with the terminal stage $`J+1`$ included at weight $`\tau`$. In its proof the martingale pairing then uses $`T_\pi`$, and the drift weights are $`b_\ell`$. The same estimates give the same constant $`32`$. Write $`w_j=a_j`$ for $`j\le J`$ and $`w_{J+1}=\tau`$. For each chain put $`h_j=P_j^\pi h`$ and

```math
Y_j=\frac{(q|_E)_j}{(1-e)\mu_j}.
```

Here the numerator is the projection of the unnormalized removed mass, and $`Y_{J+1}=0`$ since the terminal projection identifies the full trace. By the same positive-child calculation as before, $`Y_j`$ is a nonnegative $`\mu`$-supermartingale starting from $`e/(1-e)`$ at the trivial stage. The densities of $`p_j`$ and $`q_j`$ with respect to $`\mu_j`$, evaluated in survivor cells, are $`1+h_j`$ and $`(1-e)(1-h_j+Y_j)`$.

For $`|x|\le c`$ let $`g_\pm(x)=\pm x-\log(1\pm x)`$. Both functions are nonnegative and convex. For each chain set $`K^\pm_j=\mathbb E_\mu[g_\pm(h)\mid\mathcal F_j]`$ and

```math
U^+_j=\log(1+h_j)-h_j+K^+_j,\qquad
U^-_j=\log(1-h_j+Y_j)+h_j+K^-_j .
```

The $`U^\pm`$ are supermartingales by conditional Jensen for the logarithm and the supermartingale property of its positive arguments. They are nonnegative because $`K^\pm_j\ge g_\pm(h_j)`$. In the minus case use also $`Y_j\ge0`$. Pointwise,

```math
U^+_j\le K^+_j,\qquad
U^-_j\le K^-_j+\log(1+Y_j/(1-c)).
```

Under $`\mu`$, Doob's $`L^2`$ inequality bounds each $`\max_j K^\pm_j`$ by $`2\|g_\pm(h)\|_\mu`$ in $`L^2`$. The maximal inequality for $`Y`$ and the same tail integral used above give $`\|\max_j\log(1+Y_j/(1-c))\|_\mu\le C_1\sqrt e`$, since $`1-c\ge1/2`$. These bounds hold for every chain.

Subtract the stationarity equation of $`q`$ from that of $`p`$ on survivors and center under $`\mu`$. The constants $`\log(1-e)`$ disappear. By the two definitions of $`U_j^\pm`$, the remaining weighted log ratio yields

```math
0
=2Ah
\mathbb E_\pi\sum_{j=0}^{J+1} w_j
  (U_j^+-U_j^- -K_j^+ + K_j^-)^\circ.
```

For a martingale $`K_j^\pm`$, its weighted centered sum, averaged over chains, is $`A(g_\pm(h))^\circ`$. Apply $`A^{-1}`$ and the terminal-stage form of (2). This gives

```math
2\|h\|_\mu
\le 65\bigl(\|g_+(h)\|_\mu+\|g_-(h)\|_\mu\bigr)
    +32C_1\sqrt e.
```

Integrating the derivatives of $`g_\pm`$ gives $`g_\pm(x)\le x^2/(2(1-c))`$. Thus the first term on the right is at most $`65c\|h\|_\mu/(1-c)\le\|h\|_\mu`$. It follows that $`\|h\|_\mu\le32C_1\sqrt e`$. Finally,

```math
H_2^2(p,r)=\mathbb E_\mu[2-2\sqrt{1-h^2}]\le2\|h\|_\mu^2,\qquad
H_2^2(r,q)=2-2\sqrt{1-e}\le2e.
```

The Hellinger triangle inequality proves the stated bound. For general support pruning the deleted mass does not directly give the required uniform bound on $`|h|`$. The computation isolates where large ratios would need additional control, through the terminal logarithmic remainders $`g_\pm(h)`$.

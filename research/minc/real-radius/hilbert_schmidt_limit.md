# Real van der Waerden radius

Let $`J_n`$ have entries $`1/n`$, let $`d_n=n!/n^n`$, and let $`B_n`$ be real with zero row and column sums. Suppose $`\|B_n\|_F\le L`$, $`\|B_n\|_{\rm op}\le\rho<1`$, and the largest Euclidean row and column norms tend to zero. Then, locally uniformly for complex $`|z|<1/\rho`$,

```math
\frac{\mathop{\mathrm{per}}(J_n+zB_n)}{d_n}-\det(I-z^2B_n^TB_n)^{-1/2}\longrightarrow0. \tag{1}
```

The square root has value one at zero. The Frobenius bound permits an unbounded sum of singular values. In particular if $`\|B_n\|_{\rm op}\to0`$ and $`\|B_n\|_F\le L`$, on every fixed compact set the normalized permanent differs from $`\exp(z^2\|B_n\|_F^2/2)`$ by $`o(1)`$. The entries of $`J_n+B_n`$ may be negative.

The [earlier nuclear-norm argument](diffuse-limit.md) proves (1) with an additional bound on the sum of singular values. Its Hall examples with operator norm tending to one prevent extending the positive-radius conclusion to every fixed spectral bound above one. The global sharp radius in each order remains open. The determinantal approximation originates with [McCullagh](https://arxiv.org/abs/1205.5723).

## Uniform coefficient estimate

Set $`a_{n,k}=(n)_k/n^k`$, where $`(n)_k=n!/(n-k)!`$, and let $`\sigma_k(B)`$ be the sum of all $`k`$-rowed subpermanents, with $`\sigma_0=1`$. For arbitrary real centered $`B`$ of any order with $`\|B\|_F\le L`$ and $`\|B\|_{\rm op}\le\rho`$, and every $`R>\rho`$, there is $`K=K(L,\rho,R)`$ such that

```math
a_{n,k}^{-1}|\sigma_k(B)|\le K R^k\qquad(0\le k\le n). \tag{2}
```

This estimate does not need diffuse rows or columns. In the remainder of its proof, constants independent of the order may depend on the displayed fixed parameters. The zero operator is immediate.

By the Gaussian pairing identity and Cauchy–Schwarz, it suffices to prove (2) for $`C=(BB^T)^{1/2}`$ and $`C=(B^TB)^{1/2}`$ separately. These are positive semidefinite, centered, and have the same singular values as $`B`$. For a standard proper complex Gaussian $`Z`$ with independent coordinates of variance one, circular symmetry and the pairing identity give

```math
F_C(t)=\mathbb E\prod_i|1+(\sqrt{tC}Z)_i|^2=\sum_{k=0}^n\sigma_k(C)t^k,\qquad \sigma_k(C)\ge0. \tag{3}
```

Here and below $`t\ge0`$. The mixed version pairs $`e_k(U\Sigma^{1/2}Z)`$ with $`e_k(V\Sigma^{1/2}Z)`$ for $`B=U\Sigma V^T`$. These identities also appear in the [centered coefficient estimate](../nov20-independent/sign/centered_permanental_coefficients.md).

### A shifted Gaussian estimate

Fix a smooth radial probability density supported on $`|w|<1/4`$ in the complex plane. Define $`h(z)`$ to be the average of $`\log|1+z+w|^2`$ under this density, minus $`2\mathop{\mathrm{Re}}z`$. Subharmonicity gives $`h(z)\ge\log|1+z|^2-2\mathop{\mathrm{Re}}z`$, with equality when $`|1+z|\ge1/4`$ by harmonicity. Convolution makes $`h`$ smooth even at $`z=-1`$. Its derivatives of orders two through four are bounded, $`\nabla h(0)=0`$, and $`|\Delta h(z)|\le C_0|z|^2`$ since the Laplacian vanishes near zero.

For any $`D\ge1`$, the tangent inequality for the logarithm gives

```math
h(z)+2\mathop{\mathrm{Re}}z\le\log D-1+|1+z|^2/D.
```

Outside the smoothing disk this is the ordinary logarithmic inequality. Inside it the averaged logarithm is at most $`\log(1/4)<-1`$, whereas the right side is at least $`-1`$. Consequently for every centered complex vector $`x`$, choosing $`D=1+\|x\|^2/n`$ gives

```math
\sum_i h(x_i)\le n\log(1+\|x\|^2/n). \tag{4}
```

Let $`Y`$ be proper complex Gaussian, centered in the sense $`\sum_iY_i=0`$ almost surely, with real covariance $`E\succeq0`$. Write $`\tau=\|E\|_{\rm op}`$ and $`V=\|E\|_F`$. There are absolute constants $`c,C>0`$ such that for $`\tau\le c`$ and every centered $`x`$,

```math
\mathbb E\prod_i|1+x_i+Y_i|^2\le \exp\{C(1+V^2)+C\tau\|x\|^2\}(1+\|x\|^2/n)^n. \tag{5}
```

To verify this, write the real coordinates of $`Y`$ as $`Tg`$ for a standard real Gaussian $`g`$, with covariance $`TT^T`$ given by two copies of $`E/2`$. Put $`H(g)=\sum_i h(x_i+Y_i)`$ and $`v_i=E_{ii}`$. Taylor expansion to order three in each isotropic complex marginal gives

```math
\mathbb EH\le\sum_i h(x_i)+C\sum_i(v_i|x_i|^2+v_i^2)\le\sum_i h(x_i)+C\tau\|x\|^2+CV^2.
```

Indeed the second-order contribution is $`v_i\Delta h(x_i)/4`$, all odd Gaussian moments vanish, and the fourth absolute moment is $`2v_i^2`$. Taylor expansion of the gradient gives $`\|\mathbb E\nabla h(x_i+Y_i)\|\le C(|x_i|+v_i)`$. Hence $`\|\mathbb E\nabla H\|^2\le C\tau(\|x\|^2+V^2)`$. The Hessian is $`T^T\mathop{\mathrm{diag}}(\nabla^2 h(x_i+Y_i))T`$. Its operator norm is at most $`C\tau`$, and its Frobenius norm is at most $`CV`$ by the Schatten Hölder inequality $`\|T^TDT\|_F\le\|T\|_4^2\|D\|_{\rm op}`$. Gaussian Poincaré applied to the components of the gradient now gives

```math
\mathbb E\|\nabla H\|^2\le C\{\tau\|x\|^2+(1+\tau)V^2\}.
```

For details of the exponential step, Gaussian rotation and Jensen give $`\mathbb E e^{H-\mathbb EH}\le\mathbb E\exp(\pi^2\|\nabla H\|^2/8)`$. Indeed one first subtracts $`H(g')`$ for an independent copy by Jensen, then integrates the directional derivative along $`g\cos\theta+g'\sin\theta`$, $`0\le\theta\le\pi/2`$. The velocity is an independent standard Gaussian at each angle. Applying Jensen in the angle and integrating the velocity proves the inequality. The same calculation for the $`C\tau`$-Lipschitz variable $`G=\|\nabla H\|`$ gives $`\Pr(G>\mathbb E G+u)\le\exp(-c_1 u^2/\tau^2)`$ with an absolute $`c_1>0`$. Use smooth approximations at $`G=0`$. For sufficiently small $`\tau`$, integration of this tail gives $`\mathbb E \exp(\pi^2 G^2/8)\le 2\exp(C\mathbb E G^2)`$, by $`G^2\le2(\mathbb E G)^2+2(G-\mathbb E G)_+^2`$. Together with (4) and centering this proves (5). The rotation and concentration method is classical. [Second-order Gaussian concentration](https://arxiv.org/abs/1709.06838)

### Restoring the finite factorials

Fix numbers $`\rho<r<r'<R`$ and a finite $`T>1/r'`$, to be increased below. Split $`C=C_1+C_2`$ at singular value $`\eta`$, putting the eigenvalues greater than $`\eta`$ into $`C_1`$. Its rank is at most $`L^2/\eta^2`$. Both Gaussian components remain centered. Condition on $`x=\sqrt{tC_1}Z_1`$ in (5) for independent noise of covariance $`tC_2`$, taking $`0\le t\le T`$ and $`T\eta\le c`$. With $`Q=\sum_j s_j|Z_{1,j}|^2`$ for the retained eigenvalues, this bounds $`F_C(t)`$ by

```math
C_{L,T}\,\mathbb E e^{\gamma Q}(1+tQ/n)^n,\qquad \gamma=CT^2\eta.
```

Choose $`\eta`$ small enough that $`\rho/(1-\gamma\rho)<r`$ and $`\gamma\rho<1`$. The exponential tilt of each independent mean-one exponential replaces its weight $`s_j`$ by $`s_j/(1-\gamma s_j)`$ and introduces a bounded normalizing factor because the retained rank is bounded. For the tilted $`Q'`$, $`\mathbb E(Q')^l/l!=h_l(s'_1,s'_2,\ldots)`$, the complete homogeneous polynomial. All $`s'_j`$ are bounded by a fixed number strictly below $`r`$, so $`\sum_l h_l(s')r^{-l}=\prod_j(1-s'_j/r)^{-1}`$ is bounded independently of $`n`$. Binomial expansion yields

```math
F_C(t)\le K_T\sum_{l=0}^n a_{n,l}(rt)^l \quad(0\le t\le T). \tag{6}
```

The constants may depend on $`T`$, but $`T`$ will be fixed. For small $`k\le\delta n`$, use $`t=1/r'`$ in (6) to get $`a_{n,k}^{-1}\sigma_k(C)\le K'(r'/(1-\delta))^k`$. Fix $`0<\delta<1`$ so small that this base is below $`R`$.

For $`k>\delta n`$ and $`k<n`$, choose $`t=\min(T,n/[r(n-k)])`$; take $`t=T`$ for $`k=n`$. When the cap is inactive the largest term $`a_{n,l}(rt)^l`$ occurs at $`l=k`$ (possibly tied), by the ratio $`(1-l/n)rt`$. When the cap is active, the term at $`k`$ is on the decreasing side of that sequence. Its ratio to the maximum is at least $`e^{-n/(rT)}`$, since the term at $`n`$ divided into the term at $`l`$ gives $`(n/(rT))^{n-l}/(n-l)!\le e^{n/(rT)}`$. Positivity in (3) and (6) therefore give

```math
a_{n,k}^{-1}\sigma_k(C)\le K_T(n+1)e^{n/(rT)}r^k.
```

Choose $`T`$ sufficiently large that $`r\exp(1/(rT\delta))<R`$. The polynomial factor is then absorbed into the remaining exponential margin for $`k>\delta n`$. Choosing $`\eta`$ after fixing $`T`$ completes (2).

## Fixed coefficients and passage to the limit

Use a real singular value decomposition and put $`X=U\Sigma^{1/2}Z`$, $`Y=V\Sigma^{1/2}Z`$. Both coordinate sums vanish, their covariance matrices have Frobenius norm at most $`L`$, and

```math
D=\sum_i X_i^2=\sum_iY_i^2=\sum_j s_j Z_j^2.
```

For $`X`$, write $`C_L=(BB^T)^{1/2}`$ and $`v=\max_i (C_L)_{ii}`$. Cauchy–Schwarz gives $`(C_L)_{ii}\le\sqrt{(BB^T)_{ii}}`$, so $`v\to0`$ by row diffuseness. The largest entry modulus of $`C_L`$ is at most $`v`$. For each fixed $`j\ge3`$, Wick pairing gives

```math
\mathbb E\left|\sum_i X_i^j\right|^2=j!\sum_{i,l}(C_L)_{il}^{\,j}\le j! v^{j-2}L^2=o(1).
```

The corresponding assertion for $`Y`$ follows by column diffuseness. Also $`\mathbb E|D|^2=2\sum s_j^2\le2L^2`$. Each homogeneous holomorphic Gaussian polynomial $`P`$ of fixed degree $`j`$ obeys $`\mathbb E|P|^{2q}\le (jq)!\,(\mathbb E|P|^2/j!)^q`$ for positive integers $`q`$. Indeed write $`P`$ with symmetric coefficient tensor $`T`$. Pairing gives $`\mathbb E|P|^2=j!\|T\|^2`$, and the coefficient tensor of $`P^q`$ is the orthogonal symmetrization of $`T^{\otimes q}`$. Thus the preceding convergence and boundedness statements hold in every fixed finite moment norm.

Newton's identity in formal power series expresses $`e_k(X)`$ as the coefficient of $`w^k`$ in $`\exp(\sum_{j=1}^k(-1)^{j-1}w^j\sum_iX_i^j/j)`$. The $`j=1`$ term vanishes. Hölder's inequality applied to this finite coefficient and the moment estimates just proved show that $`e_k(X)-[w^k]\exp(-w^2 D/2)`$ tends to zero in $`L^2`$. The same holds for $`Y`$ with the **same** $`D`$. The coefficient $`a_{n,k}^{-1}\sigma_k(B)`$ therefore differs by $`o(1)`$ from $`\mathbb E|[w^k]\exp(-w^2D/2)|^2`$ at fixed $`k`$, since $`a_{n,k}\to1`$. These latter numbers are precisely the coefficients of $`\det(I-z^2 B^TB)^{-1/2}`$. For real $`0\le z<1/\rho`$, expand $`\mathbb E e^{-z\mathop{\mathrm{Re}}D}`$ using circular symmetry, or integrate each independent pair of real Gaussians to obtain $`\prod_j(1-z^2s_j^2)^{-1/2}`$. The power-series identification follows near zero.

The comparison series has nonnegative coefficients and is bounded on each smaller positive radius $`t<1/\rho`$ by $`\exp(t^2L^2/(2(1-t^2\rho^2)))`$. The normalized permanent series has uniformly summable tails on each smaller disk by (2), since $`R`$ can be chosen arbitrarily close to $`\rho`$. Summing the fixed-coefficient comparisons proves (1) and convergence of derivatives on compact subdisks. When the operator norm tends to zero, $`\sum_j s_j^4\le\|B\|_{\rm op}^2 L^2\to0`$, so the logarithmic expansion of the determinant gives the asserted exponential model.

## Consequences and limits

For instance $`B_n=(I-J_n)/\sqrt n`$ has bounded Frobenius norm, vanishing operator norm and unbounded nuclear norm. The normalized permanent tends to $`\sqrt e`$. The diagonal entries of $`nB_n`$ have order $`\sqrt n`$ and its average absolute $`p`$th entry moment diverges for $`p>2`$, outside McCullagh's moderate-deviation hypotheses.

In the general diffuse class above, $`\mathop{\mathrm{per}}(J_n+B_n)>d_n`$ eventually for nonzero $`B_n`$. For $`\|B_n\|_F\le1/1000`$ use the [uniform local lower bound](../nov20-independent/inequalities/uniform_radial_permanent.md). Above that norm, the determinant is at least $`\exp(\|B_n\|_F^2/2)`$ and its gap from one is bounded below. The same replacement of the asymptotic in the [chord and Gram proof](diffuse-inequalities.md) gives eventual strict convexity of the radial permanent on $`[0,1]`$ and both strict self-Gram comparisons for nonuniform doubly stochastic inputs under the present Frobenius hypotheses. For completeness, the Gram matrices $`BB^T`$ and $`B^TB`$ have Frobenius norms at most $`\rho L`$ and their row norms are bounded by $`\rho`$ times those of $`B`$ and $`B^T`$, respectively. Thus (1) applies to all three factors, while the linked small-norm estimates cover arbitrarily small gaps. These results leave the unrestricted [radius](https://yair-lavi.com/mincs-list/problem-13/index.html), [chord inequality](https://yair-lavi.com/mincs-list/conjecture-34/index.html), and [Gyires inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html) open.

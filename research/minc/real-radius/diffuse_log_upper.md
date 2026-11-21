# Lih–Wang convexity inequality

**There is an absolute $a>0$ such that every doubly stochastic matrix with maximum entry at most $a$ satisfies the Lih–Wang half-chord inequality, strictly for a nonuniform endpoint and a positive coefficient of that endpoint.** The assertion holds for arbitrary weights and allows unbounded Frobenius distance from the uniform matrix, disconnected supports and normalized entries much larger than $1/n$. More generally, for each fixed $t_0<\sqrt{1-e^{-1}}$ the conclusion holds for $0<t\le t_0$ after possibly decreasing $a$. The proof does not give a numerical value for $a$. [Minc C34](https://yair-lavi.com/mincs-list/conjecture-34/index.html)

A second consequence is the strict [Gyires inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html) for all sufficiently small maximum entries under a fixed centered singular-value bound $\rho<1$ satisfying $-\log(1-\rho^4)<2\rho^2$, for example $\rho=0.95$. This also allows unbounded Frobenius distance. The unrestricted entries remain open.

## A Gaussian estimate with growing Frobenius norm

Let $C$ be a real positive semidefinite matrix with zero margins and $\|C\|_{\rm op}\le1$. Write $u=\operatorname{tr}(C^2)$, $v=\max C_{ii}$. For $0\le t\le s_0<1$, let $X=\sqrt{t C}\,Z$ for independent proper complex Gaussians of variance one, and define $F_C(t)=\mathbb E\prod_i |1+X_i|^2$. We prove
```math
 \log F_C(t)=-\tfrac12\log\det(I-t^2 C^2)+O_{s_0}(v u).                  \tag{1}
```
In particular the error is $o(u)$ when $v\to0$, with no bound on $u$. The determinant model has its origin in [McCullagh's permanent expansion](https://arxiv.org/abs/1205.5723). We need an upper bound at growing $u$ for general diffuse arrays; the [bounded-Frobenius theorem](hilbert_schmidt_limit.md) alone does not provide this.

Put $E=tC$. Almost surely $\sum X_i=0$. Remove the quadratic Taylor term from the log product by tilting its Gaussian law by $\exp(-\operatorname{Re}\sum_i X_i^2)$. The integral of this weight is $\det(I-E^2)^{-1/2}$ by one-dimensional Gaussian integration in each eigenmode. Under the normalized tilt, the vectors of real and imaginary parts $x,y$ are independent with covariances
```math
 R=E(I+E)^{-1}/2,\qquad S=E(I-E)^{-1}/2.
```
Write $z_i=x_i+\mathrm i y_i$, $v_i=R_{ii}+S_{ii}$ and $w_i=R_{ii}-S_{ii}$. The variances $R_{ii}, S_{ii}$ are each comparable to $E_{ii}$ when positive, with constants depending only on $s_0$; zero coordinates can be removed. We have $\max v_i\le K v$, $\sum v_i^2\le K u$, $\sum |w_i|\le K u$ and $\sum w_i^2\le Kvu$. These follow from spectral calculus, in particular $S-R=E^2(I-E^2)^{-1}\succeq0$. The covariance of all the real coordinates has bounded operator norm and squared Frobenius norm at most $K u$. Throughout, $K$ may change and depends only on $s_0$ and any fixed smooth cutoff chosen below.

The remaining log weight is $\sum_i g(z_i)$, where
```math
 g(z)=\log|1+z|^2-2\operatorname{Re}z+\operatorname{Re}z^2
 \ \le\ 2(\operatorname{Re}z)^2 .
```
The inequality is $\log w\le w-1$. Choose a radial smooth $0\le\chi\le1$, equal to one on $|z|\le\eta$ and zero beyond $2\eta$, with $\eta<1/8$ fixed sufficiently small below. Put $f=\chi g$ and $H=\sum_i f(z_i)$. Taylor expansion near zero starts with the real part of a cubic holomorphic polynomial. In particular $\|\nabla^2 f(z)\|\le K_1\min(\eta,|z|)$ with an absolute $K_1$ using a fixed cutoff rescaled by $\eta$.

We record the needed estimates on a standard real Gaussian driver $G$ of $(x,y)=T G$:
```math
 |\mathbb EH|\le Kvu,\qquad
 \mathbb E\|\nabla_G H\|^2\le Kvu,\qquad
 \|\nabla_G^2 H\|_{\rm op}\le K_2\eta .                      \tag{2}
```
For the mean expand each $f$ through degree five with sixth-order bounded remainder. Odd moments vanish. The quartic term is a multiple of $\operatorname{Re}z^4$, whose mean is $3w_i^2$. The absolute sixth moment is $O(v_i^3)$. For the mean gradient at one site the quadratic harmonic term gives $O(|w_i|)$ and the remaining error is $O(v_i^{3/2})$. Boundedness of $\|T\|_{\rm op}$ then bounds the squared norm of the mean driver gradient by $Kvu$. Gaussian Poincaré componentwise bounds the residual gradient variance by the expected squared Frobenius norm of its Hessian. That Hessian is $T^T\operatorname{diag}(\nabla^2 f(z_i))T$ with two-dimensional diagonal blocks. If $\Sigma=TT^T$, expand the square under the trace. Each pair of sites contributes at most $K\|\Sigma_{ij}\|_F^2 \mathbb E[|z_i||z_j|]\le Kv\|\Sigma_{ij}\|_F^2$. Summing proves the middle bound of (2). The final bound follows directly from the uniform Hessian bound for $f$. Its constant $K_2$ is independent of $\eta$.

For any fixed $p<\infty$, choosing $\eta$ small enough yields $\log\mathbb E e^{pH}\le p\mathbb EH+K_p vu$. For clarity, the Gaussian rotation and two Jensen inequalities give $\mathbb E e^{p(H-\mathbb EH)}\le\mathbb E e^{c_p W}$ with $W=\|\nabla_G H\|^2$, $c_p=\pi^2 p^2/8$. Subtract an independent copy by Jensen, integrate the derivative along the quarter-circle rotation of the two drivers, and apply Jensen to the normalized angular integral. The tangential velocity at fixed angle is an independent standard Gaussian. To see that the resulting bound has no order-dependent prefactor, note $\|\nabla W\|^2\le4(K_2\eta)^2W$. For $L(s)=\log\mathbb E e^{sW}$ the Gaussian logarithmic Sobolev inequality gives $sL'(s)-L(s)\le2s^2(K_2\eta)^2 L'(s)$. Integrating, or differentiating $(1/s-2(K_2\eta)^2)L(s)$, gives $L(s)\le s\mathbb EW/(1-2s(K_2\eta)^2)$ in its positive range. Apply (2).

The cutoff error needs care because large coordinates can be correlated. Fix $q>1$ close enough to one that $4q\kappa_R<1$ for $\kappa_R=s_0/[2(1+s_0)]$, which bounds $\|R\|_{\rm op}$. Take the preceding $p=q/(q-1)$ and choose $\eta$ accordingly. Pointwise,
```math
 g(z_i)-f(z_i)\le 2 x_i^2\,\mathbf1_{|z_i|>\eta}.
```
Condition first on $y$. Use Gaussian Hölder on the real coordinates with exponents $p_i=\kappa_R/R_{ii}$, so $R\preceq\operatorname{diag}(p_i R_{ii})$. For a site with $|y_i|>\eta/\sqrt2$ use the complete exponential of $2q x_i^2$. Its log after the Hölder power $1/p_i$ is $O(R_{ii})$, by $4q\kappa_R<1$. At every other site only $|x_i|>\eta/\sqrt2$ can contribute; its one-dimensional Gaussian integral has log after the same power at most $K R_{ii} e^{-c/R_{ii}}$. This follows by scaling to unit variance, for which the remaining Gaussian density still has a strictly negative quadratic exponent. Consequently the conditional log integral is at most
```math
 K\sum_i R_{ii}e^{-c/R_{ii}}+K\sum_i R_{ii}\mathbf1_{|y_i|>\eta/\sqrt2}.
```
Apply Gaussian Hölder again on $y$, this time with exponents $\kappa_S/S_{ii}$, $\kappa_S=s_0/[2(1-s_0)]$. The exponent on the rare event in each one-dimensional integral is bounded since $R_{ii}\le S_{ii}$. Its log after the outer power is at most $K S_{ii} e^{-c'/S_{ii}}$. The sum of the rare bounds is $O(\sum v_i^3)=O(vu)$. The Gaussian Hölder inequality in the covariance form used twice here is [Chen, Dafnis and Paouris, Theorem 1](https://arxiv.org/abs/1306.2410).

Ordinary Hölder now bounds the log integral of $\exp(\sum g(z_i))$ above by $O(vu)$. For a lower bound use Jensen under the tilted law. The previous Taylor mean bound also applies to $g$ without cutoff, at an additional cost $O(\sum v_i^3)$. Indeed on $|z|>\eta$ outside a small disk about $-1$ the logarithm is bounded in absolute value by $K(1+|z|^2)$ and has an exponentially small tail contribution. Inside that disk the density is at most $K e^{-c/v_i}/v_i$ by the comparability of the two variances, and the planar logarithmic singularity is integrable. This proves (1). The cases $t=0$ or $s_0=0$ are immediate throughout.

## Returning to the permanent

Write $a_{n,l}=(n)_l/n^l$, $d_n=n!/n^n$, and $P(B)=\operatorname{per}(J+B)/d_n$ with $J_{ij}=1/n$. The [exact expansion and Gaussian pairing](hilbert_schmidt_limit.md) give $F_C(t)=\sum_l\sigma_l(C)t^l$ with nonnegative coefficients and $P(tC)=\sum_l\sigma_l(C)t^l/a_{n,l}$. For each $0<s<1$ there is also the simple upper bound
```math
 P(sC)\le\det(I-sC)^{-1}.                                                \tag{3}
```
Indeed use the Gaussian representation of $\operatorname{per}(J+sC)$ with vector $Z_0\mathbf1/\sqrt n+\sqrt{sC}Z$, where $Z_0$ is independent of $Z$. Apply AM–GM to the squared coordinate moduli. Centering kills the cross term, so the product is at most $n^{-n}(|Z_0|^2+sQ)^n$ for $Q=Z^*CZ$. Integrating out $|Z_0|^2$ and dividing by $d_n$ gives $\sum_{l=0}^n s^l \mathbb E Q^l/l!\le\mathbb E e^{sQ}=\det(I-sC)^{-1}$.

Along any sequence with $v\to0$, $nv\to\infty$, take $\gamma=\sqrt v$, and fix $0<t_0<s<1$. Up to degree $\gamma n$, the factorial correction is at most $(1-\gamma)^{-l}$. The remaining tail at any $t\le t_0$ is at most $(t_0/s)^{\lfloor\gamma n\rfloor}P(sC)$, which tends to zero exponentially in $\gamma n$, by (3) and $\operatorname{tr}C\le nv$. Consequently
```math
 F_C(t)\le P(tC)\le F_C(t/(1-\gamma))+o(1).
```
The log determinant changes by $O_{t_0}(\gamma u)$ under this rescaling by the spectral series. Apply (1) on a slightly larger compact interval and use $F_C(t)\ge1$. The resulting uniform estimate is
```math
 \log P(tC)=-\tfrac12\log\det(I-t^2 C^2)+O_{t_0}(\sqrt v\,u)+o(1).       \tag{4}
```
If $B$ is any real centered matrix of operator norm at most one, take $C_L=(BB^T)^{1/2}$ and $C_R=(B^TB)^{1/2}$. In each coefficient, the Gaussian pairing and Cauchy–Schwarz give $|\sigma_l(B)|\le\sqrt{\sigma_l(C_L)\sigma_l(C_R)}$. A second Cauchy–Schwarz after summing with positive factorial weights gives $|P(tB)|\le\sqrt{P(tC_L)P(tC_R)}$. Thus the right side of (4) is an upper bound on $\log|P(tB)|$, with the determinant of $I-t^2 B^TB$ and $v$ taken as the larger of the two maximum diagonals (the same cutoff $\gamma$ works for both). Only the upper bound is used on a general signed matrix.

## The two inequalities

Consider doubly stochastic $A$ along a sequence with $\max a_{ij}\to0$. Necessarily $n\to\infty$. For $B=A-J$, both centered row and column Euclidean norms tend uniformly to zero since $\sum_j a_{ij}^2\le\max a_{ij}$ and likewise for columns. Cauchy–Schwarz gives $(C_L)_{ii}\le\sqrt{(BB^T)_{ii}}$ and the analogous right bound, so $v\to0$. Write $u=\|B\|_F^2$.

Suppose first $u\to\infty$. Then $nv\ge\operatorname{tr}C_L\ge u\to\infty$. The [multicolumn capacity estimate](../weighted-matching/all_regular_chords.md) gives $\log P(B)\ge u/2-\tfrac12\log(1+u)-O(1)$. For fixed $t_0<\sqrt{1-e^{-1}}$, equation (4) and convexity of $x\mapsto-\log(1-t_0^2 x)$ on $[0,1]$ give
```math
 \sup_{0\le t\le t_0}\log P(tB)
 \le -\tfrac{u}{2}\log(1-t_0^2)+o(u).
```
The coefficient on the right is strictly smaller than $1/2$. Thus $P(tB)\le e^{-c u} P(B)$ throughout the interval for some $c>0$ and all sufficiently large orders. For $t\ge e^{-cu}$ this is below the required chord $1-t+tP(B)$. Between zero and $e^{-cu}$ use [strict convexity on the fixed Frobenius ball](../nov20-independent/inequalities/uniform_radial_permanent.md), since $e^{-cu}\sqrt u\to0$. Convex interpolation from zero to the already established right endpoint covers that interval.

If $u$ stays bounded and the centered operator norm stays below a fixed $\rho<1$, the [bounded-Frobenius diffuse theorem](hilbert_schmidt_limit.md) gives strict radial convexity eventually for nonzero $B$, including shrinking norms by the same local result. In the remaining subsequence $\|B\|_{\rm op}\to1$. A Cheeger cut for the bipartite chain of $A$ has row and column sizes $r,s$, $h=r+s\le n$, and total outgoing weight $o(h)$. In particular $r,s\sim h/2$ and $h\to\infty$, because the inside mass $\sim h/2$ is at most $rs\max a_{ij}$. The two-class integer-table bound then gives $P(B)\ge c\sqrt{h/(1+o(h))}\to\infty$; its construction allowing $h=o(n)$ and the four class sizes is in the [diffuse integer theorem, Spectrum](../combinatorial/diffuse_integrality.md). By the bounded-Frobenius coefficient estimate and $\sigma_1(B)=0$, $|P(tB)-1|\le K t^2$ uniformly on $[0,t_0]$ since $t_0<1$. This proves the strict chord throughout $0<t\le t_0$. The alternatives exhaust subsequences, so failure for arbitrarily small maximum entry would contradict one of them. This proves the absolute-entry assertion.

Finally assume $0<\rho<1$, $\|B\|_{\rm op}\le\rho$ and $-\log(1-\rho^4)<2\rho^2$. For $u\to\infty$ apply (4) to $C=BB^T/\rho^2$ at $t=\rho^2$. Its maximum diagonal tends to zero; $n\max C_{ii}\ge u/\rho^2\to\infty$. Its squared Frobenius norm is $O_\rho(u)$. If $s_i$ are the singular values of $B$, the result is
```math
 \log P(BB^T)\le -\tfrac12\sum_i\log(1-s_i^4)+o(u)
 \le \frac{-\log(1-\rho^4)}{2\rho^2}\,u+o(u).
```
The second step follows from convexity of $-\log(1-x^2)$ for $0\le x\le\rho^2$. The coefficient is below one, whereas $2\log P(B)\ge u-o(u)$. The transpose obeys the same bound. For bounded $u$ the [bounded-Frobenius Gram comparison](hilbert_schmidt_limit.md) applies. The standard permanent Cauchy–Schwarz bound for the mixed term gives the stated Gyires inequality from these two strict self-Gram comparisons. At $B=0$ equality holds by direct substitution.

The source search included the two catalogue entries, McCullagh's determinant approximation, Gaussian Hölder inequalities, prior convexity results listed by Lavi and the repository's uniform estimates. The local expansions and the two covariance tilts above concern the growing-Frobenius regime. Historical priority and the proof have no external certification here.

The [rational replay](verify_diffuse_log_upper.py) checks (3) on 90 centered positive semidefinite examples and checks the tilted covariance and fourth-moment identities at 19 rational parameters. The estimates uniform in the order are analytic.

# Asymptotics and eventual uniqueness of the optimal thin shell

This supplements the [distance-variance shape theorem](PROOF.md), in the normalization where the prescribed volume is that of the unit ball. For a minimizing shell in dimension $d\ge5$, write its inner and outer radii as $p_d^{1/d}$ and $(p_d+1)^{1/d}$. Then
```math
 p_d\longrightarrow p_*>0,\qquad
 (2p_*+1)\log(1+1/p_*)=3.
```
The optimum is unique up to translation for all sufficiently large dimensions. The minimum variance satisfies
```math
 \min F_d=\frac1{2d}+\frac{7/16+G(p_*)}{d^2}+O(d^{-3}),
\quad G(p)=(p+1)\log(p+1)-p\log p-p(p+1)\log^2(1+1/p).
```
Here $G(0)=0$ is its continuous extension. No finite threshold for eventual uniqueness is claimed.

## Uniform expansion

Take a shell with parameter $p\ge0$. Let $U,V$ be independent uniforms on $[0,1]$, set $X=\log(p+U)$ and $Y=\log(p+V)$, and put $r=e^{X/d},t=e^{Y/d}$. The distance between these independent shell points has the law of
```math
 (r^2+t^2)^{1/2}\,(1-qZ)^{1/2},
 \qquad
 q=\frac{2rt}{r^2+t^2}=\operatorname{sech}((X-Y)/d),
```
where $Z$ is the first coordinate of an independent uniform sphere point. Its even moments through order six are $1/d$, $3/(d(d+2))$, and $15/(d(d+2)(d+4))$. By symmetry, Taylor expansion through degree four on $|Z|\le1/2$, and the sixth-moment bound on its complement,
```math
 \mathbb E_Z\sqrt{1-qZ}
 =1-\frac{q^2}{8d}-\frac{15q^4}{128d(d+2)}+O(d^{-3}),
```
uniformly for $0\le q\le1$. Replacing $q$ by 1 in the two corrections costs at most $O(d^{-3})$ after averaging, because $1-q^2\le (X-Y)^2/d^2$, and on bounded $p$-intervals all fixed moments of $|X|$ are uniformly bounded by the integrability of powers of $|\log U|$.

Writing $\mu=\mathbb EX$ and $\sigma^2=\operatorname{Var}X$, a second-order Taylor expansion gives
```math
 \mathbb E\sqrt{r^2+t^2}
 =\sqrt2\left(1+\frac\mu d+
 \frac{3\sigma^2/4+\mu^2/2}{d^2}\right)+O(d^{-3}).
```
Indeed pointwise the quadratic coefficient is $(X+Y)^2/8+(X-Y)^2/4$. The third derivatives of $(e^{2s}+e^{2t})^{1/2}$ are bounded by a constant times $e^{\max(s,t)}$, so the remainder is controlled by the uniform third log moment, including at $p=0$. Combining these expansions and $\mathbb E D^2=2\mathbb E e^{2X/d}$ gives
```math
 \operatorname{Var}D
 =\frac1{2d}+\frac{\mu+\sigma^2+7/16}{d^2}+O(d^{-3})
```
uniformly on every bounded $p$-interval. Elementary integration yields
```math
 \mu=(p+1)\log(p+1)-p\log p-1,\qquad
 \sigma^2=1-p(p+1)\log^2(1+1/p),
```
so $\mu+\sigma^2=G(p)$.

## Localization and uniqueness

The sphere comparison in [the shape theorem](PROOF.md) gives
```math
 F_d(p)\ge 2(1-C_d^2/2)\mathbb E e^{2X/d},
```
where $C_d$ is the unit sphere mean distance. The same angular expansion at $q=1$ gives $1-C_d^2/2=1/(4d)+O(d^{-2})$. At a minimizer compare with the ball, which has $F_d(0)=1/(2d)+O(d^{-2})$. If $p\ge1$, then $\mathbb E e^{2X/d}\ge p^{2/d}$, so $p^{2/d}\le1+O(1/d)$; hence all minimizing parameters are uniformly bounded.

For $p>0$ and $L=\log(1+1/p)$,
```math
 G'(p)=L\bigl[3-(2p+1)L\bigr].
```
As $p$ grows, $(2p+1)L=L\coth(L/2)$ decreases strictly from infinity to 2: the derivative of $s\coth s$ is positive for $s>0$ since $\sinh s\cosh s>s$. It follows that $G$ has a unique minimum at the stated $p_*>0$ and $G''(p_*)>0$. Uniform convergence of the rescaled objective on the bounded parameter range places every global minimizer in any fixed neighborhood of $p_*$ for sufficiently large $d$. Evaluation at $p_*$ and at such a minimizer gives the asserted value expansion.

For uniqueness, the same expansion is valid with two $p$-derivatives on a small positive real neighborhood of $p_*$. One way to justify this is to allow $p$ in a fixed small complex disk about $p_*$. All the functions $\log(p+u)$ and their differences are then uniformly bounded. Both $(r_p(u)-r_p(v))/(u-v)$ (by integrating $\partial_u r_p$) and $r_p(u)r_p(v)$ lie in fixed narrow sectors about the positive axis. Hence $(r_p(u)-r_p(v))^2+2r_p(u)r_p(v)(1-Z)$ stays in a fixed sector where the principal square root is holomorphic off the zero corner, which has measure zero. Its square root is uniformly bounded on the disk. The angular expansion on $|Z|\le1/2$ and the $O(d^{-3})$ probability of the complementary event remain uniform there. Cauchy estimates on a smaller disk give the corresponding $O(d^{-3})$ derivative errors. Thus the rescaled objective has positive second derivative throughout a fixed neighborhood of $p_*$ for all sufficiently large $d$. All global minimizers lie there, so there is only one.

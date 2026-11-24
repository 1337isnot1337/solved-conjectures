# Borcea's mean-deviation conjecture: collinear roots and isolated roots

Define $\sigma_1(P)=\inf_{c\in\mathbb C}n^{-1}\sum_{P(z_i)=0}|z_i-c|$ for a polynomial $P$ of degree $n\ge2$, with multiplicity in the sum. The $p=1$ instance of [Borcea's variance conjecture, Conjecture 1](https://arxiv.org/pdf/1010.5167#page=4) asserts that every root lies within distance $\sigma_1(P)$ of a critical point. This note gives an elementary alternative collinear-root proof, including equality, and a sufficient isolation condition in the complex case. The collinear bound already follows from Borcea’s sharper real-root theorem, as explained below. It does not settle the unrestricted conjecture.

## All collinear roots, with equality

**Theorem.** If the roots of $P$ are collinear, then $d(a,Z(P'))\le\sigma_1(P)$ for every root $a$. If $n\ge3$ and $\sigma_1(P)>0$, equality for a root $a$ holds exactly when $a$ is simple and all other roots coincide at a distinct point.

Rotate and translate so that the distinguished root is at $0$ and all roots are real. Multiple roots already belong to $Z(P')$, so suppose $0$ is simple. Let $r=d(0,Z(P'))>0$. No other root lies in $[-r,r]$, since Rolle's theorem between that root and $0$ would give a closer critical point. Scale lengths so that $r=1$.

Write positive roots as $u_i>1$, $i=1,\dots,p$, and negative roots as $-v_j<-1$, $j=1,\dots,q$, with repetitions. Then $n=p+q+1$. Reflect if needed so that a median $c$ of the roots is nonnegative; a real median minimizes the absolute-deviation sum, because orthogonal projection permits restricting the center to the real line.

If a median is $0$, use the product formula at the distinguished root:
$$
\prod_{i:z_i\ne0}|z_i|=|P'(0)/\operatorname{lc}(P)|=n\prod_{P'(w)=0}|w|\ge n.
$$
The arithmetic-geometric mean inequality gives $\sum_i|z_i|\ge(n-1)n^{1/(n-1)}\ge n$. This is strict if $n\ge3$, since $(1+1/(n-1))^{n-1}<\mathrm e<3\le n$.

Otherwise take a median $c>0$, which requires $p\ge n/2$, equivalently $p\ge q+1$. On $(0,1)$ the real logarithmic derivative $P'(x)/P(x)$ has no zero or pole and is positive near $0$, so its continuous value at $1$ is nonnegative. Thus
$$
\sum_{i=1}^p\frac1{u_i-1}
\le 1+\sum_{j=1}^q\frac1{v_j+1}
\le 1+q/2.
$$
Cauchy–Schwarz yields $S:=\sum_i(u_i-1)\ge p^2/(1+q/2)$. The total absolute deviation is at least
$$
(q+1)c+q+\big|p+S-pc\big|
\ge (q+1)(1+S/p)+q
\ge 2q+1+\frac{(q+1)p}{1+q/2}
\ge n.
$$
The middle bound minimizes the piecewise-linear expression over $c\ge0$, using $p\ge q+1$. The final bound is strict if $q>0$. When $q=0$, equality requires equality in the Cauchy–Schwarz estimate, hence all $u_i$ coincide. Conversely, for $P(z)=C(z-a)(z-b)^{n-1}$, $a\ne b$, the critical point closest to $a$ is $a+(b-a)/n$, and $\sigma_1(P)=|b-a|/n$ for $n\ge3$. For $n=2$, the midpoint gives equality for each root.

## A sufficient complex isolation condition

**Theorem.** Let $a$ be a simple root of a complex polynomial $P$ of degree $n\ge2$, and let $s=\sigma_1(P)>0$. If every other root satisfies $|z_i-a|\ge2s$, then $d(a,Z(P'))\le s$.

Choose a median center $c$, so $\sum_i|z_i-c|=ns$, and change scale to $s=1$ and origin to $c=0$. Rotate so that $a\ge0$. If $a\le1$, each other root has $|z_i|\ge2-a$, and $\sum_i|z_i|\ge(n-1)(2-a)+a\ge n$. For $n\ge3$, equality when $a\le1$ forces $a=1$ and all other roots equal to $-1$, by equality in the triangle inequalities, already covered above. The case $n=2$ is automatic. We may therefore assume $1<a\le n$.

For $z$ in the closed disk about $a$ of radius $1$, the function
$$
F(z)=z(z-a)\frac{P'(z)}{P(z)}
=n\big(z-(1-1/n)a\big)+\sum_{i:z_i\ne a}\frac{(z-a)z_i}{z-z_i}
$$
is holomorphic after removing the singularity at $a$. Moreover $F(a)=a\ne0$, and every zero in the disk is a critical point, since neither $0$ nor any other root of $P$ is in the disk. Let $\ell(z)=n(z-(1-1/n)a)$. On $|z-a|=1$,
$$
|\ell(z)|\ge n-a,\qquad
|F(z)-\ell(z)|\le\sum_{i:z_i\ne a}\frac{|z_i|}{|z-z_i|}\le n-a.
$$
If $a=n$, all other roots are zero and the result is immediate. Otherwise $\ell$ has exactly one zero in the open disk and satisfies the strict Rouché inequality there for the comparison with
$\ell+t(F-\ell)$ on the boundary, for every $0\le t<1$. Let $t\uparrow1$ and use compactness of the closed disk to obtain a zero of $F$ in it. This establishes the theorem including equality in the isolation hypothesis.

The same proof gives a checkable sufficient condition when the distances exceed $s$ rather than $2s$: if a median $c$ lies outside the radius-$s$ disk, and
$$
s\sum_{i:z_i\ne a}\frac{|z_i-c|}{|a-z_i|-s}
\le ns-|a-c|,
$$
the conclusion holds.

## Prior work and scope

[Khavinson, Pereira, Putinar, Saff and Shimorin (2011), §§3–4](https://arxiv.org/abs/1010.5167) separately treats real-rooted polynomials for the $p=2$ inequality and gives Borcea's general complex cubic proof for $p=1$. Their Proposition 4.1 proves the reverse directed distance ($P'$ roots to $P$ roots) for all polynomials at $p=1$. [Zhang](https://arxiv.org/abs/2610.02035) and [Bouthat–Fallat](https://arxiv.org/abs/2610.12499) prove $p=2$ in all degrees, which does not imply $p=1$. Targeted searches did not locate the precise collinear $p=1$ argument with equality or the $2\sigma_1$ criterion above; not a priority guarantee.

## Priority correction for the collinear result

[Borcea’s real-root theorem, reported as Theorem 6.1](https://arxiv.org/html/1010.5167#S6.SS2), gives the distance bound $\sigma_2(P)/\sqrt{n-1}$. To compare this with $\sigma_1$, let $x$ be the root vector centered at a geometric median and let $P_0$ be orthogonal projection off the constant vector. Each column of $P_0$ has norm $\sqrt{(n-1)/n}$, so $\|P_0x\|_2/\sqrt n\le\sqrt{n-1}\|x\|_1/n$. This proves the collinear inequality from the earlier theorem. For $n\ge3$ equality in this triangle inequality with nonzero deviation allows only one nonzero coordinate, since distinct projection columns are not collinear. Thus the equality family also follows from the prior result and direct substitution. The collinear section above is only an elementary alternate argument. This does not change the complex isolation criterion.

In particular, if a distinguished root is at distance at least $(n/2+1)\sigma_1$ from a geometric median, then each other root is at distance at least $2\sigma_1$ from it: bound each other root's distance to the median by the sum of the $n-1$ remaining distances. This is a convenient sufficient consequence of the complex isolation result.

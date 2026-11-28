# Real van der Waerden radius

For every real matrix $B$ with zero line sums, rank one and Frobenius norm one, $`\mathop{\mathrm{per}}(J_n+tB)`$ is strictly increasing in $t$ on $[0,1]$. Entries of the matrix may be negative. The minimum rank-two radius in [Sinkhorn's problem](https://yair-lavi.com/mincs-list/problem-13/index.html) therefore satisfies
```math
1\lt b_2(n)\lt H_n\quad(n\ge3),\qquad \lim_{n\to\infty} b_2(n)=1,
```
where $H_n=(n+1)/(n-1)$ in odd order and $H_n=\sqrt{(n+2)/(n-2)}$ in even order. The upper bound uses the [rank-two Hall construction](hall-bound.md). This identifies the exact infimum of the radii over all orders in the rank-two class. The unrestricted problem permits several nonzero singular values in the centered part.

## Four cell totals

Write $B=uv^T$ with real centered unit vectors $u,v$. The radial derivative at any fixed $t$ is separately symmetric and multiaffine in each vector. Its minimum on the product of the two centered unit spheres occurs with just two coordinate values on each side, by the [three-coordinate variation](rank_one_envelope.md). Thus it suffices to check a positive outward derivative on every two-level direction at every $0<|t|<1$. Transposing the matrix, exchanging the levels and keeping both signs of $t$, assume their smaller multiplicities satisfy $1\le a\le b\le n/2$. Choose the positive values on these smaller classes. Put
```math
h=n-a-b,\qquad D=\sqrt{a(n-a)b(n-b)},\qquad x=(ab+tD)/n.
```
The sums of the entries in the four rectangles of $J_n+tB$ are $x,a-x,b-x,h+x$. For $-1<t<1$ one has $x<b$ and $h+x>0$, except that equality can occur at endpoints. These bounds follow from $ab+D\le nb$ and $D\le(n-a)(n-b)$. Write $x_0=ab/n$.

Counting permutations by the number $j$ of first-class rows paired to first-class columns gives the following expression for the permanent, up to a fixed positive factor:
```math
 F(x)=(a-x)^a(b-x)^b(h+x)^h Z(z),\qquad
 z=\frac{x(h+x)}{(a-x)(b-x)},\qquad
 Z(z)=\sum_{j=0}^a \binom bj\binom{n-b}{a-j}z^j .
```
Indeed all rectangle-size denominators multiply to the same value in every permutation. The apparent singularity at $x=a$ disappears in the original polynomial. At $x=0$ the $j=0$ term is positive if $h>0$, and at $x=a$ the $j=a$ term is positive if $b>a$. Those are exactly the cases when these points occur in the open interval. The odds satisfy
```math
 z'(x)=\frac{abh+2abx-nx^2}{(a-x)^2(b-x)^2}>0
```
because the numerator has roots $(ab\pm D)/n$. Except at zeros and poles, logarithmic differentiation gives
```math
 F'/F=(\mu-x)z'/z,\qquad \mu=z Z'/Z.
```
This holds also where individual rectangles have negative totals.

## Comparing the two roots

The polynomial $Z$ has only negative real roots. For example divide by $Z(0)$ and apply the Pfaff transformation to its hypergeometric form with parameters $(-a,-b;h+1)$. The result is $(1-z)^a$ times the shifted Jacobi polynomial with parameters $(h,b-a)$ at $z/(z-1)$, normalized at zero. All $a$ roots of that shifted polynomial are in $(0,1)$. [Pfaff transformation](https://dlmf.nist.gov/15.8.E1) · [Jacobi representation](https://dlmf.nist.gov/18.5.E7) · [Zeros of orthogonal polynomials](https://dlmf.nist.gov/18.2.vi)

Writing the roots as $-\lambda_i$ gives $\mu'=\sum_i\lambda_i/(z+\lambda_i)^2>0$ off the poles. The coefficient ratio of $Z$ gives the hypergeometric differential equation. In logarithmic form it reads
```math
 Q_z(\mu)=-(1-z)z\mu',\qquad
 Q_z(y)=(1-z)y^2+[h+(a+b)z]y-abz.
```
By the odds identity $Q_z(x)=0$. Therefore $\mu-x$ cannot vanish at any regular real $z$ other than $0$ or $1$. [Hypergeometric equation](https://dlmf.nist.gov/15.10.E1)

* For $0<x<a$, all factors are positive. Here $F$ has no pole or zero. The only point at which $\mu-x$ can vanish is $z=1$, which occurs at $x=x_0$. At the center the normalized permanent has constant term one, linear coefficient zero and positive quadratic coefficient $n/[2(n-1)]$ in $t$. Hence $F'/F$ is negative on $(0,x_0)$ and positive on $(x_0,a)$ wherever these intersect the allowed interval.
* If $x<0$, then $h>0$, $z<0$, and $z'/z<0$. Near zero, $z=hx/(ab)+O(x^2)$ and $\mu=abz/(h+1)+O(z^2)$. Thus $\mu>x$. On continuing towards smaller $x$, the inequality persists until a pole. At a first pole approached from its right, $z/(z+\lambda_i)$ tends to minus infinity, contradicting $\mu>x$. Hence $F$ stays positive and $F'/F<0$ throughout this interval.
* If $x>a$, then $b>a$, $z<0$, and $z'/z<0$. Put $K=a(n-b)/(b-a)$ and $L=a(n-b)/(b-a+1)$. Near $a$ from above, $z=-K/(x-a)+O(1)$ and $\mu=a-L/z+O(z^{-2})$, the latter by the ratio of the top two coefficients of $Z$. Since $L<K$, one has $\mu<x$. As $x$ increases from $a$, a first pole would be approached from the left and force $\mu$ to plus infinity. Thus $F$ stays positive and $F'/F>0$ throughout this interval.

The same expansions give $F'(0)/F(0)=-1/(h+1)$ and $F'(a)/F(a)=1/(b-a+1)$ when these points are interior. The derivative here is with respect to $x$. Together these comparisons prove the strict outward derivative on every two-level direction. The sphere minimum transfers it to arbitrary centered unit vectors, and polynomial continuity includes both endpoints in the strict monotonicity assertion.

For each fixed order the permanent is strictly above its central value on the compact sphere of unit rank-one perturbations. Its minimum there has a positive gap, and continuity gives $b_2(n)>1$. For the stronger monotonicity conclusion the universal radius is **exactly one in every order $n\ge3$**. Take $B=-ee^T$ with $e$ the centered unit indicator of a singleton. The two classes of permutations according as that singleton maps to itself or elsewhere give the normalized permanent
```math
 (1-t/(n-1))^{n-2}\big(1+(n-2)t/(n-1)+t^2\big).
```
Its derivative is $nt(1-t)(1-t/(n-1))^{n-3}/(n-1)$, strictly negative immediately beyond one. Order two has a strictly increasing quadratic on the whole positive ray.

Every doubly stochastic matrix contracts the Euclidean norm, by Jensen's inequality on its rows and the column sums. Thus if it has rank two, its centered part has Frobenius norm at most one. The signed theorem also recovers [rank-two radial monotonicity](../inequalities/rank_two_monotonicity.md) for the stochastic problem. The proof of all the subpermanent inequalities is given in that earlier note.

The source search included Sinkhorn's paper, the Cheon–Wanless survey, the current catalogue, signed rank-two line-sum-one permanents, and the noncentral hypergeometric odds polynomial. The differential equation and Jacobi zero theorem are classical. Priority for the signed permanent application has not been independently confirmed. [Sinkhorn (1981)](https://doi.org/10.1080/03081088108817413) · [Cheon and Wanless (2005)](https://doi.org/10.1016/j.laa.2005.02.030)

The [exact checker](verify_signed_unit_ball.py) checks the logarithmic and differential identities on 3,412 cell tables, including 1,433 signed tables and the derivatives at 336 cell-zero crossings. An independent direct permutation sum checks 118 arbitrary-factor derivatives, 117 at signed matrices.

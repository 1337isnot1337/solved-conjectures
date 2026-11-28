# Nazarov–Shcheglova’s Steklov conjecture: the Hilbert case

**Research status.** In the real Hilbert case $`p=2`$, this proves the constant equality, coincidence of nonzero extremizers, and midpoint symmetry in Conjecture 4.14 at every order $`n\ge2`$. The existing results cover $`n=2,3`$; the argument here covers $`n\ge4`$. General $`p`$ is not resolved.

The source is A. I. Nazarov and A. P. Shcheglova, [*A Survey of Results on 1D Steklov Type Inequalities*](https://link.springer.com/article/10.1134/S0081543825601509), Conjecture 4.14. The $`n=2`$ case appears in Remark 4.15. M. Jleli and B. Samet [prove](https://arxiv.org/html/2609.34516v1) $`n=3,p=2`$, using a weak-$`L^2`$ estimate for a parity component. Here projection onto the midpoint evaluation representer gives a uniform argument, supplemented for a short finite range by exact polynomial certificates.

## The reproducing kernel

Work on $`(-1,1)`$; the two constants scale the same way under affine change of interval. Take the real Hilbert space $`H=W_0^{n,2}(-1,1)`$ with squared norm $`\int_{-1}^1|u^{(n)}|^2`$. Its pointwise reproducing kernel $`G`$ is the clamped Green function of $`(-1)^nD^{2n}`$, because this Green function represents evaluation after integration by parts. The one-dimensional specialization of [Boggio's formula, as stated by Sweers and Grunau](https://fa.ewi.tudelft.nl/~sweers/postscripts/morecp.pdf) gives, with a positive constant independent of $`x,y`$,
```math
 G(x,y)=C'\,b^n \int_0^1\frac{t^{n-1}}{\sqrt{(x-y)^2+b t}}\,dt,
 \qquad b=(1-x^2)(1-y^2).
```
Indeed, put $`w=bt/(x-y)^2`$ in the standard integral with upper limit $`b/(x-y)^2`$; the displayed expression extends to $`x=y`$. Set $`C=G(0,0)>0`$ and $`m=n-\tfrac12`$. Equivalently, if $`T`$ has density $`mt^{m-1}`$ on $`(0,1)`$, then
```math
 \frac{G(x,y)}{C}
 =b^m\,\mathbb E\left(1+\frac{(x-y)^2}{bT}\right)^{-1/2}.
```
In particular, $`G(x,x)/C=(1-x^2)^{2m}`$, so evaluation has a unique norm maximum at $`x=0`$. Consequently the nonzero extremizers for the supremum norm are exactly the scalar multiples of $`G(\cdot,0)`$. This function is even.

Let $`h_x\in H`$ be the representer of $`u\mapsto u'(x)/\sqrt C`$, and put $`\psi=G(\cdot,0)/\sqrt C`$, a unit vector. These representers are norm-continuous in $`x`$ by the estimate $`|u'(x)-u'(y)|\le \|u''\|_2\sqrt{|x-y|}`$, with $`\|u''\|_2`$ controlled by the chosen norm. With $`b=(1-x^2)(1-y^2)`$ as above, the mixed derivative at $`y=x`$ gives
```math
 \|h_x\|^2=\frac{G_{xy}(x,x)}C
 =(1-x^2)^{2m-2}\left(4m^2x^2+\frac m{m-1}\right).
```
To see the coefficient of the last summand, the function $`R(z)=\mathbb E(1+z/T)^{-1/2}`$ satisfies $`R(0)=1`$ and $`R'(0+)=-m/[2(m-1)]`$. Apply it to $`z=(x-y)^2/b`$; its mixed derivative at the diagonal is $`-2R'(0+)/b`$. The other summand comes from the mixed derivative of $`b^m`$.

For $`x>0`$ define $`f(x)=-G_x(x,0)/C`$, extend $`f`$ as an even function, and put $`v_x=-\mathop{\mathrm{sign}}(x)h_x`$. Thus $`\langle v_x,\psi\rangle=f(x)`$ for $`x\ne0`$. The same formula shows $`f(x)>0`$ for $`0<x<1`$, since both factors in $`G(x,0)/C`$ strictly decrease there. Let $`d(x)=\|v_x-f(x)\psi\|`$. This is also even. By the fundamental theorem of calculus applied to any $`u\in H`$,
```math
  \int_{-1}^1 v_x\,dx=2\psi,
  \qquad \int_{-1}^1 f(x)\,dx=2.
```

## A sufficient weak estimate

Write $`d\mu=f(x)\,dx`$ and $`\rho=d/f`$ away from the midpoint; set $`W(x)=\int_0^x f`$ for $`x>0`$. Thus $`W(1)=1`$. Suppose that for some $`a\in(0,1)`$ and nonnegative $`c_0,c_1`$ we have
```math
 \rho(x)^2 W(x)\le c_0\quad(0\lt x\le a),\qquad
 \rho(x)^2(1-W(x))\le c_1\quad(a\le x<1).
 \tag{1}
```
Because $`W`$ is the mass coordinate on the positive half, and by evenness, the level set $`\{\rho>s\}`$ has $`\mu`$-mass at most $`2(c_0+c_1)/s^2`$. Integrating the smaller of this bound and $`D=\mu(E)`$ gives
```math
 \left\|\int_E(v_x-f(x)\psi)\,dx\right\|^2
 \le \left(\int_E\rho\,d\mu\right)^2
 \le 8(c_0+c_1)D.
 \tag{2}
```
For example, if $`8(c_0+c_1)<1`$, then (2) is strictly smaller than $`D(2-D)`$ whenever $`0<D\le1`$.

## All orders $`n\ge14`$

Use $`u=1-x^2`$ in this scalar estimate, put $`g=(1+x^2/(uT))^{-1/2}`$ and let $`k=\mathbb E g`$. Then $`F(x)=G(x,0)/C=u^mk=1-W(x)`$. Differentiating on compact subintervals of $`(0,1)`$ gives
```math
 f=-F'=2mx u^{m-1}k+xu^{m-2}\mathbb E[T^{-1}g^3]\ \ge\ 2mx u^{m-1}k.
```
This differentiation is justified by $`\mathbb E T^{-1}=m/(m-1)`$. Jensen's inequality for the convex function $`v\mapsto(1+x^2v/u)^{-1/2}`$ gives
```math
 k^2\ge \frac{(m-1)u}{m-1+x^2}.
```
The exact diagonal identity from above now yields
```math
 \rho^2=\frac{\|h_x\|^2}{f^2}-1
 \le \frac{mx^2}{(m-1)u}+
      \frac{m-1+x^2}{4m(m-1)^2u x^2}.
 \tag{3}
```
For the central region $`x^2\le1/(2m)`$,
```math
 W=1-u^mk\le mx^2+u^m\frac{x^2}{2u}\mathbb E T^{-1}
          \le \left(1+\frac1{2(m-1)}\right)mx^2.
```
Here $`1-u^m\le mx^2`$ and $`1-(1+z)^{-1/2}\le z/2`$. For $`m\ge13`$ we have $`m/(m-1)\le13/12`$, $`u\ge25/26`$, and $`1+1/[2(m-1)]\le25/24`$. Multiply (3) by the bound on $`W`$; use $`m^2x^4\le1/4`$ in the first term and $`m-1+x^2\le m`$ in the second. This gives
```math
 m\rho^2W\le\frac{13}{12}
       \left(\frac{13/12}{4}+\frac{(13/12)^2}{4}\right)
   =\frac{4225}{6912}<\frac58.
```
In the outer region $`x^2\ge1/(2m)`$, use $`1-W=F\le u^m`$. The first term in $`m\rho^2u^m`$ is at most $`(13/12)e^{-12/13}<13/24`$, since $`x^2 u^{m-1}`$ has its maximum at $`x^2=1/m`$. For the second term, use $`x^2\ge1/(2m)`$ and $`u^{m-1}\le e^{-6/13}<2/3`$ to obtain the bound $`(13/12)^2/3=169/432`$. The elementary exponential bounds follow from $`e^s\ge1+s+s^2/2`$ for $`s\ge0`$. In all,
```math
 m\rho^2(1-W)<\frac{13}{24}+\frac{169}{432}
              =\frac{403}{432}<\frac{15}{16}.
```
Thus (1) holds with $`8(c_0+c_1)\le(25/2)/m<1`$.

## All orders $`4\le n\le13`$

The midpoint formula reduces to a polynomial on $`0\le x\le1`$:
```math
 F(x)=(2n-1)\int_x^1(s^2-x^2)^{n-1}\,ds
     =(2n-1)\sum_{j=0}^{n-1}
        \frac{(-1)^j\binom{n-1}{j}}{2(n-1-j)+1}
        (x^{2j}-x^{2n-1}).
```
The integral follows by changing variables $`s=\sqrt{x^2+(1-x^2)t}`$ in Boggio's formula. Thus $`f=-F'`$, $`d^2=(1-x^2)^{2n-3}[4m^2x^2+m/(m-1)]-f^2`$, and the inequalities in (1) are polynomial nonnegativity tests:
```math
 c_0 f^2-d^2(1-F)\ge0\text{ on }[0,a],\qquad
 c_1 f^2-d^2 F\ge0\text{ on }[a,1].
```
They are certified by nonnegative Bernstein coefficients, as reproduced by [check_hilbert.py](check_hilbert.py) using only exact rational arithmetic. For $`5\le n\le13`$, the triple is $`(a,c_0,c_1)=(1/4,1/15,1/20)`$. For $`n=4`$ it is $`(3/11,7/80,1/15)`$. The near interval is certified without subdivision for every order; the far interval is split once at its midpoint for $`n=4,5`$ and is not split for any other order. These are interval proofs, not sample-value tests: writing a polynomial $`\sum_{k=0}^d b_k t^k`$ on the affine unit interval in the Bernstein basis gives coefficients $`\sum_{k\le j}b_k\binom jk/\binom dk`$, and the Bernstein basis is nonnegative on that interval.

For $`n\ge5`$ the certificate gives $`8(c_0+c_1)=14/15<1`$. For $`n=4`$ the weak estimate has $`8(c_0+c_1)=37/30<5/4`$, which is enough for $`D\le3/4`$. To handle $`3/4\le D\le1`$, use
```math
 \int_E \rho\,d\mu=\int_E d(x)\,dx
 \le \frac25 D +2\int_0^1 (d(x)-\tfrac25 f(x))_+\,dx.
```
The same script gives an exact upper bound $`24969264603820437/27487790694400000<19/20`$ for the right side with $`D=1`$. It divides $`[0,1]`$ into 128 equal intervals, bounds $`d^2`$ above and $`f`$ below by the extreme Bernstein coefficients on each, rounds the square root upward using an integer square root, and sums the resulting upper rectangles. Since $`(19/20)^2<15/16\le D(2-D)`$ in this range, (2) has the required strict replacement.

## Optimal sign and equality

For any measurable $`g:(-1,1)\to\{-1,1\}`$, write $`g_0(x)=-\mathop{\mathrm{sign}}x`$, and let $`E`$ be the set on which $`g\ne g_0`$. Replacing $`g`$ by $`-g`$ does not change the norm of its representer and replaces $`E`$ by its complement. Thus take $`D=\mu(E)\le1`$. The representer of $`u\mapsto \int g(x)u'(x)\,dx/\sqrt C`$ is
```math
 \int g(x)h_x\,dx
 = (2-2D)\psi-2\int_E(v_x-f(x)\psi)\,dx.
```
The perpendicular estimate above is strict enough that $`\|\int_E(v_x-f\psi)\|^2<D(2-D)`$ whenever $`0<D\le1`$. Thus the squared norm is strictly below $`4`$ in that case. For $`D=0`$, the norm is exactly $`2`$. Hence only $`g=\pm g_0`$ can attain the maximum $`2`$, up to null sets because $`f>0`$ away from the endpoints and midpoint.

Given any nonzero $`u\in H`$, take $`g=\mathop{\mathrm{sign}}u'`$, choosing either value at points where $`u'=0`$. The sign bound gives $`\|u'\|_1\le2\sqrt C\|u\|_H`$, with equality only when $`u`$ is a scalar multiple of $`\psi`$ by the equality case of Hilbert-space Cauchy–Schwarz. Conversely the midpoint representer is a positive even bump, as $`f>0`$ shows, and attains equality. The best constants are therefore in ratio exactly $`2`$, and their nonzero extremizers coincide and are even.

## Scope

The proof uses two results beyond the elementary estimates: the classical Boggio kernel and the cited previous work for $`n=2,3`$. Exact rational polynomial certificates only cover the short bridging range $`4\le n\le13`$; the proof above treats every larger order directly and uniformly. A literature search for subsequent work on this conjecture found the specific Jleli–Samet result, but not an all-order Hilbert proof. This does not establish priority. The argument uses orthogonality and does not establish the claim for general $`p`$.

# Type-D Eulerian interlacing: alternative proof

This is an alternative written proof of the unweighted strict strengthening in issue #77. It combines an independent analytic tail argument with a dyadic finite checker. The earlier refinement proof records the established weak consequence and supplies the argument formalized in Lean. [Refinement proof](PROOF.md) · [Audit](ALTERNATIVE-AUDIT.md)

We prove that consecutive type-D Eulerian polynomials interlace. This answers the type-D question in [Chak-On Chow, *New proofs of interlacing of zeros of Eulerian polynomials*, §5](https://doi.org/10.1016/j.jmaa.2022.126019). The interlacing is weak at $D_2$ and $D_3$ because $D_2(x)=(1+x)^2$; it is strict at every transition $D_n,D_{n+1}$ with $n\ge3$. This is a cross-degree statement, not just the previously known real-rootedness of each individual polynomial.

Write $A_n(x)=\sum_{\pi\in S_n}x^{\mathop{\mathrm{des}}(\pi)}$, and denote the type-$`B`$ and type-$`D`$ Eulerian polynomials by $B_n(x),D_n(x)$. We use Stembridge’s classical identity (see also [the bijective proof](https://dmtcs.episciences.org/articles/11050)),
```math
D_n(x)=B_n(x)-n\,2^{n-1}x A_{n-1}(x).
\tag{1}
```
It implies $D_n$ is monic, degree $n$, has constant coefficient 1, and is reciprocal: $D_n(x)=x^nD_n(1/x)$, since $B_n$ is reciprocal of degree $n$ and $x A_{n-1}$ is reciprocal relative to $x^n$ as well.

## 1. Logistic derivative reduction

For a real variable $t$ put
```math
\phi(t)=(2\cosh(t/2))^{-1},\qquad
H_n(t)=(-1)^n \phi^{(n)}(t),\qquad
S_m(t)=(-1)^m\left(\frac1{1+e^t}\right)^{(m)}.
```
For $t>0$, the two geometric series give
```math
H_n(t)=\sum_{j\ge0}(-1)^j(j+\tfrac12)^n e^{-(j+1/2)t},\qquad
S_m(t)=\sum_{k\ge1}(-1)^{k-1}k^m e^{-kt}.
\tag{2}
```
At $x=-e^{-t}$ the type-$`B`$ identity
$B_n(x)/(1-x)^{n+1}=\sum_{j\ge0}(2j+1)^n x^j$
and the ordinary Eulerian power-sum identity give
```math
D_n(-e^{-t})=2^n e^{t/2}(1+e^{-t})^{n+1}F_n(t),
\qquad
F_n(t)=H_n(t)+\frac n2\phi(t)S_{n-1}(t).
\tag{3}
```
These identities extend to all real $t$ by analyticity. In particular the factor in (3) is positive. Differentiating gives
```math
F_{n+1}=-F_n'+E_n,\qquad
E_n=\tfrac12\phi S_n+\tfrac n2\phi' S_{n-1}.
\tag{4}
```
We show
```math
|F_n'(t)|>|E_n(t)|\qquad(n\ge128,\ t\ge0,\ F_n(t)=0).
\tag{5}
```
At the corresponding root $x=-e^{-t}$ of $D_n$, equations (3)–(5), and $dt/dx=-1/x$, imply
```math
\mathop{\mathrm{sgn}}D_{n+1}(x)
 =\mathop{\mathrm{sgn}}\big(x(1-x)D_n'(x)\big).
\tag{6}
```
This extends to roots $x<-1$ by reciprocity: at a root $D_n'(x)=-x^{n-2}D_n'(1/x)$, and the ratio of the two sign factors is positive since $x^{n+1}/(-x^{n-2})=-x^3>0$.

## 2. Endpoint: $t\ge3\sqrt n$

Write $y_j=j+1/2$ and $T_j=y_j^n e^{-y_jt}$ for $j\ge0$. Let $p$ be the half-integer $y_j$ of a largest term $`T_*`$, and choose its larger existing neighbor as the partner (the right neighbor if $`p=1/2`$). Then $`p\le\sqrt n/3+1`$: if the preceding term exists, its ratio to the peak gives $`t\le n\log(p/(p-1))<n/(p-1)`$. Successive ratios strictly decrease; the ratio of the two successive consecutive-term ratios at center $`y`$ is $`(1-y^{-2})^n\le e^{-n/y^2}`$ whenever both ratios exist. Consequently the poorer immediate neighbor is at most $`e^{-n/(2p^2)}T_*<T_*/16`$, and successive outward ratios on that side decrease. On the partner's side, the next ratio past the partner is at most $e^{-n/(p+1)^2}<1/32$, and later ratios are smaller. For the constants, $n\ge128$ gives $n/(2p^2)>14/5>\log16$ using $1/\sqrt{128}<89/1000$, and $n/(p+1)^2>7/2>\log32$ using $1/\sqrt{128}<9/100$; $\log2<7/10$ follows from the positive Taylor terms of $e^{7/10}$.

Let $\mathcal E$ consist of the indices other than the peak and partner. Thus
```math
\sum_{j\in\mathcal E}|y_j-p|T_j\lt T_*/6,\qquad
\sum_j T_j<3T_*,\qquad
\sum_j y_jT_j<(3p+2)T_*.
\tag{7}
```
Indeed the first bound sums $`\sum_{i\ge1}i16^{-i}+\sum_{i\ge2}i32^{-(i-1)}<1/6`$, and the last follows from the first and $`\sum|y_j-p|T_j<2T_*`$.

By the convolution of (2) with $\phi(t)=\sum_{\ell\ge0}(-1)^\ell e^{-(\ell+1/2)t}$,
```math
F_n(t)=\sum_{j\ge0}(-1)^j
 \left(y_j^n-\frac n2\sum_{k=1}^j k^{n-1}\right)e^{-y_j t}.
\tag{8}
```
Convexity gives $\sum_{k=1}^j k^{n-1}\le\int_{1/2}^{y_j}u^{n-1}du\le y_j^n/n$ by bounding each midpoint value by the integral over its unit interval. So the magnitude of a term of (8) is between $T_j/2$ and $T_j$. At the peak and partner the subtracted fraction is at most
```math
\frac n2 (j/y_j)^n\le\frac n2 e^{-n/(2y_j)}<1/16 .
```
For this and the bounds below put $v=\sqrt n\ge11$. On these two terms, $y_j\le v/3+2$ and $n/(2y_j)\ge (10/11)v$. The bound $(v^2/2)e^{-(10/11)v}$ is decreasing on $`v\ge11`$ and at $11$ is less than $1/16$ (already $e>2$ suffices). At any zero of $F_n$, (7)–(8) imply that the partner has magnitude greater than $`(1-1/16-1/6)T_*`$. Applying $`d/dt+p`$ kills the peak and gives multiplier of magnitude one to its partner. All other terms of that operator have absolute sum $`<T_*/6`$ by (7). At the zero $F_n'=(d/dt+p)F_n$, so $`|F_n'|>T_*/2`$.

We bound the two error terms in (4) on the same half-integer exponent scale, dropping signs. The correction $\tfrac12|\phi S_n|$ is at most
```math
\sum_{j\ge0}\frac{y_j}{2(n+1)} T_j < T_*/12,
```
by the midpoint integral for $`k^n`$ and (7). Indeed $`(3p+2)/(2(n+1))\le(v+5)/(2v^2)\le16/242<1/12`$. The magnitude of the coefficient of $`e^{-y_jt}`$ in $`(n/2)\phi' S_{n-1}`$ is bounded by $`(n/2)\sum_{k=1}^j(y_j-k)k^{n-1}`$. At the peak and partner its ratio to $`y_j^n`$ is at most
```math
\frac n2 y_j (j/y_j)^n
 \le \frac{v^2}2(v/3+2)e^{-(10/11)v}<1/32.
```
The right side is decreasing on $`v\ge11`$, and the value at 11 is below $`1/32`$ by $`e>8/3`$. For any other index, apply the same midpoint inequality to $`k^{n-1}`$ and note that for $`u\in[k-1/2,k+1/2]`$, $`y_j-k\le y_j-u+1/2`$. The coefficient ratio is therefore at most
```math
\frac{n}{2y_j^n}\int_0^{y_j}(y_j-u+1/2)u^{n-1}\,du
 =\frac{y_j}{2(n+1)}+\frac14 .
```
The sum off the two peaks is bounded by $`T_*(1/12+1/24)`$ by (7), while the two peaks cost at most $`T_*/16`$. In total $`|E_n|<T_*(1/12+1/16+1/12+1/24)<T_*/2`$. This proves (5) in the endpoint range.

## 3. Bulk: $0\le t\le3\sqrt n$

Set $R=\sqrt{t^2+\pi^2}$ and $\theta=\mathop{\mathrm{arccot}}(t/\pi)\in(0,\pi/2]$, so $R=\pi\csc\theta$ and $d\theta/dt=-\pi/R^2$. Put
```math
Z_\ell=(\cos\theta-i(2\ell+1)\sin\theta)^{-1},
\qquad q_\ell=|Z_\ell|,
\qquad P_m(\theta)=\sum_{\ell\ge0}\Re Z_\ell^m .
```
The geometric derivative functions have pole expansions
```math
\begin{aligned}
R^{m+1}S_m(t)&=-2m! P_{m+1}(\theta),
\\ R^{n+1}H_n(t)&=2n!\sum_{\ell\ge0}(-1)^\ell\Im Z_\ell^{n+1}.
\end{aligned}
\tag{9}
```
For a direct derivation, integrate the undifferentiated logistic functions times $(w-t)^{-m-1}$ over squares with real and imaginary edges $\pm2\pi L$, as $L\to\infty$ through integers. The logistic factors are uniformly bounded on these contours, hence for $m\ge1$ the integrals tend to zero. Each pole of $(1+e^w)^{-1}$ at $(2\ell+1)\pi i$ has residue $-1$, whereas the residue of $e^{w/2}/(1+e^w)$ there is $-i(-1)^\ell$. The derivative residue at $t$ and pairing conjugate poles give (9).

We have $Z_0=e^{i\theta}$, $q_\ell=(1+4\ell(\ell+1)\sin^2\theta)^{-1/2}$, and $|Z_\ell'/Z_\ell|\le2\ell+1$ by comparing numerator and denominator of its logarithmic derivative (prime now means $\theta$-derivative). Put $N=n+1$. For $n\ge128$ in this bulk,
```math
\sum_{\ell\ge1}(2\ell+1)q_\ell^{\,n}<1/6.
\tag{10}
```
Indeed $R^2\le10n$, $\pi^2>9$, and monotonicity of $(1+y/n)^n$ give $q_\ell^n\le(1+(9/320)\ell(\ell+1))^{-64}$. The first term is below $1/10$ by $3(1+9/160)^{-64}<1/10$. For $\ell\ge2$, the fifth binomial term gives $\binom{64}{5}(9/320)^5>1/8$; the remaining weight sum is at most $24\sum_{\ell\ge2}\ell^{-9}\le24(2^{-9}+2^{-8}/8)<1/15$. Moreover, for $t\le10$ we have $R^2<110$, so $q_\ell^n\le(1+(3/10)\ell(\ell+1))^{-64}$. Since $\binom{64}{6}(3/10)^6>4000$, the full sum over $\ell\ge1$ is at most $(3/4000)\sum_{\ell\ge1}\ell^{-11}<1/1000$. The integer inequalities are also checked by [the certificate](check_dyadic.py).

Write $a=\phi(t)R/2$. The normalized function $Q=R^N F_n/(2n!)$ then has main term
```math
\sin(N\theta)-a\cos(n\theta)
 =B\sin(N\theta)+C\cos(N\theta),
\qquad B=1-\frac{\pi}{2}\phi,\quad C=-\frac{t}{2}\phi.
\tag{11}
```
The error comes from the farther poles in (9). Let $S$ denote the farther-pole weight sum in (10) (or its smaller bound for $t\le10$). The absolute error is at most $(1+a)S$ and the absolute $\theta$-derivative of the error is at most $(N+a n+|a'|)S$, by the logarithmic derivative estimate. These series differentiate absolutely.

We have $B\ge1-\pi/4>1/5$. Also $\phi R\le\pi/2$ because $\cosh^2(t/2)\ge1+t^2/4\ge1+t^2/\pi^2$, giving $a<4/5$. The derivatives satisfy $|B'|+|C'|<8$ and $|a'|<8$. Indeed $\phi\le e^{-t/2}$, $`|\phi'_{\!t}|\le e^{-t/2}/2`$, and $`dt/d\theta=-R^2/\pi`$ give
```math
|B'|\le R^2 e^{-t/2}/4<13/4,\qquad
|C'|\le \frac{R^2}{2\pi}(1+t/2)e^{-t/2}<4.
```
For the last inequalities use $`\sup_{t\ge0}t^j e^{-t/2}=(2j/e)^j`$, $`e>8/3`$, $3<\pi<16/5$, and $\pi^2<10$. Finally $a=\sqrt{(1-B)^2+C^2}$ gives $|a'|\le|B'|+|C'|$.

At a zero of $F_n$, the main term (11) is at most $(1+a)S$ in absolute value. Its complementary phase term $B\cos(N\theta)-C\sin(N\theta)$ therefore has magnitude at least $\sqrt{B^2+C^2-((1+a)S)^2}$. If $t\le10$ this exceeds $19/100$, since $B>1/5$, $1+a<2$, and $S<1/1000$. Multiplying by $N$ and subtracting the coefficient derivatives and farther-pole derivative gives $|Q'|>N/10$ for $N\ge129$. If $t\ge10$, then $a\le(t+\pi)e^{-t/2}/2\le7e^{-5}<1/16$, since the intervening function decreases. Thus $B\ge1-a>15/16$ and $((1+a)S)<17/96$. The complementary phase magnitude exceeds $9/10$, which with the same derivative subtractions again gives $|Q'|>N/10$.

At the zero, this implies that the magnitude of $F_n'$ divided by the factor $2n!R^{-N}$ is greater than $(N/10)\pi/R^2$. In contrast, by (9) and $|P_n|,|P_N|<7/6$, the magnitude of $E_n$ in the same units is at most
```math
\frac7{12}\big(\phi+R|\phi'_{\!t}|\big).
```
Here $`R^2\phi<13`$, and
$`R^3|\phi'_{\!t}|\le(t+\pi)^3e^{-t/2}/2\le108e^{-(6-\pi)/2}<27`$,
by maximizing over $t$ and using $e^{7/10}>2$. Thus multiplying the error by $R^2/\pi$ gives less than $7\cdot40/(12\cdot3)<N/10$. This proves (5) in the bulk, including at $t=0$.

## 4. Interlacing and finite base

For $n\ge128$, suppose $D_n$ has $n$ distinct negative roots. The signs (6) alternate at them. The sign at the leftmost root opposes the degree-$`(n+1)`$ monic sign at $-\infty$, and that at the rightmost root is negative, opposing $D_{n+1}(0)=1$. Hence $D_{n+1}$ has a root in every required open gap, including both outer gaps, which exhaust its degree. Its roots are simple, negative, and strictly interlace.

For the base, $D_2=(1+x)^2$ and $D_3=(1+x)(1+10x+x^2)$ give the weak initial transition. [check.py](check_dyadic.py) uses exact integer coefficients from (1) and the Eulerian recurrences, with dyadic rational test points. It starts with three disjoint root brackets of $D_3$. For each next transition, refine every older sign-straddling bracket until both endpoints have the same nonzero sign for $D_{n+1}$, namely the sign of $D_n$ at its left endpoint. This certifies opposite next-polynomial signs at the two endpoints of each between-bracket gap and similarly at both extrema (the far-left endpoint is chosen by doubling, and the far-right endpoint is zero). The code checks these signs and disjointness and finds exactly $\deg D_{n+1}$ gaps. Consequently all next roots are simple and in those gaps, giving strict interlacing through $n=128$ and the base for the uniform proof.

**Priority.** Exact-title, author/statement, and recent-primary-source searches on 24 November 2026 located Chow’s open question, the established fixed-degree real-rootedness, and later sources still listing the consecutive statement open, but no earlier solution. This is a bounded search, not a worldwide priority assertion.

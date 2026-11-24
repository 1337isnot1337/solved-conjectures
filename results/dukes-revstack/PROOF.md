# Dukes’s revstack interlacing conjecture

[Dukes, *Revstack Sort, Zigzag Patterns, Descent Polynomials of t-Revstack Sortable Permutations, and Steingrímsson’s Sorting Conjecture*, Conjecture 5.6](https://doi.org/10.37236/3583) asks for distinct negative roots (besides 0) of the $(n-2)$-revstack descent polynomials, strictly interlacing those at size $n+1$. We prove this for every $n\ge3$. The printed range also includes the degenerate case $n=2$, where zero passes sort only the identity and the polynomial is $x$, as recorded in the same paper’s appendix. The case n=1 would require a negative number of passes. Thus the exact nondegenerate range is $n\ge3$. We do not claim the paper’s separate general revstack real-rootedness or sorting conjectures.

A search on 24 November 2026 using the author, article title, conjecture number, exact revstack and Eulerian formulations, and related recent work located the source and later citations but no previous resolution of the all-length interlacing. This is a bounded priority check, not a claim of worldwide priority.

## 1. Recurrence and a derivative criterion

Use $A_n(x)=\sum_{\pi\in S_n}x^{1+\operatorname{des}(\pi)}$. Dukes’s Theorem 3.3 and the appendix’s values for $n=3,4$ give
$$
W_n(x)=A_n(x)-A_a(x)A_b(x),\qquad
 a=\left\lfloor\frac{n-1}2\right\rfloor,\quad b=\left\lceil\frac{n-1}2\right\rceil.
\tag{1}
$$
The Eulerian recurrence is $A_{n+1}=x(1-x)A_n'+(n+1)x A_n$. The product rule and $a+b=n-1$ give
$$
W_{n+1}=x(1-x)W_n'+(n+1)xW_n+A_a A_{b+1}.
\tag{2}
$$
Indeed applying the differential operator in (2) to $A_aA_b$ gives $A_{a+1}A_b+A_aA_{b+1}$, and $A_{a+1}A_b$ is exactly the product subtracted in $W_{n+1}$ for both parities.

For real $t$, put $S_m(t)=(-1)^m (d/dt)^m(1+e^t)^{-1}$. At $t>0$, it is the geometric-series derivative
$$
S_m(t)=\sum_{k\ge1}(-1)^{k-1}k^m e^{-kt}.
\tag{3}
$$
With $x=-e^{-t}$, the Eulerian power-sum identity implies
$A_m(x)=-(1-x)^{m+1}S_m(t)$, first at $t>0$ and then on the real axis by analyticity. Define $F_n=S_n+S_aS_b$. Then
$$
W_n(-e^{-t})=-(1+e^{-t})^{n+1}F_n(t),\qquad
F_{n+1}=-F_n'-S_a S_{b+1}.
\tag{4}
$$
We prove
$$
|F_n'(t)|>|S_a(t)S_{b+1}(t)|
\quad\text{if }n\ge128,\ t\ge0,\ F_n(t)=0.
\tag{5}
$$
By (2)–(4), at any corresponding root $x\in[-1,0)$ of $W_n$, inequality (5) gives the strict sign
$$
\operatorname{sgn} W_{n+1}(x)=\operatorname{sgn}\big(x(1-x)W_n'(x)\big).
\tag{6}
$$
This also holds at roots $x<-1$ by reciprocity: $W_j(x)=x^{j+1}W_j(1/x)$, from Eulerian symmetry and (1). Differentiating at a root gives $W_n'(x)=-x^{n-1}W_n'(1/x)$. For $x<0$, the two sides of (6) transform with the same sign factor, since $x^{n+2}/(-x^{n-1})=-x^3>0$.

## 2. The endpoint regime $t\ge3\sqrt n$

Fix $n\ge128$, and put $T_m=m^n e^{-mt}$. Let $p$ be an index of a largest term, breaking ties arbitrarily. If $p>1$, the inequality $T_p\ge T_{p-1}$ gives $t\le n\log(p/(p-1))<n/(p-1)$; in all cases $p\le \sqrt n/3+1$. The successive ratios $r_m=T_{m+1}/T_m$ strictly decrease and satisfy
$$
r_m/r_{m-1}=(1-1/m^2)^n\le e^{-n/m^2}\quad (m\ge2).
$$
Choose the larger existing neighbor of $T_p$ as its partner (always $p+1$ if $p=1$). If both neighbors exist, the smaller has ratio to $T_p$ at most $e^{-n/(2p^2)}<1/16$: the product of their two ratios is $r_p/r_{p-1}$. Successive terms moving farther on this unpaired side decrease by ratios at most $1/16$. Immediately beyond the partner, moving outward, the ratio is at most $e^{-n/(p+1)^2}<1/32$ by the displayed successive-ratio identity, and all farther ratios are smaller. The constants follow from $p\le\sqrt n/3+1$ and $n\ge128$: $1/\sqrt{128}<89/1000$ gives $n/(2p^2)>14/5>\log16$, and $1/\sqrt{128}<9/100$ gives $n/(p+1)^2>7/2>\log32$. These logarithm bounds follow from $e^{7/10}>2$ by its positive Taylor terms.

Thus, writing $\mathcal E$ for the terms outside the peak and its partner,
$$
\sum_{m\in\mathcal E}|m-p|T_m<T_p/6
$$
by summing $\sum_{k\ge1} k16^{-k}+\sum_{k\ge2}k32^{-(k-1)}<1/6$. In particular $\sum_m T_m<3T_p$ and $\sum_m |m-p|T_m<2T_p$.

The convolution in (3) bounds the product and its weighted derivative. For $m=i+j$ one has $i^a j^b\le 2^{2-n}m^{n-1}$, since $(ij)^a\le(m^2/4)^a$ and $b-a\le1$. After summing at most $m$ terms for each $m$, this gives
$$
|S_a S_b|\le 2^{2-n}\sum_m T_m,\qquad
|(\tfrac d{dt}+p)(S_a S_b)|\le 2^{2-n}\sum_m|m-p|T_m.
$$
Likewise $i^a j^{b+1}\le 2^{2-n}m^n$, using $2a\ge n-2$, so $|S_a S_{b+1}|\le 2^{2-n}\sum_m m T_m\le (3p+2)2^{2-n}T_p$.

At a zero of $F_n$, the two peak terms of $S_n$ have opposite signs; the partner’s magnitude is at least $T_p-\sum_{m\in\mathcal E}T_m-|S_aS_b|>2T_p/3$. Further, $F_n'=(\tfrac d{dt}+p)F_n$ there. This kills the peak term and multiplies its partner by a factor of magnitude 1. All other terms in that derivative, including the derivative of the product, have absolute sum less than $T_p/6+2^{2-n}2T_p$. Hence $|F_n'|>T_p/3$, whereas $(3p+2)2^{2-n}<1/3$ using $p\le n$, $n\ge128$. This proves (5) in this regime.

## 3. The remaining regime $0\le t\le3\sqrt n$

The logistic derivative also has the convergent pole expansion
$$
S_m(t)=-m!\sum_{\ell\in\mathbb Z}\big(t-(2\ell+1)\pi i\big)^{-(m+1)}
\qquad(m\ge1).
\tag{7}
$$
For example, integrate $(1+e^w)^{-1}(w-t)^{-m-1}$ over the squares of real and imaginary boundaries $\pm2\pi L$ as $L\to\infty$ along integers. The logistic factor is uniformly bounded on these edges (on a horizontal edge the exponential is positive real, and on a vertical edge its modulus is exponentially small or large). The contour integral tends to zero for $m\ge1$. The other residues are from the simple logistic poles, each with residue $-1$. This gives (7) after accounting for the order-$(m+1)$ pole at $t$ and the derivative sign.

Put $R=(t^2+\pi^2)^{1/2}$ and $\theta=\operatorname{arccot}(t/\pi)\in(0,\pi/2]$, so $R=\pi\csc\theta$, and define
$$
Z_\ell=(\cos\theta-i(2\ell+1)\sin\theta)^{-1},\quad
P_j(\theta)=\sum_{\ell\ge0}\Re Z_\ell^j.
$$
The paired-pole expansion is $R^{m+1}S_m=-2m!P_{m+1}$. The nearest pair contributes $\Re Z_0^j=\cos(j\theta)$. Write $q_\ell=|Z_\ell|=[1+4\ell(\ell+1)\sin^2\theta]^{-1/2}$. Also $|Z_\ell'/Z_\ell|\le2\ell+1$ by comparing the numerator and denominator of its logarithmic derivative. The relevant sums and differentiated sums converge absolutely.

We record explicit uniform bounds for $n\ge128$. Since $R^2\le10n$ and $\pi^2>9$, with $N=n+1$ we have
$$
\sum_{\ell\ge1}(2\ell+1)q_\ell^N<\frac16 .
\tag{8}
$$
Indeed $q_\ell^N\le(1+(9/320)\ell(\ell+1))^{-64}$, by monotonicity of $(1+y/n)^n$ in $n$. The $\ell=1$ contribution is less than $1/10$ by $3(1+9/160)^{-64}<1/10$. For $\ell\ge2$ use $\binom{64}{5}(9/320)^5>1/8$ to bound the tail by $24\sum_{\ell\ge2}\ell^{-9}\le24(2^{-9}+2^{-8}/8)<1/15$. Likewise, if $m\in\{a,b,b+1\}$ then $m+1\ge n/2$, so $q_\ell^{m+1}\le(1+(9/320)\ell(\ell+1))^{-32}$. The first term is at most 3; using $\binom{32}{4}(9/320)^4>1/50$, the tail is bounded by $150\sum_{\ell\ge2}\ell^{-7}\le150(2^{-7}+2^{-6}/6)<2$. Including $\ell=0$, we have
$$
|P_{m+1}|\le6,\qquad |P_{m+1}'|\le6(m+1).
\tag{9}
$$
The elementary integer inequalities used here are also checked in [the certificate](check.py).

Consider $Q=-R^N F_n/(2n!)$. Its main term is $\cos(N\theta)$, and its error consists of farther poles plus the normalized product $-2a!b! P_{a+1}P_{b+1}/n!$. Since the binomial coefficient $\binom{n-1}{a}$ is maximal and at least $2^{n-1}/n$, the ratio $a!b!/n!\le2^{1-n}$. By (8)–(9), the absolute error is less than $1/5$ and the error in the $\theta$-derivative is less than $N/5$. At a zero of $F_n$, we therefore have $|\cos(N\theta)|<1/5$, so $|\sin(N\theta)|>9/10$ and $|Q'|>N/2$. As $|d\theta/dt|=\pi/R^2$, this implies
$$
|F_n'(t)|> n! N\pi R^{-N-2}.
$$
On the other hand, the pole bounds give $|S_a S_{b+1}|\le144a!(b+1)!R^{-N-1}$. The ratio to the derivative lower bound is at most
$$
144(b+1)2^{1-n}\frac{R}{N\pi}
 \le144\cdot 2^{1-n}\frac{\sqrt{10n}}{\pi}<1.
$$
This proves (5) in the remaining regime, including $t=0$.

## 4. Strict interlacing

For each $n\ge3$, (1) is monic of degree $n$, has a simple root 0, and has coefficient 1 of $x$. Suppose $W_n$ has $n-1$ simple negative roots. At the distinct negative roots its derivative signs alternate; (6) gives the opposite signs for $W_{n+1}$. At the leftmost root this sign also opposes the sign of the monic degree-$(n+1)$ polynomial at $-\infty$. At the rightmost root it is positive, whereas $W_{n+1}$ is negative just left of zero. Thus there is a negative root in every strict interval of the required alternating sequence, including the two outer intervals. There are $n$ such intervals, so together with zero they exhaust the degree; all are simple. This proves every transition starting at $n\ge128$.

For the finite base, [check.py](check.py) uses integer Eulerian coefficients and exact rational sign evaluation of $P_n=W_n/x$. It starts with two disjoint, sign-straddling brackets for $P_3=1+3x+x^2$. At each transition it refines each old bracket until $P_{n+1}$ has the same nonzero sign at both ends, specifically the sign of $P_n$ at the left end. Then every open gap between those brackets, and both outer gaps, has opposite $P_{n+1}$ signs at its endpoints. The code checks these signs and counts exactly $\deg P_{n+1}$ disjoint new brackets. The degree count proves that each gap has a single simple root and that no root lies in an old bracket. All arithmetic is exact, including cases where the refinement hits a rational root of $P_n$. The checks cover $3\to4$ through $127\to128$, giving the finite base for the uniform analytic induction.

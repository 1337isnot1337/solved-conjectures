# Heim–Neuhauser's ordinary D’Arcais root conjecture

This note gives an exact computer-assisted proof of [Conjecture 2 in Heim–Neuhauser, *Polynomization of Sun's conjecture*](https://doi.org/10.1007/s11139-026-01435-0), replayed locally and independently reviewed. The analytic bounds cover all real parameters; the computational steps check integer polynomial coefficients and rational enclosures, not sampled real inequalities.

Put $g(k)=\sigma_1(k)=\sum_{d\mid k}d$, $H(z)=\sum_{k\ge1}g(k)z^k/k$, and $P_n(x)=[z^n]\exp(xH(z))$. The exact conjecture is
```math
P_n(x)^{n+1}>P_{n+1}(x)^n\qquad(n\ge6,\ x\ge1).
```
We prove as well strict log-concavity $P_n(x)^2>P_{n-1}(x)P_{n+1}(x)$ for $n\ge26,\ x\ge1$. This concerns the ordinary $\sigma_1$ D’Arcais polynomials, not the $\sigma_2$ plane-partition polynomials. The source's Theorems 3.2 and 3.3 cover a finite initial range in $n$ and all integer $x$, respectively. [Bringmann–Kane–Rolen–Tripp](https://arxiv.org/abs/2011.08874) give an explicit older fractional inequality subject to a threshold depending on the real parameter and confirm the integer Chern–Fu–Tang conjecture. No prior resolution of the unrestricted real-parameter root conjecture turned up in exact-title, statement, and cited/citing-paper searches through November 2026. This is a bounded search.

## 1. Fourier sign

For $n\ge501$, $x\ge1$, choose $r\in(0,1)$ with $x\sum_{k\ge1}g(k)r^k=n$, and set $\delta=1-r$,
```math
V=x\sum_{k\ge1} k g(k)r^k,\qquad K_3=x\sum_{k\ge1}k^2g(k)r^k.
```
Existence and uniqueness follow from the strict increase from zero to infinity of the saddle sum, since $g(k)\ge k$. The compound-Poisson intensities $\lambda_k=xg(k)r^k/k$ give probabilities $p_j=e^{-xH(r)}r^jP_j(x)$ and centered characteristic function
```math
\Phi(t)=\exp\Big(\sum_{k\ge1}\lambda_k(e^{ikt}-1-ikt)\Big)=e^{-A(t)+i\theta(t)}.
```
Fourier inversion gives
```math
p_n-\tfrac12(p_{n-1}+p_{n+1})=\pi^{-1}\int_0^\pi(1-\cos t)e^{-A(t)}\cos\theta(t)\,dt .
```
If the integral is positive, the arithmetic/geometric mean inequality and cancellation of the tilt give strict log-concavity.

Normalize by multiplying by $V^{3/2}$ and putting $u=t\sqrt V$. The normalized integrand is $V(1-\cos t)e^{-A(t)}\cos\theta(t)$. We always have $V\ge501$, $A(t)\le Vt^2/2$ and $\lvert\theta(t)\rvert\le K_3t^3/6$ for $t\ge0$. The certificate below shows $\gamma^2=K_3^2/V^3\le49/256$. On $0\le u\le11/4$, therefore, the cosine is nonnegative, since $(7/16)(11/4)^3/6<\pi/2$. On $0\le u\le2$ we have $\cos\theta(t)\ge239/288$ and
```math
V(1-\cos t)\ge (u^2/2)(1-1/(3\cdot501)),\qquad e^{-A(t)}\ge e^{-u^2/2}.
```
Integrating the Taylor lower polynomial of order 11 of $e^{-u^2/2}$ proves, by an exact rational inequality, a positive main integral greater than $19/50$.

## 2. Ordinary divisor-weight bounds

The identity $g(k)/k=\sum_{d\mid k}1/d$ gives $A(t)=\sum_{d\ge1}A_d(t)$, with
```math
\begin{aligned}
A_d(t)&=\frac{x r^d}{d(1-r^d)}
       \frac{(1+r^d)c_d(t)}{(1-r^d)^2+2 r^d c_d(t)},\qquad c_d(t)=1-\cos(dt),
\\ &=\frac{V_{0,d}}{V}\frac{c_d(t)}{d^2t^2}\frac{u^2}{1+s_d},\qquad
V_{0,d}=\frac{x d r^d(1+r^d)}{(1-r^d)^3},\quad
s_d=\frac{2r^d c_d(t)}{(1-r^d)^2}.
\end{aligned}
```
These follow by taking the real part of the geometric series $\sum_{m\ge1} r^{dm}e^{idmt}$. The seven terms $d=1,\ldots,7$ give lower bounds on $A$. On a normalized bin $u\in[\ell,v]$, let $M_d\le V_{0,d}/V$, $S_d\ge r^d d^2/((1-r^d)^2 V)$, and $`V_*\le V`$. Then
```math
A(t)\ge \ell^2\sum_{d=1}^{7}\frac{M_d\,\max(0,\,1/2-d^2v^2/(24V_*))}{1+S_d v^2}.
```
Thus the absolute normalized tail on $[11/4,20]$ is bounded by summing $(v^3-\ell^3)e^{-w}/6$ for these lower exponents $w$, on bins of width $1/20$. Here $V(1-\cos t)\le u^2/2$. Each exponential upper bound in the script uses a rounded-down nonnegative exponent and the reciprocal of a finite positive Taylor polynomial for the exponential, rounded upward.

## 3. Rational boxes below $r=0.99$

Take $a\le r\le b$, $a=i/1000,b=(i+1)/1000$, $0\le i<990$. For $j=0,1,2$ let $D_j(r)=\sum_{k\ge1}k^j g(k)r^{k-1}$. The script calculates lower $L_j\le D_j(a)$ and upper $U_j\ge D_j(b)$ by exact partial summation to $K=1200$ and a geometric tail. Indeed for $k=K+i$ (now $i\ge1$),
```math
g(k)\le k(1+\log k)\le k(9+i/K)
```
by $\log1200<8$ and $\log(1+i/K)\le i/K$. Expanding powers of $K+i$ and using $\sum_{i\ge1}i^j b^{i-1}\le j!/(1-b)^{j+1}$ gives the exact tail in the script. All arithmetic is rational, with some outward rounding to $10^{-8}$.

Write $h=xr$, $h_0=\max(a,501/U_0)$, and $`V_*=\max(501,h_0L_1)`$. Then $`h\ge h_0`$, $`V\ge V_*`$, and $`\gamma^2\le U_2^2/(h_0 L_1^3)`$. In §2 we may use
```math
M_d=\frac{d a^{d-1}(1+a^d)}{(1-a^d)^3 U_1},\qquad
S_d=\frac{b^d d^2}{(1-b^d)^2 V_*}.
```
At $a=0$, interpret $a^0=1$. The program raises $M_1$ to $3/5$ if the displayed box bound is smaller; the uniform comparison $V\le\zeta(2)V_{0,1}$ proved below justifies this.

The outer tail $u>20$ is covered by either of the following two tested bounds.

- **Cheap bound where sufficient.** Put $B=xr/\delta=h/\delta$. For $t\le\delta$, we have $s_1\le1$ and $(1-\cos t)/t^2\ge11/24$, hence $A_1(t)\ge u^2/10$. Its $u>20$ Gaussian tail is bounded by elementary integration using $u^2\ge400+40(u-20)$. For $t\ge\delta$, monotonicity of $c_1(t)$ on $[0,\pi]$ and $c_1(\delta)\ge(11/24)\delta^2$ give $A_1(t)\ge(11/24)B$. Since $B\ge B_0=h_0/(1-a)$ and $V\le(1-a)U_1B$, if $(11/24)B_0\ge3/2$, then the normalized outer bound is at most $\pi(h_0U_1)^{3/2}\exp(-(11/24)B_0)$. This follows by monotonicity of $B^{3/2}\exp(-(11/24)B)$ above $B_0$ and $\int_{\delta}^{\pi}(1-\cos t)dt\le\pi$. The quick bound is used only when it is below $1/20$.
- **Detailed bound elsewhere.** For $0\le t\le1/100$ we have $t\le\delta$ throughout these boxes, so the same Gaussian integral works. Cover $1/100\le t\le\pi$ by rational bins $[t_a,t_b]$ of width at most $1/100$, bounded at the end by a rational upper bound for $`\pi`$. In each bin, $u>20$ implies $`h\ge h_*:=\max(h_0,400/(t_b^2 U_1))`$. Compute $`c_d^-\le c_d(t)`$ from the lower distance between $`[d t_a,d t_b]`$ and the intervals enclosing $`2j\pi`$. Cap the resulting lower distance at the lower bound for $`\pi`$, and use the cosine Taylor series through degree 8; this is a lower bound for the cosine defect, by the alternating remainder at $`u\le\pi`$. The rational bounds on $`\pi`$ used here are verified by Machin's formula and alternating arctangent series. Thus
```math
A(t)\ge h C,\qquad
C=\sum_{d=1}^7
\frac{a^{d-1}(1+a^d)c_d^-}
{d(1-a^d)((1-a^d)^2+2b^d c_d^-)}.
```
Using a lower $`c_d^-`$ is valid since the fraction is increasing in the cosine defect; using $`a,b`$ enlarges the denominator and decreases the numerator. The script rounds this lower bound further down and verifies $`h_* C\ge3/2`$ for each used bin. Consequently $h^{3/2}e^{-h C}$ is decreasing over $`h\ge h_*`$, and the normalized bin bound is $`(t_b-t_a)\min(2,t_b^2/2)(h_* U_1)^{3/2}e^{-h_* C}`$. Use integer square roots rounded upward.

## 4. The analytic $r\ge0.99$ regime

Here $R=99/100$, $\delta\le1/100$. For $s>0$, elementary hyperbolic power-series comparison gives
```math
\sum_{k\ge1}k^2 e^{-sk}\le 2/s^3,\qquad
\sum_{k\ge1}k^3 e^{-sk}\le (20/3)/s^4.
```
To verify them, put $v=s/2$. The sums equal $\cosh v/(4\sinh^3v)$ and $(2+\cosh2v)/(8\sinh^4v)$, respectively. In $\sinh^3v=(\sinh3v-3\sinh v)/4$, the ratios of its coefficients to those of $v^3\cosh v$ are 1 at degrees 3 and 5, then increase, by the ratio $(3^{2j+1}-3)/(4(2j+1)(2j)(2j-1))$. For $\sinh^4v=(\cosh4v-4\cosh2v+3)/8$ compared to $v^4(2+\cosh2v)$, the ratios are $1/3$ at degrees 4 and 6, $3/10$ at degree 8, and increase thereafter: the ratio at degree $2j$, $j\ge3$, is $(2^{2j+1}-8)/[(2j)(2j-1)(2j-2)(2j-3)]$. For $j\ge4$ the numerator grows by a factor greater than 4 and the denominator by at most 3. Thus $\sinh^4v\ge(3/10)v^4(2+\cosh2v)$.

In addition, $s^3 S_2(e^{-s})$ is decreasing, where $S_2(q)=\sum k^2q^k$. To see this, logarithmically differentiate $v^3\cosh v/\sinh^3v$, with $v=s/2$. The desired sign is equivalent to $y(2+\cosh y)\ge3\sinh y$, $y=2v$. The coefficient of $y^{2j+1}$ in the difference is $(2j-2)/(2j+1)!$ for $j\ge1$, and the linear coefficient is zero. Hence $S_2(r^d)\le S_2(r)/d^3$ and $V=x\sum_d d S_2(r^d)\le\zeta(2) V_{0,1}$, valid for every $r\in(0,1)$.

Write $s=-\log r\ge\delta$. Grouping divisor multiples now yields
```math
V=x\sum_{d\ge1}d\sum_{k\ge1} k^2r^{dk}\le (10/3)x\delta^{-3},\qquad
K_3=x\sum_{d\ge1}d^2\sum_{k\ge1} k^3r^{dk}\le (100/9)x\delta^{-4}
```
using $\zeta(2)<5/3$. Since $V\ge xr(1+r)/\delta^3$, this gives
```math
\gamma^2\le (100/9)^2 (1-R)/(R(1+R))^3<49/256.
```
The §2 middle bound uses $`V_*=R(1+R)/(1-R)^3`$,
```math
M_d=(3/10)R^d(1+R^d)/d^2,\qquad S_d=(1-R)/(R(1+R)R^{2d-2}).
```
Indeed $dR^{d-1}\delta\le1-r^d\le d\delta$. If $t\le3\delta$, then $s_1\le9$, $M_1\ge59/100$, and the Gaussian tail can use $A_1\ge u^2/40$. If $t\ge3\delta$, then $s_1\ge8$ and $A_1\ge(8/9)B$, for $B=xr/\delta\ge99$. Also $V\le4 B^3$, by $V\le(10/3)x\delta^{-3}$ and $x\ge1$. Thus the normalized outer term is at most $8\pi B^5e^{-(8/9)B}$, largest over $B\ge99$ at $B=99$.

The [rational certificate](heim-neuhauser-ordinary-fourier.py) checks the central bound, all gamma bounds, and that the total absolute normalized tail is less than $19/50$ in the 990 boxes and final regime. The underlying domains are closed cover conditions for all real $x\ge1$ and every $n\ge501$, so a passing certificate proves strict log-concavity on that entire range. The exact replay passed: rounded diagnostic maxima were 0.14848002 for the normalized tail below 0.99, 0.09723753 in the last regime, and 0.18521646 for the squared normalized third cumulant below 0.99. These decimals are not inputs.

## 5. Finite checks and propagation

Differentiating the generating function in $z$ gives $nP_n=x\sum_{k=1}^n g(k)P_{n-k}$, $P_0=1$. Put $B_n(t)=n!P_n(1+t)$. The exact integer recurrence is
```math
B_n(t)=(1+t)\sum_{k=1}^n g(k)\frac{(n-1)!}{(n-k)!}B_{n-k}(t).
```
The [small-index certificate](heim-neuhauser-ordinary-small.py) verifies nonnegative coefficients and positive constant term of $(n+1)^nB_n^{n+1}-n!B_{n+1}^n$ for $6\le n\le25$. This clears the factorials in the root inequality. The [GMP coefficient certificate](heim-neuhauser-ordinary-finite.cpp) verifies the same type of positivity for $(n+1)B_n^2-nB_{n-1}B_{n+1}$, for $26\le n\le500$; this clears the factorials in the Turán inequality. GMP simply accelerates exact polynomial products by packing nonnegative coefficient arrays in base $2^{64s}$. The bin width $64s$ is $2m+2l$ rounded upward to a multiple of 64, with $m$ the largest constituent coefficient bit length and $l$ the bit length of $n+2$. Thus each product coefficient after scaling by $n$ or $n+1$ is less than the bin base (sum of at most $n+2$ products, each less than $2^{2m}$). There are no carries between bins, and comparing unpacked coefficient digits certifies the exact sign.

At fixed $x\ge1$, let $R_n=P_n^{1/n}$ and $Q_n=P_n/P_{n-1}$. The inequality $R_{n-1}>R_n$ is equivalent to $R_n>Q_n$; strict log-concavity gives $Q_n>Q_{n+1}$ from $n=26$ onward. Starting with the finite $n=25$ comparison proves every remaining root inequality, exactly as the propagation principle of Heim–Neuhauser's Proposition 2.1 prescribes.

## Reproduction

Run with Python assertions enabled and GMP installed:

    python heim-neuhauser-ordinary-fourier.py
    python heim-neuhauser-ordinary-small.py
    g++ -O3 -Wall -Wextra heim-neuhauser-ordinary-finite.cpp -lgmpxx -lgmp -o ordinary-finite
    ./ordinary-finite

Decimal output is diagnostic only; no proof test uses floating point.

## Corollary: the previously corrected fractional Chern–Fu–Tang statement

This is not counted as a new resolution of the literal original fractional statement. [Bringmann–Kane–Rolen–Tripp](https://arxiv.org/abs/2011.08874) already pointed out that the older Heim–Neuhauser continuous extension is false as printed; their corrected exceptional set is the triple family $(x,a,b)=(x,6,4)$, $2\le x<x_0$, where $x_0$ is the positive root of
```math
W(x)=x^7+42x^6+684x^5+4038x^4+13119x^3+12048x^2-100204x-59328.
```
We obtain the **corrected** ratio comparison $P_{a-1}(x)P_{b+1}(x)\ge P_a(x)P_b(x)$ for all real $x\ge2$, all integers $a>b\ge1$, except that documented family. If $a=b+1$, equality is automatic. For $a\ge b+2$, this is $Q_{b+1}\ge Q_a$ in the notation above. When $a\le26$ and $(a,b)\ne(6,4)$, the small-index checker verifies nonnegative coefficients after shifting $x=2+t$ and clearing the factorials to $aB_{a-1}B_{b+1}-(b+1)B_aB_b$. The constant coefficient is positive except for $(a,b)=(4,2)$, where equality is allowed at $x=2$ and a positive leading coefficient gives strictness for $x>2$. If $a\ge27$, log-concavity orders all $Q_j$ for $j\ge26$; for $b+1<26$, use the verified $a=26$ comparison as the boundary. At $(6,4)$, the exact checker verifies that the scaled polynomial equals $x^2(x+3)W(x)$. Descartes' rule and the signs at zero and infinity give a unique positive root of $W$, with the sign changing from negative to positive there. We credit the earlier authors for the exceptional polynomial and do not count identifying it again.

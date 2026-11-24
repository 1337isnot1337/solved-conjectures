# Rossi's permutohedron characteristic-polynomial conjecture

**Result.** We prove [Conjecture 6.16 of Giovanni Rossi, *Beyond geometric lattices: pseudo-atoms and redundant join representations in the face lattice of the permutohedron*](https://arxiv.org/html/2611.25741v1#S6.SS5). For each $n\ge3$, the characteristic polynomial $\chi_n(t)$ has $n$ distinct positive real roots: $n-2$ in $(0,1)$, the root $1$, and one in $(1,\infty)$. The proof is uniform for $n\ge128$; a standard-library-only exact integer sign certificate covers $3\le n<128$. The $q$-deformed Conjecture 9.7 is not claimed.

## 1. Reduction and sign grid

Let $A_n(u)=\sum_{\pi\in S_n}u^{\mathrm{des}(\pi)}$ be the ordinary monic Eulerian polynomial (degree $n-1$). Rossi's [Theorem 6.11 and Proposition 6.17](https://arxiv.org/html/2611.25741v1#S6.SS5) identify
```math
 \chi_n(t)=t^n P_n(1-1/t),\qquad P_n(u)=1-(1-u)A_n(u).
 \tag{1}
```
Thus we need $n-2$ roots of $P_n$ in $(-\infty,0)$, the simple root $0$, and one in $(0,1)$. Set $N=n+1$, and for $1\le j\le n$ define
```math
 x_j=\pi\cot(\pi j/N),\qquad u_j=-e^{-x_j}.
```
We show for $n\ge128$ that $(1-u_j)A_n(u_j)$ has sign $(-1)^{j-1}$ and magnitude greater than $1$ for $2\le j\le n$. Hence $P_n(u_j)$ has sign $(-1)^j$. The $u_j$ strictly decrease, giving $n-2$ distinct negative roots.

## 2. Two expansions of the same function

Put $f(x)=(1+e^x)^{-1}$ for real $x$, and $H_n(x)=(-1)^n f^{(n)}(x)$. For $x>0$, geometric series differentiation gives
```math
 H_n(x)=\sum_{m\ge1}(-1)^{m-1}m^n e^{-mx}.
 \tag{2}
```
The Eulerian identity $A_n(u)/(1-u)^{n+1}=\sum_{m\ge0}(m+1)^n u^m$, valid for $|u|<1$, now gives
```math
 (1-u)A_n(u)=e^x(1+e^{-x})^{n+2}H_n(x),\qquad u=-e^{-x}.
 \tag{3}
```
Both sides are real analytic for real $x$, so this holds for all real $x$.

There is also an absolutely convergent partial-fraction expansion for $n\ge1$:
```math
 H_n(x)=-n!\sum_{\ell\in\mathbb Z}\big(x-(2\ell+1)\pi i\big)^{-N}.
 \tag{4}
```
For completeness, integrate $f(w)/(w-x)^{N}$ over the square with real and imaginary boundaries $\pm 2\pi L$ as $L\to\infty$ through integers. On its horizontal edges $e^w$ is positive real, while its vertical edges have $|e^w|$ uniformly near zero or large. Thus $f(w)$ is bounded on the contour and the integral tends to zero. The poles $w=(2\ell+1)\pi i$ have residue $-1$ for $f$, and the residue at $w=x$ is $f^{(n)}(x)/n!$. On moving terms and multiplying by $(-1)^n$ we obtain (4).

We may first handle $1\le j\le N/2$ (the left half of the indices, $x_j\ge0$). Indeed $x_{N-j}=-x_j$ and $f(-x)=1-f(x)$, so $H_n(-x)=(-1)^{n-1}H_n(x)$. The factor multiplying $H_n$ in (3) is positive and its value at $-x$ is $e^{nx}$ times its value at $x$.

## 3. Near the endpoint: one term in the series

Suppose $1\le j\le\sqrt n/3$. For $0<\theta\le\pi/2$, $\cot\theta\le1/\theta$ and $1/\theta-\cot\theta\le\theta$. The latter follows from $\sin\theta-\theta\cos\theta=\int_0^\theta s\sin s\,ds\le\theta^3/3$ and $\sin\theta\ge2\theta/\pi$. Consequently
```math
 N/j-\pi^2 j/N\le x_j\le N/j .
```
Let $T_m=m^n e^{-mx_j}$. Using $\log(1+1/j)\le1/j-1/(2j(j+1))$ and $j+1\le2j$, we get
```math
 \log(T_{j+1}/T_j)\le-\frac{n}{2j(j+1)}-\frac1j+\frac{\pi^2j}{N}
 \le-\frac94+\frac{10}{3\sqrt n}<-\frac32 .
```
For $j\ge2$, using $\log(1-1/j)\le-1/j-1/(2j^2)$,
```math
 \log(T_{j-1}/T_j)\le-\frac{n}{2j^2}+\frac1j\le-4 .
```
For $j=1$ the left tail is absent. The ratios further away decrease in both directions by concavity of $\log T_m=n\log m-m x_j$. Because $e^{-3/2}<1/4$ and $e^{-4}<1/16$, the sum of all terms other than $j$, in absolute value divided by $T_j$, is less than $1/3+1/15<1/2$. Thus (2) has sign $(-1)^{j-1}$ and magnitude greater than $T_j/2$.

For $j\ge2$, (3) has magnitude greater than $j^n e^{-(j-1)x_j}/2>1$. Indeed
```math
 \log\big(j^n e^{-(j-1)x_j}\big)
 \ge n(\log j-1+1/j)-(1-1/j)
 \ge n(\log 2-1/2)-1>\log 2 .
```
Here $\log j-1+1/j$ increases for $j\ge1$, and $\log 2>2/3$, for example by Jensen's inequality for the strictly convex function $1/x$ on $[1,2]$. For $j=1$, (3) instead has magnitude greater than $1/2$, which suffices for the reflected index $j=n$: $x_1\ge N-\pi^2/N>1$, and the reflection multiplies the magnitude by $e^{nx_1}$.

## 4. In the bulk: the nearest two poles

Suppose $\sqrt n/3<j\le N/2$. The two nearest poles $\pm\pi i$ in (4) contribute
```math
 \frac{2(-1)^{j-1}n!}{(x_j^2+\pi^2)^{N/2}},
```
because their arguments after conjugation have absolute value $\pi j/N$. The ratio of the other poles' absolute contributions to the magnitude of this term is at most
```math
 E=\sum_{\ell\ge1}
 \left(1+\frac{4\pi^2\ell(\ell+1)}{x_j^2+\pi^2}\right)^{-N/2}.
```
Since $0\le x_j\le N/j<3N/\sqrt n$ and $n\ge128$, we have $x_j^2+\pi^2\le10N$. For $a\ge0$, $(1+a/N)^N$ increases with $N$, as follows by differentiation. Since $4\pi^2/10>3$ and $N\ge37$, each summand in $E$ is at most
```math
 \left(1+\frac{3\ell(\ell+1)}{37}\right)^{-37/2}
 \ < \ \frac1{\ell^2(\ell+1)^2}.
```
The final bound uses the quadratic term of the binomial expansion of the same base to power $18$, since $\binom{18}{2}(3/37)^2>1$. Now $\sum_{\ell\ge1}1/(\ell^2(\ell+1)^2)<1/2$, by comparison with $\frac12\sum_{\ell\ge1}1/(\ell(\ell+1))=1/2$. Thus (4) has the claimed sign and magnitude greater than $n!/(x_j^2+\pi^2)^{N/2}$.

This magnitude exceeds $1$: $n!>(n/3)^n$ by integration of $\log x$ and $e<3$, and $10N\le11n$. Hence
```math
 \frac{n!}{(10N)^{N/2}}>
 \frac{(n/99)^{n/2}}{\sqrt{11n}}>1 \qquad(n\ge128).
```
For the last comparison, $n/99>5/4$ and $(5/4)^n>11n$ for $n\ge128$, by the binomial theorem at $n=32$ and then induction (one may use $(5/4)^8>5$). The prefactor in (3) is at least $1$ for $x_j\ge0$.

Sections 3–4 cover the nonnegative half, with $j=1$ treated as needed for reflection. For the negative half, the sign from reflection is still $(-1)^{j-1}$ at index $j$, since $N=n+1$; the reflected magnitudes are at least as large, including the strict bound for the reflection of $j=1$. This completes the sign-grid proof for $n\ge128$.

## 5. Exact certificates and conclusion

For $3\le n<128$, [check.py](check.py) constructs the Eulerian polynomial using the integer insertion recurrence
```math
 A(n,k)=(k+1)A(n-1,k)+(n-k)A(n-1,k-1),\qquad A(1,0)=1.
```
It picks strictly decreasing negative rational sample points beside the same grid, then checks $P_n$ at each with integer Horner arithmetic. Floating point only proposes candidate rationals; it is not used to certify a sign, ordering, closeness to the analytic grid, or a root. Passing the exact tests for 8000 sample points gives the same $n-2$ negative roots in this finite range by the intermediate value theorem.

For all $n\ge3$, $P_n(0)=0$, $P'_n(0)=1-A(n,1)=n+2-2^n<0$, and $P_n(1)=1$, giving one root in $(0,1)$ in addition to $0$. One can count $A(n,1)=2^n-n-1$ by concatenating two nonempty increasing words on complementary sets of labels: among the $2^n-2$ assignments, exactly the $n-1$ initial-segment assignments have no descent at the cut. Thus all $n$ roots of degree-$n$ $P_n$ are distinct. Equation (1) maps them to the required intervals for $\chi_n$. $\square$

Attribution and priority: Rossi stated the conjecture, supplied the Eulerian transformation, proved the auxiliary derivative inequality would suffice, and tested many finite values by Sturm sequences. The present proof uses a different explicit grid, the two convergent logistic expansions, and exact finite signs. Searches of the conjecture number, article identifier, title, characteristic-polynomial/Eulerian formulation, and related public claim records on 24 November 2026 did not locate an earlier resolution. This is limited priority screening, not an assertion of worldwide priority.

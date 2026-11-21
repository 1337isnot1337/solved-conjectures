# Simon's stable-branch question

Research note, 21 November 2026. This note is not included in the solved-conjecture count. The source uses the geometric phrase “Asian subroof” without a mathematical definition. We prove a precise connecting-curve theorem and a restriction showing why a strictly interior, strictly peaked interpretation would be impossible. The scope ambiguity and the source-search limit remain explicit.

## 1. Source and precise statements

Thomas Simon, *Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), article16, final paragraph before the acknowledgements; [author preprint arXiv:1310.1888](https://arxiv.org/pdf/1310.1888), printedp26; [published article](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/3058/3058-16117-1-PB.pdf), printedp24.

For a strictly stable law of index $`a`$ and positivity parameter $`\rho`$, let $`X^+(a,\rho)`$ be its positive conditional branch in the source's normalization. For $`1<a\le2`$, admissibility means
```math
1-\frac1a\le\rho\le\frac1a.
\tag{1}
```
The source asks for a subroof joining the parameter points $`(1,0)`$, $`(A,1/2)`$ and $`(1,1)`$, for each $`1<A<2`$, along which the positive branches, after suitable scaling, decrease in convex order.

Here is a precise existence result. Define, for $`0<\rho<1`$,
```math
a_A(\rho)=\min\left(A,\frac1{1-\rho},\frac1\rho\right),
\qquad
V_\rho=\frac{X^+(a_A(\rho),\rho)}
             {\mathbb E X^+(a_A(\rho),\rho)}.
\tag{2}
```
Then
```math
V_{\rho_2}\le_{\rm cx}V_{\rho_1}
\quad\text{whenever}\quad 0<\rho_1<\rho_2<1.
\tag{3}
```
The parameter curve is continuous, admissible, passes through $`(A,1/2)`$, and its closure has the required endpoint coordinates. It has a plateau on $`[1-1/A,1/A]`$ and follows the outer admissible boundaries elsewhere.

There is also an obstruction. For any decreasing-convex-order family through $`(A,1/2)`$, every later parameter with $`\rho>1/A`$ must lie on the right boundary $`a=1/\rho`$. If the path has maximum index $`A`$, its entire right half is forced to be
```math
a(\rho)=
\begin{cases}
A,&1/2\le\rho\le1/A,\\
1/\rho,&1/A\le\rho<1.
\end{cases}
\tag{4}
```
Thus a path required to remain strictly inside the admissible region on the right cannot exist; nor can a path of maximum $`A`$ be strictly decreasing in height immediately after $`\rho=1/2`$.

The source does not specify whether a plateau and boundary segments are allowed. For that reason, neither (3) nor the obstruction is presented as an unqualified resolution of its informal conjecture.

## 2. Mellin transform and normalization

The source's Proposition7 gives the classical independent factorization
```math
X^+(a,\rho)\ \stackrel d=\left(\frac{Z_{a\rho}}{Z_\rho}\right)^\rho,
\tag{5}
```
where $`Z_b`$ is a positive $`b`$-stable random variable with Laplace transform $`\exp(-t^b)`$ and $`Z_1=1`$. Using its classical fractional-moment formula gives
```math
\mathbb E[X^+(a,\rho)^s]
=\frac{\Gamma(1+s)\Gamma(1-s/a)}
       {\Gamma(1+\rho s)\Gamma(1-\rho s)}.
\tag{6}
```
In particular (6) holds on $`-1<\mathop{\rm Re}s<a`$. The cancellation at the right boundary $`a\rho=1`$ extends the positive moment range there, but we need only a neighborhood containing $`[0,1]`$.

The mean and its reciprocal are
```math
m(a,\rho)
=\frac{\Gamma(1-1/a)}
       {\Gamma(1+\rho)\Gamma(1-\rho)},
\qquad
c(a,\rho)=\frac1{m(a,\rho)}.
\tag{7}
```
These are finite and positive for all interior parameter values used in (2).

## 3. Logarithmic infinite divisibility

Let $`V=c(a,\rho)X^+(a,\rho)`$ and put $`K_{a,\rho}(s)=\log\mathbb E V^s`$. The classical integral for $`\log\Gamma(1+z)`$ in (6) gives
```math
K_{a,\rho}(s)
=d_{a,\rho}s
+\int_0^\infty
 (e^{st}-1-st)\frac{k_{a,\rho}(t)}t\,dt
+\int_0^\infty
 (e^{-st}-1+st)\frac{h_\rho(t)}t\,dt,
\tag{8}
```
where
```math
k_{a,\rho}(t)=\frac1{e^{at}-1}
             -\frac1{e^{t/\rho}-1},
\qquad
h_\rho(t)=\frac1{e^t-1}
             -\frac1{e^{t/\rho}-1},
\tag{9}
```
and
```math
d_{a,\rho}=\gamma(1/a-1)-\log m(a,\rho).
```
Equation (1) implies $`a\rho\le1`$, so $`k_{a,\rho}\ge0`$; also $`h_\rho\ge0`$ because $`\rho<1`$.

Near zero,
```math
k_{a,\rho}(t)=\frac{1/a-\rho}{t}+O(t),
\qquad
h_\rho(t)=\frac{1-\rho}{t}+O(t).
```
Consequently the Lévy densities $`k(t)/t`$ and $`h(t)/t`$ are $`O(t^{-2})`$ near zero and satisfy the Lévy integrability condition. At infinity they decrease exponentially. The positive-jump tail has an exponential moment of order1 because $`a>1`$ and $`1/\rho>1`$. Hence (8) is a valid Lévy–Khintchine representation for $`\log V`$, with $`K_{a,\rho}(1)=0`$ by normalization.

Using the linear compensator for every jump is legitimate: the tails have finite first moments, and the compensated integrands are quadratic at zero.

## 4. Ordered Lévy kernels on the path

For fixed $`t>0`$, let
```math
F_t(b)=\frac1{e^{t/b}-1}\quad(b>0).
```
This is increasing in $`b`$. Thus
```math
h_\rho(t)=F_t(1)-F_t(\rho)
```
decreases as $`\rho`$ increases.

On the first part of (2), where $`a=1/(1-\rho)`$,
```math
k_{a,\rho}(t)=F_t(1-\rho)-F_t(\rho),
```
which decreases. On the plateau, where $`a=A`$,
```math
k_{a,\rho}(t)=F_t(1/A)-F_t(\rho),
```
which also decreases. On the final part, where $`a=1/\rho`$, the kernel is zero. These formulas agree at the joining parameters. Therefore both Lévy kernels decrease throughout the curve.

Fix $`\rho_1<\rho_2`$. Subtract the representation (8) for the later parameter from that for the earlier one. Both differences of Lévy densities are nonnegative and satisfy the integrability and exponential-moment conditions already checked. Thus
```math
K_{\rho_1}(s)-K_{\rho_2}(s)
```
is the cumulant function of an infinitely divisible real random variable $`L`$. Let $`R=e^L`$. At $`s=1`$,
```math
\mathbb E R=\exp(K_{\rho_1}(1)-K_{\rho_2}(1))=1.
\tag{10}
```
Take $`R`$ independent of a variable with law $`V_{\rho_2}`$. Equality of logarithmic characteristic functions gives
```math
V_{\rho_1}\ \stackrel d=V_{\rho_2}R.
\tag{11}
```
For every convex function for which the expectations are defined, conditional Jensen applied to (11) and (10) yields (3). The same argument applies to extended convex expectations by the usual truncation or stop-loss formulation.

This is an all-parameter proof, without a finite grid or a numerical comparison.

## 5. Why the right-hand geometry is forced

At a point strictly below the right boundary, $`a\rho<1`$, the numerator stable factor in (5) is nondegenerate. Its positive moments are finite precisely below order $`a`$ after the power $`\rho`$ is taken. The denominator factor has every negative moment. Independence and positivity therefore give
```math
\mathbb E[X^+(a,\rho)^p]<\infty\quad(0<p<a),
\qquad
\mathbb E[X^+(a,\rho)^p]=\infty\quad(p\ge a).
\tag{12}
```
Positive deterministic scaling does not change this moment threshold. At the right boundary $`a\rho=1`$, the numerator in (5) is1 and all positive moments exist.

Suppose a later branch in a decreasing convex-order family lies strictly below the right boundary and has index $`a_2<a_1`$, where $`a_1>1`$ is an earlier index. Choose $`p`$ with $`a_2<p<a_1`$. The earlier normalized branch has finite $`p`$th moment; the later branch has infinite $`p`$th moment by (12). This contradicts convex order applied to $`x\mapsto x^p`$.

Now take the earlier point $`(A,1/2)`$. If $`\rho>1/A`$, admissibility forces $`a\le1/\rho<A`$. The preceding argument excludes every strictly interior point, so necessarily $`a=1/\rho`$. If the path additionally has maximum index $`A`$, then at $`1/2<\rho<1/A`$ its index cannot be below $`A`$ unless it is on the right boundary; but that boundary has index $`1/\rho>A`$. Hence $`a=A`$ on this interval. This proves (4).

If desired, the left boundary segment in (2) can be replaced with a strictly interior increasing curve, for example
```math
a(\rho)=\frac1{1-2(1-1/A)\rho},\qquad 0<\rho\le1/2,
```
followed by (4). Both $`a`$ and $`\rho`$ increase on the left, so both kernels still decrease. The forced right boundary and plateau remain.

## 6. Endpoint and priority limits

The stochastic family is defined for $`0<\rho<1`$. The endpoint $`(1,0)`$ has no ordinary positive conditional branch with a finite mean, and the geometric endpoint condition must be understood as closure in parameter space. On the right boundary, $`V_\rho`$ tends to1 as $`\rho\uparrow1`$. At the left endpoint, mean-normalized variables can tend to0 in probability while retaining mean1 through a nonuniformly integrable tail. No endpoint convex-order inequality with an integrable limit at $`\rho=0`$ is asserted.

The separate [literature audit](LITERATURE.md) found no explicit prior treatment of this connecting-curve question in the sources inspected. It records an inaccessible 2023 thesis chapter on stable/log-stable convex order. Together with the source's geometric ambiguity, this is a reason to retain the present work as a research note, rather than count a solved conjecture.

Independent internal mathematical review checked (5)–(12), the Lévy integrability, the exponential moment, the direction of Jensen's inequality, and the scope issue. This is not external peer review.

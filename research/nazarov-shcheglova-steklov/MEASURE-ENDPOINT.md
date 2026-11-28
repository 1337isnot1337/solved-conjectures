# Nazarov–Shcheglova’s Steklov conjecture: the measure endpoint

**Research status.** This proves the constant equality and coincidence of the two classes of nonzero extremizers at $`p=1`$, for every $`n\ge2`$. It does not establish reflection symmetry in general and does not settle the conjecture for $`1<p\le\infty`$.

## Exact problem

A. I. Nazarov and A. P. Shcheglova, [*A Survey of Results on 1D Steklov Type Inequalities*](https://link.springer.com/article/10.1134/S0081543825601509), Conjecture 4.14, ask whether the two best constants in
```math
 \|u'\|_1\le A_{n,p}\|u^{(n)}\|_p,\qquad
 \|u\|_\infty\le B_{n,p}\|u^{(n)}\|_p,
 \qquad u\in \mathring W_p^n(0,1)
```
satisfy $`A_{n,p}=2B_{n,p}`$, with coinciding extremizers even about $`1/2`$, for every $`n\ge2`$ and $`1\le p\le\infty`$. Remark 4.1 interprets the $`p=1`$ right side in the sense of measures; this note uses the total variation of the $`n`$-th derivative of the zero extension, including endpoint atoms. This is the closure that preserves the numerical sharp constants on $`C_c^\infty(0,1)`$. The $`n=2`$ case for all $`p`$ is known (Remark 4.15); the proof below is independent of $`n`$. It applies to real-valued functions.

## The measure ball and its extreme points

Let $`K`$ be the weak-star compact unit ball of finite real measures $`\mu`$ on $`[0,1]`$ satisfying
```math
 \int t^j\,d\mu(t)=0\qquad(0\le j\lt n).
```
The corresponding zero-extended function is
```math
 u_\mu(x)=\int\frac{(x-t)_+^{\,n-1}}{(n-1)!}\,d\mu(t).
```
It vanishes to the right of $`1`$ by the moment conditions and to the left of $`0`$ by its definition. It has $`D^n u_\mu=\mu`$. Conversely, any compactly supported distribution with support in $`[0,1]`$ whose $`n`$-th derivative is a finite measure has this representation and these moments. Indeed, moments vanish by testing with a polynomial near $`[0,1]`$; the difference from the displayed primitive is a polynomial which vanishes on $`(-\infty,0)`$.

Every extreme point of $`K`$ has norm one: otherwise a sufficiently small perturbation by any nonzero moment-annihilating measure preserves both signs of the perturbation in $`K`$. Suppose an extreme point has at least $`n+2`$ support points. Choose disjoint Borel neighborhoods $`E_i`$ of $`n+2`$ such points with positive $`|\mu|`$-mass. There is a nonzero function $`g=\sum_{i=1}^{n+2}c_i1_{E_i}`$ satisfying the $`n+1`$ homogeneous linear constraints
```math
 \int t^jg\,d\mu=0\quad(0\le j\lt n),\qquad \int g\,d|\mu|=0.
```
For sufficiently small $`\varepsilon>0`$, $`1\pm\varepsilon g>0`$; thus $`(1\pm\varepsilon g)\mu`$ are distinct points of $`K`$ with average $`\mu`$, a contradiction. A nonzero signed measure on at most $`n`$ distinct knots cannot annihilate the first $`n`$ moments by the Vandermonde rank. Consequently every extreme point has exactly $`n+1`$ knots $`t_0<\cdots<t_n`$; its weights, unique up to an overall scalar, are
```math
 w_i=\prod_{j\ne i}(t_i-t_j)^{-1}.
```
Indeed $`\sum w_i P(t_i)`$ is the coefficient of $`t^n`$ in the Lagrange interpolant, so it vanishes for $`\deg P<n`$; the linear kernel has dimension one.

## An extreme primitive is unimodal

The nonzero primitive of these weights, up to sign and positive scalar, is the probability density of $`\sum_{i=0}^n t_i U_i`$ where $`(U_i)_{i=0}^n`$ are the barycentric coordinates of a uniform point on the $`n`$-simplex. For completeness, the standard Hermite–Genocchi identity says
```math
 \sum_{i=0}^n w_i F(t_i)=\frac1{n!}\,\mathbb E F^{(n)}\!\left(\sum_i t_i U_i\right).
```
One obtains it by applying the fundamental theorem of calculus in one simplex coordinate and using the divided-difference recursion, starting with $`n=1`$. Apply the identity to $`F(t)=\int (t-x)_+^{n-1}\varphi(x)\,dx/(n-1)!`$ for smooth test $`\varphi`$, so that $`F^{(n)}=\varphi`$. The moment identities give $`\sum_i w_i(t_i-x)_+^{n-1}=(-1)^n\sum_i w_i(x-t_i)_+^{n-1}`$; this yields the stated density representation with sign $`(-1)^n`$.

Parallel hyperplane slices of the simplex have $`(n-1)`$-volume proportional to that density. The convexity of the simplex gives Minkowski inclusion of weighted sums of slices in the slice at the weighted level. By Brunn–Minkowski the density to the power $`1/(n-1)`$ is therefore concave on $`(t_0,t_n)`$. The density is positive there and zero at the endpoints, so it is unimodal. In particular
```math
 \|u_\mu'\|_1=2\|u_\mu\|_\infty
```
for every extreme $`\mu`$. The mode is unique: on each interior knot interval $`(t_k,t_{k+1})`$, the coefficient of $`x^{n-1}`$ in the primitive is a nonzero multiple of $`\sum_{i=0}^k w_i`$. This sum is the divided difference on $`t_0,\ldots,t_k`$ of $`f(x)=(-1)^{n-k}\prod_{i=k+1}^n(t_i-x)^{-1}`$. Its $`k`$-th derivative has strict constant sign on $`[t_0,t_k]`$, including the direct $`k=0`$ case; hence the divided difference is nonzero. Thus the primitive has no constant piece. Concavity of its positive power rules out multiple modes; it is strictly increasing to its unique mode and strictly decreasing thereafter, after choosing the positive sign. Its derivative has the corresponding strict sign almost everywhere on each side since the knot pieces are nonconstant polynomials.

## Equality of constants and extremizers

The maps $`\mu\mapsto u_\mu`$ into $`C[0,1]`$ and $`\mu\mapsto u_\mu'`$ into $`L^1(0,1)`$ are weak-star-to-norm continuous on $`K`$. For the first assertion, the kernels indexed by $`x`$ form a compact continuous family in $`C[0,1]`$ and the measures have uniformly bounded total variation. For the second, the derivative kernel $`(x-t)_+^{n-2}/(n-2)!`$ is jointly continuous if $`n\ge3`$; for $`n=2`$, the step kernel $`1_{\{t<x\}}`$ can be replaced by a jointly continuous transition over $`|t-x|\le\delta`$. The resulting error in $`L^1_x`$ is at most $`2\delta\|\mu\|_{\rm TV}`$, uniformly in $`\mu`$.

Write $`B=\max_{\mu\in K}\|u_\mu\|_\infty`$. For a finite convex combination of extreme points,
```math
 \bigg\|\sum_i a_i u_{\mu_i}'\bigg\|_1
 \le \sum_i a_i\|u_{\mu_i}'\|_1
 =2\sum_i a_i\|u_{\mu_i}\|_\infty\le2B.
```
Krein–Milman and continuity extend the bound to all of $`K`$. Conversely any absolutely continuous $`u`$ vanishing at both endpoints satisfies $`\|u'\|_1\ge2\|u\|_\infty`$ by splitting the interval at an absolute maximum. This proves $`A_{n,1}=2B_{n,1}`$, and every supremum-norm extremizer also maximizes the derivative norm.

For the converse, take any derivative-norm maximizer $`\mu\in K`$. The compact convex set $`K`$ is metrizable in its weak-star topology, since $`C[0,1]`$ is separable. By Choquet's representation theorem let $`\Pi`$ be a probability on its extreme points with barycenter $`\mu`$. Choose $`g=\mathop{\mathrm{sign}}u_\mu'\in L^\infty`$. The map $`\nu\mapsto\int g u_\nu'`$ is continuous and affine on $`K`$, so
```math
  2B=\int\!\left(\int g u_\nu'\right)d\Pi(\nu)
  \le\int\|u_\nu'\|_1\,d\Pi(\nu)
  =2\int\|u_\nu\|_\infty\,d\Pi(\nu)\le2B.
```
All integrands must attain their respective upper bounds almost everywhere; hence $`\|u_\nu\|_\infty=B`$ and $`\mathop{\mathrm{sign}}u_\nu'=g`$ wherever $`u_\nu'\ne0`$, for $`\Pi`$-almost every $`\nu`$ and Lebesgue-almost every $`x`$. For such an extreme point its knot support is all of $`[0,1]`$: if the first and last knot are at distance $`\ell<1`$, the affine pushforward spreading them to $`[0,1]`$ keeps the total variation and moments, while its primitive's supremum norm increases by $`\ell^{-(n-1)}`$. By strict unimodality, the derivative has one strict sign almost everywhere left of the mode and the opposite sign right of the mode. Two such splines can have the same sign profile only when their overall signs and their modes agree. Thus almost all these extremal primitives have one common mode $`x_0`$ and the same value there, either $`B`$ or $`-B`$. The affine barycenter identity for evaluation at $`x_0`$ gives $`|u_\mu(x_0)|=B`$, as required.

Finally, the constants do not depend on using the relaxed ball instead of smooth test functions. Push $`\mu`$ affinely into $`[\delta,1-\delta]`$, then convolve with a nonnegative $`C_c^\infty`$ mollifier of integral one supported in $`(-\delta/2,\delta/2)`$. The resulting measures have norm at most one, preserve all the stated moments by expansion under affine maps and convolution, and converge weak-star to $`\mu`$ as $`\delta\downarrow0`$. Their primitives belong to $`C_c^\infty(0,1)`$, and both objectives converge by the established continuity.

## Scope and priority

This note does not claim that the common mode is $`1/2`$, or that all extremizers are symmetric. It reduces that extra question at $`p=1`$ to locating the maximizing argument of the uniform distance from $`(a-t)_+^{n-1}`$ to the polynomials of degree at most $`n-1`$, or equivalently optimizing the mode height of the normalized splines above. A particular $`n=3,p=2`$ result, outside this endpoint proof, is discussed in M. Jleli and B. Samet, [arXiv:2609.34516](https://arxiv.org/abs/2609.34516). Initial exact and topical literature searches did not locate the all-$`n`$ measure-endpoint argument; this is not an assertion of priority.

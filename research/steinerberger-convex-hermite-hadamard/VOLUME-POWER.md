# The dimensional order of the volume-normalized convex Hermite–Hadamard constant

Let $`B^n`$ be the Euclidean unit ball and $`\omega_n=|B^n|`$.
For a convex body $`K\subset\mathbb R^n`$, let $`f:K\to\mathbb R`$
be continuous and convex, with $`f\ge0`$ on $`\partial K`$.
Then
```math
 \int_K f(x)\,dx\;\le\;
 \frac{2}{n\omega_n^{1/n}}\,|K|^{1/n}
       \int_{\partial K} f\,d\mathcal H^{n-1}.
 \tag{1}
```
In particular the best constant in this normalization is
$`\Theta(n^{-1/2})`$. Constant functions on balls give the lower
bound $`1/(n\omega_n^{1/n})`$, so (1) is within a factor of two
of optimal in every dimension. No sharp finite-dimensional
constant or extremizing body is asserted here.

This answers the dimensional growth/decay question in
[Steinerberger, *Some Open Problems*, §25](https://faculty.washington.edu/steinerb/openproblems.pdf#page=28)
for convex functions, but not his exact optimal-constant
question. The volume-power normalization is also a distinct
part of the Hermite–Hadamard problem in
[AIM, *Shape optimization with surface interactions*](https://aimath.org/pastworkshops/shapesurfacerep.pdf).
The separately normalized boundary-mean convex problem
has a matching lower bound $`n`$ in
[Ferudun, *Convex Near-Extremizers for the Multidimensional Hermite-Hadamard Inequality*](https://eulersolve.org/papers/aim-analysis-0032/)
and the upper bound by
[Larson, *A Sharp Multidimensional Hermite–Hadamard Inequality*](https://doi.org/10.1093/imrn/rnaa138).
We do not count that as a new result.

## Geometric step

For a closed convex $`L\subseteq K`$ with nonempty interior let
$`G=K\setminus L`$ and
```math
 E=\mathcal H^{n-1}(\partial K\setminus L),\quad
 I=\mathcal H^{n-1}(\partial L\cap\mathop{\mathrm{int}}K).
```
A point of $`L\cap\partial K`$ necessarily lies in $`\partial L`$.
Thus the common boundary
$`\partial K\cap\partial L`$ cancels in the perimeter
difference, and surface-area monotonicity of nested convex
bodies gives
```math
  I-E=P(L)-P(K)\le0.
```
Here the monotonicity is the Cauchy projection formula:
each projected $`(n-1)`$-volume of $`L`$ is no larger than
that of $`K`$. As sets of finite perimeter the difference
has $`P(G)\le I+E`$. For completeness, at almost every point
of a shared boundary, the normals of both convex sets exist
and agree (the tangent half-space of $`L`$ is contained in
that of $`K`$); consequently the two perimeter measures
cancel there in the derivative of $`\mathbf1_G=\mathbf1_K-
\mathbf1_L`$. Off the intersection, the variation is
bounded by the respective perimeter measures. The classical
isoperimetric inequality then yields
```math
  \frac{n\omega_n^{1/n}}2 |G|^{(n-1)/n}\le E,\qquad
  |G|\le \frac{2}{n\omega_n^{1/n}}|K|^{1/n}E.
 \tag{2}
```
When $`L=\varnothing`$, the same assertion follows
directly from the isoperimetric inequality for $`K`$.

## Apply (2) at the convex sublevels

Replace $`f`$ by its nonnegative convex part $`\max(f,0)`$;
this can only increase the left side of (1) and leaves the
boundary integral unchanged. For every level
$`t>\min_K f`$, the sublevel $`L_t=\{f\le t\}`$ has nonempty
interior, since continuity and convexity of $`K`$ give
points with $`f<t`$ in the interior, even when the minimum
is attained only at the boundary. For lower levels the
sublevel is empty. The exceptional equality level need not
be considered. At all other levels the exposed area in
(2) is exactly
$`\mathcal H^{n-1}(\{y\in\partial K:f(y)>t\})`$.
Integrate (2) in $`t`$ using layer cake in volume and
boundary measure. This proves (1) for $`n\ge2`$; the
classical one-dimensional inequality is stronger when $`n=1`$.

The lower bound follows from $`f=1`$ on a ball, for which
$`|K|^{1-1/n}/P(K)=1/(n\omega_n^{1/n})`$.
Stirling's formula gives $`n\omega_n^{1/n}\sim\sqrt{2\pi e n}`$.

## Prior-work scope

Earlier isoperimetric comparisons in the AIM report and
[Lu–Steinerberger](https://par.nsf.gov/servlets/purl/10133840)
apply the isoperimetric inequality to the whole domain
after using a boundary-mean bound, rather than to each
difference $`K\setminus L_t`$ before integration.
The resulting known upper estimate $`n`$ for the mean-normalized
constant does not give decay in the volume-power normalization.
The source's convex versus subharmonic distinction matters:
the argument here relies on convexity of **every sublevel**
and does not resolve the corresponding subharmonic growth
question or torsion maximizer.

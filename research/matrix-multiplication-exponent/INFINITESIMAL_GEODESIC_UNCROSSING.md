# An infinitesimal criterion for exact geodesic uncrossing

Status: proved reduction. No estimate satisfying its hypothesis is
currently established for all spectral points. In particular, an error
bounded only by a constant times the short geodesic leg is insufficient.

Let $`\gamma:[0,L]\to X`$ be a unit-speed geodesic in a compatible
normalized midpoint completion, and fix a point $`C`$. Write

```math
\varepsilon(X,Y,Z)
=\frac{d(X,Y)+d(Y,Z)+d(Z,X)}2-u(X,Y,Z),
\qquad E(a,b)=\varepsilon(C,\gamma(a),\gamma(b)).
```

The already proved unit bounds and forward intersecting uncrossing imply
that $`E(a,b)\ge0`$ for $`a\le b`$, $`E(a,a)=0`$, and

```math
E(a,b)\ge E(a,d)+E(d,b)\quad(0\le a\le d\le b\le L).
```

Wire transport makes $`u`$ 1-Lipschitz in each argument. The metric
perimeter term is also 1-Lipschitz in each argument. Therefore
$`b\mapsto E(a,b)`$ is 2-Lipschitz, for each fixed $`a`$, without
assuming the desired equality.

**Lemma.** Suppose that for every fixed $`a\in[0,L)`$, for almost every
$`b\in(a,L)`$, one has

```math
\lim_{h\downarrow0}
\frac{E(a,b)-E(a,b-h)-E(b-h,b)}h=0.
\tag{1}
```

Then $`E`$ is exactly additive on every subdivision of this base:

```math
E(a,b)=E(a,d)+E(d,b)
\qquad(0\le a\le d\le b\le L).
\tag{2}
```

**Proof.** Fix $`a\lt d\lt L`$. The two functions
$`F_a(b)=E(a,b)`$ and $`F_d(b)=E(d,b)`$ are Lipschitz and hence
absolutely continuous. Intersect the full-measure sets where they are
differentiable with the two full-measure sets supplied by (1) for these
two fixed anchors. At each point $`b>d`$ in that intersection,

```math
F_a'(b)=\lim_{h\downarrow0}\frac{E(b-h,b)}h=F_d'(b).
```

The middle limit exists because (1) and differentiability of either
anchored function identify it. Thus $`F_a-F_d`$ has derivative zero
almost everywhere on $`(d,L)`$, so absolute continuity makes it
constant there. By continuity at $`d`$, the constant is
$`F_a(d)-F_d(d)=E(a,d)`$. This proves (2) for $`d\lt b\le L`$.
The coinciding-endpoint cases follow from $`E(a,a)=0`$. ∎

The numerator of (1) is precisely the unit-uncrossing defect

```math
u(C,\gamma(a),\gamma(b-h))
+u(C,\gamma(b-h),\gamma(b))
-u(C,\gamma(a),\gamma(b))
-d(C,\gamma(b-h)).
```

Consequently, imposing (1) on every compatible base and every $`C`$
implies (G). The converse is immediate, since (G) makes every numerator
zero. This is an equivalent infinitesimal formulation of the missing
assertion, not a consequence of ordinary convexity.

The exceptional sets in (1) may depend on the fixed anchor $`a`$.
The proof compares only two anchors at a time, so it does not take an
uncountable intersection of full-measure sets. No uniformity in a
subsequent radial contraction is needed: (2) is first established for
every fixed base and root, after which the existing CAT(0) equivalence
theorem applies.

A sufficient quantitative hypothesis is a bound

```math
0\le\delta(a,b-h,b)\le h\eta(h),\qquad\eta(h)\longrightarrow0,
```

on the relevant compatible configurations. A universal bound
$`\delta\le C h^{1+\rho}`$ with $`\rho>0`$ is one example. A bound
$`\delta\le C h`$ does not imply (1); the normalized energy tripod
has a positive first-order defect on an interval of such endpoint
splittings.

For an explicit calculation, let the three outer arms of the energy
tripod have length $`\ell=3/8`$, fix $`A,C`$ on two arms, and let
$`X_x`$ lie a distance $`x\in(0,\ell]`$ out along the third arm.
The energy diversity is

```math
g(S)=2\max_{\nu\in\mathcal P(S)}
             \sum_{v,w\in S}\nu_v\nu_w d(v,w).
```

On the triple with arms $`\ell,\ell,x`$, its maximizing weights
are $`\nu_i=(1-\lambda/\ell_i)/2`$, where
$`\lambda=(2/\ell+1/x)^{-1}`$. All three weights are positive.
Substituting them gives $`g=2\ell+x-\lambda`$, whereas the
semiperimeter is $`2\ell+x`$. Therefore

```math
\varepsilon(A,C,X_x)=\frac{\ell x}{\ell+2x}.
```

The short triple $`C,X_{x-h},X_x`$ is collinear. Its energy value
equals its diameter, so its deficit is zero. The defect of splitting
the base $`A X_x`$ at $`X_{x-h}`$ is consequently

```math
\delta(h)
=\frac{\ell x}{\ell+2x}
 -\frac{\ell(x-h)}{\ell+2x-2h}
=\frac{\ell^2h}{(\ell+2x)(\ell+2x-2h)},
```

and

```math
\lim_{h\downarrow0}\frac{\delta(h)}h
=\frac{\ell^2}{(\ell+2x)^2}>0.
```

At $`x=\ell`$ the limit is $`1/9`$. This remains only a scalar
countermodel calculation; the energy diversity is not asserted to be
a spectral point on all tensors.

The model and the previously proved finite-party implications are in
[NORMALIZED_EXTENSION.md](NORMALIZED_EXTENSION.md),
[TENSOR_MIDPOINT_CONVEXITY.md](TENSOR_MIDPOINT_CONVEXITY.md), and
[GEODESIC_UNCROSSING_EQUIVALENCE.md](GEODESIC_UNCROSSING_EQUIVALENCE.md).
The scalar energy assignment is defined and its limited scope proved in
[TRIPOD_COUNTERMODEL.md](TRIPOD_COUNTERMODEL.md). The new implication
here is the absolute-continuity argument, not a proof of its spectral
hypothesis.

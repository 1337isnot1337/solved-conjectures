# Exterior-hull evolution for arbitrary rectifiable fire barriers

21 November 2026. This note continues the [reviewed delaying-wall accounting](delaying-wall-accounting.md), without changing that source. It proves an exterior-hull transfer using finite-perimeter decomposition and localized coarea. It does not determine Bressan's critical construction speed, and it adds no completed bounty. No novelty claim is made for the geometric-measure-theory ingredients.

The barriers retain the full complete, admissible, rectifiable class used by Bressan–Talamini. No finite-arc, smoothness, or finite-hole hypothesis is imposed.

## 1. Primary ingredients and notation

Use the following two primary sources:

1. Ambrosio, Caselles, Masnou, and Morel (ACMM), [*Connected components of sets of finite perimeter and applications to image processing*](https://math.univ-lyon1.fr/homes-www/masnou/fichiers/publications/connected.pdf), *J. Eur. Math. Soc.* **3** (2001), 39–92. The needed locations are Proposition 3 and Remark 1, printed pp. 53–55; Theorem 1, p. 56; the component-boundary inclusion (15), p. 58; and Definition 4, p. 64. The paper explicitly allows infinite-volume sets in its decomposition theorem.
2. Bressan and Talamini (BT), [*On the Minimum Speed for a Fire Blocking Problem*](https://arxiv.org/abs/2610.36919), v1, especially the SBV minimum-time facts before Proposition 2.1, that proposition's localized coarea argument, and the common-boundary property in Section 4 before Proposition 4.1.

All equalities and inclusions between planar sets in this note are modulo planar Lebesgue null sets unless pointwise representatives are specified. Write $`E^{(0)}`$ and $`E^{(1)}`$ for density-zero and density-one points, and $`\partial^*E`$ for the reduced boundary. At finite-perimeter boundaries, the essential-boundary and reduced-boundary descriptions agree modulo $`\mathcal H^1`$.

ACMM supplies a perimeter-additive decomposition into maximal indecomposable components. Its Remark 1 gives exactly one component of infinite measure when the original set has infinite measure and finite perimeter. Component boundaries are contained in the original essential boundary modulo $`\mathcal H^1`$. These are the imported facts; the transfer below is derived from them.

## 2. An exterior hull that does not require indecomposability

Let $`E\subset\mathbb R^2`$ be bounded and have finite perimeter. Its complement has infinite measure and finite perimeter. Denote its unique infinite-measure indecomposable component by $`C_\infty(E^c)`$, and define

```math
H(E)=\mathbb R^2\setminus C_\infty(E^c).
\tag{1}
```

This uses ACMM's exterior operator from Definition 4. It need not equal their componentwise saturation operator for a decomposable set. We use (1) throughout and never assume that a reachable set is indecomposable.

### Hull properties

The following hold:

```math
E\subseteq H(E),\qquad
\partial^*H(E)\subseteq\partial^*E
\quad(\mathcal H^1\text{-a.e.}),\qquad
P(H(E))\le P(E).
\tag{2}
```

If $`E\subseteq F`$ and both sets are bounded with finite perimeter, then

```math
H(E)\subseteq H(F).
\tag{3}
```

Finally, if $`E\subseteq B_R`$, then

```math
H(E)\subseteq B_R
\quad\text{modulo planar null sets}.
\tag{4}
```

**Proof.** The first inclusion follows because $`C_\infty(E^c)\subseteq E^c`$. The component-boundary inclusion applied to $`E^c`$ gives the boundary assertion in (2), because taking complements preserves reduced boundaries. Perimeter domination follows. Equivalently, additivity in the decomposition shows domination of the component's perimeter measure by that of $`E^c`$.

For (3), the set $`C_\infty(F^c)`$ is an indecomposable subset of $`E^c`$. Maximality in ACMM Theorem 1 places it in one component of $`E^c`$. Its infinite measure forces that component to be $`C_\infty(E^c)`$. Taking complements proves (3).

For (4), the open connected region $`\mathbb R^2\setminus\overline{B_R}`$ is indecomposable and has infinite measure. It is contained in $`E^c`$, so the same maximality argument places it in $`C_\infty(E^c)`$. The circle has planar measure zero. This proves (4).

These arguments handle the infinite complement directly. They do not obtain an exterior component by truncating the complement to a box.

## 3. Filled fire sets at good times

Let $`\gamma(t)`$ be a complete $`\sigma`$-admissible strategy for the initial open unit disk. Write $`R_t`$ for its actual reachable set. At the full-measure set of times where the BT finite-perimeter and common-boundary facts apply, put

```math
H_t=H(R_t),\qquad
\widehat A(t)=|H_t|,
\qquad
\widehat F_t=\partial^*H_t\setminus\gamma(t),
\qquad
\widehat F(t)=\mathcal H^1(\widehat F_t).
\tag{5}
```

The hulls are nested by (3). Since $`R_t\subset B_{1+t}`$, (4) gives $`H_t\subset B_{1+t}`$. If the actual fire remains in one fixed disk for every time, so do all these hulls.

The boundary inclusion in (2) gives

```math
\widehat F_t\subseteq F_t
\quad(\mathcal H^1\text{-a.e.}),
\tag{6}
```

where $`F_t=\partial^*R_t\setminus\gamma(t)`$ is the original free front. In particular $`\widehat F`$ is locally integrable once a jointly measurable representative is chosen; the measurable representative is addressed below.

### Exterior free fronts avoid the old hull

For any two good times $`a\lt t`$,

```math
\widehat F_t\subseteq H_a^{(0)}
\quad(\mathcal H^1\text{-a.e.}).
\tag{7}
```

To prove this, the finite-perimeter trichotomy for $`H_a`$ says that, except on an $`\mathcal H^1`$-null set, a point has density zero, has density one, or belongs to $`\partial^*H_a`$. At a point of $`\partial^*H_t`$, nestedness $`H_a\subseteq H_t`$ excludes density one for $`H_a`$, because the new hull has density one half there. If the point instead belongs to $`\partial^*H_a`$, (2) places it in both $`\partial^*R_a`$ and $`\partial^*R_t`$. The BT common-boundary property then places it on the wall at time $`t`$, contrary to membership in $`\widehat F_t`$. Only density zero remains.

This step uses the actual BT good-time boundary statement. It does not infer (7) from topological pictures of an advancing outer curve.

## 4. Localized area growth

For good endpoints $`0\lt a\lt b`$,

```math
\widehat A(b)-\widehat A(a)
\ge \int_a^b\widehat F(t)\,dt.
\tag{8}
```

Fix $`\tau>b`$ and use the original minimum-time function $`u`$ and its truncation $`v=\min\{u,\tau\}`$. BT supplies $`v\in SBV_{\mathrm{loc}}`$, $`|\nabla^a v|\le1`$ almost everywhere, and the relevant good-time jump-support inclusion. The localized version of its coarea proof yields, for every Borel set $`B`$,

```math
|(R_b\setminus R_a)\cap B|
\ge
\int_{B\cap\{a\lt v\le b\}}|\nabla^a v|\,dx
\ge
\int_a^b\mathcal H^1(F_t\cap B)\,dt.
\tag{9}
```

More explicitly, the middle integral is the coarea integral of the reduced level boundaries outside $`J_v`$, localized to $`B`$. For almost every $`t\in(a,b)`$, the jump-set part of the level boundary is contained in $`\gamma(t)`$, as in BT (2.4)–(2.6). Therefore removing the wall can only decrease that coarea integrand. Endpoint level representatives can be chosen as in the BT proof, excluding the additional countable set of positive-area level values if necessary.

Apply (9) with the fixed Borel set $`B=H_a^{(0)}`$. Since $`R_a\subseteq H_a`$ and $`R_b\subseteq H_b`$,

```math
|(R_b\setminus R_a)\cap H_a^{(0)}|
\le |H_b\setminus H_a|
=\widehat A(b)-\widehat A(a).
```

By (7), $`\widehat F_t\subseteq F_t\cap H_a^{(0)}`$ for almost every intermediate time. These two observations prove (8).

The proof permits the hull to acquire an entire hole at once. Such an upward jump increases the left side of (8); it is not mistakenly counted as ordinary front propagation.

## 5. Monotone representatives and all times

Choose a countable dense set $`G_0`$ of good times. Using measurable representatives and their countable unions or intersections, define

```math
\widetilde H_t
=\bigcap_{\substack{q\in G_0\\q>t}}H_q
\quad\text{modulo planar null sets}.
\tag{10}
```

The sets are increasing in $`t`$ and right-continuous in local $`L^1`$. They remain inside $`B_{1+t}`$ modulo null sets. On good times, the original hull area is monotone and locally bounded; it has at most countably many right discontinuities. Consequently (10) agrees with (5) almost everywhere in time after enlarging the exceptional set by at most countably many times. The density-one representatives are pointwise nested, since inclusion modulo planar null sets implies inclusion of density-one sets.

The map $`(t,x)\mapsto\mathbf1_{\widetilde H_t}(x)`$ has a jointly measurable version by the countable definition. Its spatial perimeter kernels, and their restrictions to the wall/free-front sets, can therefore be taken measurably. Equivalently, the coarea construction in Section 4 determines the relevant front-length integrand for almost every time. We set it to zero on the exceptional times.

Hereafter write $`H_t`$ for (10) and $`\widehat A(t)=|H_t|`$. The area is right-continuous and nondecreasing, and $`\widehat A(0)=\pi`$: the hull contains the initial disk and lies in disks with radii decreasing to one. For arbitrary $`0\le a\lt b`$, choose good $`a_n\downarrow a`$ and $`b_n\downarrow b`$. Right continuity of area, (8), and local integrability from (6) give

```math
\widehat A(b)\ge\widehat A(a)+\int_a^b\widehat F(t)\,dt.
\tag{11}
```

This also makes the quadratic first-crossing step legitimate. If $`c>0`$ and

```math
T=\inf\{t>0:\widehat A(t)\le ct^2\}
```

is finite, then $`T>0`$ and

```math
\widehat A(T)=cT^2,\qquad
\widehat A(t)>ct^2\quad(0\lt t\lt T).
\tag{12}
```

Indeed, approaching $`T`$ from below gives $`\widehat A(T-)\ge cT^2`$. Monotonicity gives $`\widehat A(T)\ge\widehat A(T-)`$. Approaching $`T`$ from the defining set on the right and using right continuity gives the reverse inequality. Upward jumps do not invalidate (12).

## 6. Retirement from the exterior hull

Define

```math
\widehat D_t=\gamma(t)\cap H_t^{(1)},
\qquad
\widehat d(t)=\mathcal H^1(\widehat D_t).
\tag{13}
```

The sets $`\widehat D_t`$ are nested, and $`\widehat d(t)\le\sigma t`$. They contain the density-one spent walls from the original note because $`R_t\subseteq H_t`$. They also count a barrier surrounding an unburned island once that island has been filled by the exterior hull. This is a measure-theoretic retirement convention, not an assertion about every point of an arbitrary topological boundary.

For a finite tuple of good times, the hull boundaries inherit the BT common-boundary property from (2). Thus the vector-BV proof in the companion note applies with $`R_t,F(t),d(t)`$ replaced by $`H_t,\widehat F(t),\widehat d(t)`$. In particular, if $`c_0=\sqrt2-1`$, then

```math
\widehat Q(a,b)
\le \widehat F(a)+\widehat F(b)
 +\sigma(b+c_0a)-\widehat d(a)-c_0\widehat d(b),
\tag{14}
```

where

```math
\widehat Q(a,b)=P(H_a)+P(H_b)
 -(2-\sqrt2)\mathcal H^1(\partial^*H_a\cap\partial^*H_b).
```

The double-bubble lower bound is applicable to these nested finite-perimeter sets. At a first crossing (12), the same BT comparison and (11) therefore give

```math
(c+\sigma\mu-\sqrt c\,K)T^2
\ge \pi+
\int_0^{T/2}\widehat d(t)\,dt
 +(\sqrt2-1)\int_{T/2}^{T}\widehat d(t)\,dt,
\tag{15}
```

with the unchanged constants $`K,\mu`$ defined in the companion note. This transfer is valid for the original arbitrary rectifiable barriers under the BT hypotheses; it is not merely a finite smooth-domain calculation.

## 7. Remaining full-target obligation

The transfer closes the previously identified front/perimeter and area-growth issue for this measure-theoretic exterior hull. It does not bound the right side of (15) strongly enough to reach speed two.

One still needs an estimate relating the **time profile** $`\widehat d(t)`$ to the free front and the construction budget, under an assumption that the fire is ultimately confined. The eventual amount retired cannot be substituted for the two integrals in (15). The earlier slit example remains an obstruction to pointwise half-length pruning, and the exterior hull does not change the admissibility of deleting old delaying arcs from the actual strategy.

In particular, the hull is an analytical enlargement of the burned set. It is not a new fire trajectory, a replacement admissible strategy, or a proof that Theorem 5.3's actual outer-boundary hypothesis holds for the original barrier. No such inference is used here.

The full critical-speed cash target remains unresolved in this work.

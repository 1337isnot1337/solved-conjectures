# Delaying walls: lifetime accounting and two failed reductions

21 November 2026. Research toward [Bressan's full critical-speed prize](target-and-prior-audit.md). This note proves the stated accounting lemma and counterexamples; it does not determine the critical speed. No novelty claim is made for the bookkeeping identity.

The primary geometric source is Bressan–Talamini, [arXiv:2610.36919v1](https://arxiv.org/abs/2610.36919), especially Proposition 2.1, Proposition 4.1, and Theorems 5.2–5.3. Their results are used with their actual hypotheses.

## 1. A finite measure-space accounting lemma

Let $`(X,\nu)`$ be a measure space. Fix nested measurable sets


```math
E_1\subseteq\cdots\subseteq E_m,
\qquad
D_1\subseteq\cdots\subseteq D_m,
\qquad D_i\subseteq E_i,
```


of finite measure. Let measurable $`W_i\subseteq E_i\setminus D_i`$. The intended meanings are constructed wall, permanently spent wall, and currently active wall. No geometric assumptions are needed in this section.

Choose weights $`w_i>0`$ and define


```math
c_i=\sqrt{\sum_{j=i}^m w_j}-\sqrt{\sum_{j=i+1}^m w_j},
\qquad
\beta_i=\sqrt{\sum_{j=1}^i w_j}-\sqrt{\sum_{j=1}^{i-1}w_j}.
```


Then


```math
\int_X\sqrt{\sum_{i=1}^m w_i\mathbf1_{W_i}(x)}\,d\nu(x)
\le
\sum_{i=1}^m c_i\nu(E_i)
-\sum_{i=1}^m\beta_i\nu(D_i).
\tag{1}
```


### Proof

It suffices to prove the inequality pointwise. A point outside $`E_m`$ contributes zero. For a point in $`E_m`$, let $`j`$ be its first membership index in $`E_j`$, and let $`k`$ be its first membership index in $`D_k`$, setting $`k=m+1`$ if it never enters a $`D_i`$. Necessarily $`j\le k`$.

Set


```math
P_i=\sum_{h=1}^i w_h,
\qquad P_0=0,
\qquad T=P_m,
\qquad x=P_{j-1},
\qquad y=P_{k-1}.
```


The point can be active only for indices between $`j`$ and $`k-1`$, so the integrand is at most $`\sqrt{y-x}`$. Its contribution to the right side is exactly


```math
\sqrt{T-x}+\sqrt y-\sqrt T.
```


For $`0\le x\le y\le T`$, concavity of the square root gives


```math
\sqrt T-\sqrt{T-x}
\le \sqrt y-\sqrt{y-x}.
```


One may see this directly by noting that $`z\mapsto\sqrt z-\sqrt{z-x}`$ is decreasing on $`[x,\infty)`$. Rearranging proves the required pointwise inequality. Integrating proves (1). This includes the cases $`j=k`$ and $`k=m+1`$.

For unit weights, the coefficients are


```math
c_i=\sqrt{m-i+1}-\sqrt{m-i},
\qquad
\beta_i=\sqrt i-\sqrt{i-1}.
\tag{2}
```


Thus construction is charged by suffix increments and retirement by prefix increments.

## 2. Application to actual fire fronts at good times

Write $`R_t`$ for the reachable burned set and let $`\gamma(t)`$ be a complete admissible strategy. Choose a finite increasing tuple of good times $`t_1<\cdots\lt t_m`$ such that:

1. Each $`R_{t_i}`$ has finite perimeter and the free/active decomposition of Proposition 2.1 holds.
2. Up to $`\mathcal H^1`$-null sets, a common reduced-boundary point at two distinct chosen times belongs to the active wall at both times. This is the common-boundary property used in Bressan–Talamini's Proposition 4.1. Choose the times outside the common exceptional null set used in that argument. In particular, for a fixed $`T`$, the paired times $`t,t+T/2`$ below are both good for almost every $`t\in(0,T/2)`$.

Use


```math
E_i=\gamma(t_i),\qquad
W_i=\gamma(t_i)\cap\partial^*R_{t_i},\qquad
F_i=\mathcal H^1(\partial^*R_{t_i}\setminus\gamma(t_i)).
```


Let $`R_t^{(1)}`$ be the measure-theoretic interior, the points of planar density one, and put


```math
D_i=\gamma(t_i)\cap R_{t_i}^{(1)},
\qquad d_i=\mathcal H^1(D_i).
\tag{3}
```


The sets $`D_i`$ are nested because both the constructed barrier and the burned set are nested. A density-one point cannot be in the reduced boundary, so $`D_i\cap W_i=\varnothing`$. In particular these are permanently spent walls, not merely portions that have not yet been touched. For a smooth slit, (3) counts the part already reached by fire from both sides.

Define the finite-dimensional BV map


```math
v(z)=\big(\sqrt{w_i}\,\mathbf1_{R_{t_i}}(z)\big)_{i=1}^m.
```


Here $`\mathop{\mathrm{TV}}_2(v)`$ is the total variation of its matrix-valued distributional derivative with the Euclidean (Frobenius) norm. For this finite collection of characteristic functions, the derivative is supported on the union of their reduced boundaries. At a free-front point, the good-time intersection property leaves just one nonzero component, of magnitude $`\sqrt{w_i}`$. At a point active as wall at at least one chosen time, the magnitude is $`\sqrt{\sum_i w_i\mathbf1_{W_i}}`$. The orientations of the planar normals do not change this magnitude: on a shared rectifiable boundary the normals are parallel up to sign, and this norm squares away the signs.

Consequently,


```math
\mathop{\mathrm{TV}}_2(v)
=\sum_{i=1}^m\sqrt{w_i}\,F_i
 +\int_{\gamma(t_m)}\sqrt{\sum_{i=1}^m w_i\mathbf1_{W_i}}\,d\mathcal H^1.
```


Apply (1) and the cumulative construction budget to obtain


```math
\mathop{\mathrm{TV}}_2(v)
\le
\sum_{i=1}^m\sqrt{w_i}\,F_i
 +\sigma\sum_{i=1}^m c_i t_i
 -\sum_{i=1}^m\beta_i d_i.
\tag{4}
```


This retains a term that is discarded when all previously constructed walls are counted as if they could still be active.

### Two-time consequence

For two unit weights and $`a\lt b`$, put $`c_0=\sqrt2-1`$. The vector perimeter equals the source paper's


```math
Q(a,b)=P(R_a)+P(R_b)-(2-\sqrt2)\mathcal H^1(\partial^*R_a\cap\partial^*R_b).
```


Equation (4) becomes


```math
Q(a,b)
\le F(a)+F(b)+\sigma(b+c_0a)-d(a)-c_0d(b).
\tag{5}
```


Let $`\mathcal D(u,v)`$ denote the weighted double-bubble minimum from the source, with interface weights $`1,1,\sqrt2`$. Then


```math
F(a)+F(b)
\ge \mathcal D(A(a),A(b)-A(a))
-\sigma(b+c_0a)+d(a)+c_0d(b).
\tag{6}
```


This inequality is a source-based refinement, not a proof that its additional term is large enough.

### The exact remaining term in the quadratic first-crossing argument

Use the same constants as source Section 4.2:


```math
K=\int_0^{1/2}\mathcal D(s^2,s+1/4)\,ds,
\qquad
\mu=\frac{2+\sqrt2}{8}.
```


At a putative first crossing $`A(T)=cT^2`$ with $`A(t)>ct^2`$ for $`0\lt t\lt T`$, the same source monotonicity argument and (6) imply


```math
c+\sigma\mu-\sqrt c\,K
\ge
\frac{A(0)+I_d(T)}{T^2},
\tag{7}
```


where


```math
I_d(T)=
\int_0^{T/2}d(t)\,dt
 +(\sqrt2-1)\int_{T/2}^{T}d(t)\,dt.
\tag{8}
```


The direction and the positive sign of this term matter. Its presence strengthens the contradiction when sufficiently much wall has already become spent. Its final value $`d(T)`$, or its eventual value, cannot simply replace (8). No lower bound sufficient to complete the full critical-speed proof has been established.

## 3. An admissible slit defeats the half-length pruning argument

Fix any $`\sigma>0`$ and $`\ell>0`$. Define


```math
a=1+\frac{2\ell}{\sigma},
\qquad
S=\{(a,y):|y|\le\ell\}.
```


Construct the segment by


```math
\gamma(t)=\{(a,y):|y|\le\min(\sigma t/2,\ell)\}.
\tag{9}
```


It is nested and has length $`\min(\sigma t,2\ell)`$. Construction finishes at $`a-1`$. A unit-speed path from the open unit disk cannot reach the line $`x=a`$ before that time. Thus no fire trajectory can pass through the segment before it is completed. The subsequent reachable sets are exactly those for the fixed segment $`S`$. This is an admissible construction even when $`\sigma<2`$; it does not contain the fire.

Now set


```math
b=\frac{\ell^2}{2a},\qquad R=a+b,\qquad P=(R,0).
```


Since


```math
R^2-(a^2+\ell^2)=\frac{\ell^4}{4a^2}>0,
```


the whole segment lies strictly inside the circle of radius $`R`$. That circle is only a reference for a possible future enclosing boundary; it is not part of construction (9).

Without the slit, the infimum arrival time at $`P`$ is $`R-1`$. With the slit, it is


```math
\tau_S(P)=\sqrt{a^2+\ell^2}+\sqrt{b^2+\ell^2}-1.
\tag{10}
```


To prove the lower bound, every path to $`P`$ must cross the line $`x=a`$ at some height $`|y|>\ell`$. The lengths before and after such a crossing are at least $`\sqrt{a^2+y^2}-1`$ and $`\sqrt{b^2+y^2}`$. Their sum is minimized in the limit $`|y|\downarrow\ell`$. Conversely, paths that pass arbitrarily close to either tip attain this infimum. Open initial data and the forbidden tip account for using an infimum rather than asserting attainment.

The delay is therefore


```math
\Delta=\sqrt{a^2+\ell^2}+\sqrt{b^2+\ell^2}-(a+b).
```


It satisfies the strict inequality


```math
\Delta>\ell=\frac12\mathcal H^1(S).
\tag{11}
```


For a direct proof, put $`\alpha=a/\ell`$, $`\beta=b/\ell`$, so $`\alpha\beta=1/2`$. The desired inequality is


```math
\sqrt{\alpha^2+1}+\sqrt{\beta^2+1}>\alpha+\beta+1.
```


After squaring positive quantities, it is equivalent to


```math
\sqrt{(\alpha^2+1)(\beta^2+1)}>\alpha+\beta.
```


Squaring once more leaves


```math
1+\alpha^2\beta^2-2\alpha\beta
=(1-\alpha\beta)^2=\frac14>0.
```


The segment is eventually surrounded from both sides, because the complement of a finite segment is path connected and every point on either side is reachable in finite time. Thus (11) is a counterexample to the proposed universal rule that deleting a delaying arc advances arrival at each future boundary point by at most half its construction length. It is not a subcritical containment strategy.

### Its spent-wall profile is explicit

For $`|y|<\ell`$, the arrival traces on the left and right of the segment are respectively


```math
\tau_-(y)=\sqrt{a^2+y^2}-1,
\qquad
\tau_+(y)=\sqrt{a^2+\ell^2}+\ell-|y|-1.
```


The second formula follows by crossing above or below a tip and approaching the right side. The first is the direct segment from the initial disk. Put $`T_0=\sqrt{a^2+\ell^2}-1`$. The density-one spent length from (3) is


```math
d(t)=2\min\{\ell,\max\{0,t-T_0\}\}.
\tag{12}
```


In particular, the complete length $`2\ell`$ has already been built at time $`a-1`$, but $`d(t)=0`$ throughout the nonempty interval $`[a-1,T_0]`$. Its eventual spent length is $`2\ell`$. This shows why eventual length alone supplies no immediate lower bound for the lifetime integral. It does not refute a more specific estimate that also uses small burned area or hypothetical eventual containment.

## 4. Zero spent length does not imply the source's outer-boundary condition

Theorem 5.3 assumes, at every relevant time,


```math
\gamma(t)\cap\overline{R_t}
\subseteq \partial^u(\mathbb R^2\setminus\overline{R_t}),
\tag{13}
```


where the right side is the boundary of the unbounded component of the complement of the closed reachable set. Both closure bars in the source condition have been checked in the printed PDF; text extraction drops them. An internal unburned island gives an obstruction that is not measured by (3).

Fix a radius $`\rho>0`$ and place a circle centered at $`(a,0)`$, where


```math
a>1+\rho+\frac{2\pi\rho}{\sigma}.
```


Construct its boundary at rate $`\sigma`$, completing it at time $`2\pi\rho/\sigma`$. This precedes the earliest possible fire contact, $`a-\rho-1`$. Its interior never burns. Its exterior is connected to the initial disk, and eventually the fire surrounds the circle externally.

At all times, no positive-length portion of the circle is burned from both sides. Hence $`d(t)=0`$ for this strategy. Once the fire surrounds the island, however, the circle is an internal hole boundary, not part of the outer boundary in (13). Therefore even the premise $`d\equiv0`$ does not yield the set inclusion required by the source's Jordan conversion.

This example also does not contain the fire. It refutes only that proposed implication. A valid extension of Theorem 5.3 must treat inner hole boundaries as well as two-sided spent slits.

## 5. What remains open in this route

One possible refinement is to fill bounded complementary components of $`R_t`$ and charge every previously constructed wall that becomes interior to the filled set. Containment would imply bounded filled area, and the larger retired-wall sets would be nested. The abstract measure lemma would then apply to those sets if the corresponding front/perimeter hypotheses are established.

That observation is not an established filled-set evolution theorem. It needs a proof of the relevant good-time perimeter decomposition and area-growth inequality, with any upward filling jumps handled. Even after such a transfer, a quantitative relation between early retired length, boundary geometry, and later confinement is missing.

A related proposed estimate based on an enclosing contour counted once and interior slits counted twice has not been proved here for arbitrary rectifiable barriers. It must not be substituted for a geometric theorem. The slit calculation in Section 3 shows why a pointwise half-length charge is unavailable.

The proved output is (1), its good-time application (4)–(8), the admissible slit obstruction (9)–(12), and the island obstruction to (13). The full all-barriers critical-speed question remains unresolved in this work.

# Contact-time deletion and the attachment obstruction

21 November 2026. This note continues the [exterior-hull transfer](exterior-hull-evolution.md). It retains the cumulative construction-budget model and the full critical-speed target. It proves the finite-completion reduction, an elementary deletion criterion, and a restricted obstacle-removal result. It does not establish the required early-retirement estimate or determine the critical speed. No novelty is claimed for these reductions.

## 1. Finite total construction suffices below the proposed threshold

Suppose a complete admissible timed strategy at speed $`\sigma\lt2`$ confines the fire to a fixed disk $`B_R`$. Fix any $`\sigma'\in(\sigma,2)`$ and choose $`R'>R`$. Let $`C=\partial B_{R'}`$, with length $`L=2\pi R'`$, and set

```math
T=\frac{L}{\sigma'-\sigma}.
\tag{1}
```

For $`0\le t\le T`$, retain the old construction and also build an increasing arc $`C_t\subseteq C`$ of length $`(\sigma'-\sigma)t`$. At time $`T`$ the circle is complete. Stop all construction after that time. The new barrier family is

```math
\gamma'(t)=
\begin{cases}
\gamma(t)\cup C_t,&0\le t\le T,\\
\gamma(T)\cup C,&t\ge T.
\end{cases}
\tag{2}
```

Before $`T`$, adding barriers can only reduce the old reachable set. Thus the fire stays inside $`B_R`$, and the added circle has not been crossed when it is completed. Afterwards that circle prevents escape. For $`t\le T`$,

```math
\mathcal H^1(\gamma'(t))
\le\sigma t+(\sigma'-\sigma)t=\sigma't.
```

For $`t\ge T`$, its constant length is at most $`\sigma'T\le\sigma't`$. Hence (2) is a finite-total-length confining strategy at speed $`\sigma'\lt2`$. This construction builds the extra circle gradually; it does not assume an instantaneous expenditure of stored construction capacity.

Consequently, to prove that the full critical value is two, it is enough to exclude finite-total-length strategies at every speed below two. The reduction uses speed slack and says nothing about preserving the equality case $`\sigma=2`$. It also does not replace arbitrary rectifiable barriers by finitely many smooth arcs.

The fixed-barrier equivalence in Bressan–Talamini [Theorem 5.1](https://arxiv.org/abs/2610.36919) can then be used in its stated finite-total-length scope.

## 2. An exact criterion for preserving all construction deadlines

Work in the fixed-barrier formulation. For a barrier $`\Gamma`$, define the set of wall already touched by time $`t`$ as

```math
\mathcal C_\Gamma(t)=\Gamma\cap\overline{R_t^\Gamma}.
```

Admissibility at speed $`\sigma`$ means

```math
\mathcal H^1(\mathcal C_\Gamma(t))\le\sigma t
\qquad(t\ge0).
\tag{3}
```

Suppose $`C\subseteq\Gamma`$ is removed and $`\Gamma'=\Gamma\setminus C`$ is a legitimate barrier in the same formulation. For each $`t`$, assume there is $`\delta(t)\ge0`$ such that, modulo $`\mathcal H^1`$-null sets,

```math
\mathcal C_{\Gamma'}(t)
\subseteq \Gamma'\cap\mathcal C_\Gamma(t+\delta(t)),
\tag{4}
```

and

```math
\mathcal H^1\bigl(C\cap\mathcal C_\Gamma(t+\delta(t))\bigr)
\ge\sigma\delta(t).
\tag{5}
```

Then $`\Gamma'`$ is $`\sigma`$-admissible. Indeed, the remaining and deleted portions are disjoint, so

```math
\begin{aligned}
\mathcal H^1(\mathcal C_{\Gamma'}(t))
&\le\mathcal H^1(\mathcal C_\Gamma(t+\delta(t)))
 -\mathcal H^1(C\cap\mathcal C_\Gamma(t+\delta(t)))\\
&\le\sigma(t+\delta(t))-\sigma\delta(t)=\sigma t.
\end{aligned}
\tag{6}
```

No regularity of $`\delta`$ is required: the argument checks each deadline separately. One can also use $`\delta+\varepsilon`$ and a residual error tending to zero. Containment is a separate condition; (6) proves only admissibility.

The decisive quantity in (5) is the deleted wall already touched on the old clock. Its total eventual length alone does not justify subtracting that length from the construction budget at every time.

## 3. An isolated rectifiable Jordan obstacle can be deleted

Assume

```math
\Gamma=K\cup C,
\qquad \mathcal H^1(C)=L,
```

where $`C`$ is a rectifiable Jordan curve, $`K`$ is an arbitrary complete rectifiable remainder, and:

- The initial unit disk lies in the exterior of $`C`$.
- $`K`$ is outside the bounded interior of $`C`$ and has positive distance from $`C`$.
- $`\Gamma`$ is admissible at a speed $`\sigma\le2`$.

Then deleting $`C`$ preserves admissibility. If $`\Gamma`$ confines the fire, so does $`K`$.

The remainder need not be a finite smooth graph. The positive-clearance and empty-interior hypotheses on this one obstacle are essential to the proof.

### The geometric ingredient

Here is an explicit construction of exterior traversable contours; no smooth collar of $`C`$ is assumed. Identify the plane with the complex numbers. Let $`\Omega`$ be the bounded Jordan domain enclosed by $`C`$, choose $`p\in\Omega`$, and use the inversion $`I(z)=1/(z-p)`$. The image of the exterior of $`C`$, together with $`I(\infty)=0`$, is a bounded Jordan domain $`D`$ with rectifiable boundary. Rectifiability is preserved because $`I`$ is Lipschitz on a neighborhood of $`C`$.

Let $`f:\mathbb D\longrightarrow D`$ be a conformal map with $`f(0)=0`$. We use two classical boundary facts: the Carathéodory extension is a homeomorphism of the closures, and rectifiability implies $`f'\in H^1`$, an absolutely continuous boundary parametrization, and convergence of the radial derivatives in $`L^1`$. These precise facts are stated in Sodin–Wennman–Yakir, [proof of Lemma 3.1](https://link.springer.com/article/10.1007/s10955-023-03170-y), citing the Riesz–Privalov theorem. Bishop's [*Conformal images of Carleson curves*, p. 1](https://commack.math.stonybrook.edu/~bishop/papers/deift.pdf), also records the derivative and boundary-length statement.

For $`0\lt r<1`$, set

```math
g_r(\theta)=p+\frac{1}{f(re^{i\theta})},
\qquad
g(\theta)=p+\frac{1}{f(e^{i\theta})},
\qquad 0\le\theta\le2\pi.
```

Each $`C_r=g_r([0,2\pi])`$ is an analytic Jordan curve in the exterior of $`C`$. For any fixed $`r_0>0`$, the continuous function $`f`$ stays away from zero on $`r_0\le|z|\le1`$. Uniform convergence of the radial boundary values therefore gives $`g_r\to g`$ uniformly. Moreover,

```math
g_r'(\theta)
=-\frac{ir e^{i\theta}f'(re^{i\theta})}
        {f(re^{i\theta})^2}
\longrightarrow
-\frac{ie^{i\theta}f'^*(e^{i\theta})}
        {f(e^{i\theta})^2}
=g'(\theta)
\quad\text{in }L^1([0,2\pi]).
```

Here $`f'^*`$ denotes the radial boundary derivative. The equality to $`g'`$ follows from the absolutely continuous boundary trace and the reciprocal chain rule; its denominator stays away from zero. Thus

```math
\mathcal H^1(C_r)=\int_0^{2\pi}|g_r'(\theta)|\,d\theta
\longrightarrow\int_0^{2\pi}|g'(\theta)|\,d\theta=L.
```

In fact, the lengths of corresponding parameter arcs also converge. The unbounded exterior of $`C_r`$, with infinity added, is $`I^{-1}(f(r\mathbb D))`$. These exteriors increase to the exterior of $`C`$. Hence the closed bounded Jordan domains $`J_r`$ enclosed by $`C_r`$ decrease to $`\overline\Omega`$. They are nested compact sets for $`r\ge r_0`$, so this convergence is also in Hausdorff distance. In particular, all sufficiently large $`r`$ give $`J_r\cap K=\varnothing`$, by the positive-clearance and exterior-location assumptions on $`K`$.

This construction proves both geometric consequences needed below:

1. **Detour.** Fix a path avoiding $`K`$ from the initial disk to a point outside $`J_r`$. If its starting point is outside $`J_r`$, replace the part between its first entry and last exit from $`J_r`$ by the shorter arc of $`C_r`$. The resulting path avoids $`K\cup C`$ and has length at most the old length plus $`\mathcal H^1(C_r)/2`$. If its starting point lies in $`J_r`$, choose $`r`$ large enough that a fixed point of the initial disk is outside $`J_r`$. Connectedness of the disk then gives a point of $`C_r`$ in the initial disk. Start there, follow the shorter contour arc to the old path's last exit, and retain its suffix. The same length bound holds. A path that never enters $`J_r`$ needs no change.
2. **Full contact after first contact.** Suppose an old path approaches $`C`$ by time $`t_0+\eta`$. Its endpoint can be chosen inside $`J_r`$. Either its first crossing of $`C_r`$ is reached by that time, or its initial point is already inside $`J_r`$ and a contour point belongs to the initial disk as above. From this accessible contour point, either direction around $`C_r`$ reaches every other contour point in at most $`\mathcal H^1(C_r)/2`$. For every fixed $`c\in C`$, the corresponding points of $`C_r`$ tend to $`c`$. Taking $`r\uparrow1`$ and then allowing $`\eta\downarrow0`$ proves the asserted closure contact within an additional $`L/2`$.

These statements concern infimum travel times and closures of reachable sets. In the second argument, a path approaching $`C`$ exists by the definition of $`t_0`$; for each fixed $`r`$, its endpoint is chosen sufficiently close to that contact point, which lies in the interior of $`J_r`$. Every subsequent use permits an extra $`\varepsilon>0`$ before taking a limit. No path runs through the forbidden curve $`C`$ itself. For contacts on $`K`$, approximate the contact by reachable endpoints; positive clearance puts those endpoints outside $`J_r`$ once they are sufficiently close to $`K`$.

### Deadline proof

Let $`t_0`$ be the infimum time at which the old fire approaches $`C`$. If $`t_0=\infty`$, removing $`C`$ changes no reachable point outside its bounded interior: any new path that first crossed $`C`$ would already approach it in finite time without previously crossing it. This would contradict $`t_0=\infty`$.

Suppose $`t_0<\infty`$. For $`t\lt t_0`$, no newly available path can have crossed $`C`$, so the remaining-wall contact sets are unchanged. For $`t\ge t_0`$ and every $`\varepsilon>0`$, the two geometric consequences give

```math
\mathcal C_K(t)
\subseteq K\cap\mathcal C_\Gamma(t+L/2+\varepsilon),
\qquad
C\subseteq\mathcal C_\Gamma(t+L/2+\varepsilon).
\tag{7}
```

In the second inclusion, the first-contact time can itself be approximated from above; split $`\varepsilon`$ between that approximation and the exterior contour. Thus

```math
\mathcal H^1(\mathcal C_K(t))
\le\sigma(t+L/2+\varepsilon)-L
=\sigma t-(1-\sigma/2)L+\sigma\varepsilon.
\tag{8}
```

Let $`\varepsilon\downarrow0`$. Since $`\sigma\le2`$, this proves the required deadline at every $`t\ge t_0`$; earlier times were unchanged.

For containment, every newly reachable point outside the bounded Jordan domain has a finite old route after the same detour. The only genuinely additional reachable region lies inside that bounded domain. Hence deleting $`C`$ preserves boundedness of the total reachable set.

## 4. Attachment defeats the uniform half-perimeter detour

The preceding geometric ingredient fails when other walls attach to the cycle. This can happen even with a circle and two straight segments.

Take the initial unit disk centered at the origin and the unit circle

```math
C=\{(x,y):(x-3)^2+y^2=1\}.
```

For $`H\ge3`$, attach the two segments

```math
K_H=\{(3,y):1\le |y|\le H\},
\qquad \Gamma_H=K_H\cup C,
\qquad P=(6,0).
\tag{9}
```

Without $`C`$, the horizontal path through $`(3,0)`$ is available and the infimum arrival time at $`P`$ is $`5`$.

With $`C`$ present, any path from the unit disk to $`P`$ must cross the line $`x=3`$ at height $`|y|>H`$. Crossings with $`1\le|y|\le H`$ meet a segment, and crossings with $`|y|<1`$ lie inside the inaccessible Jordan domain. Therefore its length is at least

```math
\sqrt{9+H^2}-1+\sqrt{9+H^2}
=2\sqrt{9+H^2}-1.
```

This is the infimum: pass arbitrarily close to either outer segment tip. The two line segments of this limiting route avoid the circle for $`H\ge3`$; the distance from its center to either supporting line is $`3H/\sqrt{9+H^2}>1`$. Thus deletion advances arrival by

```math
\Delta_H=2\sqrt{9+H^2}-6\longrightarrow\infty,
\qquad \mathcal H^1(C)=2\pi.
\tag{10}
```

The geometry can be enclosed in an additional circle centered at $`(3,0)`$ with radius $`H+5`$. Both static barrier configurations then have bounded reachable sets, and the displayed routes remain inside that outer circle. Thus boundedness of the eventual reachable region does not restore a universal $`L(C)/2`$ advance bound for deleting an attached cycle.

This is a counterexample to the geometric detour estimate, **not** a construction of an admissible confining strategy below speed two. It does not disprove the possibility that some more global budget compensation could justify a deletion despite the large advance.

## 5. Prior removal machinery and the remaining obligation

The interaction between barrier removal and later construction deadlines is already explicit in the literature:

- Bressan–Wang, [*Global optimality conditions for a dynamic blocking problem*](https://www.numdam.org/articles/10.1051/cocv/2010053/), Section 2 and Remark 2.3, printed pp. 128–130, warns that perturbing a delaying arc can invalidate the admissibility of other arcs. Its variational arguments impose additional regular-strategy hypotheses.
- Bressan–Chiri, [*On the Regularity of Optimal Dynamic Blocking Strategies*](https://cvgmt.sns.it/media/doc/paper/4904/opt-barrier.pdf), introduction pp. 3–5, describes the possible cascade from removing an interior component to losing the enclosing barrier. Lemmas 2.2 and 2.4 both explicitly assume that the entire complement is connected. The former controls detours around countably many compact connected components; the latter bounds each component's active-front time interval by its length and gives expansion outside the union of these intervals. These are prior results; their connected-complement hypothesis cannot be silently applied to an enclosing barrier.

The isolated-loop result addresses one configuration where the deleted cost provably pays for every advanced deadline. It does not handle an attached cycle, a purely delaying slit, or a general component network. The earlier [straight-slit calculation](delaying-wall-accounting.md) already shows that even an isolated arc need not satisfy the needed half-length delay bound.

The exterior-hull transfer supplies a rigorous retirement variable for arbitrary rectifiable strategies. No argument here yet forces its early-time integral to be large enough, and no rule here removes all interior delays while preserving speed below two. The precise remaining task is a global estimate that couples advanced contact times with already touched deleted length, or an independent bound on the retirement-time profile. The full cash target remains unresolved.

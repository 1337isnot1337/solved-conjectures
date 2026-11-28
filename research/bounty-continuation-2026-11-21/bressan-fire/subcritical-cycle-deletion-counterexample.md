# Subcritical deadlines do not justify deleting an attached cycle

21 November 2026. This note continues the [contact-clock pruning analysis](contact-clock-pruning.md). It gives an explicit family of finite barriers satisfying every original contact deadline at speed $`19/10`$, for which deleting an attached circle makes the remaining barrier inadmissible at that same speed.

The barriers do **not** confine the fire. Thus this is a counterexample to an unconditional cycle-deletion rule, not a counterexample to Bressan's critical-speed conjecture and not a bounty completion. No novelty is claimed for the general phenomenon of a removal causing later deadlines to fail; Bressan–Chiri already describes that phenomenon in the [introduction, pp. 3–5](https://cvgmt.sns.it/media/doc/paper/4904/opt-barrier.pdf).

## 1. Exact configuration and claim

The initial fire is the open unit disk $`R_0=B(0,1)`$. For a static barrier $`G`$, write

```math
\Phi_G(t)=\mathcal H^1\!\left(G\cap\overline{R_t^G}\right).
```

The original admissibility condition at speed $`\sigma`$ is $`\Phi_G(t)\le\sigma t`$ for every $`t\ge0`$.

Fix an integer $`H\ge1000`$ and put

```math
\sigma=\frac{19}{10},
\qquad A=\frac{2H}{5},
\qquad P=(2A,0).
```

Let

```math
\begin{aligned}
C&=\{(x,y):(x-A)^2+y^2=1\},
\\ K_H&=\{(A,y):1\le |y|\le H\},
\\ x_j&=2A-\frac12+\frac{j}{2H+1}
\qquad(1\le j\le2H),
\\ M_j&=\{(x_j,y):-1/2\le y\le1/2\},
\\ M&=\bigcup_{j=1}^{2H}M_j,
\\ G_0&=C\cup K_H,\qquad
G=G_0\cup M,\qquad
G'=K_H\cup M.
\end{aligned}
\tag{1}
```

Thus $`G_0`$ is a unit circle with an upward and downward vertical arm, while $`M`$ consists of $`2H`$ disjoint vertical unit segments near $`P`$. Each point of $`M`$ is within distance less than one of $`P`$. The two circle-arm junction points are retained in $`G'`$; equivalently, take the completion of the remainder after removing $`C`$. This avoids a purely endpoint-based change in the barrier class. Both $`G`$ and $`G'`$ are finite compact unions of rectifiable curves.

We prove

```math
\Phi_G(t)\le\frac{19}{10}t\quad\text{for every }t\ge0,
\qquad
\Phi_{G'}\!\left(\frac{4H}{5}+2\right)
>\frac{19}{10}\left(\frac{4H}{5}+2\right).
\tag{2}
```

## 2. Every deadline for the circle and arms alone

A point reached by time $`t`$ from $`B(0,1)`$ lies in $`B(0,t+1)`$. Closure contacts lie in the corresponding closed disk. This Euclidean restriction is valid with any additional barriers present.

For $`u\ge0`$, the length of the portions of the two arms in $`\overline B(0,u)`$ is at most

```math
2\min\left\{H,\sqrt{(u^2-A^2)_+}\right\},
\qquad (v)_+=\max\{v,0\}.
```

The omitted central interval only reduces their actual length. Moreover,

```math
2\min\left\{H,\sqrt{(u^2-A^2)_+}\right\}
\le\frac{2H}{\sqrt{A^2+H^2}}u
=\frac{10}{\sqrt{29}}u.
\tag{3}
```

For $`A\le u\le\sqrt{A^2+H^2}`$, divide by $`u`$ and use the monotonicity of $`\sqrt{1-A^2/u^2}`$. For larger $`u`$, use the constant bound $`2H`$. For $`u\lt A`$, the left side is zero. Thus all cases in (3) are covered.

The circle has length $`2\pi`$. Consequently,

```math
\Phi_{G_0}(t)
\le 2\pi+\frac{10}{\sqrt{29}}(t+1)
\qquad(t\ge0).
\tag{4}
```

No point of $`G_0`$ is touched for $`t\lt A-2`$: the circle's nearest point is at distance $`A-2`$ from the initial disk, and the arms are farther away. For $`t\ge A-2\ge398`$, use

```math
\frac{10}{\sqrt{29}}<\frac{15}{8},
\qquad
\frac{19}{10}-\frac{15}{8}=\frac1{40},
\qquad
\frac{t}{40}\ge\frac{199}{20}>\frac{79}{8}
>2\pi+\frac{15}{8}.
```

Here the last inequality uses only $`\pi<4`$. Equation (4) therefore gives

```math
\Phi_{G_0}(t)
<\frac{15}{8}t+\frac{t}{40}
=\frac{19}{10}t.
\tag{5}
```

Together with the zero-contact interval, this proves every deadline for $`G_0`$. Adding $`M`$ cannot increase the reachable set, so the same bound applies to the portion of $`G_0`$ contacted in the full configuration $`G`$.

## 3. A lower bound on first contact with the distant segments

Define

```math
T_* =2\sqrt{A^2+H^2}-2
=\frac{2\sqrt{29}}5H-2.
\tag{6}
```

Every path from the initial unit disk to $`M`$ must cross the line $`x=A`$. In the configuration $`G`$, any such crossing has height $`|y|>H`$:

- A crossing with $`1\le|y|\le H`$ touches an arm.
- A crossing with $`|y|<1`$ lies inside the circle. The path starts outside that circle and cannot enter its interior without crossing $`C`$.
- The two crossings with $`|y|=1`$ are circle-arm junction points and are also forbidden.

Let $`z=(A,y)`$ be one crossing with $`|y|>H`$, let $`p\in B(0,1)`$ be the path's starting point, and let $`q\in M`$ be its limiting endpoint. The prefix and suffix lengths satisfy the lower bound

```math
\begin{aligned}
\mathop{\mathrm{length}}(\text{path})
&\ge |z-p|+|q-z|
\\ &\ge |z|-|p|+|z-P|-|q-P|
\\ &>2\sqrt{A^2+y^2}-2
\\ &\ge T_*.
\end{aligned}
\tag{7}
```

This also covers closure contacts. More explicitly, if endpoints $`q_n\notin G`$ converge to $`q\in M`$, then eventually their $`x`$ coordinates exceed $`A`$ and the same line-crossing argument applies. Since $`|q_n-P|\to|q-P|<1`$, passing to the limit in the length lower bound gives an arrival time at least $`T_*`$. The estimate is uniform over arbitrary starting points in $`B(0,1)`$.

Thus no part of $`M`$ is contacted at a time less than $`T_*`$. A detour involving other distant segments cannot invalidate (7), because the argument is a lower bound on every path avoiding even the smaller barrier $`G_0`$.

## 4. All late deadlines for the full barrier

The total length is

```math
\mathcal H^1(G)=2\pi+2(H-1)+2H=4H-2+2\pi.
\tag{8}
```

It is already within the available budget at $`T_*`$:

```math
\begin{aligned}
\sigma T_* -\mathcal H^1(G)
&=\left(\frac{19\sqrt{29}}{25}-4\right)H
  -\frac95-2\pi
\\ &>\frac4{75}H-\frac{49}{5}
>0.
\end{aligned}
\tag{9}
```

The first strict bound uses $`\sqrt{29}>16/3`$ and $`\pi<4`$; the last follows from $`H\ge1000`$.

For $`t\lt T_*`$, only $`G_0`$ can have been contacted, and Section 2 gives $`\Phi_G(t)\le\sigma t`$. For $`t\ge T_*`$, use the total-length bound

```math
\Phi_G(t)\le\mathcal H^1(G)\le\sigma T_*\le\sigma t.
```

This proves admissibility of the original configuration at every time, not merely at a finite set of inspected deadlines.

## 5. Deleting the circle exposes all the distant segments too early

Let

```math
T_{\mathrm{new}}=2A+2=\frac{4H}{5}+2.
\tag{10}
```

Fix $`j`$ and a height $`y\in[-1/2,1/2]`$. Start at $`(0,3/4)`$, which is inside the initial unit disk. Travel horizontally at height $`3/4`$ to $`(x_j+\varepsilon,3/4)`$, then vertically down to $`(x_j+\varepsilon,y)`$.

Choose $`\varepsilon>0`$ smaller than $`1/4`$ and than half the spacing of consecutive $`x_j`$ coordinates. This path avoids the whole remainder $`G'`$:

- At $`x=A`$, the horizontal route passes through the gap $`|y|<1`$ between the two arms.
- The horizontal route is above every segment of $`M`$.
- The vertical route has an $`x`$ coordinate strictly between successive segments, or just to the right of the last segment. It therefore meets none of the densely packed segments.

Its length is bounded by

```math
x_j+\varepsilon+\frac34-y
<2A+\frac12+\varepsilon+\frac54
<2A+2=T_{\mathrm{new}}.
```

Letting $`\varepsilon\downarrow0`$ proves that every point of every $`M_j`$ belongs to $`\overline{R_{T_{\mathrm{new}}}^{G'}}`$. Hence

```math
\Phi_{G'}(T_{\mathrm{new}})
\ge\mathcal H^1(M)=2H,
```

whereas

```math
2H-\sigma T_{\mathrm{new}}
=\frac{12}{25}H-\frac{19}{5}>0.
\tag{11}
```

The remainder is therefore inadmissible at the original subcritical speed.

## 6. Exact scope of the obstruction

The original configuration has one cycle, with attached straight arms; the distant segments are disjoint components. Its full contact budget holds at speed $`19/10`$. Removing the cycle while retaining all other walls fails. The delay of the distant contacts is at least

```math
T_*-T_{\mathrm{new}}
=\frac{2\sqrt{29}-4}{5}H-4\longrightarrow\infty,
```

despite a removed length of $`2\pi`$. Thus imposing all original subcritical deadlines does not restore a uniform advance bound depending only on the removed cycle's perimeter.

Both $`G`$ and $`G'`$ leave the negative horizontal ray unobstructed, so the fire is unconfined. The example does not address a theorem requiring eventual confinement, optimality, or coordinated removal of further walls. In particular, deleting the distant segments as well would remove the deadline violation proved here.

The earlier isolated-loop theorem uses positive clearance from the remainder and does not apply to the circle-arm junctions. A full critical-speed argument must add a global structural ingredient beyond admissibility alone. This note supplies no sufficient retirement estimate and no full prize resolution.

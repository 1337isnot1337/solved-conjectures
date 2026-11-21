# The attached-cycle family fails the original contact budget

21 November 2026. This is a scope check on the symbolic family in [the contact-clock note](contact-clock-pruning.md), not a proof of the critical-speed conjecture. It shows that the large-detour family cannot itself obstruct a pruning theorem that uses the original speed-at-most-two admissibility hypothesis.

## 1. Geometry and the clock to inspect

Let the initial fire be the open unit disk centered at the origin. For $`H\ge3`$, set

```math
C=\{(x,y):(x-3)^2+y^2=1\},
\qquad
K_H=\{(3,y):1\le |y|\le H\},
\qquad
\Gamma_H=C\cup K_H.
```

Deleting $`C`$ advances arrival at $`(6,0)`$ by $`2\sqrt{H^2+9}-6`$, although $`C`$ has fixed length $`2\pi`$. That is the geometric obstruction already proved in the companion note. To test actual admissibility, instead inspect the earlier time

```math
T_H=\sqrt{H^2+9}-1.
\tag{1}
```

Write $`C_- = C\cap\{x\le3\}`$ for the left semicircle. We will prove

```math
C_-\cup K_H\subseteq\overline{R_{T_H}^{\Gamma_H}}.
\tag{2}
```

All the routes below are used in the sense of infimum arrival times: tangent and boundary-following routes are approximated from the accessible left side, with arbitrarily small extra length. The curves here are a circle and straight segments; no approximation theorem for a general rectifiable curve is needed.

## 2. Every point of the left semicircle is reached early

The upper tangent from the origin meets the circle at

```math
\left(\frac83,\frac{2\sqrt2}{3}\right).
```

The tangent segment has length $`\sqrt8`$ from the origin. Starting inside the unit disk saves an amount tending to one. The remaining upper-left circle arc to $`(3,1)`$ has length $`\arcsin(1/3)`$. Reflection gives the lower route. Every point of $`C_-`$ therefore has arrival time at most

```math
\tau_0=\sqrt8-1+\arcsin(1/3).
\tag{3}
```

The routes stay on the left side of the vertical arms. Their limiting endpoints at $`(3,\pm1)`$ are interpreted through closure contact.

## 3. The whole pair of arms is reached by the tip clock

For $`y\ge3/\sqrt8`$, the segment from the origin to $`(3,y)`$ does not enter the open circle. Indeed, the distance from its supporting line to $`(3,0)`$ is

```math
\frac{3y}{\sqrt{9+y^2}}\ge1.
```

Approaching the endpoint from the left, this gives arrival time at most

```math
\sqrt{9+y^2}-1\le T_H
\qquad\left(\frac3{\sqrt8}\le y\le H\right).
```

For the short interval $`1\le y\le3/\sqrt8`$, follow the route to the top circle-arm junction, then the left side of the arm. Its arrival time is at most

```math
\tau_0+y-1
\le \sqrt8+\frac3{\sqrt8}-2+\arcsin(1/3)
=\frac{11\sqrt2}{4}-2+\arcsin(1/3)
<3\lt T_H.
```

For the strict numerical comparison, use $`\sqrt2<3/2`$ and $`\arcsin(1/3)<\pi/6<2/3`$: the preceding bound is less than $`67/24<3`$. Also $`T_H\ge\sqrt{18}-1>3`$. Reflection handles the lower arm. This proves (2).

## 4. The original speed-two budget already fails

The intersections of the semicircle and the two arms consist only of their endpoints. Thus (2) yields

```math
\mathcal H^1\!\left(\Gamma_H\cap\overline{R_{T_H}^{\Gamma_H}}\right)
\ge \pi+2(H-1)>2T_H.
\tag{4}
```

The final strict inequality is equivalent, after adding two and squaring positive quantities, to

```math
4\pi H+\pi^2>36,
```

which holds for every $`H\ge3`$. Therefore this entire symbolic family fails admissibility at every speed $`\sigma\le2`$. The additional enclosing circle from the companion note does not change this conclusion: it lies outside all of the displayed routes, and any contact with it only increases the contact measure.

The ratio in (4) tends to two from above as $`H\longrightarrow\infty`$. The same family therefore demonstrates both an unbounded geometric advance from deleting a fixed-length cycle and an earlier contact-budget violation. The two facts are compatible.

## 5. The remaining full-target obligation

The estimate does not justify deleting an attached cycle in an arbitrary admissible configuration. Its proof uses straight arms that can be approached directly from the initial disk. Curved or branching attached walls can block those direct routes, and replacing them by their arclength gives only a weaker travel-time estimate. A full proof must either retain the corresponding extra wall contacts in a global accounting argument or find an admissibility-preserving reduction that does not require the direct routes.

In particular, the pointwise half-perimeter detour bound remains false without a budget hypothesis. Conversely, this family provides no counterexample to a stronger pruning theorem that assumes all original deadlines at speed below two. Neither the required early-retirement bound nor the full critical-speed cash target is established here.

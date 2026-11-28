# Forcing all three sides into an arbitrarily narrow cone

**Theorem.** Fix a line direction, an angular tolerance $0<\alpha<\pi/2$ and an area budget $M$. There is a bounded open planar set of measure greater than $M$ such that every triangle of area one with vertices in it has **all three side directions** within $\alpha$ of the prescribed direction. In particular there are bounded sets of arbitrarily large area avoiding all right triangles of area one, even when arbitrary rotations and leg lengths are allowed.

We may take the direction to be horizontal. Let $p_1,\ldots,p_m$ be distinct odd primes. By the Chinese remainder theorem choose integers $z_i$ congruent to one modulo $p_i$ and zero modulo every other displayed prime. These integers are distinct and $p_i$ divides none of the differences $z_j-z_i$ for $j\ne i$. Put
```math
 L_i=\mathop{\mathrm{lcm}}_{j\ne i}|z_j-z_i| .
```
Fix $c=1/4$. In the square $|x-Tz_i|<c, |y|<c$, retain the horizontal strips where the distance from $TL_i y$ to $p_i\mathbb Z$ is less than $1/10$. Call this open set $A_i$. As the positive parameter $T$ tends to infinity the squares become disjoint and the area of $A_i$ tends to $4c^2/(5p_i)$, by periodicity. Since the prime reciprocals diverge, first choosing $m$ and then $T$ makes the measure of their union greater than $M$.

Write $\eta=\sin\alpha$. Any side vector $(u,v)$ making angle at least $\alpha$ to the horizontal satisfies $|v|\ge\eta\sqrt{u^2+v^2}$. For all sufficiently large $T$, this side cannot go between distinct squares: the vertical displacement is at most $2c$, whereas any such horizontal displacement is at least $T-2c$. Both endpoints must therefore be in a common $A_i$. A third vertex in the same square cannot give area one, since the square itself has area $4c^2<1$.

Let the third vertex be in a different $A_j$. Subtract the first endpoint from it to write its coordinates as $(T(z_j-z_i)+e,f)$ where $|e|,|f|\le2c$. For double area two one must have
```math
 v\bigl(T(z_j-z_i)+e-fu/v\bigr)=\pm2 .
```
The correction in parentheses to $T(z_j-z_i)$ is bounded by $2c(1+1/\eta)$. Thus $TL_i v$ tends uniformly, for each pair of boxes and either sign, to the corresponding value $\pm2L_i/(z_j-z_i)$. More precisely its difference from that number is $O_{m,\eta}(1/T)$ for every candidate pair of endpoints. This integer is nonzero modulo $p_i$, since $p_i$ is odd and coprime to $L_i$. Yet both endpoints meet the strip restriction, so $TL_i v$ is within $1/5$ of $p_i\mathbb Z$. Taking $T$ large enough for the finite list of pairs rules out the alleged triangle. For $\alpha<\pi/4$ two admissible side directions cannot be perpendicular, which gives the right-triangle consequence.

[Koizumi's Theorem 1](https://arxiv.org/abs/2501.01914) guarantees a right triangle of unit area in every **unbounded** measurable set of positive measure. Here the sets vary with the area budget and are individually bounded. [Bulj and Kovač](https://arxiv.org/abs/2605.30033) bound sets avoiding a family of axis-aligned corners in a given box. For [Erdős problem 352](https://www.erdosproblems.com/352) the remaining triangles with all sides near the chosen direction must also be excluded to give a counterexample. The construction above leaves such triangles possible.

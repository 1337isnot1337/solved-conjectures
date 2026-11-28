# Two rich perpendicular bisectors in a centered triangle

Let $`P`$ consist of $`n`$ planar sites, with at most three sites on each circle. A **centered triangle** is an unordered triple of sites on a circle centered at a site of $`P`$. The three vertices determine its center uniquely. A line is $`K`$-rich if it contains at least $`K`$ sites of $`P`$. Write $`T_K`$ for the number of centered triangles for which at least two of the three side bisectors are $`K`$-rich.

For integers $`2\le K\le n`$, with an absolute implied constant,

```math
T_K\ll
\begin{cases}
n^3/K^4,& 2\le K\le\sqrt n,
\\ n^2/K^2,& \sqrt n\le K\le n.
\end{cases}
```

Consequently, if $`K/n^{1/4}\to\infty`$, these triangles number $`o(n^2)`$. Near equality in the one-third pinned-distance bound requires $`(1/3+o(1))n^2`$ centered triangles, since almost every ordered pin-site pair must belong to a radius with three sites. At this threshold, almost every one of those triangles has at most one rich side bisector. This leaves open the possibility of many triangles with two bisectors of smaller, growing multiplicity. [Radius-class count](BISECTORS.md) · [Erdős, p. 168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## Two bisectors determine at most one centered triangle

Suppose two distinct side bisectors $`L_1,L_2`$ occur together in two triangles. Their intersection fixes the common pin $`x`$. A circle about $`x`$ contains at most three sites, so distinct triangles at this pin would have different radii and disjoint vertex sets.

Each $`L_i`$ would then reflect two different endpoint pairs. All endpoint pairs reflected by the same axis lie on a common perpendicular line as soon as there are two such pairs. In coordinates with vertical axis, pairs $`(\pm a,u)`$ and $`(\pm b,v)`$ with $`u\ne v`$ would lie on the circle whose center $`(0,t)`$ solves $`a^2+(u-t)^2=b^2+(v-t)^2`$. Let $`H_i`$ be the common side line perpendicular to $`L_i`$. The two sides on $`H_1,H_2`$ meet at a vertex of each triangle. These lines are nonparallel, so the triangles share the same vertex. Its distance from $`x`$ fixes the radius, a contradiction. [Reflected-pair lemma](BISECTORS.md)

Let $`\mathcal L_K`$ be the family of all $`K`$-rich lines and $`L`$ its size. For a pin $`x`$ let $`q_x`$ be the number of these lines through it. Distinct counted triangles at $`x`$ use disjoint sets of bisector pairs. They also use disjoint triples of bases. Hence their number is at most $`\min\{\binom{q_x}{2},(n-1)/3\}`$. Globally $`T_K\le\binom L2`$.

## Counting pins on many rich lines

The Szemerédi–Trotter theorem and its point-line dual give, for integers $`t\ge2`$,

```math
L\ll n^2/K^3+n/K,\qquad
\#\{x\in P:q_x\ge t\}\ll L^2/t^3+L/t .
```

The second count is also at most $`n`$. [Incidence theorem, Solymosi and Tóth, Theorem 6](https://doi.org/10.1007/s00454-001-0009-z)

To sum the per-pin bound, group the integers $`2\le t\le\sqrt n`$ in powers of two. Each pin contributes at most a constant times the sum of $`t^2`$ over these powers with $`t\le q_x`$ when $`q_x\ge2`$. This also covers pins with $`q_x>\sqrt n`$ by the cap of $`n`$. The case $`n<4`$ has no centered triangles. Thus

```math
T_K\ll
\sum_{\substack{2\le t\le\sqrt n\\t=2^j}}
\left(\min\{nt^2,L^2/t\}+Lt\right)
\ll n+n^{1/3}L^{4/3}+L\sqrt n .
```

For the minimum, split the geometric sums at $`(L^2/n)^{1/3}`$. Below it use $`nt^2`$, above it use $`L^2/t`$. The $`Lt`$ terms sum to $`O(L\sqrt n)`$.

When $`K\le\sqrt n`$, insert $`L\ll n^2/K^3`$. Each term in the last bound is $`O(n^3/K^4)`$. When $`K\ge\sqrt n`$, insert $`L\ll n/K`$ in the global bound $`T_K\le\binom L2`$. These are the asserted estimates.

## Different thresholds on the two sides

Fix $`\delta>0`$. Suppose at least $`\delta n^2`$ triangles have one $`K`$-rich bisector and another $`J`$-rich bisector, with $`2\le J,K\le\sqrt n`$. Then $`KJ\ll_\delta\sqrt n`$.

Indeed, write $`q_x(K)`$ and $`q_x(J)`$ for the two counts through $`x`$. Two distinct bisectors still specify at most one triangle, so each pin contributes at most $`q_x(K)q_x(J)`$ and at most $`n`$. For at least $`\delta n/2`$ pins the product is at least $`\delta n/2`$, since all other pins together could account for at most $`\delta n^2/2`$ triangles.

For $`K\le\sqrt n`$, the dual estimate above at threshold $`\lceil Cn/K^2\rceil`$, together with $`L\ll n^2/K^3`$, gives at most $`O(n/C^3+n/(CK))`$ exceptional pins. Choose $`C`$ depending only on $`\delta`$ so this is less than $`\delta n/4`$, and do the same for $`J`$. A high-product pin outside both exceptional sets satisfies $`\delta n/2\ll_\delta n^2/(K^2J^2)`$, as required. This estimate concerns specified thresholds and allows arbitrarily many collinear sites. The full conjecture still requires an absolute improvement above one third. [Earlier fixed-collinearity result](BOUNDED-COLLINEARITY.md)

## Finite check

Run `python3 research/erdos-654-arbitrary-collinearities/check_two_bisectors.py` from the repository root. The checker examines every subset of the four-by-four integer grid with at least four sites and at most three on any circle. It allows four collinear sites. Grouping squared distances at each pin and solving the circumcenter equations independently give the same 1,760 centered triangles across 5,516 eligible subsets. Within each subset, every pair of side bisectors identifies a single triangle, accounting for 5,280 pairs in total. Of the triangles counted across the subsets, 720 have two bisectors containing at least two sites, and eight have two containing at least three. The incidence argument above supplies the asymptotic bound. [Exact checker](check_two_bisectors.py)

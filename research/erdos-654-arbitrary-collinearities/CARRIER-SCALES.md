# Carrier sizes and two rich bisectors in a centered triangle

Let $`P`$ be a planar set of $`n`$ distinct sites, with no four on a circle. A centered triangle is a triple of sites on a circle centered at a fourth site of $`P`$. Write $`r_L=|P\cap L|`$. The carrier of an unordered pair is the line through its endpoints, and its axis is the perpendicular bisector. Write $`T_K`$ for the number of centered triangles having two distinct sides whose axes have $`r_L\ge K`$.

For all $`2\le K\le n`$,

```math
T_K\ll n^2K^{-1/2}+n^{17/9}.
```

Consequently $`T_{K_n}=o(n^2)`$ for every sequence $`K_n\to\infty`$. This includes thresholds growing arbitrarily slowly and strengthens the [earlier two-bisector estimate](TWO-RICH-BISECTORS.md). The estimate concerns two sides. A single side can have an unbounded number of equidistant pins.

## Weighted incidences with line-supported pairs

Take $`m`$ distinct planar pins, and site subsets $`B_j\subset P`$ on distinct carrier lines $`H_j`$. The pins need not lie on those lines. Let $`S=\max_j |B_j|`$ and $`W=\sum_j\binom{|B_j|}{2}`$. For each axis $`L`$, let $`w_L`$ be the number of unordered pairs from these subsets whose axis is $`L`$. Every reflected pair for a given axis lies on the same carrier. Indeed, if a vertical axis reflects two pairs $`(\pm a,u)`$ and $`(\pm b,v)`$ with $`u\ne v`$, a unique $`t`$ solves $`a^2+(u-t)^2=b^2+(v-t)^2`$, placing four sites on a circle. The reflected pairs are disjoint, so $`w_L\le S/2`$ and $`\sum_L w_L=W`$.

The number $`I`$ of incidences between pins and reflected pairs is bounded by

```math
I\ll m^{2/3}W^{2/3}S^{1/3}+mS+W.
```

Group the axes by dyadic weight $`a\le w_L<2a`$. There are at most $`W/a`$ such axes. Apply the Szemerédi–Trotter point–line incidence theorem to each group and multiply by $`2a`$. The mixed terms sum to $`O(m^{2/3} W^{2/3} S^{1/3})`$ and the pin terms to $`O(mS)`$. The line-count terms sum to at most $`2W`$ by retaining their actual counts. In particular, if $`M=\sum_j|B_j|`$, then $`I\ll S((mM)^{2/3}+m+M)`$. For a partition into line-supported blocks on distinct carriers with $`S=o(n^{2/3})`$, the number of incidences with two sites in the same assigned block is $`o(n^2)`$ for $`m=n`$, irrespective of orientations. [Incidence theorem, Solymosi and Tóth, Theorem 6](https://doi.org/10.1007/s00454-001-0009-z)

## All carriers at intermediate scales

For $`2\le t\le n`$, take every carrier $`H`$ with $`t\le|P\cap H|<2t`$ and set $`B_H=P\cap H`$. The rich-line form of Szemerédi–Trotter gives $`O(n^2/t^3+n/t)`$ such lines. Thus $`W\ll n^2/t+nt`$ and $`S\le 2t`$. With the $`n`$ sites as pins the preceding bound gives

```math
I_t\ll n^2 t^{-1/3}+n^{4/3}t.
```

Here $`W`$ and $`nt`$ are absorbed by the two terms displayed. For $`2\le B\le S\le n`$ sum on the dyadic levels $`B,2B,\ldots`$ meeting the interval. This bounds all pin–pair incidences whose carrier has between $`B`$ and $`S`$ sites by $`O(n^2 B^{-1/3}+n^{4/3}S)`$. The estimate allows arbitrary intersections between carrier lines.

## Small carriers, large carriers, and triangle counting

For the family $`\mathcal L_K`$ of all lines containing at least $`K`$ sites, Szemerédi–Trotter first gives $`|\mathcal L_K|\ll n^2/K^3+n/K`$. Apply the point–line incidence form again to these lines and the $`n`$ sites. For $`K\le\sqrt n`$ use $`|\mathcal L_K|\ll n^2/K^3`$; for $`K\ge\sqrt n`$ use $`|\mathcal L_K|\ll n/K`$. In the first case the mixed term is at most a constant times $`n^2/K^2`$, and in the second it is at most a constant times $`n`$. The linear terms obey the same combined bound, giving

```math
\sum_{L\in\mathcal L_K}r_L=I(P,\mathcal L_K)\ll n^2/K^2+n.
```

On carriers with fewer than $`B`$ sites every axis has at most $`B`$ reflected pairs. Hence the total small-carrier contribution from rich axes is $`O(B(n^2/K^2+n))`$. Every incident pin–pair belongs to at most one centered triangle since at most one further site lies on its circle.

Let $`h`$ be the number of carriers with more than $`S`$ sites. Szemerédi–Trotter gives $`h\ll n^2/S^3+n/S`$. Two distinct sides of a triangle on large carriers intersect at a base vertex lying on two such carriers. There are at most $`\binom h2`$ possible sites at their intersections. A fixed base site belongs to at most $`n-1`$ centered triangles, one for each possible pin. Hence at most $`O(nh^2)`$ centered triangles have two sides on large carriers.

A triangle counted by $`T_K`$ has either a rich side on a small or intermediate carrier, or two sides on large carriers. Therefore

```math
T_K\ll n^2(B/K^2+B^{-1/3})+nB+n^{4/3}S
+n(n^2/S^3+n/S)^2.
```

Choose $`S=\lceil n^{5/9}\rceil`$ and $`B=\min(S,\lceil K^{3/2}\rceil)`$. Both the intersection count and $`n^{4/3}S`$ are $`O(n^{17/9})`$, which absorbs $`nB`$. Since $`B\ll K^{3/2}`$, the small-carrier term $`n^2B/K^2`$ is $`O(n^2/\sqrt K)`$. If the cutoff is uncapped, $`B^{-1/3}\le K^{-1/2}`$. If it reaches $`S`$, then $`n^2 S^{-1/3}\le n^{49/27}\le n^{17/9}`$. This proves the stated bound uniformly.

## Where a single exceptional side can persist

More generally, a quadratic number $`\delta n^2`$ of pin–pair incidences with $`r_L\ge K_n\to\infty`$ requires a positive proportion of the sites on $`O_\delta(n^{1/3})`$ lines with at least $`c_\delta n^{2/3}`$ sites each. Take $`B`$ sufficiently large in terms of $`\delta`$, $`S=c_\delta n^{2/3}`$ sufficiently small in its coefficient, and use the small- and intermediate-carrier bounds. At least $`\delta n^2/2`$ incidences have carriers larger than $`S`$ for all sufficiently large $`n`$. Each endpoint at a fixed pin has at most two mates, so the union of these carriers has $`\Omega_\delta(n)`$ sites. The number of carriers is $`O_\delta(n^{1/3})`$ and only $`O_\delta(n^{2/3})`$ sites can lie on two of them. This leaves open a single exceptional side per triangle and the contribution of moderately populated axes. An [explicit construction](CARRIER-EXAMPLE.md) attains the carrier-size exponent for uncompleted pairs. The unrestricted pinned-distance bound remains open. [Radius-class counts and reflected-pair lemma](BISECTORS.md) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

# Triples with all bases in a small set

Let $`P`$ be a set of $`n`$ planar sites with no four on a circle, and let $`A\subseteq P`$ have $`s`$ sites. Write $`T(P,A)`$ for the number of triples of distinct sites of $`A`$ lying on a circle centered at a site of $`P`$. Each such triple has a unique center. With an absolute implied constant,

```math
T(P,A)\ll n^{9/14}s^{3/2}+n^{13/14}s^{1/2}+s^2.
```

In particular, for any partition $`P=A_1\cup\cdots\cup A_k`$ with $`\max_i|A_i|=o(n^{5/7})`$, the total number of triples having all three bases in a single part is $`o(n^2)`$. A near-extremal configuration in [Erdős Problem 654](https://www.erdosproblems.com/654) needs $`(1/3-o(1))n^2`$ such centered triples altogether, by [counting the radius classes](BISECTORS.md). This estimate permits the three bases to lie in different parts. [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## Counting triples

Write $`b(L)`$ for the number of unordered pairs of distinct sites of $`A`$ reflected to each other across the line $`L`$. Their total multiplicity is $`\binom{s}{2}`$. Fix $`B\ge1`$. If a side of a counted triangle has bisector $`L`$ with $`b(L)\le B`$, it gives an incidence between its pin and the bisector, indexed by the reflected endpoint pair. For each pin and endpoint pair this counts at most one triple because the circle contains at most three sites of $`P`$.

The weighted number of these incidences is

```math
O\big(n^{2/3}s^{4/3}B^{1/3}+nB+s^2\big).
```

Indeed, the number of lines with $`t\le b(L)<2t`$ is $`O(s^2/t)`$. Apply the point-line incidence bound to their distinct lines and the $`n`$ pins, multiply by $`2t`$ and sum over dyadic $`t\le B`$. The first two terms sum geometrically, and the line-count term is at most twice the total pair multiplicity. We use both standard forms of the [Szemerédi–Trotter theorem, stated in Solymosi and Tóth, Theorem 6](https://doi.org/10.1007/s00454-001-0009-z).

For a triangle whose three sides all have $`b(L)>B`$, each side lies on a line containing more than $`2B`$ sites of $`A`$. In fact all distinct pairs reflected across one bisector must lie on a common line perpendicular to that bisector, or four endpoints would be concyclic. [Bisector lemma](BISECTORS.md)

The Szemerédi–Trotter rich-line estimate bounds the number of candidate side lines by $`O(s^2/B^3+s/B)`$ for $`B\ge1`$. A noncollinear triangle is determined by its three side lines, and those three vertices determine its pin. Thus these triangles number at most $`O((s^2/B^3+s/B)^3)`$.

Take $`B=s^{1/2}n^{-1/14}`$ when this is at least one. The first term of the weighted incidence estimate and the cube of $`s^2/B^3`$ both become $`n^{9/14}s^{3/2}`$. The cube of $`s/B`$ is smaller, and the other terms give the stated bound. When $`B<1`$, one has $`s<n^{1/7}`$ and the trivial $`T(P,A)\le\binom{s}{3}`$ suffices.

For a partition into nonempty parts of maximum size $`S`$, sum the estimate using $`\sum_i|A_i|^{3/2}\le S^{1/2}n`$, $`\sum_i|A_i|^{1/2}\le n`$ and $`\sum_i|A_i|^2\le Sn`$. After dividing by $`n^2`$ the result is $`O(\sqrt{S/n^{5/7}}+n^{-1/14}+S/n)`$, which tends to zero under the stated condition.

# Sparse line covers are incompatible with near equality

For any fixed $`c\lt1/76`$, suppose a sequence of $`n`$-point sets with no four cocircular points has averaged pinned-distance count $`(1/3+o(1))n`$. The union of any $`O(n^c)`$ lines then contains $`o(n)`$ of the points. [Catalogue question](https://www.erdosproblems.com/654) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## Two line families

Let $`L`$ and $`M`$ be nonperpendicular lines, allowing coincidence. Reflect $`M`$ across $`L`$ to obtain $`M'`$. For any $`n`$-point planar set the number of ordered triples with pin $`x\in L`$, base $`y\in M`$ and another base $`z\notin M\cup M'`$ satisfying $`\lvert x-y\rvert=\lvert x-z\rvert`$ is $`O(n^{2-1/38})`$ uniformly in the two lines.

Take $`L`$ as horizontal axis and write $`M`$ as the graph of $`at+b`$. Write $`y=(t,at+b)`$ and $`z=(u,v)`$. For $`t\ne u`$ the pin coordinate is

```math
f_{u,v}(t)=\lambda t+(\lambda u+ab)+\frac{(au+b)^2-v^2}{2(t-u)},
\qquad \lambda=\frac{1+a^2}2.
```

The numerator of the residue is nonzero because $`z\notin M\cup M'`$. This also rules out solutions at $`t=u`$. A function occurs for at most two choices of $`z`$. Distinct functions with a common pole have different residues. The cubic-curve argument in [the one-line estimate](COLLINEAR-MASS.md) applies with the same incidence exponents. Here are the parameter details. For $`X=f_{u,v}(t)`$ one has

```math
2X(t-u)=(1+a^2)t^2+2ab\,t+b^2-u^2-v^2.
```

Subtracting this identity for two functions recovers $`t`$ rationally away from $`X=Y`$. Infinity is the unique common pole with coordinate ratio tending to one. Thus equal image curves differ by an affine parameter change. The common leading coefficient $`\lambda`$ forces slope one. A shift $`t\mapsto t+d`$ moves the finite pole from $`u`$ to $`u-d`$, while the constant term becomes $`\lambda(u+d)+ab`$. These give $`d=0`$. To apply the real incidence bound split at the finite poles and the zeros of the first coordinate derivative; there are only a bounded number of simple arcs. The same Bézout and Cauchy–Schwarz estimates now give the stated power saving.

## Counting the covered pairs

Let $`m`$ be the maximum number of collinear points. [The one-line estimate](COLLINEAR-MASS.md) implies $`m=o(n)`$ on this sequence. For a pin line $`L`$, all nontrivial point pairs reflected across $`L`$ use at most $`\max(2,m)`$ points of the set, by the [bisector lemma](BISECTORS.md). At any pin $`x\in L`$ the positive-radius circles containing one of those points therefore cover at most $`3\max(2,m)`$ points altogether.

Assign each covered point to one of its covering lines. Discard the $`o(n^2)`$ ordered pin-base incidences whose radius has multiplicity one or two, and for each covered pin $`x`$ discard the $`O(m+1)`$ base points on radii meeting a reflected pair for its assigned line. This costs another $`o(n^2)`$ incidences. If a remaining base $`y`$ belongs to its assigned line $`M`$, its circle about $`x`$ must contain $`z\notin M\cup M'`$. In fact the part of that circle on $`M\cup M'`$ consists of at most two reflection orbits, one for each intersection with $`M`$. In the absence of a nontrivial reflected pair at most two points of the set can lie there.

Write $`t`$ for the total number of assigned points and $`q`$ for the number of covering lines. Group their directions into disjoint pairs of mutually perpendicular directions, assigning zero mass to a missing partner. If the two counts in one group are $`u,v`$, this group yields $`2uv\le(u+v)^2/2`$ ordered pairs with perpendicular assigned lines. Summing gives at most $`t^2/2`$ such pairs in total. At least $`t^2/2-o(n^2)`$ of the remaining ordered pairs therefore have nonperpendicular assigned lines. The mixed incidence bound gives

```math
t^2/2-o(n^2)\le O(q^2 n^{2-1/38}).
```

For $`q=O(n^c)`$ with $`c\lt1/76`$ the right side is $`o(n^2)`$. Thus $`t=o(n)`$. This conclusion still permits numerous short lines with repeated reflection axes. The unrestricted conjecture remains open in this research record.

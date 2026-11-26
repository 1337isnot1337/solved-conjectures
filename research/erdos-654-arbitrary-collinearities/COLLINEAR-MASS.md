# A line cannot contain a positive proportion of a near-extremal set

Fix a line $`L`$ and an arbitrary planar set $`P`$ of $`n`$ points. The number $`I_L`$ of ordered triples $`(x,y,z)`$ with $`x,y\in P\cap L`$, $`z\in P\setminus L`$ and $`\lvert x-y\rvert=\lvert x-z\rvert`$ satisfies

```math
I_L=O(n^{2-1/38}).
```

The constant is absolute. This estimate requires no restriction on circles or lines. It gives a necessary condition for a counterexample sequence to [Erdős Problem 654](https://www.erdosproblems.com/654). [Research tracking](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## The rational functions

Make $`L`$ the horizontal axis and let $`A`$ denote the coordinates of the points on it. For $`z=(u,v)`$ off the axis, put $`h=v^2>0`$. The equation for $`x,y\in A`$ becomes

```math
x=f_{u,h}(y),\qquad f_{u,h}(t)=\frac{t+u}2-\frac{h}{2(t-u)}.
```

There is no solution with $`y=u`$. The functions are determined by their finite pole and its residue. Every distinct function is produced by at most two points of $`P`$, interchanged by reflection across $`L`$. Let $`F`$ be the family of distinct functions. For $`y\in A`$ put $`s_y=\#\{f\in F:f(y)\in A\}`$, omitting poles. Then $`I_L\le2\sum_y s_y`$.

For an ordered pair of distinct functions $`f,g`$, take the complex projective closure $`\Gamma_{f,g}`$ of the rational curve parametrized by $`(f(t),g(t))`$. It is irreducible and has degree at most three. Multiplying by the two linear denominators exhibits a homogeneous parametrization of degree at most three after homogenizing and canceling common factors. Equivalently a generic line meets the parametrization at at most three values of $`t`$.

## Distinctness of the curves

Write $`f=f_{u,h}`$ and $`g=f_{v,j}`$. The parameter is a rational function of the two coordinates $`X=f(t)`$ and $`Y=g(t)`$, since

```math
2(X-Y)t=2uX-2vY+v^2+j-u^2-h.
```

Here $`X-Y`$ is not identically zero. Thus both the displayed parametrization and the parametrization from any other pair giving the same curve have rational inverses on dense subsets. The parameter change is a fractional linear function, since the degrees of nonconstant rational functions multiply under composition.

As $`t\to\infty`$, both $`f(t)`$ and $`g(t)`$ have a pole and $`g(t)/f(t)\to1`$. No other parameter value has this property. For different finite poles, only one coordinate diverges at either one. For a common finite pole, the limiting ratio is $`j/h\ne1`$. The change of parameter for two equal curves must therefore fix infinity. It has the form $`at+b`$. Comparison of leading coefficients in $`f(t)=t/2+O(1)`$ gives $`a=1`$. If $`f_{u',h'}(t)=f_{u,h}(t+b)`$, comparison of finite poles gives $`u'=u-b`$, while the constant terms at infinity give $`u'=u+b`$. Hence $`b=0`$. Both functions in the ordered pair are recovered. The curves of distinct ordered pairs are distinct.

## The incidence bound

Two of these irreducible curves have at most nine points in common by Bézout's theorem. Ten distinct points consequently belong to at most one of the curves. On the real line, split each parametrization at its at most two finite poles into at most three simple arcs. The first coordinate is strictly increasing on each interval. Different arcs from the same curve have only a bounded number of intersections, since distinct preimages must have $`f(t)=g(t)`$ by the rational inverse above, and this equation has bounded degree. Ten points lie on at most three arcs. The [Pach–Sharir point–curve incidence theorem](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/on-the-number-of-incidences-between-points-and-curves/D82C6E430EE5402A3FE18C724A0C14B1) therefore applies with ten degrees of freedom and an absolute multiplicity bound.

The set of points is $`A^2`$ and there are $`O(n^2)`$ arcs. Each arc takes each coordinate pair at most once. The total number of incidences bounds $`\sum_y s_y(s_y-1)`$ and is at most

```math
O\!\left((n^2)^{10/19}(n^2)^{18/19}+n^2\right)=O(n^{3-1/19}).
```

Also $`\sum_y s_y\le n^2`$. Cauchy–Schwarz gives $`(\sum_y s_y)^2\le n\sum_y s_y^2=O(n^{4-1/19})`$, which proves the stated estimate.

## Application to pinned distances

Suppose that $`P`$ has no four cocircular points and write $`m=\#(P\cap L)`$. If an ordered pair of distinct points $`x,y\in P\cap L`$ belongs to a multiplicity-three pin-radius class at $`x`$, at least one of its other members is off $`L`$, since a positive-radius circle meets a line in at most two points. Thus the number of ordered incidences in single or double classes, counted over all pins, is at least $`m(m-1)-O(n^{2-1/38})`$. In the notation of [the bisector count](BISECTORS.md), this yields

```math
3D-n(n-1)=2A_1+A_2\ge\tfrac12(A_1+2A_2)
\ge\tfrac12\bigl(m(m-1)-O(n^{2-1/38})\bigr).
```

In particular, if $`D\le(1/3+o(1))n^2`$, the maximum number of collinear points is $`o(n)`$. A line containing $`\alpha n`$ points for fixed positive $`\alpha`$ gives an asymptotic gain of $`\alpha^2/6`$ in $`D/n^2`$. The case of many shorter lines with exceptional reflection axes remains open.

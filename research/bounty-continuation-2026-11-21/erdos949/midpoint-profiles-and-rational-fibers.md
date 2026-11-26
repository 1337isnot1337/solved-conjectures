# Midpoint closure and rational fibers in Erdős problem 949

A sum-free set $`S\subseteq\mathbb R`$ satisfies $`(S+S)\cap S=\varnothing`$. Erdős asks for a set $`A`$ of cardinality $`\kappa=|\mathbb R|`$ satisfying

```math
A\cap S=(A+A)\cap S=\varnothing.
```

Throughout, call any set satisfying these two disjointness conditions *admissible*. Sums include repeated summands. This note proves the requested cardinality when $`S`$ is piecewise syndetic or meets every coset of a one-dimensional rational subspace in a nonempty finite set. The unrestricted problem remains open here. [Erdős's original question, section 6](https://users.renyi.hu/~p_erdos/1977-27.pdf#page=15) · [Erdős Problems 949](https://www.erdosproblems.com/949) · [Earlier target and prior-work audit](target-and-prior-audit.md)

## Symmetric formulation and a sufficient Ramsey condition

It suffices to consider symmetric forbidden sets. For arbitrary $`S`$, put $`T=\pm(S\cap(0,\infty))`$. A Schur triple in $`T`$ would give three positive elements of $`S`$ with one the sum of the other two, so $`T`$ is sum-free. From an admissible set of size $`\kappa`$ for $`T`$, keep a subset of size $`\kappa`$ of one sign and reflect it if necessary. The resulting positive elements and their pairwise sums avoid $`S`$.

Suppose now that $`T=-T`$. Join two distinct reals by an edge when their difference belongs to $`T`$. This graph is triangle-free, since two directed differences along a triangle sum to the third. The Erdős–Dushnik–Miller partition theorem says that an infinite graph of cardinality $`\kappa`$ has an independent set of size $`\kappa`$ or a countably infinite clique. Apply it to the subgraph on any admissible set of size $`\kappa`$ to find an independent subset $`A'`$ of the same size. Then $`\{0\}\cup A'\cup(-A')`$ is also independent. Differences within either sign avoid $`T`$ by independence, while the other differences avoid $`T`$ by admissibility and symmetry. Conversely, a symmetric independent set containing zero is admissible. Independence gives avoidance of $`T`$ by its single elements and gives sum avoidance by taking the difference with a negative element. The case of two equal endpoints in this difference gives zero, which is outside every sum-free set. [Dushnik and Miller, Theorem 5.22](https://fa.ewi.tudelft.nl/~hart/onderwijs/set_theory/material/dushnik_miller-partially_ordered_sets.pdf#page=7)

There is also an admissible set of size $`\kappa`$ if some $`B`$ of size $`\kappa`$ has $`x+y\in T`$ for every pair of distinct elements $`x,y\in B`$. Choose disjoint ordered pairs $`(x_i,y_i)`$ from $`B`$, for $`i\lt\kappa`$, so that the differences $`a_i=x_i-y_i`$ are distinct and $`a_i,2a_i\notin T`$. At each stage discard the previously used points. Greedily select six new points whose pairwise differences avoid all the previously used $`\pm a_j`$. At each of the six selections fewer than $`\kappa`$ points are forbidden. On the six chosen points both the graph of differences in $`T`$ and the graph of doubled differences in $`T`$ are triangle-free. By the six-point Ramsey theorem some pair avoids both graphs. Use this pair for the stage. For $`i\ne j`$,

```math
a_i+a_j=(x_i+x_j)-(y_i+y_j)\in T-T.
```

This lies outside $`T`$ by sum-freeness. Unary and diagonal avoidance hold by construction. This sufficient condition does not establish that an arbitrary restricted-sum coloring has a homogeneous set of cardinality $`\kappa`$.

## Midpoint exceptions

For a real displacement $`t`$, define

```math
B_t=\{x\notin S:x-t\in S,\ x+t\in S\}.
```

Every $`B_t`$ is admissible. For any $`x,y\in B_t`$, the sum $`x+y=(x-t)+(y+t)`$ belongs to $`S+S`$, which is disjoint from $`S`$. This identity includes $`x=y`$. A counterexample to the problem therefore satisfies $`|B_t|\lt\kappa`$ for every $`t`$.

Call an ultrafilter on $`\mathbb R`$ uniform if every member has cardinality $`\kappa`$. Given such an ultrafilter $`p`$, put

```math
D=\{d\in\mathbb R:S-d\in p\}.
```

**Lemma.** In a counterexample, $`D`$ is closed under midpoints, $`(D-D)\cap S=\varnothing`$, and $`|D|\lt\kappa`$.

For $`d,e\in D`$, the intersection $`(S-d)\cap(S-e)`$ belongs to $`p`$. If $`x`$ lies in the intersection, both $`x+d`$ and $`x+e`$ lie in $`S`$. Their midpoint lies in $`S`$ except when it belongs to $`B_{(d-e)/2}`$. Uniformity permits removing the corresponding translate of this exceptional set from the intersection. The part that remains is contained in $`S-(d+e)/2`$, so $`(d+e)/2\in D`$. A point in the original intersection witnesses that $`d-e\in S-S`$. Since $`(S-S)\cap S=\varnothing`$ by sum-freeness, this gives the second conclusion.

If $`|D|=\kappa`$, take $`A=(D-D)/2`$. This set has size $`\kappa`$ by fixing one of the two arguments. Each member $`(d-e)/2=d-(d+e)/2`$ belongs to $`D-D`$. For $`d,e,f,g\in D`$,

```math
\frac{d-e}{2}+\frac{f-g}{2}=\frac{d+f}{2}-\frac{e+g}{2}\in D-D.
```

Thus $`A`$ is admissible, contradicting the assumed counterexample.

## Piecewise syndetic forbidden sets

A subset $`W`$ of the additive group of reals is *thick* if every finite set has a translate contained in $`W`$. The set $`S`$ is *piecewise syndetic* if $`W=S+F`$ is thick for some finite $`F`$. Every such $`S`$ has an admissible set of cardinality $`\kappa`$.

Indeed, for finite $`J\subseteq\mathbb R`$, the intersection $`\bigcap_{h\in J}(W-h)`$ is thick. For each finite $`K`$, translate $`K+J`$ into $`W`$. The same translation takes $`K`$ into the intersection. Every thick set $`U`$ has $`U-U=\mathbb R`$ by the two-point test, so $`|U|=\kappa`$. The family of all $`W-h`$ together with the complements of sets of cardinality less than $`\kappa`$ thus has the finite-intersection property. Extend it to a uniform ultrafilter $`p`$. For each $`h`$, the set $`W-h`$ is the finite union of $`S-(h-f)`$ over $`f\in F`$. One member of that union belongs to $`p`$. Consequently $`D+F=\mathbb R`$, which forces $`|D|=\kappa`$ and excludes a counterexample by the lemma.

## Every coset of a small subspace must have a forbidden point

Suppose $`S`$ is a counterexample. Choose an inclusion-maximal admissible set $`A`$ using Zorn's lemma. The union of any chain is admissible, since each pair lies in a single member. Necessarily $`|A|\lt\kappa`$. Choose $`s\in S`$, possible since the empty set has the required conclusion. Let $`H`$ be the rational span of $`A\cup\{s\}`$. Then $`|H|\leq\max(\aleph_0,|A|)\lt\kappa`$.

No coset of $`H`$ is contained in $`S`$. Two elements of such a coset could be chosen to differ by $`s\in S`$, contradicting the disjointness of $`S-S`$ and $`S`$. Suppose a coset $`C=x+H`$ were disjoint from $`S`$. It differs from $`H`$ because $`s\in H\cap S`$. For each $`y\in C`$, we have $`y\notin A\cup S`$ and $`y+a\notin S`$ for every $`a\in A`$, since $`y+a\in C`$. Maximality of $`A`$ forces $`2y\in S`$. As $`2C=2x+H`$, this makes a whole coset a subset of $`S`$, a contradiction. Hence every coset of $`H`$ has both a point in $`S`$ and a point outside $`S`$. In particular $`S+H=\mathbb R`$.

## One forbidden point on each coset of a rational line

Suppose $`\mathbb R=W\oplus L`$ as rational vector spaces, where $`L`$ is a rational line. Identify $`L`$ with $`\mathbb Q`$ by choosing a basis element. If every coset of $`L`$ contains exactly one point of $`S`$, then $`S`$ is the graph of a function $`h:W\to\mathbb Q`$. We prove that $`S`$ admits the required set of size $`\kappa`$. We have $`|W|=\kappa`$ since $`L`$ is countable.

Assume otherwise. For each fixed $`u\in W`$, fewer than $`\kappa`$ values of $`x`$ fail the equation

```math
h(x+u)+h(x-u)=2h(x).
```

To see this, put $`m=(h(x+u)+h(x-u))/2`$ and $`v=(h(x+u)-h(x-u))/2`$. At a failure, $`(x,m)`$ belongs to $`B_{(u,v)}`$. For each fixed $`v`$ this gives an injection from the corresponding failures into $`B_{(u,v)}`$, by the first coordinate. There are only countably many possible $`v`$. By König's theorem $`\mathop{\mathrm{cf}}(2^{\aleph_0})\gt\aleph_0`$, so the union of these exceptional sets still has size less than $`\kappa`$.

Fix any finite-dimensional rational subspace $`E\subseteq W`$. For all but fewer than $`\kappa`$ base points $`z`$, the function

```math
L_z(e)=h(z+e)-h(z),\qquad e\in E,
```

is rational-linear. Indeed, exclude the translates of the preceding exceptional sets for centers $`z+e`$ and displacements $`u`$, for all $`e,u\in E`$. Since $`E`$ is countable, the excluded union still has size less than $`\kappa`$. On every remaining coset the restriction preserves midpoints. A midpoint-preserving map vanishing at zero satisfies $`L_z(2e)=2L_z(e)`$ and hence is additive, which implies rational linearity.

Fix $`v\in W`$. Take any two base points $`y,y'`$ satisfying the linearity conclusion with $`E=\mathbb Qv`$, and write $`a=L_y(v)`$, $`a'=L_{y'}(v)`$. Choose a base point $`z`$ satisfying the conclusion for the larger space $`E'=\mathop{\mathrm{span}}_{\mathbb Q}(v,y,y')`$ and write $`L=L_z`$. For every $`q\in\mathbb Q`$, sum-freeness applied to the graph points over $`z`$ and $`y+qv`$ gives

```math
L(y)+qL(v)=h(z+y+qv)-h(z)\ne h(y+qv)=h(y)+qa.
```

Two affine functions from $`\mathbb Q`$ to $`\mathbb Q`$ with unequal slopes agree at some rational argument. Consequently $`L(v)=a`$. The same calculation with $`y'`$ gives $`L(v)=a'`$. Thus there is a value $`a(v)\in\mathbb Q`$ such that $`h(y+v)-h(y)=a(v)`$ outside a set of base points of size less than $`\kappa`$.

Take any uniform ultrafilter on $`W`$ and push it forward to $`\mathbb R`$ along the graph map $`y\mapsto(y,h(y))`$. This gives a uniform ultrafilter $`p`$ since the graph map is injective. For every $`v\in W`$, the translate $`S-(v,a(v))`$ belongs to $`p`$ by the preceding conclusion. Its translate profile therefore has cardinality $`\kappa`$, which contradicts the midpoint lemma.

## Finite fibers over a rational line

The preceding result also applies if every fiber of $`S`$ over a rational line is nonempty and finite. To prove this, assume a counterexample, and write $`F_x=\{r\in\mathbb Q:(x,r)\in S\}`$. Fewer than $`\kappa`$ fibers can fail midpoint closure. Each failing fiber has $`r-v,r+v\in F_x`$ and $`r\notin F_x`$ for some rational $`r,v`$. Fixing $`v`$ and choosing one witnessing $`r`$ in each such fiber gives an injection into $`B_{(0,v)}`$. The union over countably many $`v`$ has size less than $`\kappa`$. Each remaining fiber is a singleton, since iterating midpoints between two distinct rationals gives infinitely many distinct points.

Choose one point from each fiber to form a sum-free graph $`S_0\subseteq S`$. The set $`N=S\setminus S_0`$ has size less than $`\kappa`$, since it lies over the exceptional fibers and each fiber is finite. Let $`A_0`$ be the size-$`\kappa`$ admissible set for $`S_0`$ furnished by the graph result. To obtain an admissible set for $`S`$, first discard from $`A_0`$ the points in $`N\cup(N/2)`$. At each of $`\kappa`$ stages select a remaining point that differs from every previously selected point and lies in none of the translates $`N-a`$ for previously selected $`a`$. At stage $`\alpha\lt\kappa`$ the excluded union has size at most $`\max(\aleph_0,|\alpha|,|N|)\lt\kappa`$. This constructs the required subset even if $`\kappa`$ is singular.

The small subspace furnished by maximality may have any dimension below $`\kappa`$, and its fibers may be infinite. The arguments above do not settle that case. The earlier [reflection criteria and fixed-basis obstruction](reflection-and-dilation-obstruction.md) concern different sufficient conditions. [Repository coordination](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7205542505)

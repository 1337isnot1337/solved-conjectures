# Two classes of infinite fibers in Erdős problem 949

Let $`\mathbb R=W\oplus\mathbb Q`$ as rational vector spaces. For a sum-free set $`S`$, write $`F_x=\{r\in\mathbb Q:(x,r)\in S\}`$ and $`\kappa=2^{\aleph_0}`$. Suppose every $`F_x`$ is nonempty. The required set of cardinality $`\kappa`$ exists under either of two further hypotheses. The fibers may all be rational intervals, with arbitrary choices of endpoints and inclusion of endpoints. They may instead all be cosets of the subgroup $`\mathbb Z_{(p)}`$ for a fixed odd prime $`p`$. These conditions allow infinite fibers. [Erdős problem 949](https://www.erdosproblems.com/949) · [Midpoint exception and ultrafilter lemmas](midpoint-profiles-and-rational-fibers.md#midpoint-exceptions)

## Interval fibers

Suppose each $`F_x`$ is an interval in the rational order. Choose $`s\in F_0`$. Since $`(0,s)\in S`$, we have $`s\ne0`$ and no two members of the same fiber can differ by $`s`$. An interval of width greater than $`|s|`$ would contain such a pair, so every fiber has finite width. Write

```math
w(x)=\sup F_x-\inf F_x,\qquad m(x)=(\sup F_x+\inf F_x)/2
```

using real bounds, which need not be rational. If fewer than $`\kappa`$ base points have positive width, all other fibers are singletons. Choosing one point from each fiber thus removes fewer than $`\kappa`$ points. The [one-dimensional graph theorem and small-set thinning](midpoint-profiles-and-rational-fibers.md#finite-fibers-over-a-rational-line) give the conclusion. Otherwise there is some $`\varepsilon>0`$ such that $`X=\{x:w(x)\geq\varepsilon\}`$ has cardinality $`\kappa`$. This follows by taking the countable union of the sets with widths at least $`1/n`$ and using the uncountable cofinality of $`\kappa`$.

Assume for contradiction that the required admissible set does not exist. For any finite-dimensional rational subspace $`E\subseteq W`$, all but fewer than $`\kappa`$ base points $`z`$ give a midpoint-closed set

```math
C_z=\{(e,r):e\in E,\ r\in F_{z+e}\}.
```

For each $`e,u\in E`$ and rational $`v`$, a midpoint failure with center $`(z+e,r)`$ and displacement $`(u,v)`$ belongs to the exceptional set $`B_{(u,v)}`$. For these fixed $`e,u,v`$, projection to the horizontal coordinate bounds the number of failing $`z`$ by $`|B_{(u,v)}|\lt\kappa`$. All the choices fit in a countable union.

For such a $`z`$, midpoint closure implies that $`e\mapsto w(z+e)`$ is midpoint-concave. It is nonnegative everywhere on $`E`$, hence constant. Indeed, writing any $`b\in E`$ as the dyadic convex combination $`(1-2^{-n})a+2^{-n}(a+2^n(b-a))`$ gives $`w(z+b)\geq(1-2^{-n})w(z+a)`$ for every $`n`$. Now interchange $`a,b`$. The functions $`e\mapsto\inf F_{z+e}`$ and $`e\mapsto\sup F_{z+e}`$ are respectively midpoint-convex and midpoint-concave. They differ by a constant, so both preserve midpoints. It follows that $`e\mapsto m(z+e)-m(z)`$ is a rational-linear map from $`E`$ to $`\mathbb R`$. Denote it by $`L_z`$.

Fix $`v\in W`$. Take two points $`y,y'\in X`$ where the preceding conclusions hold for $`\mathbb Qv`$. Take $`z\in X`$ where they hold for $`E=\mathop{\mathrm{span}}_{\mathbb Q}(y,y',v)`$. For rational $`q`$, the rational intervals $`F_z+F_{y+qv}`$ and $`F_{z+y+qv}`$ are disjoint by sum-freeness. All three participating fibers have width at least $`\varepsilon`$. Their centers on the two sides are respectively

```math
m(z)+m(y)+qL_y(v),\qquad m(z)+L_z(y)+qL_z(v).
```

If the slopes differed, varying rational $`q`$ would place these centers within $`\varepsilon/2`$ of one another. The interiors would then overlap in a rational point. Here the sum of two positive-width rational intervals contains every rational strictly between the sums of their lower and upper endpoints, by density of the rationals. This contradicts disjointness. Hence $`L_y(v)=L_z(v)`$, and comparison at $`y'`$ also gives $`L_{y'}(v)=L_z(v)`$. There is a common real slope $`a(v)`$ at every $`y\in X`$ satisfying the conclusions for $`\mathbb Qv`$.

For every $`y\in X`$, choose $`r(y)\in\mathbb Q`$ with $`|r(y)-m(y)|\lt\varepsilon/8`$. This point lies in $`F_y`$. Push any uniform ultrafilter on $`X`$ forward by $`y\mapsto(y,r(y))`$. For each $`v\in W`$, choose $`b(v)\in\mathbb Q`$ within $`\varepsilon/8`$ of $`a(v)`$. At all but fewer than $`\kappa`$ base points $`y\in X`$, the interval $`F_{y+v}`$ has width at least $`\varepsilon`$ and center $`m(y)+a(v)`$. The point $`r(y)+b(v)`$ is within $`\varepsilon/4`$ of this center, so belongs to that interval. Thus every $`(v,b(v))`$ lies in the translate profile of the pushed-forward ultrafilter, contradicting the midpoint lemma.

## Cosets with a Prüfer quotient

Fix an odd prime $`p`$, take $`M=\mathbb Z_{(p)}=\{a/b\in\mathbb Q:p\nmid b\}`$, and suppose each fiber is a full coset of $`M`$. In the quotient $`G=W\oplus T`$, where $`T=\mathbb Q/M`$, the set projects to a graph $`S'=\{(x,h(x)):x\in W\}`$ for $`h:W\to T`$. Since $`S`$ is the full inverse image of this graph, the graph is sum-free and any admissible set of cardinality $`\kappa`$ in $`G`$ lifts to one in $`\mathbb R`$ by choosing representatives.

The group $`T`$ is the countable Prüfer $`p`$-group. Its elements are the union of nested cyclic subgroups of orders $`p^n`$. Every proper subgroup is finite, since a subgroup with unbounded element orders contains every one of those nested cyclic groups. As a result, a nonzero homomorphism $`\mathbb Q\to T`$ is surjective. Its image is divisible because $`\mathbb Q`$ is divisible, whereas a nonzero finite group is not divisible. Since $`p`$ is odd, doubling is a bijection on $`T`$, and hence also on $`G`$.

All steps of the midpoint exception and uniform-profile lemmas hold for $`G`$. Their proofs use only unique halving, sum-freeness and a uniform ultrafilter on a set of size $`\kappa`$. In a counterexample, countability of the vertical group now gives the same generic Jensen equation as in the [rational graph proof](midpoint-profiles-and-rational-fibers.md#one-forbidden-point-on-each-coset-of-a-rational-line). More explicitly, for each finite-dimensional $`E\subseteq W`$, all but fewer than $`\kappa`$ base points $`z`$ give an additive map $`L_z(e)=h(z+e)-h(z)`$ on $`E`$. This uses the unique midpoint and the implication from midpoint preservation and value zero at zero to additivity.

Fix $`v\in W`$. Choose two base points $`y,y'`$ where additivity holds on $`\mathbb Qv`$, and $`z`$ where it holds on $`\mathop{\mathrm{span}}_{\mathbb Q}(v,y,y')`$. For every $`q\in\mathbb Q`$, sum-freeness gives

```math
L_z(y)+L_z(qv)\ne h(y)+L_y(qv).
```

The homomorphism $`q\mapsto L_z(qv)-L_y(qv)`$ misses $`h(y)-L_z(y)`$. By the surjectivity property just proved it must therefore vanish. Comparing at $`y'`$ gives the same conclusion for $`L_{y'}`$. In particular $`h(y+v)-h(y)`$ takes one fixed value $`a(v)\in T`$ off a set of size less than $`\kappa`$. Pushing a uniform ultrafilter on $`W`$ forward along the graph gives all $`(v,a(v))`$ in its translate profile, contradicting the midpoint lemma. This proves the conclusion for the stated coset fibers.

An arbitrary infinite fiber can have gaps in the rational order and can fail to be a coset of any fixed subgroup. These two arguments leave such fibers open.

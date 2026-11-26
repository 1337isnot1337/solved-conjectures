# Finite fibers over a finite-dimensional rational subspace in Erdős problem 949

**Theorem.** Let $`S\subseteq\mathbb R`$ be sum-free. Suppose a finite-dimensional rational subspace $`H\subseteq\mathbb R`$ has the property that each of its cosets meets $`S`$ in a nonempty finite set. Then there exists $`A\subseteq\mathbb R\setminus S`$ of cardinality $`\kappa=2^{\aleph_0}`$ with $`(A+A)\cap S=\varnothing`$, including repeated sums. The dimension and finite fiber sizes are unrestricted. The full problem permits infinite fibers and need not admit any such finite-dimensional subspace. [Erdős problem 949](https://www.erdosproblems.com/949) · [Earlier midpoint lemma and the one-dimensional case](midpoint-profiles-and-rational-fibers.md)

Assume first that every fiber is a singleton. Choose a rational vector-space decomposition $`\mathbb R=W\oplus H`$, identify $`H`$ with $`\mathbb Q^d`$, and write $`S`$ as the graph of $`h:W\to H`$. We have $`|W|=\kappa`$. Suppose the conclusion fails. The midpoint exception bound in the earlier note applies to this $`S`$.

For every fixed finite-dimensional rational subspace $`E\subseteq W`$, outside a set of base points $`z`$ of size less than $`\kappa`$, the map

```math
L_z(e)=h(z+e)-h(z),\qquad e\in E,
```

is rational-linear. Indeed, for a fixed $`u\in E`$, a failure of $`h(x+u)+h(x-u)=2h(x)`$ gives a missing midpoint in the graph at displacement $`(u,(h(x+u)-h(x-u))/2)`$. There are countably many possible vertical displacements because $`H`$ is countable. For each one the midpoint exception bound gives fewer than $`\kappa`$ failures. The cofinality of the continuum is uncountable, so the union of failures still has size below $`\kappa`$. Exclude their translates for all centers $`z+e`$ and displacements $`u`$ in the countable space $`E`$. The resulting map preserves midpoints and vanishes at zero, hence is additive and rational-linear.

Take a uniform ultrafilter $`p`$ on $`W`$. Let $`K=\mathbb Q^W/p`$ be the field of functions $`W\to\mathbb Q`$ modulo equality on a member of $`p`$, with pointwise field operations and standard rational numbers represented by constant functions. Applying this construction to each of the $`d`$ coordinates defines

```math
L:W\longrightarrow K^d,\qquad L(v)=[z\mapsto h(z+v)-h(z)]_p.
```

Local linearity on the span of any two test vectors holds outside a set of size less than $`\kappa`$, so $`L`$ is rational-linear.

Among the rational subspaces $`U\subseteq W`$ of cardinality $`\kappa`$, choose one minimizing the integer

```math
r=\dim_K T,\qquad T=\mathop{\mathrm{span}}_K L(U).
```

If $`r=0`$, push $`p`$ forward by $`z\mapsto(z,h(z))`$. For every $`v\in U`$ the translate $`S-(v,0)`$ belongs to the resulting uniform ultrafilter on $`\mathbb R`$, since $`L(v)=0`$. This contradicts the [midpoint lemma](midpoint-profiles-and-rational-fibers.md#midpoint-exceptions), which bounds its translate profile below $`\kappa`$ in a counterexample. Hence $`r\geq1`$.

For each proper $`K`$-linear subspace $`P\subsetneq T`$, the set $`\{u\in U:L(u)\in P\}`$ has cardinality less than $`\kappa`$ by the minimality of $`r`$. The same bound holds for the preimage in $`U`$ of every affine translate of $`P`$, since each such preimage is empty or a coset of the linear preimage.

Choose a rational subspace $`V\subseteq U`$ of dimension $`r+d`$ so that any rationally independent list in $`V`$ of length at most $`r`$ has $`K`$-linearly independent images under $`L`$. Build a basis one vector at a time. If $`V_0`$ is its current span, choose the next vector $`w`$ so that for every $`v\in V_0`$ and every independent list $`v_1,\ldots,v_{k-1}\in V_0`$ with $`1\leq k\leq r`$,

```math
L(w+v)\notin\mathop{\mathrm{span}}_K(L(v_1),\ldots,L(v_{k-1})).
```

For $`k=1`$ the span on the right is zero. Each excluded condition pulls back an affine proper subspace of $`T`$. The countably many conditions together exclude fewer than $`\kappa`$ points. Any independent list from $`V_0+\mathbb Qw`$ that uses $`w`$ can be changed by rational row operations to a list ending in $`w+v`$ with all other entries in $`V_0`$. This gives the required independence by induction.

There must be $`\kappa`$ points $`y\in U`$ with $`h(y)=0`$. Otherwise $`S`$ meets $`U\times\{0\}`$ in a fixed set $`N`$ of size less than $`\kappa`$. Within that horizontal subspace one can greedily select $`\kappa`$ points avoiding $`N`$, $`N/2`$, and every $`N-a`$ with $`a`$ previously selected. At stage $`\alpha\lt\kappa`$ these exclusions and the previously selected points have cardinality at most $`\max(\aleph_0,|\alpha|,|N|)\lt\kappa`$. This would solve the problem.

Choose one such $`y`$ where the local linearity conclusion holds on $`y+V`$. Write $`M(v)=h(y+v)-h(y)=h(y+v)`$ for its rational-linear part. Since its range is in $`\mathbb Q^d`$, the kernel of $`M`$ contains $`r`$ independent rational vectors $`u_1,\ldots,u_r`$. The construction of $`V`$ makes $`L(u_1),\ldots,L(u_r)`$ a $`K`$-basis of $`T`$. Since $`y\in U`$, choose $`c_1,\ldots,c_r\in K`$ such that

```math
L(y)=\sum_{i=1}^r c_i L(u_i).
```

Use functions $`c_i(z)\in\mathbb Q`$ representing these coefficients. The displayed equality holds coordinate by coordinate on a member of $`p`$. Choose one $`z`$ in this member where local linearity holds on the full countable space $`\mathop{\mathrm{span}}_{\mathbb Q}(V,y)`$. Such a $`z`$ exists by uniformity. Put $`e=-\sum_i c_i(z)u_i`$. Then $`e\in\ker M`$, so $`h(y+e)=0`$. The equality at $`z`$ also gives

```math
h(z+y+e)-h(z)=L_z(y)+L_z(e)=0.
```

Thus the graph points $`(z,h(z))`$ and $`(y+e,0)`$ have sum $`(z+y+e,h(z+y+e))`$ on the same graph. This contradicts sum-freeness and proves the singleton case.

For nonempty finite fibers, the [small-exception argument for a rational line](midpoint-profiles-and-rational-fibers.md#finite-fibers-over-a-rational-line) applies verbatim with $`H=\mathbb Q^d`$. There are countably many displacements in $`H`$. In a counterexample fewer than $`\kappa`$ fibers fail midpoint closure, and a midpoint-closed finite set in a rational vector space is a singleton. Keep one point in each fiber and apply the graph case. The discarded forbidden points form a set of size below $`\kappa`$, so the same greedy thinning of the resulting admissible set restores their avoidance.

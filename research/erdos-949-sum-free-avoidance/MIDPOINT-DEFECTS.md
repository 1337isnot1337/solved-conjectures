# Erdős’s sum-free avoidance conjecture

**A counterexample must be locally midpoint-convex away from fewer than continuum many points, in every countable subgroup.** It must also have large vertex neighborhoods of missing midpoints, even though in every fixed direction its midpoint defects are small. No regularity assumption on the sum-free set is used.

Work in a rational vector space $G$ of cardinality $\kappa$ and let $S\subseteq G$ satisfy $(S+S)\cap S=\varnothing$. A witness is a set $A$ of cardinality $\kappa$ with $(A\cup(A+A))\cap S=\varnothing$. The original problem has $G=\mathbb R$ and $\kappa=\mathfrak c$.

## Two direct certificates

For a fixed $d\in G$ define
```math
E_d=\{x:x-d,x+d\in S,\ x\notin S\}.
```
Any two elements $x,y$ of $E_d$, including $x=y$, satisfy $x+y=(x-d)+(y+d)\in S+S$. Thus $E_d$ is a witness whenever it has size $\kappa$.

There is a different sufficient criterion: if some $B\subseteq S$ has size $\kappa$ and $(b+b')/2\in S$ for all $b,b'\in B$, fix $s\in B$ and use $A=(B-s)/2$. If $(b-s)/2$ were in $S$, adding the element $(b+s)/2\in S$ would give $b\in S$, contradicting sum-freeness. Also
```math
(b-s)/2+(b'-s)/2=(b+b')/2-s\in S-S,
```
and $S-S$ is disjoint from $S$. This proves the claim, including diagonal sums. In particular, this proves the problem for midpoint-convex $S$ without measurability. If $S$ itself is small, the usual transfinite recursion applies.

## Local convexity in every countable direction space

Suppose no witness exists, and $\mathrm{cf}(\kappa)>\aleph_0$, as holds for $\mathfrak c$ by König’s theorem. For a countable rational subspace $H$ put
```math
Z_H=H+\bigcup_{d\in H} E_d.
```
Each $E_d$ has size less than $\kappa$. The countable union and its translate-saturation $Z_H$ still have size less than $\kappa$. Every coset of $H$ outside $Z_H$ meets $S$ in a genuinely midpoint-convex set: the midpoint of two members in the same coset would otherwise lie in $E_d$, with $d$ their half-difference in $H$.

For example, suppose there are $\kappa$ distinct $b$ such that $b+F\subseteq S$ for some nonempty finite set $F$. Apply the preceding fact with $H$ the rational span of $F-F$ and discard the fewer than $\kappa$ translates meeting $Z_H$. There are still $\kappa$ choices of $b$, and for each of them $S$ contains $`b+\mathop{\mathrm{conv}}_2(F)`$ simultaneously, where $`\mathop{\mathrm{conv}}_2`$ denotes the convex combinations with nonnegative dyadic rational coefficients summing to one. In particular if a fixed difference $t$ occurs in $\kappa$ pairs of elements of $S$, then every dyadic multiple $q t$ for $-1\le q\le1$ belongs to $S-S$ and cannot belong to $S$. Consequently any such $t$ with $q t\in S$ for one of these $q$ already gives an unconditional witness, by the contrapositive. These statements work without assuming regular continuum.

## Missing midpoints must also be abundant at common centers

Suppose further that $\kappa$ is regular, and assume no witness. On $S$ let two distinct vertices be adjacent when their midpoint is missing from $S$. By the second certificate, no induced subgraph of size $\kappa$ has an independent set of size $\kappa$. In any such induced subgraph some vertex therefore has $\kappa$ neighbors: if all degrees were smaller, a transfinite greedy construction would give an independent set of size $\kappa$, using regularity. Iterate inside this large neighborhood. For every fixed positive integer $m$ there are $m$ distinct pairwise adjacent centers and $\kappa$ vertices adjacent to all of them. The same assertion holds inside every $\kappa$-subset of $S$.

Thus missing-midpoint pairs cannot all be controlled by small neighborhoods of their **vertices**, even though the first certificate makes them sparse for each fixed **difference**, and the local result makes them sparse across any countable subspace of differences. This is a restriction on a counterexample, not a proof one cannot exist.

[Original problem](https://www.erdosproblems.com/949) · [Thin-translate criterion](THIN-INTERSECTIONS.md) · [Maximality fibers](MAXIMALITY-FIBERS.md) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/950)

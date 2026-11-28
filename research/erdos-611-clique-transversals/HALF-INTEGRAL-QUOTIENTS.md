# Clique transversals through half-integral quotients

**Theorem.** Let $`\kappa(G)`$ be the minimum size of a maximal clique, and let $`\tau(G)`$ be the least size of a set meeting all maximal cliques. Every graph obtained by iterated substitution into arbitrary triangle-free graphs satisfies
```math
\tau(G)\le \left(\frac{|V(G)|}{\kappa(G)}\right)^2.
```
In particular $`\tau(G)\le c^{-2}`$ if every maximal clique has size at least $`c|V(G)|`$. There is no bound on the sizes of intermediate quotients or the depth of substitution. A more general version below replaces triangle-freeness by a fixed denominator for the quotient clique-covering polytopes. This is an upper bound for a class, not a resolution of the unrestricted first clause of Erdős #611.

## Power rounding at a fixed denominator

For a nonempty family $`\mathcal F`$ of nonempty subsets of a finite set $`V`$, define its fractional transversal polytope by
```math
P(\mathcal F)=\{x\in[0,1]^V:\ \sum_{v\in F}x_v\ge1\ \text{for every }F\in\mathcal F\}.
```
Suppose every vertex of this polytope has coordinates in $`\{0,1/D,\ldots,1\}`$ for some positive integer $`D`$. Given nonnegative ratios $`r_v`$ and any feasible $`x`$ with $`\sum_v x_vr_v\le1`$, there is a transversal $`T`$ of $`\mathcal F`$ such that $`\sum_{v\in T}r_v^D\le1`$.

Minimize the linear objective with coefficients $`r_v`$ on $`P(\mathcal F)`$, and choose an optimal vertex $`y`$. Put $`Dy_v`$ tokens on vertex $`v`$, each carrying ratio $`r_v`$. Every member of $`\mathcal F`$ contains at least $`D`$ tokens. The sum of the ratios of all tokens is at most $`D`$. Delete the $`D-1`$ largest tokens (deleting none for $`D=1`$); the vertices with at least one surviving token make a transversal. The case $`D=1`$ is immediate, so suppose $`D\ge2`$. If $`b`$ is the largest remaining token ratio, then $`b\le1`$ since there were at least $`D`$ tokens of ratio at least $`b`$. The sum of the $`D`$-th powers of remaining token ratios is at most
```math
b^{D-1}\bigl(D-(D-1)b\bigr)\le1.
```
Indeed the last expression is nondecreasing on $`[0,1]`$, by the derivative $`D(D-1)b^{D-2}(1-b)`$, and equals one at $`b=1`$. Counting each chosen vertex only once can only reduce that sum.

## Use the same exponent at every substitution level

Consider the maximal-clique family of a quotient $`Q`$, and substitute a nonempty graph $`G_v`$ at each $`v`$. Set $`n_v=|V(G_v)|,\ a_v=\kappa(G_v),\ n=\sum n_v`$, and $`a=\min_{F\in\mathcal F}\sum_{v\in F}a_v`$. In the product graph the maximal cliques are precisely the unions of one maximal clique in each module indexed by a maximal clique of $`Q`$; in particular their minimum size is $`a`$. Set
```math
x_v=\min(1,a_v/a),\qquad r_v=\frac{a n_v}{n a_v}.
```
The vector $`x`$ is feasible: if capping changes a contribution inside a clique, that contribution alone is now one; otherwise use the definition of $`a`$. Also $`\sum_v x_vr_v\le\sum_v n_v/n=1`$.

If all quotients admit a fixed denominator $`D`$ for these polytopes, round as above. The union of a transversal in each selected module hits all maximal cliques of the product. By induction from single vertices its size is at most
```math
\sum_{v\in T}(n_v/a_v)^D=(n/a)^D\sum_{v\in T}r_v^D\le(n/a)^D.
```
The same reasoning works for maximum cliques whenever the particular maximum-*weight* clique family of each weighted quotient has the same denominator property.

## The triangle-free class

For triangle-free $`Q`$, the maximal cliques are edges and isolated vertices. The fractional transversal polytope is the usual half-integral vertex-cover polytope, with isolated vertices fixed at one. For completeness, at an extreme point take the graph on its fractional coordinates whose edges are the tight inequalities $`x_u+x_v=1`$. Any bipartite component, including an isolated fractional coordinate, permits a small nonzero alternating perturbation both ways, without violating bounds or nontight constraints; a tight edge cannot connect a fractional coordinate to an integral one. Thus every component has an odd cycle, forcing all its coordinates to $`1/2`$. So $`D=2`$ uniformly. For example, long cycles themselves are allowable prime quotients, in contrast to a bounded-modular-width hypothesis. Passing to graph complements gives the corresponding maximal-independent-set statement.

## A uniform positive-coordinate condition is enough

There is also a version not requiring a common denominator. Suppose that at every quotient, each nonzero coordinate of each vertex of its fractional transversal polytope is at least a fixed $`\epsilon>0`$. Then $`\tau(G)\le(n/\kappa(G))^{A(\epsilon)}`$ under arbitrary iterated substitution. One can take any $`A>1`$ satisfying
```math
(1-\epsilon/4)^{A-1}\le\epsilon,\qquad 4^{-(A-1)}\le\epsilon.
```

To round, choose an optimal fractional vertex $`y`$ as before and ignore zero coordinates. Put $`\delta=\epsilon/4`$, let $`L=\{v:r_v\le1-\delta\}`$ in the support, and write $`H`$ for the remaining support. If $`L`$ hits every member, choose $`L`$; its cost is at most
```math
\sum_{v\in L}r_v^A\le\epsilon^{-1}(1-\delta)^{A-1}\sum_{v\in L}y_vr_v\le1.
```
Otherwise any member $`F`$ disjoint from $`L`$ has $`y`$-weight at least one in $`H\cap F`$, consuming more than $`1-\delta`$ of the objective. A vertex of $`H`$ outside $`F`$ would contribute more than $`\epsilon(1-\delta)>\delta`$, impossible. Thus every such $`F`$ contains all of $`H`$, and $`y(H)\ge1`$. Choose a minimum-ratio $`v\in H`$, with ratio $`\lambda\in(1-\delta,1]`$. The remaining $`L`$ objective is at most $`1-\lambda`$; every $`r_u`$ for $`u\in L`$ is at most $`(1-\lambda)/\epsilon\le1/4`$. Hence $`\sum_{u\in L}r_u^A\le \epsilon^{-1}4^{-(A-1)}(1-\lambda)\le1-\lambda`$. The transversal $`L\cup\{v\}`$ costs at most $`1-\lambda+\lambda^A\le1`$. Apply the same substitution induction with exponent $`A`$.

The stronger fixed-denominator exponent $`D`$ above comes from the token argument, not from the positive-coordinate estimate.

## Priority and scope

The existing [bounded-modular-width proof](https://github.com/1337isnot1337/solved-conjectures/blob/f66b4afd/docs/bollobas-erdos-tuza-research.md#a-constant-upper-bound-for-bounded-modular-width) already gives a constant bound with exponent $`4k+1`$ for arbitrary quotients of order at most $`k`$; that is prior work, not claimed here. Replacing the size parameter by a common denominator, and obtaining a uniform quadratic bound despite arbitrarily large triangle-free quotients, is the extension. [Cooper–Hollars](https://arxiv.org/abs/2607.15486) already cover cographs with the stronger exponent one, and also treat split graphs. [Boros–Gurvich–Milanič–Tikhanovsky–Uno](https://doi.org/10.1016/j.disc.2025.114657) prove a different substitution theorem about conformality of the *family of minimal transversals*. The earlier [induced-biclique result](INDUCED-BICLIQUES.md) concerns a different hereditary hypothesis, and also handles hitting just the large maximal independent sets; the present theorem assumes that all maximal cliques are large. The original [Erdős–Gallai–Tuza source](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0611), current catalog, both repository issues, and targeted literature searches were checked. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).

# The negative rainbow axiom survives ccc bounding forcing

Let **RP** assert that, for every finite-to-one colouring $`f:[\omega_1]^2\to\mathrm{Ord}`$, there is a countable partition of $`\omega_1`$ whose cells are $`f`$-rainbow. This is the [published Todorčević principle](https://doi.org/10.1090/S0002-9947-1983-0716846-0), §1 Remark (4), p. 715, used for the negative consistency direction of EGH 9/C. See also [Zhang, §5](https://arxiv.org/pdf/1809.00649).

**Theorem.** Every ccc $`\omega^\omega`$-bounding forcing preserves RP. In particular, starting from an RP model, adding any number of random reals still rules out every uncountably chromatic $`T_3,T_4`$-free triple system on $`\omega_1`$. Thus arbitrary random products preserve this negative side of 9/C, while also preserving the positive witness when started in the one-Cohen model.

## Ground lists and truncations

Let $`P`$ be ccc and $`\omega^\omega`$-bounding, and work below a condition forcing that $`\dot f`$ is a finite-to-one colouring of $`[\omega_1]^2`$. For each ground pair $`a`$, there is a countable ground set $`L(a)`$ of possible pairs $`b`$ sharing its $`\dot f`$-colour: enumerate the forced finite collision class of $`a`$ using a ground well-order of the pairs, and use a countable maximal deciding antichain for each entry. Fix a ground injection $`j_a:L(a)\to\omega`$.

For each $`\beta<\omega_1`$, enumerate the pairs with maximum $`\beta`$ by a finite or countably infinite subset of $`\omega`$, writing $`a_{\beta,n}`$ for a defined entry. Let $`\dot g_\beta(n)`$ be the largest $`j_{a_{\beta,n}}`$-index of a collision partner of $`a_{\beta,n}`$ in the actual colouring, using zero if the entry or partner set is empty. By bounding and ccc there is a single ground function $`b_\beta\in\omega^\omega`$ which the condition forces to eventually dominate $`\dot g_\beta`$. Indeed, take a maximal antichain deciding individual ground bounds and use a diagonal eventual upper bound of those countably many functions.

Build in the ground a graph $`J`$ on the set of pairs. Connect distinct $`a=a_{\beta,n}`$ and $`a'=a_{\gamma,m}`$ exactly when $`a'\in L(a)`$ with index $`j_a(a')\le b_\beta(n)`$, and $`a\in L(a')`$ with index $`j_{a'}(a)\le b_\gamma(m)`$. Each vertex of $`J`$ has finite degree because it has only finitely many partners at or below its designated natural-number bound.

## Cover the locally finite collision graph

In each connected component of $`J`$, choose a root and number the finite shells by their distance from it. For one pair-colouring $`F_0`$, put shells $`0,1`$ in one colour class, shells $`2,3`$ in another, and so on. For $`F_1`$, keep shell $`0`$ alone and group shells $`1,2`$, $`3,4`$, and so on. Use disjoint labels for different components. These are finite-to-one ground colourings of the pairs. Each edge of $`J`$ has its endpoints monochromatic for at least one of them: shell indices differ by at most one. By ground RP, take the product of their two countable rainbow partitions to obtain a single ground countable partition $`c_0`$. No class of $`c_0`$ contains both pairs of any $`J`$-edge.

## Remove finite entry exceptions in the extension

In the extension choose $`N_\beta\in\omega`$ such that $`b_\beta(n)\ge g_\beta(n)`$ whenever $`n\ge N_\beta`$. For each fixed natural $`N`$, the graph on $`\omega_1`$ formed by all defined $`a_{\beta,n}`$ with $`n<N`$ has at most $`N`$ lower neighbours per vertex, so has a ground proper colouring $`c_N`$ with $`N+1`$ colours. Define the final vertex colour of $`\beta`$ as the tuple
```math
(c_0(\beta),N_\beta,c_{N_\beta}(\beta)).
```
In one colour class all vertices have the same cutoff $`N`$, and any pair within it must have enumeration index $`n\ge N`$ at its larger endpoint. Any collision between two such pairs would therefore be in **both** finite truncations defining an edge of $`J`$. This contradicts the $`c_0`$ component. The class is consequently $`f`$-rainbow, proving RP in the extension.

For EGH 9/C, the reduction from $`T_3,T_4`$-freeness to a 2-bounded colouring uses two private pairs of each hyperedge. That reduction works in the extension. The theorem concerns all finite-to-one colourings, not just names of this special form. It does not claim that the weaker axiom for one uncountable rainbow of every 2-bounded colouring alone has the same preservation argument.

## Consequences and source scope

Let $`\mu`$ be regular and satisfy $`\mu^{\aleph_0}=\mu`$ in the RP ground, with $`\mu\ge\mathfrak c`$. The product random algebra on $`\mu`$ random reals has cardinal at most $`\mu^{\aleph_0}`$, since every condition depends on countably many coordinates, and is ccc. Its extension has continuum exactly $`\mu`$: it adds $`\mu`$ distinct reals and has at most $`\mu^{\aleph_0}`$ nice names for reals. Thus the negative side of 9/C holds with arbitrarily large regular continuum. There are arbitrarily large eligible regular cardinals in any ground, for example successors of a sufficiently large $`2^\theta`$. Positive models with arbitrarily large regular continuum follow independently from the [linked-package preservation](SIGMA-LINKED-PACKAGES.md).

The nearest prior preservation results found concern preservation of a **fixed negative colouring** under selected forcing, rather than survival of a universal positive rainbow-partition principle for **new colourings**. Compare [Soukup, *Indestructible colourings and rainbow Ramsey theorems*](https://www.renyi.hu/~soukup/setop/otka61600/rainbow.pdf), and [Zhang, §4](https://arxiv.org/pdf/1809.00649). The use of a product random algebra here is essential to the stated application: an arbitrary finite-support iteration of random posets need not be bounding.

## Generalized palettes and finite arities

Let $`\lambda`$ be regular infinite and $`d\ge2`$ finite. The same argument shows that the assertion
```math
 \text{every \(<\lambda\)-to-one colouring of \([\lambda^+]^d\)
 admits a partition of \(\lambda^+\) into \(\lambda\) rainbow classes}
```
is preserved by any $`\lambda^+`$-cc forcing which preserves regularity of $`\lambda`$ and is $`\lambda^\lambda`$-bounding modulo bounded sets. This conditional preservation does not assert the partition principle at any new successor.

To check the changes: each ground list now has size at most $`\lambda`$, by deciding entries through $`\lambda^+`$-cc antichains. A collision class of size $`<\lambda`$ has indices bounded below $`\lambda`$ by regularity. Enumerate each block of $`d`$-sets with a given maximum by indices below $`\lambda`$. An antichain of at most $`\lambda`$ eventual bounds can be combined by a diagonal upper bound, taking the supremum only over earlier indices. The graph of mutual truncations has degrees $`<\lambda`$, so each finite-distance shell has size $`<\lambda`$, and the two shifts still have $`<\lambda`$-sized fibres. For any fixed cutoff $`N<\lambda`$, at each vertex select one lower vertex from each $`d`$-set of index below $`N`$ having that maximum. Greedily colour the resulting graph with $`\lambda`$ colours by avoiding fewer than $`\lambda`$ earlier colours. No monochromatic class contains a $`d`$-set of low index. Finish with the same cutoff and two-shell palette, whose cardinality is $`\lambda`$.

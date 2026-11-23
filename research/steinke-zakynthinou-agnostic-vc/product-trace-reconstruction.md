# Exact reconstruction on typical product tuples

Let $`X,H`$ be standard Borel spaces, with a nonempty class $`H`$ of binary predictors, jointly Borel evaluation, and VC dimension at most $`d`$. Fix $`n`$ and a product feature law $`\lambda=\bigotimes_{i=1}^n\mu_i`$ on $`X^n`$. There are countably many universally measurable proper maps reading at most $`d`$ observed features whose catalogue realizes every feasible trace for $`\lambda`$-almost every tuple. The maps may depend on $`\lambda`$ and can be chosen universally measurably in the tuple of marginal-law codes. No cardinality bound on the realizing sets of hypotheses is required.

There is a category version. Give each coordinate copy of $`X`$ a compatible Polish topology. Countably many universally measurable proper maps reading at most $`d`$ features realize every feasible trace on a comeager subset of the product. These maps use the topologies and no probability laws. The assertions concern exact finite traces, including feasible traces that may require hypotheses from outside any fixed countable list.

## Covering the essential union of trace rectangles

Fix a bit vector $`b\in\{0,1\}^n`$. For each $`I\subseteq[n]`$ and fixed anchor tuple $`a\in X^I`$, let $`H_I(a)`$ be the hypotheses matching $`b`$ at the anchor coordinates. Write $`J=[n]\setminus I`$. For $`h\in H_I(a)`$ write

```math
B_{I,h}=\prod_{j\in J}\{x\in X:h(x)=b_j\}.
```

We construct a countable list $`g_{I,\ell}(a)`$ with this property. Its matching rectangles have union $`U_I(a)`$ on the complementary coordinates, and every $`h\in H_I(a)`$ satisfies

```math
B_{I,h}\setminus U_I(a) \text{ is null for }\bigotimes_{j\in J}\mu_j
\quad\text{or meager in the category version}.
\tag{1}
```

A default hypothesis on an infeasible anchor tuple has no matching rectangle. Identify $`U_I`$ also with the full tuples whose complementary part is in $`U_I(x_I)`$. For the full anchor set $`[n]`$ the complementary space is a point. Thus $`U_{[n]}`$ contains every feasible tuple.

**Measure.** After choosing a finite initial list, integrate the indicator of the part of $`B_{I,h}`$ left uncovered by that list. The integral is Borel in $`h`$, the finite list, and the marginal-law codes, by measurable integration. Include the anchor-matching test. Whenever the supremum over $`H_I(a)`$ is positive, choose a feasible $`h`$ gaining at least half the supremum. Concretely, test existence of a feasible $`h`$ with gain exceeding $`2^{-k}`$ for each positive integer $`k`$, use the least successful $`k`$, and choose a witness by analytic uniformization. The tests are analytic and the choices are universally measurable. With zero supremum choose any anchor-matching hypothesis if there is one. The sum of the successive gains is at most one, so the supremum of the remaining gains tends to zero. This proves (1) for each anchor and every $`h`$. The maps at finite indices are universally measurable by composition. [Analytic uniformization, Kechris, Theorem 18.1](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

**Category.** For every nonempty basic open set $`W\subseteq X^J`$, choose one $`h\in H_I(a)`$ for which $`B_{I,h}`$ is comeager in $`W`$, if one exists. Comeagerness on $`W`$ is a Borel test on the Borel rectangle family, by the Borel category quantifier. Analytic uniformization gives maps that are both universally measurable and Baire measurable in $`a`$. Also include an arbitrary matching choice where feasible. For any $`h`$, its rectangle is covered up to a meager subset by the union of basic opens where that rectangle is comeager, by the Baire property. In each such open the chosen representative's rectangle covers all but a meager set. The basis is countable, proving (1). [Borel category quantifiers and uniformization, Kechris, Theorems 16.1 and 18.1](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

The sets $`U_I`$ are universally measurable in the measure construction. In the category construction they have the Baire property, since the coordinate projection from full tuples is continuous and open, and evaluation is Borel.

## A minimal anchor set has size at most d

In either construction, suppose the feasible tuples outside $`\bigcup_{|I|\le d}U_I`$ form a set of positive measure, or a nonmeager set, respectively. On each such tuple there is an inclusion-minimal $`I`$ with the tuple in $`U_I`$, since the full set works. Then $`|I|>d`$. Some fixed $`I`$ and list index $`\ell`$ give a set $`E`$ that is still positive or nonmeager, where

```math
g_{I,\ell}(x_I)\text{ matches the full trace }b,
\qquad
x\notin U_{I\setminus\{i\}}\quad(i\in I).
\tag{2}
```

The set described by (2) has the necessary measurability or Baire property. Write $`k=|I|`$. In the measure case choose a product cell of positive probability on which the conditional probability of $`E`$ exceeds $`1-2^{-k-1}`$. Such cells are furnished by increasing finite partitions from countable Borel generators of the coordinate spaces, using martingale convergence for a Borel version of $`E`$. In the category case choose a nonempty open product cell where $`E`$ is comeager.

Take two alternatives for each coordinate in $`I`$ and a single common value for every other coordinate, all within the chosen cell. This specifies $`2^k`$ vertices. In the measure case take the entries independently from the restricted coordinate laws. Every vertex then lies in $`E`$ with probability greater than $`1-2^{-k-1}`$, so all vertices lie in $`E`$ with positive probability. In the category case all vertices belong to $`E`$ on a comeager set of alternatives, since each vertex projection is continuous and open.

For a vertex $`v`$ set $`h_v=g_{I,\ell}(x_I^v)`$. Consider the neighbor $`v^{(i)}`$ formed by replacing its entry at $`i\in I`$. The set of alternatives on which $`h_v`$ matches the trace at this neighbor while $`x^{v^{(i)}}\notin U_{I\setminus\{i\}}`$ is null or meager. To see this, fix the inputs $`x_I^v`$ to $`h_v`$. The anchor entries at $`I\setminus\{i\}`$ are then fixed. If $`h_v`$ fails any of those entries, it cannot match the neighbor. Otherwise it is an eligible hypothesis for those anchors and (1) applies to the neighbor's complementary entries. Those entries are precisely the opposite value at $`i`$ and the common values outside $`I`$. In the measure construction they have the independent restricted marginal laws, absolutely continuous with respect to the product law in (1). In the category construction their product lies in a product of open sets, and the exceptional set from (1) restricts to a meager set there. Apply Fubini or Kuratowski–Ulam, respectively. For Fubini one may take Borel versions of the finitely used maps under their input laws. For Kuratowski–Ulam the relevant joint events have the Baire property because all the input projections are continuous and open. [Kuratowski–Ulam, Kechris, Theorem 8.41](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

There are finitely many neighboring ordered pairs. Choose alternatives with all vertices in $`E`$ and outside all the exceptional events just described. By (2), each $`h_v`$ matches at its own vertex and fails at every neighbor. Since a neighbor differs at only one coordinate, $`h_v`$ fails the prescribed bit on the opposite alternative at each $`i\in I`$.

Now regard the first alternative at each coordinate in $`I`$ as a fixed set of features. For any subset of coordinates, take the vertex using the first alternatives exactly on that subset. Its hypothesis matches $`b_i`$ there and gives $`1-b_i`$ on the other first alternatives. All patterns on those features occur, and the features must be distinct because all patterns occur. This shatters $`k>d`$ features, a contradiction. Taking the finite intersection of the full-measure or comeager events over all bit vectors proves both reconstruction statements.

## Scope for iid CMI

For a fixed iid reference feature marginal, take the maps for its product laws at each $`n`$. The [approximate catalogue theorem](hidden-restriction-marks.md) then gives a proper learner with the two conjectured rates for all labeled feature marginals dominated by that reference. Use the catalogue where it has the correct optimum and a universally measurable proper ERM on its exceptional samples. The exception is null for every dominated iid law, so the fallback preserves the iid output channel almost everywhere. An earlier dominated-marginal result already gives those rates with a fixed countable class and up to $`2d`$ disagreements per trace. The present result gives exact coverage, permits arbitrary independent coordinate laws, and controls the number of features needed to resolve trace cells left out by the essential unions. [Dominated-marginal theorem](dominated-marginals.md)

The measure proof chooses the essential unions using the reference laws. In the category proof an arbitrary iid law can concentrate on the meager failure set. A catalogue for all iid laws would need another way to choose the lists or to control failures without dependence on the feature law.

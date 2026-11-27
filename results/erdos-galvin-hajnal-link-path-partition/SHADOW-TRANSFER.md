# A transfer from finite pair shadows to countable colorings

This supplement gives a second derivation of the positive consistency direction in [Cinna Davis’s proof](PROOF.md). It relates a finite extremal condition to the countable rainbow partition in Todorčević’s model. The independence claim and its attribution are recorded in the [landing page](README.md).

Let the pair shadow of a triple family consist of all two-element subsets of its triples. Assume there is a fixed real $`0\lt C<1`$ such that every finite triple subfamily $`F`$ of a system $`H`$ satisfies
```math
\lvert F\rvert\le C\lvert\partial F\rvert.
```
Then one can choose two distinct constituent pairs of each triple, using each pair at most
```math
D=\left\lceil\max\left\{2C,\frac{C}{1-C}\right\}\right\rceil
```
times. If the host has cardinality $`\aleph_1`$ and every two-bounded coloring of its pairs admits a countable partition into rainbow sets, then $`H`$ is countably colorable.

## Selecting two pairs

First fix a finite family. Form a network with arcs of capacity two from the source to each triple, capacity one from each triple to each of its three pairs, and capacity $`D`$ from each pair to the sink. For a cut let $`S`$ be its set of pair vertices on the source side. For a triple with $`r`$ constituent pairs in $`S`$, the smaller possible contribution of its own source and incidence arcs is $`\min(2,3-r)`$. Write $`a,b`$ for the counts of triples with $`r=2,3`$, respectively. The minimum capacity of any cut with this $`S`$ is thus twice the total triple count plus $`D\lvert S\rvert-a-2b`$.

The subfamily of these $`a+b`$ triples has at most $`\lvert S\rvert+a`$ pairs in its shadow. Hence $`(1-C)a+b\le C\lvert S\rvert`$, which implies
```math
a+2b\le \max\{1/(1-C),2\}\big((1-C)a+b\big)\le D\lvert S\rvert.
```
Integral max-flow therefore saturates the source arcs and selects two distinct pairs at each triple. For arbitrary $`H`$, give each triple its finite set of three choices. The prohibition on any $`D+1`$ distinct triples using a given pair is a closed condition on their choices. Every finite list of such conditions is satisfied by solving the corresponding finite instance. Compactness of the product gives the required assignment.

## Turning the choices into colors

Make a simple graph whose vertices are pairs of points of the host. For each triple put an edge between its two selected pairs. The union of those pairs recovers the triple, so different triples give different edges. Every vertex has degree at most $`D`$. Well-order the edges and color them successively with $`2D-1`$ colors. At most $`2D-2`$ previously colored edges meet a given edge, so each color class is a matching.

For each matching, color the two endpoints of each matching edge alike, using a different color for every such edge and a fresh color for every unmatched pair. This is a two-bounded pair coloring of the host. Take a countable rainbow partition for each of the finitely many matchings. Their common refinement is countable. A triple all in one part would contain a repeated pair color in the matching used by its two selected pairs. Thus the refinement properly colors the triple system. If one assumes only that every two-bounded coloring has one uncountable rainbow set, the finite list still yields one uncountable independent set. Apply the principle successively on the preceding uncountable subset, transporting each restricted coloring by a bijection with the first uncountable ordinal. The stronger countable-cover hypothesis gives the countable coloring above.

For the original three-edge tight path, Füredi, Jiang, Kostochka, Mubayi and Verstraëte give the stated hereditary inequality with $`C=2/3`$, so $`D=2`$ and three matchings suffice. The positive model comes from Todorčević. The finite shadow estimate, the forcing input and the original CH counterexample are prior results. [Finite tight-tree shadow theorem, Theorem 1.4′](https://homepages.math.uic.edu/~mubayi/papers/smalltrunk12-10-2017.pdf#page=9) · [Todorčević, §1 Remark (4)](https://doi.org/10.1090/S0002-9947-1983-0716846-0) · [Independent source review](REVIEW.md)

## Endpoint of the encoding estimate

At $`C=1`$ the ratio alone permits arbitrarily large loads. Take all triples $`xuv`$ over the pairs of an $`m`$-point base. In each subfamily the map from a triple to its base pair is injective. But every choice of two pairs per triple uses at least one of the $`m`$ pairs incident to $`x`$. Some such pair is used at least $`(m-1)/2`$ times. In fact a subfamily with $`e`$ base edges and $`u`$ used base vertices has exactly $`e+u`$ pairs in its shadow. Since $`e\le u(m-1)/2`$, the hereditary coefficient is at most $`(m-1)/(m+1)`$, with equality for the full cone. For $`m\ge3`$ the stated formula for $`D`$ gives exactly $`\lceil(m-1)/2\rceil`$. Thus both the load estimate along these coefficients and its divergence as the coefficient approaches one are sharp. The cones themselves admit a two-coloring.

The load bound is also optimal at each intermediate coefficient. If $`1/3\le C\le1/2`$, one triple requires load one. Below $`1/3`$ only the empty system qualifies. For $`1/2<C<1`$, put $`R=C/(1-C)`$ and $`D=\lceil R\rceil`$. Choose $`n>2D`$ sufficiently large that $`D-1+1/n\le R`$. On the cyclic group of order $`n`$ join each vertex to those at offsets $`\pm1,\ldots,\pm(D-1)`$, and then add one missing edge. The original graph is connected and even-regular. Each nonempty proper vertex set has at least two edges in its boundary, since its boundary has positive even size. On any such set of $`u`$ vertices the new graph thus has at most $`(D-1)u`$ induced edges. On the full vertex set its edge density is exactly $`D-1+1/n`$ edges per vertex.

Cone over the new graph. A subfamily using $`u`$ base vertices and $`e`$ base edges has shadow size $`u+e`$. The preceding bound $`e/u\le R`$ gives $`e/(u+e)\le C`$. Its full cone has more than $`(D-1)n`$ triples sharing only $`n`$ spokes. Every two-pair selection must attain load at least $`D`$. Equivalently, for every integer $`D\ge1`$, the largest hereditary coefficient guaranteeing load at most $`D`$ is $`D/(D+1)`$.

An independent mathematical review checked the cut inequality, compactness, matching partitions, finite shadow hypothesis and the endpoint example. The [finite selection checker](verify_shadow.py) audits the finite assignment separately from the countable-partition conclusion.

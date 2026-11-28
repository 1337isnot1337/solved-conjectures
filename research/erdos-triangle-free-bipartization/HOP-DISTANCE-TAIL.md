# Long crossing distances at a maximum cut

In a product-weighted graph with vertex mass one, fix any maximum cut. Let $B$ be the crossing graph and let $D$ be its monochromatic demand edges. Then the total demand with crossing-graph distance greater than $2R$ is at most $2\mathrm e/R^2$, for every positive integer $R$. Here $\mathrm e$ is the base of the natural logarithm. The quadratic order is best possible, even for triangle-free graphs with densities in the unresolved band of [Erdős #23](https://www.erdosproblems.com/23).

There is a partition into cells with induced crossing-graph radius at most $R$ that simultaneously cuts supply and demand masses of at most $2\mathrm e/R^2$. Thus all but $O(1/R^2)$ of the defect mass can reach its paired endpoint within $2R$ hops, inside its cell. This does not bound the congestion of those short paths.

## Radius partition and transfer to maximum-cut demands

Use the [layer inequality of Komlós](https://mathweb.ucsd.edu/~jverstra/cycle%20packing.pdf), Lemma 2.8 there. For nonnegative layer masses $a_0,\ldots,a_R$, it gives $i<R$ with
$
a_i a_{i+1}\le (2\mathrm e/R^2)(a_0+\cdots+a_i)(a_0+\cdots+a_R).
$
The statement with a zero factor also holds in its non-strict form. If the current supply component fits in a radius-$`R`$ ball, take it whole. Otherwise run breadth-first search from any root out to depth $R$ in the remaining graph and apply the inequality. The cut around the radius-$`i`$ ball has edge mass at most $a_i a_{i+1}$. The final factor in the display is no greater than one. Charge the removed supply mass to the vertex mass of the ball, and repeat on the surviving graph. The resulting balls have total vertex mass one, and each has a breadth-first spanning tree of radius at most $R$ within its induced supply graph. The total charged crossing supply mass is at most $2\mathrm e/R^2$.

The maximum-cut condition compares supply and demand across every cut. It also compares their masses between the cells of any partition, by giving cells independent fair signs and averaging that cut condition. Hence the partition removes at most the same total demand. Every pair left in a cell has a supply path inside the cell of at most $2R$ edges. This is a maximum-cut consequence of the layer lemma, not a novelty claim for the classical odd-girth deletion order established by Komlós.

## Sharpness and relation to simultaneous routing

An odd cycle of length $2R+3$ with uniform weights has one defect at any maximum cut, of mass $1/(2R+3)^2$. Its endpoints are at crossing distance $2R+2$. To realize the same order at a density in any fixed open subwindow of $(0.2486,0.3197)$, give the cycle a fixed sufficiently small positive total mass, and put the rest on two adjacent host vertices. Join the cycle to the host by one bridge. Host weights can be chosen to put the total density in the desired window; the cycle and bridge perturb that density by arbitrarily small amounts. In any maximum cut the bridge crosses and both original parts are optimal. It cannot shorten the alternate path on the cycle. A small rational perturbation makes the defective cycle edge unique if desired. Blowing up rational weights keeps both the mass and the distance lower bound in the unweighted model.

For comparison, the [sharp trimmed congestion theorem](TRIMMED-MULTIFLOW.md) can always give actual routes with $O(\log(1/\epsilon))$ congestion and $O(\log(1/\epsilon)/\epsilon)$ hops after an $\epsilon$ trim. To get the hop guarantee, in its dual distance calculation start with arbitrary lengths $\ell$ and add a uniform surcharge $\lambda$ to every edge. A shortest path of surcharged length less than one uses at most $1/\lambda$ edges. Thus the original length metric restricted to paths of at most $\lceil1/\lambda\rceil$ hops, truncated at one, is bounded above by the unrestricted surcharged distance truncated at one. Apply the trimmed congestion theorem's dual inequality with budget $\epsilon/2$. Its extra supply term is $K\lambda\sum_B c_e\le K\lambda/2$; taking $\lambda=\epsilon/K$ costs at most the remaining $\epsilon/2$. The truncated path LP therefore has a routing with the stated hop bound.

The quadratic distance tail alone does not produce equally short paths at logarithmic congestion. That simultaneous question is distinct from both the distance bound and the congestion bound.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

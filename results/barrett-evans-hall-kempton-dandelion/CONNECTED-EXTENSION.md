# The dandelion minimum for all connected complementary pairs

**Theorem.** Let $`G`$ be a finite simple graph on $`n\ge4`$ vertices such that $`G`$ and its complement are connected. The minimum of $`\lambda_2(G)+\lambda_2(G^c)`$ equals $`D_n=n+r_- -r_+`$, where $`r_-,r_+`$ are the smallest and largest roots of the cubic $`t^3-(n+2)t^2+(3n-2)t-n`$. The minimizers are exactly the generalized dandelions and their complements. In a generalized dandelion the hub misses only the stem tip, the stem has length two, and arbitrary edges are allowed among the ordinary leaves. The [original proof](PROOF.md) gives their spectrum and verifies both diameters equal three.

The [small-order enumeration](SMALL-REMAINDER.md) covers orders four through ten throughout the connected class. From order 21 to 64 the [finite interval proof](FINITE-INTERVAL.md) reduces every competing pair to the case where both graphs have a leaf. From order 65 on the [uniform proof](INTERVAL-LEAF-THRESHOLD.md) does the same. The [missing-leaf comparison](MISSING-LEAF.md) identifies exactly the stated equality family there. The published [diameter-three theorem](PROOF.md) handles the remaining orders when both diameters equal three. We show below that no other pair at orders 11 through 20 attains the dandelion value or less. Together these arguments prove the theorem at every order. [Independent review](CONNECTED-REVIEW.md)

## Two extrema in each color

Write $`x\le y`$ for the two connectivities, with red graph belonging to $`x`$ and blue graph belonging to $`y`$. Assume $`x+y\le D_n`$. The dandelion cubic’s outer roots put $`D_n<2`$ for $`n\ge4`$, so $`x<1`$ and $`y<2`$. Normalize a Fiedler vector by positive affine rescaling to have minimum zero and maximum one. Its row equation at $`i`$ is

```math
\sum_{j\sim i}(f_i-f_j)=\lambda(f_i-\bar f).
```

Add the row at a maximum to the negated row at a minimum. All edge drops on the left are nonnegative and the right side is $`\lambda`$. An edge between those two extrema spends exactly two units and each common neighbor spends exactly one. Hence

```math
2\,\mathbf{1}_{\mathrm{adjacent}}+\#\{\mathrm{common\ neighbors}\}\le\lambda.
```

For the red extrema $`a,b`$ there is no edge and no common red neighbor. Every other vertex therefore has at least one blue edge to $`a,b`$, which themselves form a blue edge. The blue diameter is at most three. For the blue extrema $`c,d`$ there is no blue edge and there is at most one common blue neighbor. If the blue diameter is three, the red diameter must be three as well: any pair at blue distance three gives a red dominating edge by the same argument, and $`a,b`$ have red distance at least three. Such graphs are already covered by the original theorem.

It remains to examine blue diameter at most two. The distinct blue extrema are then at distance exactly two and have **exactly one** common blue neighbor $`w`$. In particular $`y\ge1`$ and $`x\le D_n-1`$. The edge $`cd`$ is red and every vertex other than $`w`$ is red-adjacent to at least one end of it. The two red extrema cannot both coincide with the blue extrema, because one pair is a red nonedge and the other a red edge.

The following five forms cover all possibilities, allowing duplicate representations. Negating each Fiedler vector permits either extremum of its pair to be designated as maximum independently.

- If the pairs overlap, rename the shared vertex $`a=c`$. Vertex $`d`$ is red-adjacent to $`a`$ and must miss $`b`$ in red, since $`a,b`$ have no common red neighbor. Thus $`w=b`$. In anchor order $`a,b,d`$ the only internal red edge is $`ad`$. Every exterior vertex meets at least one of $`a,d`$ in red and at most one of $`a,b`$. Its allowable bit masks are $`1,4,5,6`$.
- If the pairs are disjoint and $`w`$ is one of the red extrema, rename it $`a`$. It misses both $`c,d`$ in red. Vertex $`b`$ sees $`c`$ alone after interchange, or sees both $`c,d`$. These are two forms. In anchor order $`a,c,d,b`$ every exterior vertex meets one or both middle vertices and at most one endpoint in red, giving the nine usual masks.
- If $`w`$ lies outside both pairs, each red extremum sees at least one of $`c,d`$ and their red neighborhoods are disjoint. Thus the four anchors form a red path $`a,c,d,b`$. The exceptional fifth vertex misses both interiors and sees either neither endpoint or just $`a`$ after path reversal. These are the final two forms. Other exterior vertices use the nine usual masks.

The reduction works on any tied extrema by taking one maximum and one minimum. Connectivity is imposed on final graph pairs. Every selected blue graph automatically has a dominating edge $`ab`$, while some partially specified red graphs can have isolated vertices.

## Exact search over the five forms

For each form the program assigns exterior attachment types in nondecreasing order, taking the exceptional fifth vertex first when present. All assignments are represented up to permuting exterior sites. Remaining edges between exterior sites may be red or blue. A partial coloring with a disconnected maximal possible red graph admits no connected red completion. A color incident to every other vertex rules out connectivity of the opposite color. An assigned degree $`n-2`$ forces a leaf in every connected completion of the opposite color. Thus forced leaves on both sides invoke the all-orders missing-leaf comparison. If a red edge already dominates every site through known red adjacencies, it forces blue distance at least three and belongs to the original theorem’s domain for every surviving completion.

For every assigned red edge, its endpoints must acquire a common blue neighbor because the target blue diameter is two. A sole possible common neighbor forces both edges blue. For a small set of further possible witnesses it suffices to branch on one representative per present symmetry class: a transposition of interchangeable exterior vertices fixes all anchors, the red edge’s endpoints, and both partially assigned graphs. Fixing either endpoint follows since it cannot be its own common neighbor. Selecting one witness may represent the same completion in multiple branches, which is harmless. Otherwise the graph search fills a group of interchangeable free edges incident to a pivot by branching on the number colored red. Every completion is represented. After a forced step the set of assigned blue edges strictly grows whenever a witness branch is taken.

A spectral certificate for the assigned graph pair gives the same strict lower bound for all completions by Laplacian monotonicity. The [diameter-two gap](DIAMETER-TWO-GAP.md) gives a lower bound $`b_n=1+\lfloor256/(n-1)\rfloor/256`$ for blue, so it suffices if the partial red connectivity is above $`D_n-b_n`$. Closure at a partial type assignment covers every nondecreasing type extension of it. The number of such extensions is the elementary multiset coefficient.

## Feasibility checks on real eigenvector coordinates

The computational checks use integer endpoints for intervals that contain **real** eigenvector coordinates. Lower divisions round down and upper divisions round up. Rescale the extrema to $`M=4096`$ and zero. Boundaries for eigenvalues use denominator 256. The dandelion cubic gives a strict dyadic upper bound $`T`$ on the sum. Each test covers an interval $`x\in[l,u]`$ inside $`[0,T-b_n]`$ and uses $`b_n\le y\le T-l`$. The union of the closed tested intervals covers every candidate.

Let $`A`$ be the known neighbors of the maximum excluding the known neighbors of the minimum, and $`B`$ be the analogous set for the minimum. Write $`k`$ for their number of **known** common neighbors. Positivity of the endpoint drops gives

```math
\sum_{i\in A}(M-f_i)+\sum_{i\in B}f_i\le(\lambda_U-k)M.
```

This holds even in an incompletely typed state. Each side of the total budget is charged only for already assigned edges. If the individual intervals are $`[L_i,U_i]`$, reserving all mandatory lower spending in that inequality yields an upper bound on the budget left. This tightens individual intervals. It also tightens a sum over any chosen subset: for each high-type site in it start at $`U_i`$ and allow total decreases at most the unspent budget, and for each low-type site start at $`L_i`$ and allow total increases at most that same budget. Other coordinate ranges may be taken independently for a conservative bound. Applying it to the full vertex set bounds the mean.

At site $`i`$ let $`d`$ be its number of **known** own-color neighbors. Each unassigned edge contributes either zero or a drop $`f_i-f_j`$ to its eventual Laplacian row. Bound that term below by $`\min(0,L_i-U_j)`$ and above by $`\max(0,U_i-L_j)`$. For $`d>0`$ the row gives an interval for $`d f_i`$ from the sum of the known neighbor coordinates and the residual $`\lambda(f_i-\bar f)`$ minus the possible unassigned drops. Tighten $`L_i`$ by the **floor** of the lower quotient and $`U_i`$ by the **ceiling** of the upper quotient. To bound a single known neighbor subtract independent upper or lower sums for the others; subtraction of its own bound from a correlated sum bound would be unjustified. All updates are necessary conditions, so any fixed number of sweeps is valid.

For each chart, an upper bound on the squared centered norm follows from the sum of the largest squared distance of each interval endpoint from any fixed scalar. By the mean-zero row and Cauchy–Schwarz, a vertex of actual degree $`d`$ and centered coordinate $`z`$ requires

```math
z^2\left(1+\frac{(d-\lambda)^2}{d}
 +\frac{(1+d-\lambda)^2}{n-1-d}\right)\le\lVert f-\bar f\rVert^2.
```

Connectedness of both graphs gives $`1\le d\le n-2`$. For $`d>\lambda_U`$ the factor increases with $`d`$ and decreases as $`\lambda`$ increases up to $`\lambda_U`$. We may therefore test with a lower bound for $`|z|`$, an upper bound for the norm, and $`\lambda_U`$. Cases with $`d\le\lambda_U`$ impose no extra condition in the checker. If the known degrees and these tests admit no red degree $`d`$ and blue degree $`n-1-d`$ simultaneously, the interval is impossible.

For the energy test each forced edge contributes at least the square of the distance between its two coordinate intervals. On an unassigned pair, the smaller of the two colors’ bounds is a valid lower bound for the sum of the two unnormalized energies. The eigenvalue is the energy divided by the centered squared norm. Comparing a color’s lower energy to its upper eigenvalue bound times its upper squared norm, or the sum of the lower energies to the upper sum times the larger squared norm bound, gives a rigorous rejection.

The [superlevel checker](connected_superlevels.hpp) also sums the eigenvector rows over the actual set of coordinates strictly above a trial level. Crossing drops are nonnegative. For a potentially high vertex, each assigned neighbor with upper endpoint below or equal to the level contributes at least the vertex coordinate minus that upper endpoint. When both covering anchors $`c,d`$ in forms 1 and 2 lie below the level, an obligatory edge to at least one of them may be charged once even before its color is fixed. Subtract the eigenvalue times the coordinate minus the lower mean bound. Minimizing over the admissible eigenvalue interval gives a concave piecewise linear function of the coordinate. Its minimum on the permitted coordinate interval is reached at an endpoint. Include zero in the minimum for sites whose membership is optional. A positive sum of these lower residual bounds contradicts the row sum. Testing the reversed chart gives the corresponding sublevel inequalities.

An early sorted attachment prefix also fixes every anchor edge whose bit is identical in all admissible remaining types. The checker uses these compulsory bits before discarding a prefix. The [reproduction driver](verify_connected_dandelion.py) checks every order and template, including its expected number of multiplicity vectors. The 50 successful order/template pairs cover 6,692,599 multiplicity vectors and 415,482 search nodes. The independently checked superlevel argument below also excludes one of the five forms analytically.

## A superlevel cut eliminates the doubly adjacent exceptional form

In form 2 the exceptional vertex is red maximum $`a`$, and red minimum $`b`$ sees both $`c,d`$ in red. Write $`f_a=1`$, $`f_b=0`$ and $`m`$ for the mean of the red chart. Put $`t=\max(f_c,f_d)`$. The row at $`b`$ yields $`t\le xm`$ since all chart coordinates are nonnegative. Every vertex outside $`a,c,d`$ has a red edge to $`c`$ or $`d`$. In the superlevel set $`H=\{v:f_v>t\}`$ each member except $`a`$ therefore sends an edge to the complement of $`H`$. These distinct edges give

```math
x\sum_{H}(f_i-m)\ge \sum_H(f_i-t)-(1-t).
```

Let $`k\ge1`$ be the red degree of $`a`$. Its row says that the $`k`$ neighbors have sum $`k-x(1-m)`$ and individually have $`f_i\ge1-x(1-m)>xm\ge t`$. Thus all lie in $`H`$. Move the left side of the cut inequality to the right: every retained summand $`(1-x)f_i+xm-t`$ is nonnegative. Keeping $`a`$ and all its neighbors gives

```math
(k+1)(1-x+xm-t)\le1-t+x(1-x)(1-m).
```

Since $`k\ge1`$, the left side is at least twice the positive factor. Using $`t\le xm`$ then gives $`x(2-x)m\le3x-1-x^2`$. The sum of the nonnegative coordinates is also at least the sum on $`a`$ and its neighbors, so $`(n-x)m\ge2-x`$. Eliminating $`m`$ yields the necessary inequality

```math
(n-1)(3x-x^2)-n\ge0.
```

The left side increases on $`0\le x\le1`$. The [rational checker](check_form_two_cut.py) bisects the two outer cubic roots twenty times each and proves that the left side is strictly negative at the resulting upper bound for $`D_n-1`$ for each order from 11 through 20. Thus form 2 is impossible at every outstanding order, for all feasible configurations without a minimizer assumption.

## Source, scope and prior results

Barrett, Evans, Hall and Kempton conjectured the dandelion minimum for the pair of diameter-three graphs. Their paper provides its spectrum and observes the invariance under adding edges among its ordinary leaves. This all-connected comparison extends their domain. Equivalently it determines the largest combinatorial Laplacian spread among graphs with connected complement that are themselves connected, since the sum of connectivities equals $`n`$ minus that spread. [Conjecture 2 and Lemma 4.2](https://arxiv.org/pdf/2201.04225#page=15) · [Journal article](https://doi.org/10.1016/j.laa.2022.04.021)

The bounded search covered the authors, the dandelion, algebraic connectivity of a graph and its complement, the extremal Laplacian spread of connected and co-connected graphs, both repository branches, the original [discovery and publication](https://github.com/1337isnot1337/solved-conjectures/pull/981) and the [connected follow-up](https://github.com/1337isnot1337/solved-conjectures/issues/982). Einollahzadeh and Karkhaneei's universal lower bound of one and Li and Ji's later proof have a different constant and equality classes. Kempton, Zaitzeff and Muthuprakash study upper bounds. The tree and fixed-family problems do not cover the connected complementary class. Afshari's graph-square comparison gives a lower bound of one at diameter two. The bounded search located no prior exact minimum and classification for the larger class. [Einollahzadeh and Karkhaneei](https://arxiv.org/abs/1901.02047) · [Li and Ji](https://arxiv.org/abs/2607.03711) · [Kempton, Zaitzeff and Muthuprakash](https://arxiv.org/abs/2606.12751) · [Afshari](https://arxiv.org/abs/2109.04568)

Cinna Davis and GPT-6.2 Astra supplied the earlier structural and large-order work and the double-leaf comparison. The WadeDavis research session with Codex developed the finite exceptional-anchor reduction, diameter-two gap and completed exhaustive certificate. The [independent internal review](CONNECTED-REVIEW.md) records analytic and arithmetic checks. The proof is computer-assisted and has no Lean formalization.

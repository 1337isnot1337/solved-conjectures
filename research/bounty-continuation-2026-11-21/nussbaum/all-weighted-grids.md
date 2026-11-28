# The period bound for all weighted rectangular grids

**Theorem.** In the Boolean cube of dimension $`n`$, suppose each cell of an $`a`$-by-$`b`$ rectangle contains $`m`$ distinct faces, with all $`abm`$ faces pairwise incomparable by inclusion. Two distinct faces intersect exactly when their cells share a row or a column. Then $`abm\le 2^n`$, for all positive $`a,b,m`$. In particular Nussbaum's ternary period bound holds for every orbit having this compatibility graph.

The proof uses a pair of rows to encode the choices within cells. An entropy estimate handles every shorter side of size at least 23. An [exact arithmetic certificate](check_all_weighted_grids.py) proves a scalar inequality on a continuum and excludes all remaining parameters. The theorem bounds the ambient cube size. The [earlier local bound](weighted-grid-entropy.md) gives a bound on the union itself under additional hypotheses.

If either side has size one, all faces have a common vertex. Their free masks form an antichain, so their number is at most the central binomial coefficient. Henceforth $`2\le a\le b`$. Set $`L=\log_2 b`$, $`l=\log_2 a`$, $`M=\log_2 m`$ and $`C(s)=\binom{s}{\lfloor s/2\rfloor}`$. Write $`\delta(q)`$ for the least nonnegative integer $`s`$ with $`C(s)\ge q`$. Write $`r_i,c_j`$ for chosen row and column anchors, Boolean vertices contained in all faces of their respective lines. Their existence follows from coordinatewise consistency of pairwise intersecting faces.

## Two rows encode a column and two masks

Take any two distinct rows, and let $`T`$ be the set of $`D`$ positions on which their anchors differ. Flip coordinate orientations so that on $`T`$ the first row anchor is zero and the second is one. Off $`T`$ the two row anchors agree. In a given column, project one face of each row onto $`T`$ and intersect the projections. This subcube contains the projected column anchor. **Every word of every such subcube in one column is incomparable to every word in every such subcube in another column.** Indeed, the first-row face from one column and the second-row face from the other must fix opposite bits at some coordinate. Off $`T`$ both permit the shared row bit. On $`T`$ the first-row face can only fix zero and the second-row face can only fix one. Exchanging the two columns supplies the reverse strict difference. In particular $`\delta(b)\le D`$.

Let $`J`$ be the set of ones of a projected column anchor and let $`k=|J|`$. The first-row face is necessarily free on $`J`$ and may also be free on a subset of the other $`D-k`$ positions. The second-row face is necessarily free on the complement of $`J`$ and may also be free on a subset of $`J`$. Call the latter, optional sets the *two masks*. After one projected mask is fixed for one row, its possible original faces have distinct exterior free sets forming an antichain on $`n-D`$ positions. All have the same restricted face and contain the same row anchor. Each projected mask occurs at most $`C(n-D)`$ times.

For each column there are therefore at least $`p=\lceil m/C(n-D)\rceil`$ masks in each row. For any two masks in that column, flip the corresponding bits of its projected anchor. The result lies in the intersection of the two projections. With the column given, its flipped positions separately recover both masks. Different columns have disjoint sets of such words. Counting the words gives
```math
bm^2 \le 2^D C(n-D)^2 \le 2^{2n-D}. \tag{1}
```
In particular a counterexample $`abm>2^n`$ requires $`D<L+2l`$ for **every** row pair.

For a width $`s`$ define $`t(s,p)`$ as the least $`t`$ such that $`\sum_{e=0}^t\binom{s}{e}\ge p`$. If none exists, that width cannot occur. Among $`p`$ masks on $`s`$ positions, one has size at least $`t(s,p)`$. In the given column, take $`x=t(k,p)`$ and $`y=t(D-k,p)`$. Choose a second-row face freeing at least $`x`$ optional one positions and a first-row face freeing at least $`y`$ optional zero positions. Their projected intersection contains a subcube freeing exactly these selected $`x+y`$ positions around the anchor. A uniformly random maximal chain of the Boolean $`D`$-cube hits this smaller subcube with probability
```math
1\big/\binom{D-x-y}{k-x}.
```
In the permutation of the positions defining the chain, all $`k-x`$ fixed ones must precede all $`D-k-y`$ fixed zeros. This formula also covers zero fixed ones or zeros. A chain hits subcubes from at most one column by the incomparability proved above. Consequently, for this row pair there must exist at least one $`0\le k\le D`$ for which both mask thresholds exist and
```math
\binom{D-x-y}{k-x}\ge b. \tag{2}
```
Otherwise the sum of the $`b`$ hit probabilities exceeds one. Complementation permits testing just $`k\le D/2`$. Both (1) and (2) also apply to two columns with $`a`$ labels.

## A quantitative entropy estimate

Use the mean row-column Hamming distance $`d`$ and the per-coordinate quantities $`u,v,w,S,B`$ of the [weighted-grid entropy proof](weighted-grid-entropy.md). Here $`u,v`$ are respectively the row and column one-frequencies, $`w=u(1-v)+(1-u)v`$ and $`\sum w=d`$. In any counterexample, its matching and entropy inequalities give
```math
(1-1/a)L\le d\lt L,\qquad \sum S\lt L/a,\qquad n-M-d\ge\sum B. \tag{3}
```
Its puncturing inequality also gives $`(1-1/a)L\le(1-1/D_{\max})d`$, where $`D_{\max}`$ is the greatest distance between two row anchors. In particular $`D_{\max}>a`$ is necessary in a counterexample.

We strengthen its scalar estimate to
```math
B+4S\ge 3w/5. \tag{4}
```
When $`u`$ lies outside $`[1/8,7/8]`$, the earlier entropy bound $`2u(1-u)h(v)\le 2\sqrt{u(1-u)}w`$ gives $`4S\ge4(1-\sqrt7/4)w\ge3w/5`$. For the other values of $`u`$, minimize the two free-mask entropy terms separately using $`\min_{0\le e\le1}(1-h(e)+ce)=1-\log_2(1+2^{-c})`$. This follows by differentiating or by the binary entropy variational formula. Use $`1-\log_2(1+z)\ge (1-z)/(2\ln 2)\ge(5/7)(1-z)`$ for $`0\le z\le1`$, from the tangent at one. The bound $`\ln2<7/10`$ follows by summing the first four terms of the exponential series for $`\exp(7/10)`$. Thus (4) follows if
```math
\frac{17}5 w+
\frac57\big[(1-u)(1-v)(1-(1-v)^{8u})+uv(1-v^{8(1-u)})\big]
\ \ge\ 16u(1-u)\sqrt{v(1-v)}. \tag{5}
```
Here we used $`h(v)\le2\sqrt{v(1-v)}`$ as in the earlier proof. Endpoint terms are interpreted by continuity where needed.

The certificate checks (5) on the closed rectangle $`[1/8,7/8]\times[0,1]`$ using rational operations only. On a box $`[u_0,u_1]\times[v_0,v_1]`$, bound $`w`$ below by its smallest corner value. Bound the first bracket term below by $`(1-u_1)(1-v_1)(1-(1-v_0)^{\lfloor8u_0\rfloor})`$ and the second by $`u_0v_0(1-v_1^{\lfloor8(1-u_1)\rfloor})`$. These follow by monotonicity of real powers on $`[0,1]`$. For each factor $`s(1-s)`$ on the right use its value at the point of its interval nearest $`1/2`$. Both bounds are nonnegative, so their squares can be compared exactly. Bisecting the longer side when needed certifies all 480 terminal rectangles, at maximum depth 13. No sampled values or rounded transcendental functions enter the check.

By (3) and (4),
```math
n-M\ge (8/5)d-4\sum S \ge (8/5-28/(5a))L.
```
Consequently a counterexample with $`3a>28`$ must satisfy
```math
b^{3a-28}\lt a^{5a}. \tag{6}
```
If $`a\ge23`$ and $`L\ge3l`$, this is impossible, since $`(3a-28)/(5a)\ge1/3`$. If $`L<3l`$, (1) gives $`D_{\max}<5l\le a`$, again impossible. To see the last inequality, $`23^5<2^{23}`$ and $`(1+1/a)^5<2`$ for every integer $`a\ge23`$, so it persists by induction. This proves the theorem for every $`a\ge23`$.

## Exhausting the shorter sides from 2 through 22

The following bounds specify the entire finite certificate. They use Sperner's bound on the number of incomparable subsets and the preceding inequalities.

* The $`bm`$ faces in one row give $`bm\le C(n)`$. Thus a counterexample needs $`aC(n)>2^n`$. The ratio $`C(n)/2^n`$ is nonincreasing and tends to zero, as shown in the earlier proof. The dimension loop stops at its first failure.
* Every face in cell $`ij`$ contains the interval between $`r_i`$ and $`c_j`$. Its optional free mask belongs to an antichain on $`n-d_H(r_i,c_j)`$ positions. Thus $`d_H(r_i,c_j)\le R=n-\delta(m)`$. Both row-pair and column-pair distances are at most $`P=\min(n,2R)`$ by the triangle inequality. Two distinct rows rule out $`R<1`$. By (3) and puncturing, $`b^{(a-1)P}\le2^{aR(P-1)}`$.
* Among $`g`$ Boolean anchors, some pair has distance at most $`A(n,g)=\lfloor n\lfloor g^2/4\rfloor/\binom g2\rfloor`$. At one bit there are at most $`\lfloor g^2/4\rfloor`$ differing unordered pairs. Hence $`b\le C(A(n,a))`$. For $`(g,q)=(a,b)`$ and $`(b,a)`$ at least one integer $`D`$ in $`[\delta(q),\min(P,A(n,g))]`$ must pass (1) and (2) with $`q`$ labels. Also, some row pair must pass them with $`a<D\le P`$, by (3).

For each admitted $`a,n`$, the verifier covers the complete integer interval $`a\le b\le C(A(n,a))`$. On any subinterval $`[s,t]`$ it uses $`b\ge s`$ and $`m\ge\lfloor2^n/(at)\rfloor+1`$. Substitution of these lower bounds weakens every exclusion test. Specifically $`\delta`$ and $`t(\cdot,p)`$ are nondecreasing in the required count, and deleting an additional fixed zero or one can only decrease the binomial coefficient in (2). Lowering $`m`$ enlarges the admissible radius. Lowering $`b`$ also increases the upper bound $`A(n,b)`$ because $`\lfloor g^2/4\rfloor/\binom g2`$ is nonincreasing for $`g\ge2`$. The powered puncturing inequality is monotone in the relaxed radius and diameter by its equivalent logarithmic form $`(1-1/a)L\le(1-1/P)R`$.

If the relaxed conditions are incompatible, the verifier eliminates the whole subinterval. Otherwise it divides it into two disjoint consecutive subintervals. It raises an error for any surviving singleton. It checked 30,339 nonempty parameter intervals and terminated without a survivor for all 21 shorter sides. Together with the large-side argument this proves the theorem.

## Connected orbits with at most two maximal cliques per state

There is also a criterion that can be read directly from the compatibility graph. If it is connected and each state belongs to at most two maximal cliques, its period is at most $`2^n`$. This includes faces with arbitrarily many free coordinates.

Cyclic transitivity makes the number of maximal cliques through a state constant. If there is only one per state, connectedness makes the entire graph a clique and Sperner's bound applies. Otherwise each state determines an unordered pair of distinct maximal cliques. Merge all states giving the same pair. Each resulting class has the same size $`m`$, because the action is transitive. Different classes meet in the compatibility graph exactly when their pairs share a clique.

Form the graph with maximal cliques as vertices and the distinct pairs as edges. It is simple, connected and triangle-free. A triangle would give three pairwise compatible representatives whose common maximal clique would have to be in all three pairs, which have empty intersection. Cyclic translation acts transitively on edges. As in the [connected-component classification](local-grid-and-one-star-orbit.md), such a graph is a cycle or a complete bipartite graph (including a single edge). Briefly, with one vertex orbit the faithful abelian action is free on vertices, so the edge count is at most the vertex count. Regularity then gives a cycle or a single edge. With two vertex orbits, a vertex stabilizer fixes every vertex in its orbit and acts transitively on its neighbors. Vertices on the same side sharing a neighbor therefore have identical neighborhoods, which by connectedness gives a complete bipartite graph.

The complete bipartite case gives the weighted grid of this theorem. In the cycle case the generator acts transitively on its edges and therefore induces a rotation of full order: a reflection has order at most two, whereas the triangle-free cycle has length at least four. Its kernel on the cycle is consequently the stabilizer of **each** maximal clique. The [least-stabilizer theorem](prime-power-periods.md) gives the bound in this case as well. This argument does not require an orbit state with exactly one free coordinate.

## Consequence for the bounty problem

The [two-stabilizer classification](two-generating-stabilizers.md) now gives $`p\le2^n`$ for **every** period whose maximal compatibility cliques have exactly two inclusion-minimal stabilizers generating the cyclic group. In particular, if the common stabilizer has index $`qr`$ for distinct primes, all multiplicities and both prime sizes are covered. A least stabilizer is already covered by the [separate local theorem](prime-power-periods.md).

The sponsor asks for every ternary Boolean-formula orbit. Orbits can have three or more incomparable minimal clique stabilizers. The grid theorem and its computation give no conclusion for all such graphs. [Sponsor's statement](https://sites.math.rutgers.edu/~zeilberg/math640_10.html)

# A weighted repair certificate for perturbed pentagon cuts

This is a sufficient condition for [Erdős #23](https://www.erdosproblems.com/23) in arbitrary order, not a bound for every triangle-free graph. It permits edges inconsistent with the cyclic labeling, even on induced non-3-colorable subgraphs. A strict form gives a uniform gap below the conjectured value in the unresolved density band.

## The global certificate

Let G be a finite graph with nonnegative vertex weights summing to one. Measure an undirected edge uv by the product of the endpoint weights. Label every vertex by an element of Z/5 and let s_i>0 be the total mass in class i. Let P_i=s_i s_(i+1) be the full mass of the i-th cyclic pair. Call an edge valid if its labels are consecutive; all other edges are invalid.

For each i, alternately color the five labels along the path obtained by deleting the i-th edge of the label cycle. Let M_i be the missing valid edge mass at that cyclic pair, and L_i the invalid edge mass monochromatic under that cut. The cut costs exactly P_i-M_i+L_i. Consequently
$
\beta(G)\le \Big(\prod_i(P_i-M_i+L_i)\Big)^{1/5}
\le \Big(\prod_i P_i\Big)^{1/5}
      \exp\Big(\tfrac15\sum_i(L_i-M_i)/P_i\Big).
\tag{1}
$
If a factor vanishes, the first inequality already gives a zero cut. Otherwise use log(1+x)≤x for the second inequality. Finally the prefactor is at most 1/25 by AM–GM on the five class masses, since each occurs twice. Thus normalized invalid losses totaling no more than normalized valid missing mass prove the conjectured bound. The argument does not assume the classes are balanced or independent.

## A local triangle-free certificate for (1)

Choose a clean subset C_j of positive mass c_j in each label j, meaning that no invalid edge is incident to that subset. The clean subsets need not induce complete cyclic pairs. For a vertex x outside the clean subsets and an adjacent label j to its label h(x), let m_(x,j) be the mass in C_j not adjacent to x. Those distinct pairs account for at least the following amount of normalized missing mass:
$
\sum_i M_i/P_i\ \ge\
\sum_{x\notin C,\ j\sim h(x)} w_x m_{x,j}/P_{h(x)j}.
\tag{2}
$
Here P_ab means the product of the two corresponding label masses, and C is the union of the clean subsets. Each pair counted on the right has exactly one clean endpoint, so there is no double count.

For any invalid edge e=xy, let r_e be the sum of 1/P_i over the alternating label cuts in which it is monochromatic. This includes all five cuts if the labels coincide, and three cuts if they are distinct and not adjacent. There is at least one label j adjacent to both endpoint labels. Because G is triangle-free, the neighborhoods of x and y in C_j are disjoint, and so m_(x,j)+m_(y,j)≥c_j. Assign e fractionally to its common adjacent labels, with fractions a_(e,j)≥0 summing to one for that edge. It follows that
$
\sum_iL_i/P_i
\le \sum_{x\notin C,\ j\sim h(x)}
 \frac{w_x m_{x,j}}{c_j}
   \sum_{y:xy\ {\rm invalid}} a_{xy,j} w_y r_{xy}.
\tag{3}
$
Indeed each invalid edge contributes w_x w_y r_e to the left, and each assigned fraction is covered by the two deficits on its endpoints. An explicit LP certificate consists of fractions satisfying, for each relevant (x,j),
$
\sum_{y:xy\ {\rm invalid}} a_{xy,j} w_y r_{xy}
 \le (1-\epsilon)c_j/P_{h(x)j},
\qquad 0\le\epsilon\le1.
\tag{4}
$
The right side and the summands depend only on the label masses, adjacency, weights and selected clean subsets. Combining (1)–(4) proves the exact target at epsilon=0 and gives a quantitative refinement at epsilon>0. One crude sufficient test is that every vertex's invalid weighted degree is at most (1−epsilon) (min c_j)(min P_i)/(5 max P_i); then any legal assignment works. The fractional test can be substantially weaker.

## Uniform margin in the middle-density band

Write p=2e(G) in vertex-product units, and suppose p≤0.32 and (4) holds with epsilon>0. If sum P_i≥0.18, then total missing valid mass is at least 0.18−p/2≥0.02. Since P_i≤1/4, sum M_i/P_i≥0.08. Formula (1) yields beta≤(1/25) exp(−2 epsilon/125).

Otherwise put δ_i=s_i−1/5. Then sum P_i=1/5+sum δ_iδ_(i+1), and sum δ_i²≥0.02 by 2|ab|≤a²+b². On (0,1] the second derivative of log is at most −1, so
$
\log s_i \le \log(1/5)+5\delta_i-\tfrac12\delta_i^2.
$
Summing and using sum δ_i=0 gives (product P_i)^(1/5)≤ (1/25) exp(−1/250). Thus in either case
$
\beta(G)\le (1/25) \exp\big(-\min\{1/250,\,2\epsilon/125\}\big).
\tag{5}
$

## Complete pentagon cores, without a balanced labeling

Suppose an induced subgraph of the triangle-free graph is a complete blow-up of a pentagon whose total mass is at least 4/5. Its five nonempty classes can have arbitrary weights. Label the core by its template labels. Every exterior vertex meets only an independent subset of the core labels, since consecutive core classes are completely joined. In a pentagon every independent subset lies in the two-element neighborhood of a label. Assign that label to the exterior vertex, choosing arbitrarily when there is a choice. All edges incident to the core are now valid.

Let Y be the edge mass strictly outside the core, let ν be its vertex mass, and write p for the whole graph's ordered edge density. Every edge incident to the core is monochromatic in exactly one of the five alternating label cuts. Even counting every exterior edge as monochromatic gives
$
\beta \le p/10+4Y/5\le p/10+\nu^2/5
\tag{6}
$
by weighted Mantel on the exterior. If $p\le0.3197$, then $\nu\le1/5$ makes this at most $0.03997<1/25$. If $p>0.3197$, the dense-tail theorem of Balogh–Clemen–Lidický already gives the target. To apply that theorem to arbitrary real weights, first use rational weights and complete vertex blow-ups of arbitrarily large order, then take limits; a product-weighted max cut is the maximum of finitely many continuous cut weights. Thus every triangle-free graph with such a core satisfies the sharp bound, with strict slack in the open band.

Completeness of the core is used only to prove the existence of a cyclic labeling making its incident edges valid. Accordingly (6) remains true whenever such a labeling and a vertex set of mass at least 4/5 are given, even if valid core edges were removed. The complementary task is structural: there is no deduction here that an extremal graph must have such a set.

## Scope

This specializes to the standard weighted pentagon bound when there are no invalid edges. The local charge does allow non-pentagonal triangle-free graphs in the band: for example take a complete balanced pentagon core of total mass .85, extend its five classes to total mass .2 each, and put a copy of the triangle-free 4-chromatic Mycielski graph of C5 of total mass .01 in the surplus of one class. Attach the copy to one adjacent core class by allocating disjoint slices of that core class to its four proper colors and joining each copy vertex to its color slice. This is triangle-free, since endpoints of each copy edge attach to different slices. Every unused surplus vertex is isolated. Its density lies between .289 and .294, and (4) holds even with epsilon=1/2, by assigning all invalid edges to the adjacent core class and using invalid weighted degree at most .01. The graph cannot be homomorphic to C5 since it is not 3-colorable.

The use of five pentagon cut patterns is standard. What is proved here is the normalized deficit inequality and its local repair charge, not that a labeling satisfying (4) always exists. The [historical Erdős–Győri–Simonovits pentagon comparison](https://korandi.org/docs/misc/erdos_gyori_simonovits.pdf), [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) and the [current middle-band approach record](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) are related context; no general novelty claim is made for fixed-template cut comparison.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

# Sparse isosceles trapezoids and the mean pinned-distance gap

**Candidate written proof for independent review.** Let $`P`$ be a planar set of $`n`$ sites. Assume every positive-radius circle centered at a site contains at most three sites. Count each unordered four-point configuration once if some line reflects its points in two pairs lying on **distinct** lines perpendicular to the reflecting axis. Write $`Q(P)`$ for the count. This is the noncollinear isosceles trapezoid count, **including rectangles and squares**. Four collinear sites do not count, even if they form two reflected pairs. Other cocircular quadruples do not count either.

1. There are absolute $`c,\delta>0`$ and $`n_0`$ such that $`Q(P)\le\delta n^2`$ and $`n\ge n_0`$ imply that the mean number of distinct positive pinned distances exceeds $`(1/3+c)n`$.
2. Fix $`C<\infty`$. The same conclusion with $`c_C>0`$ and $`n_C`$ holds if **every** subset $`S\subseteq P`$ satisfies $`Q(S)\le C|S|^2`$.

In particular a putative sequence attaining the one-third barrier must contain quadratically many noncollinear isosceles trapezoids, and some subsets must have unbounded ratios of the trapezoid count to the square of their size. The second assertion allows an arbitrary fixed hereditary constant. Whether an arbitrary fixed bound on $`Q(P)/n^2`$ alone suffices remains open. These are partial results for Erdős’s site-centered question. [Original problem, p. 168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/969)

For example, arbitrarily many sites can lie on one circle with no counted trapezoid. Choose distinct angles so that the sums of the angles of different unordered pairs are distinct modulo $`2\pi`$. The angle sum determines the direction of the perpendicular bisector of a chord, so two disjoint chords never have the same bisector. Each site-centered positive-radius circle meets this common circle in at most two points because its center is different. This exhibits a configuration permitted by assertion 1 with zero counted trapezoids and all four-point subsets cocircular.

## Counting incidences off a chosen carrier

For a set $`S`$ of $`s`$ bases, group its unordered pairs by perpendicular bisector $`L`$. Within each group, the line joining a pair is its carrier. Choose one carrier $`H_L`$ containing the most pairs of that group, breaking ties arbitrarily. Write $`u_L`$ for the sum of all carrier multiplicities, $`h_L`$ for their maximum and $`t_L=u_L-h_L`$ for the number of unchosen pairs. Let $`q_L`$ count unordered selections of two pairs from different carriers. They have four distinct endpoints because reflection has unique orbits, and the two carriers are distinct parallel lines. Each selection gives a trapezoid and the selected pairing fixes its axis. Each four-point subset has at most three partitions into pairs. Thus $`\sum_L q_L\le3Q(S)`$. If $`m_i`$ are the carrier multiplicities on one axis, then

```math
2q_L=u_L^2-\sum_i m_i^2\ge u_L(u_L-h_L)\ge t_L^2.
```

In particular the unchosen pairs have $`\sum_L t_L^2\le6Q(S)`$. This also applies when $`Q(S)=0`$, in which case every represented axis has exactly one carrier. The arguments permit collinear reflected pairs on that carrier without limit. A rectangle contributes via each of its eligible pairings, within the factor three above.

Let $`U`$ contain $`p`$ pins and put $`r_L=|L\cap U|`$. For $`r_L\ge2`$, the bound $`r_L^2\le 4\binom{r_L}2`$ and uniqueness of the line joining two pins give

```math
\sum_{r_L\ge2}r_L^2\le4\binom p2.
```

Consequently the number of pin–pair incidences on unchosen carriers of axes containing at least two pins is at most $`\sqrt{24\binom p2 Q(S)}`$. Those on axes with one pin cost at most $`\binom s2`$. On any of these incidences there is at most one third base completing a size-three radius class, by the local circle cap.

We also need the rich-axis tail. Let $`M`$ denote the maximal collinearity of the ambient set. Dyadic summation of the Szemerédi–Trotter rich-line bound $`O(p^2/j^3+p/j)`$ gives, for every $`K\ge2`$,

```math
\sum_{r_L>K}r_L^2\ll p^2/K+pM.
```

Indeed summing $`O(p^2/j+pj)`$ over powers of two from $`K`$ through $`M`$ gives these two terms. By Cauchy–Schwarz the number of unchosen incidences on these axes is $`O(\sqrt{Q(S)}(p/\sqrt K+\sqrt{pM}))`$. [Point–line incidence theorem](https://doi.org/10.1007/s00454-001-0009-z)

## Local triangle count

Suppose a sequence violates the claimed gap, with normalized pinned sum tending to one third. To refute assertion 1 one may take $`Q(P)=o(n^2)`$ by making both constants tend to zero and the size threshold tend to infinity. To refute assertion 2 fix its $`C`$. The [mixed-line estimate](../erdos-654-arbitrary-collinearities/COLLINEAR-MASS.md) gives $`M=o(n)`$. The [mixed-circle estimate](CIRCLE-CONCENTRATION.md) gives $`o(n)`$ sites on every circle. Both estimates require only the site-centered cap in this application.

Write $`T(U,S)`$ for the number of full site-centered triples with pin in $`U`$ and all three bases in $`S`$. For this bound choose the carrier separately for each axis of $`S`$. Count triples with at least one unchosen side by charging one such side. In assertion 1 the incidence inequalities just proved give $`O(s^2)+o(n^2)`$ uniformly, using $`Q(S)\le Q(P)`$. For assertion 2, axes of richness at most $`K`$ cost $`O(Ks^2)`$ and the rest cost $`O_C(sp/\sqrt K+s\sqrt{pM})`$. For $`p,s>0`$ take $`K=\max(2,\lceil(p/s)^{2/3}\rceil)`$. The first two terms together are $`O_C(s^2+p^{2/3}s^{4/3})`$, and $`s\sqrt{pM}=o(n^2)`$ uniformly. Empty sets are immediate.

For the remaining triples all three sides are chosen. The carrier argument in the [arbitrary-collinearity proof](../erdos-654-arbitrary-collinearities/ARBITRARY-COLLINEARITIES.md) now applies directly. In a dyadic band of carriers containing $`t`$ to $`2t`$ base sites, each bisector has at most $`t`$ chosen pairs, all disjoint in its one chosen carrier. The total pair weight is at most $`O(s^2/t+st)`$. The weighted point–line count in that proof through carrier size $`n^{5/9}`$ is $`O(p^{2/3}s^{4/3}+s^2+n^{17/9})`$. A triangle with two larger sides has a vertex at the intersection of two of the $`O(n^{4/9})`$ larger carrier lines. At most $`n`$ full triples use a given intersection as a vertex, since a pin and base determine its full radius class. Hence the same bound holds for all chosen triangles. We obtain in both cases

```math
T(U,S)\ll_C p^{2/3}s^{4/3}+s^2+o(n^2),
```

with an absolute implied constant in the first case. On subsets of a fixed positive relative size, assertion 1 still gives a subquadratic count and assertion 2 retains its hereditary bound.

## Farthest samples and coincident pairs

We specify the remaining dependencies of the [scale-tree proof](../erdos-654-arbitrary-collinearities/ARBITRARY-COLLINEARITIES.md). Fixed independent samples are regular with probability tending to one, by the line and circle estimates above. The local bound supplies exactly its two subset powers and a vanishing normalized uniform error. In the farthest-site sampling inequality the number of pieces is bounded for a fixed sample size, so take the limit in $`n`$ first. In the tightness inequality it gives $`be\ll_C b^{2/3}e^{4/3}+e^2`$ at retained mass $`b`$ and escaped mass $`e\le1-b`$, so take $`b`$ sufficiently close to one. Every positive-relative-mass node inherits these estimates and the pin–base product law. This gives the positive chain of direction ranks on the same scale tree.

For the carrier comparisons at each fixed node, choose one carrier per axis in the **entire node**, before assigning any targets. In either hypothesis its trapezoid count is $`O_C(n^2)`$ with $`n`$ now the node size, and its maximal collinearity is $`o(n)`$. The rich-axis bound above makes the total unchosen pin–pair incidence on axes with more than $`K`$ node pins at most $`O_C(n^2/\sqrt K)+o(n^2)`$. The full radius-class counting law on axes with at most $`K`$ pins is dominated by $`O(K)`$ times the independent pair law. Thus on an atomless graph portion or in a rank with an atomless marginal, a coincident pair with bounded-richness axis has zero limiting mass. For a prescribed error take $`K`$ large enough, after fixing any localization weight of positive normalizing mass. Apart from this error, sides with coincident endpoints or ranks therefore come from chosen carriers on rich axes. The small- and intermediate-carrier bounds in Appendix C of the cited proof hold for these pairs: for small carriers an axis has a bounded number of chosen pairs, and the dyadic weighted estimate above applies until the carrier cutoff $`cn^{2/3}`$. The original order of choosing the small-carrier cutoff, then axis richness, then $`c`$ gives arbitrarily small total error. All these choices may depend on a fixed node.

Mark a base label only when its side is a **chosen** pair within one of the retained large assigned carriers of Appendix C. Use that flag in every subsequent source–target count. At a given pin and in any one target orientation only the chosen carrier of the perpendicular axis through the pin can contribute. This gives both bounds there on discarded orientations and on source–target lines meeting perpendicularly. In Appendix B define popular target midpoints using the original pair threshold and the added condition that the target line is the chosen carrier of the perpendicular bisector through that midpoint. The resulting midpoint set has the same upper size bound. Marked pin–target incidences outside it still contribute at most the threshold times the number of pin–target choices. For a fixed orientation, the preimages of these midpoint sets at one source are disjoint across target lines by the one-carrier choice. The additive-energy estimates and distinct projection ratios in the rest of Appendix B use only these properties, so its vanishing bound applies to the marked incidences. Dropping the marked condition in a lower-bound step is unnecessary.

On a terminal nonatomic chain part, the symmetric local weight forces all four limiting coordinates onto a graph of slope less than one with probability arbitrarily close to one. Some base pair coincides there and hence, after the exclusions above, at least two base labels are marked with probability arbitrarily close to one. The pin–base swapping and comparable-size argument in Appendix C then contradicts the marked-incidence bound. On a positive set of infinite paths there is an internal node on which all four ranks lie on the direction chain with probability arbitrarily close to one. Without a tie in some base-pair rank the finite quadruple would itself be on a graph of slope less than one, which cannot contain three distinct sites equidistant from a fourth. The same marking contradiction applies there with unit weight. These two alternatives exhaust the positive chain and prove both assertions. [Terminal graph and rank arguments](../erdos-654-arbitrary-collinearities/ARBITRARY-COLLINEARITIES.md)

## Scope, priorities and checks

Codex derived this strengthening in the WadeDavis research session. Erdős proposed the local one-third question in 1987. The repository’s global no-four-cocircular theorem supplies the scale-tree, incidence and additive-combinatorics arguments cited above. The [two-sided bisector criterion](TWO-SIDED-BISECTORS.md) instead restricts active pin completions after a fixed number of pair deletions; here the single retained carrier can contain unboundedly many pairs. [Four oblique grids](FOUR-GRIDS.md) show why dispersion and the cap of four on arbitrary circles do not imply small active excess.

Bounded searches for pinned distances with sparse isosceles trapezoids, common perpendicular bisectors, forbidden four-point patterns and the Erdős question compared the two permanent repository branches, their existing results and issue #969. Lund–Sheffer–de Zeeuw study total bisector energy, including same-carrier contributions. Lund–Petridis relate bisectors and pinned distinct distances under other quantitative hypotheses. Dumitrescu’s forbidden-pattern work and Tao’s later construction bound the *total* number of distinct distances of examples, with several forbidden patterns. None of these cited conclusions gives either of the two mean one-third implications above. The bounds here count rectangles, allow arbitrarily many same-carrier reflected pairs, and place no direct cap on other cyclic quadruples. [Lund–Sheffer–de Zeeuw](https://arxiv.org/abs/1411.6868) · [Lund–Petridis](https://arxiv.org/abs/1810.00765) · [Dumitrescu, theorem 1](https://doi.org/10.1016/j.disc.2020.111967) · [Tao, theorem 1.2](https://arxiv.org/abs/2409.01343)

The [exact checker](check_sparse_trapezoids.py) compares the reflection count to an independent circle determinant and parallel-segment test. It exhausts 512 subsets of the three-by-three lattice and 262,144 independent choices of subsets of pins and bases. The tests count 448 trapezoids and 768 axis-pairing witnesses across the subsets. Separate fixtures cover a proper trapezoid, rectangle, square, collinear reflected pairs and a cyclic quadrilateral with no reflected pairing.

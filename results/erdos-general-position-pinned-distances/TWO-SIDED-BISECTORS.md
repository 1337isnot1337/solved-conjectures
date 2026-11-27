# A two-sided condition on perpendicular bisectors

Let $`P`$ be an $`n`$-point planar set such that every positive-radius circle centered at a site contains at most three sites. For each unordered pair $`e=\{y,z\}`$ let $`a_e`$ count the sites equidistant from $`y,z`$ at a radius attained by exactly three sites. Call these the active pin completions of $`e`$. Put $`\mathcal E_L=\{e:\text{the perpendicular bisector of }e\text{ is }L\}`$. Fix nonnegative integers $`K,B`$, and put

```math
R_{K,B}(P)=\sum_L\min_{S\subseteq\mathcal E_L,\ |S|\le B}
\sum_{e\in\mathcal E_L\setminus S}(a_e-K)_+ .
```

Equivalently, keep the $`B`$ pairs on each axis with the most completions, and ignore the first $`K`$ completions of every other pair.

**Theorem.** There are constants $`c_{K,B},\delta_{K,B}>0`$ and $`n_{K,B}`$ such that $`R_{K,B}(P)\le\delta_{K,B} n^2`$ for $`n\ge n_{K,B}`$ implies that the mean number of pinned positive distances exceeds $`(1/3+c_{K,B})n`$. There is no global cap on the number of sites on a line or circle.

Thus every sequence approaching the elementary average one-third bound must have a positive proportion of all pin–pair incidences remaining after this deletion, for *every* fixed $`K,B`$. Pins can be arbitrarily numerous on any selected axis, and the $`B`$ nominated reflected pairs there may have arbitrarily many completions. The earlier one-sided bounded-completion condition is $`B=0`$. Neither this theorem nor the preceding [mixed-circle incidence bound](CIRCLE-CONCENTRATION.md) resolves the unrestricted site-centered problem. [Erdős, p. 168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Tracking issue #969](https://github.com/1337isnot1337/solved-conjectures/issues/969)

## Local counts and limiting base pairs

Suppose the theorem is false. There is a sequence with $`n\to\infty`$, normalized pinned total approaching $`1/3`$, and $`R=R_{K,B}(P)=o(n^2)`$. As usual, writing $`A_j`$ for the total number of positive pin–radius classes of size $`j`$, the deficit $`2A_1+A_2=3D-n(n-1)`$ is $`o(n^2)`$. The ordered uniform good quadruple consists of one pin and the three exchangeable bases on a full radius. Its pin–base laws differ by $`o(1)`$ in total variation from the product of uniform site measures. For a specified ordered base pair $`y,z`$ its probability is $`a_{\{y,z\}}/(6A_3)`$ with $`6A_3=(2+o(1))n^2`$.

Choose minimizing nominated sets $`S_L`$. For $`p`$ chosen pins and $`s`$ chosen bases, the number $`T(p,s)`$ of full triangles with all three sites among the bases satisfies

```math
T(p,s)\ll_{K,B}p^{2/3}s^{4/3}+s^2+p+R.
```

To see this, charge each counted triangle to one of its sides and its pin. A pin and pair specify at most one triangle by the site-centered cap. Nonnominated pairs cost at most $`K\binom s2+R`$. For nominated pairs, consider axes of pairs internal to the chosen bases. There are at most $`\binom s2`$ distinct axes and each axis has weight at most $`B`$. Applying Szemerédi–Trotter to those axes and the chosen pins proves the bound. [Point–line incidence theorem, Solymosi and Tóth, Theorem 6](https://doi.org/10.1007/s00454-001-0009-z)

The base-pair law has a further property uniform over all choices of pair attributes. Let $`J\ge\max(K,2)`$ be fixed. For every event $`E`$ depending on an ordered base pair, with independent-pair probability $`u(E)`$, its probability under the good quadruple is at most

```math
C J u(E)+O_B(J^{-2})+o_n(1).
```

Indeed nonnominated pairs can be truncated at $`K`$ at a total cost $`O(R/n^2)`$. For nominated pairs whose axis has at most $`J`$ sites, each pair has at most $`J`$ active completions. The other nominated pairs account for at most $`B\sum_{L:r_L>J}r_L`$ pin–pair incidences on writing $`r_L=|L\cap P|`$. The rich-line theorem bounds this sum by $`O(n^2/J^2+n\log n)`$ by dyadic summation. Consequently every limiting pair law is absolutely continuous against the independent-pair law on any compact space of pair attributes obtained by applying the same site map in both coordinates. For clarity, for each $`J`$ one can first extract weak limits of the truncated good pair measures dominated by $`CJ`$ times the independent law, and of the error measures of mass $`O_B(J^{-2})`$. Every independent null set therefore has limiting good-pair mass at most $`O_B(J^{-2})`$ for arbitrarily large $`J`$. Exactly the same argument applies on every fixed positive-relative-mass internal node: restrict the original nominations, the excess is at most $`R`$, and normalize by the square of that node's size.

## Applying the multiscale argument

The needed geometric steps already have detailed proofs in the repository. We specify below exactly which inputs they use and how the changes of hypothesis enter them. The local upper bound just proved gives the same powers of $`p,s`$ as the [farthest-site argument and scale tree](ARBITRARY-COLLINEARITIES.md). Its remaining normalized error $`O_{K,B}(1/n+R/n^2)`$ tends to zero uniformly in the tested subsets. A fixed independent sample of sites has no repeated point, no collinear triple and no cocircular quadruple with probability $`1-o_n(1)`$. Indeed the maximum number of sites on a line is $`o(n)`$ by the [mixed-line bound](ARBITRARY-COLLINEARITIES.md#appendix-a-collinear-sites), and the maximum on a circle is $`o(n)`$ by the [mixed-circle bound](CIRCLE-CONCENTRATION.md). Expose sample sites successively and sum over its finitely many pairs and triples.

On such a regular sample the farthest-site subdivision, its seven defining sites per piece and the half-sample deletion estimate depend only on the sample geometry. Ambient cocircularities do not change them. All ambient equal-distance counts use circles centered at a site. For a fixed sample size $`2m`$, the local bound for pins assigned to a piece and all three bases in its conflict set gives exactly the two normalized terms $`O_{K,B}(a^{2/3}b^{4/3}+b^2)`$ for pin fraction $`a`$ and conflict fraction $`b`$, plus $`o_n(1)`$ per piece. Summing over $`O(m)`$ pieces at fixed $`m`$ preserves that error. The sampling inequality from the cited proof is therefore

```math
1/(2m+1)-o_n(1)\ll_{K,B} m^{-4/3}(\mathbb E h_m)^{1/3}+m^{-2}\mathbb E h_m+o_n(1),
```

where $`h_m`$ counts convex hull vertices. Taking $`n\to\infty`$ first forces a positive lower bound on $`\liminf \mathbb E h_m/m`$ uniformly in large fixed $`m`$.

The same local bound prevents escape of a small positive fraction $`e`$ when a smallest disk containing a fixed fraction $`b`$ near one is rescaled to radius one. A pin in that disk and a base outside radius $`M+2`$ force all bases outside radius $`M`$. As in the cited source, passing successively to the large-set and large-radius limits gives $`be\ll_{K,B}b^{2/3}e^{4/3}+e^2`$. Choosing $`b`$ sufficiently close to one rules out any $`0<e\le1-b`$. Relative masses of atoms are at most $`b`$. Children localized at an atom inherit the full internal pin–base property by the annular marginal argument. Every positive-mass node inherits the local estimates and sample regularity above. Therefore the proof constructing the countable tree of successive rescalings and the positive-mass set of paths lying on a closed chain of direction ranks applies unchanged. It uses positive similarities, the hull fraction and independent pair sampling, without reflection geometry.

To exclude a positive terminal part of that chain, use the [localization weight symmetric in the three base labels](ARBITRARY-COLLINEARITIES.md#a-weight-symmetric-in-the-three-base-labels). A positive nonatomic terminal part lies on a graph of Lipschitz constant less than one. Choose a compact positive-mass subset $`H`$ there omitting all atoms of the node's planar law. The weight in the cited calculation gives positive probability that all four limiting coordinates lie in $`H`$. That calculation uses only equal radii, independent pin–base projections and differentiation of the limiting measure on $`H`$. Any circle about a point of this graph meets it at most twice, so some two base coordinates must coincide in $`H`$. The independent-pair law assigns zero probability to this diagonal. The absolute continuity established above for the planar coordinate pair rules out the event. No assertion about the alignment of reflected pairs on a common carrier is used.

If instead a positive part of the chain set consists of infinite paths, the growing node-partition filtration detects membership on those paths. As in the cited scale-tree proof, there is a fixed node with conditional probability arbitrarily close to one of lying on that closed chain of direction ranks. The limits of each empirical coordinate rank have atomless one-dimensional marginals, also conditional on this fixed positive-mass node. With positive probability all four rank pairs from a good quadruple lie on the chain. No two labels can tie in either rank: the independent-pair law has zero tie mass, the pin–base laws are independent, and the internal base–base laws are absolutely continuous against the independent law on these same attributes. Every one of the six rank comparisons is then strict and persists in the finite sample. Its four sites all have differences in the same double sector of aperture $`\pi/4`$, hence lie on a graph of slope at most $`\tan(\pi/8)<1`$. Such a graph cannot have three distinct sites equidistant from a fourth site on it. Formally, strict orderings give open neighborhoods of forbidden finite rank quadruples, which have zero limiting mass. This excludes the infinite-path alternative and proves the theorem.

The earlier bounded-collinearity and arbitrary-collinearity proofs treated sets with a global cap on every circle. The [disk moment obstruction](DISK-MOMENT.md) explains a limitation of proofs using only the limiting quadruple law. The two-sided condition here uses both a local finite incidence bound and absolute continuity in the limit. The bounded literature and duplicate checks used the exact site-centered problem, the existing branch proofs, the 2026 local-capacity survey, and searches for active perpendicular-bisector completion counts. The established bisector-energy theorem controls a different moment of reflections. [Survey, §4.1](https://www.ulam.ai/research/erdos655-overview.pdf) · [Bisector energy](https://arxiv.org/abs/1411.6868)

## Exact finite checks

Run `python3 check_bisector_moments.py` in this directory. The checker exhausts 435 locally capped subsets of the three-by-three grid, including 21 with a prescribed concyclic quadruple. It checks 204 full pin–radius classes, 30,744 optimal nominations, 12,405 site-witnessed co-farthest graphs, and 36,000 discrete angular triples with their exact marginal and joint counts. These checks exercise the identities and support restrictions; the analytic proof gives the asymptotic conclusion. [Checker](check_bisector_moments.py)

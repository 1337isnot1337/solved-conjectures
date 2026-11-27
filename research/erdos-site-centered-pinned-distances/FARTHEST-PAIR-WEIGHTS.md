# A regular pair weight can retain the full farthest-conflict error

The [radial scale-tree reduction](RADIAL-SCALE-TREE.md) leaves the positive sampled-hull proportion open for capacity three and an arbitrary fixed global quadratic trapezoid bound. **Research checkpoint.** The following identifies a limitation of the farthest-cell incidence bound on that last step. It uses an explicit probability weight on pairs. Whether actual transverse reflection multiplicities can realize such a concentration in a sequence approaching the one-third barrier is a different question.

## The local term in the incidence argument

Write $`U,S`$ for a set of pins and a set of targets, with sizes $`p,s`$. At each bisector of the target set keep a carrier with the largest number of reflected pairs. Let $`v_L`$ count any retained group of unchosen pairs, and $`D(S)=\sum_L v_L^2`$. The [rich-axis calculation](SPARSE-TRAPEZOIDS.md) bounds incidences with these residual pairs by

```math
 O\left(Ks^2+\sqrt{D(S)}\left(p/\sqrt K+\sqrt{pM}\right)\right),
```

where $`M`$ is the ambient maximum line size and $`K\ge2`$. Take $`K`$ comparable to the maximum of two and $`(p\sqrt{D(S)}/s^2)^{2/3}`$ when $`s>0`$. Under the global quadratic hypothesis and hypothetical near-extremality, $`M=o(n)`$ and $`D(S)=O(n^2)`$. Including the previously bounded all-chosen triangles (and a sparse-pair error if that deletion is used), the normalized count in one farthest cell has an upper bound proportional to

```math
 a^{2/3}b^{4/3}+b^2+a^{2/3}b^{2/3}q^{1/3}+o(1),
```

where $`a=p/n`$, $`b=s/n`$ and $`q=D(S)/n^2`$. Empty pin or target sets give zero. For a small group of unchosen pairs $`e`$ in one bisector, every such pair has at least half of the axis's total pair weight in other carriers, since a different carrier with at least its carrier's weight was chosen. Thus $`v_L^2`$ is at most twice the sum of their counts of transverse partners. This explains the proposed replacement of $`q`$ by the mass that a transverse-partner-weighted pair measure assigns to $`S^2`$.

If the sample size is $`2m`$, the probability of a new farthest record at a pin is about $`1/(2m)`$. For each fixed $`m`$ first let the finite site size tend to infinity. The established sampling inequalities and a vanishing hull fraction make the sums of the first two terms $`o(1/m)`$ as $`m\to\infty`$. An $`o(1/m)`$ estimate on the sum of the third terms would yield the missing contradiction. The following example prevents deducing this estimate from an absolutely continuous weighted pair law, even if its density is weakly square integrable.

## The uniform-disk coupling already controls the weak five-halves case

Let $`(X,Y_1,Y_2,Y_3)`$ have the [published uniform-disk coupling](DISK-MOMENT.md). Its pin and each single base are independent; the three bases have a common radius from the pin. The base-pair density $`g`$ is weakly in $`L^{5/2}`$. For a fixed sample of $`2m`$ independent sites, suppose $`Y_1`$ beats every sampled site at the pin $`X`$. All three bases then beat this sample. In each piece the law of such a record tuple has mass at most $`a_\Delta b_\Delta`$ by the pin–base law, and at most $`q_\Delta=\int_{B_\Delta^2}g`$ by the law of two bases. The minimum of these two bounds is at most their geometric mean with exponents two thirds and one third. Exchangeability of the $`2m+1`$ competing sites at the pin, and almost-sure absence of ties, give

```math
 \mathbb E\sum_\Delta a_\Delta^{2/3} b_\Delta^{2/3} q_\Delta^{1/3}
 \ge 1/(2m+1).
```

This conclusion reuses the existing disk coupling and keeps its proven endpoint. For abstract transverse pair weights on varying site laws one can go further, as follows.

## One pair density with every finite moment

There exists an absolutely continuous planar site probability $`\mu`$ on the closed unit disk and a symmetric probability density $`w`$ against $`\mu\otimes\mu`$ whose two site marginals are exactly $`\mu`$, such that $`w\in L^p`$ for every finite $`p\ge1`$. Nevertheless for every sufficiently large $`m`$ the preceding expected sum is at least $`c/m`$ with $`q_\Delta=\int_{B_\Delta^2}w`$ and an absolute $`c>0`$. The expected hull fraction of independent $`\mu`$-samples tends to zero. This is a pair-weight example; it does not assert the equidistant-tuple property of the published disk coupling.

**Site measure.** The direction is uniform and independent of the radius. Put half the probability uniformly by area on the disk of radius $`1/2`$. On radii above $`1/2`$, prescribe the *unconditional* mass at depth $`1-|y|\le s`$ by

```math
 F(s)=\frac{1}{2(1+\log(1/(2s)))}\qquad(0\lt s\le1/2).
```

This runs from zero to one half and is absolutely continuous for positive depth. Extend $`F`$ by the actual depth distribution of the inner half. The depth rank $`u(y)=F(1-|y|)`$ is uniform on the unit interval. Every interior point has neighborhoods of positive mass and the boundary circle has measure zero. The three-neighborhood argument therefore gives vanishing expected sample hull fraction.

**Pair density.** For $`j\ge0`$ set $`u_j=2^{-j}`$, $`I_j=(u_j/2,u_j]`$ and $`\theta_j=\exp(-1/\sqrt{u_j})`$. Put $`W(y,z)=1/u_j`$ when both ranks lie in $`I_j`$ and their smaller angular difference is at most $`\theta_j`$; put zero otherwise. The row integral of $`W`$ is $`r(y)=\theta_j/(2\pi)`$ when $`u(y)\in I_j`$. All these values are below one half. Hence

```math
 w(y,z)=W(y,z)+\frac{(1-r(y))(1-r(z))}{\int(1-r)\,d\mu}
```

has both marginals exactly $`\mu`$ and differs from $`W`$ by a bounded function. For each fixed $`p\ge1`$ the moment of $`W`$ is

```math
 \frac1{4\pi}\sum_{j\ge0} u_j^{2-p}\exp(-1/\sqrt{u_j})<\infty.
```

**Farthest caps.** For each sufficiently large $`m`$ choose the unique small positive $`s`$ with $`m s F(s^2)=1`$. Set $`t=F(s^2)`$. Equally space $`\lfloor\pi/s\rfloor`$ angles around the circle, whose consecutive separation is at least $`2s`$ and at most $`4s`$ for small $`s`$. For an angle $`\phi_i`$ let its target $`B_i`$ have depth at most $`s^2`$ and angular distance at most $`s/4`$ from $`\phi_i`$. Let its source $`A_i`$ have radius between $`1/4`$ and $`1/2`$ and angular distance at most $`s/4`$ from the opposite direction. The targets are disjoint and have equal mass $`b=st/(4\pi)=1/(4\pi m)`$. The sources are disjoint, each has mass comparable to $`s`$, and their union has mass bounded below independently of $`m`$.

Call a source good if the random $`2m`$-sample misses the enlarged target of depth $`5s^2`$ and angular distance at most $`21s`$ about $`\phi_i`$. Its mass is at most $`C s F(5s^2)\le C'/m`$ for all sufficiently large $`m`$, since $`F(5s^2)/F(s^2)\to1`$. Each source is good with probability at least a fixed positive constant. On its good event, every target in $`B_i`$ beats the sample at every pin in $`A_i`$. Indeed, if the pin radius is $`R`$, the deficit in squared distance from the antipodal unit point for a target at depth $`d`$ and angular error $`\theta\in[0,\pi]`$ from that antipode is

```math
 d(2+2R-d)+2R(1-d)(1-\cos\theta).
```

At a core target $`d\le s^2`$ and $`\theta\le s/2`$, so the deficit is less than $`4s^2`$. A point outside the enlargement has either $`d>5s^2`$ (the first term alone exceeds $`5s^2`$) or $`d\le5s^2\le1/2`$ and $`\theta>20s`$. In the latter case $`2R(1-d)\ge1/4`$ and $`1-\cos\theta\ge2\theta^2/\pi^2`$, which again gives a deficit above $`4s^2`$.

Choose $`u_j\in(t/2,t]`$. Then $`I_j\subset(0,t]`$. Also $`\theta_j\ge\exp(-\sqrt{2/t})>s`$ eventually: the formula for $`F`$ gives $`\log(1/s)=1/(4t)+O(1)`$. Thus any two angles in $`B_i`$ have difference below $`\theta_j`$. The portion of $`B_i`$ with rank in $`I_j`$ has mass $`s u_j/(8\pi)`$. Its pair mass under the raw density is at least $`s^2u_j/(64\pi^2)\ge c_1 s b`$.

For a piece $`\Delta`$ touching positive pin mass from $`h`$ good sources, its conflict set contains all $`h`$ corresponding core targets. The piece boundaries are area-null. Consequently $`b_\Delta\ge h b`$ and $`q_\Delta\ge c_1 h s b`$. Its good pin mass $`v_\Delta`$ is at most $`\min(a_\Delta,C h s)`$. If $`a_\Delta\le s`$, then $`h a_\Delta^{2/3}s^{1/3}\ge a_\Delta`$ for $`h\ge1`$. If $`a_\Delta\ge s`$, this same quantity is at least $`h s`$. The piece contributes at least $`c_2 b v_\Delta`$ to the mixed sum in either case; pieces without a good source require no lower bound. Summing gives $`c_2 b`$ times total good pin mass. Its expectation is bounded below by a positive constant, by linearity over the disjoint sources. This proves the claimed lower bound for every large sample size.

A bounded pair density, in contrast, gives $`q_\Delta\le\lVert w\rVert_\infty b_\Delta^2`$, which reduces the mixed expression to the established hull-controlled term. The obstruction shows that the conjunction of every fixed finite moment, exact one-site marginals and vanishing hull fractions does not furnish this reduction for general absolutely continuous site laws.

## An elementary square example

Let $`\mu`$ be uniform area on the unit square. For $`y=(y_1,y_2)`$ set $`s(y)=(1-y_1)+(1-y_2)`$, and let $`U(y)=\mu\{v:s(v)\le s(y)\}`$. This rank is uniform on $`[0,1]`$. Define the symmetric pair density

```math
 w(y,z)=1/\max(U(y),U(z)).
```

Its value at the null pair of zero ranks can be set to zero. For $`t\ge1`$, the independent pair probability of $`w>t`$ is exactly $`t^{-2}`$. Its integral is two and its strong moment of order $`p`$ equals $`2/(2-p)`$ for $`0\lt p<2`$. If $`B_0`$ is a corner triangle $`s(y)\le\delta`$, of area $`b=\delta^2/2`$ for $`0\le\delta\le1`$, direct integration of the two uniform ranks gives

```math
 \int_{B_0^2}w\,d(\mu\otimes\mu)=2b.
```

For a sample of $`2m`$ sites take $`\delta=1/(5\sqrt m)`$, so the larger triangle $`s(z)\le5\delta`$ has area $`1/(2m)`$. Its probability of being missed is $`(1-1/(2m))^{2m}\ge1/4`$. For every pin $`x\in[0,1/4]^2`$, the squared distance deficit from the upper corner satisfies

```math
 \tfrac12 s(y)\le |(1,1)-x|^2-|y-x|^2
 =\sum_{i=1}^2(1-y_i)(1+y_i-2x_i)\le2s(y).
```

On the miss event, every target in $`B_0`$ beats every sample site for every one of these pins. In the usual farthest-site partition with its vertical subdivision, any cell carrying a positive measure of these pins has its conflict set $`B_\Delta`$ containing $`B_0`$. The finitely many polygonal cell boundaries have area zero; strict beating at an interior pin is sufficient. These cells together have pin mass at least $`1/16`$. Set $`q_\Delta=\int_{B_\Delta^2}w\,d(\mu\otimes\mu)`$. With $`b=1/(50m)`$, $`b_\Delta\ge b`$, $`q_\Delta\ge2b`$ and $`a_\Delta^{2/3}\ge a_\Delta`$, the expectation satisfies

```math
 \mathbb E\sum_\Delta a_\Delta^{2/3}b_\Delta^{2/3}q_\Delta^{1/3}
 \ge \frac{2^{1/3}}{3200m}.
```

The expected sample hull fraction for square area tends to zero, by the positive-area triangle test around each interior point. Thus this particular upper-bound expression can remain of the same order as the farthest-record probability on a positive area of pins. It even does so for a pair density in every strong $`L^p`$ below two. The construction assigns no Euclidean trapezoids, finite pin triples or near-extremal site sets to that weight. A proof for the real problem can still exploit the relation between the implicated axes, carriers, four sites and pins.

## Both single-site marginals can be exactly uniform

There is also a symmetric probability coupling with both one-site marginals exactly $`\mu`$ exhibiting the same obstruction. Partition the positive ranks into $`I_j=(2^{-j-1},2^{-j}]`$ for $`j\ge0`$. On $`I_j\times I_j`$ set $`w_0=2^{j+1}`$ and set it to zero elsewhere. Each row integrates to one and symmetry gives the same for the columns. Its $`p`$th moment is $`\sum_{j\ge0}2^{-(2-p)(j+1)}`$, and its tail areas form a geometric series of order $`t^{-2}`$ at every $`t\ge1`$. In particular its single-site marginals have bounded density and its pair law is uniformly integrable. For any $`0\lt b\le1`$, the rank interval $`(0,b]`$ contains a union of whole dyadic blocks of total length at least $`b/2`$. Thus its square has joint mass at least $`b/2`$. In the preceding farthest calculation one obtains the lower bound $`2^{-1/3}/(3200m)`$ with these exactly uniform marginals.

For this single fixed corner, strong square integrability would preclude a fixed positive multiple of $`b`$ as $`b\downarrow0`$. Cauchy–Schwarz gives $`\int_{B_0^2}w\le b\lVert w\mathbf1_{B_0^2}\rVert_2=o(b)`$. This statement concerns just the single corner contribution; it supplies no bound uniform over all random cells or an actual moment estimate for Euclidean trapezoids.

The [exact finite controls](check_farthest_pair_weights.py) verify the residual row completion on finite angular/radial partitions, the cap deficit inequalities, and the charging algebra. The site and pair laws in the theorem are continuous. The source comparison includes the [earlier sharp disk result](DISK-MOMENT.md), the [sparse transverse-energy theorem](SPARSE-TRAPEZOIDS.md), the [residual-weight criterion](THIN-EXCEPTIONAL-PAIRS.md) and the [full-mass reduction](RADIAL-SCALE-TREE.md). The new all-moments example concerns only the remaining incidence bound with a freely assigned pair weight.

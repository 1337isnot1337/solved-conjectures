# Radial profiles contain the full site mass

**Reviewed written partial theorem.** As in the [atomic-limit theorem](ATOMIC-LIMITS.md), suppose the finite planar sets have site-centered capacity three, a fixed global quadratic bound on noncollinear isosceles trapezoids and mean pinned count $`(1/3+o(1))n`$. Around any sequence of centers $`o_n`$, with $`r(y)=|y-o_n|`$, define the annulus mass
```math
 a_n(y)=n^{-1}\#\{z:r(y)/8\le r(z)\le8r(y)\}.
```
Up to the possible single site with radius zero,
```math
 \lim_{\delta\downarrow0}\limsup_{n\to\infty}
       n^{-1}\#\{y:a_n(y)\le\delta\}=0 .
```
The centers can depend arbitrarily on the finite sets. Since a sequence of failing centers could be selected at each failing index, the conclusion is uniform over centers for each sequence satisfying the hypotheses.

Order the sites by $`r(y)`$, breaking exact ties in any deterministic way, and attach rank $`j/n`$ to the $`j`$th site. The limit of the uniform rank law is uniform on $`[0,1]`$. Otherwise pass to a subsequence with $`\delta_n\downarrow0`$ and at least $`\varepsilon n`$ sites of annulus mass at most $`\delta_n`$. At least $`\varepsilon n/2-O(1)`$ of them have normalized rank at least $`\varepsilon/2`$. For each such first base, all but at most $`\delta_n n+1`$ of the sites of lower or equal rank have radius strictly less than $`r(y)/8`$. The asymptotically independent pin and first base therefore have probability bounded away from zero of this joint event. A full triple with this pin and first base has both other base radii between $`3r(y)/4`$ and $`5r(y)/4`$, by the triangle inequality. As a result the three normalized ranks differ by at most $`\delta_n+1/n`$, including any possible tie-breaking. Retain the event as a finite flag when passing to a joint subsequence. On a positive-probability limiting event all three rank coordinates agree. The diagonal of two independent uniform ranks is null, in contradiction to mutual exclusion of two singular sides.

## A countable, full-mass profile decomposition

For each nonzero radius form the dyadic bin $`2^k\le r<2^{k+1}`$. Write $`p_{n,k}`$ for its fraction of sites. If $`a_n(y)>\delta`$, at least one of the seven bins of indices $`k-3,\ldots,k+3`$ has mass at least $`\delta/7`$. There are at most $`7/\delta`$ such heavy bins. Their three-neighbor bins on either side cover all these sites, hence at most $`49/\delta`$ bins suffice. The preceding limit proves that, for every $`\varepsilon>0`$, the largest $`M(\varepsilon)`$ bin masses cover fraction at least $`1-\varepsilon`$ eventually.

Rank the occupied bins by decreasing mass, using any deterministic order for ties. Pass to a subsequence along which every ranked mass converges to $`p_j`$. A nonexistent rank has zero mass. Uniform tail control gives $`\sum_j p_j=1`$. For the countably many positive ranks record their integer bin indices $`k_n(j)`$, which exist eventually. After diagonal extraction every difference between two such indices is eventually a fixed integer, tends to positive infinity, or tends to negative infinity. The positive ranks with bounded relative offsets form equivalence classes, totally ordered by increasing scale between classes. No smallest or largest class is presumed.

Choose one representative per class $`A`$, and let $`d_{A,n}=2^{k_n(j_A)}`$. Record the positive bin ranks and the coordinates $`(y-o_n)/d_{A,n}`$ in every class chart, compactifying the plane by one point. A uniform site has positive ranked-bin label $`j`$ with probability $`p_j`$ in a joint limit: the discrete labels can be compactified by a point at infinity, which gets zero mass by the tail bound. In chart $`A`$ all labels from that class have positive finite radii bounded away from zero and infinity separately for each label, as their dyadic offsets are fixed. Smaller classes go to zero, larger classes to infinity. Thus the total mass of positive finite chart coordinates is exactly $`\sum_{j\in A}p_j`$, and the entire probability mass has been accounted for.

If $`A`$ has any smaller class, the origin in this chart has positive mass. By the atomic-limit theorem its finite site law is then purely atomic. In a class with no smaller class, the finite planar part can instead be wholly nonatomic; if so, it has no mass at the origin. Thus only a smallest class, when it exists, can have positive nonatomic mass at positive finite radii. No quantitative decay rate for the ranked bin tails is asserted.

[Recursive scale-tree argument](RADIAL-SCALE-TREE.md) · [Independent review](RADIAL-PROFILES-REVIEW.md) · [Exact finite checks](check_radial_profiles.py)

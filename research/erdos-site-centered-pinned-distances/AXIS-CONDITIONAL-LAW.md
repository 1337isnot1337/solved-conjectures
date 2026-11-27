# Farthest conflict ranges under independent resampling on the exact axis

The preceding [boundary-weight example](FARTHEST-PAIR-WEIGHTS.md) samples two reflected chords using their common perpendicular bisector and extra discrete localization data. Here the exact unoriented bisector alone suffices. The construction takes place in the plane with four distinct vertices almost surely. It supplies a further research obstruction to a little-oh estimate for conflict ranges.

**Claim.** There are an absolutely continuous site probability $`\mu`$ on the closed unit disk and a symmetric pair law with density $`w`$ relative to $`\mu\otimes\mu`$ such that both endpoint laws equal $`\mu`$ and $`w\in L^p`$ for every finite $`p\ge1`$. Draw a chord and its unoriented perpendicular bisector. Given the bisector, independently draw a second chord from the same conditional law. The resulting four sites almost surely form a proper isosceles trapezoid. The hull vertex fraction of growing independent samples from $`\mu`$ tends to zero in expectation. For arbitrarily large sample sizes $`2m`$, the expected mixed conflict expression satisfies

```math
 \mathbb E\sum_\Delta a_\Delta^{2/3}b_\Delta^{2/3}q_\Delta^{1/3}
 \ge c/m,
```

where $`a_\Delta`$ is its pin-cell mass, $`b_\Delta`$ its farthest conflict-range mass, and $`q_\Delta`$ the probability that all four trapezoid vertices belong to that conflict range. The sample is independent of the trapezoid. The positive absolute coefficient and the law are fixed.

## Giving each outer shell a disjoint interval of bisector offsets

Use three rotationally invariant radial groups of mass one third each. The first two groups have uniform area on the annuli of radii $`[1/8,1/4]`$ and $`[3/8,1/2]`$. For integers $`j\ge1`$, put $`p_j=2^{-j}/3`$, $`s_j=2^{-(j+10)^2}`$, $`\delta_j=s_j^2`$. The third group consists of shells of masses $`p_j`$. On shell $`j`$ take uniform angular coordinate and independent uniform depth $`1-|y|\in[\delta_j/4,3\delta_j/4]`$. These shells are disjoint. Every sampled point almost surely lies in the interior of a positive-density annulus. The local triangle argument of the preceding construction gives the vanishing expected sample hull fraction.

For two distinct sites $`y,z`$, the perpendicular bisector has distance from the origin

```math
 D(y,z)=\frac{\big|\,|y|^2-|z|^2\,\big|}{2|y-z|}.
```

Set the raw density $`W(y,z)=1/p_j`$ on pairs in the same outer shell $`j`$ for which $`D(y,z)\in[100s_j,200s_j]`$. Elsewhere set it to zero. The offset intervals are pairwise disjoint. A raw chord on this shell has length at most $`\delta_j/(200s_j)=s_j/200`$, since the numerator of the offset formula is at most $`\delta_j`$. Its angular span is at most $`s_j/40`$, by the chord formula and the lower radius bound. Thus the row mass $`r(y)=\int W(y,z)\,d\mu(z)`$ is at most $`C s_j`$, in particular less than one half. For every fixed finite $`p\ge1`$ the $`p`$th moment is at most $`C\sum_j p_j^{2-p}s_j\lt\infty`$.

Complete the missing site marginal using chords between distinct groups. Write $`u(y)=1-r(y)`$, and let $`M_A,M_B,M_C`$ be the residual masses of the groups. The first two equal one third, and the third lies between one sixth and one third. For each distinct pair of groups $`i,j`$ with remaining group $`k`$, put $`t_{ij}=(M_i+M_j-M_k)/2`$. These coefficients are positive and their row sums are the respective $`M_i`$. Add the bounded density $`t_{ij}u(y)u(z)/(M_iM_j)`$ between groups $`i,j`$, and zero inside each group. This gives the stated pair law $`w`$. For a cross-group chord the radii differ by at least $`1/8`$, and the triangle inequality in the offset formula gives $`D(y,z)\ge\big||y|-|z|\big|/2\ge1/16`$. Such chords cannot occur at any of the designated raw offsets.

## Conditional resampling on an actual line

Parameterize an unoriented line of positive offset uniquely by its nearest point $`dv`$ to the origin, with $`|v|=1`$ and $`d>0`$. An unordered chord reflected by this line has endpoints $`dv+Mv^\perp\pm hv`$ with $`h>0`$. For an ordered pair one adds the binary choice of endpoint order. The Jacobian for each order is $`4h`$ in normal angle, offset, midpoint position and half-length. Thus given almost every geometric line, the conditional midpoint position and half-length have a joint density. Two independent conditional draws have distinct midpoints and unequal half-lengths almost surely. The endpoints are disjoint and form a nonrectangular isosceles trapezoid. Rotational and reflection symmetry of the density imply that the conditional density on each line is invariant under $`M\mapsto-M`$. This can also be seen in the line coordinates by reflecting the two endpoints across the normal through the origin, keeping the Jacobian unchanged.

For an offset in $`[100s_j,200s_j]`$, both independent chords necessarily come from shell $`j`$. Their half-lengths are at most $`s_j/400`$. For radii $`r_1,r_2`$ of the endpoints,

```math
 M^2=(r_1^2+r_2^2)/2-d^2-h^2 .
```

Consequently $`|M|>9/10`$ and the squared midpoints of any two allowed chords on the line differ by at most $`2\delta_j`$. On the event that the signed midpoint positions have the same sign, they differ by at most $`2\delta_j`$. Every endpoint of the second chord is then at Euclidean distance at most $`2\delta_j+s_j/200`$ from either endpoint of the first. The event has conditional probability one half even when the first chord is fixed.

## Farthest samples and the four-site mass

Use $`s=s_j`$ and $`m=\lfloor1/(s p_j)\rfloor`$. Choose separated directions and antipodal pin sectors as in the [previous farthest-cap calculation](FARTHEST-PAIR-WEIGHTS.md), with pins in the middle annulus. A core target has angular distance at most $`s/4`$ from its center and depth at most $`s^2`$. Its site mass $`b\asymp s p_j\asymp1/m`$, since the eligible shells are exactly those indexed by $`k\ge j`$ and have total mass $`2p_j`$. The enlarged target of angular distance $`21s`$ and depth $`5s^2`$ still excludes the previous shells, and hence has mass at most $`C/m`$. A given source is good, meaning the sample misses the enlargement, with probability bounded below uniformly for large $`j`$. For a good source, its whole core target beats the sample at every pin in that sector by the squared-distance calculation already proved for pin radii between $`1/4`$ and $`1/2`$.

To lower-bound the joint raw mass in a core, restrict the first endpoint's angle to within $`s/16`$ of its center. Restrict its depth to $`[0.25,0.26]\delta_j`$ and the second endpoint's depth to $`[0.70,0.71]\delta_j`$. Give the second endpoint a positive angular separation in $`[0.0030s,0.0035s]`$. Throughout these intervals the radial difference lies in $`[0.44,0.46]\delta_j`$. The chord length divided by the angular separation tends uniformly to one as $`j`$ grows, by squaring the chord length and using $`1-\cos x\sim x^2/2`$. Thus its offset is in $`[100s,200s]`$ throughout for large $`j`$. The $`\mu\otimes\mu`$ mass of these pairs is at least $`c p_j^2 s^2`$, since both radial choices occupy fixed proportions of the shell, and each angular interval has width comparable to $`s`$. Multiplying by the raw density yields $`c p_j s^2`$.

Both original endpoints have angular distance below $`s/8`$ from the core center. On the same-sign event for the conditional companion its endpoints also have angular distance below $`s/4`$, because their Euclidean displacements from the first endpoints are at most $`2s^2+s/200`$ and their radii exceed $`9/10`$. Their shell depths are at most $`s^2`$. The four-site mass in each core is consequently at least $`c' p_j s^2`$, comparable to $`s b`$. A conflict piece meeting positive pin mass from $`h`$ good sectors contains their $`h`$ disjoint targets and has four-site mass at least $`c'hsb`$, while the good pin mass it contains is at most $`\min(a_\Delta,Chs)`$. The [same charging inequality](FARTHEST-PAIR-WEIGHTS.md) gives the claimed expected lower bound.

This law samples the two chords independently given their exact common axis. Its four endpoints have the prescribed site marginal. It concerns a subsequence of sample sizes, which suffices to exclude a universal little-oh estimate under these distributional conditions. The unrestricted finite-set problem still imposes empirical transverse-carrier frequencies and the original near-extremal pin law.

The [finite controls](check_farthest_pair_weights.py) check the offset intervals, marginal-completion matrix and midpoint displacement inequalities using rational bounds.

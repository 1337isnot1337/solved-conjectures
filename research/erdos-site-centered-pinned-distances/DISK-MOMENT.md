# The sharp base-pair moment threshold for the uniform disk

Let $`\mu`$ be normalized area on the unit disk in the plane. Consider random sites $`(X,Y_1,Y_2,Y_3)`$ such that each $`(X,Y_i)`$ has law $`\mu\otimes\mu`$, the bases are exchangeable and almost surely distinct, and all three are equidistant from $`X`$. If their common base-pair law has density $`g`$ against $`\mu\otimes\mu`$, the following threshold is exact.

1. Such a law exists with $`g`$ in weak $`L^{5/2}`$, i.e. $`(\mu\otimes\mu)\{g>t\}=O(t^{-5/2})`$. In particular $`g`$ is square integrable and belongs to every strong $`L^p`$ for $`1\le p<5/2`$.
2. Such a law does not exist with $`g`$ in strong $`L^{5/2}`$.

Thus the common-radius and independence properties of a hypothetical near-extremal finite set can survive a limit with a square-integrable density on pairs of bases. The law below is continuous and is not a finite counterexample to Erdős's site-centered conjecture. The endpoint exclusion gives a quantitative necessary condition on the actual finite bisector completions when a sequence has a uniform-disk limit. [Original question](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/969)

## Constructing the law

Take $`X`$ uniformly in the disk. Given $`X=x`$, draw a radius $`r`$ with the law of the distance from $`x`$ to an independent uniform site. At fixed $`x,r`$ the accessible circle intersects the disk in a circular arc of angular length $`2\theta`$, with $`0<\theta\le\pi`$. A full circle has $`\theta=\pi`$. Endpoints, the center pin and the degenerate radii have probability zero. The angular coordinate of a uniform site given $`x,r`$ is uniform on this arc, by polar coordinates. Parametrize its length linearly by $`t\in[0,1)`$, choosing a measurable start and orientation, and take a fixed start on a full circle.

Independently draw $`U`$ uniformly modulo one and $`V_1,V_2,V_3`$ independently uniformly in $`[0,1/12]`$. Assign the three arc parameters

```math
t_i=U+(i-1)/3+V_i\pmod 1
```

and uniformly permute the labels. Each $`t_i`$ is uniform, so all pin–base laws are exactly independent. The phases are different. For distinct labels the pair of parameters has density at most 12 against uniform product: a pair's first parameter is uniform independent of the noises, and the difference of two independent noises has density at most 12; random permutation preserves the bound. In ordinary interval coordinates $`1/4\le |t_i-t_j|\le3/4`$. Hence for bases $`y,z`$ at distance $`d`$,

```math
d=2r\sin(\theta|t_i-t_j|)\ge c r\theta
```

for an absolute $`c>0`$, since $`\theta|t_i-t_j|\in[0,3\pi/4]`$.

## Pair density

Fix interior distinct $`y,z`$. Write $`L(y,z)`$ for their perpendicular bisector. Conditional on the pin $`x`$ and the first base $`y`$, the second base is supported on the same circle and has arc-length density at most $`12/(2r\theta)`$, supported where $`d\ge c r\theta`$. Integrating over the pin gives an absolutely continuous base-pair law off the diagonal with the bound

```math
g(y,z)\le\frac{C}{d}\int_{L(y,z)\cap D}\frac{\mathbf 1_{d\ge c r\theta}}{\theta}\,d\mathcal H^1(x),
\qquad r=|x-y|.
```

Here $`D`$ denotes the closed unit disk. Indeed the level function $`|z-x|-|y-x|`$ has gradient of norm one in $`z`$ along this circle and norm $`d/r`$ in $`x`$ on its zero set. Applying the coarea formula first with $`z`$, then with $`x`$, gives the displayed line integral. One may first restrict to $`d,r`$ bounded away from zero and then exhaust the complement of the diagonal. The constructed pair puts zero mass on the diagonal. Circle arcs inside the disk also give $`d\le 2r\theta`$.

When $`\theta\ge\pi/6`$, the pin in this integral lies within $`C d`$ of $`y`$, so its allowed line segment has length $`O(d)`$ and the contribution is $`O(1)`$. When $`\theta<\pi/6`$, put $`s=|x|`$. For a partial arc,

```math
\cos\theta=\frac{s^2+r^2-1}{2sr}.
```

If $`r\le1/2`$, a partial arc requires $`s\ge1-r\ge1/2`$, and this formula gives $`\cos\theta\le r/(2s)\le1/2`$, impossible. Thus $`r>1/2`$. For either base $`b=y,z`$, the reverse triangle inequality implies

```math
1-|b|^2\le1-(s-r)^2=2sr(1-\cos\theta)\le sr\theta^2\le C d^2.
```

Moreover $`1/\theta\le2r/d\le4/d`$. The line in the disk has length at most two. Consequently

```math
g(y,z)\le C+C d^{-2}\mathbf 1_{1-|y|\le Cd^2,\ 1-|z|\le Cd^2}.
```

For $`d\le a\ll1`$, the indicated exceptional pairs have measure $`O(a^5)`$. The radial depth of $`y`$ is $`O(a^2)`$, giving area $`O(a^2)`$. The radial depth of $`z`$ is also $`O(a^2)`$, and its angular separation from $`y`$ is $`O(a)`$ since both have radius at least $`1/2`$. This bounds its available area by $`O(a^3)`$. The estimate for $`\{g>t\}`$ follows with $`a=C't^{-1/2}`$. This proves the weak endpoint bound.

## Why the strong endpoint fails

In $`m+1`$ independent uniform disk sites, let $`h_{m+1}`$ be the number of hull vertices and let $`p_m`$ be the probability that two specified sites are co-farthest from some planar point. The sample is almost surely in general position, and its paraboloid upper hull has at most $`3h_{m+1}`$ edges. Hence $`p_m\le6\mathbb E h_{m+1}/(m(m+1))`$.

Here $`\mathbb E h_{m+1}=O(m^{1/3})`$. For completeness choose two putative endpoints of a hull edge and write their supporting line at unsigned distance $`h`$ from the origin. Writing the two points as $`h u+s_1u^\perp,h u+s_2u^\perp`$ with unit normal $`u`$, the change of variables has absolute Jacobian $`|s_1-s_2|`$. Integrating over both chord coordinates therefore contributes $`O((1-h)^{3/2})`$. The smaller cap area is at least $`c(1-h)^{3/2}`$, by integration of disk chord lengths. The probability that all remaining sites miss one side of the edge is at most $`2\exp(-c'(m-1)(1-h)^{3/2})`$. Multiplying by the number of possible pairs and integrating shows $`\mathbb E h_{m+1}\ll m^2 m^{-5/3}`$ as claimed. Thus $`p_m=O(m^{-5/3})`$.

For any law as in the theorem, draw $`X,T_1,\ldots,T_m`$ independently with distribution $`\mu`$. For each $`j`$ use its conditional mate law given $`X,T_j`$ to sample $`Z_j`$, independently of the other $`T_i`$ once $`X,T_j`$ are given. For a farthest sampled $`T_j`$ from $`X`$, the sites $`T_j,Z_j`$ are two distinct co-farthest sites of $`\{T_1,\ldots,T_m,Z_j\}`$. The pair $`(T_j,Z_j)`$ has the hypothesized base-pair density and is independent of the other $`m-1`$ sample sites. Under the product law the co-farthest event has probability $`p_m`$. Truncating $`g`$ at $`B`$ and applying Hölder to its tail yields

```math
1\le m B p_m+m\|g\mathbf 1_{g>B}\|_{5/2}\,p_m^{3/5}.
```

At fixed $`B`$ the first term vanishes with $`m`$, and the multiplier $`m p_m^{3/5}`$ is bounded. Strong $`L^{5/2}`$ would send the remaining upper bound to zero as $`B\to\infty`$, a contradiction. This proves the endpoint assertion. The same argument applies to any nonatomic limiting distribution in general position with expected sample hull size $`O(m^\beta)`$ for $`0\le\beta<1`$: strong $`L^{(2-\beta)/(1-\beta)}`$ is then excluded.

## Consequence for finite sets

Suppose planar sets with a site-centered capacity of three have total pinned counts $`(1/3+o(1))n^2`$, and after similarities their empirical distributions converge to uniform disk area. For a distinct ordered pair $`y,z`$ let $`a(y,z)`$ be its number of active pin completions. Then

```math
\frac{1}{n^2}\sum_{y\ne z} a(y,z)^{5/2}\longrightarrow\infty .
```

Otherwise pass to a subsequence with bounded moments. For the uniform ordered good quadruple, its base-pair density against the empirical product is $`n^2a(y,z)/(6A_3)`$ with $`6A_3=(2+o(1))n^2`$, where $`A_3`$ counts all full pin–radius classes. The marginals are tight, so extract a weak limit of the joint laws. The equal-distance relation is closed and the pin–base projections converge to the independent product. Hölder against bounded continuous functions of the base pair passes to the limit and gives a bounded functional on $`L^{5/3}(\mu\otimes\mu)`$. Density of continuous compactly supported tests and duality yield a limiting base-pair density in strong $`L^{5/2}`$. Such a pair is almost surely distinct. This contradicts the endpoint exclusion.

The disk hull estimate is classical and the farthest-sampling idea comes from the [repository's earlier argument](../erdos-654-arbitrary-collinearities/FARTHEST-SITES.md). The construction isolates the exact moment obstruction in that method. Bounded searches for uniform-disk equal-radius couplings, the active-bisector formulation of the pinned-distance problem, and its earlier formal and geometric sources located no previous version of the matching weak and strong endpoints. The result concerns a continuum relaxation and a necessary finite condition; the full finite local-capacity question remains open. [Scope and prior-source audit](https://github.com/1337isnot1337/solved-conjectures/issues/969)

## Exact finite checks

Run `python3 check_bisector_moments.py` in this directory. The checker exhausts 435 locally capped subsets of the three-by-three grid, including 21 with a prescribed concyclic quadruple. It checks 204 full pin–radius classes, 30,744 optimal nominations, 12,405 site-witnessed co-farthest graphs, and 36,000 discrete angular triples with their exact marginal and joint counts. These checks exercise the identities and support restrictions; the analytic proof gives the asymptotic conclusion. [Checker](check_bisector_moments.py)

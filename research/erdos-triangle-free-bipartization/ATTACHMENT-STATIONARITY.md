# Attachment stationarity at an Erdős bipartization extremizer

A globally maximizing triangle-free graphon has a common distribution of optimal cuts that balances degree derivatives and cannot split any independent set too evenly on average. This is a necessary condition for a maximizer in [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution.

Let W maximize the ordered minimum monochromatic mass m over triangle-free graphons. Use fractional cuts q taking values in [0,1], with ordered cost F(q)=∫∫W(x,y)[q(x)q(y)+(1−q(x))(1−q(y))]. Let Q be the weak-L² compact set where F(q)=m. Its existence and equality with the minimum over measurable cuts are in [vertex-weight stationarity](GRAPHON-EXTREMIZERS.md). Define the internal degree g_q there, so ∫g_q=m. For every measurable independent set I, define

```math
 b_I(q)=\min\left(\int_I q,\int_I(1-q)\right).
```

There is a probability measure σ on Q such that

```math
 \int_Q g_q\,d\sigma(q)=m \quad\text{weakly in } L^2,
 \qquad
 \int_Q b_I(q)\,d\sigma(q)\le m
 \quad\text{for every independent }I.
```

Crucially, the same σ works for all I. Equivalently the expected absolute cut imbalance on any independent I is at least its mass minus 2m. If desired the measure can be supported on indicator cuts.

## First variation with independently attached classes

Fix a finite list of independent sets I_j and coefficients a_j≥0, with sum A. Add new disjoint independent classes of mass t a_j, with no edges between them. Join the jth class completely to I_j. This preserves triangle-freeness even when the sets I_j overlap. Simultaneously reweight the original space by 1+t(h−A), with bounded h of integral zero. The total mass remains one.

Fixing an original fractional cut q, it is optimal to place each new class wholly on the side that pays its smaller attachment cost. Uniformly in q the resulting ordered cost on the enlarged graphon is

```math
 F(q)+2t\left[\int h g_q-AF(q)+\sum_j a_j b_{I_j}(q)\right]+O(t^2).
```

The error is uniform because all kernels, cut variables and h are bounded. For example, changing the original mass density in an attachment term alters it by O(t) before multiplication by the new class mass. The bracket is weakly continuous: the original graphon operator is compact, and the remaining functions are weakly continuous linear integrals or minima of two of them. The derivative of the new optimal cost at t=0 from the right is the minimum of twice the bracket over Q. For the lower bound in this assertion, take weak subsequential limits of minimizing original cuts as t decreases to zero; uniform error forces their limits into Q. The upper bound follows by testing old optima. Thus extremality gives

```math
 \min_{q\in Q}\left(\int h(g_q-m)+\sum_j a_j(b_{I_j}(q)-m)\right)\le0
```

for every such h and finite nonnegative combination of attachments.

## Obtain a common distribution

Choose finitely many mean-zero bounded test functions h_i and independent sets I_j. In the finite-dimensional space of their expectation coordinates, take the compact convex hull of the vectors with coordinates ∫h_i(g_q−m) and b_(I_j)(q)−m. It must meet the cone with all first coordinates zero and all second coordinates nonpositive. Otherwise strict separation from that cone would give a linear combination of the h_i and nonnegative a_j contradicting the first-variation inequality. The intersection is equivalent to a distribution on Q satisfying these finitely many equalities and inequalities.

The probability measures on compact metrizable Q form a compact space in the weak topology. All the constraints above are closed, so the finite-intersection property supplies one σ for all bounded test functions and independent sets. Bounded tests suffice by approximation in L² and the uniform bound on g_q.

For the optional indicator version, at a fractional optimum q the region where 0<q<1 is independent, as proved in [vertex-weight stationarity](GRAPHON-EXTREMIZERS.md). Replace q by its indicator at a common uniform random threshold in (0,1). Every rounding is still optimal. On edges at most one endpoint is fractional, so averaging the rounded internal degrees recovers g_q. Attachment costs in expectation can only decrease, by concavity of b_I. The rounding map is measurable into weak L², for example by bounded continuous approximation of the threshold test.

This yields a concrete obstruction to a proposed extremizer: it suffices to find finitely many independent sets and a weight perturbation whose displayed first-variation minimum is strictly positive. This operation is stronger than vertex reweighting alone, since an allowed independent attachment need not equal any existing vertex neighborhood. The historical [bipartization paper](https://www.renyi.hu/~p_erdos/1988-12.pdf) and [current dense-tail proof](https://arxiv.org/html/2103.14179) give the context; this note does not assert that the new obstruction rules out all graphons in the open density band.

## Finite rooted inequalities for the unrestricted problem

At least one global maximizer W can be chosen zero-one: replace W by the indicator of its support. This does not introduce a positive triangle density and can only increase its minimum monochromatic mass. Use the indicator-cut distribution above, and encode each cut by its sign s.

Fix k roots r, and fix a pairwise-intersecting family of nonempty subsets of the k root labels. Let I(r) consist of vertices whose adjacency profile belongs to that family. This is independent for almost every r: any two such profiles share a root, so a positive edge between them would make a triangle. In particular, with three roots, all vertices adjacent to at least two of them form an independent set. That set need not lie in any individual neighborhood. For example, in the Petersen graph on the two-subsets of {1,2,3,4,5}, with adjacency by disjointness, the roots {1,2},{1,3},{1,4} give I={{2,5},{3,5},{4,5}}.

For a rooted flag event τ depending only on the unsigned root graph, choose any rational c≥0. Let X,Y be fresh independent draws. Attachment stationarity gives the following linear inequality in signed graph densities on at most k+2 draws:

```math
 \mathbb E\!\left[\mathbf 1_\tau\left(
  \mathbf 1_{\{X,Y\in I(r)\}}s(X)s(Y)
  -2c\,\mathbf 1_{\{X\in I(r)\}}
  +4c\,W(X,Y)\mathbf 1_{\{s(X)=s(Y)\}}+c^2
 \right)\right]\ge0.
```

Here the same random optimum cut is used for the two terminal signs, independently of the roots. To prove it, write a=μ(I(r)) and Z=∫_(I(r))s. Attachment stationarity gives E_s|Z|≥a−2m, hence E_s Z²≥(a−2m)_+²≥2c(a−2m)−c². The fresh-pair same-side edge term has conditional expectation exactly m for every cut and every root tuple. Substitute the sampling expressions for a and Z², then multiply by the root indicator and average. The order bound does not require sampling a separate set of endpoints for the m term: the summands use the same two fresh vertices but are added, not multiplied. These rows are necessary for an extremizing signed law, not for arbitrary near-optimal cuts or arbitrary triangle-free graphs. One may use the full small-order induced-density expansions, not a fixed-order claim about G.

The simultaneous degree equations also have finite rooted rows. For any unsigned root event τ with one distinguished root R_1, the expectation of 1_τ times W(R_1,X) times the indicator of equal signs is m times the probability of τ. To encode the right side, use W(X,Y) and the equal-sign indicator of X,Y in place of W(R_1,X) and its sign indicator. This follows from the weak degree identity by taking the conditional root-event probability given R_1 as a bounded test function.

## Why this goes beyond reweighting alone

On the balanced seven-cycle, the uniform mixture of the seven cuts missing one each of the seven edges has degree profile equal to its ordered cost, 2/49. For each translated copy of the independent set {0,2,4}, the two sides split it nontrivially for four of the seven omitted edges. Thus its mean attachment cost is 4/49. More strongly, averaging this attachment over the seven possible translates gives 4/49 for every optimal cut, so no alternative mixture can satisfy the attachment constraints for all seven sets. A fractional optimum cannot do better on these constraints: its randomized indicator rounding preserves degree balance and can only reduce attachment costs, as proved above. This example is not a conjectural extremizer; it separates the two stationarity tests exactly.

The next step is to determine whether the new rows, ordinary graphon moment positivity, and the medium-density constraints exclude all globally maximizing counterexamples. No claim of LP or SDP infeasibility is made here.

## Neighborhood-cover consequence

Use an indicator-cut distribution as above. For almost every x, local flip optimality means that b_(N(x))(q) equals g_q(x) for almost every sampled cut. This follows by the pointwise degree inequality from one-sided variations, followed by Fubini for the cut distribution. Thus the expected attachment value of the whole neighborhood is exactly m for almost every x.

For almost every edge xy, put X=N(x), Y=N(y). These are disjoint independent sets. If A⊆X and B⊆Y have no edges between them, then A∪B is independent. Its attachment is at least the sum of the attachments of A and B, by taking the minimum of the two side sums on each disjoint set. Removing a subset of an independent neighborhood lowers its attachment by at most the larger of the two removed side masses, which is in turn at most the removed total mass. Averaging the attachment inequalities therefore gives

    μ(X\A)+μ(Y\B) ≥ m.

In fact the left side can be replaced by the expected sum of the two **larger removed side masses** under the one common distribution of cuts. Thus every measurable vertex cover of the cross edges between X and Y has mass at least m. In particular at least m vertices by mass in each neighborhood meet the other neighborhood in positive edge measure: deleting exactly that incident support on one side is a cover. The incident-support fact alone is not new: by Fubini almost every wedge already has endpoints of positive codegree in any graphon. The new requirement concerns *all* covers, not just incident sets. No uniform quantitative lower bound on the four-cycle density conditioned on an edge follows solely from this argument: a bipartite neighborhood graph can have many tiny matching blocks whose cover mass is large relative to its edge mass.

## Fragmentation of the neighborhood graph forces tiny cut margins

There is also a constraint beyond total cover mass. For almost every edge xy, retain X=N(x), Y=N(y). Write Δ_q(v)=d(v)−2g_q(v) for the nonnegative local margin, and define

    T(x,y)=E_q [1[x,y have opposite signs] min(Δ_q(x),Δ_q(y))].

Delete any measurable separator F⊆X∪Y of mass f and partition the remainder into countably many measurable blocks of masses a_j, with no cross edges between distinct blocks. Then

    T(x,y) ≤ f + (1/2)√(∑_j a_j²).

Indeed, independently choose with probability 1/2 either the X-side or the Y-side of each block. The union I of the chosen sides is independent for every outcome, so E b_I≤m. Conditional on q, its mass has mean (μ(X∪Y)−f)/2. Its signed mass has mean one half of the signed mass of the undeleted union and variance at most (∑a_j²)/4. Thus E[b_I | q] is at least half the attachment of the undeleted union minus (1/4)√(∑a_j²), by the triangle inequality for the mean and Cauchy–Schwarz for the deviation. Removing F lowers the whole union's attachment by at most f. Finally b_(X∪Y)(q)=b_X(q)+b_Y(q)+1[x,y opposite] min(Δ_q(x),Δ_q(y)): the additional minimum is exactly what results when the neighborhood majority sides disagree. Both neighborhood terms have expectation m. Substituting gives the inequality.

For scale, let p be the ordered edge density and suppose p>3m. For a fixed optimum let L={v:Δ_q(v)≤t}. The total crossing degree integrated over L is at most m+t, because that degree is g_q+Δ_q. Hence crossing edges with both margins above t have ordered mass at least p−3m−2t. Over ordered pairs,

    ∫∫ W(x,y) T(x,y) dxdy ≥ (p−3m)²/8,

by choosing t=(p−3m)/4 and averaging over optimum cuts. In particular an extremizer in this regime cannot have almost all of its edge-neighborhood graphs fragmentable into arbitrarily small blocks by arbitrarily small vertex removals. This only bounds fragmentation in the sense of vertex mass, not edge density of the neighborhood graph.

## Quantitative version near the global maximum

Let m be the ordered cut cost of any triangle-free graphon, and let δ>0 be its deficit from the global maximum. If t=√δ≤1/8, there is one distribution over fractional cuts q with F(q)≤m+3t for which

    ||E g_q−m||_1 ≤ 7t,
    E b_I(q) ≤ m+2t for every independent I.

To see this, normalize test directions by ||h||_∞+A≤1, where A is the sum of the nonnegative attachment masses a_j before multiplying by t. In the perturbed cost formula the linear bracket B(q)=∫h g_q−A F(q)+∑a_j b_(I_j)(q) has |B(q)|≤1. The quadratic remainder has absolute value at most 3t²: the original reweighting contributes at most t² and the attachments at most 2t². Let q minimize the perturbed cost, which is at most m+δ by definition of the global maximum. It follows that F(q)−m≤δ+2t+3t²≤3t. With J(q)=B(q)+A(F(q)−m), the same upper bound on the optimum gives

    (1−2tA)(F(q)−m)+2t J(q)≤δ+3t²,

hence J(q)≤2t. The preceding compact separation argument on the sublevel set F≤m+3t therefore gives a common distribution with |E∫h(g_q−m)|≤2t for every bounded mean-zero h of norm at most one, and the stated attachment inequalities. For the L¹ estimate, put f=E g_q−m and test against one half the difference between sign(f) and its mean. This bounds ||f||_1≤4t+|∫f|≤7t. The exact theorem concerns δ=0. This approximate statement does not claim that rounding all near-optima preserves their costs exactly.

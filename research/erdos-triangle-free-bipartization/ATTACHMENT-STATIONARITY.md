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

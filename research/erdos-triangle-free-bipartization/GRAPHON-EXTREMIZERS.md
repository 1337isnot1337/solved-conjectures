# Optimal cuts and vertex-weight stationarity

This note records an exact graphon reduction for [Erdős #23](https://www.erdosproblems.com/23). It does not eliminate the middle-density case.

## A maximum cut exists for every triangle-free graphon

For W:[0,1]²→[0,1] symmetric with t(K₃,W)=0, write T for its Hilbert–Schmidt operator and d=T1. For q:[0,1]→[0,1] define the fractional ordered monochromatic mass

    F(q)=∫∫ W(x,y) [q(x)q(y)+(1−q(x))(1−q(y))] dxdy.

The box 0≤q≤1 is weakly compact in L². The functional is weakly continuous on the box because T is compact and F is a quadratic plus a linear term. Hence there is a fractional optimizer q. For S_j={1/j≤q≤1−1/j}, variation in both directions by bounded test functions supported in S_j implies the first-order equation Tq=d/2 there and ⟨h,Th⟩≥0 for all such h. The second inequality extends to all L² tests supported there by approximation, so the restriction of T to S_j×S_j is positive semidefinite.

A triangle-free graphon operator cannot be positive semidefinite unless its kernel vanishes a.e. Indeed the trace of its cube is the triangle integral, zero; its nonnegative eigenvalues then have zero sum of cubes, so all vanish. The trace identity follows by finite-rank approximation in Hilbert–Schmidt norm; triple products are continuous in that norm. Apply this on S_j and take the increasing union S={0<q<1}, obtaining W=0 a.e. on S². Because Tq=d/2 a.e. on S, changing q on S to any 0/1 assignment has zero first-order term, and no second-order term because W vanishes on S². The rounded q is an actual measurable cut of optimal value. In particular m(W)=min F(q) with no loss or failure of attainment.

## A necessary condition at an extremal graphon

Let W maximize m on all triangle-free graphons. Existence follows from cut-compactness and continuity as detailed in [ROOT-CONVERGENCE.md](ROOT-CONVERGENCE.md). One can choose a binary maximizer: replace any maximizer by 1[W>0], which is still triangle-free since the original triangle integral is zero; pointwise monotonicity of the cut objective preserves maximality.

For each fractional optimal cut q define its internal degree function

    g_q(x)=q(x)Tq(x)+(1−q(x))T(1−q)(x).

This has integral m(W). I claim the constant function m(W) lies in the weakly closed convex hull of these degree functions. Thus optimal cuts, allowed to vary, can make the internal degrees arbitrarily close in weak convex combination to the same value everywhere. This is stronger than merely averaging each cut's total cost.

Let h be any bounded mean-zero test function. Reweight vertices by probability density 1+t h for small t>0. This defines another triangle-free graphon after reparametrizing the atomless probability space. The cut cost becomes

    F_t(q)=F(q)+2t∫h g_q + O(t²),

where the remainder is uniform over q since W,q are bounded. The map q↦g_q is weakly continuous on the box: Tq converges strongly along weakly convergent q, and multiplying this strong factor by uniformly bounded weakly convergent q preserves weak convergence. For L² test functions, first use bounded tests and then approximate using the uniform bound on g_q.

The right derivative of min_q F_t(q) at zero is min_{q optimal} 2∫h g_q. For the upper bound test any optimal q. For the lower bound, take optimal q_t along a sequence t↓0, extract a weakly convergent subsequence using weak compactness and metrizability on the bounded box, and use uniform perturbation to see its limit is optimal. The first-order coefficient converges by weak continuity; the nonnegative difference F(q_t)−min F cannot hurt the lower bound. Since W is a global maximizer, the derivative is nonpositive for every such h. Separation in the weak topology now gives the claim: any separating L² test could be centered (all integrals g_q equal m(W)); it could also be truncated with a uniform error since 0≤g_q≤1, yielding a bounded mean-zero separator in contradiction to these derivative inequalities.

At each optimum g_q≤d/2 a.e. This follows from one-sided first-order variations where q=0 or 1, and equality Tq=d/2 in the fractional region. The weakly closed convex hull still satisfies this order inequality, so

    d(x) ≥ 2 m(W)   almost everywhere.

For a counterexample with ordered monochromatic mass above 2/25, this yields d>4/25 a.e. It is the exact limiting analog of the elementary vertex-removal degree bound, with the additional optimal-cut balance identity. It does not assert that any single cut has constant internal degree.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

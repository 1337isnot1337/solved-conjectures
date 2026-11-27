# Independent review of ordering the central type-A translates

27 November 2026 UTC. A separate Codex reviewer in the WadeDavis research session reconstructed the ordering argument by induction, including the normalization factor and the reflected endpoints. Fix $`\alpha>0`$. For the primal lattice $`A_{N-1}`$ in its standard Euclidean normalization, the Gaussian masses at central classes of levels $`k=0,\ldots,\lfloor N/2\rfloor`$ are strictly decreasing as $`k`$ increases. In particular the deepest central classes are uniquely minimal among *central* classes up to inversion. This conclusion leaves the comparison with noncentral translates at the outstanding finite ranks and intermediate scales open.

Define $`g_N(k)=\sum_{m\in\mathbb Z^N,\,\sum_i m_i=k}\exp[-\alpha(\sum_i m_i^2-k^2/N)]`$. It is even in integer $`k`$ and periodic modulo $`N`$ by a simultaneous unit translation. Taking $`M=N-1`$, put $`j=\sum_{i\le M}m_i`$. The identity

```math
\frac{j^2}{M}+(k-j)^2-\frac{k^2}{N}
=\frac{N}{M}(j-Mk/N)^2
```

gives $`g_N(k)=\sum_{j\in\mathbb Z}e^{-\beta(j-x)^2}g_M(j)`$ at $`x=Mk/N`$ and $`\beta=\alpha N/M`$. The base case is $`g_1\equiv1`$.

Write $`q(s)=\sum_{r\in\mathbb Z}e^{-\beta(s+rM)^2}`$ and $`K(x,y)=q(x-y)+q(x+y)`$. Up to a common positive normalization this is the reflected Neumann heat kernel on $`[0,M/2]`$ at time $`1/(4\beta)`$. Fold $`j`$ into the integer sites $`0\le j\le M/2`$. Each interior representative has weight one multiplying $`K`$; the representative zero and, for even $`M`$, the representative $`M/2`$, have weight one half. Hence the normalized summation is the mean of the folded $`g_M`$ with respective weights $`w_jK(x,j)`$. At $`M=1`$ only the single fixed class occurs and this normalized mean is constant.

For $`x_1\lt x_2`$ and $`u\lt v`$ on this interval the determinant $`K(x_1,u)K(x_2,v)-K(x_1,v)K(x_2,u)`$ is nonnegative. Take two independent reflected Brownian motions, starting in the indicated order, and two disjoint ordered terminal intervals around the desired endpoints. Swapping their futures at their first coincidence, by the strong Markov property and their common transition law, pairs the coincident paths in the two opposite terminal orderings. Continuous paths with reversed ordering must have coincided. The difference of the two joint terminal probabilities is therefore nonnegative. Shrinking the terminal intervals and using continuity gives the determinant inequality in the interior. Continuity also handles the boundary values; only nonnegativity is required. This is the two-particle coincidence identity. [Karlin and McGregor](https://msp.org/pjm/1959/9-4/pjm-v9-n4-p13-p.pdf)

For a decreasing folded profile, the normalized mean is nonincreasing as $`x`$ grows. On cross-multiplying the two means at $`x_1,x_2`$ and pairing the terms indexed by $`u\lt v`$, the difference has numerator equal to the sum of $`w_u w_v(g_M(u)-g_M(v))`$ times the nonnegative determinants just described. All denominators and terms of the normalized means are positive.

Finally the unnormalized kernel mass is $`\sum_{j\in\mathbb Z}e^{-\beta(j-x)^2}`$. At $`x=Mk/N=k-k/N`$ this equals the unit-period theta mass at $`k/N`$. By Poisson summation and Jacobi's product its positive factors depending on this angle are $`1+2q_0^{2r-1}\cos(2\pi k/N)+q_0^{4r-2}`$, with $`q_0=e^{-\pi^2/\beta}`$. Each decreases strictly between any two angles with $`0\le k/N\le1/2`$. The convergent positive product is strictly decreasing there (one strict factor suffices). As $`k`$ increases along the indicated integers, $`Mk/N`$ stays in the reflected interval and increases. The product of this strictly decreasing positive mass and the nonincreasing positive mean proves the induction including both parity endpoints. [Jacobi's product formulas](https://dlmf.nist.gov/20.5)

[Reviewed proof](ALL-CENTRAL.md) · [Exact finite checks](check_central_order.py)

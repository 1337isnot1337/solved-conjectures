# Alexandersson’s graphical dist conjecture

**Theorem.** For every open disk in the complex plane and every positive integer $k$, a finite connected chordal graph of treewidth two, with a suitable vertex order, has at least $k$ distinct nonreal zeros of its graphical dist polynomial in that disk. In particular the zeros are dense in the whole complex plane.

The polynomial counts acyclic orientations by the number of distinct positive earlier indegrees. The statement strengthens the [candidate disproof](../../results/alexandersson-graphical-dist/proof.md) under review in [issue 823](https://github.com/1337isnot1337/solved-conjectures/issues/823). Here two groups of vertices probe opposite ends of a common oriented edge. Their response probabilities can be tuned separately. [Original conjecture](https://github.com/PerAlexandersson/RealRooted/issues/2641)

## Two response probabilities with one common threshold

Start with an edge $uv$. Attach $3r$ pairwise nonadjacent vertices $w$ to both endpoints. For each of $2r$ of these distinguished vertices attach $m_\alpha$ new vertices to the edge $uw$; for each of the remaining $r$ attach $m_\beta$ vertices to $vw$. Each new vertex is adjacent just to the endpoints of its indicated edge. Order $u,v$ first, then all the new vertices, and finally the distinguished vertices. Each earlier indegree outside the distinguished set is at most one.

In a uniform random acyclic orientation a vertex attached to an oriented edge chooses uniformly one of the three gaps in the total order on its two endpoints. Each of these choices extends the earlier orientation, and no other choice does: a directed path through the new vertex can be shortened along the old edge unless the triangle itself is cyclic. Consequently all choices in the construction order are independent. Conditional on the direction of $uv$, they are independent across distinguished vertices and their attached groups.

For a distinguished $w$ with satellites attached to $sw$, where $s$ is $u$ or $v$, let $B$ denote $s\to w$. Conditional on the core triangle, the earlier indegree of $w$ is $g+\mathrm{Bin}(m,2/3)$ if $B$ holds, and $g+\mathrm{Bin}(m,1/3)$ otherwise, where $g$ is its indegree from $u,v$ and belongs to $\{0,1,2\}$. This follows by counting the gaps which put each satellite before $w$. Conditional on $u\to v$, $B$ has probability $2/3$ for $s=u$ and $1/3$ for $s=v$. Reversing $uv$ interchanges these probabilities.

Fix any $\alpha,\beta\in(0,1)$. Let the integer threshold $L$ tend to infinity. For each $\gamma\in\{\alpha,\beta\}$ choose $m_\gamma=\lfloor3L/2+s_\gamma\sqrt L\rfloor$ with $\Phi(2s_\gamma/\sqrt3)=\gamma$, where $\Phi$ is the standard normal distribution function. Conditional on $B$, the chance that the earlier indegree exceeds $L$ tends to $\gamma$ by the binomial central limit theorem, uniformly in the three possible $g$. Indeed its mean is $L+(2s_\gamma/3)\sqrt L+O(1)$ and its standard deviation is asymptotic to $\sqrt{L/3}$. Conditional on the opposite direction this chance tends to zero since the mean is $L/2+O(\sqrt L)$ and the variance is $O(L)$.

For fixed $r$, the probability that two distinguished earlier indegrees agree tends to zero. After fixing their core triangles the two binomial parts are independent, and the largest point probability of either is $O(L^{-1/2})$ by Stirling's formula. Thus the number $J_L$ of **distinct** values above $L$ agrees with the number of threshold exceedances with probability tending to one.

Define the two linear factors
```math
 U_\gamma(t)=1+\tfrac{2\gamma}{3}(t-1),\qquad V_\gamma(t)=1+\tfrac{\gamma}{3}(t-1).
```
The conditional probabilities and independence give coefficientwise convergence of $\mathbb E[t^{J_L}]$ to $(P(t)^r+Q(t)^r)/2$, where
```math
 P=U_\alpha^2 V_\beta,\qquad Q=V_\alpha^2 U_\beta.
```

## Placing zeros in an arbitrary disk

Choose a smaller open disk wholly off the real axis with closure in the target disk, and any point $z$ in it. For $\gamma$ close to zero set $f(\gamma)=\log|U_\gamma(z)/V_\gamma(z)|$. All factors are nonzero there. We have $f(0)=0$, and $f$ is nonzero for all sufficiently small $\gamma>0$. Indeed if $\operatorname{Re}(z-1)\ne0$ its linear coefficient is $\operatorname{Re}(z-1)/3$. Otherwise $z-1$ is purely imaginary and nonzero, so $|1+2\gamma(z-1)/3|>|1+\gamma(z-1)/3|$. Choose such a small $\beta>0$. Continuity gives an $\alpha\in(0,\beta)$ with $2f(\alpha)=f(\beta)$. Thus $|P(z)/Q(z)|=1$.

The rational function $H=P/Q$ is nonconstant. Otherwise its value at one would force $H\equiv1$, requiring the square of the nonconstant Möbius function $U_\alpha/V_\alpha$ to equal the Möbius function $U_\beta/V_\beta$. Their degrees as rational maps are two and one. On a sufficiently small neighborhood of $z$ within the smaller disk, $Q\ne0$ and $H$ is holomorphic. By the open mapping theorem its image contains an open arc of the unit circle around $H(z)$. For large enough $r$, this arc contains at least $k$ distinct solutions of $\zeta^r=-1$. Each has a preimage in the neighborhood, and these preimages are distinct zeros of $P^r+Q^r$. All lie off the real axis and away from zero. Multiplicities are immaterial: choose pairwise disjoint disks about $k$ of these zeros with boundaries free of zeros and closures inside the chosen disk.

## Transferring the zeros to finite connected graphs

For fixed $r,L$, add $R$ copies of an $L$-edge star, identifying one leaf of each with $u$. Put the new leaves before their respective centers, all after the core. Their orientations are uniform and independent of the core, since the attachment vertex is the only intersection. The number of earlier edges pointing into each center has the $\mathrm{Bin}(L,1/2)$ law. As $R\to\infty$, with probability tending to one every integer $1,\ldots,L$ occurs at a center. No added vertex supplies a larger value.

Let $K$ be the number of distinct positive earlier indegrees in the whole graph. It satisfies $K\le L+3r$. For fixed $r,L$, the reciprocal polynomial $t^{L+3r}\mathbb E[t^{-K}]$ therefore converges coefficientwise as $R\to\infty$ to $\mathbb E[t^{3r-J_L}]$. As $L\to\infty$, this last polynomial of fixed degree at most $3r$ converges to the reciprocal of $(P^r+Q^r)/2$ in degree $3r$. Take the images under inversion of the $k$ disjoint zero disks above. Their closures avoid zero and their boundaries contain no zeros of this reciprocal. Rouché's theorem first gives a sufficiently large $L$, then a sufficiently large $R$, for which all $k$ regions contain reciprocal zeros of the finite-graph polynomial. Inverting again gives the desired $k$ distinct nonreal zeros. Normalizing the orientation count does not change them.

The core was built by adjoining vertices to edges, so it is a 2-tree. The attached trees preserve chordality and treewidth, and the result is connected. This proves the theorem.

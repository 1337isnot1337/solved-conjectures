# High-minimum-degree padding and the sharp bipartite occupancy ratio

For a finite nonempty graph $G$ write $\alpha(G)$ for its independence number and $M_\lambda(G)$ for the expected size of a hard-core independent set at fixed fugacity $\lambda>0$. We prove
```math
\inf_{\substack{G\text{ triangle-free}\\ \delta(G)\ge d}}
 \frac{\alpha(G)}{M_\lambda(G)}
=\inf_{G\text{ triangle-free}}\frac{\alpha(G)}{M_\lambda(G)}
\tag{1}
```
for every integer $d\ge0$. The same holds within bipartite graphs, where this common infimum is exactly $(1+2\lambda)/(2\lambda)$. These results address minimum degree, not regularity or a simultaneous maximum-degree bound.

**Priority.** The original asymptotic lower conjecture at $\lambda=1$, [Davies–Jenssen–Perkins–Roberts, Conjecture 2](https://eprints.lse.ac.uk/86642/1/Davies_Average%20size%20of%20independent%20sets_2018.pdf), also [Davies–Kang, Conjecture B](https://arxiv.org/html/2501.03379), was already refuted by the regular family $C_5\square K_{m,m}$ in [*The Problem Is the Problem*, Appendix C.3](https://arxiv.org/html/2608.16977#A3.SS3). The construction below is different: no pre-existing conjecture resolution or separate resolution count is claimed. It gives a reduction showing exactly what a minimum-degree assumption can and cannot do on this ratio, and solves the associated bipartite infimum.

## Padding that preserves the ratio

Fix a nonempty $H$ in the class and a proper $q$-coloring with nonempty color classes. For the bipartite class use a proper coloring with at most two colors. For $T\ge1$, take the disjoint union of $T$ copies of $H$. For every color $a$ add a cluster $U_a$ of $d$ new independent vertices, each adjacent to every vertex of color $a$ in the copies. There are no edges between or within the new clusters. The resulting graph $G_{T,d}$ is triangle-free if $H$ is: a new vertex has an independent neighborhood, and any triangle without a new vertex would be in one copy. For a bipartite $H$, place each new cluster on the opposite side from its color; the graph remains bipartite. Every old vertex has degree at least $d$, and each new vertex has degree at least $T$, so $\delta(G_{T,d})\ge d$ when $T\ge d$.

The independence numbers obey
```math
T\alpha(H)\le\alpha(G_{T,d})\le T\alpha(H)+qd.
```
Let $Z_F(\lambda)$ denote the independence polynomial of $F$ evaluated at $\lambda$. If no new cluster is used in the random set, the total weight is $Z_H(\lambda)^T$, and conditionally the $T$ copies have independent hard-core distributions. If the exact set of occupied clusters is a nonempty $J\subseteq[q]$, the old vertices of those colors must all be vacant. Writing $H_J$ for $H$ with all those colors deleted, this event has total weight
```math
\bigl((1+\lambda)^d-1\bigr)^{|J|}\, Z_{H_J}(\lambda)^T.
```
For every nonempty $J$, $Z_{H_J}(\lambda)<Z_H(\lambda)$, since at least one positive-weight singleton of $H$ was removed. Thus with $\rho=\max_{J\ne\varnothing} Z_{H_J}(\lambda)/Z_H(\lambda)<1$, the probability that any new vertex is occupied is at most $(1+\lambda)^{dq}\rho^T$. Since every outcome has size at most $T|V(H)|+qd$, we deduce
```math
M_\lambda(G_{T,d})=T M_\lambda(H)+o(T)
```
whenever $T\to\infty$ and $d=o(T)$, including fixed $d$. Therefore $\alpha(G_{T,d})/M_\lambda(G_{T,d})\to\alpha(H)/M_\lambda(H)$. For a fixed threshold $d$, taking the infimum over $H$ proves (1) and its bipartite analogue; the reverse inequality is immediate by inclusion. One may also take $d\to\infty$ along a single family, e.g. $d=\lfloor\sqrt T\rfloor$.

For instance $H=K_2$ gives bipartite ratios tending to $3/2$ at $\lambda=1$. Taking $H=C_5$ gives triangle-free ratios tending to $22/15$, since $\alpha(C_5)=2$ and $M_1(C_5)=15/11$. We do not determine the unrestricted triangle-free infimum.

## Exact universal bipartite bound

Let $G$ be bipartite with $n$ vertices and maximum matching size $m$. Partition the vertices into the $m$ matched edges and $n-2m$ remaining singletons. For each matched edge, condition on the independent set outside that edge. If both endpoints are available, their conditional total occupancy is $2\lambda/(1+2\lambda)$; if one or neither is available it is $\lambda/(1+\lambda)$ or zero. Each remaining singleton has conditional occupancy at most $\lambda/(1+\lambda)$. Hence
```math
M_\lambda(G)
 \le m\frac{2\lambda}{1+2\lambda}
      +(n-2m)\frac{\lambda}{1+\lambda}
 \le (n-m)\frac{2\lambda}{1+2\lambda}.
```
König's theorem gives $\alpha(G)=n-m$. The bound is attained on every nonempty disjoint union of edges. Conversely, equality requires no unmatched singleton, since $\lambda/(1+\lambda)<2\lambda/(1+2\lambda)$. On each matched edge it also requires both endpoints always to be available conditionally on the outside. Any extra edge would block one endpoint with positive probability (use the singleton independent set consisting of its other endpoint), so there can be no extra edges. This proves sharpness and the equality condition. Padding $K_2$ shows the sharp infimum for every minimum-degree threshold, even when equality in a finite graph is impossible.

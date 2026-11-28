# Routing all but a small share of maximum-cut defects

The [unbounded all-edge routing gap](MULTIFLOW-BARRIER.md) does not persist after a fixed positive share of the absolute edge mass may be dropped. In every product-weighted graph, for every maximum cut and $0<\epsilon<1/4$, it is possible to route all but $\epsilon$ of the monochromatic edge mass through crossing edges with congestion $O(\log^2(1/\epsilon))$. The constant is absolute and independent of graph order. At least $\Omega(\log(1/\epsilon))$ congestion is sometimes necessary. This does not supply the small explicit congestion needed to solve [Erdős #23](https://www.erdosproblems.com/23).

Let the vertex weights sum to one. Let $B$ be the crossing supply graph with capacities $c_{uv}=w_uw_v$, and $D$ the monochromatic demand graph with demands $d_{uv}=w_uw_v$. Write $\beta=\sum_D d_{uv}\le1/2$. Maximum-cut optimality means every cut has at least as much crossing capacity in $B$ as demand in $D$. The analogous inequality for any partition into any number of cells follows by coloring its cells independently with fair bits: an intercell pair is separated with probability one half.

## A multiscale distance estimate

Give the supply edges arbitrary nonnegative lengths $\ell$ and put $L=\sum_B c_e\ell_e$. Use the shortest-path pseudometric $\rho$ truncated at one, with distance one between disconnected parts. It satisfies $\rho(u,v)\le\ell_{uv}$ on supply edges. We prove, uniformly for all these choices,
$
\sum_{uv\in D} d_{uv}\rho(u,v)
\ \le\ \epsilon + C\log^2(1/\epsilon)L.
\tag{1}
$

Fix a distance scale $r\in(0,1]$ and a mass threshold $0<\delta<1/2$. Delete every supply edge with length greater than $r/8$. The total capacity deleted is at most $8L/r$. In the remaining supply graph, repeatedly remove vertices whose weighted degree in the current graph is less than $\delta$. The sum of capacities of short edges removed in this step is at most $\delta$, since a peeled vertex of weight $w$ consumes less than $w\delta$ at its removal and each edge is counted at most once. Consider the partition that puts each peeled vertex in a singleton and keeps the retained set as one cell. The partition form of the cut condition shows that the total demand incident with peeled vertices is at most $\delta+8L/r$.

Among retained vertices choose a maximal set of anchors with pairwise disjoint short-edge neighborhoods in the retained graph. Each such neighborhood has mass at least $\delta$, so there are at most $1/\delta$ anchors. Every retained vertex has a common short neighbor with some anchor, because otherwise it could be added. Its $\rho$-distance to that anchor is at most $2(r/8)=r/4$.

Partition all vertices by choosing a uniform random radius $R\in[r/4,r/2]$ and a uniform random order of the anchors. A vertex joins the first anchor within distance $R$, or goes into one unused-vertex cell when no anchor is near. Every retained vertex is assigned an anchor, and almost surely no anchor cell contains a pair at distance at least $r$. For any pair $x,y$, the chance of being separated is at most $(4/r)H_k \rho(x,y)$ when there are $k$ anchors and $H_k=\sum_{i=1}^k1/i$. To see this, order anchors by $a_i=\min\{\rho(x,i),\rho(y,i)\}$ and set $b_i=\max\{\rho(x,i),\rho(y,i)\}$. For radius $R$, separation requires the first anchor covering either endpoint to cover only one. A candidate $i$ has $a_i\le R<b_i$ and is first with probability at most $1/i$. Integrating over $R$ gives the bound because $b_i-a_i\le\rho(x,y)$. If there are no anchors, there are no retained pairs and we can use the same estimate with no anchor contributions.

Apply the partition inequality and take expectations. The weighted mass of retained demands at distance at least $r$ is at most the expected total supply separated by the partition, which is at most $(4/r)H_k L$. Including peeled demands gives
$
\sum_{uv\in D:\rho(u,v)\ge r}d_{uv}
\le \delta + \big(8+4 H_{\lfloor1/\delta\rfloor}\big)L/r .
\tag{2}
$
For $\delta=\epsilon/2$, integrate (2) from $\epsilon$ to one. On smaller scales the total demand is at most $\beta\le1/2$. The additive contribution is at most $\epsilon$, and the harmonic factor times the logarithmic integral is $O(\log^2(1/\epsilon))$. This proves (1).

## LP duality and limit of the congestion

In the trimmed flow LP, maximize total routed mass with path flows nonnegative, each demand capped at its required mass, and each supply capacity multiplied by $K$. The dual uses a nonnegative length $\ell_e$ on each supply edge and a nonnegative slack $y_{uv}$ per demand, with $\ell(P)+y_{uv}\ge1$ for every demand path. For fixed lengths the optimum slack is $1-\rho(u,v)$, including zero when no path exists. The dual objective is therefore $K L +\beta-\sum_D d_{uv}\rho(u,v)$. By (1) it is always at least $\beta-\epsilon$ for $K=C\log^2(1/\epsilon)$. Finite LP duality proves the claimed routing.

For a lower bound use the [expander realization](MULTIFLOW-BARRIER.md) with a rational square demand $d$ between $h/(2n)$ and $h/n$ on every pair, where $h$ is the fixed expansion. Use weight $\sqrt d$ on both terminal copies and $2\sqrt d$ on each private middle vertex. Both private legs have more capacity than the demand when $d<1$. The total unnormalized vertex mass is $\Theta(n^{3/2})$. The normalized total demand has order $n^{-2}$. Bounded degree ensures at least three quarters of the node pairs are at distance $\Omega(\log n)$ for sufficiently large $n$. After dropping at most a quarter of the normalized demand mass, at least half remains on those long pairs. The distance-capacity lower bound in the expander realization still forces congestion $\Omega(\log n)$. Taking a sequence of budgets proportional to $n^{-2}$ yields the claimed logarithmic necessity along that sequence. If desired, the host padding and light saturation there preserve the separation with rescaled budgets and a fixed gadget mass fraction. Rational blow-ups preserve the bound.

The random-permutation partition is a one-scale form of the standard metric partition method; see [Fakcharoenphol–Rao–Talwar](https://doi.org/10.1016/j.jcss.2004.04.011). The role of product capacities here is to bound the number of short-distance anchors after peeling, and the role of cut optimality is to bound both peeled demand and demand separated by the metric partition. Closing the logarithmic gap would strengthen the auxiliary routing result. Even the lower logarithmic order does not by itself give an exact deletion theorem.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

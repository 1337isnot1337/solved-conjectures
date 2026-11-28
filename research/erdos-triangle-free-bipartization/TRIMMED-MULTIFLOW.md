# Routing all but a small share of maximum-cut defects

The [unbounded all-edge routing gap](MULTIFLOW-BARRIER.md) does not persist after a fixed positive share of the absolute edge mass may be dropped. In every product-weighted graph, for every maximum cut and $0<\epsilon<1/4$, it is possible to route all but $\epsilon$ of the monochromatic edge mass through crossing edges with congestion $O(\log(1/\epsilon))$. The constant is absolute and independent of graph order. At least $\Omega(\log(1/\epsilon))$ congestion is sometimes necessary. This does not supply the small explicit congestion needed to solve [Erdős #23](https://www.erdosproblems.com/23).

Let the vertex weights sum to one. Let $B$ be the crossing supply graph with capacities $c_{uv}=w_uw_v$, and $D$ the monochromatic demand graph with demands $d_{uv}=w_uw_v$. Write $\beta=\sum_D d_{uv}\le1/2$. Maximum-cut optimality means every cut has at least as much crossing capacity in $B$ as demand in $D$. The analogous inequality for any partition into any number of cells follows by coloring its cells independently with fair bits: an intercell pair is separated with probability one half.

## One random anchor set for all scales

Give the supply edges arbitrary nonnegative lengths $\ell$ and put $L=\sum_B c_e\ell_e$. Use the shortest-path pseudometric $\rho$ truncated at one, with distance one between disconnected parts. It satisfies $\rho(u,v)\le\ell_{uv}$ on supply edges.

Set $\delta=\epsilon/4$, and sample $k=\lceil \delta^{-1}\log(4/\epsilon)\rceil$ anchors independently from the vertex probability weights. Choose a uniform random order of the sampled positions, allowing repetitions. **Use the same anchor sample for every distance scale.** For each $r\in(0,1)$, assign every vertex to the first anchor within distance $r/2$, or to one common unassigned cell if no anchor is near. Two vertices in the same assigned cell have distance at most $r$.

Fix a pair $x,y$ and condition on the sample. Order the $k$ sampled positions by $a_i=\min\{\rho(x,i),\rho(y,i)\}$, and put $b_i=\max\{\rho(x,i),\rho(y,i)\}$. The pair can be separated only if the first anchor covering either endpoint covers just one. For radius $r/2$, position $i$ is such a candidate only if $a_i\le r/2<b_i$; it is first with probability at most $1/i$, since at least $i$ positions are then eligible. Ties or repeated anchors cause no problem. Integrating over $r\in(0,1)$, the measure of candidate scales for position $i$ is at most $2(b_i-a_i)\le2\rho(x,y)$. Thus
$
\int_0^1\Pr(x,y\text{ separated at scale }r)\,dr
\le 2H_k\rho(x,y)
$
with $H_k=\sum_{i=1}^k 1/i$. The partition cut condition gives the integrated expected separated demand at most $2H_k L$, by applying the bound to supply edges. Using the same anchor sample lets this estimate charge each interval of radii only once.

## Charging unassigned endpoints

At scale $r$, call a vertex light when its $\rho$-ball of radius $r/2$ has mass less than $\delta$. The total capacity of supply edges incident with light vertices is at most $\delta+2L/r$: short edges of length at most $r/2$ incident with such a vertex use less than its vertex weight times $\delta$, and all longer edges have aggregate capacity at most $2L/r$. By the partition cut condition, the demand incident with light vertices is at most the same quantity: take each light vertex as a singleton and the rest as one cell.

Each non-light vertex is unassigned with probability at most $(1-\delta)^k\le\epsilon/4$. A demand with two non-light endpoints at distance greater than $r$ is separated whenever both are assigned. The total expected demand missed through non-light unassignment is at most $2\beta(\epsilon/4)\le\epsilon/4$. If $T(r)$ is the demand at distance greater than $r$, it follows that
$
T(r)\le \mathbb E[\text{separated demand at scale }r]+\epsilon/2+2L/r.
$
On $r<\epsilon$, simply use $T(r)\le1/2$. Integrate the displayed inequality on $[\epsilon,1]$, and apply the integrated estimate above. We get
$
\sum_{uv\in D} d_{uv}\rho(u,v)
\le \epsilon + \bigl(2H_k+2\log(1/\epsilon)\bigr)L.
\tag{1}
$
Since $k=\lceil(4/\epsilon)\log(4/\epsilon)\rceil$, the coefficient is $O(\log(1/\epsilon))$.

## LP duality and limit of the congestion

In the trimmed flow LP, maximize total routed mass with path flows nonnegative, each demand capped at its required mass, and each supply capacity multiplied by $K$. The dual uses a nonnegative length $\ell_e$ on each supply edge and a nonnegative slack $y_{uv}$ per demand, with $\ell(P)+y_{uv}\ge1$ for every demand path. For fixed lengths the optimum slack is $1-\rho(u,v)$, including zero when no path exists. The dual objective is therefore $K L +\beta-\sum_D d_{uv}\rho(u,v)$. By (1) it is always at least $\beta-\epsilon$ for $K=2H_k+2\log(1/\epsilon)$. Finite LP duality proves the claimed routing.

For a lower bound use the [expander realization](MULTIFLOW-BARRIER.md) with a rational square demand $d$ between $h/(2n)$ and $h/n$ on every pair, where $h$ is the fixed expansion. Use weight $\sqrt d$ on both terminal copies and $2\sqrt d$ on each private middle vertex. Both private legs have more capacity than the demand when $d<1$. The total unnormalized vertex mass is $\Theta(n^{3/2})$. The normalized total demand has order $n^{-2}$. Bounded degree ensures at least three quarters of the node pairs are at distance $\Omega(\log n)$ for sufficiently large $n$. After dropping at most a quarter of the normalized demand mass, at least half remains on those long pairs. The distance-capacity lower bound in the expander realization still forces congestion $\Omega(\log n)$. Bounded-degree expanders exist at every sufficiently large even order, for example by [Friedman’s random regular graph theorem](https://arxiv.org/abs/cs/0405020) and the spectral expansion bound. Given small $\epsilon$, choose an even order $n$ of size a sufficiently small constant times $\epsilon^{-1/2}$. Then $\epsilon$ covers at most a quarter of the demand, and the lower bound is $\Omega(\log(1/\epsilon))$. If desired, the host padding and light saturation there preserve the separation with rescaled budgets and a fixed gadget mass fraction. Rational blow-ups preserve the bound.

The random-permutation partition is a one-scale form of the standard metric partition method; see [Fakcharoenphol–Rao–Talwar](https://doi.org/10.1016/j.jcss.2004.04.011). The role of product capacities is to pay for the light metric balls, and the role of cut optimality is to bound both light demand and demand separated by the metric partition. The logarithmic order is sharp for the auxiliary routing problem. It does not itself give an exact deletion theorem.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).

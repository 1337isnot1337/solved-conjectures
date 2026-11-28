# Finiteness of maximizing blow-ups of bounded-codegree templates

This is a structural reduction for [Erdős Problem 23](https://www.erdosproblems.com/23). The bound on common neighbors here is a condition on the **unweighted template**, not on the graphs obtained by blowing it up. The result applies to templates of unrestricted order and to arbitrary product weights. It does not assert that a finite check has decided the problem in this family.

Let \(H\) be a finite graph in which two distinct vertices have at most \(r\) common neighbors, and allow nonnegative vertex weights of sum one. Let \(\beta_*\) be the greatest minimum monochromatic edge mass over all weight choices on \(H\). If \(\beta_*>0\), every weight vector attaining it has support size \(h\) satisfying
```math
 4h\beta_*^2\le \frac r2\left(1-\frac1h\right).
```
In particular, among blow-ups of triangle-free, four-cycle-free templates, any counterexample to the sharp deletion bound would already have a product-weighted template on at most **77** positive-weight vertices and maximum template degree at most **10**. More generally the same finiteness holds for each fixed common-neighbor bound \(r\).

## Why optimal weights force second-neighbor mass

Work on the positive support of a maximizing weight vector \(w\). If \(s\) is a cut, the derivative of its unordered monochromatic edge mass with respect to \(w_v\) is the monochromatic weighted degree \(g_s(v)\). There is one probability law on the optimal cuts for which
```math
 \mathbb E_s g_s(v)=2\beta_*=:m\qquad\text{for every supported }v.
```
Indeed, if the convex hull of the optimal cuts' gradient vectors missed the constant vectors, separation on the mean-zero tangent space would give a perturbation that strictly increases the cost of every active cut to first order. Inactive cuts have positive slack and there are finitely many cuts. This contradicts maximality. Euler's identity \(\sum_v w_v g_s(v)=2\beta_*\) fixes the constant. This is the finite form of the [vertex-weight stationarity argument](GRAPHON-EXTREMIZERS.md).

Write \(d(v)=\sum_{z\in N(v)}w_z\) and \(b(v)=\max_{z\in N(v)}w_z\). Local flip optimality gives \(g_s(v)\le d(v)/2\), and in fact \(g_s(v)\le d(v)-b(v)\). For the latter, if a neighbor weighs more than half the total then its edge must cross in every optimal cut; otherwise \(d(v)-b(v)\ge d(v)/2\). Consequently
```math
 d(v)\ge 2m,\qquad d(v)-b(v)\ge m .
```
The unordered sum of products of two different neighbor weights at \(v\) is
```math
 T(v)=\frac12\left(d(v)^2-\sum_{z\in N(v)}w_z^2\right)
 \ge \tfrac12 d(v)(d(v)-b(v))\ge m^2 .
```
Each pair appears in the neighborhood of at most \(r\) different vertices. Therefore
```math
 h m^2\le\sum_v T(v)\le r\sum_{u<v}w_u w_v
 \le \frac r2(1-1/h),
```
as claimed. For \(r=1\) and \(m\ge2/25\), this gives \(h\le77\), since \(78^2/77>625/8\).

Assume also that the template is triangle-free. Fix \(u\), and count the mass of vertices at distance two reached through each neighbor of \(u\), excluding \(u\) itself. Every intermediate \(v\in N(u)\) supplies mass \(d(v)-w_u\ge m\). No vertex in \(N(u)\) can be an endpoint by triangle-freeness, and every other endpoint is counted at most \(r\) times. It follows that
```math
 m|N(u)|\le r(1-w_u-d(u)).
```
For \(r=1\) and \(m\ge2/25\) this yields \(|N(u)|\le10\). Maximize over the original template before taking its positive support; the induced support preserves both forbidden subgraphs and need not retain all original vertices.

## A direct cut for nonconcentrated four-cycle-free templates

There is also an all-order criterion that does not require maximizing the weights. In a triangle-free, four-cycle-free template, the target bound holds whenever the greatest normalized vertex weight is at most \(29/500\).

Let \(p=2e\) be the ordered edge density. The [Balogh–Clemen–Lidický theorem](https://arxiv.org/html/2103.14179) handles \(p<1243/5000\) by independent blow-ups and continuity, leaving \(p\ge1243/5000\). Choose a root edge \(uv\) with \(d(u)+d(v)\ge2p\); such an edge exists by averaging against ordered edge mass and applying Cauchy–Schwarz. The disjoint independent neighborhoods \(N(u),N(v)\) form an induced bipartite block. The remainder has mass \(s=1-d(u)-d(v)\le1257/2500\). Each remaining vertex has at most one neighbor in each forced neighborhood, since two would give a four-cycle through the corresponding root. So the edges joining the block to the remainder have total mass at most \(2s\max_v w_v\). Optimize the cut in the remainder and orient it fairly relative to the bipartite block. Using the global \(2/47\) bound from the same theorem there gives
```math
 \beta\le 2s^2/47+s\max_v w_v
 \le \frac2{47}(1257/2500)^2+(1257/2500)(29/500)
 <1/25.
```
The proposal still open here is to handle arbitrary weights on the remaining bounded-codegree supports by a structural inequality, rather than treating finitely many graph orders as a new target.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
